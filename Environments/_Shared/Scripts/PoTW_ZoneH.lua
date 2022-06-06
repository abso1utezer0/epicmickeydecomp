local L0_0, L1_1
function L0_0()
  Print("Streaming interior")
  SetMap(GetPlayer(), "MAP_P_ZONEH", "GAME")
  potw_ZoneH_trans1_SaveCheckpoint()
  potw_ZoneH_Setup()
end
PotW_ZoneK_Load = L0_0
function L0_0()
  StartTrackingCurrentLevelForScoring("potw_PirateVoyage")
  Print("ZONE H SETUP IS RUNNING")
  SetMap(GetPlayer(), "MAP_P_ZONEH", "GAME")
  SetDefaultCameraValues(3.5, 14, -11)
  GuardianPrefab_PopulateGuardians("MickeyHead_RideExit")
  FireThread(PotW_BoatRide_Start)
  FireThread(PotW_IndianRide_Start2)
  AnimGBSequence("potw_zoneh_dynamic.AnimGate 01", "Closed")
  AnimGBSequence("potw_zoneh_dynamic.AnimGate 02", "Closed")
  AnimGBSequence("potw_zoneh_dynamic.AnimGate 03", "Rest")
end
potw_ZoneH_Setup = L0_0
L0_0 = false
PotW_Ride_NoIntro = L0_0
function L0_0()
  if PotW_Ride_NoIntro == false then
    GetPrefabData("potw_zoneH_Start").MapLoad_SetupPosition = "True"
  end
end
PotW_Ride_1stSection_Launcher = L0_0
L0_0 = "ZoneH_Start"
pirateVoyageStartLocation = L0_0
function L0_0()
  if GetGlobal("potw_ride_startLocation") == 0 then
    pirateVoyageStartLocation = "ZoneH_Start"
  elseif GetGlobal("potw_ride_startLocation") == 1 then
    pirateVoyageStartLocation = "ZoneH_Start_2"
  elseif GetGlobal("potw_ride_startLocation") == 2 then
    pirateVoyageStartLocation = "ZoneH_Start_3"
  end
  SaveCheckpoint(GetPlayer(), "potw_ZoneH_LoadCheckpoint", pirateVoyageStartLocation)
end
potw_ZoneH_SaveCheckpoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "potw_ZoneH_trans1_LoadCheckpoint", "ZoneH_Start")
end
potw_ZoneH_trans1_SaveCheckpoint = L0_0
function L0_0()
  StartTrackingCurrentLevelForScoring("potw_PirateVoyage")
  SetDefaultCameraValues(3.5, 14, -11)
  FireThread(PotW_BoatRide_Start)
  FireThread(PotW_IndianRide_Start2)
  AnimGBSequence("potw_zoneh_dynamic.AnimGate 01", "Closed")
  AnimGBSequence("potw_zoneh_dynamic.AnimGate 02", "Closed")
  AnimGBSequence("potw_zoneh_dynamic.AnimGate 03", "Rest")
