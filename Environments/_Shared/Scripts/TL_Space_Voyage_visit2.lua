local L0_0, L1_1
function L0_0()
  SetGlobal("SM_Tentacle_Count", GetGlobal("SM_Tentacle_Count") + 1)
  SetGlobal("SM_Tentacle_Countdown", GetGlobal("SM_Tentacle_Countdown") - 1)
  if GetGlobal("SM_Tentacle_Count") == 1 then
    FireSequence("sm_tl_v2_story.ConversationalTrigger 01", "Genric Line 25")
  elseif GetGlobal("SM_Tentacle_Count") == 2 then
    FireSequence("sm_tl_v2_story.ConversationalTrigger 01", "Genric Line 24")
  elseif GetGlobal("SM_Tentacle_Count") == 3 then
    SV_visit2WIN()
  end
end
SM_Visit2Win = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "Tentacle1_Obstacle")
end
TL_SV2_RemoveTent1_Obstacles = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "Tentacle2_Obstacle")
end
TL_SV2_RemoveTent2_Obstacles = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "Tentacle3_Obstacle")
end
TL_SV2_RemoveTent3_Obstacles = L0_0
function L0_0()
  wait(0.24)
  DestroyEntity("sm_tl_v2_enemysinwaves.TriggerRotate 01")
  Unhide("tl_minihub_visit2.TL_SM_Gear1 08")
  ForEachEntityInGroup(ForceSketched, "TL_SV_V2_StartThinned")
  ForEachEntityInGroup(DestroyEntity, "ElectricArcsSet")
  ForEachEntityInGroup(DisableComponent, "SM_Rocket_trams", "Physics Stimulus Component")
  StartWaveZero()
end
SM_V2_LoadCheckpoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "SM_V2_LoadCheckpoint", "sm_tl_v2_uberlayer.Marker(Rotatable) 03")
end
SM_V2_SaveCheckPoint = L0_0
function L0_0()
  ForEachEntityInGroup(ForceSketched, "TL_SV_V2_StartThinned")
  ForEachEntityInGroup(DisableComponent, "SM_Rocket_trams", "Physics Stimulus Component")
end
SM_V2_PreThinGeo = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "DeleteonVisit2")
  ForEachEntityInGroup(DestroyEntity, "tl_minihub.TL_MiniHub_Oneshots_01 18")
end
destroyForSecondVisit = L0_0
function L0_0()
  StartFadeOut(3)
end
TL_2ndVisitEndLevel = L0_0
function L0_0()
  AnimGBSequence("sm_tl_zoneb.TL_SM_Moonliner", "RestUp")
  StartTrackingCurrentLevelForScoring("Space Voyage")
  SetMap(nil, "MAP_SM_TL_ZONEB", "GAME")
  ForEachEntityInGroup(DestroyEntity, "ElectricArcsSet")
end
SetMoonlinerPosition = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "DeleteonVisit2SV")
  SV_visit2GremlinSetup()
end
DestroyForSecondVisitSV = L0_0
function L0_0()
  ClearAllCameraAttributes()
  UnrestrictCutSceneInput()
end
ReleaseMe = L0_0
function L0_0()
  AnimGBSequence("sm_tl_zoneb.TL_SM_Moonliner", "RestUp")
  TL_SM_Puzzle1path1Check()
  SV_visit2GremlinSetup()
end
SM_visit2_loaded = L0_0
function L0_0()
  if GetGlobal("SM_RocketpartsPlaced") == 0 then
    SetGlobal("SM_RocketpartsPlaced", GetGlobal("SM_RocketpartsPlaced") + 1)
    FireSequence("tl_minihub_story_visit2.ConversationalTrigger 01", "TLMH_V2_Gus_Part1Rocket")
  elseif GetGlobal("SM_RocketpartsPlaced") == 1 then
    SetGlobal("SM_RocketpartsPlaced", GetGlobal("SM_RocketpartsPlaced") + 1)
    FireSequence("tl_minihub_story_visit2.ConversationalTrigger 01", "TLMH_V2_Gus_Part2Rocket")
  elseif GetGlobal("SM_RocketpartsPlaced") == 2 then
    SetGlobal("SM_RocketpartsPlaced", GetGlobal("SM_RocketpartsPlaced") + 1)
    Bark(GetPlayer(), "", 5, "Gus", "Gus:")
  elseif GetGlobal("SM_RocketpartsPlaced") == 3 then
    SetGlobal("SM_RocketpartsPlaced", GetGlobal("SM_RocketpartsPlaced") + 1)
    FireSequence("tl_minihub_story_visit2.ConversationalTrigger 01", "TLMH_V2_Gus_Part3Rocket")
    wait(4)
    UnrestrictCutSceneInput()
    PlayAndUnlockMovie("TL_visit2_Rocket_Flight.bik", "TL_visit2_Rocket_Flight")
    wait(1)
    LoadLevel(GetPlayer(), "Levels/DBC_Start.Level")
  end
end
SM_Parts_Placed = L0_0
function L0_0()
  ForEachEntityInGroup(Enable, "Wave0_SMV2")
  wait(5)
  ForEachEntityInGroup(Enable, "Wave1_SMV2")
