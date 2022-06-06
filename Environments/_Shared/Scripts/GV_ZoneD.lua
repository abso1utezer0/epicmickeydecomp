local L0_0, L1_1
function L0_0()
  FireThread(GuardianPrefab_PopulateGuardians, "AsiaGuardianSpawner")
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
  SetMap(nil, "MAP_GV_ZONED", "GAME")
  StartTrackingCurrentLevelForScoring("GV_ZoneD")
  GV_ZoneD_SetUpGuardianHints()
end
GV_ZoneD_MiscSetup = L0_0
function L0_0(A0_2)
  SaveCheckpoint(GetPlayer(), "GV_ZoneD_LoadCheckpoint", A0_2)
end
GV_ZoneD_SaveCheckpoint = L0_0
function L0_0()
  GV_ZoneD_SaveCheckpoint("gremlinvillage_zoned_scripting.PositionMarker_ExitOpen")
end
GV_ZoneD_ConceptCheckPoint = L0_0
function L0_0()
  GV_ZoneD_SaveCheckpoint("Position_WhirlpoolStart")
end
GV_ZoneD_SaveCheckpoint_WP = L0_0
function L0_0()
  GV_ZoneD_SaveCheckpoint("GV_ZoneD_MickeyStart")
end
GV_ZoneD_SaveCheckpoint_Start = L0_0
function L0_0()
  if GetGlobal("GV_ZoneD_GearPuzzle") == 1 then
    EnableGuardianHint("PlayerHint_Exit")
  elseif GetGlobal("GV_ZoneD_FanPuzzleComplete") == 0 then
    EnableGuardianHint("PlayerHint_DollRide")
  else
    if GetGlobal("GV_ZoneD_FanPuzzleComplete") == 1 then
      EnableGuardianHint("PlayerHint_Vent")
    end
    EnableGuardianHint("PlayerHint_DollGears")
  end
  if GetGlobal("GV_ZoneD_Loo_Freed_Played") == 1 then
    EnableGuardianHint("PlayerHint_Exit")
  else
    EnableGuardianHint("PlayerHint_TajEntrance")
  end
  if GetGlobal("GV_ZoneD_Braun_Freed_Played") == 0 then
    EnableGuardianHint("PlayerHint_Braun")
  end
end
GV_ZoneD_SetUpGuardianHints = L0_0
function L0_0(A0_3)
  GV_ZoneD_NoIntro = true
  IntroDoorHidden = true
  GV_ZoneD_MiscSetup()
  MoveToEntity("gremlinvillage_zoned_audio.Trigger_startLVL", GetPlayer())
  if GetGlobal("GV_Pete_Intro_Played") == 1 then
    DestroyEntity("gremlinvillage_zoned.SmallWorldPete")
    DestroyEntity("gremlinvillage_zoned.Trigger_PeteIntro")
    FireUser1("PagodaSpawnerR")
    FireUser1("PagodaSpawnerL")
    ForEachEntityInGroup(Enable, "gremlinvillage_zoned_ai.Spawners_Taj")
    AnimGBSequence("gremlinvillage_zoned.GV_ZoneD_ExitDoor", "rest")
  end
  if GetGlobal("GV_ZoneD_Braun_Freed_Played") == 1 then
    SetPropertyFloat("pOverturnedBoat_SFer02", "InitialHoldTime", 6)
    SetPropertyFloat("pOverturnedBoat_SFer04", "InitialHoldTime", 0)
    SplineFollower_TeleportToKnot("pOverturnedBoat_SFer02", "gremlinvillage_zoned_scripting.SK_DollBoat_Alt2")
    SplineFollower_TeleportToKnot("pOverturnedBoat_SFer03", "gremlinvillage_zoned_scripting.SK_DollBoat3")
    ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "SF_DollBoats", 2)
    SetSplineFollowerInitialSpeed("OverturnedBoat_SFer01", 2)
    AnimGBSequence("gremlinvillage_zoned.GV_ZoneD_BoatDoors", "opening")
    DestroyEntity("Gremlin_Braun")
    SetSplineFollowerInitialSpeed("gremlinvillage_zoned.GV_ZoneD_StepInert_01 01", 7)
    SetSplineFollowerInitialSpeed("gremlinvillage_zoned.GV_ZoneD_StepInert_02 01", 7)
    Enable("Trigger_BoatHint")
    DisableGlint("PagodaGear")
    SetPropertyBool("PagodaGear", "ForceInvulnerable", true)
    StopEmitters("PagodaSteam")
  end
  if GetGlobal("GV_ZoneD_Loo_Freed_Played") == 1 then
    Disable("gremlinvillage_zoned.Trigger 06")
    SetRotatorMaxSpeed("gremlinvillage_zoned.Taj_Platform1", 30)
    AudioPostEventOn("gremlinvillage_zoned.Taj_Platform1", "Play_sfx_GV_ABR_Evnt_PlatformsLower")
    AnimGBSequence("gremlinvillage_zoned.MagicCarpet1", "looping", false, 0, 13)
    AnimGBSequence("gremlinvillage_zoned.UnderTaj_SecretDoor", "opening")
    DisableGlint("LooDoor_Gear")
    SetPropertyBool("LooDoor_Gear", "ForceInvulnerable", true)
    AnimGBSequence("gremlinvillage_zoned.MagicCarpet2", "looping", false, 0, 26)
    AnimGBSequence("gremlinvillage_zoned.MagicCarpet3", "looping")
  end
  if GetGlobal("GV_ZoneD_GearPuzzle") == 1 then
    AnimGBSequence("gremlinvillage_zoned.GV_ZoneD_Dragon", "Loop")
    DestroyEntity("gremlinvillage_zoned_dynamic.Trigger_GearPuzzle")
    AnimGBSequence("GV_ZoneD_Platform_GearPuzzle", "RestDown")
  end
  if 0 < GetGlobal("GV_ZoneD_FanPuzzleComplete") then
    ForEachEntityInGroup(AnimGBSequence, "gremlinvillage_zoned.GV_ZoneD_DollFountain", "looping")
    SetPropertyFloat("gremlinvillage_zoned_scripting.SK_DollBoat_Loop1", "BranchPathChance", 0)
    AnimGBSequence("ThinnerWhirlpool", "Full")
    if GetGlobal("GV_ZoneD_Braun_Freed_Played") == 1 then
      SetPropertyFloat("pOverturnedBoat_SFer02", "InitialHoldTime", 0)
      SplineFollower_TeleportToKnot("pOverturnedBoat_SFer02", "SK_DollBoat_Loop2")
    end
  end
  if GetGlobal("GV_ZoneD_FanPuzzleComplete") == 2 then
    GV_ZoneD_VentPuzzleCleanUp()
  end
  if GetGlobal("GV_ZoneD_OpenExit_Played") == 1 then
    DestroyEntity("gremlinvillage_zoned_scripting.Trigger_StreamInSBW")
    GV_DoorSwitch1 = 1
    GV_DoorSwitch2 = 1
    AnimGBSequence("gremlinvillage_zoned.GV_ZoneD_ExitDoor", "restopen")
    ForEachEntityInGroup(DestroyEntity, "Trigger_EndPlatforms")
    ForEachEntityInGroup(AnimGBSequence, "GV_ZoneD_EndPlatforms", "RestDown")
  end
