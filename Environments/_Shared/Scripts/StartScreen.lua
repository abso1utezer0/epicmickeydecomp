local L1_0
function L1_0(A0_1)
  local L1_2, L2_3
  L1_2 = StartFadeOut
  L2_3 = 0
  L1_2(L2_3)
  L1_2 = "fmv_logos_all.bik:-1:fmv_attract.bik:2:StartScreen:0"
  L2_3 = ""
  if GetConfigVariableBool("DemoMode") == true then
    L2_3 = "ESRB-for-E3.bik" .. ":-1:" .. L1_2
  elseif GetWasQuitGame() == true then
    L2_3 = "StartScreen:0"
  elseif GetWasEndGame() == true then
    L2_3 = "EndGame:0"
  else
    L2_3 = L1_2
  end
  StartSequence(A0_1, L2_3, true, true)
end
PreStartScreenAction = L1_0