end
StartWaveZero = L0_0
L0_0 = 0
TL_SpattersFriendedSVV2 = L0_0
L0_0 = 0
TL_SpattersDefeatedSVV2 = L0_0
L0_0 = 8
Total_Alive_InWaveSVV2 = L0_0
function L0_0()
  Print("******************* Wave_Check: Total_Alive_InWaveSVV2 = " .. Total_Alive_InWaveSVV2)
  if TL_SpattersDefeatedSVV2 + TL_SpattersFriendedSVV2 == Total_Alive_InWaveSVV2 then
    Print("******************* Wave_Check: TL_SpattersDefeatedSVV2 + TL_SpattersFriendedSVV2 == Total_Alive_InWaveSVV2")
    wait(1)
    TL_SpattersFriendedSVV2 = 0
    TL_SpattersDefeatedSVV2 = 0
    if GetGlobal("SV_V2_Wave1") == 1 then
      Print("******************* Wave_Check: GetGlobal('SV_V2_Wave1') == 1")
      wait(0.5)
      SetGlobal("SV_V2_Wave1", 0)
      wait(0.2)
      SetGlobal("SV_V2_Wave2", 1)
      ForEachEntityInGroup(DestroyEntity, "Wave1_SMV2")
      Total_Alive_InWaveSVV2 = 8
      wait(1)
      ForEachEntityInGroup(Enable, "Wave2_SMV2")
    elseif GetGlobal("SV_V2_Wave2") == 1 then
      Print("******************* Wave_Check: GetGlobal('SV_V2_Wave2') == 1")
      wait(0.5)
      SetGlobal("SV_V2_Wave2", 0)
      wait(0.2)
      SetGlobal("SV_V2_Wave3", 1)
      ForEachEntityInGroup(DestroyEntity, "Wave2_SMV2")
      Total_Alive_InWaveSVV2 = 6
      wait(1)
      ForEachEntityInGroup(Enable, "Wave3_SMV2")
    elseif GetGlobal("SV_V2_Wave3") == 1 then
      Print("******************* Wave_Check: GetGlobal('SV_V2_Wave3') == 1")
      wait(0.5)
      SetGlobal("SV_V2_Wave3", 0)
      ForEachEntityInGroup(DestroyEntity, "Wave3_SMV2")
      wait(1)
      FireSequence("sm_tl_v2_story.ConversationalTrigger 01", "SMB_V2_Gus_SVTentComp")
      wait(2)
      SV_visit2WIN()
    end
  end
end
Wave_Check_SVV2 = L0_0
function L0_0(A0_2)
  if GetCurrentTeam(A0_2) == 3 then
    Print("********************************* TEAM 3 - Player's Team")
    TL_SpattersFriendedSVV2 = TL_SpattersFriendedSVV2 + 1
  elseif GetCurrentTeam(A0_2) == 2 then
    Print("********************************* TEAM 2 - Enemy")
    TL_SpattersFriendedSVV2 = TL_SpattersFriendedSVV2 - 1
  end
  Print("******************* ChangedTeams: TL_SpattersFriendedSVV2 = " .. TL_SpattersFriendedSVV2)
  Wave_Check_SVV2()
end
ChangedTeamsSVV2 = L0_0
function L0_0()
  TL_SpattersDefeatedSVV2 = TL_SpattersDefeatedSVV2 + 1
  Print("******************* Wave_AdvancedNum: TL_SpattersDefeatedSVV2 = " .. TL_SpattersDefeatedSVV2)
  Wave_Check_SVV2()
end
Wave_AdvancedNumSVV2 = L0_0
function L0_0()
  RestrictCutSceneInput()
  Wait(4)
  StartFadeOut(0.8)
  wait(0.8)
  StreamInterior(nil, "stream_23b")
  wait(0.01)
  WaitForLevelLoad()
  Reverse("tl_minihub_visit2.TL_SM_Gear1 01")
  FireUser1("cameraOutroShot1")
end
SV_visit2WIN = L0_0
function L0_0()
  wait(0.5)
  UnrestrictCutSceneInput()
  UnrestrictCutSceneInput()
  UnrestrictCutSceneInput()
  EndTrackingCurrentLevelForScoring("Space Voyage")
  PlayAndUnlockMovie("TL_visit2_Rocket_Flight.bik", "TL_visit2_Rocket_Flight")
  wait(1)
  LoadLevel(GetPlayer(), "Levels/DBC_Start.Level")
end
SV_visit2LevelEnd = L0_0
function L0_0()
  ForEachEntityInGroup(Unhide, "Gremlin_Omega_Sketches")
