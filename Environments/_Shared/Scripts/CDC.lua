local L0_0, L1_1
L0_0 = 0
CAMERA_INSTANT_TRANSITION = L0_0
L0_0 = 1
CAMERA_LERP_TRANSITION = L0_0
L0_0 = 2
CAMERA_SAMEPLACE_TRANSITION = L0_0
L0_0 = 3
CAMERA_EASING_TRANSITION = L0_0
function L0_0(A0_2, A1_3)
  RestrictCutSceneInput()
  GrabCamera(A0_2, A1_3, CAMERA_LERP_TRANSITION, 0.5)
  Enable(A0_2)
  Enable(A1_3)
end
StartCDC = L0_0
function L0_0(A0_4, A1_5)
  wait(3)
  GrabCamera(A0_4, A1_5, CAMERA_INSTANT_TRANSITION, 0.5)
  Enable(A0_4)
  wait(1)
  AnimEvent(A1_5, EVENT_Start_Jump)
  wait(2)
  EndCDC()
end
GrabCam2 = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
end
EndCDC = L0_0