end
GV_ZoneD_LoadCheckpoint = L0_0
L0_0 = false
GV_ZoneD_NoIntro = L0_0
function L0_0()
  if GV_ZoneD_NoIntro == false then
    GV_ZoneD_IntroCutScene()
  end
end
GV_ZoneD_Intro_Launcher = L0_0
function L0_0()
  Print("############################### GV_ZoneD_IntroCutScene")
  SetGlobal("GV_Pete_Intro_Played", 1)
  GV_ZoneD_MiscSetup()
  FireUser1("IntroCam1")
  Wait(0.8)
  MoveToEntity(GetPlayer(), "GV_ZoneD_MickeyStart")
  StreamInterior(nil, "stream_asiaoswald")
  Wait(2)
  FireThread(GV_ZoneD_Cleanup_GV_JungleToAsiaAirlock)
  Unhide("GV_ZoneD_IntroDoor")
  Hide("GV_ZoneD_PagodaGearCover")
end
GV_ZoneD_IntroCutScene = L0_0
function L0_0()
  Cleanup_GV_JungleToAsiaAirlock()
end
GV_ZoneD_Cleanup_GV_JungleToAsiaAirlock = L0_0
L0_0 = false
IntroDoorHidden = L0_0
function L0_0(A0_4)
  if IntroDoorHidden == false then
    IntroDoorHidden = true
    Hide(A0_4)
  end
end
GV_ZoneD_HideIntroDoor = L0_0
function L0_0()
  FireUser1("PagodaSpawnerR")
  wait(1.5)
  FireUser1("PagodaSpawnerL")
  ForEachEntityInGroup(Enable, "gremlinvillage_zoned_ai.Spawners_Taj")
end
GV_PeteIntro_Mid = L0_0
function L0_0()
  local L0_5
  L0_5 = Enable
  L0_5("gremlinvillage_zoned.Spawner_Oswald")
  L0_5 = FireUser1
  L0_5("IntroCam4")
  L0_5 = wait
  L0_5(1)
  L0_5 = "gremlinvillage_zoned.AI_Oswald"
  EnterCutscene(L0_5, 0)
  Wait(1.75)
  ExitCutscene(L0_5)
  EnableMotion(L0_5)
end
GV_Intro_Oswald = L0_0
function L0_0()
  AnimGBSequence("gremlinvillage_zoned.GV_ZoneD_ExitDoor", "close")
end
GV_ZoneD_Intro_CloseDoors = L0_0
function L0_0()
  DestroyEntity("gremlinvillage_zoned.AI_Oswald")
  StreamInterior(nil, "stream_gv_ABR_AI_SND")
  wait(1.5)
  GV_ZoneD_SaveCheckpoint("GV_ZoneD_MickeyStart")
end
GV_ZoneD_EndIntro = L0_0
function L0_0()
  FireSequence("GV_ZoneD_Gus", "GV_ZoneD_LookAtHerman")
end
GV_ZoneD_HermanCameraHint = L0_0
function L0_0()
  FireSequence("GV_ZoneD_Gus", "GV_ZoneD_LookAtLoo")
end
GV_ZoneD_LooCameraHint = L0_0
function L0_0()
  FireSequence("GV_ZoneD_Gus", "GV_ZoneD_GusBlocked")
end
GV_ZoneD_GusPlatformBlocked = L0_0
function L0_0()
  StreamInterior(nil, "stream_SBW_A")
