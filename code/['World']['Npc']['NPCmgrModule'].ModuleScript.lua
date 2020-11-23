local NpcMgr = {}

local NPC = script.Parent

function NpcMgr:CanSeePlayer(B3)
    if Vector3.Angle(NPC.Forward, localPlayer.Position - NPC.Position) < 45 then
        return B3.SUCCESS
    else
        return B3.FAILURE
    end
end

return NpcMgr
