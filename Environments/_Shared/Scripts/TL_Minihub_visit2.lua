local L0_0, L1_1
function L0_0()
  SetGlobal("TL_Tentacle_Count", GetGlobal("TL_Tentacle_Count") + 1)
  SetGlobal("TL_Tentacle_Countdown", GetGlobal("TL_Tentacle_Countdown") - 1)
  if GetGlobal("TL_Tentacle_Count") == 1 then
    FireSequence("tl_minihub_story_visit2.ConversationalTrigger 01", "Genric Line 25")
  elseif GetGlobal("TL_Tentacle_Count") == 2 then
    FireSequence("tl_minihub_story_visit2.ConversationalTrigger 01", "Genric Line 24")
  elseif GetGlobal("TL_Tentacle_Count") == 3 then
    TL_ToonV2countDecrease()
    FireUser1("tl_minihub_igc_visit2.grabcamerafancy 06.FancyCameraLookAt 01")
    wait(0.8)
    ForEachEntityInGroup(AnimGBSequence, "Exit_Tentacles", "Wilt")
    wait(2)
    ForEachEntityInGroup(DestroyEntity, "Exit_Tentacles")
    TL_V2_SaveCheckPointTentacleWin()
  end
end
TL_Visit2Win = L0_0
function L0_0()
  wait(0.24)
  StartTrackingCurrentLevelForScoring("Tomorrow Square")
  ForEachEntityInGroup(ForceSketchedPop, "THINONV2")
  DestroyEntity("tl_minihub_visit2.TriggerRotate 05")
  DestroyEntity("LookatTentacle_start")
  ForEachEntityInGroup(SplineFollower_SetDisabled, "tl_minihub_airlock3.TL_SpaceMount_DoorBridge_Inert 12", false)
  ForEachEntityInGroup(Hide, "Gremlin_Apollo_Sketches")
  ForEachEntityInGroup(Hide, "Gremlin_Nova_Sketches")
  ForEachEntityInGroup(Hide, "Gremlin_Starr_Sketches")
  TL_ToonV2countIncrease()
  Unhide("ElectricArcsOnTracks")
  if GetGlobal("TL_Tentacle_Count") == 3 then
    ForEachEntityInGroup(FireUser1, "TL_Tentacles")
    DestroyEntity("tl_minihub_airlock3_visit_2.triggers_thinnerpool 01.TriggerDamageVolume_ThinnerPool")
    ForEachEntityInGroup(DestroyEntity, "Exit_Tentacles")
    DestroyEntity("tl_minihub_visit2.triggers_thinnerpool 01.TriggerDamageVolume_ThinnerPool")
    TL_ToonV2countDecrease()
  end
  wait(1)
end
TL_V2_LoadCheckpoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "TL_V2_LoadCheckpoint", "tl_minihub_visit2.ExitProjectorMarker")
end
TL_V2_SaveCheckPoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "TL_V2_LoadCheckpoint", "tl_minihub_visit2.ExitProjectorMarker")
end
TL_ZoneTLMH_SaveCheckpoint = L0_0
function L0_0()
  DestroyEntity("tl_minihub_airlock3_visit_2.triggers_thinnerpool 01.TriggerDamageVolume_ThinnerPool")
  SaveQuestGlobal("TL_Tentacle_Count")
  SaveQuestGlobal("TL_Tentacle_Countdown")
  SaveCheckpoint(GetPlayer(), "TL_V2_LoadCheckpoint", "tl_minihub_visit2.ExitProjectorMarker")
end
TL_V2_SaveCheckPointTentacleWin = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "DeleteonVisit2")
  ForEachEntityInGroup(DestroyEntity, "tl_minihub.TL_MiniHub_Oneshots_01 18")
