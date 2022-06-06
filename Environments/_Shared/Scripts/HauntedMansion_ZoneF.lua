local L0_0, L1_1
L0_0 = 0
HM_StretchCamGo = L0_0
L0_0 = 0
HM_StretchIntro = L0_0
L0_0 = 0
HM_DisableStretchCam = L0_0
L0_0 = 1
HM_TumblerOn = L0_0
function L0_0()
  SetMap(GetPlayer(), "MAP_HM_ZONEF", "GAME")
  HM_Stretch_CamDefault()
  StartTrackingCurrentLevelForScoring("StretchingRoom")
  HM_StretchCameraIntro()
end
HM_IntoStretchingRoom = L0_0
function L0_0()
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
end
HM_Stretch_CamDefault = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "HM_StretchLoadCheckpoint", "hauntedmansion_zonef.ZoneFSavePositionMarker 01")
end
HM_ZoneF_SaveCheckpoint = L0_0
function L0_0()
  HM_Stretch_CamDefault()
  StartTrackingCurrentLevelForScoring("StretchingRoom")
  SetGlobal("HM_StretchGremState", 0)
  if GetGlobal("HM_StretchingRoomState") == 0 then
    SetGlobal("HM_StretchKeyEnabled", 1)
    SetGlobal("HM_Tumbler01Solved", 0)
    SetGlobal("HM_Tumbler02Solved", 0)
    SetGlobal("HM_Tumbler03Solved", 0)
    SetGlobal("HM_StretchIntroTrigger", 1)
    SetGlobal("HM_StretchGear01", 0)
    SetGlobal("HM_StretchGear02", 0)
    SetGlobal("HM_StretchPlatPos", 3)
    HM_StretchCamGo = 1
    SetGlobal("Stretch_FirstTumbler", 0)
    SetSplineFollowerInitialSpeed("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01", 20)
    wait(0.1)
    Unhide("hauntedmansion_zonef.NOS_HM_ZoneF_Inert06 01")
    Unhide("hauntedmansion_zonef.NOS_HM_ZoneF_Inert05 01")
    SplineFollower_StopAtPosition("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01", "hauntedmansion_zonef.SplineKnot 01", "hauntedmansion_zonef.SplineKnot 03", 1)
    wait(0.5)
    SetSplineFollowerInitialSpeed("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01", 2)
    Enable("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_ZoneF_Door01 01", "Close")
    AudioPostEventOn("hauntedmansion_zonef_audio.Sound_Door_01", "Play_sfx_HM_Strtch_Doors_Close")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_ZoneF_Door02 01", "Close")
    AudioPostEventOn("hauntedmansion_zonef_audio.Sound_Door_02", "Play_sfx_HM_Strtch_Doors_Close")
    HM_TumblerOn = 0
    HM_StretchIntro = 1
    ForEachEntityInGroup(AI_SetDisabled, "FoyerSpatter1", false)
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler1", "Turn2")
    SetGlobal("HM_Column1Tumbler1", 2)
    Wait(0.2)
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler2", "Turn1")
    SetGlobal("HM_Column1Tumbler2", 1)
    Wait(0.2)
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler3", "Turn3")
    SetGlobal("HM_Column1Tumbler3", 0)
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler1", "Turn1")
    SetGlobal("HM_Column2Tumbler1", 1)
    Wait(0.2)
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler2", "Turn3")
    SetGlobal("HM_Column2Tumbler2", 0)
    Wait(0.2)
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler3", "Turn1")
    SetGlobal("HM_Column2Tumbler3", 1)
    Wait(0.2)
    SetGlobal("HM_Column3Tumbler1", 0)
    Wait(0.2)
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler2", "Turn1")
    SetGlobal("HM_Column3Tumbler2", 1)
    Wait(0.2)
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler3", "Turn3")
    SetGlobal("HM_Column3Tumbler3", 0)
  elseif GetGlobal("HM_StretchingRoomState") == 2 then
    DisableGuardianHint("hauntedmansion_zonef_dynamic.PlayerHintMarkersGearMechanism")
    DisableGuardianHint("hauntedmansion_zonef_dynamic.PlayerHintMarkersPainting01")
    DisableGuardianHint("hauntedmansion_zonef_dynamic.PlayerHintMarkersPainting02")
    DisableGuardianHint("hauntedmansion_zonef_dynamic.PlayerHintMarkersPainting03")
    SetGlobal("HM_Column1Tumbler1", 0)
    SetGlobal("HM_Column1Tumbler2", 0)
    SetGlobal("HM_Column1Tumbler3", 0)
    SetGlobal("HM_Column2Tumbler1", 0)
    SetGlobal("HM_Column2Tumbler2", 0)
    SetGlobal("HM_Column2Tumbler3", 0)
    SetGlobal("HM_Column3Tumbler1", 0)
    SetGlobal("HM_Column3Tumbler2", 0)
    SetGlobal("HM_Column3Tumbler3", 0)
    SetGlobal("HM_StretchGear01", 1)
    SetGlobal("HM_StretchGear02", 1)
    SetGlobal("HM_StretchKeyEnabled", 1)
    SetGlobal("HM_Tumbler01Solved", 1)
    SetGlobal("HM_Tumbler02Solved", 1)
    SetGlobal("HM_Tumbler03Solved", 1)
    SetGlobal("HM_StretchIntroTrigger", 1)
    SetGlobal("HM_StretchGear01", 1)
    SetGlobal("HM_StretchGear02", 1)
    ForcePainted("hauntedmansion_zonef.NOS_HM_StretchGearsA2 02")
    ForcePainted("hauntedmansion_zonef.NOS_HM_StretchGearsA3 02")
    SplineFollower_StopAtPosition("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01", "hauntedmansion_zonef.SplineKnot 01", "hauntedmansion_zonef.SplineKnot 03", 0)
    SetGlobal("HM_StretchPlatPos", 1)
    HM_StretchCamGo = 1
    Enable("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01")
    AudioPostEventOn("hauntedmansion_zonef_audio.Sound_Door_02", "Play_sfx_HM_Strtch_Doors_Close")
    HM_TumblerOn = 0
    HM_StretchIntro = 1
    wait(0.1)
    HM_StretchExit_Open()
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_ZoneF_Door02 01", "Close")
    Unhide("hauntedmansion_zonef.NOS_HM_ZoneF_Inert06 01")
  end
end
HM_StretchLoadCheckpoint = L0_0
L0_0 = 0
HM_UnhookTumblerCamera = L0_0
function L0_0()
  if HM_InColumn == 0 then
    RestrictCutSceneInput()
    HM_UnhookTumblerCamera = 1
  end
  TimerEnable("hauntedmansion_zonef_static.TumblerCameraReleaseTimer 01")
  wait(0.1)
  TimerReset("hauntedmansion_zonef_static.TumblerCameraReleaseTimer 01")
end
HM_TumblerHit = L0_0
function L0_0()
  if HM_UnhookTumblerCamera == 1 then
    UnrestrictCutSceneInput()
    ReleaseCamera(CAMERA_LERP_TRANSITION, 1)
    HM_UnhookTumblerCamera = 0
  else
    ClearAllCameraAttributesSD("hauntedmansion_zonef.TumblerInteriorCameraHint")
  end
  HM_TumblerOn = 0
