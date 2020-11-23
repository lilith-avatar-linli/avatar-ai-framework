local NpcMgr = require(script.Parent.NpcMgrModule)
local NpcAiFunc = {}

function NpcAiFunc:Init()
    local statusCheck = B3.Class('StatusCheck', B3.Condition)
    B3.StatusCheck = statusCheck

    function statusCheck:ctor()
        B3.Condition.ctor(self)
        self.name = 'StatusCheck'
    end

    function statusCheck:tick(tick)
        print(self.title)
        if (self.title == 'CanSeePlayer') then
            return NpcMgr:CanSeePlayer(B3)
        end
        return B3.SUCCESS
    end

    local heroAction = B3.Class('HeroAction', B3.Action)
    B3.HeroAction = heroAction

    function heroAction:ctor()
        B3.Action.ctor(self)
        self.name = 'HeroAction'
    end

    function heroAction:tick(tick)
        print(self.title)
        return B3.SUCCESS
    end
end

return NpcAiFunc
