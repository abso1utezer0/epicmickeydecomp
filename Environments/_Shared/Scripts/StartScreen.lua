-- Fully reworked

-- setup movie files (+ check if demo mode is enabled)
function PreStartScreenAction(param1)
  local var1, var2
  StartFadeOut(0)
  var1 = "fmv_logos_all.bik:-1:fmv_attract.bik:2:StartScreen:0"
  var2 = ""
  if GetConfigVariableBool("DemoMode") == true then
    var2 = "ESRB-for-E3.bik" .. ":-1:" .. var1
  elseif GetWasQuitGame() == true then
    var2 = "StartScreen:0"
  elseif GetWasEndGame() == true then
    var2 = "EndGame:0"
  else
    var2 = var1
  end
  StartSequence(param1, var2, true, true)
end