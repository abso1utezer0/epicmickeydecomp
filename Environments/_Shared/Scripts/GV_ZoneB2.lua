local L0_0, L1_1
function L0_0()
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
  SetMap(nil, "MAP_GV_ZONEB", "GAME")
end
GV_ZoneB_MiscSetup = L0_0
L0_0 = false
GV_ZoneB_NoIntro = L0_0
function L0_0()
  if GetGlobal("GV_ZoneA_TiestowSeesPlayer_Played") == 0 then
    Print("************************** GV_ZoneB_Start_Launcher")
    if GV_ZoneB_NoIntro == false then
      StartFadeOut(0)
      MoveToEntity("gv_zoneb_dynamic.Ability_AllTheBasics", GetPlayer())
      DisableGuardianSystem()
      GV_ZoneB_IntroCutScene()
    end
  end
end
GV_ZoneB_Start_Launcher = L0_0
function L0_0()
  GV_ZoneB_CheckpointSave("gv_zoneb.Mickey_At_Dismisall")
end
GV_ZoneB_ChestOpened_CP = L0_0
function L0_0(A0_2)
  SaveCheckpoint(GetPlayer(), "GV_ZoneB_LoadCheckpoint", A0_2)
end
GV_ZoneB_CheckpointSave = L0_0
function L0_0()
  if GetGlobal("GV_ZoneB_TotalSpatters") == 0 then
    GV_ZoneB_ChestOpened_CP()
  else
    GV_ZoneB_CheckpointSave("gv_zoneb.Position_Intro")
  end
end
GV_ZoneB_CheckpointSave_Concept = L0_0
function L0_0()
  if GetGlobal("GV_ZoneB_TimOutOfBooth") == 1 then
    if GetGlobal("GV_ZoneB_Wrench") == 0 then
      EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_Wrench")
    elseif GetGlobal("GV_ZoneB_DumboFixed") == 1 then
      if GetGlobal("GV_ZoneB_PumpFilled") == 0 then
        EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_Pump")
        EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_BackArea")
      elseif GetGlobal("GV_ZoneB_PumpFilled") == 1 then
        if GetGlobal("GV_ZoneB_RideFixed2_Played") == 0 then
          EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_Teacup")
        elseif GetGlobal("GV_ZoneB_PinCollected") == 0 then
          EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_RedChest")
        end
      elseif GetGlobal("GV_ZoneB_PumpFilled") == 2 then
        EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_TeacupChest")
      end
    else
      EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_Dumbo")
    end
  elseif GetGlobal("GV_ZoneB_PumpFilled") == 2 then
    if GetGlobal("GV_ZoneB_TotalSpatters") == 5 then
      EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_Booth")
    end
  else
    EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_Booth")
  end
end
GV_ZoneB_EnableGuardianSystem = L0_0
function L0_0()
  GV_ZoneB_NoIntro = true
  if GetGlobal("GV_ZoneB_PumpFilled") == 2 then
    DestroyEntity("gv_zoneb.Trigger_PumpTutorial")
    ForceSketched("gv_zoneb_dynamic.GV_ZoneB_Toon02")
    ForceSketched("gv_zoneb_dynamic.GV_ZoneB_Toon03")
  elseif GetGlobal("GV_ZoneB_PumpFilled") == 1 then
    DestroyEntity("gv_zoneb.Trigger_PumpTutorial")
    ForcePainted("gv_zoneb_dynamic.GV_ZoneB_Toon02")
    ForcePainted("gv_zoneb_dynamic.GV_ZoneB_Toon03")
  end
  GV_ZoneB_MiscSetup()
  Unhide("gv_zoneb.GV_ZoneB_EntryDoorA1 01")
  AnimGBSequence("gv_zoneb.GV_ZoneB_EntryDoorA1 01", "Open")
  DestroyEntity("gv_zoneb.Trigger_Intro")
  Disable("gv_zoneb.DumboCamera_Trigger")
  if GetGlobal("GV_ZoneB_TotalSpatters") > 0 then
    SetGlobal("GV_ZoneB_TotalSpatters", 5)
    GV_ZoneB_EnableIntroAI()
    DisableGuardianSystem()
    GuardianPrefab_PopulateGuardians("GuardianSpawner1")
  else
    AnimGBSequence("gv_zoneb_dynamic.GV_ZoneB_RideDoorA1", "Open")
    AudioPostEventOn(GetPlayer(), "Play_sfx_GV_TB_BoatDoors_NEW_Open")
    AudioPostEventOn("gv_zoneb_audio.Sound_Gremlin_Tim_Caged", "Stop_sfx_Gremlin_Tim_Scream")
    Disable("gv_zoneb_audio.Trigger_Tim_Screams")
    Disable("gv_zoneb_audio.Sound_Gremlin_Tim_Caged")
    GuardianPrefab_PopulateGuardians("GuardianSpawner2")
    ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "GV_ZoneB.RideBoats", 2)
    MultiPosSoundStart("gv_zoneb.Sound_Marker_BoatMotor_Controller")
    StartTrackingCurrentLevelForScoring("GV_ZoneB")
    ForEachEntityInGroup(Disable, "GV_ZoneB_PipeSpawnerShutdown")
    ForEachEntityInGroup(DestroyEntity, "GV_ZoneB_Enemies")
    if GetGlobal("GV_ZoneB_ThanksFull_Played") == 1 then
      MoveToEntity("gv_zoneb_dynamic.Gremlin_Variant2 01", "TimPosition_Dumbo")
      SetVulnerability("gv_zoneb_dynamic.Gremlin_Variant2 01", ST_THINNER, 1)
    end
  end
  GV_ZoneB_EnableGuardianSystem()
  GV_ZoneB_CheckpointDumboCleanUp()
  if GetGlobal("GV_ZoneB_TeaCupBroke") == 2 then
    Print("************************GV_ZoneB_LoadCheckpoint GetGlobal('GV_ZoneB_TeaCupBroke') == 2")
    GV_ZoneB_TeaCupCleanUp()
    if GetGlobal("GV_ZoneB_RideFixed2_Played") == 1 then
      Print("************************GV_ZoneB_LoadCheckpoint GetGlobal('GV_ZoneB_RideFixed2_Played') == 2")
      DestroyEntity("GV_ZoneB_TeaCupMachineSteam2")
      DestroyEntity("GV_ZoneB_TeaCupMachineSparks1")
      DestroyEntity("GV_ZoneB_TeaCupMachineSteam1")
      DestroyEntity("GV_ZoneB_TeaCupMachineSparks2")
      AudioPostEventOn("gv_zoneb_audio.Sound_Marker_Machine_TeaCupSparks 01", "Stop_sfx_GV_Sparks_Electric")
      AudioPostEventOn("gv_zoneb_audio.Sound_Marker_Machine_TeaCupSteam 01", "Stop_sfx_GV_Steam")
      AnimGBSequence("gv_zoneb_dynamic.GV_TeaCupRide", "Loop")
      AudioPostEventOn("gv_zoneb_audio.Sound_Teacup", "Play_sfx_GV_TB_Teacup_Working_LP")
      AnimGBSequence("gv_zoneb_dynamic.GV_ZoneB_ControlRoomDoorA1 01", "Open")
      AudioPostEventOn(GetPlayer(), "Play_sfx_GV_TB_RideDoors_Open")
      ForEachEntityInGroup(DestroyEntity, "GV_ZoneB_TCSteamBlast")
    end
    AnimGBSequence("gv_zoneb_dynamic.GV_ZoneB_DumboRideA1 01", "Loop2")
    AudioPostEventOn("gv_zoneb_dynamic.GV_ZoneB_DumboRideA1 01", "Play_sfx_GV_TB_Dumbo_LP2")
  end
  if GetGlobal("GV_ZoneB_TeaCupBroke") == 1 then
    Print("************************GV_ZoneB_LoadCheckpoint GetGlobal('GV_ZoneB_TeaCupBroke') == 1")
    GV_ZoneB_TeaCupCleanUp()
    ForEachEntityInGroup(DestroyEntity, "gv_zoneb_dynamic.TeaCupRide_InvisCollision")
    AnimGBSequence("gv_zoneb_dynamic.GV_TeaCupRide", "Broken")
    AudioPostEventOn("gv_zoneb_audio.Sound_Teacup", "Play_sfx_GV_TB_Teacup_Broken_LP")
    Disable("SteamTriggerDamage_Teacup2")
    DestroyEntity("TeacupFX_Steam02")
    DestroyEntity("gv_zoneb.TeacupCamera_Trigger")
    ForEachEntityInGroup(Enable, "Spawners_TeacupFX_Steam_Broken")
  end
