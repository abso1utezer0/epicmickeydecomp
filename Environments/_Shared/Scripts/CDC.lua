-- Fully reworked

CAMERA_INSTANT_TRANSITION = 0
CAMERA_LERP_TRANSITION = 1
CAMERA_SAMEPLACE_TRANSITION = 2
CAMERA_EASING_TRANSITION = 3

function StartCDC(param1, param2)
  RestrictCutSceneInput()
  GrabCamera(param1, param2, CAMERA_LERP_TRANSITION, 0.5)
  Enable(param1)
  Enable(param2)
end

function GrabCam2(param1, param2)
  wait(3)
  GrabCamera(param1, param2, CAMERA_INSTANT_TRANSITION, 0.5)
  Enable(param1)
  wait(1)
  AnimEvent(param2, EVENT_Start_Jump)
  wait(2)
  EndCDC()
end

function EndCDC()
  UnrestrictCutSceneInput()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
end