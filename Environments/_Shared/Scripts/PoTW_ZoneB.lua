function PotW_ZoneD_Load()
  SetMap(GetPlayer(), "MAP_P_ZONEB", "GAME")
  if GetGlobal("PotW_Tortooga_IntroPlayed") == 0 then
    potw_ZoneB_SaveCheckpoint()
    PotW_ZoneB1_Intro()
    SetGlobal("PotW_Tortooga_IntroPlayed", 1)
  end
  PotW_ZoneB1_Setup()
end
function PotW_ZoneJ_Load()
  Print("POTW Zone J Load")
  StreamInterior(nil, "stream_2_2")
  SetGlobal("PotW_PlayerHasKeyToVillage", 1)
  DestroyEntity("potw_playerstart_tortuga1.Trigger")
  SetMap(GetPlayer(), "MAP_P_ZONEB2", "GAME")
  PotW_ZoneB2_Setup()
end
function potw_stream7()
  StreamInterior(nil, "stream_7")
end
function potw_stream3()
  local L0_0, L1_1
end
function PotW_ZoneB_VisitCheck()
  if GetGlobal("PotW_PlayerHasKeyToVillage") == 0 then
    PotW_ZoneD_Load()
  end
end
PotW_ZoneB_NoIntro = false
function PotW_Tortuga_V1_Intro()
  Print("^^^^^^^^^^^^^^^^^^^ Calling Load Through Launcher (V1)")
  SetGlobal("PotW_PlayerHasKeyToVillage", 0)
  PotW_ZoneD_Load()
end
function PotW_Tortuga_V2_Intro()
  Print("^^^^^^^^^^^^^^^^^^^ Calling Load Through Launcher (V2)")
  SetGlobal("PotW_PlayerHasKeyToVillage", 1)
  if PotW_ZoneB_NoIntro == false then
    GetPrefabData("potw_ZoneB_Start2").MapLoad_SetupPosition = "True"
  end
  OnMapLoad_ProjectorSetup("potw_ZoneB_Start2")
end
function PotW_ZoneB1_Setup()
  StartTrackingCurrentLevelForScoring("potw_Tortooga")
  Print("B1 Setup")
  SetGlobal("potw_tortuga_startLocation", 0)
  GuardianPrefab_PopulateGuardians("MickeyHead_Jungle")
  potw_Tortooga_HintSetup()
  SetDefaultCameraValues(4, 16, -12)
  SetTravelCameraValues(5, 25, -20)
  ForEachEntityInGroup(Hide, "Daisy_RLeg")
  DisableGlint("potw_zoneb_dynamic.The Well")
  PotW_Tortuga_EnableAI()
end
function PotW_ZoneB2_Setup()
  StartTrackingCurrentLevelForScoring("potw_Tortooga")
  Print("B2 Setup")
  SetGlobal("potw_tortuga_startLocation", 1)
  SetDefaultCameraValues(4, 16, -12)
  SetTravelCameraValues(5, 25, -20)
  SetGlobal("potw_zoneb_BagContents", 1)
  SetGlobal("potw_zoneb_BagCount", 1)
  SetGlobal("Pirate_Guide_V1_OpenPortal_Played", 1)
  SetGlobal("Pirate_Guide_BagCheck_Played", 1)
  DestroyEntity("potw_zoneb_dynamic.MansionDoor")
  ForEachEntityInGroup(DestroyEntity, "potw_zoneb_dynamic.JailKeys")
  ForEachEntityInGroup(FireUser1, "potw_zoneb_audio.Sound_Marker_Keys")
  ForEachEntityInGroup(DestroyEntity, "Visit1Mansion")
  DisableGlint("potw_zoneb_dynamic.The Well")
  DestroyEntity("potw_zoneb_dynamic.Lantern01")
  DestroyEntity("potw_zoneb_dynamic.Lantern02")
  DestroyEntity("potw_zoneb_dynamic.Lantern03")
  PotW_Tortuga_EnableAI()
  Print("AI Active")
  DestroyEntity("potw_zonec.JailedPirate3")
  DestroyEntity("potw_zonec.JailDoorTriggerUse 03")
  Enable("potw_zonec.JailCell3")
  if GetGlobal("PotW_Tortooga_IntroPlayed") < 2 then
    PotW_ZoneB2_Intro()
    SetGlobal("PotW_Tortooga_IntroPlayed", 2)
    Print(" . ................................ CHECKPOINT SAVED AFTER INTRO IGC")
  end
end
function PotW_ZoneB1_Intro()
  Print("B1 Intro")
  SetGlobal("PotW_2D_V1_Intro", 1)
  RestrictCutSceneInput()
  StartFadeOut(0)
  Wait(0.5)
  PlayAndUnlockMovie("PotW_visit1_Intro_to_Pirates.bik", "PotW_visit1_Intro_to_Pirates")
  StartFadeOut(0)
  StartFadeInNoHUD(1)
  EnableGuardianSystem()
  StreamInterior(nil, "stream_2_2")
  FireSequence("Tortuga_Gus", "PotW_HookQuest")
