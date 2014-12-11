dmgrprtsv = "UIErrorsFrame"
local f = CreateFrame("Frame")
local damageString = "%d damage dealt at %d dps"
local timeMinString = "Combat lasted: %dm %ds"
local timeSecString = "Combat lasted: %ds"
local damage, time

f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")

function f.PLAYER_REGEN_DISABLED()
    damage=GetStatistic(197)
    time=GetTime()
end
function f.PLAYER_REGEN_ENABLED()
    time=GetTime()-time
    if damage then
        damage = GetStatistic(197)-damage
    else
        damage = GetStatistic(197)
    end

    if damage > 0 then
        _G[dmgrprtsv]:AddMessage(damageString:format(damage, damage/time))
    end

    if time > 60 then
        _G[dmgrprtsv]:AddMessage(timeMinString:format(time/60, time%60))
    else
        _G[dmgrprtsv]:AddMessage(timeSecString:format(time))
    end
end
f:SetScript("OnEvent", function(self, event, ...)
    self[event]()
end)
