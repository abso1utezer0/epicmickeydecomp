local L0_0, L1_1
function L0_0()
  SetMap(nil, "MAP_GV_ZONEC", "GAME")
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
end
GV_BoatTrans_MiscSetup = L0_0
function L0_0()
  GV_BoatTrans_MiscSetup()
  EndTrackingCurrentLevelForScoring("GV_ZoneB")
  EnableGuardianHint("gv_boattransfer01.PlayerHintMarker")
  StartTrackingCurrentLevelForScoring("GV_BTAirlock")
  ForceSequence("gv_boattransfer01.GusConversationTrigger", "GV_ZoneB_QuestCleanUp")
  ForceSequence("gv_boattransfer01.GusConversationTrigger", "GV_BT_GusFreakOut")
  wait(0.8)
  MoveToEntity(GetPlayer(), "gv_boattransfer01.PositionMarker 01")
end
GV_BT_GusFirstBark = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("GV_BTAirlock")
end
GV_BT_StopTrackingBT = L0_0
function L0_0()
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_EntranceDoorA1 01", "Close")
  DeactivateScene("Environments/thepark/fantasyLand/SmallWorld/GSA/GV_ZoneB.gsa")
  ActivateScene("Environments/thepark/fantasyLand/SmallWorld/GSA/GV_ZoneC.gsa")
  StreamZones(GetPlayer(), "stream_3")
  wait(2)
  Cleanup_GV_ZoneB2()
end
GV_BT_IntroDoorShut = L0_0
function L0_0()
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "GV_BoatTransfer.GV_RideBoats", 2)
  FireSequence("gv_boattransfer01.GusConversationTrigger", "GV_BoatTrans_Warning1")
  Wait(4)
  FireSequence("gv_boattransfer01.GusConversationTrigger", "GV_BoatTrans_Warning2")
end
GV_BoatTransition_SlowBoats = L0_0
function L0_0()
  SetPropertyFloat("gv_boattransfer01.SplineKnot 18", "BranchPathChance", 0)
end
GV_BoatTransfer_FixBoatPath = L0_0
function L0_0()
  FireSequence("gv_boattransfer01.GusConversationTrigger", "GV_BoatTransfer_BoatDeath")
  SetPropertyFloat("gv_boattransfer01.BoatSK 02", "BranchPathChance", 1)
  SetPropertyFloat("gv_boattransfer01.BoatSK 03", "BranchPathChance", 1)
  SetPropertyFloat("gv_boattransfer01.SplineKnot 20", "BranchPathChance", 1)
end
GV_BoatTransfer_BreakBoatPath = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "GV_BoatTransition_RestartBoats", "gv_boattransfer01.PositionMarker_CheckPointRestart")
  Wait(1)
  SetCameraAttributes("gv_boattransfer01.Marker(CameraOverride) 01")
end
GV_BT_SaveCheckPoint = L0_0
function L0_0()
  Print("########################## BT CHECKPOINT RESTART ###")
  GV_BoatTrans_MiscSetup()
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_EntranceDoorA1 01", "RestClose")
  SetCameraAttributes("gv_boattransfer01.Marker(CameraOverride) 01")
  EnableGuardianHint("gv_boattransfer01.PlayerHintMarker")
  Wait(0.1)
  DestroyEntity("gv_boattransfer01.Trigger 05")
  if GetGlobal("GV_BT_BTDoorOpen") == 2 or GetGlobal("GV_BT_GearDoorKey") == 2 then
    Print("########################## BT DOOR OPEN RESTART")
    AnimGBSequence("gv_boattransfer01.GV_ZoneC_TikiDoor_Inert_RightDoor1 01", "RestOpen")
    AnimGBSequence("gv_boattransfer01.GV_ZoneC_RideBoat 01", "Loop")
    AudioPostEventOn(GetPlayer(), "Set_State_AMB_GV_TB_JungleBoatRide")
    AudioPostEventOn(GetPlayer(), "Play_music_gremlinvillage")
    AudioSetState(GetPlayer(), "Music_State", "Auto")
  else
    MultiPosSoundStart("gv_boattransfer01_audio.Sound_Marker_River_1_Controller")
    MultiPosSoundStart("gv_boattransfer01_audio.Sound_Marker_River_2_Controller")
    MultiPosSoundStart("gv_boattransfer01_audio.Sound_SmallWorld_CONTROLLER")
  end
