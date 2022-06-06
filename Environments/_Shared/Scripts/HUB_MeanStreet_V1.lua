local L0_0, L1_1
function L0_0()
  if MS_V1_SkipIntro == false then
    MS_V1_SkipIntro = true
    MS_V1_SaveInitialCheckpoint = true
    StartFadeOut(0)
    SetGlobal("MS_MeanStreetProgress", 1)
    SetGlobal("TT_ToonTownProgress", 1)
    SetGlobal("NO_NewOrleansProgress", 1)
    SetGlobal("MS_dontmove", 1)
    SetGlobal("MS_visitnum", 1)
    if GetGlobal("MS_gusintrovar") == 0 and GetGlobal("MS_fromtoontown") == 0 then
      TeleportToEntity("hub_meanstreet_v1.MechanicGremlinV1", "hub_meanstreet_v1.MechaniIntroPositionMarker", true, false)
    end
    Prefab_FlythroughProjector("TrainStationProjectorMarker")
    if GetGlobal("HUB_startposition") == 0 then
      MSV1_AlwaysSetup()
    else
      MS_PickProjectorExit()
    end
  end
end
MS_V1_AlwaysSetup_Launcher = L0_0
L0_0 = false
MS_V1_SkipIntro = L0_0
L0_0 = false
MS_V1_SaveInitialCheckpoint = L0_0
function L0_0()
  MS_V1_SaveInitialCheckpoint = true
  MSV1_AlwaysSetup()
end
Projector_SetupV1 = L0_0
function L0_0()
  Print("Setting up Mean Street visit 1")
  Enable("MSV1AudioTrigger")
  Enable("MSAllVisitsBut6AudioTrigger")
  MS_V1_SkipIntro = true
  FireThread(GuardianPrefab_PopulateGuardians, "GuardianOsTown")
  SetGlobal("MS_MeanStreetProgress", 1)
  SetGlobal("TT_ToonTownProgress", 1)
  SetGlobal("NO_NewOrleansProgress", 1)
  SetGlobal("MS_dontmove", 1)
  SetGlobal("MS_visitnum", 1)
  FireThread(MS_MeanStreetPersist)
  RestoreSketchCounts()
  if GetGlobal("MS_StoreRoomKey") == 1 then
    DestroyEntity("hub_meanstreet_v1.pickup_worlditem 01.StoreroomKey")
  end
  if GetGlobal("MS_toontownopen") == 1 then
    StartEmitters("PortalFX1")
  else
    AnimGBSequence("MS_PortalMachine", "Off")
  end
  MS_SetupMap()
  MS_SetDefaultCameraValues()
  if GetGlobal("MS_gusintrovar") == 0 and GetGlobal("MS_fromtoontown") == 0 then
    FireThread(MS_StartZoneIntro)
  else
    FireThread(MS_SetProjectorCam)
    FireThread(MS1_SetHintMarkers)
    if MS_V1_SaveInitialCheckpoint == true then
      MS_V1_SaveInitialCheckpoint = false
      MS_CheckpointSave()
    end
  end
end
MSV1_AlwaysSetup = L0_0
function L0_0()
  RestrictCutSceneInput()
  TeleportToEntity(GetPlayer(), "IntroSceneMarker")
  Print("Playing intro FMV")
  SetGlobal("HUB_startposition", 0)
  SetGlobal("MS_gusintrovar", 1)
  StartFadeOut(0)
  wait(0.1)
  PlayAndUnlockMovie("MS_visit1_Intro_to_MeanStreet.bik", "MS_visit1_Intro_to_MeanStreet")
  wait(0.01)
  Print("Start Mickey talking anim")
  AnimVarInt(GetPlayer(), VAR_In_Conversation, 1)
  wait(0.01)
  AnimEvent(GetPlayer(), EVENT_Start_Talk)
  Print("Mechanic intro sequence")
  wait(0.1)
  MS1_SetHintMarkers()
  MS_MechanicIntroduction()
