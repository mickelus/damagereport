dmgrprtsv = "UIErrorsFrame"
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")
local damage, time 
function f.PLAYER_REGEN_DISABLED()
damage=GetStatistic(197)
time=GetTime()
end
function f.PLAYER_REGEN_ENABLED()
time=GetTime()-time
_G[dmgrprtsv]:AddMessage(((GetStatistic(197)-damage)>0) and ((GetStatistic(197)-damage).." damage dealt at "..(floor((GetStatistic(197)-damage)/time)).." dps"))
_G[dmgrprtsv]:AddMessage("Combat lasted: "..((floor(time/60)>0) and (floor(time/60).."m "..(floor(time)%60).."s") or (floor(time).."s")))
end
f:SetScript("OnEvent", function(self, event, ...)

	self[event]()

end)