end
GV_ZoneD_StreamInSBW = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("GV_ZoneD")
  FireSequence("GV_ZoneD_Gus", "GV_ZoneD_QuestCleanUp")
end
GV_ZoneD_LeaveLevel = L0_0
function L0_0()
  MoveToEntity(GetPlayer(), "demo_gv_gear_transition_area2.Isle3PortalExit 01")
end
GV_ZoneD_TransitionForward = L0_0
L0_0 = 0
ZoneD_AIPathingNode = L0_0
function L0_0(A0_6, A1_7)
  local L2_8
  L2_8 = A1_7
  L2_8 = L2_8 .. "1_1"
  if A1_7 == "Lower" then
    ZoneD_AIPathingNode = ZoneD_AIPathingNode + 1
    L2_8 = A1_7 .. ZoneD_AIPathingNode .. "_1"
  end
  SetNextPatrolNode(A0_6, "gremlinvillage_zoned_ai.PN_Taj" .. L2_8)
end
GV_ZoneD_AI_Pathing = L0_0
function L0_0(A0_9, A1_10)
  SetPropertyFloat(A0_9, "PatrolSpeed", A1_10)
end
GV_ZoneD_SetSpatterPatrolSpeed = L0_0
function L0_0()
  FireUser1("IGC_Start_TajBoat")
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_ABR_BoatRide_Fix")
  wait(1.5)
  SetSplineFollowerInitialSpeed("OverturnedBoat_SFer01", 2)
end
GV_ZoneD_Start_TajBoats = L0_0
function L0_0()
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "SF_DollBoats", 7)
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_ABR_DollBoats_ON")
  wait(0.5)
  FireUser1("BraunBoats")
  wait(0.25)
  AnimGBSequence("gremlinvillage_zoned.GV_ZoneD_BoatDoors", "opening")
  wait(0.25)
  Enable("Trigger_BoatHint")
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "SF_DollBoats", 2)
end
GV_ZoneD_Start_DollBoats = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.7)
  MoveToEntity(GetPlayer(), "Position_BraunLoc")
  wait(0.01)
  CameraReset()
end
GV_ZoneD_Braun_FreedSetup = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.8)
  EnableGuardianHint("PlayerHint_DollRide")
  EnableGuardianHint("PlayerHint_TajEntrance")
  DisableGuardianHint("PlayerHint_Braun")
  DestroyEntity("PlayerHint_Braun")
  if GetScrapperPercent(GetPlayer()) > 0 then
    MoveToEntity(GetPlayer(), "Position_PostBraunThinner")
    wait(0.01)
    CameraReset()
    wait(0.01)
    SetCameraAttributes("Trigger_PagodaCamHint_TopThinner")
  else
    MoveToEntity(GetPlayer(), "Position_PostBraunPaint")
    wait(0.01)
    CameraReset()
    wait(0.01)
    SetCameraAttributes("Trigger_PagodaCamHint_TopPaint")
  end
  wait(0.2)
  DestroyEntity("Gremlin_Braun")
  StartFadeIn()
  FireThread(GV_ZoneD_Braun_MickeyMove)
  wait(1)
  UnrestrictCutSceneInput()
  GV_ZoneD_SaveCheckpoint("GV_ZoneD_MickeyStart")
end
GV_ZoneD_BraunLeave = L0_0
function L0_0()
  local L0_11
  L0_11 = GetPosition
  L0_11 = L0_11(GetPlayer())
  while Prefab_ProjectorMickeyPosition(GetPosition(GetPlayer()), L0_11) < 0.1 do
    wait(0.5)
    Print("************************************* - GV_ZoneD_Braun_MickeyMove - wait 0.5")
  end
  ClearAllCameraAttributesTimed(1.5)
end
GV_ZoneD_Braun_MickeyMove = L0_0
function L0_0()
  local L0_12
  L0_12 = SetGlobal
  L0_12("GV_ZoneD_FanPuzzleComplete", 1)
  L0_12 = "Gremlin_Herman"
  TeleportGremlinOut(L0_12)
  wait(1)
  SetPropertyFloat("gremlinvillage_zoned_scripting.SK_DollBoat_Loop1", "BranchPathChance", 0)
  FireUser1("Herman_IGC1")
  Wait(0.7)
  Hide("Whirlpool_GearCover")
  FireThread(TeleportGremlinIn, L0_12, "Marker_FixWhirlpool", true, false)
  AnimGBSequence("ThinnerWhirlpool", "FillUp")
  wait(0.3)
  DisableMotion(L0_12)
  wait(0.4)
  EnterCutscene(L0_12, 1)
  wait(1)
  Rumble(GetPlayer(), 0.4)
  ShakeCamera(1.5, 3, 0.05, 4, 0.02, 0.045)
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_Gus_Fix")
  AnimGBSequence("WhirlpoolGear", "spin")
  wait(0.65)
  ShakeCamera(1, 5, 0.05, 4, 0.02, 0.045)
  Rumble(GetPlayer(), 0.6)
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_Gus_Fix")
  wait(0.4)
  StopEmitters("WhirlPoolGear_Steam")
  ShakeCamera(1.5, 5, 0.05, 4, 0.02, 0.045)
  Rumble(GetPlayer(), 0.6)
  Wait(0.75)
  FireThread(TeleportGremlinOut, L0_12)
  wait(3.5)
  AnimGBSequence("ThinnerWhirlpool", "Full")
