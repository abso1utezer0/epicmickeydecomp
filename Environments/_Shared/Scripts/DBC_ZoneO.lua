local L0_0, L1_1
L0_0 = "Right"
DBC_Gear03Inrt = L0_0
function L0_0()
  TimerEnable("dbc_zoneo.Tent1Pattern_Timer")
  TimerEnable("dbc_zoneo_static.WorldShakeLogicTimerMarker 01")
  EndTrackingCurrentLevelForScoring("DBC_V2_Utilidor4")
  StartTrackingCurrentLevelForScoring("DBC_V2_Utilidor4")
  FireThread(GuardianPrefab_PopulateGuardians, "DBC_ZoneO_MickeyHead")
end
DBC_ZoneO_LoadCheckpoint = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneO_IntroCutscene") == 0 then
    RestrictCutSceneInput()
    SetMap(nil, "MAP_DBC_ZONEO", "GAME")
    GuardianPrefab_PopulateGuardians("DBC_ZoneO_MickeyHead")
    SetGlobal("MS_MeanStreetProgress", 6)
    SetGlobal("DBC_ZoneO_IntroCutscene", 1)
    EndTrackingCurrentLevelForScoring("DBC_V2_ControlTower")
    StartTrackingCurrentLevelForScoring("DBC_V2_Utilidor4")
    StartFadeOut(0.5)
    Wait(0.5)
    HideHud()
    GrabCamera("dbc_zoneo.IntroCameraControlPoint 01", nil, CAMERA_INSTANT_TRANSITION, 0)
    StartFadeIn(0.5)
    Wait(0.5)
    AnimGBSequence("dbc_zoneh_dynamic.DBC_ZoneO_ExitDoor01 01", "Close")
    AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_Utilidor4_DoorSlam")
    wait(0.7)
    TimerEnable("dbc_zoneo.Tent1Pattern_Timer")
    wait(1.3)
    FireSequence("dbc_zoneo_static.GusCopnversationMarker 01", "DBC_2nd_ZoneO_Intro1")
    wait(1)
    Enable("dbc_zoneo_igc.TriggerRotate_introCameraRelease")
  end
end
DBC_ZoneO_CloseControlRoomDoors = L0_0
function L0_0()
  StartFadeOut(0.5)
  wait(0.5)
  GrabCamera("cameraIntroStatic", nil, CAMERA_INSTANT_TRANSITION, 0)
  StartFadeIn(0.5)
  ShowHud()
  UnrestrictCutSceneInput()
  AudioPostEventOn(GetPlayer(), "Reset_Volume_Enemies")
  SaveCheckpoint(nil, "DBC_ZoneO_LoadCheckpoint", "dbc_zoneo.dbczoneoStartMarker")
end
DBC_ZoneO_CloseControlRoomDoors_End = L0_0
function L0_0()
  ReleaseCamera(CAMERA_EASING_TRANSITION, 1)
  wait(1)
  Disable("dbc_zoneo_igc.TriggerRotate_introCameraRelease")
end
DBC_ZoneO_CloseControlRoomDoors_End_Release = L0_0
function L0_0(A0_2, A1_3)
  GrabCamera(A0_2, nil, CAMERA_LERP_TRANSITION, A1_3)
end
DBC_GrabCam = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.7)
end
DBC_ReleaseCam = L0_0
function L0_0()
  Rumble(nil, 0.25)
  ShakeCamera(1.3, 7, 0.5, 0.4, 0.01, 0.002)
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneO_Camera_Rumble")
end
DBC_ZoneO_WorldShake = L0_0
function L0_0()
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group1 01", "BRAIN_CustomBehaviorTwo")
  wait(0.4)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group1 02", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group1 03", "BRAIN_CustomBehaviorTwo")
  wait(0.3)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group1 04", "BRAIN_CustomBehaviorTwo")
  wait(0.4)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group1 05", "BRAIN_CustomBehaviorTwo")
  wait(0.4)