end
HM_LeaveColumn = L0_0
function L0_0()
  if GetGlobal("HM_StretchingRoomState") == 1 then
    PauseAllAI(GetPlayer())
    SetGlobal("HM_StretchingRoomState", 2)
    ForcePainted("hauntedmansion_zonef.NOS_HM_StretchGearsA2 02")
    ForcePainted("hauntedmansion_zonef.NOS_HM_StretchGearsA3 02")
    wait(0.2)
    if GetGlobal("HM_StretchPlatPos") == 3 then
      FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_Exit01")
      HM_StretchCam01On()
      HM_StretchExitFromBottom()
      wait(10)
      GrabCamera("hauntedmansion_zonef.CameraControlPoint 05", "StretchExitPortal", CAMERA_LERP_TRANSITION, 0.8)
      PauseAllAI(GetPlayer())
      HM_StretchExit_Open()
      wait(5)
      FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_Exit03")
    elseif GetGlobal("HM_StretchPlatPos") == 2 then
      FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_Exit01")
      HM_StretchCam01On()
      HM_StretchExitFromMiddle()
      wait(6)
      GrabCamera("hauntedmansion_zonef.CameraControlPoint 05", "StretchExitPortal", CAMERA_LERP_TRANSITION, 0.8)
      PauseAllAI(GetPlayer())
      HM_StretchExit_Open()
      wait(5)
      FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_Exit03")
    elseif GetGlobal("HM_StretchPlatPos") == 1 then
      HM_StretchExitSkip = 0
      RestrictCutSceneInput()
      wait(0.5)
      GrabCamera("hauntedmansion_zonef.CameraControlPoint 05", "StretchExitPortal", CAMERA_LERP_TRANSITION, 0.8)
      HM_StretchExit_Open()
      wait(5)
      FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_Exit03")
    end
    BreakGearHelp = 0
  end
end
HM_StretchExit = L0_0
L0_0 = 1
HM_StretchExitSkip = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.7)
  UnrestrictCutSceneInput()
  UnpauseAllAI(GetPlayer())
end
HM_StretchExitFinished = L0_0
function L0_0()
  Hide("hauntedmansion_zonef.NOS_HM_ZoneF_Inert05 01")
  AnimGBSequence("hauntedmansion_zonef.NOS_HM_ZoneF_Door01 01", "Open")
  AudioPostEventOn("hauntedmansion_zonef_audio.Sound_Door_01", "Play_sfx_HM_Strtch_Doors_Open")
  AudioPostEventOn(GetPlayer(), "Play_sfx_HM_Strtch_Doors_Open")
end
HM_StretchExit_Open = L0_0
function L0_0()
  AnimGBSequence("hauntedmansion_zonef.NOS_HM_ZoneF_Door01 01", "Close")
  AudioPostEventOn("hauntedmansion_zonef_audio.Sound_Door_01", "Play_sfx_HM_Strtch_Doors_Open")
  wait(0.7)
  Unhide("hauntedmansion_zonef.NOS_HM_ZoneF_Inert05 01")
end
HM_StretchExit_Close = L0_0
function L0_0()
  SetGlobal("HM_StretchKeyEnabled", 0)
  AudioPostEventOn("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Play_sfx_HM_StrtchRm_FloorSeq_TwoFloor")
  AudioPostEventOn(GetPlayer(), "Play_sfx_HM_Strtch_Room_Stretch_2")
  AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA3 02", "Bottom_Top")
  AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA2 02", "Bottom_Top")
  AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Bottom_Top")
  SplineFollower_StopAtPosition("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01", "hauntedmansion_zonef.SplineKnot 01", "hauntedmansion_zonef.SplineKnot 03", 0)
  SetGlobal("HM_StretchPlatPos", 1)
  SetGlobal("HM_StretchKeyEnabled", 1)
end
HM_StretchExitFromBottom = L0_0
function L0_0()
  SetGlobal("HM_StretchKeyEnabled", 0)
  AudioPostEventOn("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Play_sfx_HM_StrtchRm_FloorSeq_OneFloor")
  AudioPostEventOn(GetPlayer(), "Play_sfx_HM_Strtch_Room_Stretch")
  AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA3 02", "Middle_Top")
  AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA2 02", "Middle_Top")
  AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Middle_Top")
  SplineFollower_StopAtPosition("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01", "hauntedmansion_zonef.SplineKnot 01", "hauntedmansion_zonef.SplineKnot 03", 0)
  SetGlobal("HM_StretchPlatPos", 1)
  SetGlobal("HM_StretchKeyEnabled", 1)
end
HM_StretchExitFromMiddle = L0_0
function L0_0()
  if GetGlobal("HM_Stretch_FirstTumbler") == 0 then
    ForceSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_PaintingsSpin")
    SetGlobal("HM_Stretch_FirstTumbler", 1)
  end
end
HM_StretchFirstTumblerTry = L0_0
function L0_0()
  if HM_TumblerOn == 0 then
    HM_TumblerHit()
    HM_TumblerOn = 1
    HM_StretchFirstTumblerTry()
    if HM_InColumn == 0 then
      GrabCamera("hauntedmansion_zonef.Painting01Camera", nil, CAMERA_LERP_TRANSITION, 0)
    end
    FireThread(HM_Column1Tumb1)
    wait(0.2)
    FireThread(HM_Column1Tumb2)
    wait(0.2)
    FireThread(HM_Column1Tumb3)
    wait(0.1)
    HM_Tumbler01Check()
  end
end
HM_StretchColumn1Tumb1 = L0_0
function L0_0()
  if HM_InColumn == 1 then
    SetCameraAttributes("hauntedmansion_zonef.TumblerInteriorCameraHint")
  end
end
HM_TumblerInteriorCam = L0_0
function L0_0()
  if HM_InColumn == 1 then
    GrabCamera("hauntedmansion_zonef_static.NOS_HM_ZoneF_C1T1Cam", GetPlayer(), CAMERA_LERP_TRANSITION, 0)
  end
end
HM_Col1Tumb1Cam = L0_0
function L0_0()
  if HM_InColumn == 1 then
    GrabCamera("hauntedmansion_zonef_static.NOS_HM_ZoneF_C1T2Cam", GetPlayer(), CAMERA_LERP_TRANSITION, 0)
  end
end
HM_Col1Tumb2Cam = L0_0
function L0_0()
  if HM_InColumn == 1 then
    GrabCamera("hauntedmansion_zonef_static.NOS_HM_ZoneF_C1T3Cam", GetPlayer(), CAMERA_LERP_TRANSITION, 0)
  end
end
HM_Col1Tumb3Cam = L0_0
function L0_0()
  SetPropertyEntity("hauntedmansion_zonef_static.TumblerDustSpawner 01", "Spawn Destinations", "hauntedmansion_zonef_static.Column1_1PositionMarker 01", 0)
  ForceSpawn("hauntedmansion_zonef_static.TumblerDustSpawner 01", 1)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C1_G1_GV_GearA2_Inert", 60)
  if GetGlobal("HM_Column1Tumbler1") == 3 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler1", "Turn3")
    SetGlobal("HM_Column1Tumbler1", 1)
  elseif GetGlobal("HM_Column1Tumbler1") == 2 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler1", "Turn3")
    SetGlobal("HM_Column1Tumbler1", 0)
  elseif GetGlobal("HM_Column1Tumbler1") == 1 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler1", "Turn2")
    SetGlobal("HM_Column1Tumbler1", 2)
  elseif GetGlobal("HM_Column1Tumbler1") == 0 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler1", "Turn1")
    SetGlobal("HM_Column1Tumbler1", 1)
  end
  wait(2)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C1_G1_GV_GearA2_Inert", 0)
