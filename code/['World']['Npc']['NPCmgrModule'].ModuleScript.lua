local NPCmgrModule = {}

local NPC = script.Parent

function NPCmgrModule:CanSeePlayer(b3)
	if  Vector3.Angle(NPC.Forward,localPlayer.Position-NPC.Position) < 45 then
		return b3.SUCCESS
	else 
		return b3.FAILURE
	end
end

return NPCmgrModule