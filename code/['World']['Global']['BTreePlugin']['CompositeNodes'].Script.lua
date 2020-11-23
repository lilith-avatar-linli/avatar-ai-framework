local b3 = require(BTreePlugin.B3)
--------------------Composite---------------------
local composite = b3.Class("Composite", b3.BaseNode)
b3.Composite = composite

function composite:ctor(params)
	self.children = (params and params.children) or {}
end

--Composite==========Sequence=================
local sequence = b3.Class("Sequence", b3.Composite)
b3.Sequence = sequence

function sequence:ctor()
	b3.Composite.ctor(self)

	self.name = "Sequence"
end

function sequence:tick(tick)
	for i = 1,#self.children do
		local v = self.children[i]
		local status = v:_execute(tick)
		--------print(i,v)
		if status ~= b3.SUCCESS then
			return status
		end
	end
	return b3.SUCCESS
end

--Composite==========MemSequence=================
local memSequence = b3.Class("MemSequence", b3.Composite)
b3.MemSequence = memSequence

function memSequence:ctor()
	b3.Composite.ctor(self)

	self.name = "MemSequence"
end

function memSequence:open(tick)
	tick.blackboard:set("runningChild", 1, tick.tree.id, self.id)
end

function memSequence:tick(tick)
	local child = tick.blackboard:get("runningChild", tick.tree.id, self.id)
	for i = child,#self.children do
		local v = self.children[i]
		local status = v:_execute(tick)

		if status ~= b3.SUCCESS then
			if status == b3.RUNNING then
				tick.blackboard:set("runningChild", i, tick.tree.id, self.id)
			end

			return status
		end
	end

	return b3.SUCCESS
end

--Composite==========Priority=================
local priority = b3.Class("Priority", b3.Composite)
b3.Priority = priority

function priority:ctor()
	b3.Composite.ctor(self)

	self.name = "Priority"
end

function priority:tick(tick)
	for i,v in pairs(self.children) do
		local status = v:_execute(tick)

		if status ~= b3.FAILURE then
			return status
		end
	end

	return b3.FAILURE
end

--Composite==========MemPriority=================
local memPriority = b3.Class("MemPriority", b3.Composite)
b3.MemPriority = memPriority

function memPriority:ctor()
	b3.Composite.ctor(self)

	self.name = "MemPriority"
end

function memPriority:open(tick)
	tick.blackboard:set("runningChild", 1, tick.tree.id, self.id)
end

function memPriority:tick(tick)
	local child = tick.blackboard:get("runningChild", tick.tree.id, self.id)
	for i = child,#self.children do
		local v = self.children[i]
		local status = v:_execute(tick)

		if status ~= b3.FAILURE then
			if status == b3.RUNNING then
				tick.blackboard:set("runningChild", i, tick.tree.id, self.id)
			end
			
			return status
		end
	end

	return b3.FAILURE
end