end
function potw_WatchSketchMovie()
  StartFadeOut(0)
  PlayAndUnlockMovie("PotW_visit1_Training_Watch.bik", "PotW_visit1_Training_Watch")
  StartFadeIn(1)
end
function potw_WatchSketchMovie2()
  StartFadeOut(1)
  wait(1)
  PlayAndUnlockMovie("PotW_visit1_Training_Watch.bik", "PotW_visit1_Training_Watch")
  CameraReset()
  StartFadeIn(0.8)
  wait(1)
  FireSequence("PotW_ZoneB.Pirate_Guide", "Pirate_Guide_BagQuests")
  UnrestrictCutSceneInput()
end
function PotW_ZoneB2_Intro()
  Print("B2 Intro")
  TeleportToEntity(GetPlayer(), "Visit2_Start")
  Wait(0.5)
  FireSequence("Tortuga_Gus", "PoTW_V2_GusFindBilly")
end
function PotW_Tortuga_EnableAI()
  SetGlobal("MS_MeanStreetProgress", 4)
  if GetGlobal("PotW_PlayerHasKeyToVillage") == 1 then
    Print("Visit 2 AI Setup")
    ForEachEntityInGroup(Enable, "Spawners_V2")
    Enable("Spawner_PirateWatch_Door")
    ForEachEntityInGroup(DestroyEntity, "Tortuga_ExtraTickets")
  else
    Print("Visit 1 AI Setup")
    SetParentEntity("Billy_WatchSpawner", ForceSpawn("potw_zoneb_ai.Spawner_PirateWatch", 1)[1])
    ForEachEntityInGroup(Enable, "potw_zoneb_ai.Spawners_V1")
  end
end
function PotW_Tortuga_SeerAI()
  TeleportToEntity("potw_zoneb_ai.FodderBlotling 02", "potw_zoneb_ai.PatrolNode_WellArea 04")
  SetNextPatrolNode("potw_zoneb_ai.FodderBlotling 02", "potw_zoneb_ai.PatrolNode_WellArea 04")
end
function potw_Tortooga_BagCheck()
  if GetGlobal("PotW_PlayerHasKeyToVillage") == 1 then
    ForEachEntityInGroup(DestroyEntity, "Beluga_Bag_Contents")
    ForEachEntityInGroup(DestroyEntity, "Beluga_Bag_QuestPickup")
  elseif GetGlobal("PotW_PlayerHasKeyToVillage") == 0 then
    if GetGlobal("Pirate_Guide_V1_OpenPortal_Played") == 0 then
      Print(".......................... Unhide Contents")
      ForEachEntityInGroup(Unhide, "Beluga_Bag_Contents")
    else
      ForEachEntityInGroup(Hide, "Beluga_Bag_Contents")
    end
    if GetGlobal("Pirate_Guide_BagCheck_Played") == 0 then
      Print(".......................... Unhide Quest Pickup")
      ForEachEntityInGroup(Unhide, "Beluga_Bag_QuestPickup")
    else
      ForEachEntityInGroup(Hide, "Beluga_Bag_QuestPickup")
    end
  end
end
function potw_Tortooga_LanternCheck()
  if GetGlobal("PotW_Jail_CagedPirate1Freed") == 1 then
    AnimGBSequence("potw_zonec.JailCell1", "opening")
    Unhide("potw_zoneb_dynamic.Lantern01")
    Unhide("potw_zoneb_dynamic.Lantern02")
    Unhide("potw_zoneb_dynamic.Lantern03")
  else
    Hide("potw_zoneb_dynamic.Lantern01")
    Hide("potw_zoneb_dynamic.Lantern02")
    Hide("potw_zoneb_dynamic.Lantern03")
  end
end
function potw_pirate2anims()
  AnimVarInt("potw_zoneb_ai_3.FreedPirate3", VAR_NPC_State, 6)
end
function potw_UnloadJail()
  local L0_2, L1_3
end
function potw_ZoneB_StarkeySetup(A0_4)
  AI_SetDisabled(A0_4, true)
  AnimVarInt(A0_4, VAR_NPC_State, 3)
  AnimVarInt(A0_4, VAR_Mood_Type, 1)
end
tortugaStartLocation = "From2DStart"
function potw_ZoneB_SaveCheckpoint()
  if GetGlobal("potw_tortuga_startLocation") == 0 then
    tortugaStartLocation = "From2DStart"
  else
    tortugaStartLocation = "Visit2_Start"
  end
  SaveCheckpoint(GetPlayer(), "potw_ZoneB_LoadCheckpoint", tortugaStartLocation)