end
destroyForSecondVisit = L0_0
function L0_0()
  ForEachEntityInGroup(ForceSketchedPop, "THINONV2")
  ForEachEntityInGroup(AnimGBSequence, "PoweronV2", "On")
  Unhide("ElectricArcsOnTracks")
  TL_visit2GremlinSetup()
  SetMap(nil, "MAP_TL_MINIHUB", "GAME")
  ForEachEntityInGroup(SplineFollower_SetDisabled, "tl_minihub_airlock3.TL_SpaceMount_DoorBridge_Inert 12", false)
  TL_ToonV2countIncrease()
  StartTrackingCurrentLevelForScoring("Tomorrow Square")
  if GetGlobal("RocketVerticalCount") == 1 and GetGlobal("RocketArmCount") > 0 and GetGlobal("RocketSpinCount") == 1 then
    AnimGBReset("tl_minihub.TL_Rocket_Ride")
    AnimGBReset("tl_minihub.TL_Rocket_Arms")
    AnimGBReset("tl_minihub.TL_Rocket_Top")
    ForEachEntityInGroup(AnimGBSequence, "tl_minihub.TL_Rocket_Arms", "Loop")
    Disable("tl_minihub.animated_gear 01")
    AnimGBSequence("tl_minihub.TL_Rocket_Ride", "Loop")
    ForEachEntityInGroup(AnimGBSequence, "tl_minihub.TL_Rocket_Top", "Loop")
    ForcePainted("TL_gearpuzzletemp.NOS_HM_StretchGearsA2 02")
    ForcePainted("TL_gearpuzzletemp.NOS_HM_StretchGearsA3 02")
    Disable("TL_gearpuzzletemp.NOS_HM_StretchGearsA1 02")
    DestroyEntity("tl_minihub_pickupslayer.TreasureChest 03")
    ForEachEntityInGroup(ForcePainted, "TL_Rocket_Vertical_Gears")
  end
  if GetGlobal("TLMH_V2_Gus_Tentacles_Played") == 0 then
    FireUser1("LookatTentacle_start")
    wait(3)
  end
  Disable2DSetup()
  TL_V2_SaveCheckPoint()
end
visit2setup = L0_0
function L0_0()
  StartFadeOut(3)
end
TL_2ndVisitEndLevel = L0_0
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
L0_0 = 0
TL_SpattersFriended = L0_0
L0_0 = 0
TL_SpattersDefeated = L0_0
L0_0 = 8
Total_Alive_InWave = L0_0
function L0_0()
  Print("******************* Wave_Check: Total_Alive_InWave = " .. Total_Alive_InWave)
  if TL_SpattersDefeated + TL_SpattersFriended == Total_Alive_InWave then
    Print("******************* Wave_Check: TL_SpattersDefeated + TL_SpattersFriended == Total_Alive_InWave")
    wait(1)
    TL_SpattersFriended = 0
    TL_SpattersDefeated = 0
    if GetGlobal("TL_HM_V2_Wave1") == 1 then
      Print("******************* Wave_Check: GetGlobal('TL_HM_V2_Wave1') == 1")
      wait(0.5)
      SetGlobal("TL_HM_V2_Wave1", 0)
      wait(0.2)
      SetGlobal("TL_HM_V2_Wave2", 1)
      ForEachEntityInGroup(DestroyEntity, "Wave01")
      Total_Alive_InWave = 6
      wait(1)
      ForEachEntityInGroup(Enable, "Wave02")
    elseif GetGlobal("TL_HM_V2_Wave2") == 1 then
      Print("******************* Wave_Check: GetGlobal('TL_HM_V2_Wave2') == 1")
      wait(0.5)
      SetGlobal("TL_HM_V2_Wave2", 0)
      wait(0.2)
      SetGlobal("TL_HM_V2_Wave3", 1)
      ForEachEntityInGroup(DestroyEntity, "Wave02")
      Total_Alive_InWave = 9
      wait(1)
      ForEachEntityInGroup(Enable, "Wave03")
    elseif GetGlobal("TL_HM_V2_Wave3") == 1 then
      Print("******************* Wave_Check: GetGlobal('TL_HM_V2_Wave3') == 1")
      wait(0.5)
      SetGlobal("TL_HM_V2_Wave3", 0)
      ForEachEntityInGroup(DestroyEntity, "Wave03")
    end
  end