end
GV_ZoneB_LoadCheckpoint = L0_0
function L0_0(A0_3)
  if GetGlobal("GV_ZoneB_GusIntro_Played") == 0 then
    Hide("gv_zoneb.GV_ZoneB_EntryDoorA1 01")
  else
    Unhide("gv_zoneb.GV_ZoneB_EntryDoorA1 01")
  end
end
GV_ZoneB_HideFrontDoor = L0_0
function L0_0()
  FireUser3("IGC_GuardianExplaination")
  wait(0.7)
  GV_ZoneB_CheckpointSave("gv_zoneb.Mickey_At_Dismisall")
end
GV_ZoneB_FreedTimFromBooth_CP = L0_0
function L0_0()
  Print("************************GV_ZoneB_CheckpointCleanUp")
  if GetGlobal("GV_ZoneB_DumboFixed") == 1 then
    Enable("gv_zoneb.DumboCamera_Trigger")
    ForEachEntityInGroup(Disable, "GV_ZoneB_PipeSpawnerShutdown")
    ForEachEntityInGroup(DestroyEntity, "GV_ZoneB_Enemies")
    AnimGBSequence("gv_zoneb_dynamic.GV_ZoneB_DumboRideA1 01", "Start")
    AudioPostEventOn("gv_zoneb_dynamic.GV_ZoneB_DumboRideA1 01", "Play_sfx_GV_TB_Dumbo_LP")
    MultiPosSoundStart("gv_zoneb_dynamic.Sound_Marker_Dumbo_Controller")
    DestroyEntity("GV_ZoneB_DumboMachineSparks")
    DestroyEntity("GV_ZoneB_DumboMachineSteam")
    AudioPostEventOn("gv_zoneb_audio.Sound_Marker_Machine_DumboSparks 01", "Stop_sfx_GV_Sparks_Electric")
    AudioPostEventOn("gv_zoneb_audio.Sound_Marker_Machine_DumboSteam 01", "Stop_sfx_GV_Steam")
    if GetGlobal("GV_ZoneB_DumboFixed") == 1 then
      MoveToEntity("gv_zoneb_dynamic.Gremlin_Variant2 01", "gv_zoneb.TimPosition_TeaCups")
      SetVulnerability("gv_zoneb_dynamic.Gremlin_Variant2 01", ST_THINNER, 1)
    end
  else
    FireUser1("gv_zoneb_dynamic.GV_ZoneB_DumboRideA1 01")
  end
end
GV_ZoneB_CheckpointDumboCleanUp = L0_0
function L0_0()
  Print("************************GV_ZoneB_TeaCupCleanUp")
  if GetGlobal("GV_ZoneB_DumboFixed") == 1 then
    AudioPostEventOn("gv_zoneb_audio.Sound_Marker_Machine_DumboSteam 01", "Stop_sfx_GV_Steam")
  end
end
GV_ZoneB_TeaCupCleanUp = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(1)
  GV_ZoneB_IntroCutScene()
end
GV_ZoneB_EntryDoorShut = L0_0
function L0_0()
  DestroyEntity("gv_zoneb.Trigger_Intro")
  MoveToEntity(GetPlayer(), "gv_zoneb.Position_Intro")
  FireUser1("introFlybyShot1")
  wait(0.2)
  StartFadeInNoHUD(0.8)
  Disable("gv_zoneb.DumboCamera_Trigger")
  GuardianPrefab_PopulateGuardians("GuardianSpawner1")
  FireUser1("gv_zoneb_dynamic.GV_ZoneB_DumboRideA1 01")
  wait(0.7)
  FireThread(GV_ZoneB_EnableGuardianSystem)
  DeactivateScene("Environments/thepark/fantasyLand/SmallWorld/GSA/GV_ZoneA_airlock.gsa")
  ActivateScene("Environments/thepark/fantasyLand/SmallWorld/GSA/GV_boattransfer01.gsa")
  StreamInterior(nil, "stream_boatairlock")
  GV_ZoneB_MiscSetup()
  Wait(8)
  FireThread(GV_ZoneB_Cleanup_GV_ZoneA)
  Unhide("gv_zoneb.GV_ZoneB_EntryDoorA1 01")
  AnimGBSequence("gv_zoneb.GV_ZoneB_EntryDoorA1 01", "Open")
end
GV_ZoneB_IntroCutScene = L0_0
function L0_0()
  Cleanup_GV_ZoneA()
end
GV_ZoneB_Cleanup_GV_ZoneA = L0_0
function L0_0(A0_4)
  AnimVarInt(A0_4, VAR_Mood_Type, MOOD_Positive)
  if GetGlobal("GV_ZoneB_WrenchRecovered_Played") == 0 then
    DisableMotion(A0_4)
    Wait(0.5)
    if 0 < GetGlobal("GV_ZoneB_TotalSpatters") then
      AnimVarInt(A0_4, VAR_NPC_State, 2)
    else
      AnimVarInt(A0_4, VAR_NPC_State, 6)
    end
    if GetGlobal("GV_ZoneB_TimOutOfBooth") == 0 then
      SetPropertyVector(A0_4, "UsableEffectOffset", vector4(0, 0, 1.25), 0)
    end
  elseif GetGlobal("GV_ZoneB_WrenchRecovered_Played") == 1 then
    AnimVarInt(A0_4, VAR_NPC_State, 0)
  end
end
GV_ZoneB_SetupTim = L0_0
function L0_0()
  FireUser4("introFlybyShot4")
  wait(0.81)
  GrabCamera("introShot1End", "gv_zoneb_dynamic.Gremlin_Variant2 01", CAMERA_LERP_TRANSITION, 0)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 3)
  SetLetterbox(0)
  GV_ZoneB_EnableIntroAI()
  wait(2)
  UnrestrictCutSceneInput()
  ShowHud()
  GV_ZoneB_CheckpointSave("gv_zoneb.Position_Intro")
