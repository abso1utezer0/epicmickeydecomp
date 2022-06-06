local L0_0, L1_1
function L0_0()
  if MS_V3_SkipIntro == false then
    MS_V3_SkipIntro = true
    MS_V3_SaveInitialCheckpoint = true
    SetGlobal("MS_MeanStreetProgress", 3)
    SetGlobal("MS_visitnum", 3)
    SetGlobal("MS_toontownopen", 1)
    SetGlobal("TT_ToonTownProgress", 2)
    SetGlobal("NO_NewOrleansProgress", 1)
    SetGlobal("MS_tomorrowlandopen", 0)
    SetGlobal("AL_AdventurelandProgress", 1)
    if GetGlobal("MSS_SaveMarkus_Played") == 0 then
    end
    MS_PickProjectorExit()
  end
end
MS_V3_AlwaysSetup_Launcher = L0_0
L0_0 = false
MS_V3_SkipIntro = L0_0
L0_0 = false
MS_V3_SaveInitialCheckpoint = L0_0
function L0_0()
  MS_V3_SaveInitialCheckpoint = true
  MSV3_AlwaysSetup()
end
Projector_SetupV3 = L0_0
function L0_0()
  Print("Setting up Mean Street visit 3")
  Enable("MSAllVisitsBut6AudioTrigger")
  MS_V3_SkipIntro = true
  FireThread(GuardianPrefab_PopulateGuardians, "GuardianVentureland")
  FireThread(MS_SetProjectorCam)
  SetGlobal("MS_MeanStreetProgress", 3)
  SetGlobal("MS_visitnum", 3)
  SetGlobal("MS_toontownopen", 1)
  SetGlobal("TT_ToonTownProgress", 2)
  SetGlobal("NO_NewOrleansProgress", 1)
  SetGlobal("AL_AdventurelandProgress", 1)
  SetGlobal("MS_tomorrowlandopen", 0)
  MS_MeanStreetPersist()
  if GetGlobal("MS_MarkusRescued") == 1 then
    ForceSpawn("MarkusSpawnerV3", 1)
    SetGlobal("MS_StationSpatters", 3)
    ForEachEntityInGroup(DestroyEntity, "InvadingSpatter")
  end
  if GetGlobal("MS_StationSpatters") == 3 then
    StreamInterior(nil, "v3_defaultinterior.part")
  else
    StreamInterior(nil, "v3_spatterinterior.part")
    SetGlobal("MS_StationSpatters", 0)
  end
  if GetGlobal("PowerSparks") == 0 then
    SetGlobal("PowerSparks", 5)
  end
  StartEmitters("PortalFX1")
  StartEmitters("PortalFX2")
  if GetGlobal("MS_adventurelandopen") == 1 then
    StartEmitters("PortalFX3")
  end
  if GetGlobal("MSS_SaveMarkus_Played") == 1 then
    DisableOswaldQuestGiver()
  end
  MS3_SetHintMarkers()
  MS_SpawnBunnies()
  MS_SetDefaultCameraValues()
  MS_SetupMap()
  UnrestrictCutSceneInput()
  if MS_V3_SaveInitialCheckpoint == true then
    MS_V3_SaveInitialCheckpoint = false
    MS_CheckpointSave()
  end
end
MSV3_AlwaysSetup = L0_0
function L0_0()
  Print("************Setting Guardian Hint Markers HNTMRKR")
  if GetGlobal("MSS_MarkusFreed_Played") == 0 then
    EnableGuardianHint("CagedMarkusHint")
    DisableGuardianHint("MarkusHint")
  else
    EnableGuardianHint("MarkusHint")
    DisableGuardianHint("CagedMarkusHint")
  end
  if GetGlobal("MS_MarkusRescued") == 1 and GetGlobal("MSS_FindWatchIntro_Played") == 0 then
    EnableGuardianHint("MarkusHint")
  end
  if GetGlobal("MSS_FindWatchIntro_Played") == 1 and GetGlobal("PowerSparks") < 10 then
    DisableGuardianHint("MarkusHint")
  end
  if GetGlobal("PowerSparks") > 9 and GetGlobal("MS_adventurelandopen") == 0 then
    EnableGuardianHint("MarkusHint")
  end
  if GetGlobal("MS_adventurelandopen") == 1 then
    DisableGuardianHint("MarkusHint")
  end
end
MS3_SetHintMarkers = L0_0
function L0_0()
  if GetGlobal("MSS_SaveMarkus_Played") == 0 then
    FireSequence("hub_meanstreet_v3.Oswald", "MSS_SaveMarkus")
  end
end
MS_OswaldMarkusTrouble = L0_0
function L0_0()
  wait(1)
  SetGlobal("MS_MarkusRescued", 1)
  MS3_SetHintMarkers()
  wait(0.1)
  MS_CheckpointSave()
  Print("*************Teleport Markus")
  FireThread(TeleportGremlinToEntity, "CagedMarkus", "hub_meanstreet_v3.MarkusRescuedMarker")
  wait(3)
  Print("*************Destroy Markus Clone")
  DestroyEntity("CagedMarkus")
  ForceSpawn("MarkusSpawnerV3", 1)
end
MS_RescuedMarkus = L0_0
function L0_0()
  SetPropertyFloat("V3Penelope", "Wander Radius", 50, 0)
  SetPropertyFloat("V3Gertrude", "Wander Radius", 50, 0)
  SetPropertyFloat("V3Rufus", "Wander Radius", 50, 0)
end
MS3_SetNPCWander = L0_0
function L0_0()
  Print("********Spatters gone IGC")
  RestrictCutSceneInput()
  SetGlobal("MS_SkipIGC", 1)
  wait(0.5)
  StartFadeOut(0.5)
  wait(0.5)
  StreamInterior(nil, "v3_defaultinterior")
  wait(0.01)
  WaitForLevelLoad()
  wait(0.01)
  UnrestrictCutSceneInput()
  FireSequence("RufusConvoProxyMarker", "PostBloticle04")
