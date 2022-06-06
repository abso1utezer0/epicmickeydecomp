local L1_0
function L1_0(A0_1, A1_2, A2_3)
  if A1_2 == "1" then
    Enable(A0_1)
    wait(A2_3)
    Disable(A0_1)
  elseif A1_2 == "2" then
    AnimGBReset(A0_1)
    AnimGBSetIdle(A0_1, "False")
    wait(A2_3)
    AnimGBSetIdle(A0_1, "True")
  end
end
TossAcross_Spin = L1_0