end
function potw_ZoneB_LoadCheckpoint()
  Print("vvvvvv vvvvvv Load Checkpoint Running")
  PotW_ZoneB_NoIntro = true
  SetDefaultCameraValues(4, 16, -12)
  StartTrackingCurrentLevelForScoring("potw_Tortooga")
  if GetGlobal("PotW_GremlinMarc_Thanks_Played") == 1 then
    ForEachEntityInGroup(DestroyEntity, "caged_gremlin_Marc")
  end
  if GetGlobal("PotW_PlayerHasKeyToVillage") == 0 then
    StreamInterior(nil, "stream_2_2")
    Print("vvvvvv vvvvvv Load Checkpoint Running (Visit 1)")
    SetGlobal("potw_tortuga_startLocation", 0)
    GuardianPrefab_PopulateGuardians("MickeyHead_Jungle")
    SetMap(GetPlayer(), "MAP_P_ZONEB", "GAME")
    SetDefaultCameraValues(4, 16, -12)
    SetTravelCameraValues(5, 25, -20)
    ForEachEntityInGroup(Hide, "Daisy_RLeg")
    if GetGlobal("PotW_Jail_CagedPirate1Freed") == 0 or GetGlobal("PotW_Jail_CagedPirate2Freed") == 0 or GetGlobal("PotW_Jail_CagedPirate3Freed") == 0 and GetGlobal("Pirate_Guide_BagCheck_Played") == 1 then
      potw_Tortooga_HintEnableKeys()
    end
    if GetGlobal("Pirate_Guide_BagCheck_Played") == 0 then
      EnableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_Bag")
      SetGlobal("potw_zoneb_BagCount", 0)
    end
    if GetGlobal("PotW_Jail_CagedPirate1Freed") == 1 then
      AnimGBSequence("potw_zonec.JailCell1", "opening")
      Print("vvvvvv vvvvvv Jail 1 open")
    else
    end
    if GetGlobal("PotW_Jail_CagedPirate2Freed") == 1 then
      AnimGBSequence("potw_zonec.JailCell2", "opening")
      Print("vvvvvv vvvvvv Jail 1 open")
      DestroyEntity("potw_zoneb_scripting.Trig_WellCameraStart")
      AnimGBSequence("potw_zoneb_dynamic.The Well", "lower")
      DisableGlint("potw_zoneb_dynamic.The Well")
    else
      SetGlobal("Jailed_Pirate2_Freed_Played", 0)
      SetGlobal("Jailed_Pirate2_SetFree_Played", 0)
      DisableGlint("potw_zoneb_dynamic.The Well")
    end
    if GetGlobal("PotW_Jail_CagedPirate3Freed") == 1 then
      AnimGBSequence("potw_zonec.JailCell3", "opening")
      DestroyEntity("potw_zoneb_dynamic.MansionDoor")
      potw_Tortooga_HintEnableUnderMansion()
      Print("vvvvvv vvvvvv Jail 1 open")
    else
      SetGlobal("Jailed_Pirate3_Freed_Played", 0)
      SetGlobal("Jailed_Pirate3_SetFree_Played", 0)
    end
    if GetGlobal("potw_zoneb_ObeliskCount") == 1 then
      AnimGBSequence("potw_zonec.JailCell1", "opening")
      SetGlobal("PotW_Jail_CagedPirate1Freed", 1)
      ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "potw_zoneb_dynamic.RisingLantern 01", 1)
      ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "potw_zoneb_dynamic.RisingLantern 02", 1)
      Enable("potw_zonec.JailCell1")
      Unhide("potw_zoneb_dynamic.Lantern01")
      Unhide("potw_zoneb_dynamic.Lantern02")
      Unhide("potw_zoneb_dynamic.Lantern03")
      ForcePainted("potw_zoneb_dynamic.Lantern01")
      ForcePainted("potw_zoneb_dynamic.Lantern02")
      ForcePainted("potw_zoneb_dynamic.Lantern03")
      SetGlobal("potw_tortooga_lanterns", 3)
    else
      SetGlobal("potw_tortooga_lanterns", 0)
    end
    if GetGlobal("PotW_WellGearSpun") == 1 then
      SetGlobal("PotW_Jail_CagedPirate2Freed", 1)
      AnimGBSequence("potw_zonec.JailCell2", "opening")
      AnimGBSequence("potw_zoneb_dynamic.The Well", "lower")
      DestroyEntity("potw_zoneb_dynamic.SewerGate")
      DisableGlint("potw_zoneb_dynamic.SpinningGear")
      SetSplineFollowerInitialSpeed("potw_zoneb_dynamic.Cove_Column01", 2)
      SplineFollower_StopAtPosition("potw_zoneb_dynamic.Cove_Column01", "potw_zoneb_dynamic.SK_SunkenColumn3_1", "potw_zoneb_dynamic.SK_SunkenColumn3_2", 1)
    end
    if GetGlobal("Pirate_Guide_V1_OpenPortal_Played") == 1 then
      SetGlobal("potw_zoneb_BagContents", 1)
      SetGlobal("potw_zoneb_BagCount", 1)
      SetGlobal("PotW_Jail_CagedPirate3Freed", 1)
      AnimGBSequence("potw_zonec.JailCell3", "opening")
      DestroyEntity("potw_zoneb_dynamic.MansionDoor")
      DestroyEntity("UnderMansionIGC 01")
      DisableAutoQuestGiver("PotW_ZoneB.Pirate_Guide", true)
      SetIsQuestGiver("PotW_ZoneB.Pirate_Guide", false)
    else
      SetGlobal("potw_zoneb_BagContents", 0)
    end
  elseif GetGlobal("PotW_PlayerHasKeyToVillage") == 1 then
    DestroyEntity("potw_playerstart_tortuga1.Trigger")
    SetMap(GetPlayer(), "MAP_P_ZONEB2", "GAME")
    SetGlobal("potw_tortuga_startLocation", 1)
    SetDefaultCameraValues(4, 16, -12)
    SetTravelCameraValues(5, 25, -20)
    ForEachEntityInGroup(DestroyEntity, "Visit1Mansion")
    ForEachEntityInGroup(DestroyEntity, "potw_zoneb_dynamic.JailKeys")
    ForEachEntityInGroup(FireUser1, "potw_zoneb_audio.Sound_Marker_Keys")
    SetGlobal("potw_zoneb_BagContents", 1)
    SetGlobal("potw_zoneb_BagCount", 1)
    SetGlobal("Pirate_Guide_V1_OpenPortal_Played", 1)
    SetGlobal("Pirate_Guide_BagCheck_Played", 1)
    DestroyEntity("potw_zoneb_dynamic.MansionDoor")
    PotW_Tortuga_EnableAI()
    Print("AI Active")
    DestroyEntity("potw_zonec.JailedPirate3")
    DestroyEntity("potw_zonec.JailDoorTriggerUse 03")
    DestroyEntity("potw_zonec.ConversationalTrigger 01")
    Enable("potw_zonec.JailCell3")
    if GetGlobal("potw_Tortooga_V2_Password_Played") == 1 or GetGlobal("Starkey_Tortooga_Played") == 1 then
      Print("################ Respawn after completing one of the Gate opening quests.")
      AnimGBSequence("potw_zoneb_dynamic.RideExitGate", "Open")
      Prefab_Projector_ChangeState("TortugaToRide2D", "Activate")
    end
  end