end
HM_Column1Tumb1 = L0_0
function L0_0()
  if HM_TumblerOn == 0 then
    HM_TumblerHit()
    HM_TumblerOn = 1
    HM_StretchFirstTumblerTry()
    if HM_InColumn == 0 then
      GrabCamera("hauntedmansion_zonef.Painting01Camera", nil, CAMERA_LERP_TRANSITION, 0)
    end
    FireThread(HM_Column1Tumb2)
    wait(0.2)
    FireThread(HM_Column1Tumb3)
    wait(0.1)
    HM_Tumbler01Check()
  end
end
HM_StretchColumn1Tumb2 = L0_0
function L0_0()
  SetPropertyEntity("hauntedmansion_zonef_static.TumblerDustSpawner 01", "Spawn Destinations", "hauntedmansion_zonef_static.Column1_2PositionMarker 01", 0)
  ForceSpawn("hauntedmansion_zonef_static.TumblerDustSpawner 01", 1)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C1_G2_GV_GearA2_Inert", 60)
  if GetGlobal("HM_Column1Tumbler2") == 3 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler2", "Turn3")
    SetGlobal("HM_Column1Tumbler2", 1)
  elseif GetGlobal("HM_Column1Tumbler2") == 2 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler2", "Turn3")
    SetGlobal("HM_Column1Tumbler2", 0)
  elseif GetGlobal("HM_Column1Tumbler2") == 1 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler2", "Turn2")
    SetGlobal("HM_Column1Tumbler2", 2)
  elseif GetGlobal("HM_Column1Tumbler2") == 0 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler2", "Turn1")
    SetGlobal("HM_Column1Tumbler2", 1)
  end
  wait(2)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C1_G2_GV_GearA2_Inert", 0)
end
HM_Column1Tumb2 = L0_0
function L0_0()
  if HM_TumblerOn == 0 then
    HM_TumblerHit()
    HM_TumblerOn = 1
    if HM_InColumn == 0 then
      GrabCamera("hauntedmansion_zonef.Painting01Camera", nil, CAMERA_LERP_TRANSITION, 0)
    end
    FireThread(HM_Column1Tumb3)
    wait(0.1)
    HM_Tumbler01Check()
  end
end
HM_StretchColumn1Tumb3 = L0_0
function L0_0()
  SetPropertyEntity("hauntedmansion_zonef_static.TumblerDustSpawner 01", "Spawn Destinations", "hauntedmansion_zonef_static.Column1_3PositionMarker 01", 0)
  ForceSpawn("hauntedmansion_zonef_static.TumblerDustSpawner 01", 1)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C1_G3_GV_GearA2_Inert", 60)
  if GetGlobal("HM_Column1Tumbler3") == 3 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler3", "Turn3")
    SetGlobal("HM_Column1Tumbler3", 1)
  elseif GetGlobal("HM_Column1Tumbler3") == 2 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler3", "Turn3")
    SetGlobal("HM_Column1Tumbler3", 0)
  elseif GetGlobal("HM_Column1Tumbler3") == 1 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler3", "Turn2")
    SetGlobal("HM_Column1Tumbler3", 2)
  elseif GetGlobal("HM_Column1Tumbler3") == 0 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler3", "Turn1")
    SetGlobal("HM_Column1Tumbler3", 1)
  end
  wait(2)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C1_G3_GV_GearA2_Inert", 0)
end
HM_Column1Tumb3 = L0_0
function L0_0()
  if HM_TumblerOn == 0 then
    HM_TumblerHit()
    HM_TumblerOn = 1
    HM_StretchFirstTumblerTry()
    if HM_InColumn == 0 then
      GrabCamera("hauntedmansion_zonef.Painting02Camera", nil, CAMERA_LERP_TRANSITION, 0)
    end
    FireThread(HM_Column2Tumb1)
    wait(0.2)
    FireThread(HM_Column2Tumb2)
    wait(0.2)
    FireThread(HM_Column2Tumb3)
    HM_Tumbler02Check()
  end
end
HM_StretchColumn2Tumb1 = L0_0
function L0_0()
  if HM_InColumn == 1 then
    GrabCamera("hauntedmansion_zonef_static.NOS_HM_ZoneF_C2T1Cam", GetPlayer(), CAMERA_LERP_TRANSITION, 0)
  end
end
HM_Col2Tumb1Cam = L0_0
function L0_0()
  if HM_InColumn == 1 then
    GrabCamera("hauntedmansion_zonef_static.NOS_HM_ZoneF_C2T2Cam", GetPlayer(), CAMERA_LERP_TRANSITION, 0)
  end
end
HM_Col2Tumb2Cam = L0_0
function L0_0()
  if HM_InColumn == 1 then
    GrabCamera("hauntedmansion_zonef_static.NOS_HM_ZoneF_C2T3Cam", GetPlayer(), CAMERA_LERP_TRANSITION, 0)
  end
end
HM_Col2Tumb3Cam = L0_0
function L0_0()
  SetPropertyEntity("hauntedmansion_zonef_static.TumblerDustSpawner 01", "Spawn Destinations", "hauntedmansion_zonef_static.Column2_1PositionMarker 01", 0)
  ForceSpawn("hauntedmansion_zonef_static.TumblerDustSpawner 01", 1)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C2_G1_GV_GearA2_Inert", 60)
  if GetGlobal("HM_Column2Tumbler1") == 3 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler1", "Turn3")
    SetGlobal("HM_Column2Tumbler1", 1)
  elseif GetGlobal("HM_Column2Tumbler1") == 2 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler1", "Turn3")
    SetGlobal("HM_Column2Tumbler1", 0)
  elseif GetGlobal("HM_Column2Tumbler1") == 1 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler1", "Turn2")
    SetGlobal("HM_Column2Tumbler1", 2)
  elseif GetGlobal("HM_Column2Tumbler1") == 0 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler1", "Turn1")
    SetGlobal("HM_Column2Tumbler1", 1)
  end
  wait(2)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C2_G1_GV_GearA2_Inert", 0)
end
HM_Column2Tumb1 = L0_0
function L0_0()
  if HM_TumblerOn == 0 then
    HM_TumblerHit()
    HM_TumblerOn = 1
    HM_StretchFirstTumblerTry()
    if HM_InColumn == 0 then
      GrabCamera("hauntedmansion_zonef.Painting02Camera", nil, CAMERA_LERP_TRANSITION, 0)
    end
    FireThread(HM_Column2Tumb2)
    wait(0.2)
    FireThread(HM_Column2Tumb3)
    wait(0.1)
    HM_Tumbler02Check()
  end