end
DBC_ZoneO_TentPattern1 = L0_0
function L0_0()
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group2 01", "BRAIN_CustomBehaviorTwo")
  wait(0.2)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group2 02", "BRAIN_CustomBehaviorTwo")
  wait(0.25)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group2 03", "BRAIN_CustomBehaviorTwo")
  wait(0.3)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group2 04", "BRAIN_CustomBehaviorTwo")
  wait(0.1)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group2 05", "BRAIN_CustomBehaviorTwo")
  wait(0.3)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group2 06", "BRAIN_CustomBehaviorTwo")
  wait(0.25)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group2 07", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group2 08", "BRAIN_CustomBehaviorTwo")
  wait(0.3)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group2 09", "BRAIN_CustomBehaviorTwo")
  wait(0.1)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group2 10", "BRAIN_CustomBehaviorTwo")
  wait(0.2)
end
DBC_ZoneO_TentPattern2 = L0_0
function L0_0()
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group3 01", "BRAIN_CustomBehaviorTwo")
  wait(0.1)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group3 02", "BRAIN_CustomBehaviorTwo")
  wait(0.2)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group3 03", "BRAIN_CustomBehaviorTwo")
  wait(0.3)
  ForEachEntityInGroup(QueueBrainEvent, "SmallTentacle", "BRAIN_CustomBehaviorOne")
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group3 04", "BRAIN_CustomBehaviorTwo")
  wait(0.25)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group3 05", "BRAIN_CustomBehaviorTwo")
  wait(0.1)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group3 06", "BRAIN_CustomBehaviorTwo")
  wait(0.4)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group3 07", "BRAIN_CustomBehaviorTwo")
  wait(0.15)
  QueueBrainEvent("dbc_zoneo.BlotTentacle_Group3 08", "BRAIN_CustomBehaviorTwo")
  wait(0.3)
end
DBC_ZoneO_TentPattern3 = L0_0
L0_0 = 0
DBC_ZoneO_SecondChandeliersRaised = L0_0
function L0_0(A0_4, A1_5, A2_6, A3_7, A4_8)
  if GetPropertyBool(A0_4, "Is Painted") then
    SetRotatorMaxSpeed(A0_4, 30)
    StartRotateToPosition(A0_4, 179)
    SetRotatorMaxSpeed(A1_5, 30)
    StartRotateToPosition(A1_5, 181)
    SetSplineFollowerInitialSpeed(A2_6, 1)
    AudioPostEventOn("dbc_zoneo.DBC_ChandelierB1_Toon 03", "Play_sfx_dbc_chandelier_raise_Begin")
    AudioPostEventOn("dbc_zoneo.NOS_HM_GearA1_Toon 03", "Play_sfx_dbc_gear_Start")
    SplineFollower_StopAtPosition(A2_6, A3_7, A4_8, 0)
  else
    SetRotatorMaxSpeed(A0_4, 120)
    StartRotateToPosition(A0_4, 0)
    SetRotatorMaxSpeed(A1_5, 120)
    StartRotateToPosition(A1_5, 0)
    SetSplineFollowerInitialSpeed(A2_6, 4)
    SplineFollower_StopAtPosition(A2_6, A3_7, A4_8, 1)
    AudioPostEventOn("dbc_zoneo.DBC_ChandelierB1_Toon 03", "Play_sfx_dbc_chandelier_raise_Begin")
    AudioPostEventOn("dbc_zoneo.NOS_HM_GearA1_Toon 03", "Play_sfx_dbc_gear_Start")
  end
