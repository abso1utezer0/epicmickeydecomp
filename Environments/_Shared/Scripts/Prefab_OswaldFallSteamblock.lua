local L0_0, L1_1
function L0_0(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7)
  if GetPropertyBool(A1_3, "Is Painted") == false and GetPropertyBool(A2_4, "Is Painted") == false then
    DestroyEntity(A0_2)
    Reverse(A3_5)
    wait(0.5)
    DestroyEntity(A4_6)
    DestroyEntity(A5_7)
  end
end
OswaldEarsCheck = L0_0
function L0_0(A0_8, A1_9, A2_10, A3_11, A4_12)
  if GetPropertyBool(A3_11, "Is Painted") == true or GetPropertyBool(A4_12, "Is Painted") == true then
    Hide(A1_9)
    Disable(A2_10)
    wait(2)
    Unhide(A1_9)
    Enable(A2_10)
    FireUser2(A0_8)
  end
end
OswaldEarsSteamTime = L0_0
