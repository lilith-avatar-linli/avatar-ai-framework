local b3 = require(BTreePlugin.B3)

-------------Action---------------------
local action = b3.Class("Action", b3.BaseNode)
b3.Action = action

function action:ctor()
	b3.BaseNode.ctor(self)

	self.category = b3.ACTION
end

--Action=========Runner==========
local runner = b3.Class("Runner", b3.Action)
b3.Runner = runner

function runner:ctor()
	b3.Action.ctor(self)

	self.name = "Runner"
end

function runner:tick(tick)
	--print(self.title)
	--print(table.dump(self.properties))
	return b3.RUNNING
end

--Action========Error======
local error = b3.Class("Error", b3.Action)
b3.Error = error

function error:ctor()
	b3.Action.ctor(self)
	
	self.name = "Error"
end

function error:tick()
	return b3.ERROR
end

--Action========Failer======
local failer = b3.Class("Failer", b3.Action)
b3.Failer = failer

function failer:ctor()
	b3.Action.ctor(self)
	
	self.name = "Failer"
end

function failer:tick()
	return b3.FAILURE
end

--action=======Succeeder=====
local succeeder = b3.Class("Succeeder", b3.Action)
b3.Succeeder = succeeder

function succeeder:ctor()
	b3.Action.ctor(self)

	self.name = "Succeeder"
end

function succeeder:tick(tick)
	return b3.SUCCESS
end

--action=======Wait=====
local mwait = b3.Class("Wait", b3.Action)
b3.Wait = mwait

function mwait:ctor()
	b3.Action.ctor(self)

	self.name = "Wait"
end

function mwait:open(tick)
	local startTime = Timer.GetTimeMillisecond()
	self.endTime = self.properties.milliseconds
	tick.blackboard:set("startTime",startTime, tick.tree.id, self.id)
end

function mwait:tick(tick)
	local currTime = Timer.GetTimeMillisecond()
	local startTime = tick.blackboard:get("startTime", tick.tree.id, self.id)
	
	if not startTime or startTime == 0 then
		startTime = currTime
		tick.blackboard:set("startTime", currTime, tick.tree.id, self.id)
	end
	
	--print(self.endTime)
	if currTime - startTime > self.endTime then
		return b3.SUCCESS
	end

	return b3.RUNNING
end
