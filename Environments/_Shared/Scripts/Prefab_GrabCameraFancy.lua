local L0_0, L1_1
function L0_0(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7
  L1_3 = GetPrefabData
  L2_4 = A0_2
  L1_3 = L1_3(L2_4)
  L2_4 = L1_3.shotOrder
  if L2_4 ~= "first" then
    L2_4 = L1_3.shotOrder
  elseif L2_4 == "only" then
    L2_4 = RestrictCutSceneInput
    L2_4()
  end
  L2_4 = L1_3.pauseAllAI
  if L2_4 == "true" then
    L2_4 = PauseAllAI
    L2_4()
  end
  L2_4 = GetRelativePrefabEntity
  L3_5 = A0_2
  L4_6 = ".CameraTrigger"
  L2_4 = L2_4(L3_5, L4_6)
  if L2_4 == nil then
  else
    L3_5 = L1_3.disable
    if L3_5 == 1 then
      L3_5 = Disable
      L4_6 = L2_4
      L3_5(L4_6)
    end
  end
  L3_5 = nil
  L4_6 = L1_3.cameraLookAt
  if L4_6 ~= 1 then
    L4_6 = L1_3.alwaysLookAt
  elseif L4_6 == "true" then
    L4_6 = GetRelativePrefabEntity
    L5_7 = A0_2
    L4_6 = L4_6(L5_7, ".CameraLookAt")
    L3_5 = L4_6
  end
  L4_6 = GetRelativePrefabEntity
  L5_7 = A0_2
  L4_6 = L4_6(L5_7, ".CameraStart")
  L5_7 = GetRelativePrefabEntity
  L5_7 = L5_7(A0_2, ".CameraEnd")
  if L1_3.ReverseCameras == "true" then
    L4_6 = GetRelativePrefabEntity(A0_2, ".CameraEnd")
    L5_7 = GetRelativePrefabEntity(A0_2, ".CameraStart")
  end
  if L1_3.barkEntity == "" then
    GrabCameraFancy(A0_2, L4_6, L5_7, L3_5)
  else
    FireThread(GrabCameraFancy, A0_2, L4_6, L5_7, L3_5)
    wait(L1_3.fadeInTime * 2 + 0.5)
    FireSequence(L1_3.barkEntity, L1_3.barkSequence)
  end
end
Prefab_GrabCameraFancy = L0_0
function L0_0(A0_8, A1_9, A2_10, A3_11)
  local L4_12, L5_13, L6_14, L7_15, L8_16
  L4_12 = GetPrefabData
  L5_13 = A0_8
  L4_12 = L4_12(L5_13)
  L5_13 = L4_12.transitionTime
  L6_14 = L4_12.fadeInTime
  L7_15 = L4_12.fadeOutTime
  L8_16 = L4_12.SaveCam
  if L8_16 == "true" then
    L8_16 = SaveCurrentCameraOverride
    L8_16()
  end
  if L6_14 > 0 then
    L8_16 = StartFadeOut
    L8_16(L6_14)
    L8_16 = wait
    L8_16(L6_14)
  else
    L8_16 = HideHud
    L8_16()
  end
  L8_16 = L4_12.shotOrder
  if L8_16 ~= "last" then
    L8_16 = L4_12.shotOrder
    if L8_16 == "only" then
    else
      L8_16 = L4_12.EndFunction
      if L8_16 == "None" then
      else
        L8_16 = FireThread
        L8_16(_G[L4_12.EndFunction])
      end
    end
  end
  L8_16 = L4_12.disable
  if L8_16 == "AudioOn" then
  else
    L8_16 = AudioPostEventOn
    L8_16(GetPlayer(), "Mute_Mickey")
  end
  L8_16 = nil
  if L4_12.alwaysLookAt == "true" then
    L8_16 = A3_11
  end
  GrabCamera(A1_9, L8_16, CAMERA_LERP_TRANSITION, 0)
  SetLetterbox(1)
  if L6_14 > 0 then
    wait(0.2)
    StartFadeInNoHUD()
  end
  if 0 < L4_12.waitStart then
    wait(L4_12.waitStart)
  end
  GrabCamera(A2_10, A3_11, CAMERA_LERP_TRANSITION, L5_13)
  wait(L5_13 - L6_14)
  if 0 < L4_12.waitEnd then
    wait(L4_12.waitEnd)
  end
  if L4_12.StopCameraSequence == "false" then
    FireUser2(GetRelativePrefabEntity(A0_8, ".CameraLookAt"))
  end
  if L4_12.shotOrder == "last" or L4_12.shotOrder == "only" then
    if L7_15 > 0 then
      StartFadeOut(L7_15)
    end
    wait(L7_15)
    SetLetterbox(0)
    SetCharacterInConversation(GetPlayer(), 0)
    Prefab_FancyCamRelease(A0_8)
    if L7_15 > 0 and L4_12.NoHud == "false" then
      StartFadeIn()
    elseif L7_15 > 0 and L4_12.NoHud == "true" then
      StartFadeInNoHUD()
    else
      ShowHud()
    end
    if L4_12.EndFunction == "None" then
    else
      FireThread(_G[L4_12.EndFunction])
    end
    UnrestrictCutSceneInput()
  end
  if L4_12.pauseAllAI == "true" then
    UnpauseAllAI()
  end
  AudioPostEventOn(GetPlayer(), "Unmute_Mickey")
end
GrabCameraFancy = L0_0
function L0_0(A0_17)
  if GetPrefabData(A0_17).fadeOutTime > 0 then
    StartFadeOut(GetPrefabData(A0_17).fadeOutTime)
    wait(GetPrefabData(A0_17).fadeOutTime)
  else
    HideHud()
  end
  if GetPrefabData(A0_17).ReturnHUDonUser4Fade == "false" then
    if GetPrefabData(A0_17).shotOrder == "mid_norelease" then
      wait(0.2)
    end
    StartFadeInNoHUD()
  elseif GetPrefabData(A0_17).ReturnHUDonUser4Fade == "true" then
    Prefab_FancyCamRelease(A0_17)
    SetCharacterInConversation(GetPlayer(), 0)
    StartFadeIn()
    ShowHud()
    SetLetterbox(0)
  end
  UnpauseAllAI()
end
Prefab_GrabCameraFancyOnlyFade = L0_0
function L0_0(A0_18)
  StartFadeOut(GetPrefabData(A0_18).fadeOutTime)
  wait(GetPrefabData(A0_18).fadeOutTime)
  ReleaseCamera(CAMERA_EASING_TRANSITION, 0)
  Prefab_FancyCamRelease(A0_18)
  SetLetterbox(0)
  SetCharacterInConversation(GetPlayer(), 0)
  StartFadeIn()
  ShowHud()
  UnpauseAllAI()
  UnrestrictCutSceneInput()
end
Prefab_GrabCameraFancy_FadeRelease = L0_0
function L0_0(A0_19)
  CameraReset()
  if GetPrefabData(A0_19).SaveCam == "true" then
    LoadSavedCameraOverride()
  elseif FlythroughProjector == "" then
    Print("************************************* - FlythroughProjector == nothing")
  else
    Print("************************************* - FlythroughProjector == something")
    SetCameraAttributes(FlythroughProjector)
    FlythroughProjector = ""
  end
end
Prefab_FancyCamRelease = L0_0
L0_0 = ""
FlythroughProjector = L0_0
function L0_0(A0_20)
  Print("************************************* - Prefab_FlythroughProjector Started")
  FlythroughProjector = GetRelativePrefabEntity(A0_20, ".CameraSettings")
  Print("************************************* - Prefab_FlythroughProjector Finished")
end
Prefab_FlythroughProjector = L0_0
function L0_0(A0_21)
  Print("************************************* - Prefab_FlythroughProjector_Reset")
  FlythroughProjector = ""
end
Prefab_FlythroughProjector_Reset = L0_0
