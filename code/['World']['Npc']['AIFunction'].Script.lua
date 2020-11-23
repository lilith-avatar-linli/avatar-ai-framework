local b3 = require(BTreePlugin.B3)
local NPCmgr = require(script.Parent.NPCmgrModule)

local statusCheck = b3.Class('StatusCheck', b3.Condition)
b3.StatusCheck = statusCheck

function statusCheck:ctor()
    b3.Condition.ctor(self)
    self.name = 'StatusCheck'
end

function statusCheck:tick(tick)
    print(self.title)
    if (self.title == 'CanSeePlayer') then
        return NPCmgr:CanSeePlayer(b3)
    end
    return b3.SUCCESS
end

local heroAction = b3.Class('HeroAction', b3.Action)
b3.HeroAction = heroAction

function heroAction:ctor()
    b3.Action.ctor(self)
    self.name = 'HeroAction'
end

function heroAction:tick(tick)
    print(self.title)
    return b3.SUCCESS
end
