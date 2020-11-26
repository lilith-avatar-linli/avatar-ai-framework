local NPCmgrModule = {}
local NPC = script.Parent

function NPCmgrModule:Run(behaviorJson)
	print('------------------------------------------------')
	local behaviorTree = B3.BehaviorTree.new()
	local blackBoard = B3.Blackboard.new()
	behaviorTree:load(behaviorJson, {})
	print('------------------------------------------------')
	
	while (true) do
		wait()
		behaviorTree:tick(NPCmgrModule, blackBoard)
	end
end

function NPCmgrModule:StatusCheck(B3,_node)
	--print(_node.title)
    if (_node.title == 'CanSeePlayer') then
        return self:CanSeePlayer(B3,_node)
    end
    --return B3.SUCCESS
end

function NPCmgrModule:HeroAction(B3,_node)
	print(NPC.Name..'看到了你')
	return B3.SUCCESS
end

function NPCmgrModule:CanSeePlayer(B3,_node)
    if Vector3.Angle(NPC.Forward, localPlayer.Position - NPC.Position) < _node.properties.range/2 then
        return B3.SUCCESS
    else
        return B3.FAILURE
    end
end

return NPCmgrModule