end
MS_StartZoneIntro = L0_0
function L0_0()
  Print("************Setting Guardian Hint Markers HNTMRKR")
  DisableGuardianHint("DetectiveHint")
  DisableGuardianHint("EmporiumHint")
  DisableGuardianHint("GildaHint")
  DisableGuardianHint("MarkusHint")
  DisableGuardianHint("MuseumHint")
  DisableGuardianHint("PeteHint")
  DisableGuardianHint("ParlorHint")
  DisableGuardianHint("UsherHint")
  wait(0.1)
  if GetGlobal("MS_key1") == 0 then
    if GetGlobal("MS_HoraceBookGet") == 1 then
      EnableGuardianHint("DetectiveHint")
    elseif GetGlobal("MSS_CaseyGear_Played") == 1 then
      EnableGuardianHint("ParlorHint")
    elseif GetGlobal("MSS_horacekeystart_Played") == 1 then
      EnableGuardianHint("EmporiumHint")
    elseif GetGlobal("MSS_horacekeystart_Played") == 0 then
      EnableGuardianHint("DetectiveHint")
    end
  end
  if GetGlobal("MS_key2") == 0 then
    if GetGlobal("MSS_PeteGear_Played") == 0 then
      EnableGuardianHint("PeteHint")
    else
      EnableGuardianHint("GildaHint")
    end
  end
  if GetGlobal("MS_key1") == 1 and GetGlobal("MS_key2") == 1 and GetGlobal("MSS_PowerSparkIntro_Played") == 0 then
    EnableGuardianHint("MarkusHint")
  end
  if GetGlobal("MSS_PowerSparkIntro_Played") == 1 and GetGlobal("MSS_GiveGear_Played") == 0 then
    if GetGlobal("MS_Cutlass") == 1 then
      EnableGuardianHint("MuseumHint")
    elseif GetGlobal("MSS_MuseumGoldGear_Played") == 1 then
      EnableGuardianHint("UsherHint")
    elseif GetGlobal("MSS_MuseumGoldGear_Played") == 0 then
      EnableGuardianHint("MuseumHint")
    end
  end
  if 0 < GetGlobal("PowerSparks") and GetGlobal("MS_toontownopen") == 0 then
    EnableGuardianHint("MarkusHint")
  end
end
MS1_SetHintMarkers = L0_0
function L0_0()
  GrabCamera("hub_meanstreet_v1.MarkusIntroCam", nil, CAMERA_LERP_TRANSITION, 0)
  wait(0.5)
  StartFadeInNoHUD(0.8)
  FireSequence("hub_meanstreet_v1.MechanicGremlinV1", "MSS_MarkusNoticeMickey")
end
MS_MechanicIntroduction = L0_0
function L0_0()
  FireThread(TeleportGremlinToEntity, "hub_meanstreet_v1.MechanicGremlinV1", "hub_meanstreet_v1.MechanicIntroTeleportLocation")
  wait(2.5)
  UnrestrictCutSceneInput()
  FireSequence("hub_meanstreet_v1.MechanicGremlinV1", "MSS_MechanicMachine")
end
MS_MechanicIntroduction2 = L0_0
function L0_0()
  local L0_2, L1_3
end
MS_MechanicIntroDone = L0_0
function L0_0()
  RestrictCutSceneInput()
  wait(3.5)
  UnrestrictCutSceneInput()
  FireSequence("hub_meanstreet_v1.V1Gus", "Gus_Generic_GuardainHelp")
end
MS_GuardianHintTutorial = L0_0
function L0_0()
  StartFadeOut(0.5)
  wait(0.5)
  EnableGuardianSystem()
  ForEachEntityInGroup(SetAppCulled, "cull_a_back")
  FireThread(Prefab_ProjectorMickeyMove)
  SetCharacterInConversation(GetPlayer(), 0)
  UnrestrictCutSceneInput()
  StartFadeIn(0.5)
  MS_CheckpointSave()
end
MS_QuestTutorialOutro = L0_0
function L0_0()
  wait(0.5)
  FireSequence("hub_meanstreet_v1.V1Gus", "Gus_Map_Tutorial")
end
MS_MapTutorial = L0_0
function L0_0()
  FireSequence("hub_meanstreet_v1.V1Gus", "Gus_Quest_Tutorial")
end
MS_QuestTutorial = L0_0
function L0_0()
  Print("********Removing race obstacles")
  ForEachEntityInGroup(ForceSketched, "RaceObstacle")
end
MS_RemoveRaceObstacles = L0_0
function L0_0()
  if GetGlobal("MS_peteintro") == 0 then
    Hide("hub_meanstreet_v1.BlackPete")
  end
end
MS_HidePeteV1 = L0_0
function L0_0()
  if GetGlobal("MS_peteintro") == 0 then
    RestrictCutSceneInput()
    SetGlobal("MS_peteintro", 1)
    StartFadeOut(0.5)
    wait(0.5)
    TeleportToEntity(GetPlayer(), "hub_meanstreet_v1.PeteFMVPlayerTeleport")
    Unhide("hub_meanstreet_v1.BlackPete")
    wait(0.1)
    CameraReset()
    wait(0.1)
    PlayAndUnlockMovie("MS_visit1_Intro_to_Pete.bik", "MS_visit1_Intro_to_Pete")
    wait(0.01)
    FireSequence("hub_meanstreet_v1.BlackPete", "MSS_PeteIntro")
    UnrestrictCutSceneInput()
  end
end
MS_peteintrobik = L0_0
function L0_0()
  if GetGlobal("MS_horaceintro") == 0 then
    SetGlobal("MS_horaceintro", 1)
    PlayAndUnlockMovie("MS_visit1_Intro_to_Horace.bik", "MS_visit1_Intro_to_Horace")
    wait(0.2)
  end