end
HM_StretchColumn2Tumb2 = L0_0
function L0_0()
  SetPropertyEntity("hauntedmansion_zonef_static.TumblerDustSpawner 01", "Spawn Destinations", "hauntedmansion_zonef_static.Column2_2PositionMarker 01", 0)
  ForceSpawn("hauntedmansion_zonef_static.TumblerDustSpawner 01", 1)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C2_G2_GV_GearA2_Inert", 60)
  if GetGlobal("HM_Column2Tumbler2") == 3 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler2", "Turn3")
    SetGlobal("HM_Column2Tumbler2", 1)
  elseif GetGlobal("HM_Column2Tumbler2") == 2 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler2", "Turn3")
    SetGlobal("HM_Column2Tumbler2", 0)
  elseif GetGlobal("HM_Column2Tumbler2") == 1 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler2", "Turn2")
    SetGlobal("HM_Column2Tumbler2", 2)
  elseif GetGlobal("HM_Column2Tumbler2") == 0 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler2", "Turn1")
    SetGlobal("HM_Column2Tumbler2", 1)
  end
  wait(2)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C2_G2_GV_GearA2_Inert", 0)
end
HM_Column2Tumb2 = L0_0
function L0_0()
  if HM_TumblerOn == 0 then
    HM_TumblerHit()
    HM_TumblerOn = 1
    if HM_InColumn == 0 then
      GrabCamera("hauntedmansion_zonef.Painting02Camera", nil, CAMERA_LERP_TRANSITION, 0)
    end
    FireThread(HM_Column2Tumb3)
    wait(0.1)
    HM_Tumbler02Check()
  end
end
HM_StretchColumn2Tumb3 = L0_0
function L0_0()
  SetPropertyEntity("hauntedmansion_zonef_static.TumblerDustSpawner 01", "Spawn Destinations", "hauntedmansion_zonef_static.Column2_3PositionMarker 01", 0)
  ForceSpawn("hauntedmansion_zonef_static.TumblerDustSpawner 01", 1)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C2_G3_GV_GearA2_Inert", 60)
  if GetGlobal("HM_Column2Tumbler3") == 3 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler3", "Turn3")
    SetGlobal("HM_Column2Tumbler3", 1)
  elseif GetGlobal("HM_Column2Tumbler3") == 2 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler3", "Turn3")
    SetGlobal("HM_Column2Tumbler3", 0)
  elseif GetGlobal("HM_Column2Tumbler3") == 1 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler3", "Turn2")
    SetGlobal("HM_Column2Tumbler3", 2)
  elseif GetGlobal("HM_Column2Tumbler3") == 0 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler3", "Turn1")
    SetGlobal("HM_Column2Tumbler3", 1)
  end
  wait(2)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C2_G3_GV_GearA2_Inert", 0)
end
HM_Column2Tumb3 = L0_0
function L0_0()
  if HM_TumblerOn == 0 then
    HM_TumblerHit()
    HM_TumblerOn = 1
    HM_StretchFirstTumblerTry()
    if HM_InColumn == 0 then
      GrabCamera("hauntedmansion_zonef.Painting03Camera", nil, CAMERA_LERP_TRANSITION, 0)
    end
    FireThread(HM_Column3Tumb1)
    wait(0.2)
    FireThread(HM_Column3Tumb2)
    wait(0.2)
    FireThread(HM_Column3Tumb3)
    wait(0.1)
    HM_Tumbler03Check()
  end
end
HM_StretchColumn3Tumb1 = L0_0
function L0_0()
  if HM_InColumn == 1 then
    GrabCamera("hauntedmansion_zonef_static.NOS_HM_ZoneF_C3T1Cam", GetPlayer(), CAMERA_LERP_TRANSITION, 0)
  end
end
HM_Col3Tumb1Cam = L0_0
function L0_0()
  if HM_InColumn == 1 then
    GrabCamera("hauntedmansion_zonef_static.NOS_HM_ZoneF_C3T2Cam", GetPlayer(), CAMERA_LERP_TRANSITION, 0)
  end
end
HM_Col3Tumb2Cam = L0_0
function L0_0()
  if HM_InColumn == 1 then
    GrabCamera("hauntedmansion_zonef_static.NOS_HM_ZoneF_C3T3Cam", GetPlayer(), CAMERA_LERP_TRANSITION, 0)
  end
end
HM_Col3Tumb3Cam = L0_0
function L0_0()
  SetPropertyEntity("hauntedmansion_zonef_static.TumblerDustSpawner 01", "Spawn Destinations", "hauntedmansion_zonef_static.Column3_1PositionMarker 01", 0)
  ForceSpawn("hauntedmansion_zonef_static.TumblerDustSpawner 01", 1)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C3_G1_GV_GearA2_Inert", 60)
  if GetGlobal("HM_Column3Tumbler1") == 3 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler1", "Turn3")
    SetGlobal("HM_Column3Tumbler1", 1)
  elseif GetGlobal("HM_Column3Tumbler1") == 2 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler1", "Turn3")
    SetGlobal("HM_Column3Tumbler1", 0)
  elseif GetGlobal("HM_Column3Tumbler1") == 1 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler1", "Turn2")
    SetGlobal("HM_Column3Tumbler1", 2)
  elseif GetGlobal("HM_Column3Tumbler1") == 0 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler1", "Turn1")
    SetGlobal("HM_Column3Tumbler1", 1)
  end
  wait(2)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C3_G1_GV_GearA2_Inert", 0)
end
HM_Column3Tumb1 = L0_0
function L0_0()
  if HM_TumblerOn == 0 then
    HM_TumblerHit()
    HM_TumblerOn = 1
    HM_StretchFirstTumblerTry()
    if HM_InColumn == 0 then
      GrabCamera("hauntedmansion_zonef.Painting03Camera", nil, CAMERA_LERP_TRANSITION, 0)
    end
    FireThread(HM_Column3Tumb2)
    wait(0.2)
    FireThread(HM_Column3Tumb3)
    wait(0.1)
    HM_Tumbler03Check()
  end
end
HM_StretchColumn3Tumb2 = L0_0
function L0_0()
  SetPropertyEntity("hauntedmansion_zonef_static.TumblerDustSpawner 01", "Spawn Destinations", "hauntedmansion_zonef_static.Column3_2PositionMarker 01", 0)
  ForceSpawn("hauntedmansion_zonef_static.TumblerDustSpawner 01", 1)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C3_G2_GV_GearA2_Inert", 60)
  if GetGlobal("HM_Column3Tumbler2") == 3 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler2", "Turn3")
    AnimGBReset("hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler2")
    SetGlobal("HM_Column3Tumbler2", 1)
  elseif GetGlobal("HM_Column3Tumbler2") == 2 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler2", "Turn3")
    SetGlobal("HM_Column3Tumbler2", 0)
  elseif GetGlobal("HM_Column3Tumbler2") == 1 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler2", "Turn2")
    SetGlobal("HM_Column3Tumbler2", 2)
  elseif GetGlobal("HM_Column3Tumbler2") == 0 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler2", "Turn1")
    SetGlobal("HM_Column3Tumbler2", 1)
  end
  wait(2)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C3_G2_GV_GearA2_Inert", 0)
end
HM_Column3Tumb2 = L0_0
function L0_0()
  if HM_TumblerOn == 0 then
    HM_TumblerHit()
    HM_TumblerOn = 1
    if HM_InColumn == 0 then
      GrabCamera("hauntedmansion_zonef.Painting03Camera", nil, CAMERA_LERP_TRANSITION, 0)
    end
    FireThread(HM_Column3Tumb3)
    wait(0.1)
    HM_Tumbler03Check()
  end
