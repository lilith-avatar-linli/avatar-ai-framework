local b3 = require(BTreePlugin.B3)
------------------Decorator----------------------
local decorator = b3.Class('Decorator', b3.BaseNode)
b3.Decorator = decorator

function decorator:ctor(params)
    b3.BaseNode.ctor(self, params)

    if not params then
        params = {}
    end

    self.child = params.child or nil
end

---------Repeater
local repeater = b3.Class('Repeater', b3.Decorator)
b3.Repeater = repeater

function repeater:ctor(params)
    b3.Decorator.ctor(self)

    if not params then
        params = {}
    end

    self.name = 'Repeater'
    self.title = 'Repeater <maxLoop>x'
    self.parameters = {maxLoop = -1}

    self.maxLoop = params.maxLoop or -1
end

function repeater:open(tick)
    tick.blackboard:set('i', 0, tick.tree.id, self.id)
    --print(table.dump(self.properties.maxLoop))
    self.maxLoop = self.properties.maxLoop
end

function repeater:tick(tick)
    if not self.child then
        return b3.ERROR
    end

    local i = tick.blackboard:get('i', tick.tree.id, self.id)
    local status = b3.SUCCESS

    while (self.maxLoop < 0 or i < self.maxLoop) do
        --print(i)
        local status = self.child:_execute(tick)
        if status == b3.SUCCESS or status == b3.FAILURE then
            i = i + 1
            wait()
        else
            break
        end
    end

    tick.blackboard:set('i', i, tick.tree.id, self.id)
    return status
end

---------------RepeatUntilSuccess
local repeatUntilSuccess = b3.Class('RepeatUntilSuccess', b3.Decorator)
b3.RepeatUntilSuccess = repeatUntilSuccess

function repeatUntilSuccess:ctor(params)
    b3.Decorator.ctor(self)

    if not params then
        params = {}
    end

    self.name = 'RepeatUntilSuccess'
    self.title = 'Repeat Until Success'
    self.parameters = {maxLoop = -1}

    self.maxLoop = params.maxLoop or -1
end

function repeatUntilSuccess:open(tick)
    tick.blackboard.set('i', 0, tick.tree.id, self.id)
    self.maxLoop = self.properties.maxLoop
end

function repeatUntilSuccess:tick(tick)
    if not self.child then
        return b3.ERROR
    end

    local i = tick.blackboard.get('i', tick.tree.id, self.id)
    local status = b3.ERROR

    while (self.maxLoop < 0 or i < self.maxLoop) do
        local status = self.child:_execute(tick)

        if status == b3.FAILURE then
            i = i + 1
        else
            break
        end
    end

    i = tick.blackboard.set('i', i, tick.tree.id, self.id)
    return status
end

------------------RepeatUntilFailure
local repeatUntilFailure = b3.Class('RepeatUntilFailure', b3.Decorator)
b3.RepeatUntilFailure = repeatUntilFailure

function repeatUntilFailure:ctor(params)
    b3.Decorator.ctor(self)

    if not params then
        params = {}
    end

    self.name = 'RepeatUntilFailure'
    self.title = 'Repeat Until Failure'
    self.parameters = {maxLoop = -1}

    self.maxLoop = params.maxLoop or -1
end

function repeatUntilFailure:open(tick)
    tick.blackboard.set('i', 0, tick.tree.id, self.id)
    self.maxLoop = self.properties.maxLoop
end

function repeatUntilFailure:tick(tick)
    if not self.child then
        return b3.ERROR
    end

    local i = tick.blackboard.get('i', tick.tree.id, self.id)
    local status = b3.ERROR

    while (self.maxLoop < 0 or i < self.maxLoop) do
        local status = self.child:_execute(tick)

        if status == b3.SUCCESS then
            i = i + 1
        else
            break
        end
    end

    i = tick.blackboard.set('i', i, tick.tree.id, self.id)
    return status
end

---------------------Inverter
local inverter = b3.Class('Inverter', b3.Decorator)
b3.Inverter = inverter

function inverter:ctor()
    b3.Inverter.ctor(self)

    self.name = 'Inverter'
end

function inverter:tick(tick)
    if not self.child then
        return b3.ERROR
    end

    local status = self.child:_execute(tick)

    if status == b3.SUCCESS then
        status = b3.FAILURE
    elseif status == b3.FAILURE then
        status = b3.SUCCESS
    end

    return status
end

-------------
local maxTime = b3.Class('MaxTime', b3.Decorator)
b3.MaxTime = maxTime

function maxTime:ctor(params)
    b3.MaxTime.ctor(self)

    self.name = 'MaxTime'
    self.title = 'Max <maxTime>ms'
    self.parameters = {maxTime = 0}

    if not params or not params.maxTime then
        print('maxTime parameter in MaxTime decorator is an obligatory parameter')
        return
    end

    self.maxTime = params.maxTime
end

function maxTime:open(tick)
    local startTime = Timer.GetTimeMillisecond()
    self.maxTime = self.properties.maxTime
    tick.blackboard:set('startTime', startTime, tick.tree.id, self.id)
end

function maxTime:tick(tick)
    if not self.child then
        return b3.ERROR
    end

    local currTime = Timer.GetTimeMillisecond()
    local startTime = tick.blackboard.get('startTime', tick.tree.id, self.id)

    local status = self.child:_execute(tick)
    if currTime - startTime > self.maxTime then
        return b3.FAILURE
    end

    return status
end

-------------Limiter
local limiter = b3.Class('Limiter', b3.Decorator)
b3.Limiter = limiter

function limiter:ctor()
    b3.Decorator.ctor(self)

    self.name = 'Limiter'
    self.title = 'Limit <maxLoop> Activations'
    self.parameters = {maxLoop = 1}
end

function limiter:open(tick)
    tick.blackboard.set('i', 0, tick.tree.id, self.id)
    self.maxLoop = self.properties.maxLoop
end

function limiter:tick(tick)
    if not self.child then
        return b3.ERROR
    end

    local i = tick.blackboard:get('i', tick.tree.id, self.id)

    if i < self.maxLoop then
        local status = self.child:_execute(tick)

        if status == b3.SUCCESS or status == b3.FAILURE then
            tick.blackboard:set('i', i + 1, tick.tree.id, self.id)
        end

        return status
    end

    return b3.FAILURE
end