end
GV_ZoneB_EndIntroPan = L0_0
function L0_0()
  Enable("gv_zoneb.Spawner 05")
  Enable("gv_zoneb.Spawner 02")
  Enable("gv_zoneb.Spawner_Seer")
  Wait(0.5)
  SetNextPatrolNode("gv_zoneb.DumboRideSpatter", "gv_zoneb.PatrolNode 35")
  SetNextPatrolNode("gv_zoneb.TeaCupSpatter", "gv_zoneb.PatrolNode 25")
  SetNextPatrolNode("gv_zoneb.Seer", "gv_zoneb_ai.PN_Seer1")
end
GV_ZoneB_EnableIntroAI = L0_0
function L0_0()
  ForEachEntityInGroup(SplineFollower_SetDisabled, "gv_zoneb_dynamic.SpatterMeleeGroup01", true)
  Wait(0.1)
  ForEachEntityInGroup(AI_SetDisabled, "gv_zoneb_dynamic.SpatterMeleeGroup01", false)
end
GV_ZoneB_EnableSpatters = L0_0
function L0_0()
  ForEachEntityInGroup(SplineFollower_SetDisabled, "gv_zoneb_dynamic.SpatterMeleeGroup02", true)
  Wait(0.1)
  ForEachEntityInGroup(AI_SetDisabled, "gv_zoneb_dynamic.SpatterMeleeGroup02", false)
end
GV_ZoneB_EnableSpatters02 = L0_0
function L0_0(A0_5)
  AnimGBReset(A0_5)
  AnimGBSequence(A0_5, "Twitch")
  wait(10)
  if GetGlobal("GV_ZoneB_DumboFixed") == 0 then
    FireUser1(A0_5)
  end
end
GV_ZoneB_DumboTwitch = L0_0
L0_0 = 0
GV_ZoneB_GusPipe = L0_0
function L0_0()
  if GV_ZoneB_GusPipe == 0 then
    FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_GusSawPipe")
    GV_ZoneB_GusPipe = GV_ZoneB_GusPipe + 1
  elseif GV_ZoneB_GusPipe == 1 then
    FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_GusSawPipe02")
    GV_ZoneB_GusPipe = GV_ZoneB_GusPipe + 1
  end
end
GV_ZoneB_GusSawPipe = L0_0
function L0_0(A0_6)
  if GetCurrentTeam(A0_6) == 2 then
    Print("***************GV_ZoneB_TeamChangeMaster  CHANGED TO AI")
    SetGlobal("GV_ZoneB_Friendlies", GetGlobal("GV_ZoneB_Friendlies") - 1)
    GV_ZoneB_Unfriended()
  elseif GetCurrentTeam(A0_6) == 3 then
    Print("***************GV_ZoneB_TeamChangeMaster  CHANGED TO FRIENDLY")
    SetGlobal("GV_ZoneB_Friendlies", GetGlobal("GV_ZoneB_Friendlies") + 1)
    GV_ZoneB_DecrementTotalSpawnCount()
  end
end
GV_ZoneB_TeamChangeMaster = L0_0
function L0_0(A0_7)
  if GetCurrentTeam(A0_7) == 2 then
    Print("***************GV_ZoneB_TeamChangeMaster  CHANGED TO AI")
    GV_ZoneB_DecrementTotalSpawnCount()
  end
end
GV_ZoneB_SpatterDeath = L0_0
function L0_0()
  SetGlobal("GV_ZoneB_TotalSpatters", GetGlobal("GV_ZoneB_TotalSpatters") - 1)
  GV_ZoneB_GremlinHappyMeter()
  GV_ZoneB_TimPuzzleCheck()
end
GV_ZoneB_DecrementTotalSpawnCount = L0_0
function L0_0()
  SetGlobal("GV_ZoneB_TotalSpatters", GetGlobal("GV_ZoneB_TotalSpatters") + 1)
  GV_ZoneB_GremlinHappyMeter()
  GV_ZoneB_TimPuzzleCheck()
end
GV_ZoneB_Unfriended = L0_0
function L0_0()
  if GetGlobal("GV_ZoneB_TotalSpatters") == 3 then
    FireSequence("gv_zoneb_dynamic.Gremlin_Variant2 01", "GV_ZoneB_Solution")
  end
end
GV_ZoneB_GremlinHappyMeter = L0_0
function L0_0()
  ForEachEntityInGroup(SetPropertyFloat, "GV_ZoneB_SpawnerGroup01Enemy", "PatrolSpeed", 7)
  SetNextPatrolNode("gv_zoneb.TeaCupSpatter", "gv_zoneb_ai.PN_Seer5")
  SetNextPatrolNode("gv_zoneb.DumboRideSpatter", "gv_zoneb_ai.PN_Seer8")
end
GV_ZoneB_ActivateSpawners = L0_0
function L0_0()
  if GV_ZoneB_RightValve == 0 then
    Wait(2)
    FireUser1("GV_ZoneB_SpawnerPipeRight")
  end
end
GV_ZoneB_RightSpawnerCheck = L0_0
function L0_0()
  if GV_ZoneB_LeftValve == 0 then
    Wait(2)
    FireUser1("GV_ZoneB_SpawnerPipeLeft")
  end
end
GV_ZoneB_LeftSpawnerCheck = L0_0
L0_0 = 0
GV_ZoneB_RightValve = L0_0
L0_0 = 0
GV_ZoneB_LeftValve = L0_0
L0_0 = 0
GV_ZoneB_ValveNarration = L0_0
function L0_0()
  GV_ZoneB_ValveNarration = GV_ZoneB_ValveNarration + 1
  if GV_ZoneB_ValveNarration == 1 then
    FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_SawPipeComplete")
  elseif GV_ZoneB_ValveNarration == 2 then
    FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_SawPipeComplete02")
  end
end
GV_ZoneB_ValveNarrator = L0_0
function L0_0(A0_8, A1_9)
  Print("***************GV_ZoneB_HitPipeValve")
  if _G["GV_ZoneB_" .. A1_9 .. "Valve"] == 0 then
    Print("***************GV_ZoneB_HitPipeValve   " .. A1_9 .. " = 0")
    AudioPostEventOn(A0_8, "Play_sfx_GV_TB_Faucet_Turn")
    SetRotatorMaxSpeed(A0_8, 250)
    FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_ValveTurn")
    _G["GV_ZoneB_" .. A1_9 .. "Valve"] = 1
    GV_ZoneB_TimPuzzleCheck()
    wait(3)
    SetRotatorMaxSpeed(A0_8, 0)
  elseif _G["GV_ZoneB_" .. A1_9 .. "Valve"] == 1 then
    Print("***************GV_ZoneB_HitPipeValve   " .. A1_9 .. " = 1")
    FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_ValveStuck")
    AudioPostEventOn(A0_8, "Play_sfx_GV_TB_Faucet_Stuck")
  end
end
GV_ZoneB_HitPipeValve = L0_0
function L0_0(A0_10, A1_11)
  AnimEvent(A0_10, EVENT_Start_AngryIdle)
  Wait(3)
  SetNextPatrolNode(A0_10, "gv_zoneb_ai.PN_BoothTaunt" .. A1_11)
