local ConditionNode = {}

function ConditionNode:Init()
    ----------------------Condition-------------------
    local condition = B3.Class('Condition', B3.BaseNode)
    B3.Condition = condition

    function condition:ctor(params)
        B3.BaseNode.ctor(self, params)
    end
end

return ConditionNode