end
HM_StretchColumn3Tumb3 = L0_0
function L0_0()
  SetPropertyEntity("hauntedmansion_zonef_static.TumblerDustSpawner 01", "Spawn Destinations", "hauntedmansion_zonef_static.Column3_3PositionMarker 01", 0)
  ForceSpawn("hauntedmansion_zonef_static.TumblerDustSpawner 01", 1)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C3_G3_GV_GearA2_Inert", 60)
  if GetGlobal("HM_Column3Tumbler3") == 3 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler3", "Turn3")
    SetGlobal("HM_Column3Tumbler3", 1)
  elseif GetGlobal("HM_Column3Tumbler3") == 2 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler3", "Turn3")
    SetGlobal("HM_Column3Tumbler3", 0)
  elseif GetGlobal("HM_Column3Tumbler3") == 1 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler3", "Turn2")
    SetGlobal("HM_Column3Tumbler3", 2)
  elseif GetGlobal("HM_Column3Tumbler3") == 0 then
    ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler3", "Turn1")
    SetGlobal("HM_Column3Tumbler3", 1)
  end
  wait(2)
  SetRotatorMaxSpeed("hauntedmansion_zonef_dynamic.C3_G3_GV_GearA2_Inert", 0)
end
HM_Column3Tumb3 = L0_0
L0_0 = 0
HM_PaintingsSetCount = L0_0
function L0_0()
  if GetGlobal("HM_StretchingRoomState") < 2 then
    if GetGlobal("HM_Column3Tumbler1") == 0 and GetGlobal("HM_Column3Tumbler2") == 0 and GetGlobal("HM_Column3Tumbler3") == 0 and HM_Painting03_On == 1 then
      SetGlobal("HM_Tumbler03Solved", 1)
      DisableGuardianHint("hauntedmansion_zonef_dynamic.PlayerHintMarkersPainting03")
      HM_PaintingsSetCount = HM_PaintingsSetCount + 1
      HM_TumblersExitCheck()
    elseif GetGlobal("HM_Tumbler03Solved") == 1 then
      SetGlobal("HM_Tumbler03Solved", 0)
      HM_PaintingsSetCount = HM_PaintingsSetCount - 1
      FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_PaintingReset")
    end
  end
end
HM_Tumbler03Check = L0_0
function L0_0()
  if GetGlobal("HM_StretchingRoomState") < 2 then
    if GetGlobal("HM_Column2Tumbler3") == 0 and GetGlobal("HM_Column2Tumbler2") == 0 and GetGlobal("HM_Column2Tumbler1") == 0 and HM_Painting02_On == 1 then
      SetGlobal("HM_Tumbler02Solved", 1)
      DisableGuardianHint("hauntedmansion_zonef_dynamic.PlayerHintMarkersPainting02")
      HM_PaintingsSetCount = HM_PaintingsSetCount + 1
      HM_TumblersExitCheck()
    elseif GetGlobal("HM_Tumbler02Solved") == 1 then
      SetGlobal("HM_Tumbler02Solved", 0)
      HM_PaintingsSetCount = HM_PaintingsSetCount - 1
      FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_PaintingReset")
    end
  end
end
HM_Tumbler02Check = L0_0
function L0_0()
  if GetGlobal("HM_StretchingRoomState") < 2 then
    if GetGlobal("HM_Column1Tumbler3") == 0 and GetGlobal("HM_Column1Tumbler2") == 0 and GetGlobal("HM_Column1Tumbler1") == 0 and HM_Painting01_On == 1 then
      SetGlobal("HM_Tumbler01Solved", 1)
      DisableGuardianHint("hauntedmansion_zonef_dynamic.PlayerHintMarkersPainting01")
      HM_PaintingsSetCount = HM_PaintingsSetCount + 1
      HM_TumblersExitCheck()
    elseif GetGlobal("HM_Tumbler01Solved") == 1 then
      SetGlobal("HM_Tumbler01Solved", 0)
      HM_PaintingsSetCount = HM_PaintingsSetCount - 1
      FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_PaintingReset")
    end
  end
end
HM_Tumbler01Check = L0_0
L0_0 = 1
HM_Painting01_On = L0_0
L0_0 = 1
HM_Painting02_On = L0_0
L0_0 = 1
HM_Painting03_On = L0_0
L0_0 = 0
HM_PaintedTimer = L0_0
function L0_0()
  HM_Painting01_On = 1
  HM_PaintedTimer = 1
  HM_Tumbler01Check()
end
HM_Tumbler01Painted = L0_0
function L0_0()
  HM_Painting01_On = 0
  HM_Tumbler01Check()
end
HM_Tumbler01Thinned = L0_0
function L0_0()
  HM_Painting02_On = 1
  HM_PaintedTimer = 1
  HM_Tumbler02Check()
end
HM_Tumbler02Painted = L0_0
function L0_0()
  HM_Painting02_On = 0
  HM_Tumbler02Check()
end
HM_Tumbler02Thinned = L0_0
function L0_0()
  HM_Painting03_On = 1
  HM_PaintedTimer = 1
  HM_Tumbler03Check()
end
HM_Tumbler03Painted = L0_0
function L0_0()
  HM_Painting03_On = 0
  HM_Tumbler03Check()
end
HM_Tumbler03Thinned = L0_0
function L0_0()
  SetGlobal("HM_Tumbler01Solved", 1)
  SetGlobal("HM_Tumbler02Solved", 1)
  SetGlobal("HM_Tumbler03Solved", 1)
  HM_TumblerOn = 0
  HM_PaintedTimer = 1
  HM_PaintingsSetCount = 3
end
HM_GremlinExitCheck = L0_0
function L0_0()
  if HM_PaintingsSetCount == 1 then
    if HM_PaintedTimer == 0 then
      wait(1.5)
    end
    FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_Painting01Set")
  elseif HM_PaintingsSetCount == 2 then
    if HM_PaintedTimer == 0 then
      wait(1.5)
    end
    FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_Painting02Set")
  elseif GetGlobal("HM_Tumbler03Solved") == 1 and GetGlobal("HM_Tumbler02Solved") == 1 and GetGlobal("HM_Tumbler01Solved") == 1 then
    if HM_PaintedTimer == 0 then
      wait(1.5)
    end
    FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_ReadyOut")
  end
  HM_PaintedTimer = 0
end
HM_TumblersExitCheck = L0_0
L0_0 = 0
BreakGearHelp = L0_0
function L0_0()
  if GetGlobal("HM_StretchingRoomState") == 0 then
    SetGlobal("HM_StretchingRoomState", 1)
    BreakGearHelp = 1
  end
end
HM_SetPaintingReadyState = L0_0
function L0_0()
  if GetGlobal("HM_StretchingRoomState") == 1 then
    SetGlobal("HM_StretchingRoomState", 0)
    BreakGearHelp = 0
  end
end
HM_BreakPaintingReadyState = L0_0
L0_0 = 0
HM_InColumn = L0_0
function L0_0()
  local L1_2
  L1_2 = 1
  HM_InColumn = L1_2
end
HM_InsideColumn = L0_0
function L0_0()
  local L1_3
  L1_3 = 0
  HM_InColumn = L1_3