end
GV_ZoneB_SpatterTaunt = L0_0
function L0_0()
  SetPropertyFloat("gv_zoneb_ai.PN_BoothLoop04", "BranchProbability", 0)
end
GV_ZoneB_TauntProtectorOn = L0_0
function L0_0()
  SetPropertyFloat("gv_zoneb_ai.PN_BoothLoop04", "BranchProbability", 0.6)
end
GV_ZoneB_TauntProtectorOff = L0_0
function L0_0()
  SetGlobal("GV_ZoneB_GetDownFromThere", 1)
end
GV_ZoneB_GetDown = L0_0
function L0_0()
  SetGlobal("GV_ZoneB_GetDownFromThere", 0)
end
GV_ZoneB_GotDown = L0_0
function L0_0()
  if GetGlobal("GV_ZoneB_TotalSpatters") == 0 then
    GV_ZoneB_SpatterDismissalFull()
  end
end
GV_ZoneB_TimPuzzleCheck = L0_0
function L0_0()
  local L0_12, L1_13
  L0_12 = 0
  function L1_13()
    local L0_14, L1_15
    L0_14 = _UPVALUE0_
    L0_14 = L0_14 + 1
    _UPVALUE0_ = L0_14
  end
  ForEachEntityInGroup(L1_13, "GV_ZoneB_SpawnerGroup01Enemy")
  ForEachEntityInGroup(L1_13, "GV_ZoneB_SpawnerGroup03Enemy")
  Print("Dudes = " .. L0_12)
  return L0_12
end
GV_ZoneB_Count_AliveSpatters = L0_0
L0_0 = false
GV_ZoneB_SpawnerGroup01Enemy_1_Dead = L0_0
L0_0 = false
GV_ZoneB_SpawnerGroup01Enemy_2_Dead = L0_0
L0_0 = false
GV_ZoneB_SpawnerGroup03Enemy_1_Dead = L0_0
L0_0 = false
GV_ZoneB_SpawnerGroup03Enemy_2_Dead = L0_0
function L0_0(A0_16, A1_17)
  local L2_18
  if A1_17 == "1_1" then
    L2_18 = true
    GV_ZoneB_SpawnerGroup01Enemy_1_Dead = L2_18
  elseif A1_17 == "1_2" then
    L2_18 = true
    GV_ZoneB_SpawnerGroup01Enemy_2_Dead = L2_18
  elseif A1_17 == "3_1" then
    L2_18 = true
    GV_ZoneB_SpawnerGroup03Enemy_1_Dead = L2_18
  elseif A1_17 == "3_2" then
    L2_18 = true
    GV_ZoneB_SpawnerGroup03Enemy_2_Dead = L2_18
  end
end
GV_ZoneB_SetDeadFlag = L0_0
L0_0 = 0
AI_Alive = L0_0
function L0_0()
  local L0_19
  L0_19 = "gv_zoneb_dynamic.Gremlin_Variant2 01"
  if GetGlobal("GV_ZoneB_Friendlies") > 0 then
    ForEachEntityInGroup(SetVulnerability, "GV_ZoneB_Enemies", ST_THINNER, 0)
    ForEachEntityInGroup(ClearNextPatrolNode, "GV_ZoneB_Enemies")
    ForEachEntityInGroup(AI_ClearTarget, "GV_ZoneB_Enemies")
    RestrictCutSceneInput()
    StartFadeOut(0.8)
    Wait(0.8)
    AudioPostEventOn("gv_zoneb_audio.Sound_Gremlin_Tim_Caged", "Stop_sfx_Gremlin_Tim_Scream")
    GrabCamera("GV_ZoneB_RideOpCutScene", L0_19, CAMERA_LERP_TRANSITION, 0)
    ForEachEntityInGroup(SetPropertyFloat, "GV_ZoneB_Enemies", "PatrolSpeed", 3, 0)
    ForEachEntityInGroup(SetPropertyInt, "GV_ZoneB_Enemies", "Collision Layer", 7, 0)
    TeleportToEntity(GetPlayer(), "gv_zoneb.Mickey_At_Dismisall")
    if GV_ZoneB_SpawnerGroup01Enemy_1_Dead == false then
      SetNextPatrolNode("gv_zoneb.DumboRideSpatter", "gv_zoneb_ai.MarkerFriendlyDismissal04")
      TeleportToEntity("gv_zoneb.DumboRideSpatter", "gv_zoneb_ai.MarkerFriendlyDismissal04")
      AI_Alive = 1
      DestroyEntity("gv_zoneb.TeaCupSpatter")
      DestroyEntity("gv_zoneb_dynamic.SpatterMelee 04")
      DestroyEntity("gv_zoneb_dynamic.SpatterMelee 06")
      DestroyEntity("gv_zoneb.Seer")
    elseif GV_ZoneB_SpawnerGroup01Enemy_2_Dead == false then
      SetNextPatrolNode("gv_zoneb.TeaCupSpatter", "gv_zoneb_ai.MarkerFriendlyDismissal04")
      TeleportToEntity("gv_zoneb.TeaCupSpatter", "gv_zoneb_ai.MarkerFriendlyDismissal04")
      AI_Alive = 2
      DestroyEntity("gv_zoneb_dynamic.SpatterMelee 04")
      DestroyEntity("gv_zoneb_dynamic.SpatterMelee 06")
      DestroyEntity("gv_zoneb.Seer")
    elseif GV_ZoneB_SpawnerGroup03Enemy_1_Dead == false then
      SetNextPatrolNode("gv_zoneb_dynamic.SpatterMelee 04", "gv_zoneb_ai.MarkerFriendlyDismissal04")
      TeleportToEntity("gv_zoneb_dynamic.SpatterMelee 04", "gv_zoneb_ai.MarkerFriendlyDismissal04")
      AI_Alive = 3
      DestroyEntity("gv_zoneb_dynamic.SpatterMelee 06")
      DestroyEntity("gv_zoneb.Seer")
    elseif GV_ZoneB_SpawnerGroup03Enemy_2_Dead == false then
      SetNextPatrolNode("gv_zoneb_dynamic.SpatterMelee 06", "gv_zoneb_ai.MarkerFriendlyDismissal04")
      TeleportToEntity("gv_zoneb_dynamic.SpatterMelee 06", "gv_zoneb_ai.MarkerFriendlyDismissal04")
      AI_Alive = 4
      DestroyEntity("gv_zoneb.Seer")
    else
      SetNextPatrolNode("gv_zoneb.Seer", "gv_zoneb_ai.MarkerFriendlyDismissal04")
      TeleportToEntity("gv_zoneb.Seer", "gv_zoneb_ai.MarkerFriendlyDismissal04")
      AI_Alive = 5
    end
    wait(0.2)
    AnimEvent("GV_ZoneB_Enemies", EVENT_Start_Cheer)
    wait(0.3)
    SetLetterbox(1)
    StartFadeInNoHUD(0.8)
    Wait(1.5)
    SetPropertyInt("GV_ZoneB_Enemies", "Collision Layer", 4, 0)
  end
  if GetGlobal("GV_ZoneB_Friendlies") > 0 then
    ForceSequence(L0_19, "GV_ZoneB_TimFullDismiss")
  else
    GV_ZoneB_PlayerReadTimDismisall()
    GV_ZoneB_SpatterDismissalFull_Part2()
  end
