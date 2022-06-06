local L0_0, L1_1
L0_0 = 0
GV_ZoneA_Tiestow = L0_0
function L0_0()
  SetMap(nil, "MAP_GV_ZONEA", "GAME")
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
  DisableGuardianSystem()
end
GV_ZoneA_MiscSetup = L0_0
function L0_0()
  SetGlobal("GV_zoneA_GremlinTiestow", 1)
end
GV_ZoneA_TiestowOn = L0_0
function L0_0()
  SetGlobal("GV_zoneA_GremlinTiestow", 0)
end
GV_ZoneA_TiestowOff = L0_0
function L0_0()
  Print("################# Pipe 01 Painted")
  SetGlobal("GV_ZoneA_Pipe01", 1)
end
GV_ZoneA_Pipe01GlobalOn = L0_0
function L0_0()
  Print("################# Pipe 01 Thinned")
  SetGlobal("GV_ZoneA_Pipe01", 0)
end
GV_ZoneA_Pipe01GlobalOff = L0_0
function L0_0()
  FireSequence("gremlinvillage_zonea.GusConversationTrigger", "GV_ZoneA_SchoolPipeFixed")
  Print("################# Pipe 02 Painted")
  SetGlobal("GV_ZoneA_Pipe02", 1)
end
GV_ZoneA_Pipe02GlobalOn = L0_0
function L0_0()
  Print("################# Pipe 02 Thinned")
  SetGlobal("GV_ZoneA_Pipe02", 0)
end
GV_ZoneA_Pipe02GlobalOff = L0_0
function L0_0()
  Print("################# Pipe 03 Painted")
  SetGlobal("GV_ZoneA_Pipe03", 1)
end
GV_ZoneA_Pipe03GlobalOn = L0_0
function L0_0()
  Print("################# Pipe 03 Thinned")
  SetGlobal("GV_ZoneA_Pipe03", 0)
end
GV_ZoneA_Pipe03GlobalOff = L0_0
function L0_0()
  Print("################# Pipe 04 Painted")
  SetGlobal("GV_ZoneA_Pipe04", 1)
end
GV_ZoneA_Pipe04GlobalOn = L0_0
function L0_0()
  Print("################# Pipe 04 Thinned")
  SetGlobal("GV_ZoneA_Pipe04", 0)
end
GV_ZoneA_Pipe04GlobalOff = L0_0
function L0_0()
  Print("################# Toon Wheel Painted")
  SetGlobal("GV_ZoneA_ToonWheel", 1)
end
GV_ZoneA_ToonWheelGlobalOn = L0_0
function L0_0()
  FireSequence("gremlinvillage_zonea.GusConversationTrigger", "GV_ZoneA_GusChoiceReact01")
  Print("################# Toon Wheel Thinned")
  SetGlobal("GV_ZoneA_ToonWheel", 0)
end
GV_ZoneA_ToonWheelGlobalOff = L0_0
function L0_0()
  Print("####################### ENTRY INTO GV")
  GV_ZoneA_MiscSetup()
  SaveCheckpoint(GetPlayer(), "GV_ZoneA_LoadCheckPoint", "gremlinvillage_zonea.CheckPointMarker 01")
  GV_ZoneA_IntroChat()
end
GV_ZoneA_EntryIntoGV = L0_0
L0_0 = false
GV_ZoneA_NoIntro = L0_0
function L0_0()
  if GV_ZoneA_NoIntro == false then
    MoveToEntity("gremlinvillage_zonea_dynamic.Ability_AllTheBasics", GetPlayer())
    GetPrefabData("GV_ZoneA_ProjectorStart").MapLoad_SetupPosition = "True"
    OnMapLoad_ProjectorSetup("GV_ZoneA_ProjectorStart")
    ActivateScene("Environments/thepark/fantasyLand/SmallWorld/GSA/GV_ZoneA_airlock.gsa")
  end
end
GV_ZoneA_Intro_Launcher = L0_0
function L0_0(A0_2)
  SaveCheckpoint(GetPlayer(), "GV_ZoneA_LoadCheckPoint", A0_2)
end
GV_ZoneA_SaveCheckpoint = L0_0
function L0_0()
  GV_ZoneA_SaveCheckpoint("gremlinvillage_zonea.CheckPointMarker_Middle")
end
GV_ZoneA_MiddleCheckPoint = L0_0
function L0_0()
  GV_ZoneA_NoIntro = true
  GV_ZoneA_MiscSetup()
  if GetGlobal("GV_ZoneA_CombatTraining") == 1 then
    ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "GV_ZoneA_CombatDoorShut", 14)
  end
  if GetGlobal("GV_ZoneA_ExitOpened") == 1 then
    DestroyEntity("gv_zonea_airlock.PlaneTrigger_Combat")
    Enable("gv_zonea_airlock_audio.Trigger_Portal")
    Disable("GV_ZoneA_Airlock_OswaldSpawner")
    DestroyEntity("gv_zonea_airlock.AI_Oswald 01")
    DestroyEntity("gremlinvillage_zonea.GV_ZoneA_Door02 01")
    DestroyEntity("gremlinvillage_zonea.GV_ZoneF_Valve_Inert01 01")
    AnimGBSequence("gv_zonea_airlock.GV_ZoneB_EntryDoorA1 01", "Open2")
    SetNextPatrolNode("gv_zoneb_dynamic.SpatterMelee 04", "gv_zoneb_ai.PN_BoothLoop01")
    SetNextPatrolNode("gv_zoneb_dynamic.SpatterMelee 06", "gv_zoneb_ai.PN_BoothLoop04 01")
  end
  if GetGlobal("GV_ZoneA_Pipe04") == 1 and GetGlobal("GV_ZoneA_Pipe03") == 1 and GetGlobal("GV_ZoneA_Pipe02") == 1 and GetGlobal("GV_ZoneA_Pipe01") == 1 then
    ForEachEntityInGroup(DestroyEntity, "GV_ZoneA_FinalBarrier")
  end
  ActivateScene("Environments/thepark/fantasyLand/SmallWorld/GSA/GV_ZoneA_airlock.gsa")
  DisableGuardianSystem()
  if GetGlobal("GV_ZoneA_FrontDoorBlocker") == 1 then
    DestroyEntity("gremlinvillage_zonea.GV_ZoneA_SM01_Inert 01")
    FireThread(AnimGBSequence, "GV_ZoneA_FrontDoorGeo", "CloseBroken")
  end
  if GetGlobal("GV_ZoneA_TiestowSeesPlayer_Played") == 1 then
    DestroyEntity("gremlinvillage_zonea.GV_ZoneA_SM01_Inert 01")
    DisableMotion("gremlinvillage_zonea.Gremlin_Variant4 01")
    DestroyEntity("gremlinvillage_zonea.Gremlin_Variant4 01")
    DestroyEntity("gremlinvillage_zonea.Trigger 02")
    DestroyEntity("gremlinvillage_zonea.SpatterMelee 01")
  else
    GetPrefabData("GV_ZoneA_IntroCamStart").shotOrder = "first"
    GV_ZoneA_IntroChat()
  end
  if GetGlobal("GV_ZoneA_DoorBroken_Played") == 1 then
    DestroyEntity("gremlinvillage_zonea.NOS_HM_GearA3_Inert 01")
    AnimGBSequence("GV_ZoneA_FrontDoorGeo", "RestBroken")
  elseif GetGlobal("GV_ZoneA_DoorFixed_Played") == 1 then
    ForEachEntityInGroup(ForcePainted, "GV_ZoneA_FrontGearCluster02")
    AnimGBSequence("GV_ZoneA_FrontDoorGeo", "RestOpen")
    DestroyEntity("gremlinvillage_zonea.Trigger 02")
    AudioPostEventOn(GetPlayer(), "Set_State_AMB_GV_Slalom_Active")
  end
  if GetGlobal("GV_ZoneA_GusSteam2_Played") == 1 then
    DestroyEntity("gremlinvillage_zonea.Trigger 03")
    DestroyEntity("gremlinvillage_zonea.SpatterMelee 02")
    DestroyEntity("gremlinvillage_zonea.TriggerRotate 01")
    DestroyEntity("GV_ZoneA_ChoiceTrigger")
  end
  if GetGlobal("GV_ZoneA_Pipe01") == 1 then
    Print("################################## Pipe 01 Painted")
    ForcePainted("gremlinvillage_zonea.GV_SteamPipeB1_Toon 01")
  end
  if GetGlobal("GV_ZoneA_Pipe02") == 1 then
    Print("################################## Pipe 02 Painted")
    ForcePainted("gremlinvillage_zonea.GV_SteamPipeB1_Toon 02")
  end
  if GetGlobal("GV_ZoneA_Pipe03") == 1 then
    Print("################################## Pipe 03 Painted")
    ForcePainted("gremlinvillage_zonea_static.GV_SteamPipeB1_Toon 03")
  end
  if GetGlobal("GV_ZoneA_Pipe04") == 1 then
    Print("################################## Pipe 04 Painted")
    ForcePainted("gremlinvillage_zonea_static.GV_SteamPipeB1_Toon 04")
  end
  if GetGlobal("GV_ZoneA_ToonWheel") == 1 then
    Print("################################## Toon Wheel Painted")
    ForcePainted("gremlinvillage_zonea.GV_GearA1_Inert 01")
  end
