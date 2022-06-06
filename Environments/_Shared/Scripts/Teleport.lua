local L0_0, L1_1
function L0_0(A0_2)
  RestrictCutSceneInput()
  StartFadeOut(0.5)
  Wait(1)
  TeleportToEntity(GetPlayer(), A0_2)
  StartFadeIn(3)
  Wait(1)
  UnrestrictCutSceneInput()
end
Teleport = L0_0
function L0_0()
  RestrictCutSceneInput()
  StartFadeOut(1)
  Wait(1)
  StartFadeIn(1)
  Wait(1)
  UnrestrictCutSceneInput()
end
Fade = L0_0
function L0_0()
  RestrictCutSceneInput()
  StartFadeOut(1)
  Wait(2)
  StartFadeInNoHUD(1)
  Wait(1)
  UnrestrictCutSceneInput()
end
PlayMovieAdvanced = L0_0
function L0_0(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8, L6_9
  L1_4 = 1
  L2_5 = 5
  L3_6 = 0.05
  L4_7 = 4
  L5_8 = 0.025
  L6_9 = 0.025
  ShakeCamera(L1_4, L2_5, L3_6, L4_7, L5_8, L6_9)
end
ShakeCamera_Virtuos = L0_0
function L0_0(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16
  L1_11 = 5
  L2_12 = 5
  L3_13 = 0.05
  L4_14 = 4
  L5_15 = 0.025
  L6_16 = 0.025
  ShakeCamera(L1_11, L2_12, L3_13, L4_14, L5_15, L6_16)
end
ShakeCamera_Rock = L0_0