end
GV_BoatTransition_RestartBoats = L0_0
function L0_0()
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_EntranceDoorA1 01", "Rest")
  Wait(6)
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_EntranceDoorA1 01", "Close")
end
GV_ZoneB_DoorToC = L0_0
function L0_0()
  FireSequence("gv_boattransfer01.GusConversationTrigger", "GV_BoatTrans_Warning2")
end
GV_BoatTransfer_SecondWarning = L0_0
L0_0 = 0
GV_BoatTransfer_Lights = L0_0
L0_0 = 0
GV_BoatTransfer_Light02 = L0_0
L0_0 = 0
GV_BoatTransfer_Light03 = L0_0
function L0_0()
  Print("################################# LIGHTS LIT")
  GV_BoatTransfer_Lights = GV_BoatTransfer_Lights + 1
  if GV_BoatTransfer_Lights == 0 then
    Print("################################# LIGHTS REST")
    AnimGBSequence("gv_boattransfer01.GV_ZoneC_HippoEyes 01", "Rest")
  elseif GV_BoatTransfer_Lights == 1 then
    Print("################################# LIGHTS ON 1")
    AnimGBSequence("gv_boattransfer01.GV_ZoneC_HippoEyes 01", "On_1")
  elseif GV_BoatTransfer_Lights == 2 then
    Print("################################# LIGHTS ON 2")
    AnimGBSequence("gv_boattransfer01.GV_ZoneC_HippoEyes 01", "On_2")
  elseif GV_BoatTransfer_Lights == 3 then
    Print("################################# LIGHTS ON 3")
    AnimGBSequence("gv_boattransfer01.GV_ZoneC_HippoEyes 01", "On_3")
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_HippoA1 01", "Open")
  end
  GV_BoatTransfer_DoorMaster()
end
GV_BoatTransfer_LightAdd = L0_0
function L0_0()
  Print("################################# LIGHTS OFF")
  GV_BoatTransfer_Lights = GV_BoatTransfer_Lights - 1
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_HippoA1 01", "Loop")
  if GV_BoatTransfer_Lights == 0 then
    Print("################################# LIGHTS REST")
    AnimGBSequence("gv_boattransfer01.GV_ZoneC_HippoEyes 01", "Rest")
  elseif GV_BoatTransfer_Lights == 1 then
    Print("################################# LIGHTS ON 1")
    AnimGBSequence("gv_boattransfer01.GV_ZoneC_HippoEyes 01", "On_1")
  elseif GV_BoatTransfer_Lights == 2 then
    Print("################################# LIGHTS ON 2")
    AnimGBSequence("gv_boattransfer01.GV_ZoneC_HippoEyes 01", "On_2")
  elseif GV_BoatTransfer_Lights == 3 then
    Print("################################# LIGHTS ON 3")
    AnimGBSequence("gv_boattransfer01.GV_ZoneC_HippoEyes 01", "On_3")
  end
end
GV_BoatTransfer_LightSubtract = L0_0
function L0_0()
  Unhide("GV_BoatTransfer_Light2")
  GV_BoatTransfer_Light02 = 1
  GV_BoatTransfer_DoorMaster()
end
GV_BoatTransfer_DoorLight2 = L0_0
function L0_0()
  Hide("GV_BoatTransfer_Light2")
  GV_BoatTransfer_Light02 = 0
end
GV_BoatTransfer_DoorLight2Off = L0_0
function L0_0()
  Unhide("GV_BoatTransfer_Light3")
  GV_BoatTransfer_Light03 = 1
  GV_BoatTransfer_DoorMaster()
end
GV_BoatTransfer_DoorLight3 = L0_0
function L0_0()
  Hide("GV_BoatTransfer_Light3")
  GV_BoatTransfer_Light03 = 0
end
GV_BoatTransfer_DoorLight3Off = L0_0
L0_0 = 1
GV_BT_Gear01 = L0_0
L0_0 = 1
GV_BT_Gear02 = L0_0
L0_0 = 1
GV_BT_Gear03 = L0_0
function L0_0()
  StopEmitters("gv_boattransfer01.steam+marker_rotatable 02.SteamJet_Blast")
  GV_BT_Gear01 = 1
end
GV_BT_DoorGear01Painted = L0_0
function L0_0()
  StartEmitters("gv_boattransfer01.steam+marker_rotatable 02.SteamJet_Blast")
  Print("################################ GV_BT_DoorGear01Thinned")
  GV_BT_Gear01 = 0
  GV_BT_GearMaster()