end
function potw_checkProjectorStatus()
  if GetGlobal("Pirate_Guide_V1_OpenPortal_Played") == 1 and GetGlobal("PotW_PlayerHasKeyToVillage") == 0 then
    Prefab_Projector_ChangeState("ProjectorToJungle", "Activate")
    Print(">>>>>>>uglyhackfixme>>>>>> MAKE THAT PROJECTOR ACTIVE DO IT. -- called from trigger --")
  end
end
function PotW_ZoneB_DestroyedGremlinCage()
  local L0_5
  L0_5 = FireUser1
  L0_5("potw_zoneb_igc.Camera_GremlinFixingPipe.FancyCameraLookAt 01")
  L0_5 = wait
  L0_5(1.2)
  L0_5 = FireThread
  L0_5(TeleportGremlinIn, "caged_gremlin_Marc", "potw_zoneb_igc.Camera_GremlinFixingPipe_TelportMarker", false)
  L0_5 = wait
  L0_5(0.1)
  L0_5 = GetChildEntityByName
  L0_5 = L0_5("caged_gremlin_Marc", "GremlinWrench")
  Unhide(L0_5)
  DisableMotion("caged_gremlin_Marc")
  wait(0.6)
  EnterCutscene("caged_gremlin_Marc", 1)
  Wait(5)
  TeleportGremlinOut("caged_gremlin_Marc")
end
function PotW_ZoneB_GetDaisyBody()
  SetGlobal("PotW_DaisyParts", GetGlobal("PotW_DaisyParts") + 1, true)
  potw_ZoneB_SaveCheckpoint()
end
bPlayerInMansionTrigs = 0
function PotW_zoneb_MansionCams(A0_6, A1_7)
  if A1_7 == "In" then
    bPlayerInMansionTrigs = bPlayerInMansionTrigs + 1
    if bPlayerInMansionTrigs == 1 then
      SetCameraAttributes(A0_6)
    end
  elseif A1_7 == "Out" then
    bPlayerInMansionTrigs = bPlayerInMansionTrigs - 1
    if bPlayerInMansionTrigs == 0 then
      ClearAllCameraAttributes()
    end
  end
end
function potw_Tortooga_JailDoorIGC()
  FireUser1("potw_zoneb_igc.JailDoorCamera.FancyCameraLookAt 01")
  TeleportToEntity(GetPlayer(), "potw_zoneb_igc.Jail_IGC_PlayerMarker")
  wait(1)
  AnimGBSequence("potw_zoneb_dynamic.P_ZoneB_Door01 01", "fall")
end
function potw_wellCamera_gearHint()
  StartCameraPivotSnap("potw_zoneb_dynamic.SpinningGear", 0.005, 0.005, false, false)
end
function PotW_Jail_Contents_found()
  if GetGlobal("potw_zoneb_BagContents") == 0 then
    SetGlobal("potw_zoneb_BagContents", 1)
    potw_Tortooga_HintDestroyUnderMansion()
    potw_Tortooga_HintEnableReturnContents()
    FireSequence("Tortuga_Gus", "Tortuga_FindBagContents")
  end