end
GV_ZoneD_PayoffHerman = L0_0
function L0_0()
  SetPropertyFloat("gremlinvillage_zoned_scripting.SK_DollBoat_Loop1", "BranchPathChance", 0)
  AnimGBSequence("ThinnerWhirlpool", "FillUp")
  wait(7)
  AnimGBSequence("ThinnerWhirlpool", "Full")
end
GV_ZoneD_WhirlpoolUp = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.7)
  MoveToEntity(GetPlayer(), "Marker_Herman_PlayerLoc")
  wait(0.01)
  CameraReset()
end
GV_ZoneD_Herman_FreedSetup = L0_0
function L0_0()
  FireUser4("Herman_IGC1")
  wait(0.4)
  TeleportGremlinIn("Gremlin_Herman", "Marker_HermanStart", true, false, false)
end
GV_ZoneD_PayoffHerman_End = L0_0
function L0_0()
  local L0_13
  L0_13 = "Gremlin_Herman"
  SetLetterbox(1)
  FireUser1("GV_ZoneD_HermanMoveCam")
  Wait(0.1)
  TeleportGremlinOut(L0_13)
  wait(0.4)
  TeleportGremlinIn(L0_13, "GV_ZoneD_MoveHermanHere")
  DisableMotion(L0_13)
  Wait(0.5)
  FireUser3("GV_ZoneD_HermanMoveCam")
end
GV_ZoneD_MoveHermanOffIsland = L0_0
function L0_0()
  Unhide("Whirlpool_GearCover")
  TeleportGremlinOut("Gremlin_Herman")
  DestroyEntity("Gremlin_Herman")
  if GetGlobal("GV_ZoneD_FanPuzzleComplete") < 2 then
    EnableGuardianHint("PlayerHint_Vent")
  end
  DisableGuardianHint("PlayerHint_DollRide")
  EnableGuardianHint("PlayerHint_DollGears")
  GV_ZoneD_SaveCheckpoint("Position_WhirlpoolStart")
end
GV_ZoneD_HermanLeave = L0_0
function L0_0()
  FireUser1("LowerTajPlatform")
  Disable("gremlinvillage_zoned.Trigger 06")
  SetPropertyBool("gremlinvillage_zoned.MagicCarpet1", "AIHintEnabled", false)
  SetPropertyBool("gremlinvillage_zoned.MagicCarpet2", "AIHintEnabled", false)
  AnimGBSequence("gremlinvillage_zoned.MagicCarpet1", "looping", false, 0, 7)
  wait(1)
  SetRotatorMaxSpeed("gremlinvillage_zoned.Taj_Platform1", 30)
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_ABR_Loo_Platform")
  AnimGBSequence("gremlinvillage_zoned.MagicCarpet2", "looping", false, 0, 20)
  AnimGBSequence("gremlinvillage_zoned.MagicCarpet3", "looping", false, 0, 33)
end
GV_ZoneD_RescueGremlinLoo = L0_0
function L0_0()
  EnableGuardianHint("PlayerHint_Exit")
  DisableGuardianHint("PlayerHint_TajEntrance")
  TeleportGremlinOut("Gremlin_Loo")
  DestroyEntity("Gremlin_Loo")
  GV_ZoneD_SaveCheckpoint("GV_ZoneD_MickeyStart")
end
GV_ZoneD_LooLeave = L0_0
function L0_0()
  SetPropertyBool("gremlinvillage_zoned.MagicCarpet1", "AIHintEnabled", true)
  SetPropertyBool("gremlinvillage_zoned.MagicCarpet2", "AIHintEnabled", true)
end
GV_ZoneD_EnableCarpetsAIHint = L0_0
function L0_0(A0_14, A1_15)
  if DamageEvent_HasStimulusType(A1_15, ST_SPIN) then
    SetPropertyBool(A0_14, "ForceInvulnerable", true)
    DisableGlint(A0_14)
    FireUser1("GV_ZoneD_CamTajDoor")
    wait(1.5)
    AnimGBSequence("gremlinvillage_zoned.UnderTaj_SecretDoor", "opening")
  end
end
GV_ZoneD_OpenGremlinLooDoor = L0_0
function L0_0(A0_16, A1_17)
  if DamageEvent_HasStimulusType(A1_17, ST_SPIN) then
    SetPropertyBool(A0_16, "ForceInvulnerable", true)
    FireUser1("IGC_PagodaPlatforms")
    Wait(1)
    DisableGlint(A0_16)
    StopEmitters("PagodaSteam")
    SetSplineFollowerInitialSpeed("gremlinvillage_zoned.GV_ZoneD_StepInert_01 01", 7)
    SetSplineFollowerInitialSpeed("gremlinvillage_zoned.GV_ZoneD_StepInert_02 01", 7)
  end
end
GV_PagodaGearHit = L0_0
L0_0 = 0
GV_ZoneD_TajGearsBroke = L0_0
function L0_0(A0_18, A1_19)
  Print("************************ - GV_ZoneD_TajGearsState: " .. A1_19)
  if A1_19 == "Thinned" then
    GV_ZoneD_TajGearsBroke = GV_ZoneD_TajGearsBroke + 1
  elseif A1_19 == "Painted" then
    GV_ZoneD_TajGearsBroke = GV_ZoneD_TajGearsBroke - 1
  end
  if GV_ZoneD_TajGearsBroke == 2 then
    SetRotatorMaxSpeed("SF_TajGear_Inert", 0)
    FireSequence("GV_ZoneD_Gus", "GV_ZoneD_BreakTajGear")
    SetGlobal("GV_TajGearsBroken", 1)
  end
