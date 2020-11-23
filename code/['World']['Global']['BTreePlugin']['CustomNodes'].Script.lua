local testr = B3.Class('Test', B3.Action)
B3.Test = testr

function testr:ctor()
    B3.Action.ctor(self)

    self.name = 'Test'
end

function testr:tick(tick)
    print(self.title)
    --print(type(self.properties.mVal))
    if (self.properties.mVal == 'true') then
        return B3.SUCCESS
    else
        return B3.RUNNING
    end
end
