function autoAssign()
    local container = world:FindTeams()
    local min = 1
    local teamTojoin = {}
    for i = 1, #container, 1 do
        if container[i].CurrentMaxMemberNum > 0 then
            temp = container[i].CurrentMemberNum / (container[i].CurrentMaxMemberNum)
            if (temp < min and temp ~= 1) then
                teamTojoin = {}
                min = temp
                table.insert(teamTojoin, container[i])
            elseif temp == min and temp ~= 1 then
                table.insert(teamTojoin, container[i])
            end
        end
    end
    local a = 1
    if #teamTojoin > 0 then
        a = math.random(1, #teamTojoin)
        return teamTojoin[a]
    else
        return nil
    end
end