end
DBC_ZoneO_RaiseChandelier = L0_0
L0_0 = 0
DBC_ZoneO_FirstChandeliersRaised = L0_0
function L0_0()
  if GetPropertyBool("dbc_zoneo.NOS_HM_GearA1_Toon 02", "Is Painted") then
    if DBC_ZoneO_FirstChandeliersRaised == 0 then
      DBC_ZoneO_FirstChandeliersRaised = 1
      SetSplineFollowerInitialSpeed("dbc_zoneo.DBC_ChandelierB1_Toon 01", 1)
      SetSplineFollowerInitialSpeed("dbc_zoneo.DBC_ChandelierB1_Toon 02", 1)
    else
      Reverse("dbc_zoneo.DBC_ChandelierB1_Toon 01")
      Reverse("dbc_zoneo.DBC_ChandelierB1_Toon 02")
    end
    SetRotatorMaxSpeed("dbc_zoneo.NOS_HM_GearA1_Toon 02", 120)
    StartRotateToPosition("dbc_zoneo.NOS_HM_GearA1_Toon 02", 179)
    SetRotatorMaxSpeed("dbc_zoneo.NOS_HM_GearA5_Inert 01", 120)
    StartRotateToPosition("dbc_zoneo.NOS_HM_GearA5_Inert 01", 181)
    AudioPostEventOn("dbc_zoneo.NOS_HM_GearA1_Toon 01", "Play_sfx_dbc_gear_Start")
    AudioPostEventOn("dbc_zoneo.NOS_HM_GearA5_Inert 01", "Play_sfx_dbc_gear_Start")
    AudioPostEventOn("dbc_zoneo.DBC_ChandelierB1_Toon 01", "Play_sfx_dbc_chandelier_raise_Begin")
    AudioPostEventOn("dbc_zoneo.DBC_ChandelierB1_Toon 02", "Play_sfx_dbc_chandelier_raise_Begin")
  else
    SetRotatorMaxSpeed("dbc_zoneo.NOS_HM_GearA1_Toon 02", 120)
    StartRotateToPosition("dbc_zoneo.NOS_HM_GearA1_Toon 02", 0)
    SetRotatorMaxSpeed("dbc_zoneo.NOS_HM_GearA5_Inert 01", 120)
    StartRotateToPosition("dbc_zoneo.NOS_HM_GearA5_Inert 01", 0)
    Reverse("dbc_zoneo.DBC_ChandelierB1_Toon 01")
    Reverse("dbc_zoneo.DBC_ChandelierB1_Toon 02")
    AudioPostEventOn("dbc_zoneo.DBC_ChandelierB1_Toon 03", "Play_sfx_dbc_chandelier_raise_Begin")
    AudioPostEventOn("dbc_zoneo.NOS_HM_GearA1_Toon 03", "Play_sfx_dbc_gear_Start")
  end
end
DBC_ZoneO_RaiseChandelierWithTent = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_ZoneO_LoadCheckpoint", "dbc_zoneo.dbczoneoStartMarker")
end
DBC_ZoneO_RedChestSave = L0_0
function L0_0()
  ClearAllCameraAttributesTimed(1)
end
DBC_ZoneO_ResetCam = L0_0
function L0_0(A0_9, A1_10)
  SetCameraAttributes(A1_10)
  Print("First")
  Wait(1.5)
  Print("Second")
  DBC_ZoneO_ResetCam()
end
DBC_ZoneO_NudgeReset = L0_0
function L0_0(A0_11, A1_12)
  DBC_ZoneO_ResetCam()
  Wait(1)
  Print("First")
  SetCameraAttributes(A1_12)
  Print("Second")
end
DBC_ZoneO_ResetNudge = L0_0
function L0_0(A0_13, A1_14, A2_15)
  QueueBrainEvent(A0_13, "BRAIN_CustomBehaviorOne", vector4(0, 0, 0), A1_14)
  wait(tonumber(A2_15))
  ForceSketched(A1_14)
  QueueBrainEvent(A0_13, "BRAIN_CustomBehaviorTwo")
end
DBC_ZoneO_GearTent = L0_0
function L0_0()
  ForEachEntityInGroup(Unhide, "UtilidorProps")
end
DBC_ZoneO_UnhideUtilidor = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_ZoneO_LoadCheckpoint", "dbc_zoneo.dbczoneoStartMarker")
end
DBC_ZoneO_ConceptArtSave = L0_0
function L0_0(A0_16, A1_17, A2_18)
  ForEachEntityInGroup(Enable, A1_17)
  ForEachEntityInGroup(Unhide, A1_17)
  ForEachEntityInGroup(Disable, A2_18)
  ForEachEntityInGroup(Hide, A2_18)
end
DBC_ZoneO_ManageTentacles = L0_0
function L0_0()
  ForEachEntityInGroup(Disable, "SmallTentacleGroup2")
  ForEachEntityInGroup(Disable, "SmallTentacleGroup3")
  ForEachEntityInGroup(Hide, "SmallTentacleGroup2")
  ForEachEntityInGroup(Hide, "SmallTentacleGroup3")
end
DBC_ZoneO_InitTentacleSetup = L0_0
function L0_0()
  FreezeCamera()
end
DBC_ZoneO_DeathFreezeCamera = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Reset_Volume_Enemies")
end
DBC_ZoneO_IncreaseTentVolume = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Set_Volume_Enemies")
end
DBC_ZoneO_DecreaseTentVolume = L0_0
function L0_0()
  Print("Reached position")
end
DebugPrint = L0_0