end
potw_ZoneH_trans1_LoadCheckpoint = L0_0
function L0_0()
  Print("###### Loading Checkpoint")
  PotW_ZoneH_ChangeDefaultCamSettings()
  GuardianPrefab_PopulateGuardians("MickeyHead_RideExit")
  StartTrackingCurrentLevelForScoring("potw_PirateVoyage")
  if GetGlobal("IndianPumpsDone") == 2 then
    Print("###### Loading Checkpoint: Thinner Pumps")
    SetSplineFollowerInitialSpeed("potw_zoneh_dynamic.Thinner 00", 5)
    AnimGBSequence("potw_zoneh_dynamic.P_ZoneH_RideMaster 01", "1Rest")
    AnimGBSequence("potw_zoneh_dynamic.AnimGate 03", "Destroyed")
    ForEachEntityInGroup(DestroyEntity, "potw_zoneh_dynamic.AnimGate 01")
    ForEachEntityInGroup(AnimGBSequence, "RideTankThinnerGroup", "Rest4")
    DisableGuardianHint("potw_zoneh_scripting.PlayerHintMarkers 01")
    DisableGuardianHint("potw_zoneh_scripting.PlayerHintMarkers 02")
    DisableGuardianHint("potw_zoneh_scripting.PlayerHintMarkers 03")
    potw_ride_HintEnableLastGate()
    Print(" >>>>>>>>>>  Fired the pump thinner call.")
  elseif GetGlobal("IndianPumpsDone") == 1 then
    Print("###### Loading Checkpoint: Paint Pumps")
    ForEachEntityInGroup(SetPropertyFloat, "potw_zoneh_dynamic.SplineKnot 38", "BranchPathChance", 1)
    AnimGBSequence("potw_zoneh_dynamic.P_ZoneH_RideMaster 01", "3Rest")
    ForEachEntityInGroup(DestroyEntity, "potw_zoneh_dynamic.AnimGate 01")
    DestroyEntity("potw_zoneh_pumpgate")
    SetSplineFollowerInitialSpeed("potw_zoneh_dynamic.Thinner 00", 5)
    ForEachEntityInGroup(AnimGBSequence, "RideTankPaintGroup", "Rest4")
    DisableGuardianHint("potw_zoneh_scripting.PlayerHintMarkers 01")
    DisableGuardianHint("potw_zoneh_scripting.PlayerHintMarkers 02")
    DisableGuardianHint("potw_zoneh_scripting.PlayerHintMarkers 03")
    potw_ride_HintEnableLastGate()
  else
    SetGlobal("potw_ride_pump1", 0)
    SetGlobal("potw_ride_pump2", 0)
    SetGlobal("potw_ride_pump3", 0)
    EnableGuardianHint("potw_zoneh_scripting.PlayerHintMarkers 01")
    EnableGuardianHint("potw_zoneh_scripting.PlayerHintMarkers 02")
    EnableGuardianHint("potw_zoneh_scripting.PlayerHintMarkers 03")
  end
  if GetGlobal("PotW_GremlinErik_Thanks_Played") == 1 then
    Hide("caged_gremlin_cage")
    Hide("potw_zoneh_dynamic.PotW_CaveGateA1_Inert 02")
    Hide("caged_gremlin_gremlin")
    DestroyEntity("potw_zoneh_dynamic.AnimGate 02")
  else
    PoTW_SetDoubloonDannyState()
  end
  FireThread(PotW_BoatRide_Start)
  FireThread(PotW_IndianRide_Start2)
end
potw_ZoneH_LoadCheckpoint = L0_0
function L0_0()
  SetCameraAttributes("potw_zoneh_camera.Alcove 01 02 Camera Override")
  potw_ZoneH_SaveCheckpoint()
end
PotW_ZoneH_ChestSave = L0_0
function L0_0()
  Print("STARTING BOATS")
  AnimGBSequence("potw_zoneh_dynamic.PoTW_ZoneH_BoatAnim 01", "PathA_01")
  wait(10)
  AnimGBSequence("potw_zoneh_dynamic.PoTW_ZoneH_BoatAnim 02", "PathA_01")
  wait(10)
  AnimGBSequence("potw_zoneh_dynamic.PoTW_ZoneH_BoatAnim 03", "PathA_01")
  wait(10)
  AnimGBSequence("potw_zoneh_dynamic.PoTW_ZoneH_BoatAnim 04", "PathA_01")
end
PotW_BoatRide_Start = L0_0
function L0_0()
  AnimGBReset("potw_zoneh_dynamic.PoTW_ZoneH_BoatAnim 01")
  AnimGBReset("potw_zoneh_dynamic.PoTW_ZoneH_BoatAnim 02")
  AnimGBReset("potw_zoneh_dynamic.PoTW_ZoneH_BoatAnim 03")
  AnimGBReset("potw_zoneh_dynamic.PoTW_ZoneH_BoatAnim 04")
end
PotW_BoatRide_Stop = L0_0
function L0_0()
  ForEachEntityInGroup(Unhide, "potw_zoneh_trans2.Boats")
  AnimGBSequence("potw_zoneh_trans2.Rowboat_PathB_01", "PathA_01")
  wait(8)
  AnimGBSequence("potw_zoneh_trans2.Rowboat_PathB_02", "PathA_01")
  wait(8)
  AnimGBSequence("potw_zoneh_trans2.Rowboat_PathB_03", "PathA_01")
end
PotW_IndianRide_Start2 = L0_0
function L0_0()
  if GetGlobal("potw_PirateVoyage_IntroPlayed") == 0 then
    SetGlobal("potw_PirateVoyage_IntroPlayed", 1)
    SetGlobal("potw_ride_startLocation", 1)
    FireUser1("PumpsIntroCamera")
  end
end
potw_ride_pumpsIntro = L0_0
function L0_0(A0_2)
  if GetPropertyBool("potw_zoneh_dynamic.P_ZoneH_Toon04", "Is Painted") then
    SetCameraAttributes(A0_2)
  end
end
PotW_Ride_LedgeToonCheck = L0_0
function L0_0()
  Print("POTW_IndianRide_CloseGate just fired!!!")
  Print("POTW_IndianRide_CloseGate just fired!!!")
  Print("POTW_IndianRide_CloseGate just fired!!!")
  Print("POTW_IndianRide_CloseGate just fired!!!")