end
GV_ZoneA_LoadCheckPoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "GV_ZoneA_CombatAreaReset", "gremlinvillage_zonea.PositionMarker 06")
end
GV_ZoneA_CombatAreaCheckpoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "GV_ZoneA_LoadCheckPoint", "gremlinvillage_zonea.PositionMarker 06")
end
GV_ZoneA_ConceptArtCheckPoint = L0_0
function L0_0()
  DeactivateScene("Environments/thepark/fantasyLand/SmallWorld/GSA/GV_ZoneA.gsa")
  ActivateScene("Environments/thepark/fantasyLand/SmallWorld/GSA/GV_ZoneB.gsa")
  StreamZones(GetPlayer(), "stream_2")
  GV_ZoneA_MiscSetup()
  Disable("gv_zonea_airlock.PlaneTrigger_Combat")
  DestroyEntity("gv_zonea_airlock.PlaneTrigger_Combat")
  DestroyEntity("gremlinvillage_zonea.GV_ZoneA_Door02 02")
  DestroyEntity("gremlinvillage_zonea.GV_ZoneA_Door02 01")
  DestroyEntity("gv_zonea_airlock.pickup_collectible 01.Pin")
  ForEachEntityInGroup(DestroyEntity, "GV_ZoneA_FinalBarrier")
  AudioPostEventOn("gv_zonea_airlock_audio.Sound_Marker_SteamHazard 01", "Stop_sfx_GV_Steam_LP")
  AnimGBSequence("gv_zonea_airlock.GV_ZoneB_EntryDoorA1 01", "Open2")
end
GV_ZoneA_ConceptCheckPointSave = L0_0
function L0_0()
  Print("************************** GV_ZoneA_CombatAreaReset")
  GV_ZoneA_MiscSetup()
  Disable("gv_zonea_airlock.PlaneTrigger_Combat")
  DestroyEntity("gv_zonea_airlock.PlaneTrigger_Combat")
  GV_ZoneA_CombatTraining01()
end
GV_ZoneA_CombatAreaReset = L0_0
function L0_0()
  FireUser1("GV_ZoneA_IntroCamStart")
  Wait(0.7)
  MoveToEntity(GetPlayer(), "gremlinvillage_zonea.PositionMarker 12")
  AnimVarInt("gremlinvillage_zonea.Gremlin_Variant4 01", VAR_Mood_Type, MOOD_Positive)
end
GV_ZoneA_IntroChat = L0_0
function L0_0()
  local L0_3, L1_4
  L0_3 = "gremlinvillage_zonea.Gremlin_Variant4 01"
  L1_4 = ExitCutscene
  L1_4(L0_3)
  L1_4 = Wait
  L1_4(0.5)
  L1_4 = FireThread
  L1_4(TeleportGremlinToEntity, L0_3, "gremlinvillage_zonea.PositionMarker 13", true, false)
  L1_4 = DisableMotion
  L1_4(L0_3)
  L1_4 = GetChildEntityByName
  L1_4 = L1_4(L0_3, "GremlinWrench")
  Hide(L1_4)
end
GV_ZoneA_IntroChat02 = L0_0
function L0_0()
  FireUser3("GV_ZoneA_IntroCamDoorGears")
  Wait(1)
  TeleportGremlinToEntity("gremlinvillage_zonea.Gremlin_Variant4 01", "gremlinvillage_zonea.PositionMarker 17")
  DisableMotion("gremlinvillage_zonea.Gremlin_Variant4 01")
end
GV_ZoneA_MoveTiestow = L0_0
function L0_0()
  Wait(1)
  SetNextPatrolNode("gremlinvillage_zonea.Gremlin_Variant4 01", "gremlinvillage_zonea.PatrolNode 08")
end
GV_ZoneA_TiestowFinishedTalking = L0_0
function L0_0()
  FireSequence("gremlinvillage_zonea.GusConversationTrigger", "GV_ZoneA_GusSteam")
end
GV_ZoneA_SteamWarningChat = L0_0
function L0_0()
  FireSequence("gremlinvillage_zonea.GusConversationTrigger", "GV_ZoneA_GusHealth")
end
GV_ZoneA_GusHealth = L0_0
function L0_0()
  FireSequence("gremlinvillage_zonea.GusConversationTrigger", "GV_ZoneA_GusSpatter2")
end
GV_ZoneA_GusSpatter2 = L0_0
function L0_0()
  FireSequence("gremlinvillage_zonea.GusConversationTrigger", "GV_ZoneA_DoubleJump")
end
GV_ZoneA_DoubleJumpWarning = L0_0
L0_0 = 0
GV_ZoneA_FrontDoorBlocker = L0_0
function L0_0()
  if GetGlobal("GV_ZoneA_FrontDoorBlocker") == 0 then
    GV_ZoneA_RaiseDoor01_B()
  end
end
GV_ZoneA_RaiseDoor01 = L0_0
function L0_0()
  SetGlobal("GV_ZoneA_Door01", GetGlobal("GV_ZoneA_Door01") + 1)
  if GetGlobal("GV_ZoneA_Door01") == 1 then
    Print("################### GLOBAL ONE")
    AnimGBSequence("GV_ZoneA_FrontDoorGeo", "ClosePartial")
    AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Cracked")
    AudioPostEventOn("gremlinvillage_zonea_audio.Sound_Marker_FirstDoor 01", "Play_sfx_GV_Slalom_DoorWrench")
  elseif GetGlobal("GV_ZoneA_Door01") == 2 then
    SetGlobal("GV_ZoneA_FrontDoorBlocker", 1)
    FireUser1("GV_ZoneA_FrontDoorOpen01")
    ForEachEntityInGroup(SetRotatorMaxSpeed, "GV_ZoneA_FrontGearCluster02", 45)
    MultiPosSoundStart("gremlinvillage_zonea.Sound_Marker_Gears_DoorMed_Controller")
    Wait(1)
    AnimGBSequence("GV_ZoneA_FrontDoorGeo", "Open")
    AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Open")
    AudioPostEventOn(GetPlayer(), "Set_State_AMB_GV_Slalom_Active")
  end
end
GV_ZoneA_RaiseDoor01_B = L0_0
function L0_0()
  Wait(1)
  AudioPostEventOn("gremlinvillage_zonea_audio.Sound_Marker_FirstDoor 01", "Play_sfx_GV_Slalom_Evnt_GearDoor_Open_Start")
  AnimGBSequence("GV_ZoneA_FrontDoorGeo", "Open")
  AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Open")
  AudioPostEventOn(GetPlayer(), "Set_State_AMB_GV_Slalom_Active")
