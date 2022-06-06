-- Fully reworked

-- setup movie files (+ check if demo mode is enabled)
function PreStartScreenAction(var1)
  local invar1, invar2
  StartFadeOut(0)
  invar1 = "fmv_logos_all.bik:-1:fmv_attract.bik:2:StartScreen:0"
  invar2 = ""
  if GetConfigVariableBool("DemoMode") == true then
    invar2 = "ESRB-for-E3.bik" .. ":-1:" .. invar1
  elseif GetWasQuitGame() == true then
    invar2 = "StartScreen:0"
  elseif GetWasEndGame() == true then
    invar2 = "EndGame:0"
  else
    invar2 = invar1
  end
  StartSequence(var1, invar2, true, true)
end