end
PotW_IndianRide_CloseGate = L0_0
function L0_0()
  GrabCamera("potw_zoneh_dynamic.CameraControlPoint 01", GetPlayer(), CAMERA_LERP_TRANSITION, 1)
end
PotW_IndianRide_CameraSwitch1 = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1)
end
PotW_IndianRide_CameraSwitch2 = L0_0
function L0_0(A0_3, A1_4)
  Print("PotW_Ride_TreasureDoorState  ")
  if GetGlobal("IndianPumpsDone") > 0 then
    Print("IndianPumpsDone > 0")
    if A1_4 == "Disable" then
      Disable(target)
      Print("PotW_Ride_TreasureDoorState  " .. A1_4)
    elseif A1_4 == "Enable" then
      Enable(target)
      Print("PotW_Ride_TreasureDoorState  " .. A1_4)
    end
  end
end
PotW_Ride_TreasureDoorState = L0_0
function L0_0(A0_5)
  wait(1.15)
  Enable(A0_5)
  StartEmitters("potw_zoneh_fx.Crusher Dust")
  wait(0.2)
  StopEmitters("potw_zoneh_fx.Crusher Dust")
  Disable(A0_5)
end
PotW_Ride_CrusherState = L0_0
L0_0 = 0
RidePumps_Thinner = L0_0
L0_0 = 0
RidePumps_Paint = L0_0
L0_0 = 0
RidePumps_TotalUsed = L0_0
function L0_0(A0_6, A1_7, A2_8)
  DisableGuardianHint("potw_zoneh_scripting.PlayerHintMarkers 0" .. A2_8)
  RidePumps_TotalUsed = RidePumps_TotalUsed + 1
  if A1_7 == "Thinner" then
    RidePumps_Thinner = RidePumps_Thinner + 1
    SetGlobal("potw_ride_pump" .. A2_8, 2)
  elseif A1_7 == "Paint" then
    RidePumps_Paint = RidePumps_Paint + 1
    SetGlobal("potw_ride_pump" .. A2_8, 1)
  end
  if RidePumps_TotalUsed < 3 then
    if RidePumps_Paint == 1 then
      FireSequence("BoatRide_Gus", "PotW_V2_PumpOne" .. A1_7)
    elseif RidePumps_Paint == 2 then
      FireSequence("BoatRide_Gus", "PotW_V2_PumpTwo" .. A1_7)
    end
  elseif RidePumps_TotalUsed == 3 then
    if RidePumps_Thinner < 3 and RidePumps_Paint < 3 then
      FireSequence("BoatRide_Gus", "PotW_V2_PumpAllMixed")
      wait(2)
      RidePumps_TotalUsed = 0
      RidePumps_Paint = 0
      RidePumps_Thinner = 0
      FireUser1("potw_zoneh_dynamic.Pump_Reset_Relay")
    else
      PoTW_IndianRide_ThinnerMove(A0_6, A1_7)
      DestroyEntity("potw_zoneh_pumpgate")
    end
  end
end
PoTW_IndianRide_PumpCheck = L0_0
function L0_0(A0_9, A1_10)
  GetPrefabData("potw_zoneh_igc.BoatRideGateCamera").barkSequence = "PotW_V2_PumpAll" .. A1_10
  FireUser1("potw_zoneh_igc.BoatRideGateCamera")
  if A1_10 == "Thinner" then
    ForEachEntityInGroup(Hide, "FirstBoats")
    wait(1)
    SetSplineFollowerInitialSpeed("potw_zoneh_dynamic.Thinner 00", 5)
    AnimGBSequence("potw_zoneh_dynamic.P_ZoneH_RideMaster 01", "2to1")
    AudioPostEventOn(GetPlayer(), "Pause_Music")
    AudioPostEventOn(GetPlayer(), "Play_sfx_POTW_BR_Thinner_Rise")
    ForEachEntityInGroup(DestroyEntity, "potw_zoneh_pumpgate")
    AnimGBSequence("potw_zoneh_dynamic.P_ZoneH_RideMaster 01", "1Rest")
    SetGlobal("IndianPumpsDone", 2)
    SetGlobal("potw_ride_startLocation", 2)
    potw_ride_HintEnableLastGate()
    wait(4)
    AudioPostEventOn(GetPlayer(), "Resume_Music")
  elseif A1_10 == "Paint" then
    ForEachEntityInGroup(SetPropertyFloat, "potw_zoneh_dynamic.SplineKnot 38", "BranchPathChance", 1)
    wait(1)
    SetSplineFollowerInitialSpeed("potw_zoneh_dynamic.Thinner 00", 5)
    AnimGBSequence("potw_zoneh_dynamic.P_ZoneH_RideMaster 01", "2to3")
    AudioPostEventOn(GetPlayer(), "Pause_Music")
    AudioPostEventOn(GetPlayer(), "Play_sfx_POTW_BR_Thinner_Lower")
    wait(4)
    AudioPostEventOn(GetPlayer(), "Resume_Music")
    AnimGBSequence("potw_zoneh_dynamic.P_ZoneH_RideMaster 01", "3Rest")
    SetGlobal("IndianPumpsDone", 1)
    SetGlobal("potw_ride_startLocation", 2)
    potw_ride_HintEnableLastGate()
  end