end
function potw_zoneb_PirateBagCount()
  SetGlobal("potw_zoneb_BagCount", 1)
  potw_Tortooga_HintBagCollected()
  FireSequence("Tortuga_Gus", "PotW_Tortooga_V1_Gus_Bag")
end
function PotW_TortugaToJungleActivate()
  Print("........................... PotW_TortugaToJungleActivate called")
  Prefab_Projector_ChangeState("ProjectorToJungle", "Activate")
  DisableAutoQuestGiver("PotW_ZoneB.Pirate_Guide", true)
  SetIsQuestGiver("PotW_ZoneB.Pirate_Guide", false)
end
function PotW_Tortuga_SetupWatchVideo()
  Enable("PotW_Tortuga.Spawner_Watch")
  Enable("PotW_Tortuga.Trig_WatchTraining")
end
function PotW_WellGearSpun()
  if GetGlobal("PotW_WellGearSpun") == 0 then
    SetGlobal("PotW_WellGearSpun", 1)
    DisableGlint("potw_zoneb_dynamic.SpinningGear")
    ForceSequence("potw_zonec.JailedPirate2", "Jailed_Pirate2_Complete")
    AnimGBSequence("potw_zoneb_dynamic.SewerGate", "open")
    SetSplineFollowerInitialSpeed("potw_zoneb_dynamic.Cove_Column01", 2)
    SplineFollower_StopAtPosition("potw_zoneb_dynamic.Cove_Column01", "potw_zoneb_dynamic.SK_SunkenColumn3_1", "potw_zoneb_dynamic.SK_SunkenColumn3_2", 1)
  end
end
function PotW_V2_PipesCheck()
  if GetGlobal("PotW_GremlinMarc_Thanks_Played") == 0 and GetGlobal("potw_jungle_cleared") == 0 then
    ForEachEntityInGroup(FireUser1, "Pipe_SpawnerV2")
  end
end
function PotW_SeersPipes(A0_8)
  if GetGlobal("PotW_GremlinMarc_Thanks_Played") == 0 and seer_dead ~= A0_8 then
    ForEachEntityInGroup(FireUser1, "Pipe_Spawner")
  end
end
seer_dead = ""
function PotW_SeerDeath(A0_9)
  local L1_10
  seer_dead = A0_9
end
function PotW_UnderMansionIGCCheck()
  ForEachEntityInGroup(FireUser1, "Camera_UnderMansionSeq")
end
function PotW_PiratePipes()
  if GetGlobal("PotW_GremlinMarc_Thanks_Played") == 0 then
    ForEachEntityInGroup(FireUser1, "Pipe_Spawner_Visit2")
  else
  end
end
function PotW_Tortuga_UnderMansionHint()
  if GetGlobal("potw_zoneb_bagcontents") == 0 then
    FireSequence("Tortuga_Gus", "Tortuga_UnderMansionHint")
  end
end
ForEachEntityInGroup(Disable, "POTW_Obelisks")
function PotW_Tortuga_FallintoWell()
  if GetGlobal("PotW_Jail_CagedPirate2Freed") == 1 and GetGlobal("PotW_PlayerHasKeyToVillage") == 0 then
    DestroyEntity("potw_zoneb_scripting.Trig_WellCameraStart")
    GetPrefabData("CameraWellDrop").shotOrder = "only"
    GetPrefabData("CameraWellDrop").StopCameraSequence = "true"
    GetPrefabData("CameraWellDrop").fadeInTime = 0.8
    GetPrefabData("CameraWellDrop").fadeOutTime = 0.8
    GetPrefabData("CameraWellDrop").transitionTime = 4.5
    FireUser1("CameraWellDrop")
    wait(2)
    AnimGBReset("potw_zoneb_dynamic.The Well")
    AnimGBSequence("potw_zoneb_dynamic.The Well", "lower")
    DisableGlint("potw_zoneb_dynamic.The Well")
    wait(3.75)
  end
end
function PotW_Tortuga_SkullGateOpen()
  wait(1.5)
  AnimGBReset("potw_zoneb_dynamic.RideExitGate")
  AnimGBSequence("potw_zoneb_dynamic.RideExitGate", "Open")
  wait(5.6)
end
function PotW_TortugaToPirateVoyageActivate()
  Prefab_Projector_ChangeState("TortugaToRide2D", "Activate")
end
function PotW_Tortuga_IndianVillageClosed()
  FireSequence("Tortuga_Gus", "Tortuga_DoorPassword")
  if GetGlobal("PotW_PlayerHasKeyToVillage") == 1 then
    PotW_Tortuga_SkullGateOpen()
  end