end
GV_BT_DoorGear01Thinned = L0_0
function L0_0()
  StopEmitters("gv_boattransfer01.steam+marker_rotatable 03.SteamJet_Blast")
  GV_BT_Gear02 = 1
end
GV_BT_DoorGear02Painted = L0_0
function L0_0()
  StartEmitters("gv_boattransfer01.steam+marker_rotatable 03.SteamJet_Blast")
  Print("################################ GV_BT_DoorGear02Thinned")
  GV_BT_Gear02 = 0
  GV_BT_GearMaster()
end
GV_BT_DoorGear02Thinned = L0_0
function L0_0()
  GV_BT_Gear03 = 1
  StopEmitters("gv_boattransfer01.steam+marker_rotatable 01.SteamJet_Blast")
end
GV_BT_DoorGear03Painted = L0_0
function L0_0()
  Print("################################ GV_BT_DoorGear03Thinned")
  StartEmitters("gv_boattransfer01.steam+marker_rotatable 01.SteamJet_Blast")
  GV_BT_Gear03 = 0
  GV_BT_GearMaster()
end
GV_BT_DoorGear03Thinned = L0_0
function L0_0()
  if GV_BoatTransfer_Lights == 3 and GetGlobal("GV_BT_BTDoorOpen") == 0 then
    SetGlobal("GV_BT_BTDoorOpen", 1)
    GV_BoatTransfer_DoorKeeper()
  end
end
GV_BoatTransfer_DoorMaster = L0_0
function L0_0()
  if GV_BT_Gear01 == 0 and GV_BT_Gear02 == 0 and GV_BT_Gear03 == 0 and GetGlobal("GV_BT_GearDoorKey") == 0 then
    SetGlobal("GV_BT_GearDoorKey", 1)
    GV_BoatTransfer_DoorKeeper()
  end
end
GV_BT_GearMaster = L0_0
function L0_0()
  Print("################################ GV_BoatTransfer_DoorKeeper")
  if GetGlobal("GV_BT_BTDoorOpen") == 1 or GetGlobal("GV_BT_GearDoorKey") == 1 then
    AudioPostEventOn(GetPlayer(), "Stop_All_Sounds")
    SetGlobal("GV_BT_GearDoorKey", 2)
    SetGlobal("GV_BT_BTDoorOpen", 2)
    AudioPostEventOn(GetPlayer(), "Play_sfx_GV_BT_solve_puzzle")
    GV_BT_SaveCheckPoint()
    FireUser1("GV_BT_PreExitCam")
    AudioPostEventOn(GetPlayer(), "Play_sfx_GV_BT_DoorOpenStinger")
    Wait(0.8)
    if GV_BT_SafePosVar == 1 then
      MoveToEntity(GetPlayer(), "gv_boattransfer01.PositionMarker_MickeySaveLeft")
    elseif GV_BT_SafePosVar == 2 then
      MoveToEntity(GetPlayer(), "gv_boattransfer01.PositionMarker_MickeySaveRight")
    elseif GV_BT_SafePosVar == 0 then
      MoveToEntity(GetPlayer(), "gv_boattransfer01.PositionMarker_MickeyBackSpot")
    end
    FireSequence("gv_boattransfer01.GusConversationTrigger", "Genric Line 16")
    Wait(3.5)
    FireSequence("gv_boattransfer01.GusConversationTrigger", "Genric Line 07")
    AnimGBSequence("gv_boattransfer01.GV_ZoneC_TikiDoor_Inert_RightDoor1 01", "Open")
    Wait(0.5)
    AnimGBSequence("gv_boattransfer01.GV_ZoneC_RideBoat 01", "Dock")
    Wait(6)
    AudioPostEventOn(GetPlayer(), "Play_GV_Ambiance")
    MultiPosSoundStart("gv_boattransfer01_audio.Sound_Marker_River_2_Controller")
    MultiPosSoundStart("gv_boattransfer01_audio.Sound_Marker_River_1_Controller")
    AnimGBSequence("gv_boattransfer01.GV_ZoneC_RideBoat 01", "Loop")
    AudioPostEventOn(GetPlayer(), "Set_State_AMB_GV_TB_JungleBoatRide")
    AudioPostEventOn(GetPlayer(), "Play_music_gremlinvillage")
    AudioSetState(GetPlayer(), "Music_State", "Auto")
  end