end
GV_ZoneB_SpatterDismissalFull = L0_0
function L0_0()
  local L0_20, L1_21, L2_22, L3_23, L4_24, L5_25, L6_26
  L0_20 = "gv_zoneb_dynamic.Gremlin_Variant2 01"
  if L1_21 > 0 then
    L1_21(L2_22, L3_23)
    L1_21(L2_22)
    L1_21(L2_22)
    L1_21(L2_22)
    L4_24 = CAMERA_LERP_TRANSITION
    L5_25 = 0
    L1_21(L2_22, L3_23, L4_24, L5_25)
    for L4_24 = 1, 5 do
      if L4_24 < 5 then
        L5_25 = AI_Alive
        if L4_24 == L5_25 then
          L5_25 = ClearNextPatrolNode
          L6_26 = "GV_ZoneB_Enemies"
          L5_25(L6_26)
          L5_25 = Wait
          L6_26 = 0.1
          L5_25(L6_26)
          L5_25 = SetNextPatrolNode
          L6_26 = "GV_ZoneB_Enemies"
          L5_25(L6_26, "gv_zoneb_ai.PN_PipeEntrance")
          L5_25 = Wait
          L6_26 = 0.1
          L5_25(L6_26)
          L5_25 = MoveToEntity
          L6_26 = "GV_ZoneB_Enemies"
          L5_25(L6_26, "gv_zoneb_ai.PN_PipeEntrance")
          L5_25 = GetFacing
          L6_26 = "GV_ZoneB_Enemies"
          L5_25 = L5_25(L6_26)
          L6_26 = GetPosition
          L6_26 = L6_26("gv_zoneb_ai.PN_PipeEntrance")
          SetTransformation("GV_ZoneB_Enemies", L6_26, L5_25)
        end
      elseif L4_24 == 5 then
        L5_25 = AI_Alive
        if L4_24 == L5_25 then
          L5_25 = DestroyEntity
          L6_26 = "gv_zoneb.Seer"
          L5_25(L6_26)
        end
      end
    end
    L1_21(L2_22)
    L1_21(L2_22)
    L1_21(L2_22)
    for L4_24 = 1, 5 do
      if L4_24 < 5 then
        L5_25 = AI_Alive
        if L4_24 == L5_25 then
          L5_25 = GV_ZoneB_SpatterAtPipe
          L6_26 = "GV_ZoneB_Enemies"
          L5_25(L6_26)
        end
      elseif L4_24 == 5 then
        L5_25 = AI_Alive
        if L4_24 == L5_25 then
          L5_25 = ForceSpawn
          L6_26 = "gv_zoneb_dynamic.Spawner_PipeBurst"
          L5_25(L6_26, 1)
          L5_25 = Wait
          L6_26 = 2.5
          L5_25(L6_26)
        end
      end
    end
  end
  L1_21(L2_22, L3_23)
  L1_21(L2_22)
  L4_24 = 6
  L1_21(L2_22, L3_23, L4_24)
end
GV_ZoneB_SpatterDismissalFull_Part2 = L0_0
L0_0 = false
PlayerReadTimDismisall = L0_0
function L0_0()
  local L1_27
  L1_27 = true
  PlayerReadTimDismisall = L1_27
end
GV_ZoneB_PlayerReadTimDismisall = L0_0
function L0_0()
  local L0_28
  L0_28 = Print
  L0_28("*****************************GV_ZoneB_OswaldCutscene")
  L0_28 = Disable
  L0_28("gv_zoneb_audio.Trigger_Tim_Screams")
  L0_28 = Disable
  L0_28("gv_zoneb_audio.Sound_Gremlin_Tim_Caged")
  L0_28 = Enable
  L0_28("gv_zoneb_ai.Spawner_Oswald")
  L0_28 = "gv_zoneb_ai.Oswald"
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "GV_ZoneB.RideBoats", 2)
  MultiPosSoundStart("gv_zoneb.Sound_Marker_BoatMotor_Controller")
  wait(0.75)
  DoStinger("Stinger_Success", 7)
  AnimGBSequence("gv_zoneb_dynamic.GV_ZoneB_RideDoorA1", "Open")
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_TB_BoatDoors_NEW_Open")
  wait(0.25)
  AnimVarInt(L0_28, VAR_Cutscene, 2)
  AnimEvent(L0_28, EVENT_Start_Cutscene)
  wait(2)
  AnimVarInt(L0_28, VAR_Cutscene, 0)
  AnimEvent(L0_28, EVENT_Start_Cutscene)
end
GV_ZoneB_OswaldCutscene = L0_0
L0_0 = 0
GV_ZoneB_BoatPathChangeState = L0_0
function L0_0(A0_29)
  Print("*********************GV_ZoneB_BoatPathChangeState = " .. GV_ZoneB_BoatPathChangeState)
  if GV_ZoneB_BoatPathChangeState == 0 then
    GV_ZoneB_BoatDoorClosed = true
    AnimGBSequence("gv_zoneb_dynamic.GV_ZoneB_RideDoorA1", "Close")
    SplineKnotComponent_SetBranchProbability("gv_zoneb.SK_BoatPath08", 0)
    DestroyEntity("gv_boattransfer01_audio.Plane_Bank_Stream2_Switch")
    AudioPostEventOn(GetPlayer(), "Stop_music_gremlinvillage")
  end
  GV_ZoneB_BoatPathChangeState = GV_ZoneB_BoatPathChangeState + 1
end
GV_ZoneB_BoatPathChange = L0_0
L0_0 = false
GV_ZoneB_BoatDoorClosed = L0_0
function L0_0(A0_30)
  if GV_ZoneB_BoatDoorClosed == true then
    SetSplineFollowerInitialSpeed(A0_30, 0)
  end
end
GV_ZoneB_BoatIntoAirlock = L0_0
function L0_0()
  SetPropertyFloat("gv_zoneb_dynamic.Gremlin_Variant2 01", "UsableRadius", 0)
  MoveToEntity(GetPlayer(), "gv_zoneb.Position_MickeyAtBooth")
  if 0 < GetGlobal("GV_ZoneB_Friendlies") then
    UnrestrictCutSceneInput()
  end
  FireUser3("GV_ZoneB_OswaldBoatCamera02")
  AudioPostEventOn(GetPlayer(), "Stop_music_gremlinvillage")
  wait(0.7)
  ForEachEntityInGroup(DestroyEntity, "GV_ZoneB_Enemies")
  PlayAndUnlockMovie("GV_visit1_Training_Guardians.bik", "GV_Visit1_TrainingGuardian")
  StartFadeOut(0)
  StreamZones(nil, "stream_2_no_ai_SND")
  Wait(0.25)
  EnableGuardianSystem()
  if 0 < GetGlobal("GV_ZoneB_Friendlies") then
    AddHeroPoints(GetPlayer(), 15)
  else
    AddScrapperPoints(GetPlayer(), 15)
  end
  StartFadeIn(0.5)
  Wait(0.5)
  StreamInterior(nil, "stream_boatairlock_SND_B")
  DestroyEntity("gv_zoneb_ai.Oswald")
  SetPropertyFloat("gv_zoneb_dynamic.Gremlin_Variant2 01", "UsableRadius", 2)
  StartTrackingCurrentLevelForScoring("GV_ZoneB")
  GV_ZoneB_CheckpointSave("gv_zoneb.Mickey_At_Dismisall")
  AudioPostEventOn(GetPlayer(), "Play_music_gremlinvillage")