end
GV_ZoneD_TajGearsState = L0_0
function L0_0()
  FireUser1("IGC_StopCarpets")
  ForcePainted("gremlinvillage_zoned.MagicCarpet3")
  ForcePainted("gremlinvillage_zoned.MagicCarpet2")
  ForcePainted("gremlinvillage_zoned.MagicCarpet1")
  wait(0.7)
  AnimGBSequence("gremlinvillage_zoned.MagicCarpet3", "Broken1", false, 4.5)
  AnimGBSequence("gremlinvillage_zoned.MagicCarpet2", "Broken2", false, 4.5)
  AnimGBSequence("gremlinvillage_zoned.MagicCarpet1", "rest", false, 1)
  wait(4.5)
  AnimGBSequence("gremlinvillage_zoned.MagicCarpet2", "RestBroken2", false, 1)
  AnimGBSequence("gremlinvillage_zoned.MagicCarpet3", "RestBroke1", false, 1)
end
GV_ZoneD_TajGearConcequences = L0_0
function L0_0(A0_20, A1_21, A2_22)
  local L3_23, L4_24, L5_25, L6_26, L7_27, L8_28, L9_29, L10_30
  L3_23 = 0
  L4_24 = 1
  L5_25 = 3
  L6_26 = 3
  if A2_22 == "Painted" then
    if A1_21 == "Duo" then
      L4_24 = 4
      L5_25 = 5
      L6_26 = 2
    end
    for L10_30 = L4_24, L5_25 do
      if GetPropertyBool("GV_ZoneD_GearMachine" .. L10_30, "Is Painted") then
        L3_23 = L3_23 + 1
      end
    end
    if L3_23 == L6_26 then
      L10_30 = A1_21
      L7_27(L8_28, L9_29)
      if A1_21 == "Duo" then
        L7_27(L8_28, L9_29)
        L7_27(L8_28, L9_29)
      else
        L7_27(L8_28, L9_29)
        L7_27(L8_28, L9_29)
      end
      L7_27()
    end
  elseif A2_22 == "Thinned" then
    L10_30 = A1_21
    L7_27(L8_28, L9_29)
    if A1_21 == "Duo" then
      L7_27(L8_28, L9_29)
      L7_27(L8_28, L9_29)
    else
      L7_27(L8_28, L9_29)
      L7_27(L8_28, L9_29)
    end
    if L7_27 == false then
      L7_27(L8_28, L9_29)
    end
  end
end
GV_ZoneD_GearMachineGroup = L0_0
L0_0 = "closed"
GV_ZoneD_DragonDoorAnim = L0_0
L0_0 = false
GV_ZoneD_PlayerInChestRoom = L0_0
function L0_0(A0_31, A1_32)
  local L2_33, L3_34, L4_35, L5_36, L6_37
  if A1_32 == "false" then
    L2_33 = false
    GV_ZoneD_PlayerInChestRoom = L2_33
    L2_33 = 0
    for L6_37 = 1, 5 do
      if GetPropertyBool("GV_ZoneD_GearMachine" .. L6_37, "Is Painted") then
        L2_33 = L2_33 + 1
      end
    end
    if L2_33 < 5 then
      L3_34(L4_35, L5_36)
    end
  elseif A1_32 == "true" then
    L2_33 = true
    GV_ZoneD_PlayerInChestRoom = L2_33
    L2_33 = GV_ZoneD_Dragon_DoorMove
    L2_33(L3_34, L4_35)
    L2_33 = AudioPostEventOn
    L2_33(L3_34, L4_35)
  end
end
GV_ZoneD_PlayerInChestRoomCheck = L0_0
function L0_0(A0_38, A1_39)
  if GV_ZoneD_DragonDoorAnim == "closed" and A1_39 == "closing" then
  else
    Print("************************ - GV_ZoneD_Dragon_DoorMove: " .. A1_39)
    GV_ZoneD_DragonDoorAnim = A1_39
    AnimGBSequence("gremlinvillage_zoned.Dragon_Door", A1_39)
  end
end
GV_ZoneD_Dragon_DoorMove = L0_0
function L0_0()
  local L0_40, L1_41, L2_42, L3_43, L4_44
  L0_40 = 0
  for L4_44 = 1, 5 do
    if GetPropertyBool("GV_ZoneD_GearMachine" .. L4_44, "Is Painted") then
      L0_40 = L0_40 + 1
    end
  end
  if L0_40 == 5 then
    L1_41(L2_42, L3_43)
    L1_41(L2_42, L3_43)
  end
end
GV_ZoneD_GearMachine_PaintedCheck = L0_0
function L0_0()
  if GetGlobal("GV_ZoneD_GearPuzzle") == 0 then
    SetGlobal("GV_ZoneD_GearPuzzle", 1)
    FireUser1("GV_ZoneD_GearCam01")
    wait(0.7)
    if 0 < GetGlobal("GV_ZoneD_FanPuzzleComplete") then
      ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "SF_DollBoats", 0)
      SplineFollower_TeleportToKnot("pOverturnedBoat_SFer02", "SK_DollBoat_Loop2")
      SplineFollower_TeleportToKnot("pOverturnedBoat_SFer03", "SK_DollBoat_Loop6")
      SplineFollower_TeleportToKnot("pOverturnedBoat_SFer04", "SK_DollBoat_Loop4")
    end
    AudioPostEventOn(GetPlayer(), "Play_sfx_ABR_DragonBridge")
    AnimGBSequence("gremlinvillage_zoned.GV_ZoneD_Dragon", "Rising")
    wait(2)
    AudioPostEventOn("gremlinvillage_zoned.GV_ZoneD_Dragon", "Play_sfx_GV_ABR_Dragon_LP")
    FireSequence("GV_ZoneD_Gus", "GV_ZoneD_RaiseCanal")
    wait(5)
    AnimGBSequence("gremlinvillage_zoned.GV_ZoneD_Dragon", "Loop")
  end