end
GV_ZoneA_RaiseDoor02STOP = L0_0
function L0_0()
  StimulusSphere(nil, ST_KNOCKBACK, 1, GetPosition("gremlinvillage_zonea.PositionMarker 20"), 1)
end
GV_ZoneA_FirstSpatterKnockDown = L0_0
function L0_0()
  if GetGlobal("GV_ZoneA_FrontDoorBlocker") == 0 then
    SetGlobal("GV_ZoneA_GearSmashed", 1)
    ForEachEntityInGroup(StartEmitters, "GV_ZoneA_FrontSparks")
  end
end
GV_ZoneA_GearSmash = L0_0
function L0_0()
  if GetGlobal("GV_ZoneA_FrontDoorBlocker") == 0 then
    Wait(0.1)
    FireUser1("GV_ZoneA_FrontDoorOpen01")
    AudioPostEventOn(GetPlayer(), "Set_State_AMB_GV_Slalom_Active")
    ForEachEntityInGroup(Unhide, "GV_ZoneA_FrontDoorSteam")
    Wait(0.1)
    FireThread(AnimGBSequence, "GV_ZoneA_FrontDoorGeo", "CloseBroken")
    AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Cracked")
    Wait(1)
    ForEachEntityInGroup(Hide, "GV_ZoneA_FrontDoorSteam")
    AudioPostEventOn(GetPlayer(), "Set_State_AMB_GV_Slalom_Active")
    ForEachEntityInGroup(Unhide, "GV_ZoneA_FrontDoorSteam")
    ForEachEntityInGroup(StartEmitters, "GV_ZoneA_SecondSteamFrontDoor")
    Wait(1)
    ForEachEntityInGroup(StopEmitters, "GV_ZoneA_SecondSteamFrontDoor")
    ForEachEntityInGroup(Hide, "GV_ZoneA_FrontDoorSteam")
    Wait(1)
    ForEachEntityInGroup(StartEmitters, "GV_ZoneA_BrokenDoorSparks")
    SetGlobal("GV_ZoneA_FrontDoorBlocker", 1)
  end
end
GV_ZoneA_DoorBreak = L0_0
function L0_0()
  FireThread(TeleportGremlinOut, "gremlinvillage_zonea.Gremlin_Variant4 01")
  Wait(1)
  ClearNextPatrolNode("gremlinvillage_zonea.Gremlin_Variant4 01")
  Wait(0.1)
  DestroyEntity("gremlinvillage_zonea.Gremlin_Variant4 01")
  ShowHud()
  StreamInterior(nil, "stream_atob_airlock")
  SaveCheckpoint(GetPlayer(), "GV_ZoneA_LoadCheckPoint", "gremlinvillage_zonea.CheckPointMarker 01")
end
GV_ZoneA_HideTiestow = L0_0
function L0_0()
  SetGlobal("GV_ZoneA_Door01", GetGlobal("GV_ZoneA_Door01") - 1)
  Disable("gremlinvillage_zonea.Trigger 06")
  if GetGlobal("GV_ZoneA_Door01") == 1 then
    SetSplineFollowerInitialSpeed("gremlinvillage_zonea.GV_ZoneA_FirstDoorTop", 1)
    SetSplineFollowerInitialSpeed("gremlinvillage_zonea.FirstDoorBottom", 1)
    SplineFollower_StopAtPosition("gremlinvillage_zonea.GV_ZoneA_FirstDoorTop", "gremlinvillage_zonea.FrontDoorKnot02", "gremlinvillage_zonea.FrontDoorKnot03", 0)
    SplineFollower_StopAtPosition("gremlinvillage_zonea.FirstDoorBottom", "gremlinvillage_zonea.FrontDoorKnot04", "gremlinvillage_zonea.FrontDoorKnot05", 0)
    Disable("gremlinvillage_zonea.CameraTrigger 01")
  elseif GetGlobal("GV_ZoneA_Door01") == 0 and GetGlobal("GV_ZoneA_FrontDoorBlocker") == 0 then
    AnimGBSequence("GV_ZoneA_FrontDoorGeo", "Rest")
    AudioPostEventOn("GV_ZoneA_FrontDoorGeo", "Play_sfx_GV_Slalom_Evnt_GearDoor_Open_End")
  end
end
GV_ZoneA_LowerDoor01 = L0_0
function L0_0()
  if GetGlobal("GV_ZoneA_DoorBroken_Played") == 1 then
    AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Open")
  elseif GetGlobal("GV_ZoneA_DoorFixed_Played") == 1 then
    AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Cracked")
  else
    AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Closed")
  end
end
GV_ZoneA_SetCheckpointAudio = L0_0
function L0_0()
  if GetGlobal("GV_ZoneA_GearSmashed") == 1 then
    DestroyEntity("GV_ZoneA_FrontGearLeft")
    DestroyEntity("GV_ZoneA_FrontGearRight")
  end
  AnimEvent("gremlinvillage_zonea.SpatterMelee 01", EVENT_Start_SpottedTarget)
  Wait(1)
  EnableMotion("gremlinvillage_zonea.SpatterMelee 01")
  Wait(0.1)
  SetNextPatrolNode("gremlinvillage_zonea.SpatterMelee 01", "gremlinvillage_zonea.PatrolNode 19")
  Wait(3)
  SetNextPatrolNode("gremlinvillage_zonea.SpatterMelee 01", "gremlinvillage_zonea.PatrolNode 09")
  MoveToEntity(GetPlayer(), "gremlinvillage_zonea.PositionMarker 20")
  DestroyEntity("gremlinvillage_zonea.PositionMarker 20")
  wait(5)
  DestroyEntity("gremlinvillage_zonea.SpatterMelee 01")
end
GV_SpatterIntro01 = L0_0
function L0_0()
  FireUser1("GV_ZoneA_DoorEndCam")
  wait(0.7)
  MoveToEntity(GetPlayer(), "gremlinvillage_zonea.PositionMarker_MickeyEntryFinished")
  GV_ZoneA_TiestowThanksDoor01()
end
GV_ZoneA_ShutDownDoorIGC = L0_0
function L0_0()
  if GetGlobal("GV_ZoneA_GearSmashed") == 0 then
    EnableMotion("gremlinvillage_zonea.Gremlin_Variant4 01")
    FireSequence("gremlinvillage_zonea.Gremlin_Variant4 01", "GV_ZoneA_DoorFixed")
  elseif GetGlobal("GV_ZoneA_GearSmashed") == 1 then
    EnableMotion("gremlinvillage_zonea.Gremlin_Variant4 01")
    FireSequence("gremlinvillage_zonea.Gremlin_Variant4 01", "GV_ZoneA_DoorBroken")
  end
end
GV_ZoneA_TiestowThanksDoor01 = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Set_State_AMB_GV_Slalom_Active")
  if GetGlobal("GV_ZoneA_GusSpatter_Played") == 0 then
    FireSequence("gremlinvillage_zonea.Gremlin_Variant4 01", "GV_ZoneA_DoorFixed")
  end
end
GV_SpatterIntro02Temp = L0_0
function L0_0()
  SetGlobal("GV_ZoneA_PipeFix", GetGlobal("GV_ZoneA_PipeFix") + 1)
end
GV_Zone_FixPipes = L0_0
function L0_0()
  SetGlobal("GV_ZoneA_PipeFix", GetGlobal("GV_ZoneA_PipeFix") - 1)
end
GV_Zone_BreakPipes = L0_0
L0_0 = 0
GV_SpatterReset = L0_0
function L0_0(A0_5)
  if GV_SpatterReset == 0 then
    MoveToEntity(A0_5, "gremlinvillage_zonea.SplineKnot 05")
    GV_SpatterReset = 1
  elseif GV_SpatterReset == 1 then
    MoveToEntity(A0_5, "gremlinvillage_zonea.SplineKnot 07")
    GV_SpatterReset = 0
  end