end
MS3_SpattersGoneIGC = L0_0
function L0_0()
  if GetGlobal("MSS_HelpBunnies_Played") == 0 and GetGlobal("MarkusRescued") == 0 then
    SetGlobal("MS_NoStoreEntry", 1)
    SetCameraAttributes("hub_meanstreet_v3.PedHintCameraMarker")
    FireSequence("hub_meanstreet_v3.Corrine", "MSS_HelpBunnies")
    wait(4)
    SetCameraAttributes("hub_meanstreet.ZoneDefaultCamera")
    SetGlobal("MS_NoStoreEntry", 0)
  end
end
PedestrianBunnyHint = L0_0
function L0_0()
  Print("****************MS_BunnyAteSpatter")
  SetGlobal("MS_SpattersEaten", GetGlobal("MS_SpattersEaten") + 1)
end
MS_BunnyAteSpatter = L0_0
function L0_0(A0_2)
  Print("****************StationSpatterDead")
  SetGlobal("MS_SpattersDead", GetGlobal("MS_SpattersDead") + 1)
  if GetCurrentTeam(A0_2) == 3 then
    SetGlobal("MS_SpattersFriend", GetGlobal("MS_SpattersFriend") - 1)
  end
  MS_TallySpatters()
end
StationSpatterDead = L0_0
function L0_0(A0_3)
  if GetCurrentTeam(A0_3) == 3 then
    SetGlobal("MS_SpattersFriend", GetGlobal("MS_SpattersFriend") + 1)
  end
  if GetCurrentTeam(A0_3) == 2 then
    SetGlobal("MS_SpattersFriend", GetGlobal("MS_SpattersFriend") - 1)
  end
  MS_TallySpatters()
end
MS_SpatterFriend = L0_0
function L0_0()
  local L0_4
  L0_4 = GetGlobal
  L0_4 = L0_4("MS_SpattersDead")
  L0_4 = L0_4 + GetGlobal("MS_SpattersFriend")
  SetGlobal("MS_StationSpatters", L0_4)
end
MS_TallySpatters = L0_0
function L0_0()
  if GetGlobal("MS_StationSpatters") == 1 or GetGlobal("MS_StationSpatters") == 2 then
    DestroyEntity("InvadingSpatter1")
  end
  if GetGlobal("MS_StationSpatters") == 2 then
    DestroyEntity("InvadingSpatter2")
  end
end
MS_DestroyV3Spatters = L0_0
function L0_0(A0_5, A1_6)
  if A1_6 == "1" then
    SetGlobal("TT_Flower1", 1)
  elseif A1_6 == "2" then
    SetGlobal("TT_Flower2", 1)
  elseif A1_6 == "3" then
    SetGlobal("TT_Flower3", 1)
  end
  FireSequence("hub_meanstreet_v3.GusConvoV3", "GP_FlowersPickup")
end
MS_PickUpFlower = L0_0
function L0_0()
  DisableAutoQuestGiver("V3Oswald", true)
  SetIsQuestGiver("V3Oswald", false)
end
DisableOswaldQuestGiver = L0_0
function L0_0()
  SetGlobal("MS_adventurelandopen", 1)
  wait(1)
  wait(4)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  UnrestrictCutSceneInput()
  FireSequence("hub_meanstreet_v3.GusConvoV3", "MSS_gusadventureunlocked")
end
MS_unlockadventureland = L0_0
function L0_0()
  SetGlobal("MS_V3_DetectiveQuestInProgress", 1)
  ForEachEntityInGroup(Unhide, "V3FootprintAssett")
  MS_CheckpointSave()
end
MS_V3_BeginDetectiveQuest = L0_0
function L0_0()
  SetGlobal("MS_V3_DetectiveQuestInProgress", 3)
  ForEachEntityInGroup(Hide, "V3FootprintAssett")
  MS_CheckpointSave()
end
MS_V3_EndDetectiveQuest = L0_0
function L0_0()
  TeleportGremlinOut("hub_meanstreet_v3.MechanicGremlinV3")
  wait(0.5)
  FireUser1("hub_meanstreet_v3.MachineMarker")
  Prefab_Projector_ChangeState("MSVenturelandMarker", "Activate")
  TeleportGremlinIn("hub_meanstreet_v3.MechanicGremlinV3", "hub_meanstreet_v3.MachineFixMarker 01", true, true)
  EnterCutscene("hub_meanstreet_v3.MechanicGremlinV3", 1)
end
MS_V3_GremlinFixProjector = L0_0
function L0_0(A0_7)
  TeleportGremlinOut("hub_meanstreet_v3.MechanicGremlinV3")
  TeleportGremlinIn("hub_meanstreet_v3.MechanicGremlinV3", "hub_meanstreet_v3.MachineFixMarker 02", false, true)
  EnableMotion(A0_7)
end
MS_V3_GremlinResetToMarker = L0_0
function L0_0()
  SetGlobal("MS_V1_NotEnough", 1)
  ForceSequence("hub_meanstreet_v3.Jack Kelly 02", "TT_V2_Footprintsellstolen")
  SetGlobal("MS_V1_NotEnough", 0)
end
MS_JackKelly_NotEnough = L0_0
function L0_0()
  StartFadeOut(0.5)
  wait(0.5)
  SetCharacterInConversation(GetPlayer(), 0)
  ForEachEntityInGroup(SetAppCulled, "cull_b_front")
  CameraReset()
  StartFadeIn(0.5)
  wait(0.5)
  UnrestrictCutSceneInput()
end
MS_V3_GremlinOutro = L0_0