end
GV_RaiseSunkenTrack = L0_0
function L0_0()
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "SF_DollBoats", 2)
  GV_ZoneD_SaveCheckpoint("Position_WhirlpoolStart")
end
GV_RaiseSunkenTrack_End = L0_0
L0_0 = false
GV_ZoneD_GearCamHintActive = L0_0
function L0_0(A0_45, A1_46)
  Print("************************ - GV_ZoneD_GearCamHint: " .. A1_46)
  if A1_46 == "On" then
    if GV_ZoneD_GearCamHintActive == false then
      GV_ZoneD_GearCamHintActive = true
      SetCameraAttributes("gremlinvillage_zoned.PT_CO_GearPlatform01")
    end
  elseif A1_46 == "Off" and GV_ZoneD_GearCamHintActive == true then
    GV_ZoneD_GearCamHintActive = false
    ClearAllCameraAttributesTimed(1)
  end
end
GV_ZoneD_GearCamHint = L0_0
function L0_0(A0_47)
  GV_ZoneD_GearCamHintActive = false
  GV_ZoneD_GearCamHint(A0_47, "On")
end
GV_ZoneD_GearCamHint_Reset = L0_0
L0_0 = 0
GV_DoorSwitch1 = L0_0
L0_0 = 0
GV_DoorSwitch2 = L0_0
function L0_0(A0_48, A1_49)
  if _G["GV_DoorSwitch" .. A1_49] == 0 then
    _G["GV_DoorSwitch" .. A1_49] = 1
    Print("Click")
    GV_ZoneD_ExitDoor()
  end
end
GV_ZoneD_DoorSwitch = L0_0
L0_0 = 0
GV_ZoneD_ExitDoorTriggerCount = L0_0
function L0_0()
  GV_ZoneD_ExitDoorTriggerCount = GV_ZoneD_ExitDoorTriggerCount + 1
  if GV_ZoneD_ExitDoorTriggerCount == 2 then
    Disable("gremlinvillage_zoned_scripting.Trigger_StreamInSBW")
  end
end
GV_ZoneD_ExitDoorTrigger = L0_0
function L0_0()
  if GV_DoorSwitch1 == 1 and GV_DoorSwitch2 == 1 then
    RestrictCutSceneInput()
    GrabCamera("gremlinvillage_zoned_igc.CameraControlPoint 01", "gremlinvillage_zoned.CameraControlPoint 01_LookAt", CAMERA_LERP_TRANSITION, 0)
    AnimGBSequence("gremlinvillage_zoned.GV_ZoneD_ExitDoor", "open")
    FireSequence("GV_ZoneD_Gus", "GV_ZoneD_OpenExit")
  end
end
GV_ZoneD_ExitDoor = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  GV_ZoneD_SaveCheckpoint("gremlinvillage_zoned_scripting.PositionMarker_ExitOpen")
  UnrestrictCutSceneInput()
end
GV_ZoneD_ExitDoor_EndIGC = L0_0
function L0_0()
  if GetGlobal("GV_ZoneD_IntroValves_Played") == 0 then
    ForEachEntityInGroup(DestroyEntity, "gremlinvillage_zoned_scripting.Trigger_CO_VentHints")
    SetCameraAttributes("gremlinvillage_zoned_scripting.PlaneTrigger_Vent_CameraOverride")
    FireSequence("GV_ZoneD_Gus", "GV_ZoneD_IntroValves")
  end
end
GV_ZoneD_HitValve_Tutorial = L0_0
function L0_0()
  if GetGlobal("GV_ZoneD_IntroValves_Played") == 0 then
    DestroyEntity("gremlinvillage_zoned_scripting.Trigger_CO_VentHint2")
    SetCameraAttributes("gremlinvillage_zoned_scripting.PlaneTrigger_Vent_CameraOverride")
    FireSequence("GV_ZoneD_Gus", "GV_ZoneD_StoppedValve")
  end
end
GV_ZoneD_FarEndSteamCheck = L0_0
function L0_0()
  local L0_50, L1_51, L2_52, L3_53
  L0_50(L1_51, L2_52)
  for L3_53 = 2, 4 do
    StopEmitters("GV_FanGear0" .. L3_53 .. "_SteamJet_Blast")
    Disable("GV_FanGear0" .. L3_53 .. "_SteamTriggerDamage")
  end
  L3_53 = false
  L0_50(L1_51, L2_52, L3_53, 0, 2)
  if L0_50 == 0 then
    L0_50.OnCageBrokenDialogue = "GV_ZoneD_Herman_Thank"
  end