end
GV_ZoneA_SpatterReset = L0_0
function L0_0()
  Disable("gremlinvillage_zonea.SteamTrigger 11")
  Disable("gremlinvillage_zonea.SteamTrigger 03")
  Hide("GV_ZoneA_Steam02")
end
GV_ZoneA_SteamSecondary = L0_0
function L0_0()
  Enable("gremlinvillage_zonea.SteamTrigger 11")
  Enable("gremlinvillage_zonea.SteamTrigger 03")
  Unhide("GV_ZoneA_Steam02")
end
GV_ZoneA_SteamSecondary02 = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "GV_ZoneA_Flush")
  if GetGlobal("GV_ZoneA_Pipe04") == 1 and GetGlobal("GV_ZoneA_Pipe03") == 1 and GetGlobal("GV_ZoneA_Pipe02") == 1 and GetGlobal("GV_ZoneA_Pipe01") == 1 then
    ForEachEntityInGroup(DestroyEntity, "GV_ZoneA_FinalBarrier")
    AudioPostEventOn("gv_zonea_airlock_audio.Sound_Marker_SteamHazard 01", "Stop_sfx_GV_Steam_LP")
  end
  if GetGlobal("GV_ZoneA_CombatTraining") == 0 then
    FireUser1("GV_ZoneA_CombatIntroStart")
    SetGlobal("GV_ZoneA_CheckPointGlobal", 6)
    SetGlobal("GV_ZoneA_CombatTraining", 1)
    Wait(1.5)
    MoveToEntity(GetPlayer(), "gv_zonea_airlock.PositionMarker_MicketStart01")
    Wait(1)
    ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "GV_ZoneA_CombatDoorShut", 4)
    AudioPostEventOn("GV_ZoneA_CombatDoorShut", "Play_sfx_GV_Slalom_CombatDoor_Close")
    Wait(2)
    DeactivateScene("Environments/thepark/fantasyLand/SmallWorld/GSA/GV_ZoneA.gsa")
    StreamZones(GetPlayer(), "stream_2")
    Print("################## STREAM_2 ###############")
    Wait(0.5)
    GV_ZoneA_CombatAreaCheckpoint()
  elseif GetGlobal("GV_ZoneA_CombatTraining") == 1 then
    ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "GV_ZoneA_CombatDoorShut", 20)
    FireUser1("GV_ZoneA_CombatStage02")
  end
  ActivateScene("Environments/thepark/fantasyLand/SmallWorld/GSA/GV_ZoneB.gsa")
end
GV_ZoneA_CombatTraining01 = L0_0
function L0_0()
  Print("################################# AIROCK MOVE 2 ###")
  MoveToEntity(GetPlayer(), "gv_zonea_airlock.PositionMarker_MickeyStart02")
  AudioSetState(GetPlayer(), "Music_State", "Combat")
end
GV_ZoneA_AirlockMoveMickey2 = L0_0
function L0_0()
  EnableMotion("gremlinvillage_zonea.SpatterMelee 05")
  FireUser3("GV_ZoneA_CombatStage02")
  PauseAllAI()
  wait(2)
  UnpauseAllAI()
end
GV_ZoneA_UnfreezeSpatter1 = L0_0
function L0_0(A0_6)
  if GetCurrentTeam(A0_6) == 2 then
    GV_ZoneA_SpatterCountSubtract()
  elseif GetCurrentTeam(A0_6) == 3 then
    GV_ZoneA_SpatterCountAdd()
  end
end
GV_ZoneA_SpatterCount = L0_0
function L0_0()
  SetGlobal("GV_ZoneA_SpatterCount", GetGlobal("GV_ZoneA_SpatterCount") - 1)
end
GV_ZoneA_SpatterCountSubtract = L0_0
function L0_0()
  SetGlobal("GV_ZoneA_SpatterCount", GetGlobal("GV_ZoneA_SpatterCount") + 1)
  GV_ZoneA_SpatterCountMaster()
end
GV_ZoneA_SpatterCountAdd = L0_0
L0_0 = 0
GV_ZoneA_CountMasterPlayed = L0_0
L0_0 = false
GV_ZoneA_SpatterDizzy = L0_0
L0_0 = false
GV_ZoneA_SpatterNeedsPausing = L0_0
function L0_0(A0_7, A1_8)
  if MotionStateEvent_Instigator(A1_8) == A0_7 and MotionStateEvent_State(A1_8) == MT_CHARACTER_KNOCKBACK and GV_ZoneA_SpatterNeedsPausing == true then
    GV_ZoneA_SpatterNeedsPausing = false
    EnterCutscene("gremlinvillage_zonea.SpatterMelee 04")
    GV_ZoneA_SpatterDizzy = true
  end
end
GV_ZoneA_SpatterIdlesAfterGetUp = L0_0
function L0_0()
  if GetGlobal("GV_ZoneA_SpatterCount") == 1 and GV_ZoneA_CountMasterPlayed == 0 then
    FireUser1("GV_ZoneA_CombatIntro02")
    Wait(1.5)
    DisableMotion("gremlinvillage_zonea.SpatterMelee 05")
    MoveToEntity("gremlinvillage_zonea.SpatterMelee 05", "gremlinvillage_zonea.PositionMarker 06")
    MoveToEntity(GetPlayer(), "gremlinvillage_zonea.PositionMarker 09")
    GV_ZoneA_CountMasterPlayed = 1
    FireUser1("GV_ZoneA_PipeSpawner02")
    wait(3)
    StartEmitters("GV_ZoneA_SpatterSteamBlast")
    Wait(1.5)
    StopEmitters("GV_ZoneA_SpatterSteamBlast")
    Wait(3)
  elseif GetGlobal("GV_ZoneA_SpatterCount") == 2 and 0 < GetGlobal("GV_ZoneA_SpattersDead") then
    FireUser1("GV_ZoneA_CameraFinished1")
    wait(0.7)
    TeleportGremlinIn("gv_zonea_airlock.Gremlin_Variant4 01", "gremlinvillage_zonea.PositionMarker 08", false)
    wait(2.3)
  elseif GetGlobal("GV_ZoneA_SpatterCount") == 2 and GetGlobal("GV_ZoneA_SpattersDead") == 0 then
    FireUser1("GV_ZoneA_CameraFinished2_B")
    TeleportGremlinIn("gv_zonea_airlock.Gremlin_Variant4 01", "gremlinvillage_zonea.PositionMarker 08", false)
  end
end
GV_ZoneA_SpatterCountMaster = L0_0
function L0_0()
  AudioPostEventOn("gv_zonea_airlock_audio.Sound_Marker_Steam 01", "Play_sfx_GV_Steam")
  StartEmitters("GV_ZoneA_SpatterSteamKicker01")
  Wait(3)
  DestroyEntity("GV_ZoneA_SpatterSteamKicker01")
  AudioPostEventOn("gv_zonea_airlock_audio.Sound_Marker_Steam 01", "Stop_sfx_GV_Steam")
end
GV_ZoneA_PreKickOut01 = L0_0
function L0_0()
  Wait(0.1)
  StimulusSphere(nil, ST_KNOCKBACK, 1, GetPosition("gremlinvillage_zonea.PositionMarker 16"), 2)
  GV_ZoneA_SpatterNeedsPausing = true
end
GV_ZoneA_KickOut01 = L0_0
function L0_0()
  ForEachEntityInGroup(EnableMotion, "GV_ZoneA_BothSpatters")
  while GV_ZoneA_SpatterDizzy == false do
    wait(0.1)
  end
  ExitCutscene("gremlinvillage_zonea.SpatterMelee 04")
