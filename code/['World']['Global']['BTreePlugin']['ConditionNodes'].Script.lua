local b3 = require(BTreePlugin.B3)

----------------------Condition-------------------
local condition = b3.Class("Condition", b3.BaseNode)
b3.Condition = condition

function condition:ctor(params)
	b3.BaseNode.ctor(self, params)
end