end
HM_OutsideColumn = L0_0
function L0_0()
  ForEachEntityInGroup(ForcePainted, "MainPaintings")
  if GetGlobal("HM_Column1Tumbler1") == 2 then
    HM_Column1Tumb1()
    wait(0.1)
  elseif GetGlobal("HM_Column1Tumbler1") == 1 then
    HM_Column1Tumb1()
    wait(0.1)
    HM_Column1Tumb1()
    wait(0.1)
  end
  if GetGlobal("HM_Column1Tumbler2") == 2 then
    HM_Column1Tumb2()
    wait(0.1)
  elseif GetGlobal("HM_Column1Tumbler2") == 1 then
    HM_Column1Tumb2()
    wait(0.1)
    HM_Column1Tumb2()
    wait(0.1)
  end
  if GetGlobal("HM_Column1Tumbler3") == 2 then
    HM_Column1Tumb3()
    wait(0.1)
  elseif GetGlobal("HM_Column1Tumbler3") == 1 then
    HM_Column1Tumb3()
    wait(0.1)
    HM_Column1Tumb3()
    wait(0.1)
  end
end
HM_SolvePainting01 = L0_0
function L0_0()
  if GetGlobal("HM_Column2Tumbler1") == 2 then
    HM_Column2Tumb1()
    wait(0.1)
  elseif GetGlobal("HM_Column2Tumbler1") == 1 then
    HM_Column2Tumb1()
    wait(0.1)
    HM_Column2Tumb1()
    wait(0.1)
  end
  if GetGlobal("HM_Column2Tumbler2") == 2 then
    HM_Column2Tumb2()
    wait(0.1)
  elseif GetGlobal("HM_Column2Tumbler2") == 1 then
    HM_Column2Tumb2()
    wait(0.1)
    HM_Column2Tumb2()
    wait(0.1)
  end
  if GetGlobal("HM_Column2Tumbler3") == 2 then
    HM_Column2Tumb3()
    wait(0.1)
  elseif GetGlobal("HM_Column2Tumbler3") == 1 then
    HM_Column2Tumb3()
    wait(0.1)
    HM_Column2Tumb3()
    wait(0.1)
  end
end
HM_SolvePainting02 = L0_0
function L0_0()
  SetGlobal("HM_StretchRoomCamTrip", 1)
  if GetGlobal("HM_Column3Tumbler1") == 2 then
    HM_Column3Tumb1()
    wait(0.1)
  elseif GetGlobal("HM_Column3Tumbler1") == 1 then
    HM_Column3Tumb1()
    wait(0.1)
    HM_Column3Tumb1()
    wait(0.1)
  end
  if GetGlobal("HM_Column3Tumbler2") == 2 then
    HM_Column3Tumb2()
    wait(0.1)
  elseif GetGlobal("HM_Column3Tumbler2") == 1 then
    HM_Column3Tumb2()
    wait(0.1)
    HM_Column3Tumb2()
    wait(0.1)
  end
  if GetGlobal("HM_Column3Tumbler3") == 2 then
    HM_Column3Tumb3()
    wait(0.1)
  elseif GetGlobal("HM_Column3Tumbler3") == 1 then
    HM_Column3Tumb3()
    wait(0.1)
    HM_Column3Tumb3()
    wait(0.1)
  end
end
HM_SolvePainting03 = L0_0
function L0_0()
  SetGlobal("HM_StretchPlatPos", 1)
end
HM_StretchSetPlatPos01 = L0_0
function L0_0()
  SetGlobal("HM_StretchPlatPos", 2)
end
HM_StretchSetPlatPos02 = L0_0
function L0_0()
  SetGlobal("HM_StretchPlatPos", 3)
end
HM_StretchSetPlatPos03 = L0_0
function L0_0()
  PauseAllAI(GetPlayer())
  if GetGlobal("HM_StretchPlatPos") == 1 then
    HM_StretchPlatMove01()
  elseif GetGlobal("HM_StretchPlatPos") == 2 then
    HM_StretchPlatMove02()
  elseif GetGlobal("HM_StretchPlatPos") == 3 then
    HM_StretchPlatMove03()
  end
end
HM_StretchPlatMaster = L0_0
function L0_0()
  local L0_4, L1_5
  L0_4 = 0
  HM_StretchCamGo = L0_4
  L0_4 = 1
  HM_DisableStretchCam = L0_4
end
HM_DisableStretchCamera = L0_0
function L0_0()
  local L0_6, L1_7
  L0_6 = 1
  HM_StretchCamGo = L0_6
  L0_6 = 0
  HM_DisableStretchCam = L0_6
end
HM_EnableStretchCam = L0_0
function L0_0()
  if HM_StretchCamGo == 1 then
    GrabCamera("hauntedmansion_zonef.StretchCam 01", "hauntedmansion_zonef.StretchCameraMotorMarker", CAMERA_LERP_TRANSITION, 0)
    RestrictCutSceneInput()
  end
end
HM_StretchCam01On = L0_0
function L0_0()
  if HM_StretchCamGo == 1 then
    GrabCamera("hauntedmansion_zonef.StretchCam 02", "hauntedmansion_zonef.StretchCameraMotorMarker", CAMERA_LERP_TRANSITION, 0)
    RestrictCutSceneInput()
  end
end
HM_StretchCam02On = L0_0
function L0_0()
  if HM_StretchIntro == 1 and HM_DisableStretchCam == 0 then
    if StretchCamResetCam == 0 then
      ReleaseCamera(CAMERA_LERP_TRANSITION, 1)
    elseif StretchCamResetCam == 2 then
      SetCameraAttributes("hauntedmansion_zonef_static.HiddenRoomCamMarker(CameraOverride) 02")
    elseif StretchCamResetCam == 3 then
      SetCameraAttributes("hauntedmansion_zonef_static.HiddenRoomCamMarker(CameraOverride) 03")
    elseif StretchCamResetCam == 4 then
      SetCameraAttributes("hauntedmansion_zonef_static.HiddenRoomCamMarker(CameraOverride) 04")
    end
    UnpauseAllAI(GetPlayer())
    UnrestrictCutSceneInput()
  end
end
HM_StretchCamOff = L0_0
function L0_0()
  local L1_8
  L1_8 = 0
  HM_StretchCamGo = L1_8
end
HM_BreakStretchCam = L0_0
function L0_0()
  local L1_9
  L1_9 = 1
  HM_StretchCamGo = L1_9
end
HM_FixStretchCam = L0_0
L0_0 = 0
HM_RetryBark = L0_0
function L0_0()
  if HM_RetryBark == 0 and HM_ResetButtonUsed == 0 and BreakGearHelp == 0 then
    HM_RetryBark = 1
    FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_MainGear_Retry")
  elseif HM_ResetButtonUsed == 1 then
    HM_ResetButtonUsed = 0
  end
end
HM_MainGear_RetryFix = L0_0
function L0_0()
  UnpauseAllAI(GetPlayer())
  HM_RetryBark = 0