end
GV_ZoneA_REEnable = L0_0
function L0_0()
  SetGlobal("GV_ZoneA_SpatterCount", GetGlobal("GV_ZoneA_SpatterCount") + 1)
  SetGlobal("GV_ZoneA_SpattersDead", GetGlobal("GV_ZoneA_SpattersDead") - 1)
  GV_ZoneA_SpatterCountMaster()
end
GV_ZoneA_SpatterCountDeath = L0_0
function L0_0()
  local L0_9, L1_10
  L0_9 = AudioSetState
  L1_10 = GetPlayer
  L1_10 = L1_10()
  L0_9(L1_10, "Music_State", "Auto")
  L0_9 = DoStinger
  L1_10 = "Stinger_Success"
  L0_9(L1_10, 7)
  L0_9 = MoveToEntity
  L1_10 = GetPlayer
  L1_10 = L1_10()
  L0_9(L1_10, "gremlinvillage_zonea.CheckPointMarker 06")
  L0_9 = "gremlinvillage_zonea.SpatterMelee 04"
  L1_10 = "gremlinvillage_zonea.SpatterMelee 05"
  DisableMotion(L0_9)
  DisableMotion(L1_10)
  MoveToEntity(L0_9, "gremlinvillage_zonea.PositionMarker 07")
  MoveToEntity(L1_10, "gremlinvillage_zonea.PositionMarker 09")
  Wait(2)
  EnableMotion(L0_9)
  SetNextPatrolNode(L0_9, "gremlinvillage_zonea.PatrolNode 15")
  EnableMotion(L1_10)
  SetNextPatrolNode(L1_10, "gremlinvillage_zonea.PatrolNode 15")
  Wait(6)
  FireUser1("GV_ZoneA_TiestowOpensDoor")
end
GV_ZoneA_SpatterDismissPath = L0_0
function L0_0()
  AudioSetState(GetPlayer(), "Music_State", "Auto")
  DoStinger("Stinger_Success", 7)
  MoveToEntity(GetPlayer(), "gremlinvillage_zonea.CheckPointMarker 06")
end
GV_ZoneA_NoSpattersPath = L0_0
function L0_0()
  local L0_11, L1_12
  L0_11 = SetGlobal
  L1_12 = "GV_ZoneA_ExitOpened"
  L0_11(L1_12, 1)
  L0_11 = Print
  L1_12 = "*************************** GV_ZoneA_TiestowOpenExit"
  L0_11(L1_12)
  L0_11 = "gv_zonea_airlock.Gremlin_Variant4 01"
  L1_12 = GetChildEntityByName
  L1_12 = L1_12(L0_11, "GremlinWrench")
  FireThread(TeleportGremlinToEntity, L0_11, "gremlinvillage_zonea.PositionTimFixValve", true, false)
  Wait(0.25)
  GV_ZoneA_PortalOpen1()
  Wait(0.25)
  SetPropertyBool(L0_11, "Is Mover", true)
  wait(0.3)
  DisableMotion(L0_11)
  wait(3)
  EnterCutscene(L0_11, 1)
  Unhide(L1_12)
  Wait(0.5)
  SetRotatorMaxSpeed("gremlinvillage_zonea.GV_ZoneF_Valve_Inert01 01", 300)
  Wait(3)
  EnterCutscene(L0_11, 47)
  SetRotatorMaxSpeed("gremlinvillage_zonea.GV_ZoneF_Valve_Inert01 01", 0)
  Hide(L1_12)
  TeleportGremlinOut(L0_11)
  Wait(1)
  StartFadeOut(0.8)
  wait(0.8)
  if GetGlobal("GV_ZoneA_Pipe04") == 1 and GetGlobal("GV_ZoneA_Pipe03") == 1 and GetGlobal("GV_ZoneA_Pipe02") == 1 and GetGlobal("GV_ZoneA_Pipe01") == 1 then
    wait(0.3)
    GetPrefabData("GV_ZoneA_LookCloseAtOswald").waitStart = 0.3
    FireUser1("GV_ZoneA_LookCloseAtOswald")
    StartFadeInNoHUD()
  else
    GrabCamera("IGC_OswaldSighting_Start", nil, CAMERA_LERP_TRANSITION, 0)
    StartFadeInNoHUD()
    wait(1)
    FireSequence(L0_11, "GV_ZoneA_OpenExit")
  end
end
GV_ZoneA_TiestowOpenExit = L0_0
function L0_0()
  FireSequence("gremlinvillage_zonea.Gremlin_Variant4 01", "GV_ZoneA_TiestowDismisses")
  EnableMotion("gremlinvillage_zonea.SpatterMelee 04")
  SetNextPatrolNode("gremlinvillage_zonea.SpatterMelee 04", "gremlinvillage_zonea.PatrolNode 15")
  Wait(0.1)
  EnableMotion("gremlinvillage_zonea.SpatterMelee 05")
  SetNextPatrolNode("gremlinvillage_zonea.SpatterMelee 05", "gremlinvillage_zonea.PatrolNode 15")
end
GV_ZoneA_TiestowDismiss01 = L0_0
function L0_0()
  DestroyEntity("gremlinvillage_zonea.GV_ZoneF_Valve_Inert01 01")
  Wait(0.7)
  Enable("GV_ZoneA_Airlock_OswaldSpawner")
  Wait(0.2)
  EnterCutscene("gv_zonea_airlock.AI_Oswald 01", 3)
  Disable("GV_ZoneA_Airlock_OswaldSpawner")
  Wait(7.8)
  DestroyEntity("gv_zonea_airlock.AI_Oswald 01")
end
GV_ZoneA_SpawnOswald = L0_0
function L0_0()
  Disable("GV_ZoneA_Airlock_OswaldSpawner")
  Wait(0.1)
  DestroyEntity("gv_zonea_airlock.AI_Oswald 01")
end
GV_ZoneA_DestroyOswald = L0_0
function L0_0()
  SetNextPatrolNode("gv_zoneb_dynamic.SpatterMelee 04", "gv_zoneb_ai.PN_BoothLoop01")
  SetNextPatrolNode("gv_zoneb_dynamic.SpatterMelee 06", "gv_zoneb_ai.PN_BoothLoop04 01")
  AnimGBSequence("gv_zonea_airlock.GV_ZoneB_EntryDoorA1 01", "Open2")
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_TB_Door_Open")
end
GV_ZoneA_ExitDoorOpen = L0_0
function L0_0()
  EnterCutscene("gremlinvillage_zonea.Gremlin_Variant4 01")
  AnimVarInt("gremlinvillage_zonea.Gremlin_Variant4 01", VAR_Cutscene, 1)
  AnimEvent("gremlinvillage_zonea.Gremlin_Variant4 01", EVENT_Start_Cutscene)
end
GV_ZoneA_GremlinTapTest = L0_0
function L0_0()
  local L0_13, L1_14
end
GV_zoneA_GremlinTapTest02 = L0_0
function L0_0()
  ForEachEntityInGroup(Hide, "GV_ZoneA_SteamBarrier01")
  Disable("gremlinvillage_zonea.SteamTrigger 03")
  ResumePatrol("gremlinvillage_zonea.SpatterMelee 02")
  Wait(5)
  ForEachEntityInGroup(Unhide, "GV_ZoneA_SteamBarrier01")
  Enable("gremlinvillage_zonea.SteamTrigger 03")
  DestroyEntity("gremlinvillage_zonea.SpatterMelee 02")
end
GV_ZoneA_SecondSighting = L0_0
function L0_0()
  SetSplineFollowerInitialSpeed("gremlinvillage_zonea.GV_ZoneA_Door02 01", 0.5)
end
GV_ZoneA_PortalOpen1 = L0_0
function L0_0()
  SetSplineFollowerInitialSpeed("gremlinvillage_zonea.GV_ZoneA_Door02 02", 1)
end
GV_ZoneA_PortalOpen2 = L0_0
function L0_0()
  FireUser3("GV_ZoneA_GremlinTreasureCam")
  DestroyEntity("gv_zonea_airlock.Gremlin_Variant4 01")
