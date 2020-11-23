local b3 = require(BTreePlugin.B3)

local testr = b3.Class('Test', b3.Action)
b3.Test = testr

function testr:ctor()
    b3.Action.ctor(self)

    self.name = 'Test'
end

function testr:tick(tick)
    print(self.title)
    --print(type(self.properties.mVal))
    if (self.properties.mVal == 'true') then
        return b3.SUCCESS
    else
        return b3.RUNNING
    end
end