end
GV_ZoneD_VentPuzzleCleanUp = L0_0
L0_0 = false
GV_ZoneD_ValveTimerActive = L0_0
L0_0 = 1
GV_ZoneD_ValveActive = L0_0
function L0_0(A0_54, A1_55, A2_56)
  Print("GV_ZoneD_ValveTurned")
  if GetGlobal("GV_ZoneD_FanPuzzleComplete") < 2 then
    Print("GV_ZoneD_ValveTurned - GLOBAL == 0")
    if DamageEvent_HasStimulusType(A1_55, ST_SPIN) then
      Print("GV_ZoneD_ValveTurned - SPIN ATTACK")
      if tonumber(A2_56) - 1 <= GV_ZoneD_ValveActive then
        Print("GV_ZoneD_ValveTurned - GV_ZoneD_ValveActive > currentgear or GV_ZoneD_ValveActive == 1")
        if GV_ZoneD_ValveActive == 1 then
          Print("GV_ZoneD_ValveTurned - GV_ZoneD_ValveActive == 1")
          TimerStart(10, 6, 3)
          if GV_ZoneD_ValveTimerActive == false then
            GV_ZoneD_ValveTimerActive = true
            FireThread(GV_ZoneD_TimerEnd)
          end
          FireSequence("GV_ZoneD_Gus", "GV_ZoneD_HitValve")
        else
          Print("GV_ZoneD_ValveTurned - GV_ZoneD_ValveActive > 1")
          TimerSetTime(10)
        end
        GV_ZoneD_ValveActive = tonumber(A2_56)
        AnimGBReset(A0_54)
        AnimGBSequence(A0_54, "Hit")
        AudioPostEventOn(A0_54, "Play_sfx_GV_Faucet_Turn")
        StopEmitters("GV_FanGear0" .. A2_56 .. "_SteamJet_Blast")
        Disable("GV_FanGear0" .. A2_56 .. "_SteamTriggerDamage")
        AudioPostEventOn("GV_WallSteam_FanGear0" .. A2_56 .. "_Audio", "Stop_sfx_GV_ABR_Steam")
      else
        AudioPostEventOn(A0_54, "Play_sfx_GV_Faucet_Stuck")
        FireSequence("GV_ZoneD_Gus", "GV_ZoneD_StoppedValve")
      end
    end
  else
    FireSequence("GV_ZoneD_Gus", "GV_ZoneB_ValveStuck")
    FireSequence("GV_ZoneD_Gus", "Generic Line 38")
  end
end
GV_ZoneD_ValveTurned = L0_0
function L0_0()
  local L0_57
  L0_57 = TimerGetState
  L0_57 = L0_57()
  L0_57 = "Ticking"
  while L0_57 == "Ticking" do
    wait(0.25)
    L0_57 = TimerGetState()
  end
  GV_ZoneD_ValveStop()
end
GV_ZoneD_TimerEnd = L0_0
function L0_0()
  local L0_58, L1_59, L2_60, L3_61
  if L0_58 < 2 then
    L0_58()
    for L3_61 = 2, GV_ZoneD_ValveActive do
      StartEmitters("GV_FanGear0" .. L3_61 .. "_SteamJet_Blast")
      Enable("GV_FanGear0" .. L3_61 .. "_SteamTriggerDamage")
      AudioPostEventOn("GV_WallSteam_FanGear0" .. L3_61 .. "_Audio", "Play_sfx_GV_ABR_Steam")
    end
    GV_ZoneD_ValveTimerActive = L0_58
    GV_ZoneD_ValveActive = L0_58
    if L0_58 == 0 then
      L0_58(L1_59, L2_60)
    else
      L0_58(L1_59, L2_60)
    end
  end
end
GV_ZoneD_ValveStop = L0_0
function L0_0(A0_62, A1_63)
  if GetGlobal("GV_ZoneD_FanPuzzleComplete") < 2 then
    if GV_ZoneD_ValveActive == 4 and DamageEvent_HasStimulusType(A1_63, ST_SPIN) then
      AnimGBSequence(A0_62, "Hit")
      AudioPostEventOn("gremlinvillage_zoned.GV_FanGear04", "Play_sfx_GV_Faucet_Turn")
      SetGlobal("GV_ZoneD_FanPuzzleComplete", 2)
      TimerStop()
      if 1 == 0 then
        FireUser1("IGC_FixVentPuzzle")
        if GetGlobal("GV_ZoneD_Herman_Freed_Played") == 0 then
          GetPrefabData("HermanCage").GlobalToCheck = "GV_ZoneD_Herman_Thank_Played"
          GetPrefabData("HermanCage").OnCageBrokenDialogue = "GV_ZoneD_Herman_Thank"
        end
        ForEachEntityInGroup(AnimGBSequence, "gremlinvillage_zoned.GV_ZoneD_DollFountain", "rotating")
        SetPropertyFloat("gremlinvillage_zoned_scripting.SK_DollBoat_Loop1", "BranchPathChance", 0)
        wait(1)
      elseif 1 == 1 then
        FireUser1("IGC_VentOpeningAlt")
      end
      AnimGBSequence("gremlinvillage_zoned.VentGate", "opening")
      AudioPostEventOn(GetPlayer(), "Play_sfx_GV_ABR_LogDoor_Open")
      wait(1.5)
      AnimGBSequence("ThinnerWhirlpool", "FillUp", true)
      wait(3)
      if 1 == 1 then
        FireSequence("GV_ZoneD_Gus", "TLB_Gus_RedChest")
      else
        FireSequence("GV_ZoneD_Gus", "GV_ZoneD_GusBigWallFixed")
      end
      wait(4)
      AnimGBSequence("ThinnerWhirlpool", "Full")
      DisableGuardianHint("PlayerHint_Vent")
    end
  else
    FireSequence("GV_ZoneD_Gus", "GV_ZoneB_ValveStuck")
    FireSequence("GV_ZoneD_Gus", "Generic Line 38")
  end