end
PlayerVisitedJail = false
function PotW_TortugaToJail_Teleport()
  StartFadeOut(1.2)
  Enable2DSetup()
  wait(2.01)
  StreamInterior(nil, "stream_2_2")
  WaitForLevelLoad()
  if PlayerVisitedJail == false and GetGlobal("PotW_PlayerHasKeyToVillage") == 0 then
    Print("Loading up the jailed pirates.")
    ForEachEntityInGroup(Enable, "potw_zonec.Spawner_JailPirates")
    DisableAutoQuestGiver("potw_zonec.JailedPirate1", true)
    DisableAutoQuestGiver("potw_zonec.JailedPirate2", true)
    DisableAutoQuestGiver("potw_zonec.JailedPirate3", true)
    SetIsQuestGiver("potw_zonec.JailedPirate1", true)
    SetIsQuestGiver("potw_zonec.JailedPirate2", true)
    SetIsQuestGiver("potw_zonec.JailedPirate3", true)
    PlayerVisitedJail = true
  end
  TeleportToEntity(GetPlayer(), "potw_zonec.JailEntrance")
  wait(0.01)
  CameraReset()
  wait(0.01)
  SetCameraAttributes("potw_zonec.JailCameraOverride")
  wait(1)
  StartFadeInNoHUD()
end
function PotW_ReEnableJailCamera()
  GetPrefabData("LanternCamera2").SaveCam = "true"
end
function PotW_ReEnableJailCamera_Contents()
  GetPrefabData("CameraGovManDoor2").SaveCam = "true"
end
function PotW_TortugaToMS_Teleport()
  SetVars_Pirates_v2_Complete()
  wait(0.5)
  WaitForLevelLoad()
  MoveToEntity(GetPlayer(), "potw_zonea.2dStartFromTortuga")
end
function PotW_TortugaToJungleTrans()
  local L0_11, L1_12
end
function potw_Tortuga_GetJailKey(A0_13)
  SetGlobal("PotW_Jail_CellKeys", GetGlobal("PotW_Jail_CellKeys") + 1)
  FireSequence("Tortuga_Gus", "Tortuga_FindJailKey" .. GetGlobal("PotW_Jail_CellKeys"))
  if GetGlobal("PotW_Jail_CellKeys") == 3 then
    AudioPostEventOn(GetPlayer(), "Play_sfx_third_key_found")
  end
end
function potw_Tortuga_GusMansionDoor(A0_14)
  if GetGlobal("PotW_Jail_CagedPirate3Freed") == 0 then
    FireSequence(A0_14, "PotW_Tortooga_V1_Gus_LockDoor")
  end
end
potw_zoneb_ObeliskRaised = 0
function potw_Tortuga_ObeliskCount()
  SetGlobal("potw_tortooga_lanterns", GetGlobal("potw_tortooga_lanterns") + 1)
  potw_zoneb_ObeliskRaised = potw_zoneb_ObeliskRaised + 1
  potw_zoneb_ObeliskCheck()
end
function potw_Tortuga_ObeliskDecrease()
  SetGlobal("potw_tortooga_lanterns", GetGlobal("potw_tortooga_lanterns") - 1)
  potw_zoneb_ObeliskRaised = potw_zoneb_ObeliskRaised - 1
end
function potw_zoneb_ObeliskCheck()
  if GetGlobal("potw_zoneb_ObeliskCount") == 0 then
    if potw_zoneb_ObeliskRaised == 1 then
      FireSequence("Tortuga_Gus", "Tortooga_Lantern1_Painted")
    elseif potw_zoneb_ObeliskRaised == 2 then
      FireSequence("Tortuga_Gus", "Tortooga_Lantern2_Painted")
    end
    if potw_zoneb_ObeliskRaised == 3 then
      SetGlobal("potw_zoneb_ObeliskCount", 1)
      FireUser1("CameraRisingObelisk")
      wait(1)
      AudioPostEventOn(GetPlayer(), "Play_sfx_PotW_Tortuga_Ride_Rise")
      ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "potw_zoneb_dynamic.RisingLantern 01", 1)
      ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "potw_zoneb_dynamic.RisingLantern 02", 1)
      Print(" vvvvvv vvvvvv Raise the Pillars for Lantern Quest.")
      FireSequence("Tortuga_Gus", "Tortuga_RisingPillar")
    end
  end
end
potw_zoneb_MansionPillars = 0
potw_zoneb_MansionPillar1_GoingDown = 1
potw_zoneb_MansionPillar2_GoingDown = 1
potw_zoneb_MansionPillar3_GoingDown = 1
potw_zoneb_MansionPillar4_GoingDown = 1
potw_zoneb_MansionPillar5_GoingDown = 0
potw_zoneb_MansionPillar1_up = 0
potw_zoneb_MansionPillar2_up = 0
potw_zoneb_MansionPillar3_up = 0
potw_zoneb_MansionPillar4_up = 0
potw_zoneb_MansionPillar5_up = 0
potw_zoneb_MansionPillarSound1 = 0
potw_zoneb_MansionPillarSound2 = 0
potw_zoneb_MansionPillarSound3 = 0
potw_zoneb_MansionPillarSound4 = 0
PotW_Tortuga_TurntableDoorPlayed = false
function PotW_Tortuga_TurntableEndSound()
  if PotW_Tortuga_TurntableDoorPlayed == false then
    AudioPostEventOn("potw_zoneb_dynamic.Turntable1", "Play_sfx_POTW_secretRotateDr_end")
    PotW_Tortuga_TurntableDoorPlayed = true
  end