end
HM_MainGear_RetryGo = L0_0
function L0_0()
  if GetGlobal("HM_StretchGear01") == 1 and GetGlobal("HM_StretchGear02") == 1 then
    HM_MainGear_RetryFix()
  elseif GetGlobal("HM_StretchGear01") == 1 or GetGlobal("HM_StretchGear02") == 1 then
    SetGlobal("HM_StretchKeyEnabled", 0)
    if GetGlobal("HM_StretchingRoomState") == 2 then
      FireThread(HM_StretchExit_Close)
    end
    AudioPostEventOn("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Play_sfx_HM_StrtchRm_FloorSeq_OneFloor")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA3 02", "Top_Middle")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA2 02", "Top_Middle")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Top_Middle")
    Wait(0.25)
    SplineFollower_StopAtPosition("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01", "hauntedmansion_zonef.SplineKnot 01", "hauntedmansion_zonef.SplineKnot 03", 0.5)
    HM_StretchCam02On()
    wait(4.5)
    SetGlobal("HM_StretchPlatPos", 2)
    HM_StretchCamOff()
    wait(2.5)
    SetGlobal("HM_StretchKeyEnabled", 1)
  else
    SetGlobal("HM_StretchKeyEnabled", 0)
    if GetGlobal("HM_StretchingRoomState") == 2 then
      FireThread(HM_StretchExit_Close)
    end
    AudioPostEventOn("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Play_sfx_HM_StrtchRm_FloorSeq_TwoFloor")
    AudioPostEventOn(GetPlayer(), "Play_sfx_HM_Strtch_Room_Stretch_2")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA3 02", "Top_Bottom")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA2 02", "Top_Bottom")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Top_Bottom")
    Wait(0.25)
    SplineFollower_StopAtPosition("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01", "hauntedmansion_zonef.SplineKnot 01", "hauntedmansion_zonef.SplineKnot 03", 1)
    HM_StretchCam02On()
    wait(10)
    SetGlobal("HM_StretchPlatPos", 3)
    HM_StretchCamOff()
    wait(2.5)
    SetGlobal("HM_StretchKeyEnabled", 1)
  end
end
HM_StretchPlatMove01 = L0_0
function L0_0()
  if GetGlobal("HM_StretchGear01") == 1 and GetGlobal("HM_StretchGear02") == 1 then
    SetGlobal("HM_StretchKeyEnabled", 0)
    AudioPostEventOn("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Play_sfx_HM_StrtchRm_FloorSeq_OneFloor")
    AudioPostEventOn(GetPlayer(), "Play_sfx_HM_Strtch_Room_Stretch")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA3 02", "Middle_Top")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA2 02", "Middle_Top")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Middle_Top")
    SplineFollower_StopAtPosition("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01", "hauntedmansion_zonef.SplineKnot 01", "hauntedmansion_zonef.SplineKnot 03", 0)
    HM_StretchCam01On()
    wait(4.5)
    SetGlobal("HM_StretchPlatPos", 1)
    HM_StretchCamOff()
    wait(2.5)
    SetGlobal("HM_StretchKeyEnabled", 1)
    if GetGlobal("HM_StretchingRoomState") == 2 then
      HM_StretchExit_Open()
    end
    ForEachEntityInGroup(AI_SetDisabled, "FoyerSpatter2", false)
  elseif GetGlobal("HM_StretchGear01") == 1 or GetGlobal("HM_StretchGear02") == 1 then
    HM_MainGear_RetryFix()
  else
    SetGlobal("HM_StretchKeyEnabled", 0)
    AudioPostEventOn("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Play_sfx_HM_StrtchRm_FloorSeq_OneFloor")
    AudioPostEventOn(GetPlayer(), "Play_sfx_HM_Strtch_Room_Stretch")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA3 02", "Middle_Bottom")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA2 02", "Middle_Bottom")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Middle_Bottom")
    SplineFollower_StopAtPosition("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01", "hauntedmansion_zonef.SplineKnot 01", "hauntedmansion_zonef.SplineKnot 03", 1)
    HM_StretchCam02On()
    wait(4.5)
    SetGlobal("HM_StretchPlatPos", 3)
    HM_StretchCamOff()
    wait(2.5)
    SetGlobal("HM_StretchKeyEnabled", 1)
    ForEachEntityInGroup(AI_SetDisabled, "FoyerSpatter2", false)
  end
end
HM_StretchPlatMove02 = L0_0
function L0_0()
  if GetGlobal("HM_StretchGear01") == 1 and GetGlobal("HM_StretchGear02") == 1 then
    SetGlobal("HM_StretchKeyEnabled", 0)
    AudioPostEventOn("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Play_sfx_HM_StrtchRm_FloorSeq_TwoFloor")
    AudioPostEventOn(GetPlayer(), "Play_sfx_HM_Strtch_Room_Stretch_2")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA3 02", "Bottom_Top")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA2 02", "Bottom_Top")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Bottom_Top")
    SplineFollower_StopAtPosition("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01", "hauntedmansion_zonef.SplineKnot 01", "hauntedmansion_zonef.SplineKnot 03", 0)
    HM_StretchCam01On()
    wait(10)
    SetGlobal("HM_StretchPlatPos", 1)
    HM_StretchCamOff()
    wait(2.5)
    SetGlobal("HM_StretchKeyEnabled", 1)
    if GetGlobal("HM_StretchingRoomState") == 2 then
      HM_StretchExit_Open()
    end
  elseif GetGlobal("HM_StretchGear01") == 1 or GetGlobal("HM_StretchGear02") == 1 then
    SetGlobal("HM_StretchKeyEnabled", 0)
    AudioPostEventOn("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Play_sfx_HM_StrtchRm_FloorSeq_OneFloor")
    AudioPostEventOn(GetPlayer(), "Play_sfx_HM_Strtch_Room_Stretch")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA3 02", "Bottom_Middle")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA2 02", "Bottom_Middle")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Bottom_Middle")
    SplineFollower_StopAtPosition("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01", "hauntedmansion_zonef.SplineKnot 01", "hauntedmansion_zonef.SplineKnot 03", 0.5)
    HM_StretchCam01On()
    wait(4.5)
    SetGlobal("HM_StretchPlatPos", 2)
    HM_StretchCamOff()
    wait(2.5)
    SetGlobal("HM_StretchKeyEnabled", 1)
  else
    HM_MainGear_RetryFix()
  end
end
HM_StretchPlatMove03 = L0_0
function L0_0()
  SetGlobal("HM_StretchGear01", 1)
end
StretchGear01Painted = L0_0
function L0_0()
  SetGlobal("HM_StretchGear01", 0)
end
StretchGear01Thinned = L0_0
function L0_0()
  SetGlobal("HM_StretchGear02", 1)
end
StretchGear02Painted = L0_0
function L0_0()
  SetGlobal("HM_StretchGear02", 0)
end
StretchGear02Thinned = L0_0
function L0_0(A0_10)
  if GetGlobal("HM_StretchingRoomState") == 0 then
    if GetGlobal("HM_StretchKeyEnabled") == 1 then
      HM_StretchPlatMaster()
    end
  elseif GetGlobal("HM_StretchingRoomState") == 1 then
    DoStinger("Stinger_Success", 7)
    HM_StretchExit()
  elseif GetGlobal("HM_StretchingRoomState") == 2 and GetGlobal("HM_StretchKeyEnabled") == 1 then
    HM_StretchPlatMaster()
  end
end
Stretch_StretchMasterGear = L0_0
function L0_0()
  SetGlobal("Stretch_Rescue", 1)
end
Stretch_RescueOn = L0_0
function L0_0()
  SetGlobal("Stretch_Rescue", 0)
