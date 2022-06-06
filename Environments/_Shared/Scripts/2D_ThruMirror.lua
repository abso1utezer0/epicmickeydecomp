-- Fully reworked

function MirrorEnterProjector(num1, num2)
  local tTMNum1, tTMNum2, tTMNum3, tTMVar1
  tTMNum1 = 4
  tTMNum2 = 0.9
  tTMNum3 = 0
  tTMVar1 = tonumber
  tTMVar1 = tTMVar1(num2)
  if tTMVar1 == 1 then
    tTMNum3 = -1
  else
    tTMNum3 = 1
  end
  tTMVar1 = vector4
  tTMVar1 = tTMVar1(tTMNum3, 0, 0)
  SetFacing(num1, tTMVar1)
  DisableMotion_Player(num1)
  RestrictCutSceneInput()
  AnimEvent(num1, EVENT_Special_0)
  wait(tTMNum1)
  AnimEvent(num1, EVENT_Special_1)
  wait(tTMNum2)
  EnableMotion_Player(num1)
  UnrestrictCutSceneInput()
end

function TeleportMirror(varEntity, varDirection, varTrigNum)
  RestrictCutSceneInput()
  if varTrigNum == "1" then
    Disable("LeftRTrig")
  elseif varTrigNum == "2" then
    Disable("LeftLTrig")
  elseif varTrigNum == "3" then
    Disable("RightRTrig")
  elseif varTrigNum == "4" then
    Disable("RightLTrig")
  end
  StartFadeOut(0.5)
  wait(0.5)
  TeleportToEntity(GetPlayer(), varEntity)
  wait(0)
  CameraReset()
  wait(0.01)
  if varDirection == "left" then
    SetCameraAttributes("mj_2dmirror.Marker(CameraOverride) 02")
  end
  if varDirection == "mid" then
    SetCameraAttributes("mj_2dmirror.Marker(CameraOverride) 03")
  end
  if varDirection == "right" then
    SetCameraAttributes("mj_2dmirror.Marker(CameraOverride) 01")
  end
  wait(0.8)
  StartFadeIn(0.5)
  Wait(0.5)
  UnrestrictCutSceneInput()
end

function TM_DisableGroundPlane()
  SetGroundPlaneActive(false)
end

function TM_EnableGroundPlane()
  SetGroundPlaneActive(true)
end