end
GV_ZoneB_GuardianExplaination = L0_0
function L0_0()
  ForceSequence("gv_zoneb_dynamic.Gremlin_Variant2 01", "GV_ZoneB_MickeyBrokeTeacup")
end
GV_ZoneB_ForceTim_AngrySequence = L0_0
function L0_0()
  FireUser1("IGC_TimThanksMickey")
  wait(0.7)
  SetGlobal("GV_ZoneB_TimOutOfBooth", 1)
  DisableGuardianHint("gv_zoneb_dynamic.PlayerHint_Booth")
  if GetGlobal("GV_ZoneB_Wrench") == 0 then
    EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_Wrench")
  else
    EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_Dumbo")
  end
end
GV_ZoneB_Tim_FullThanks = L0_0
function L0_0()
  local L0_31
  L0_31 = _self
  L0_31 = L0_31()
  SetPropertyVector(L0_31, "UsableEffectOffset", vector4(0, 2, 0), 0)
  TeleportGremlinIn(L0_31, "TimPosition_Dumbo", false)
  SetVulnerability(L0_31, ST_THINNER, 1)
end
GV_ZoneB_MoveTimToDumbo = L0_0
L0_0 = false
GV_ZoneB_SpatterInPipeAnim = L0_0
function L0_0(A0_32)
  EnterCutscene(A0_32)
  AnimEvent(A0_32, EVENT_Special_1)
  wait(1.5)
  GV_ZoneB_SpatterInPipeAnim = false
  ForceSpawn("gv_zoneb_dynamic.Spawner_PipeBurst", 1)
  Wait(1)
  DestroyEntity(A0_32)
  wait(1.5)
end
GV_ZoneB_SpatterAtPipe = L0_0
function L0_0(A0_33)
  if GV_ZoneB_SpatterInPipeAnim == false then
    GV_ZoneB_SpatterInPipeAnim = true
    ExitCutscene(A0_33)
    wait(0.1)
    SetPropertyFloat(A0_33, "GroundControlAccelStop", 1000)
    SetNextPatrolNode(A0_33, "gv_zoneb_ai.PN_PipeEntrance")
  else
    EnterCutscene(A0_33)
    AnimEvent(A0_33, EVENT_Start_Cheer)
    Wait(3)
    GV_ZoneB_SpatterAtPipe_Cheer(A0_33)
  end
end
GV_ZoneB_SpatterAtPipe_Cheer = L0_0
L0_0 = 1
GV_ZoneB_RightLowerPipe = L0_0
L0_0 = 0
GV_ZoneB_RightUpperPipe = L0_0
L0_0 = 0
GV_ZoneB_RightMachine = L0_0
L0_0 = 1
GV_ZoneB_RightSpawner = L0_0
L0_0 = 1
GV_ZoneB_LeftLowerPipe = L0_0
L0_0 = 0
GV_ZoneB_LeftUpperPipe = L0_0
L0_0 = 0
GV_ZoneB_LeftMachine = L0_0
L0_0 = 1
GV_ZoneB_LeftSpawner = L0_0
function L0_0()
  FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_FoundWrench")
  SetGlobal("GV_ZoneB_Wrench", 1)
  DisableGuardianHint("gv_zoneb_dynamic.PlayerHint_Wrench")
  EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_Dumbo")
end
GV_ZoneB_FoundWrench = L0_0
function L0_0()
  local L0_34
  L0_34 = "gv_zoneb_dynamic.Gremlin_Variant2 01"
  SetLetterbox(1)
  FireUser1("GV_ZoneB_GremlinFixingDumbo")
  AnimVarInt(L0_34, VAR_NPC_State, 0)
  SetPropertyFloat(L0_34, "UsableRadius", 0)
  TeleportGremlinOut(L0_34)
  FireThread(TeleportGremlinIn, L0_34, "gv_zoneb.TimPosition_FixDumbo", false)
  wait(0.3)
  DisableMotion(L0_34)
  wait(0.4)
  UnrestrictCutSceneInput()
  EnterCutscene(L0_34, 1)
  Wait(1)
  DestroyEntity("GV_ZoneB_DumboMachineSparks1")
  Wait(0.25)
  DestroyEntity("GV_ZoneB_DumboMachineSteam2")
  Wait(0.75)
  DestroyEntity("GV_ZoneB_DumboMachineSparks2")
  AudioPostEventOn("gv_zoneb_audio.Sound_Marker_Machine_DumboSparks 01", "Stop_sfx_GV_Sparks_Electric")
  Wait(0.5)
  DestroyEntity("GV_ZoneB_DumboMachineSteam1")
  AudioPostEventOn("gv_zoneb_audio.Sound_Marker_Machine_DumboSteam 01", "Stop_sfx_GV_Steam")
  Wait(1)
  FireUser1("GV_ZoneB_FixDumboShowRideCam")
  DoStinger("Stinger_Success", 7)
  wait(0.5)
  SetGlobal("GV_ZoneB_DumboFixed", 1)
  AnimGBSequence("gv_zoneb_dynamic.GV_ZoneB_DumboRideA1 01", "Start")
  AudioPostEventOn("gv_zoneb_dynamic.GV_ZoneB_DumboRideA1 01", "Play_sfx_GV_TB_Dumbo_LP")
  MultiPosSoundStart("gv_zoneb_dynamic.Sound_Marker_Dumbo_Controller")
  wait(4.9)
  FireThread(TeleportGremlinToEntity, L0_34, "TimPosition_Dumbo")
  wait(1.6)
  ExitCutscene(L0_34)
  EnableMotion(L0_34)
  wait(0.4)
  StartFadeOut(0.8)
  wait(0.8)
  if GetGlobal("GV_ZoneB_TeaCupBroke") == 0 then
    ForceSequence(L0_34, "GV_ZoneB_WrenchRecovered2")
  end
  Enable("gv_zoneb.DumboCamera_Trigger")
  wait(2)
  DisableGuardianHint("gv_zoneb_dynamic.PlayerHint_Dumbo")
  if GetGlobal("GV_ZoneB_PumpFilled") == 0 then
    EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_Pump")
    EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_BackArea")
  elseif GetGlobal("GV_ZoneB_PumpFilled") == 1 then
    EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_Teacup")
  end
end
GV_ZoneB_GiveWrench = L0_0
function L0_0()
  local L0_35
  L0_35 = Print
  L0_35("***************************** GV_ZoneB_TeleportTimToTeacup")
  L0_35 = "gv_zoneb_dynamic.Gremlin_Variant2 01"
  UnrestrictCutSceneInput()
  FireUser1("GV_ZoneB_TeaCupTimCamera")
  wait(1)
  FireThread(TeleportGremlinIn, L0_35, "gv_zoneb.TimPosition_TeaCups", false)
  wait(5)
  SetPropertyFloat(L0_35, "UsableRadius", 2)
  GV_ZoneB_CheckpointSave("gv_zoneb.Mickey_At_Dismisall")
