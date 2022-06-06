local L0_0, L1_1
L0_0 = 0
DBC_GearToon1 = L0_0
L0_0 = 0
DBC_GearToon2 = L0_0
function L0_0()
  Enable("dbc_zoner_audio.Trigger_Portal 01")
  GrabCamera("dbc_zoner_dynamic.CameraControlPoint_IntroCheckpoint", nil, CAMERA_INSTANT_TRANSITION, 0)
  DestroyEntity("dbc_zonemr.DBC_ZoneD_ExitDoor01 01")
  DestroyEntity("dbc_zoner_dynamic.Trigger 05")
  Enable("dbc_zoner_dynamic.Trigger 04")
  FireThread(DBC_ZoneR_LoadCheckpoint_FireThread)
end
DBC_ZoneR_LoadCheckpoint = L0_0
function L0_0()
  Enable("dbc_zoner_audio.Trigger_Portal 02")
  GrabCamera("dbc_zoner_dynamic.CameraControlPoint_Checkpoint2Cam", nil, CAMERA_INSTANT_TRANSITION, 0)
  EndTrackingCurrentLevelForScoring("DBC_V2_Utilidor7")
  StartTrackingCurrentLevelForScoring("DBC_V2_Utilidor7")
  AnimGBSequence("dbc_zoner_dynamic.fallingfloor 08.FloorPiece", "RestRuble")
  AnimGBSequence("dbc_zoner_dynamic.fallingfloor 03.FloorPiece", "HallDrop", false, 0.1, 0)
  AnimGBSequence("dbc_zoner_dynamic.fallingfloor 04.FloorPiece", "Break")
  DestroyEntity("dbc_zoner_dynamic.PlaneTrigger 02")
  DestroyEntity("FallingFloor08_Trigger")
  DestroyEntity("dbc_zoner_dynamic.DBC_ChandelierB1_Inert 06")
  DestroyEntity("dbc_zoner_dynamic.Trigger 05")
  SetRotatorMaxSpeed("dbc_zoner_dynamic.DBC_ChandelierB2_Inert 04", 15)
  Enable("dbc_zoner_dynamic.Trigger 03")
  FireThread(GuardianPrefab_PopulateGuardians, "DBC_ZoneR_MickeyHead")
  FireThread(DBC_ZoneR_LoadMidCheckpoint_FireThread)
end
DBC_ZoneR_LoadMidCheckpoint = L0_0
function L0_0()
  SetDefaultCameraValues(6.25, 18, -10)
end
DBC_ZoneR_DefaultCameraSetup = L0_0
function L0_0(A0_2, A1_3, A2_4)
  local L3_5, L4_6
  L3_5 = SetGlobal
  L4_6 = A1_3
  L3_5(L4_6, tonumber(A2_4))
end
DBC_ZoneR_SetGlobal = L0_0
function L0_0(A0_7, A1_8, A2_9, A3_10, A4_11)
  if GetGlobal(A1_8) == 0 then
    SetGlobal(A1_8, 1)
  else
    SetGlobal(A1_8, 0)
  end
  if GetGlobal(A1_8) == 1 and GetGlobal(A2_9) == 1 then
    SplineFollower_StopAtPosition(A0_7, A3_10, A4_11, 0)
  elseif GetGlobal(A1_8) == 1 or GetGlobal(A2_9) == 1 then
    SplineFollower_StopAtPosition(A0_7, A3_10, A4_11, 0.5)
  else
    SplineFollower_StopAtPosition(A0_7, A3_10, A4_11, 1)
  end
end
DBC_ZoneR_RaiseChandelier = L0_0
function L0_0(A0_12, A1_13, A2_14, A3_15, A4_16, A5_17, A6_18, A7_19)
  if GetGlobal("DBC_ZoneR_ChandelierMoving") == 0 then
    SplineFollower_StopAtPosition(A0_12, A2_14, A3_15, tonumber(A6_18))
    SplineFollower_StopAtPosition(A1_13, A4_16, A5_17, tonumber(A7_19))
  end
end
DBC_ZoneR_CounterWeightChandelier = L0_0
function L0_0(A0_20, A1_21, A2_22, A3_23, A4_24, A5_25, A6_26, A7_27)
  SetGlobal("DBC_ZoneR_ChandelierMoving", 1)
  SplineFollower_StopAtPosition(A0_20, A2_22, A3_23, tonumber(A6_26))
  SplineFollower_StopAtPosition(A1_21, A4_24, A5_25, tonumber(A7_27))
end
DBC_ZoneR_AnvilOn = L0_0
function L0_0(A0_28, A1_29, A2_30, A3_31, A4_32, A5_33)
  if GetGlobal("DBC_ZoneR_MickeyLoc") == 0 then
    SplineFollower_StopAtPosition(A0_28, A2_30, A3_31, 0.4)
    SplineFollower_StopAtPosition(A1_29, A4_32, A5_33, 0.4)
  elseif GetGlobal("DBC_ZoneR_MickeyLoc") == 1 then
    SplineFollower_StopAtPosition(A0_28, A2_30, A3_31, 0.8)
    SplineFollower_StopAtPosition(A1_29, A4_32, A5_33, 0)
  elseif GetGlobal("DBC_ZoneR_MickeyLoc") == 2 then
    SplineFollower_StopAtPosition(A0_28, A2_30, A3_31, 0.8)
    SplineFollower_StopAtPosition(A1_29, A4_32, A5_33, 0)
  end
  SetGlobal("DBC_ZoneR_ChandelierMoving", 0)