end
MS_horaceintrobik = L0_0
function L0_0()
  wait(1)
  if GetGlobal("MS_key1") == 1 and GetGlobal("MS_key2") == 0 or GetGlobal("MS_key1") == 0 and GetGlobal("MS_key2") == 1 then
    FireSequence("hub_meanstreet_v1.V1Gus", "MSS_gusonekey")
  end
  if GetGlobal("MS_key1") == 1 and GetGlobal("MS_key2") == 1 then
    FireSequence("hub_meanstreet_v1.V1Gus", "MSS_gusbothkeys")
  end
end
MS_keycheck = L0_0
function L0_0()
  FireSequence("hub_meanstreet_v1.V1Gus", "MSS_StoreroomKeyGet")
end
StoreKeyGet = L0_0
function L0_0()
  if GetGlobal("MS_statuebikplayed") == 0 and GetGlobal("MS_V1RaceActive") == 0 then
    RestrictCutSceneInput()
    StartFadeOut(0.5)
    wait(0.5)
    TeleportToEntity(GetPlayer(), "hub_meanstreet_v1.StatueFMVEndPosition")
    wait(0.1)
    SetGlobal("MS_statuebikplayed", 1)
    PlayAndUnlockMovie("MS_visit1_Walt_Oswald_Statue.bik", "MS_visit1_Walt_Oswald_Statue")
    wait(0.2)
    StartFadeIn(0.5)
    wait(0.5)
    UnrestrictCutSceneInput()
  end
end
MS_playstatuebik = L0_0
function L0_0()
  if GetGlobal("MS_petechallengetimer") == 1 then
    SetGlobal("MS_petechallengetimer", 0)
    SetGlobal("MS_petechallengehalfway", 0)
    DestroyEntity("hub_meanstreet_v1.RaceItem1")
    DestroyEntity("hub_meanstreet_v1.RaceItem2")
    wait(0.3)
    SetGlobal("MS_raceitem", 0)
    FireSequence("hub_meanstreet.PeteShouts", "MSS_petechallengefail")
  end
end
MS_petechallengetimeup = L0_0
function L0_0()
  SetGlobal("MS_raceitem", 0)
  Disable("hub_meanstreet_v1.Spawner 01")
  Disable("hub_meanstreet_v1.Spawner 02")
  wait(0.2)
  DestroyEntity("hub_meanstreet_v1.RaceItem1")
  DestroyEntity("hub_meanstreet_v1.RaceItem2")
  wait(0.2)
  Enable("hub_meanstreet_v1.Spawner 01")
  Enable("hub_meanstreet_v1.Spawner 02")
end
MS_raceitemreset = L0_0
function L0_0()
  FireSequence("hub_meanstreet_v1.V1Gus", "MSS_gusvanilla")
end
MS_pickupvanilla = L0_0
function L0_0()
  FireSequence("hub_meanstreet_v1.V1Gus", "MSS_gusfilmstrip")
end
MS_pickupgreenfilm = L0_0
function L0_0()
  FireSequence("hub_meanstreet_v1.V1Gus", "MSS_gusoddartifact")
end
MS_pickupoddartifact = L0_0
function L0_0()
  wait(0)
  CameraReset()
  wait(0)
  SetCameraAttributes("hub_meanstreet_igc.Marker(CameraOverride)_emporiumHint")
  wait(1)
  ForceSequence("hub_meanstreet_v1.V1Gus", "MSS_gusemporiumhint")
  wait(3)
  ClearAllCameraAttributesTimed(1)
end
MS_EmporiumHint = L0_0
function L0_0()
  wait(0)
  CameraReset()
  wait(0)
  SetCameraAttributes("hub_meanstreet_igc.Marker(CameraOverride)_iceCreamHint")
  wait(1)
  ForceSequence("hub_meanstreet_v1.V1Gus", "MSS_gusicecreamhint")
  wait(3)
  ClearAllCameraAttributesTimed(1)
end
MS_IceCreamParlorHint = L0_0
function L0_0()
  TeleportGremlinOut("hub_meanstreet_v1.MechanicGremlinV1")
  wait(0.5)
  FireUser1("hub_meanstreet_v1.MachineMarker")
  Prefab_Projector_ChangeState("ToonTownStartMarker", "Activate")
  TeleportGremlinIn("hub_meanstreet_v1.MechanicGremlinV1", "hub_meanstreet_v1.MachineFixMarker 01", true, true)
  EnterCutscene("hub_meanstreet_v1.MechanicGremlinV1", 1)
end
MS_V1_GremlinFixProjector = L0_0
function L0_0(A0_4)
  TeleportGremlinOut("hub_meanstreet_v1.MechanicGremlinV1")
  TeleportGremlinIn("hub_meanstreet_v1.MechanicGremlinV1", "hub_meanstreet_v1.MachineFixMarker 02", false, true)
  EnableMotion(A0_4)
end
MS_V1_GremlinResetToMarker = L0_0
function L0_0()
  SetGlobal("MS_V1_NotEnough", 1)
  ForceSequence("hub_meanstreet_v1.Jack Kelly", "TT_V2_Footprintsellstolen")
  SetGlobal("MS_V1_NotEnough", 0)
end
MS_JackKelly_NotEnough = L0_0