end
GV_ZoneB_TeleportTimToTeacup = L0_0
function L0_0()
  FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_RideWarning")
end
GV_ZoneB_TeacupWarningChat = L0_0
function L0_0(A0_36, A1_37)
  if GetPrefabData("GV_ZoneB_MachineNozzle").Prefab_MachineRunning > 0 then
    if GetPrefabData("GV_ZoneB_MachineNozzle").Prefab_Paint == 4 then
    else
    end
  else
  end
  if true == true then
    if GetPropertyBool("gv_zoneb_dynamic.GV_ZoneB_Toon03", "Is Painted") == false and GetPropertyBool("gv_zoneb_dynamic.GV_ZoneB_Toon02", "Is Painted") == false then
      FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_PipesBrokeMachineEmpty")
    elseif GetPropertyBool("gv_zoneb_dynamic.GV_ZoneB_Toon03", "Is Painted") == true and GetPropertyBool("gv_zoneb_dynamic.GV_ZoneB_Toon02", "Is Painted") == true then
      FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_PipesFixedMachineEmpty")
    end
  elseif true then
    if GetGlobal("GV_ZoneB_TeaCupBroke") == 0 then
      GV_ZoneB_BreakTeacupRide()
    elseif GetGlobal("GV_ZoneB_PumpBroken_PipesThinned_Played") == 0 then
      FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_PumpBroken_PipesThinned")
    else
      SetGlobal("GV_ZoneB_PumpFixed_Played", 0)
    end
  elseif true and GetGlobal("GV_ZoneB_PumpFilled") == 0 then
    if GetPropertyBool("gv_zoneb_dynamic.GV_ZoneB_Toon03", "Is Painted") == true and GetPropertyBool("gv_zoneb_dynamic.GV_ZoneB_Toon02", "Is Painted") == true then
      GV_ZoneB_FixTeacupRide()
    elseif GetGlobal("GV_ZoneB_PumpFixed_Played") == 0 then
      FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_PumpFixed")
    else
      SetGlobal("GV_ZoneB_PumpFixed_Played", 0)
    end
  end
end
GV_ZoneB_TeaCupMaster = L0_0
function L0_0()
  SetGlobal("GV_ZoneB_TeaCupBroke", 1)
  FireUser1("GV_ZoneB_TeaCupRideCamera")
  wait(0.8)
  AnimGBSequence("gv_zoneb_dynamic.GV_TeaCupRide", "Broken")
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_TB_Teacup_Destroy")
  AudioPostEventOn("gv_zoneb_dynamic.GV_TeaCupRide", "Stop_sfx_GV_TB_Teacup_Working_LP")
  DestroyEntity("gv_zoneb.TeacupCamera_Trigger")
  wait(1)
  Disable("SteamTriggerDamage_Teacup2")
  wait(0.4)
  DestroyEntity("TeacupFX_Steam02")
  ForEachEntityInGroup(Enable, "Spawners_TeacupFX_Steam_Broken")
  ForEachEntityInGroup(DestroyEntity, "gv_zoneb_dynamic.TeaCupRide_InvisCollision")
  FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_RideBroken")
  SetGlobal("GV_ZoneB_PumpFilled", 2)
  DisableGuardianHint("gv_zoneb_dynamic.PlayerHint_Pump")
  DisableGuardianHint("gv_zoneb_dynamic.PlayerHint_BackArea")
  EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_TeacupChest")
  GV_ZoneB_CheckpointSave("gv_zoneb.Mickey_At_Dismisall")
end
GV_ZoneB_BreakTeacupRide = L0_0
function L0_0()
  if GetGlobal("GV_ZoneB_DumboFixed") == 1 then
    FireUser1("IGC_Teacup_TimCloseup_Angry")
  elseif GetGlobal("GV_ZoneB_ThanksFull_Played") == 1 then
    FireUser1("IGC_TimAngryAtDumbo")
  elseif GetGlobal("GV_ZoneB_ThanksFull_Played") == 0 then
    FireUser1("IGC_TimThanksMickey")
  end
  Wait(1.3)
  ForceSequence("gv_zoneb_dynamic.Gremlin_Variant2 01", "GV_ZoneB_CannotRepairTeaCup")
  ForEachEntityInGroup(Unhide, "GV_ZoneB_TCSteamBlast")
end
GV_ZoneB_TeaCupCameraGremlinAngry = L0_0
function L0_0()
  if GetGlobal("GV_ZoneB_DumboFixed") == 1 then
    SetGlobal("GV_ZoneB_TeaCupBroke", 2)
    SetGlobal("GV_ZoneB_PumpFilled", 0)
    GV_ZoneB_TeaCupCameraGremlinHappy()
    wait(2)
  elseif GetGlobal("GV_ZoneB_PumpFilled") == 0 then
    FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_RideFixed")
  end
  if GetGlobal("GV_ZoneB_PumpFilled") == 0 then
    SetGlobal("GV_ZoneB_PumpFilled", 1)
    DisableGuardianHint("gv_zoneb_dynamic.PlayerHint_Pump")
    DisableGuardianHint("gv_zoneb_dynamic.PlayerHint_BackArea")
    GV_ZoneB_CheckpointSave("gv_zoneb.Mickey_At_Dismisall")
  end
end
GV_ZoneB_FixTeacupRide = L0_0
function L0_0()
  local L0_38
  L0_38 = "gv_zoneb_dynamic.Gremlin_Variant2 01"
  EnableGuardianHint("gv_zoneb_dynamic.PlayerHint_RedChest")
  SetDrawSilhouettes(false)
  FireUser1("IGC_Teacup_TimCloseup")
  SetPropertyFloat(L0_38, "UsableRadius", 0)
  wait(1)
  TeleportGremlinOut(L0_38)
  FireThread(TeleportGremlinIn, L0_38, "gv_zoneb.GremlinTim_TeacupFix", false)
  wait(0.3)
  DisableMotion(L0_38)
  wait(0.4)
  EnterCutscene(L0_38, 1)
  wait(0.5)
  DestroyEntity("GV_ZoneB_TeaCupMachineSteam2")
  Wait(0.5)
  DestroyEntity("GV_ZoneB_TeaCupMachineSparks1")
  Wait(0.4)
  DestroyEntity("GV_ZoneB_TeaCupMachineSteam1")
  AudioPostEventOn("gv_zoneb_audio.Sound_Marker_Machine_TeaCupSteam 01", "Stop_sfx_GV_Steam")
  Wait(0.5)
  DestroyEntity("GV_ZoneB_TeaCupMachineSparks2")
  AudioPostEventOn("gv_zoneb_audio.Sound_Marker_Machine_TeaCupSparks 01", "Stop_sfx_GV_Sparks_Electric")
  Wait(0.5)
  FireThread(TeleportGremlinToEntity, "gv_zoneb_dynamic.Gremlin_Variant2 01", "gv_zoneb.TimPosition_TeaCups")
  Wait(0.75)
  FireUser1("GV_ZoneB_TeaCupRideCamera")
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_TB_Teacup_FIX")
  AnimGBSequence("gv_zoneb_dynamic.GV_TeaCupRide", "Loop")
  AudioPostEventOn("gv_zoneb_dynamic.GV_TeaCupRide", "Play_sfx_GV_TB_Teacup_Working_LP")
  AnimGBSequence("gv_zoneb_dynamic.GV_ZoneB_DumboRideA1 01", "Loop2")
  AudioPostEventOn("gv_zoneb_dynamic.GV_ZoneB_DumboRideA1 01", "Play_sfx_GV_TB_Dumbo_LP2")
  wait(2)
  ForEachEntityInGroup(DestroyEntity, "GV_ZoneB_TCSteamBlast")
  wait(2)
  ExitCutscene(L0_38)
  EnableMotion(L0_38)
  ForceSequence(L0_38, "GV_ZoneB_RideFixed2")