end
Stretch_RescueOff = L0_0
function L0_0()
  if GetGlobal("HM_StretchIntroTrigger") == 0 then
    SetGlobal("HM_StretchIntroTrigger", 1)
    wait(1)
    StartFadeOut(1)
    wait(0.9)
    MoveToEntity(GetPlayer(), "hauntedmansion_zonef.ZoneF_IntroMarker01")
    wait(0.7)
    FireUser1("DoorCloseCameraMarker")
    wait(1)
    HM_StretchCloseDoors()
    wait(3)
    AudioPostEventOn(GetPlayer(), "Mute_sfx_HM_StretchingRoom")
    AudioPostEventOn(GetPlayer(), "Play_sfx_HM_Strtch_IntroStretch")
    SetGlobal("HM_StretchGear01", 0)
    SetGlobal("HM_StretchGear02", 0)
    SetGlobal("HM_StretchPlatPos", 1)
    RestrictCutSceneInput()
    StartFadeOut(1)
    wait(1)
    GrabCamera("hauntedmansion_zonef.StretchIntroCamera 01", nil, CAMERA_LERP_TRANSITION, 0)
    StartFadeInNoHUD()
    Unhide("hauntedmansion_zonef.NOS_HM_ZoneF_Inert06 01")
    Unhide("hauntedmansion_zonef.NOS_HM_ZoneF_Inert05 01")
    HM_StretchCamGo = 0
    GrabCamera("hauntedmansion_zonef.StretchIntroCamera 02", nil, CAMERA_LERP_TRANSITION, 15)
    Enable("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01")
    wait(1)
    AudioPostEventOn("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Play_sfx_HM_StrtchRm_FloorSeq_TwoFloor")
    AudioPostEventOn(GetPlayer(), "Play_sfx_HM_Strtch_Room_Stretch_2")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA3 02", "Top_Bottom")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA2 02", "Top_Bottom")
    AnimGBSequence("hauntedmansion_zonef.NOS_HM_StretchGearsA1 02", "Top_Bottom")
    Wait(0.25)
    SplineFollower_StopAtPosition("hauntedmansion_zonef.NOS_HM_ZoneF_Inert01 01", "hauntedmansion_zonef.SplineKnot 01", "hauntedmansion_zonef.SplineKnot 03", 1)
    wait(9)
    SetGlobal("HM_StretchPlatPos", 3)
    SetGlobal("HM_StretchKeyEnabled", 1)
    FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_Intro01")
  end
end
HM_StretchCameraIntro = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Play_sfx_HM_Strtch_Room_Tumbler_MixUP")
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler2", "Turn1")
  Wait(0.2)
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler3", "Turn1")
  Wait(0.2)
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler3", "Turn1")
  Wait(0.2)
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler1", "Turn1")
  Wait(0.2)
  SetGlobal("HM_Column3Tumbler1", 0)
  Wait(1)
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler3", "Turn1")
  SetGlobal("HM_Column2Tumbler3", 1)
  Wait(0.2)
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler3", "Turn2")
  SetGlobal("HM_Column3Tumbler3", 2)
  Wait(0.5)
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler2", "Turn1")
  SetGlobal("HM_Column3Tumbler2", 1)
  Wait(0.2)
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler3", "Turn2")
  SetGlobal("HM_Column1Tumbler3", 2)
  Wait(0.2)
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler2", "Turn1")
  SetGlobal("HM_Column1Tumbler2", 1)
  Wait(0.2)
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler2", "Turn2")
  SetGlobal("HM_Column2Tumbler2", 2)
  Wait(0.5)
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler1", "Turn2")
  SetGlobal("HM_Column1Tumbler1", 2)
  Wait(0.2)
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler1", "Turn1")
  SetGlobal("HM_Column2Tumbler1", 1)
  Wait(0.2)
  Wait(0.2)
  HM_StretchIntro = 1
  ForEachEntityInGroup(AI_SetDisabled, "FoyerSpatter1", false)
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C3Tumbler3", "Turn3")
  SetGlobal("HM_Column3Tumbler3", 0)
  wait(0.2)
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C2Tumbler2", "Turn3")
  SetGlobal("HM_Column2Tumbler2", 0)
  Wait(0.5)
  ForEachEntityInGroup(AnimGBSequence, "hauntedmansion_zonef.NOS_HM_ZoneF_C1Tumbler3", "Turn3")
  SetGlobal("HM_Column1Tumbler3", 0)
  Wait(0.2)
  Wait(1)
  AudioPostEventOn(GetPlayer(), "Unmute_sfx_HM_StretchingRoom")
  HM_TumblerOn = 0
  StartFadeIn(0)
  HM_StretchCamGo = 1
end
HM_StretchCameraIntro02 = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.8)
  UnpauseAllAI(GetPlayer())
  UnrestrictCutSceneInput()
  wait(0.1)
  UnrestrictCutSceneInput()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  wait(0.1)
  StartFadeIn(0.5)
end
HM_ReleaseCamStretchIntro = L0_0
function L0_0()
  FireThread(HM_IntroQuestsFix)
end
HM_GiveIntroQuests = L0_0
function L0_0()
  wait(3)
  FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_GiveQuest")
end
HM_IntroQuestsFix = L0_0
function L0_0()
  if GetGlobal("Stretch_GearTutorial") == 0 then
    SetGlobal("Stretch_GearTutorial", 1)
    FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_Hint01")
  end
end
HM_StretchGearTutorial = L0_0
function L0_0()
  AnimGBSequence("hauntedmansion_zonef.NOS_HM_ZoneF_Door02 01", "Close")
  AudioPostEventOn("hauntedmansion_zonef_audio.Sound_Door_02", "Play_sfx_HM_Strtch_Doors_Close")
end
HM_StretchCloseDoors = L0_0
function L0_0()
  SetGlobal("HM_StretchGremState", 1)
end
HM_BreakGremCage = L0_0
L0_0 = 0
StretchCamResetCam = L0_0
L0_0 = 0
HM_ResetButtonUsed = L0_0
function L0_0()
  ForceSketched("hauntedmansion_zonef.NOS_HM_StretchGearsA2 02")
  ForceSketched("hauntedmansion_zonef.NOS_HM_StretchGearsA3 02")
  wait(0.2)
  if GetGlobal("HM_StretchPlatPos") == 1 then
    HM_StretchPlatMove01()
  elseif GetGlobal("HM_StretchPlatPos") == 2 then
    HM_StretchPlatMove02()
  elseif GetGlobal("HM_StretchPlatPos") == 3 then
    HM_ResetButtonUsed = 1
    HM_StretchPlatMove03()
  end
end
HM_StretchingRoomReset = L0_0
function L0_0()
  wait(2)
  FireSequence("hauntedmansion_zonef.GusConvoMarker 01", "HM_Stretch_Exit02")
end
HM_StretchQuestComplete = L0_0
function L0_0(A0_11, A1_12)
  if A1_12 == "2" then
    StretchCamResetCam = 2
    SetCameraAttributes("hauntedmansion_zonef_static.HiddenRoomCamMarker(CameraOverride) 02")
  elseif A1_12 == "3" then
    StretchCamResetCam = 3
    SetCameraAttributes("hauntedmansion_zonef_static.HiddenRoomCamMarker(CameraOverride) 03")
  elseif A1_12 == "4" then
    StretchCamResetCam = 4
    SetCameraAttributes("hauntedmansion_zonef_static.HiddenRoomCamMarker(CameraOverride) 04")
  end
end
HM_StretchHiddenRoomCameraOn = L0_0
function L0_0()
  StretchCamResetCam = 0
  ClearAllCameraAttributes()
end
HM_StretchHiddenRoomCameraOff = L0_0
function L0_0(A0_13)
  SetPropertyFloat(A0_13, "Tether Radius", 200, 0)
end
HM_WakeSweeperEnd = L0_0