end
PoTW_IndianRide_ThinnerMove = L0_0
function L0_0()
  AnimVarInt("potw_zoneh_ai.PirateRanged 01", VAR_Mood_Type, 1)
  AnimVarInt("potw_zoneh_ai.PirateRanged 01", VAR_NPC_State, 1)
end
PoTW_SetDoubloonDannyState = L0_0
function L0_0()
  AnimVarInt("potw_zoneh_ai.PirateRanged 01", VAR_Mood_Type, 0)
  AnimVarInt("potw_zoneh_ai.PirateRanged 01", VAR_NPC_State, 0)
  SetPropertyVector("potw_zoneh_ai.PirateRanged 01", "UsableEffectOffset", vector4(0, 2, 0), 0)
end
PoTW_SetDoubloonDannyStateStanding = L0_0
L0_0 = false
PlayerInA1Volume = L0_0
L0_0 = false
PlayerInA2Volume = L0_0
function L0_0()
  PlayerInA1Volume = false
  Disable("potw_zoneh_trans1.Trigger_CameraOverride A1")
  Wait(0.1)
  Enable("potw_zoneh_trans1.Trigger_CameraOverride A2")
  Wait(0.1)
  if PlayerInA2Volume == false then
    Enable("potw_zoneh_trans1.Trigger_CameraOverride A1")
    ClearAllCameraAttributesTimed(1)
  end
end
PotW_ZoneH_ExitA1 = L0_0
function L0_0()
  PlayerInA2Volume = false
  Disable("potw_zoneh_trans1.Trigger_CameraOverride A2")
  Wait(0.1)
  Enable("potw_zoneh_trans1.Trigger_CameraOverride A1")
  Wait(0.1)
  if PlayerInA1Volume == false then
    Enable("potw_zoneh_trans1.Trigger_CameraOverride A2")
    ClearAllCameraAttributesTimed(1)
  end
end
PotW_ZoneH_ExitA2 = L0_0
function L0_0()
  PlayerInA1Volume = true
  SetCameraAttributes("potw_zoneh_trans1.Trigger_CameraOverride A1")
  Disable("potw_zoneh_trans1.Trigger_CameraOverride A2")
end
PotW_ZoneH_EnterA1 = L0_0
function L0_0()
  PlayerInA2Volume = true
  SetCameraAttributes("potw_zoneh_trans1.Trigger_CameraOverride A2")
  Disable("potw_zoneh_trans1.Trigger_CameraOverride A1")
end
PotW_ZoneH_EnterA2 = L0_0
function L0_0()
  SetDefaultCameraValues(7.5, 25, -22)
  SetTravelCameraValues(9, 30, -26)
end
PotW_ZoneH_ChangeDefaultCamSettings = L0_0
function L0_0()
  ResetDefaultCameraValues()
  ResetTravelCameraValues()
end
PotW_ZoneH_ResetDefaultCamSettings = L0_0
function L0_0()
  AnimGBSequence("potw_zoneh_dynamic.AnimGate 02", "Opening")
  Wait(1.567)
  AnimGBSequence("potw_zoneh_dynamic.AnimGate 02", "Opened")
end
PotW_ZoneH_Gate2Opened = L0_0
function L0_0()
  DisableGuardianHint("potw_zoneh_scripting.PlayerHintMarkers 04")
end
potw_ride_HintDisableLastGate = L0_0
function L0_0()
  DisableGuardianHint("potw_zoneh_scripting.PlayerHintMarkers 06")
  EnableGuardianHint("potw_zoneh_scripting.PlayerHintMarkers 04")
end
potw_ride_HintDisableMainGate = L0_0
function L0_0()
  EnableGuardianHint("potw_zoneh_scripting.PlayerHintMarkers 06")
end
potw_ride_HintEnableLastGate = L0_0
function L0_0(A0_11)
  if A0_11 == GetPlayer() then
    FreezeCamera()
  end
end
potw_DeathFreeze = L0_0