end
GV_ZoneB_TeaCupCameraGremlinHappy = L0_0
function L0_0()
  FireUser1("IGC_OpenRedChestDoor")
  DoStinger("Stinger_Success", 7)
  wait(2.5)
  AnimGBSequence("gv_zoneb_dynamic.GV_ZoneB_ControlRoomDoorA1 01", "Open")
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_TB_RideDoors_Open")
  SetPropertyFloat("gv_zoneb_dynamic.Gremlin_Variant2 01", "UsableRadius", 2)
  wait(2)
  SetDrawSilhouettes(true)
end
GV_ZoneB_OpenRedChestDoor = L0_0
function L0_0()
  GetPrefabData("GV_ZoneB_MachineNozzle").Prefab_MachineBusy = 0
  FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_GusPumpIntroduction")
end
GV_ZoneB_IGCMachineTutorial = L0_0
function L0_0()
  FireUser1("GV_ZoneB_MachineTutorialCamera02")
  wait(1)
  ThinnerPaintMachine_Reset("GV_ZoneB_MachineNozzle")
  FireSequence("gv_zoneb.GusConversationTrigger", "GV_ZoneB_GusExplainPipes")
end
GV_ZoneB_MachineCam02 = L0_0
function L0_0(A0_39)
  SetCameraAttributes(A0_39)
  wait(3)
  StartFadeOut(2)
  wait(4)
  LoadLevel(GetPlayer(), "Levels/Main_Menu.Level")
end
GV_ZoneB_DemoOutro = L0_0
function L0_0()
  local L0_40, L1_41
  GV_ZoneB_FixTeacupRide = L0_40
  L0_40 = nil
  GV_ZoneB_CheckpointDumboCleanUp = L0_40
  L0_40 = nil
  GV_ZoneB_EnableIntroAI = L0_40
  L0_40 = nil
  GV_ZoneB_EnableSpatters02 = L0_40
  L0_40 = nil
  GV_ZoneB_TeaCupCameraGremlinAngry = L0_40
  L0_40 = nil
  GV_ZoneB_TeaCupMaster = L0_40
  L0_40 = nil
  GV_ZoneB_SpatterTaunt = L0_40
  L0_40 = nil
  GV_ZoneB_TeaCupCameraGremlinHappy = L0_40
  L0_40 = nil
  GV_ZoneB_BreakTeacupRide = L0_40
  L0_40 = nil
  GV_ZoneB_DumboTwitch = L0_40
  L0_40 = nil
  GV_ZoneB_SpatterAtPipe_Cheer = L0_40
  L0_40 = nil
  GV_ZoneB_MiscSetup = L0_40
  L0_40 = nil
  GV_ZoneB_EnableSpatters = L0_40
  L0_40 = nil
  GV_ZoneB_TauntProtectorOn = L0_40
  L0_40 = nil
  GV_ZoneB_TauntProtectorOff = L0_40
  L0_40 = nil
  GV_ZoneB_SpatterDismissalFull = L0_40
  L0_40 = nil
  GV_ZoneB_FreedTimFromBooth_CP = L0_40
  L0_40 = nil
  GV_ZoneB_TeleportTimToTeacup = L0_40
  L0_40 = nil
  GV_ZoneB_EntryDoorShut = L0_40
  L0_40 = nil
  GV_ZoneB_OswaldCutscene = L0_40
  L0_40 = nil
  GV_ZoneB_IntroCutScene = L0_40
  L0_40 = nil
  GV_ZoneB_OpenRedChestDoor = L0_40
  L0_40 = nil
  GV_ZoneB_LeftSpawnerCheck = L0_40
  L0_40 = nil
  GV_ZoneB_ValveNarrator = L0_40
  L0_40 = nil
  GV_ZoneB_TimPuzzleCheck = L0_40
  L0_40 = nil
  GV_ZoneB_TeaCupCleanUp = L0_40
  L0_40 = nil
  GV_ZoneB_CheckpointSave = L0_40
  L0_40 = nil
  GV_ZoneB_GusSawPipe = L0_40
  L0_40 = nil
  GV_ZoneB_Unfriended = L0_40
  L0_40 = nil
  GV_ZoneB_ForceTim_AngrySequence = L0_40
  L0_40 = nil
  GV_ZoneB_GotDown = L0_40
  L0_40 = nil
  GV_ZoneB_TeacupWarningChat = L0_40
  L0_40 = nil
  GV_ZoneB_IGCMachineTutorial = L0_40
  L0_40 = nil
  GV_ZoneB_PlayerReadTimDismisall = L0_40
  L0_40 = nil
  GV_ZoneB_RightSpawnerCheck = L0_40
  L0_40 = nil
  GV_ZoneB_EndIntroPan = L0_40
  L0_40 = nil
  GV_ZoneB_SpatterDeath = L0_40
  L0_40 = nil
  GV_ZoneB_GremlinHappyMeter = L0_40
  L0_40 = nil
  GV_ZoneB_GetDown = L0_40
  L0_40 = nil
  GV_ZoneB_DemoOutro = L0_40
  L0_40 = nil
  GV_ZoneB_FoundWrench = L0_40
  L0_40 = nil
  GV_ZoneB_MachineCam02 = L0_40
  L0_40 = nil
  GV_ZoneB_ChestOpened_CP = L0_40
  L0_40 = nil
  GV_ZoneB_BoatPathChange = L0_40
  L0_40 = nil
  GV_ZoneB_TeamChangeMaster = L0_40
  L0_40 = nil
  GV_ZoneB_MoveTimToDumbo = L0_40
  L0_40 = nil
  GV_ZoneB_HitPipeValve = L0_40
  L0_40 = nil
  GV_ZoneB_HideFrontDoor = L0_40
  L0_40 = nil
  GV_ZoneB_SpatterAtPipe = L0_40
  L0_40 = nil
  GV_ZoneB_GuardianExplaination = L0_40
  L0_40 = nil
  GV_ZoneB_DecrementTotalSpawnCount = L0_40
  L0_40 = nil
  GV_ZoneB_Tim_FullThanks = L0_40
  L0_40 = nil
  GV_ZoneB_GiveWrench = L0_40
  L0_40 = nil
  GV_ZoneB_ActivateSpawners = L0_40
  L0_40 = nil
  GV_ZoneB_Start_Launcher = L0_40
  L0_40 = nil
  GV_ZoneB_LoadCheckpoint = L0_40
  L0_40 = nil
  GV_ZoneB_SetupTim = L0_40
  L0_40 = nil
  Cleanup_GV_ZoneB2 = L0_40
end
Cleanup_GV_ZoneB2 = L0_0