end
GV_ZoneA_TreasureCamEnd = L0_0
function L0_0()
  FireSequence("gremlinvillage_zonea.GusConversationTrigger", "GV_ZoneB_OopsFailed")
end
GV_ZoneA_TreasureFailCheck = L0_0
L0_0 = 0
GV_ZoneA_Alternator = L0_0
function L0_0()
  if GV_ZoneA_Alternator == 0 then
    ForEachEntityInGroup(StartEmitters, "GV_ZoneA_SteamPuffs_01")
    ForEachEntityInGroup(StopEmitters, "GV_ZoneA_SteamPuffs_02")
    GV_ZoneA_Alternator = GV_ZoneA_Alternator + 1
    if GetGlobal("GV_ZoneA_Pipe03") == 0 then
      StopEmitters("gremlinvillage_zonea.Steam_Blocker_01 02")
      Disable("gremlinvillage_zonea.SteamTrigger 04")
      AudioPostEventOn("gremlinvillage_zonea_audio.Sound_Marker_TimedPipe_2", "Stop_sfx_GV_Steam")
    end
    if GetGlobal("GV_ZoneA_Pipe04") == 0 then
      StartEmitters("gremlinvillage_zonea.Steam_Blocker_01 04")
      Enable("gremlinvillage_zonea.SteamTrigger 05")
      AudioPostEventOn("gremlinvillage_zonea_audio.Sound_Marker_TimedPipe_1", "Play_sfx_GV_Steam")
    end
  elseif GV_ZoneA_Alternator == 1 then
    ForEachEntityInGroup(StopEmitters, "GV_ZoneA_SteamPuffs_01")
    ForEachEntityInGroup(StartEmitters, "GV_ZoneA_SteamPuffs_02")
    GV_ZoneA_Alternator = GV_ZoneA_Alternator - 1
    if GetGlobal("GV_ZoneA_Pipe03") == 0 then
      StartEmitters("gremlinvillage_zonea.Steam_Blocker_01 02")
      Enable("gremlinvillage_zonea.SteamTrigger 04")
      AudioPostEventOn("gremlinvillage_zonea_audio.Sound_Marker_TimedPipe_2", "Play_sfx_GV_Steam")
    end
    if GetGlobal("GV_ZoneA_Pipe04") == 0 then
      StopEmitters("gremlinvillage_zonea.Steam_Blocker_01 04")
      Disable("gremlinvillage_zonea.SteamTrigger 05")
      AudioPostEventOn("gremlinvillage_zonea_audio.Sound_Marker_TimedPipe_1", "Stop_sfx_GV_Steam")
    end
  end
end
GV_ZoneA_SteamAlternate = L0_0
function L0_0()
  StartEmitters("GV_ZoneA_Steam1")
end
GV_ZoneA_EmitterOn = L0_0
function L0_0()
  StopEmitters("GV_ZoneA_Steam1")
end
GV_ZoneA_EmitterOff = L0_0
function L0_0()
  if GetGlobal("GV_ZoneA_Pipe04") == 1 and GetGlobal("GV_ZoneA_Pipe03") == 1 and GetGlobal("GV_ZoneA_Pipe02") == 1 and GetGlobal("GV_ZoneA_Pipe01") == 1 then
    MoveToEntity(GetPlayer(), "GV_ZoneA_MickeyLookAtTreasure")
    FireUser1("GV_ZoneA_GremlinTreasureCam")
  elseif GetGlobal("GV_ZoneA_Pipe04") == 0 or GetGlobal("GV_ZoneA_Pipe03") == 0 or GetGlobal("GV_ZoneA_Pipe02") == 0 or GetGlobal("GV_ZoneA_Pipe01") == 0 then
    FireUser3("GV_ZoneA_LookCloseAtOswald")
    DestroyEntity("gv_zonea_airlock.Gremlin_Variant4 01")
  end
end
GV_ZoneA_TreasureCamera = L0_0
function L0_0()
  AnimGBSequence("GV_ZoneA_FrontDoorGeo", "Rest")
  AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Closed")
end
GV_ZoneA_DoorTest01 = L0_0
function L0_0()
  AnimGBSequence("GV_ZoneA_FrontDoorGeo", "ClosePartial")
  AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Cracked")
end
GV_ZoneA_DoorTest02 = L0_0
function L0_0()
  AnimGBSequence("GV_ZoneA_FrontDoorGeo", "RestPartial")
  AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Cracked")
end
GV_ZoneA_DoorTest03 = L0_0
function L0_0()
  AnimGBSequence("GV_ZoneA_FrontDoorGeo", "Open")
  AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Open")
end
GV_ZoneA_DoorTest04 = L0_0
function L0_0()
  AnimGBSequence("GV_ZoneA_FrontDoorGeo", "RestOpen")
  AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Open")
end
GV_ZoneA_DoorTest05 = L0_0
function L0_0()
  AnimGBSequence("GV_ZoneA_FrontDoorGeo", "PartialClose")
  AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Open")
end
GV_ZoneA_DoorTest06 = L0_0
function L0_0()
  AnimGBSequence("GV_ZoneA_FrontDoorGeo", "CloseBroken")
  AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Open")
end
GV_ZoneA_DoorTest07 = L0_0
function L0_0()
  AnimGBSequence("GV_ZoneA_FrontDoorGeo", "RestBroken")
  AudioPostEventOn(GetPlayer(), "SetMix_sfx_GV_Slalom_Env_Door_Open")
end
GV_ZoneA_DoorTest08 = L0_0
function L0_0()
  SetGlobal("GV_ZoneA_SecondSpatterRunoff", 3)
  SetSplineFollowerInitialSpeed("gremlinvillage_zonea.GV_ZoneA_CogDoor2 01", 5)
  SplineFollower_StopAtPosition("gremlinvillage_zonea.GV_ZoneA_CogDoor2 01", "gremlinvillage_zonea.SplineKnot 09", "gremlinvillage_zonea.SplineKnot 10", 1)
  SetSplineFollowerInitialSpeed("gremlinvillage_zonea.GV_ZoneA_CogDoor1 01", 5)
  SplineFollower_StopAtPosition("gremlinvillage_zonea.GV_ZoneA_CogDoor1 01", "gremlinvillage_zonea.SplineKnot 11", "gremlinvillage_zonea.SplineKnot 12", 1)
end
GV_ZoneA_CloseGearDoor = L0_0
function L0_0()
  SetGlobal("GV_ZoneA_SecondSpatterRunoff", 2)
  SetSplineFollowerInitialSpeed("gremlinvillage_zonea.GV_ZoneA_CogDoor2 01", 5)
  SplineFollower_StopAtPosition("gremlinvillage_zonea.GV_ZoneA_CogDoor2 01", "gremlinvillage_zonea.SplineKnot 09", "gremlinvillage_zonea.SplineKnot 10", 0)
  SetSplineFollowerInitialSpeed("gremlinvillage_zonea.GV_ZoneA_CogDoor1 01", 5)
  SplineFollower_StopAtPosition("gremlinvillage_zonea.GV_ZoneA_CogDoor1 01", "gremlinvillage_zonea.SplineKnot 11", "gremlinvillage_zonea.SplineKnot 12", 0)
end
GV_ZoneA_OpenGearDoor = L0_0
function L0_0()
  AnimGBSequence("gremlinvillage_zonea.Steam_Blocker_01 01", "rest")
end
GV_ZoneA_SteamFixing01 = L0_0
function L0_0()
  AnimGBSequence("gremlinvillage_zonea.Steam_Blocker_01 01", "off")
end
GV_ZoneA_SteamFixing02 = L0_0
function L0_0()
  AnimGBSequence("gremlinvillage_zonea.Steam_Blocker_01 01", "on")
  StartEmitters("gremlinvillage_zonea.Steam_Blocker_01b 01")
  Wait(0.5)
  AnimGBSequence("gremlinvillage_zonea.Steam_Blocker_01 01", "rest")