end
DBC_ZoneR_AnvilOff = L0_0
function L0_0(A0_34, A1_35, A2_36)
  QueueBrainEvent(A0_34, "BRAIN_CustomBehaviorOne", vector4(0, 0, 0), A1_35)
  wait(tonumber(A2_36))
  ForceSketched(A1_35)
  QueueBrainEvent(A0_34, "BRAIN_CustomBehaviorTwo")
end
DBC_ZoneR_HallwayTent = L0_0
function L0_0()
  ShakeCamera(6, 10, 0, 20, 0.025, 0.025)
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneR_Camera_Rumble")
end
DBC_ZoneR_WorldShake = L0_0
function L0_0(A0_37)
  SetExternalVelocity(A0_37, vector4(0, 0, 5), 0.9)
end
DBC_ZoneR_HallBlow = L0_0
function L0_0()
  SetFirstPersonCameraEnabled(false)
end
DBC_ZoneR_NoFirstPerson = L0_0
function L0_0()
  SetFirstPersonCameraEnabled(true)
end
DBC_ZoneR_YesFirstPerson = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneM_GemLit") == 1 then
    Print("Doors opened")
    AnimGBSequence("dbc_zonemr.DBC_ZoneD_ExitDoor01 01", "Open")
    Hide("dbc_zoner_dynamic.DBC_ZoneD_ExitDoor01 01")
  else
    SetMap(nil, "MAP_DBC_ZONER", "GAME")
  end
end
DBC_ZoneR_OpenDoorsOnStream = L0_0
function L0_0()
  GuardianPrefab_PopulateGuardians("DBC_ZoneR_MickeyHead")
  SetCameraAttributes("dbc_zoner_dynamic.LedgeLookDisable(CameraOverride) 01")
  if GetGlobal("DBC_ZoneR_CheckpointCheck") == 0 then
    SetGlobal("DBC_ZoneR_CheckpointCheck", 1)
    SetGlobal("DBC_ZoneH_ShamHide", 1)
    AnimGBSequence("dbc_zonemr.DBC_ZoneD_ExitDoor01 01", "Close")
    SetGlobal("MS_MeanStreetProgress", 6)
    EndTrackingCurrentLevelForScoring("DBC_V2_LossTower")
    StartTrackingCurrentLevelForScoring("DBC_V2_Utilidor7")
    wait(1)
    DestroyEntity("dbc_zonemr.DBC_ZoneD_ExitDoor01 01")
    Unhide("dbc_zoner_dynamic.DBC_ZoneD_ExitDoor01 01")
    StreamInterior(nil, "Stream_controltower_interior")
    SaveCheckpoint(nil, "DBC_ZoneR_LoadCheckpoint", "dbc_zoner_dynamic.PositionMarker 01")
  end
end
DBC_ZoneR_CloseEntranceDoors = L0_0
function L0_0()
  SetCameraAttributes("dbc_zoner_dynamic.SecretHallCameraOverride 01")
  SaveCheckpoint(nil, "DBC_ZoneR_LoadCheckpoint", "dbc_zoner_dynamic.PositionMarker 01")
end
DBC_ZoneR_RedChestSave = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_ZoneR_LoadCheckpoint", "dbc_zoner_dynamic.PositionMarker 01")
end
DBC_ZoneR_PinCollect = L0_0
function L0_0()
  Wait(1.8)
  SaveCheckpoint(nil, "DBC_ZoneR_LoadMidCheckpoint", "dbc_zoner_dynamic.PositionMarker 02")
end
DBC_ZoneR_TriggerSecondCheckpoint = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneM_GemLit") == 0 then
    Unhide("dbc_zoner_dynamic.DBC_ZoneD_ExitDoor01 01")
    SetMap(nil, "MAP_DBC_ZONER", "GAME")
  end
end
DBC_ZoneR_DevLoadSet = L0_0
function L0_0()
  Wait(1)
  SaveCheckpoint(nil, "DBC_ZoneR_LoadCheckpoint", "dbc_zoner_dynamic.PositionMarker 01")
end
DBC_ZoneR_ConceptArtSave = L0_0
function L0_0(A0_38, A1_39, A2_40)
  if _G[A2_40] == 0 then
    _G[A2_40] = 1
    Enable(A1_39)
  else
    _G[A2_40] = 0
    Disable(A1_39)
  end
  if DBC_GearToon1 == 1 or DBC_GearToon2 == 1 then
    Enable("dbc_zoneq_dynamic.NOS_HM_GearA5_Inert 01")
  else
    Disable("dbc_zoneq_dynamic.NOS_HM_GearA5_Inert 01")
  end
end
DBC_ZoneR_RotateGearCheck = L0_0
function L0_0(A0_41, A1_42)
  StartCameraPivotSnap("dbc_zoner_dynamic.FallingHallCameraOverride 02", 0.005, 0.005, true, false)
end
DBC_ZoneR_NudgeReset = L0_0
function L0_0()
  ClearAllCameraAttributesTimed(1)
end
DBC_ZoneR_ResetCam = L0_0
function L0_0()
  Wait(0.1)
  Unhide("dbc_zoner_dynamic.DBC_ZoneD_ExitDoor01 01")
  EndTrackingCurrentLevelForScoring("DBC_V2_Utilidor7")
  StartTrackingCurrentLevelForScoring("DBC_V2_Utilidor7")
  GuardianPrefab_PopulateGuardians("DBC_ZoneR_MickeyHead")
end
DBC_ZoneR_LoadCheckpoint_FireThread = L0_0
function L0_0()
  Wait(0.5)
  DBC_ZoneR_WorldShake()
  Wait(0.8)
  DBC_ZoneR_WorldShake()
end
DBC_ZoneR_LoadMidCheckpoint_FireThread = L0_0
function L0_0()
  FreezeCamera()
end
DBC_ZoneR_DeathFreezeCamera = L0_0