end
function Potw_ZoneB_PillarPuzzle_Intro()
  wait(1)
  ForEachEntityInGroup(FireUser1, "MansionCellarSpawners")
  wait(2)
  SetNextPatrolNode("Spatter_Mansion_L", "potw_zoneb_dynamic.Assist")
  SetNextPatrolNode("Spatter_Mansion_R", "potw_zoneb_dynamic.UseGear")
  wait(4)
  AnimGBReset("MansionTurntableGear")
  AnimGBSequence("MansionTurntableGear", "spin")
  AudioPostEventOn("potw_zoneb_dynamic.Turntable1", "Play_sfx_POTW_secretRotateDr_start")
  SetRotatorMaxSpeed("potw_zoneb_dynamic.Turntable1", 20)
  StartRotateToPosition("potw_zoneb_dynamic.Turntable1", 180)
  PotW_Tortuga_TurntableDoorPlayed = false
end
function Potw_ZoneB_PillarPuzzle_Intro_LowerPillars()
  wait(2)
  ForEachEntityInGroup(Reverse, "POTW_Pillars2")
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "POTW_Pillars2", 2)
  AudioPostEventOn("potw_zoneb_audio.Sound_Marker_Column1", "Play_sfx_POTW_Trtga_PillarFall_Move")
  AudioPostEventOn("potw_zoneb_audio.Sound_Marker_Column3", "Play_sfx_POTW_Trtga_PillarFall_Move")
  Print("potw_zoneb_audio.Sound_Marker_Column1 Move")
  Print("potw_zoneb_audio.Sound_Marker_Column3 Move")
  wait(0.2)
  ForEachEntityInGroup(AnimGBReset, "Mansion_gear_group2")
  ForEachEntityInGroup(AnimGBSequence, "Mansion_gear_group2", "spin")
  wait(1)
  ForEachEntityInGroup(Reverse, "POTW_Pillars1")
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "POTW_Pillars1", 2)
  AudioPostEventOn("potw_zoneb_audio.Sound_Marker_Column2", "Play_sfx_POTW_Trtga_PillarFall_Move")
  AudioPostEventOn("potw_zoneb_audio.Sound_Marker_Column4", "Play_sfx_POTW_Trtga_PillarFall_Move")
  Print("potw_zoneb_audio.Sound_Marker_Column2 Move")
  Print("potw_zoneb_audio.Sound_Marker_Column4 Move")
  wait(0.2)
  ForEachEntityInGroup(AnimGBReset, "Mansion_gear_group1")
  ForEachEntityInGroup(AnimGBSequence, "Mansion_gear_group1", "spin")
  wait(2)
  DestroyEntity("Spatter_Mansion_L")
  DestroyEntity("Spatter_Mansion_R")
  Unhide("PostMansionIGCSpatter1")
  Unhide("PostMansionIGCSpatter2")
  Enable("Trigger_UnderMansionCamHint")
end
potw_Tortuga_InitializePillars = 4
function potw_Tortuga_PillarCount(A0_15, A1_16)
  local L2_17, L3_18
  L2_17 = "potw_zoneb_dynamic.P_ZoneB_Column0"
  L3_18 = A1_16
  L2_17 = L2_17 .. L3_18
  L3_18 = "potw_zoneb_audio.Sound_Marker_Column"
  L3_18 = L3_18 .. A1_16
  AudioPostEventOn(L3_18, "Play_sfx_POTW_Trtga_PillarRise_Stop")
  Print(L3_18 .. " Stop Sound Played")
  if potw_Tortuga_InitializePillars == 0 then
    TimerReset("potw_zoneb_scripting.Timer_GovMan_0" .. A1_16)
    _G["potw_zoneb_MansionPillar" .. A1_16 .. "_up"] = 1
    potw_zoneb_MansionPillars = potw_zoneb_MansionPillars + 1
    PotW_Tortuga_Pillars_check()
  else
    potw_Tortuga_InitializePillars = potw_Tortuga_InitializePillars - 1
  end
end
function potw_Tortuga_PillarLower(A0_19, A1_20)
  local L2_21, L3_22
  L2_21 = "potw_zoneb_dynamic.P_ZoneB_Column0"
  L3_22 = A1_20
  L2_21 = L2_21 .. L3_22
  L3_22 = "potw_zoneb_audio.Sound_Marker_Column"
  L3_22 = L3_22 .. A1_20
  if potw_zoneb_MansionPillars < 5 and _G["potw_zoneb_MansionPillar" .. A1_20 .. "_GoingDown"] == 0 then
    potw_zoneb_MansionPillars = potw_zoneb_MansionPillars - 1
    Reverse(L2_21)
    SetSplineFollowerInitialSpeed(L2_21, 0.5)
    _G["potw_zoneb_MansionPillar" .. A1_20 .. "_GoingDown"] = 1
    _G["potw_zoneb_MansionPillar" .. A1_20 .. "_up"] = 0
    if _G["potw_zoneb_MansionPillarSound" .. A1_20] == 1 then
      AudioPostEventOn(L3_22, "Play_sfx_POTW_Trtga_PillarFall_Move")
      Print(L3_22 .. " Fall Sound Played")
      _G["potw_zoneb_MansionPillarSound" .. A1_20] = 0
    end
  end