end
GV_ZoneA_SteamFixing03 = L0_0
function L0_0()
  StartEmitters("gremlinvillage_zonea.Steam_Blocker_01b 01")
end
GV_ZoneA_SteamFixing04 = L0_0
function L0_0()
  StopEmitters("gremlinvillage_zonea.Steam_Blocker_01b 01")
end
GV_ZoneA_SteamFixing04b = L0_0
function L0_0()
  AnimGBSequence("gremlinvillage_zonea.Steam_Blocker_01 01", "on")
end
GV_ZoneA_SteamFixing05 = L0_0
function L0_0()
  ForEachEntityInGroup(SetRotatorMaxSpeed, "GV_ZoneA_FrontGearCluster", 0)
  MultiPosSoundStop("gremlinvillage_zonea.Sound_Marker_Gears_DoorGroup_Controller")
end
GV_ZoneA_FrontGearStop = L0_0
function L0_0()
  ForEachEntityInGroup(SetRotatorMaxSpeed, "GV_ZoneA_FrontGearCluster", 120)
  MultiPosSoundStart("gremlinvillage_zonea.Sound_Marker_Gears_DoorGroup_Controller")
end
GV_ZoneA_FrontGearStart = L0_0
function L0_0()
  if GetGlobal("GV_ZoneA_GearSmashed") == 1 then
    ForEachEntityInGroup(SetRotatorMaxSpeed, "GV_ZoneA_FrontGearCluster", 40)
    MultiPosSoundStart("gremlinvillage_zonea.Sound_Marker_Gears_DoorGroup_Twitch_Controller")
    Wait(0.1)
    ForEachEntityInGroup(SetRotatorMaxSpeed, "GV_ZoneA_FrontGearCluster", -40)
    Wait(0.1)
    ForEachEntityInGroup(SetRotatorMaxSpeed, "GV_ZoneA_FrontGearCluster", 0)
  end
end
GV_ZoneA_FrontGearTwitch = L0_0
function L0_0()
  DestroyEntity("GV_ZoneA_ChoiceTrigger")
end
GV_ZoneA_DestroyChoiceTrigger = L0_0
function L0_0()
  FireUser3("GV_ZoneA_MidObstacle2")
  DestroyEntity("GV_ZoneA_ChoiceTrigger")
  wait(1)
  FireSequence("gremlinvillage_zonea.GusConversationTrigger", "Gus_UI_CameraControl")
end
GV_ZoneA_MiddleObstaclePuzzle_End = L0_0
L0_0 = 0
GV_SlalomAirlock_Tick = L0_0
function L0_0()
  if GV_SlalomAirlock_Tick == 0 then
    Disable("gv_zonea_airlock.TriggerDamageVolume 01")
    StopEmitters("gv_zonea_airlock.Steam_Blocker_01 01")
    GV_SlalomAirlock_Tick = 1
    AudioPostEventOn("gv_zonea_airlock_audio.Sound_Marker_SteamHazard 01", "Stop_sfx_GV_Steam")
  elseif GV_SlalomAirlock_Tick == 1 then
    GV_SlalomAirlock_Tick = 0
    Enable("gv_zonea_airlock.TriggerDamageVolume 01")
    StartEmitters("gv_zonea_airlock.Steam_Blocker_01 01")
    AudioPostEventOn("gv_zonea_airlock_audio.Sound_Marker_SteamHazard 01", "Play_sfx_GV_Steam")
  end
end
GV_SlalomAirlock_Barrier = L0_0
function L0_0()
  StimulusEntityWithAliasInEntityDirectionInRadius("gremlinvillage_zonea.Trigger 10", ST_KNOCKBACK, 667, 0, GetPlayer(), "gremlinvillage_zonea.PositionMarker 09", "")
end
GV_ZoneA_KnockBackTest = L0_0
function L0_0()
  if GetGlobal("GV_ZoneA_FrontDoorBlocker") == 1 then
    ForEachEntityInGroup(SetRotatorMaxSpeed, "GV_ZoneA_PostDoorRightGrp", 30)
    if GetGlobal("GV_ZoneA_GearSmashed") == 0 then
      SetRotatorMaxSpeed("gremlinvillage_zonea.GV_ZoneA_SM01_Inert 01", 30)
      ForEachEntityInGroup(SetRotatorMaxSpeed, "GV_ZoneA_PostDoorLeftGrp", 30)
    end
  end
end
GV_ZoneA_PostDoorPainted01 = L0_0
function L0_0()
  if GetGlobal("GV_ZoneA_FrontDoorBlocker") == 1 then
    ForEachEntityInGroup(SetRotatorMaxSpeed, "GV_ZoneA_PostDoorRightGrp", 0)
    if GetGlobal("GV_ZoneA_GearSmashed") == 0 then
      SetRotatorMaxSpeed("gremlinvillage_zonea.GV_ZoneA_SM01_Inert 01", 0)
      ForEachEntityInGroup(SetRotatorMaxSpeed, "GV_ZoneA_PostDoorLeftGrp", 0)
    end
  end
end
GV_ZoneA_PostDoorThinned01 = L0_0
function L0_0()
  if GetGlobal("GV_ZoneA_FrontDoorBlocker") == 1 then
    ForEachEntityInGroup(SetRotatorMaxSpeed, "GV_ZoneA_PostDoorLeftGrp", 30)
    if GetGlobal("GV_ZoneA_GearSmashed") == 0 then
      SetRotatorMaxSpeed("gremlinvillage_zonea.GV_ZoneA_SM01_Inert 01", 30)
      ForEachEntityInGroup(SetRotatorMaxSpeed, "GV_ZoneA_PostDoorRightGrp", 30)
    end
  end
end
GV_ZoneA_PostDoorPainted02 = L0_0
function L0_0()
  if GetGlobal("GV_ZoneA_FrontDoorBlocker") == 1 then
    ForEachEntityInGroup(SetRotatorMaxSpeed, "GV_ZoneA_PostDoorLeftGrp", 0)
    if GetGlobal("GV_ZoneA_GearSmashed") == 0 then
      SetRotatorMaxSpeed("gremlinvillage_zonea.GV_ZoneA_SM01_Inert 01", 0)
      ForEachEntityInGroup(SetRotatorMaxSpeed, "GV_ZoneA_PostDoorRightGrp", 0)
    end
  end
end
GV_ZoneA_PostDoorThinned02 = L0_0
function L0_0()
  Print("################### COMBAT AUDIO TRIGGER DISABLED ######")
  Disable("gv_zonea_airlock_audio.Trigger_Portal")
