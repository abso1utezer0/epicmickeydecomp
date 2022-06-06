local L0_0, L1_1
function L0_0(A0_2, A1_3)
  local L2_4, L3_5, L4_6, L5_7
  L2_4 = 4
  L3_5 = 0.9
  L4_6 = 0
  L5_7 = tonumber
  L5_7 = L5_7(A1_3)
  if L5_7 == 1 then
    L4_6 = -1
  else
    L4_6 = 1
  end
  L5_7 = vector4
  L5_7 = L5_7(L4_6, 0, 0)
  SetFacing(A0_2, L5_7)
  DisableMotion_Player(A0_2)
  RestrictCutSceneInput()
  AnimEvent(A0_2, EVENT_Special_0)
  wait(L2_4)
  AnimEvent(A0_2, EVENT_Special_1)
  wait(L3_5)
  EnableMotion_Player(A0_2)
  UnrestrictCutSceneInput()
end
MirrorEnterProjector = L0_0
function L0_0(A0_8, A1_9, A2_10)
  RestrictCutSceneInput()
  if A2_10 == "1" then
    Disable("LeftRTrig")
  elseif A2_10 == "2" then
    Disable("LeftLTrig")
  elseif A2_10 == "3" then
    Disable("RightRTrig")
  elseif A2_10 == "4" then
    Disable("RightLTrig")
  end
  StartFadeOut(0.5)
  wait(0.5)
  TeleportToEntity(GetPlayer(), A0_8)
  wait(0)
  CameraReset()
  wait(0.01)
  if A1_9 == "left" then
    SetCameraAttributes("mj_2dmirror.Marker(CameraOverride) 02")
  end
  if A1_9 == "mid" then
    SetCameraAttributes("mj_2dmirror.Marker(CameraOverride) 03")
  end
  if A1_9 == "right" then
    SetCameraAttributes("mj_2dmirror.Marker(CameraOverride) 01")
  end
  wait(0.8)
  StartFadeIn(0.5)
  Wait(0.5)
  UnrestrictCutSceneInput()
end
TeleportMirror = L0_0
function L0_0()
  SetGroundPlaneActive(false)
end
TM_DisableGroundPlane = L0_0
function L0_0()
  SetGroundPlaneActive(true)
end
TM_EnableGroundPlane = L0_0