end
function potw_Tortuga_Pillar_GearHit(A0_23, A1_24)
  local L2_25, L3_26
  L2_25 = Print
  L3_26 = "*****  potw_Tortuga_Pillar_GearHit START"
  L2_25(L3_26)
  L2_25 = "potw_zoneb_dynamic.P_ZoneB_Column0"
  L3_26 = A1_24
  L2_25 = L2_25 .. L3_26
  L3_26 = "potw_zoneb_audio.Sound_Marker_Column"
  L3_26 = L3_26 .. A1_24
  if _G["potw_zoneb_MansionPillar" .. A1_24 .. "_GoingDown"] == 1 then
    Reverse(L2_25)
  end
  _G["potw_zoneb_MansionPillar" .. A1_24 .. "_GoingDown"] = 0
  SetSplineFollowerInitialSpeed(L2_25, 2)
  if _G["potw_zoneb_MansionPillarSound" .. A1_24] == 0 then
    AudioPostEventOn(L3_26, "Play_sfx_POTW_Trtga_PillarRise_Move")
    Print(L3_26 .. " Rise Sound Played")
    _G["potw_zoneb_MansionPillarSound" .. A1_24] = 1
  end
  if _G["potw_zoneb_MansionPillar" .. A1_24 .. "_up"] == 1 then
    TimerReset("potw_zoneb_scripting.Timer_GovMan_0" .. A1_24)
  end
end
function PotW_Tortuga_Pillars_check()
  if potw_zoneb_MansionPillars == 5 then
    SetGlobal("potw_zoneb_MansionPillarComp", 1)
    AudioPostEventOn("potw_zoneb_dynamic.Turntable1", "Play_sfx_POTW_secretRotateDr_start")
    SetRotatorMaxSpeed("potw_zoneb_dynamic.Turntable1", 20)
    StartRotateToPosition("potw_zoneb_dynamic.Turntable1", 0)
    PotW_Tortuga_TurntableDoorPlayed = false
    FireSequence("Tortuga_Gus", "Tortuga_PillarComp")
    DoStinger("Stinger_Success", 7)
  end
end
function PotW_AttachToThinner(A0_27)
  SplineFollower_SetDisabled(A0_27, true)
  SetParentEntity(A0_27, "potw_zoneb_dynamic.PotW_ZoneB_Thinner")
end
function PotW_WaterWheel_Paddle(A0_28)
  AudioPostEventOn(A0_28, "Play_waterwheel_paddle")
  ForceSketched(A0_28)
end
function PotW_Tortuga_TideRise()
  Print("PotW_Tortuga_TideRise")
  MultiPosSoundStop("potw_zoneb_audio.Sound_Marker_TideFall_Controller")
  MultiPosSoundStart("potw_zoneb_audio.Sound_Marker_TideRise_Controller")
end
function PotW_Tortuga_TideFall()
  Print("PotW_Tortuga_TideFall")
  MultiPosSoundStop("potw_zoneb_audio.Sound_Marker_TideRise_Controller")
  MultiPosSoundStart("potw_zoneb_audio.Sound_Marker_TideFall_Controller")
end
function Delay_ShowHUD()
  wait(1)
  ShowReticleOnly()
  ShowHud()
end
function potw_Tortooga_HintSetup()
  if GetGlobal("potw_tortuga_startLocation") == 0 then
    EnableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_Bag")
  elseif GetGlobal("potw_tortuga_startLocation") == 1 then
  end
end
function potw_Tortooga_HintBagCollected()
  DisableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_Bag")
  EnableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_Billy")
end
function potw_Tortooga_HintBagCompleted()
  DisableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_Billy")
  DisableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_Bag")
  EnableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_Jail")
end
function potw_Tortooga_HintJailDoorOpen()
  potw_Tortooga_HintEnableKeys()
end
function potw_Tortooga_HintKeyWaterWheel()
  DisableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_KeyWaterWheel")
end
function potw_Tortooga_HintKeyMansion()
  DisableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_KeyMansion")
end
function potw_Tortooga_HintKeySmoke()
  DisableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_KeySmoke")
end
function potw_Tortooga_HintEnableKeys()
  EnableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_Jail")
  EnableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_KeySmoke")
  EnableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_KeyMansion")
  EnableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_KeyWaterWheel")
end
function potw_Tortooga_HintEnableUnderMansion()
  EnableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_UnderMansion")
end
function potw_Tortooga_HintDestroyUnderMansion()
  DisableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_UnderMansion")
end
function potw_Tortooga_HintEnableReturnContents()
  EnableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_Billy")
end
function potw_Tortooga_HintDisableReturnContents()
  DisableGuardianHint("potw_zoneb_dynamic.PlayerHintMarkers_Billy")
end