end
GV_ZoneA_DisableCombatAudioTrigger = L0_0
function L0_0()
  local L0_15, L1_16
  GV_ZoneA_NoSpattersPath = L0_15
  L0_15 = nil
  GV_ZoneA_ShutDownDoorIGC = L0_15
  L0_15 = nil
  GV_ZoneA_ExitDoorOpen = L0_15
  L0_15 = nil
  GV_ZoneA_CombatTraining01 = L0_15
  L0_15 = nil
  GV_ZoneA_GremlinTapTest = L0_15
  L0_15 = nil
  GV_ZoneA_SteamAlternate = L0_15
  L0_15 = nil
  GV_ZoneA_TiestowThanksDoor01 = L0_15
  L0_15 = nil
  GV_ZoneA_DoubleJumpWarning = L0_15
  L0_15 = nil
  GV_Zone_BreakPipes = L0_15
  L0_15 = nil
  GV_ZoneA_CombatAreaCheckpoint = L0_15
  L0_15 = nil
  GV_ZoneA_SpatterReset = L0_15
  L0_15 = nil
  GV_ZoneA_UnfreezeSpatter1 = L0_15
  L0_15 = nil
  GV_ZoneA_DoorBreak = L0_15
  L0_15 = nil
  GV_ZoneA_SecondSighting = L0_15
  L0_15 = nil
  GV_ZoneA_RaiseDoor01_B = L0_15
  L0_15 = nil
  GV_ZoneA_Pipe03GlobalOn = L0_15
  L0_15 = nil
  GV_ZoneA_GusHealth = L0_15
  L0_15 = nil
  GV_ZoneA_TiestowOn = L0_15
  L0_15 = nil
  GV_ZoneA_EntryIntoGV = L0_15
  L0_15 = nil
  GV_ZoneA_OpenGearDoor = L0_15
  L0_15 = nil
  GV_ZoneA_SteamSecondary = L0_15
  L0_15 = nil
  GV_ZoneA_PostDoorPainted02 = L0_15
  L0_15 = nil
  GV_ZoneA_DestroyOswald = L0_15
  L0_15 = nil
  GV_ZoneA_LowerDoor01 = L0_15
  L0_15 = nil
  GV_ZoneA_GusSpatter2 = L0_15
  L0_15 = nil
  GV_ZoneA_SpatterCountSubtract = L0_15
  L0_15 = nil
  GV_zoneA_GremlinTapTest02 = L0_15
  L0_15 = nil
  GV_ZoneA_MiddleObstaclePuzzle_End = L0_15
  L0_15 = nil
  GV_ZoneA_ConceptCheckPointSave = L0_15
  L0_15 = nil
  GV_SlalomAirlock_Barrier = L0_15
  L0_15 = nil
  GV_ZoneA_RaiseDoor02STOP = L0_15
  L0_15 = nil
  GV_ZoneA_KnockBackTest = L0_15
  L0_15 = nil
  GV_ZoneA_FirstSpatterKnockDown = L0_15
  L0_15 = nil
  GV_ZoneA_EmitterOff = L0_15
  L0_15 = nil
  GV_SpatterIntro02Temp = L0_15
  L0_15 = nil
  GV_ZoneA_PreKickOut01 = L0_15
  L0_15 = nil
  GV_ZoneA_TiestowDismiss01 = L0_15
  L0_15 = nil
  GV_ZoneA_KickOut01 = L0_15
  L0_15 = nil
  GV_ZoneA_LoadCheckPoint = L0_15
  L0_15 = nil
  GV_ZoneA_SaveCheckpoint = L0_15
  L0_15 = nil
  GV_ZoneA_EmitterOn = L0_15
  L0_15 = nil
  GV_ZoneA_PostDoorThinned02 = L0_15
  L0_15 = nil
  GV_ZoneA_Pipe01GlobalOff = L0_15
  L0_15 = nil
  GV_ZoneA_SteamSecondary02 = L0_15
  L0_15 = nil
  GV_ZoneA_REEnable = L0_15
  L0_15 = nil
  GV_ZoneA_TiestowOpenExit = L0_15
  L0_15 = nil
  GV_ZoneA_AirlockMoveMickey2 = L0_15
  L0_15 = nil
  GV_ZoneA_CloseGearDoor = L0_15
  L0_15 = nil
  GV_ZoneA_SpatterDismissPath = L0_15
  L0_15 = nil
  GV_ZoneA_SpatterCountDeath = L0_15
  L0_15 = nil
  GV_ZoneA_CombatAreaReset = L0_15
  L0_15 = nil
  GV_ZoneA_Pipe04GlobalOn = L0_15
  L0_15 = nil
  GV_ZoneA_HideTiestow = L0_15
  L0_15 = nil
  GV_SpatterIntro01 = L0_15
  L0_15 = nil
  GV_ZoneA_TreasureCamEnd = L0_15
  L0_15 = nil
  GV_ZoneA_DoorTest04 = L0_15
  L0_15 = nil
  GV_ZoneA_PortalOpen1 = L0_15
  L0_15 = nil
  GV_ZoneA_SteamFixing01 = L0_15
  L0_15 = nil
  GV_ZoneA_PortalOpen2 = L0_15
  L0_15 = nil
  GV_ZoneA_DoorTest02 = L0_15
  L0_15 = nil
  GV_ZoneA_ConceptArtCheckPoint = L0_15
  L0_15 = nil
  GV_ZoneA_DoorTest05 = L0_15
  L0_15 = nil
  GV_ZoneA_PostDoorPainted01 = L0_15
  L0_15 = nil
  GV_ZoneA_MiscSetup = L0_15
  L0_15 = nil
  GV_ZoneA_Intro_Launcher = L0_15
  L0_15 = nil
  GV_ZoneA_IntroChat = L0_15
  L0_15 = nil
  GV_ZoneA_FrontGearStop = L0_15
  L0_15 = nil
  GV_ZoneA_GearSmash = L0_15
  L0_15 = nil
  GV_ZoneA_IntroChat02 = L0_15
  L0_15 = nil
  GV_ZoneA_DoorTest08 = L0_15
  L0_15 = nil
  GV_ZoneA_ToonWheelGlobalOff = L0_15
  L0_15 = nil
  GV_ZoneA_TreasureCamera = L0_15
  L0_15 = nil
  GV_ZoneA_SteamWarningChat = L0_15
  L0_15 = nil
  GV_ZoneA_SteamFixing04 = L0_15
  L0_15 = nil
  GV_ZoneA_ToonWheelGlobalOn = L0_15
  L0_15 = nil
  GV_ZoneA_SpatterCountMaster = L0_15
  L0_15 = nil
  GV_ZoneA_SpatterCountAdd = L0_15
  L0_15 = nil
  GV_ZoneA_TreasureFailCheck = L0_15
  L0_15 = nil
  GV_ZoneA_DoorTest06 = L0_15
  L0_15 = nil
  GV_ZoneA_PostDoorThinned01 = L0_15
  L0_15 = nil
  GV_ZoneA_DoorTest03 = L0_15
  L0_15 = nil
  GV_ZoneA_SteamFixing03 = L0_15
  L0_15 = nil
  GV_ZoneA_SteamFixing02 = L0_15
  L0_15 = nil
  GV_ZoneA_Pipe02GlobalOff = L0_15
  L0_15 = nil
  GV_ZoneA_DoorTest07 = L0_15
  L0_15 = nil
  GV_ZoneA_Pipe04GlobalOff = L0_15
  L0_15 = nil
  GV_ZoneA_MiddleCheckPoint = L0_15
  L0_15 = nil
  GV_Zone_FixPipes = L0_15
  L0_15 = nil
  GV_ZoneA_Pipe02GlobalOn = L0_15
  L0_15 = nil
  GV_ZoneA_TiestowFinishedTalking = L0_15
  L0_15 = nil
  GV_ZoneA_Pipe03GlobalOff = L0_15
  L0_15 = nil
  GV_ZoneA_FrontGearStart = L0_15
  L0_15 = nil
  GV_ZoneA_SteamFixing04b = L0_15
  L0_15 = nil
  GV_ZoneA_FrontGearTwitch = L0_15
  L0_15 = nil
  GV_ZoneA_MoveTiestow = L0_15
  L0_15 = nil
  GV_ZoneA_RaiseDoor01 = L0_15
  L0_15 = nil
  GV_ZoneA_SpatterCount = L0_15
  L0_15 = nil
  GV_ZoneA_SpawnOswald = L0_15
  L0_15 = nil
  GV_ZoneA_TiestowOff = L0_15
  L0_15 = nil
  GV_ZoneA_Pipe01GlobalOn = L0_15
  L0_15 = nil
  GV_ZoneA_SteamFixing05 = L0_15
  L0_15 = nil
  GV_ZoneA_DestroyChoiceTrigger = L0_15
  L0_15 = nil
  GV_ZoneA_DoorTest01 = L0_15
  L0_15 = nil
  GV_ZoneA_SetCheckpointAudio = L0_15
  L0_15 = nil
  Cleanup_GV_ZoneA = L0_15
end
Cleanup_GV_ZoneA = L0_0