end
GV_BoatTransfer_DoorKeeper = L0_0
function L0_0()
  Disable("GV_BoatTransfer_Hippo01SteamTrigger")
  StopEmitters("GV_ZoneA_HippoFX01")
  SetSplineFollowerInitialSpeed("GV_BoatTransfer_Hippo01Inert", 0)
  SetGlobal("GV_BT_BabyHippo", GetGlobal("GV_BT_BabyHippo") + 1)
  GV_BT_CheckMammaHippo()
end
GV_BoatTransfer_StopHippo01 = L0_0
function L0_0()
  Enable("GV_BoatTransfer_Hippo01SteamTrigger")
  StartEmitters("GV_ZoneA_HippoFX01")
  SetSplineFollowerInitialSpeed("GV_BoatTransfer_Hippo01Inert", 1)
  SetGlobal("GV_BT_BabyHippo", GetGlobal("GV_BT_BabyHippo") - 1)
  GV_BT_CheckMammaHippo()
end
GV_BoatTransfer_StartHippo01 = L0_0
function L0_0()
  Disable("GV_BoatTransfer_Hippo02SteamTrigger")
  StopEmitters("GV_ZoneA_HippoFX02")
  SetSplineFollowerInitialSpeed("GV_BoatTransfer_Hippo02Inert", 0)
  SetGlobal("GV_BT_BabyHippo", GetGlobal("GV_BT_BabyHippo") + 1)
  GV_BT_CheckMammaHippo()
end
GV_BoatTransfer_StopHippo02 = L0_0
function L0_0()
  Enable("GV_BoatTransfer_Hippo02SteamTrigger")
  StartEmitters("GV_ZoneA_HippoFX02")
  SetSplineFollowerInitialSpeed("GV_BoatTransfer_Hippo02Inert", 1)
  SetGlobal("GV_BT_BabyHippo", GetGlobal("GV_BT_BabyHippo") - 1)
  GV_BT_CheckMammaHippo()
end
GV_BoatTransfer_StartHippo02 = L0_0
function L0_0()
  Disable("GV_BoatTransfer_Hippo03SteamTrigger")
  StopEmitters("GV_ZoneA_HippoFX03")
  SetSplineFollowerInitialSpeed("GV_BoatTransfer_Hippo03Inert", 0)
  SetGlobal("GV_BT_BabyHippo", GetGlobal("GV_BT_BabyHippo") + 1)
  GV_BT_CheckMammaHippo()
end
GV_BoatTransfer_StopHippo03 = L0_0
function L0_0()
  Enable("GV_BoatTransfer_Hippo03SteamTrigger")
  StartEmitters("GV_ZoneA_HippoFX03")
  SetSplineFollowerInitialSpeed("GV_BoatTransfer_Hippo03Inert", 1)
  SetGlobal("GV_BT_BabyHippo", GetGlobal("GV_BT_BabyHippo") - 1)
  GV_BT_CheckMammaHippo()
end
GV_BoatTransfer_StartHippo03 = L0_0
function L0_0()
  if GetGlobal("GV_BT_BabyHippo") == 3 then
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_HippoA1 01", "Open")
  elseif GetGlobal("GV_BT_BabyHippo") < 3 then
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_HippoA1 01", "Loop")
  end
end
GV_BT_CheckMammaHippo = L0_0
function L0_0()
  AnimGBSequence("gv_boattransfer01.GV_ZoneC_RideBoat 01", "Loop1")
end
GV_BT_BoatAnim01 = L0_0
function L0_0()
  AnimGBSequence("gv_boattransfer01.GV_ZoneC_RideBoat 01", "Rest1")
end
GV_BT_BoatAnim02 = L0_0
function L0_0()
  AnimGBSequence("gv_boattransfer01.GV_ZoneC_RideBoat 01", "Dock1")
end
GV_BT_BoatAnim03 = L0_0
function L0_0()
  AnimGBSequence("gv_boattransfer01.GV_ZoneC_RideBoat 01", "Shink1")
end
GV_BT_BoatAnim04 = L0_0
function L0_0()
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_EntranceDoorA1 01", "Rest")
end
GV_BT_FrontDoorAnim01 = L0_0
function L0_0()
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_EntranceDoorA1 01", "Close")
end
GV_BT_FrontDoorAnim02 = L0_0
function L0_0()
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_EntranceDoorA1 01", "RestClose")
end
GV_BT_FrontDoorAnim03 = L0_0
L0_0 = 0
GV_BT_SafePosVar = L0_0
function L0_0()
  local L1_2
  L1_2 = 0
  GV_BT_SafePosVar = L1_2