end
Wave_Check = L0_0
function L0_0(A0_2)
  if GetCurrentTeam(A0_2) == 3 then
    Print("********************************* TEAM 3 - Player's Team")
    TL_SpattersFriended = TL_SpattersFriended + 1
  elseif GetCurrentTeam(A0_2) == 2 then
    Print("********************************* TEAM 2 - Enemy")
    TL_SpattersFriended = TL_SpattersFriended - 1
  end
  Print("******************* ChangedTeams: TL_SpattersFriended = " .. TL_SpattersFriended)
  Wave_Check()
end
ChangedTeams = L0_0
function L0_0()
  TL_SpattersDefeated = TL_SpattersDefeated + 1
  Print("******************* Wave_AdvancedNum: TL_SpattersDefeated = " .. TL_SpattersDefeated)
  Wave_Check()
end
Wave_AdvancedNum = L0_0
function L0_0()
  FireSequence("tl_minihub_story_visit2.ConversationalTrigger 02", "TLMH_V2_Apollo_thanks")
end
TL_visit2GremlinApolloTalk = L0_0
function L0_0()
  local L0_3
  L0_3 = GetChildEntityByName
  L0_3 = L0_3("Gremlin_Apollo", "GremlinWrench")
  Unhide(L0_3)
  DisableMotion("Gremlin_Apollo")
  TeleportGremlinToEntity("Gremlin_Apollo", "tl_minihub_story_visit2.Marker(Rotatable) 01")
  wait(1.2)
  EnterCutscene("Gremlin_Apollo")
  AnimVarInt("Gremlin_Apollo", VAR_Cutscene, 1)
  AnimEvent("Gremlin_Apollo", EVENT_Start_Cutscene)
  wait(3)
  TeleportGremlinToEntity("Gremlin_Apollo", "tl_minihub_story_visit2.Marker(Rotatable) 02")
  wait(1)
  DestroyEntity("Gremlin_Apollo")
end
ApolloOutV2 = L0_0
function L0_0()
  FireSequence("tl_minihub_story_visit2.ConversationalTrigger 03", "TLMH_V2_Nova_thanks")
end
TL_visit2GremlinNovaTalk = L0_0
function L0_0()
  local L0_4
  L0_4 = GetChildEntityByName
  L0_4 = L0_4("Gremlin_Nova", "GremlinWrench")
  Unhide(L0_4)
  DisableMotion("Gremlin_Nova")
  TeleportGremlinToEntity("Gremlin_Nova", "tl_minihub_story_visit2.Marker(Rotatable) 03")
  wait(1.2)
  EnterCutscene("Gremlin_Nova")
  AnimVarInt("Gremlin_Nova", VAR_Cutscene, 1)
  AnimEvent("Gremlin_Nova", EVENT_Start_Cutscene)
  wait(3)
  TeleportGremlinToEntity("Gremlin_Nova", "tl_minihub_story_visit2.Marker(Rotatable) 04")
  wait(1)
  DestroyEntity("Gremlin_Nova")
end
NovaOutV2 = L0_0
function L0_0()
  FireSequence("tl_minihub_story_visit2.ConversationalTrigger 05", "TLMH_V2_Sparks_Thanks")
end
TL_visit2GremlinSparksTalk = L0_0
function L0_0()
  local L0_5
  L0_5 = GetChildEntityByName
  L0_5 = L0_5("TL_Gremlin_Starr", "GremlinWrench")
  Unhide(L0_5)
  DisableMotion("TL_Gremlin_Starr")
  TeleportGremlinToEntity("TL_Gremlin_Starr", "tl_minihub_story_visit2.Marker(Rotatable) 05")
  wait(1.2)
  EnterCutscene("TL_Gremlin_Starr")
  AnimVarInt("TL_Gremlin_Starr", VAR_Cutscene, 1)
  AnimEvent("TL_Gremlin_Starr", EVENT_Start_Cutscene)
  wait(3)
  TeleportGremlinToEntity("TL_Gremlin_Starr", "tl_minihub_story_visit2.Marker(Rotatable) 06")
  wait(1)
  DestroyEntity("TL_Gremlin_Starr")
end
SparksOutV2 = L0_0