end
SV_V2GremlinOmegaSketches = L0_0
function L0_0()
  ForEachEntityInGroup(Hide, "Gremlin_Omega_Sketches")
  ForEachEntityInGroup(Hide, "Gremlin_Epsilon_sketches")
  ForEachEntityInGroup(Hide, "Gremlin_Delta_Sketches")
  if GetGlobal("SM_Gremlin_Omega") == 1 then
    DestroyEntity("Gremlin_Omega_Cage")
    DestroyEntity("Gremlin_Omega")
  end
  if GetGlobal("SM_Gremlin_Epsilon") == 1 then
    DestroyEntity("Gremlin_Epsilon_Cage")
    DestroyEntity("Gremlin_Epsilon")
  end
  if GetGlobal("SM_Gremlin_Delta") == 1 then
    DestroyEntity("Gremlin_Delta_Cage")
    DestroyEntity("Gremlin_Delta")
  end
end
SV_visit2GremlinSetup = L0_0
function L0_0()
  FireSequence("sm_tl_v2_story.ConversationalTrigger 05", "SMBV2_Omega_Thanks")
end
SV_visit2GremlinOmegaTalk = L0_0
function L0_0()
  local L0_3
  L0_3 = GetChildEntityByName
  L0_3 = L0_3("Gremlin_Omega", "GremlinWrench")
  Unhide(L0_3)
  DisableMotion("Gremlin_Omega")
  TeleportGremlinToEntity("Gremlin_Omega", "sm_tl_v2_story.Marker(Rotatable) 05")
  wait(1.2)
  EnterCutscene("Gremlin_Omega")
  AnimVarInt("Gremlin_Omega", VAR_Cutscene, 1)
  AnimEvent("Gremlin_Omega", EVENT_Start_Cutscene)
  wait(3)
  TeleportGremlinToEntity("Gremlin_Omega", "sm_tl_v2_story.Marker(Rotatable) 06")
  wait(1)
  DestroyEntity("Gremlin_Omega")
end
OmegaOutV2 = L0_0
function L0_0()
  FireSequence("sm_tl_v2_story.ConversationalTrigger 02", "SMBV2_Epsilon_Thanks")
end
SV_visit2GremlinEpsilonTalk = L0_0
function L0_0()
  local L0_4
  L0_4 = GetChildEntityByName
  L0_4 = L0_4("Gremlin_Epsilon", "GremlinWrench")
  Unhide(L0_4)
  DisableMotion("Gremlin_Epsilon")
  TeleportGremlinToEntity("Gremlin_Epsilon", "sm_tl_v2_story.Marker(Rotatable) 01")
  wait(1.2)
  EnterCutscene("Gremlin_Epsilon")
  AnimVarInt("Gremlin_Epsilon", VAR_Cutscene, 1)
  AnimEvent("Gremlin_Epsilon", EVENT_Start_Cutscene)
  wait(3)
  TeleportGremlinToEntity("Gremlin_Epsilon", "sm_tl_v2_story.Marker(Rotatable) 02")
  wait(1)
  DestroyEntity("Gremlin_Epsilon")
end
EpsilonOutV2 = L0_0
function L0_0()
  FireSequence("sm_tl_v2_story.ConversationalTrigger 03", "SMBV2_Delta_Thanks")
end
SV_visit2GremlinDeltaTalk = L0_0
function L0_0()
  local L0_5
  L0_5 = GetChildEntityByName
  L0_5 = L0_5("Gremlin_Delta", "GremlinWrench")
  Unhide(L0_5)
  DisableMotion("Gremlin_Delta")
  TeleportGremlinToEntity("Gremlin_Delta", "sm_tl_v2_story.Marker(Rotatable) 03")
  wait(1.2)
  EnterCutscene("Gremlin_Delta")
  AnimVarInt("Gremlin_Delta", VAR_Cutscene, 1)
  AnimEvent("Gremlin_Delta", EVENT_Start_Cutscene)
  wait(3)
  TeleportGremlinToEntity("Gremlin_Delta", "sm_tl_v2_story.Marker(Rotatable) 04")
  wait(1)
  DestroyEntity("Gremlin_Delta")
end
DeltaOutV2 = L0_0
function L0_0()
  ForEachEntityInGroup(Hide, "Gremlin_Starr_Sketches")
  ForEachEntityInGroup(Hide, "Gremlin_Nova_Sketches")
  ForEachEntityInGroup(Hide, "Gremlin_Apollo_Sketches")
  if GetGlobal("TL_Gremlin_Starr") == 1 then
    DestroyEntity("Gremlin_Starr_Cage")
    DestroyEntity("Gremlin_Starr")
  end
  if GetGlobal("SM_Gremlin_Nova") == 1 then
    DestroyEntity("Gremlin_Nova_Cage")
    DestroyEntity("Gremlin_Nova")
  end
  if GetGlobal("SM_Gremlin_Apollo") == 1 then
    DestroyEntity("Gremlin_Apollo_Cage")
    DestroyEntity("Gremlin_Apollo")
  end
end
TL_visit2GremlinSetup = L0_0
function L0_0()
  SetGlobal("SM_Gremlin_Delta", 1)
end
SM_GremlinDeltafreed = L0_0
function L0_0()
  SetGlobal("SM_Gremlin_Omega", 1)
end
SM_GremlinOmegafreed = L0_0
function L0_0()
  SetGlobal("SM_Gremlin_Epsilon", 1)
end
SM_GremlinEpsilonfreed = L0_0