end
GV_BT_SafePosSet01 = L0_0
function L0_0()
  local L1_3
  L1_3 = 1
  GV_BT_SafePosVar = L1_3
end
GV_BT_SafePosSet02 = L0_0
function L0_0()
  local L1_4
  L1_4 = 2
  GV_BT_SafePosVar = L1_4
end
GV_BT_SafePosSet03 = L0_0
function L0_0()
  FireUser3("GV_BT_ExitCam01")
  Wait(1)
  SetCameraAttributes("gv_boattransfer01.Marker(CameraOverride) 01")
end
GV_BT_KillExitCam = L0_0
function L0_0()
  local L0_5, L1_6
  GV_BoatTransfer_DoorLight2Off = L0_5
  L0_5 = nil
  GV_BoatTransition_SlowBoats = L0_5
  L0_5 = nil
  GV_BT_StopTrackingBT = L0_5
  L0_5 = nil
  GV_BoatTransfer_StopHippo01 = L0_5
  L0_5 = nil
  GV_BoatTransfer_StopHippo03 = L0_5
  L0_5 = nil
  GV_BoatTransfer_StartHippo02 = L0_5
  L0_5 = nil
  GV_BT_BoatAnim02 = L0_5
  L0_5 = nil
  GV_BT_DoorGear03Painted = L0_5
  L0_5 = nil
  GV_BoatTransfer_DoorKeeper = L0_5
  L0_5 = nil
  GV_BT_BoatAnim01 = L0_5
  L0_5 = nil
  GV_BT_BoatAnim04 = L0_5
  L0_5 = nil
  GV_BoatTransfer_DoorMaster = L0_5
  L0_5 = nil
  GV_BT_SafePosSet03 = L0_5
  L0_5 = nil
  GV_BoatTransfer_BreakBoatPath = L0_5
  L0_5 = nil
  GV_BT_BoatAnim03 = L0_5
  L0_5 = nil
  GV_BT_SafePosSet01 = L0_5
  L0_5 = nil
  GV_BT_GearMaster = L0_5
  L0_5 = nil
  GV_BoatTransfer_FixBoatPath = L0_5
  L0_5 = nil
  GV_BoatTransfer_SecondWarning = L0_5
  L0_5 = nil
  GV_BT_CheckMammaHippo = L0_5
  L0_5 = nil
  GV_BT_FrontDoorAnim01 = L0_5
  L0_5 = nil
  GV_BT_IntroDoorShut = L0_5
  L0_5 = nil
  GV_BoatTransfer_LightSubtract = L0_5
  L0_5 = nil
  GV_BT_DoorGear02Thinned = L0_5
  L0_5 = nil
  GV_BT_SaveCheckPoint = L0_5
  L0_5 = nil
  GV_BT_DoorGear03Thinned = L0_5
  L0_5 = nil
  GV_BT_FrontDoorAnim03 = L0_5
  L0_5 = nil
  GV_BT_DoorGear01Painted = L0_5
  L0_5 = nil
  GV_BoatTransfer_LightAdd = L0_5
  L0_5 = nil
  GV_BoatTransfer_StopHippo02 = L0_5
  L0_5 = nil
  GV_BT_GusFirstBark = L0_5
  L0_5 = nil
  GV_BoatTransfer_DoorLight2 = L0_5
  L0_5 = nil
  GV_BoatTransition_RestartBoats = L0_5
  L0_5 = nil
  GV_BT_SafePosSet02 = L0_5
  L0_5 = nil
  GV_BT_DoorGear02Painted = L0_5
  L0_5 = nil
  GV_BoatTransfer_StartHippo01 = L0_5
  L0_5 = nil
  GV_BoatTransfer_DoorLight3Off = L0_5
  L0_5 = nil
  GV_BT_FrontDoorAnim02 = L0_5
  L0_5 = nil
  GV_BoatTrans_MiscSetup = L0_5
  L0_5 = nil
  GV_BoatTransfer_DoorLight3 = L0_5
  L0_5 = nil
  GV_BoatTransfer_StartHippo03 = L0_5
  L0_5 = nil
  GV_BT_DoorGear01Thinned = L0_5
  L0_5 = nil
  GV_ZoneB_DoorToC = L0_5
  L0_5 = nil
  Cleanup_GV_BoatTransfer01 = L0_5
end
Cleanup_GV_BoatTransfer01 = L0_0