end
GV_ZoneD_Valve04Turned = L0_0
function L0_0()
  FireUser3("IGC_VentOpeningAlt")
  GV_ZoneD_SaveCheckpoint("Position_WhirlpoolStart")
end
TL_ZoneB_SaveCheckpoint = L0_0
function L0_0()
  FireSequence("GV_ZoneD_Gus", "GV_ZoneD_GusReachedExit")
end
GV_ZoneD_GusReachedExit = L0_0
function L0_0()
  local L0_64, L1_65
  GV_ZoneD_BraunLeave = L0_64
  L0_64 = nil
  GV_ZoneD_AI_Pathing = L0_64
  L0_64 = nil
  GV_ZoneD_LoadCheckpoint = L0_64
  L0_64 = nil
  GV_ZoneD_Start_TajBoats = L0_64
  L0_64 = nil
  GV_ZoneD_GearMachineGroup = L0_64
  L0_64 = nil
  GV_ZoneD_HermanCameraHint = L0_64
  L0_64 = nil
  GV_ZoneD_GusReachedExit = L0_64
  L0_64 = nil
  GV_PagodaGearHit = L0_64
  L0_64 = nil
  GV_ZoneD_MiscSetup = L0_64
  L0_64 = nil
  TL_ZoneB_SaveCheckpoint = L0_64
  L0_64 = nil
  GV_ZoneD_LooCameraHint = L0_64
  L0_64 = nil
  GV_RaiseSunkenTrack_End = L0_64
  L0_64 = nil
  GV_ZoneD_LeaveLevel = L0_64
  L0_64 = nil
  GV_ZoneD_SaveCheckpoint_WP = L0_64
  L0_64 = nil
  GV_ZoneD_ValveStop = L0_64
  L0_64 = nil
  GV_ZoneD_GearCamHint_Reset = L0_64
  L0_64 = nil
  GV_ZoneD_VentPuzzleCleanUp = L0_64
  L0_64 = nil
  GV_ZoneD_Intro_Launcher = L0_64
  L0_64 = nil
  GV_Intro_Oswald = L0_64
  L0_64 = nil
  GV_ZoneD_GearCamHint = L0_64
  L0_64 = nil
  GV_ZoneD_ExitDoor = L0_64
  L0_64 = nil
  GV_ZoneD_DoorSwitch = L0_64
  L0_64 = nil
  GV_ZoneD_OpenGremlinLooDoor = L0_64
  L0_64 = nil
  GV_ZoneD_EnableCarpetsAIHint = L0_64
  L0_64 = nil
  GV_ZoneD_GearMachine_PaintedCheck = L0_64
  L0_64 = nil
  GV_ZoneD_Start_DollBoats = L0_64
  L0_64 = nil
  GV_ZoneD_HitValve_Tutorial = L0_64
  L0_64 = nil
  GV_ZoneD_EndIntro = L0_64
  L0_64 = nil
  GV_RaiseSunkenTrack = L0_64
  L0_64 = nil
  GV_ZoneD_Intro_CloseDoors = L0_64
  L0_64 = nil
  GV_ZoneD_GusPlatformBlocked = L0_64
  L0_64 = nil
  GV_ZoneD_FarEndSteamCheck = L0_64
  L0_64 = nil
  GV_ZoneD_TajGearConcequences = L0_64
  L0_64 = nil
  GV_ZoneD_HermanLeave = L0_64
  L0_64 = nil
  GV_ZoneD_ValveTurned = L0_64
  L0_64 = nil
  GV_ZoneD_SaveCheckpoint_Start = L0_64
  L0_64 = nil
  GV_ZoneD_TajGearsState = L0_64
  L0_64 = nil
  GV_ZoneD_TransitionForward = L0_64
  L0_64 = nil
  GV_ZoneD_LooLeave = L0_64
  L0_64 = nil
  GV_ZoneD_PayoffHerman_End = L0_64
  L0_64 = nil
  GV_ZoneD_Dragon_DoorMove = L0_64
  L0_64 = nil
  GV_ZoneD_RescueGremlinLoo = L0_64
  L0_64 = nil
  GV_ZoneD_TimerEnd = L0_64
  L0_64 = nil
  GV_ZoneD_HideIntroDoor = L0_64
  L0_64 = nil
  GV_ZoneD_SetSpatterPatrolSpeed = L0_64
  L0_64 = nil
  GV_ZoneD_SetUpGuardianHints = L0_64
  L0_64 = nil
  GV_ZoneD_SaveCheckpoint = L0_64
  L0_64 = nil
  GV_ZoneD_StreamInSBW = L0_64
  L0_64 = nil
  GV_ZoneD_Valve04Turned = L0_64
  L0_64 = nil
  GV_ZoneD_IntroCutScene = L0_64
  L0_64 = nil
  GV_PeteIntro_Mid = L0_64
  L0_64 = nil
  GV_ZoneD_PayoffHerman = L0_64
  L0_64 = nil
  Cleanup_GV_ZoneD = L0_64
end
Cleanup_GV_ZoneD = L0_0
