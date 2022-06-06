local L0_0, L1_1
L0_0 = false
MJM_SkipIntro = L0_0
function L0_0()
  if MJM_SkipIntro == false then
    MJM_SkipIntro = true
    MJM_Setup_Launcher("mjm_zonef.seq_projector 06.ExitProjectorMarker")
    GuardianPrefab_PopulateGuardians("MJM_Caverns_GuardianSpawner")
    StartTrackingCurrentLevelForScoring("MJM_Caverns")
  end
end
MJM_ZoneF_AlwaysSetup_Launcher = L0_0
function L0_0()
  FireSequence("Gus", "MJM_Gus_QuestComplete")
end
MJM_FinishQuest = L0_0
function L0_0()
  Print("Enter MJM_StartTrackCaverns")
  EndTrackingCurrentLevelForScoring("MJM_Airlock3")
  StartTrackingCurrentLevelForScoring("MJM_Caverns")
end
MJM_StartTrackCaverns = L0_0
function L0_0()
  Print("Enter MJM_StartTrackAirlock3")
  EndTrackingCurrentLevelForScoring("MJM_Caverns")
  StartTrackingCurrentLevelForScoring("MJM_Airlock3")
end
MJM_StartTrackAirlock3 = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("MJM_Caverns")
end
MJM_ZoneF_LeavingCaverns = L0_0
function L0_0()
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
end
MJM_Caverns_CamDefault = L0_0
function L0_0()
  DestroyEntity("mjm_zonef.OpenCavernsDoor_TriggerRotate")
  DestroyEntity("mjm_zonef.PlaneTrigger 01")
  FireUser1("CavernIntroCameraMarker")
  SetMap(nil, "MAP_MJ_ZONEF", "GAME")
  StartTrackingCurrentLevelForScoring("MJM_Caverns")
end
MJM_Caverns_SaveCheckpoint0 = L0_0
function L0_0()
  MJM_Caverns_CamDefault()
  SaveCheckpoint(GetPlayer(), "MJM_CavernsLoadCheckpoint", "mjm_zonef.seq_projector 06.ExitProjectorMarker")
end
MJM_Caverns_introEnd = L0_0
function L0_0()
  if GetGlobal("MJM_Visit2") == 1 then
    SaveCheckpoint(GetPlayer(), "MJM_CavernsLoadCheckpoint", "mjm_zonef.seq_projector 06.ExitProjectorMarker")
  else
    SaveCheckpoint(GetPlayer(), "MJM_CavernsLoadCheckpoint", "mjm_zonef.EnterZoneCheckpoint_Marker(Rotatable)")
  end
end
MJM_Caverns_SaveCheckpoint = L0_0
function L0_0()
  DestroyEntity("mjm_zonef.OpenCavernsDoor_TriggerRotate")
  DestroyEntity("mjm_zonef.PlaneTrigger 01")
  SetMap(nil, "MAP_MJ_ZONEF", "GAME")
  MJM_Caverns_CamDefault()
  StartTrackingCurrentLevelForScoring("MJM_Caverns")
  if GetGlobal("MJM_Visit2") == 1 then
    FireThread(GuardianPrefab_PopulateGuardians, "MJM_Caverns_GuardianSpawner")
    Enable("MJM_ProjectorCameraOverride")
    SetCameraAttributes("MJM_ProjectorCameraOverride")
    if GetGlobal("MJM_Challenge1Complete") == 0 then
      SetGlobal("MJM_Challenge1Complete", 1)
    end
    if GetGlobal("MJM_Challenge2Complete") == 0 then
      SetGlobal("MJM_Challenge2Complete", 1)
    end
    if GetGlobal("MJM_Challenge3Complete") == 0 then
      SetGlobal("MJM_Challenge3Complete", 1)
    end
    if GetGlobal("MJM_Oswald_Visit2_Played") == 1 then
      Prefab_Projector_ChangeState("ProjectorToYeOldenDays", "Activate")
    end
  else
    FireUser1("mjm_zonef_audio.Trigger_Portal 01")
    Disable("mjm_zonef_audio.Trigger_Portal")
    SetPropertyFloat("Oswald", "UsableRadius", 0)
  end
  if GetGlobal("MJM_Challenge1Complete") == 1 and GetGlobal("MJM_Challenge2Complete") == 0 and GetGlobal("MJM_Challenge3Complete") == 0 then
    AnimGBSequence("mjm_zonef.Challenge2Door", "opening")
    AnimGBSequence("mjm_zonef.MJ_ZoneF_trafficLight 02", "green")
    GetPrefabData("mjm_zonef.seq_projector 05.ProjectorPortal_Stand").StartsInactive = "False"
  elseif GetGlobal("MJM_Challenge1Complete") == 1 and GetGlobal("MJM_Challenge2Complete") == 1 and GetGlobal("MJM_Challenge3Complete") == 0 then
    AnimGBSequence("mjm_zonef.Challenge3Door", "opening")
    AnimGBSequence("mjm_zonef.MJ_ZoneF_trafficLight 03", "green")
    GetPrefabData("mjm_zonef.seq_projector 04.ProjectorPortal_Stand").StartsInactive = "False"
  elseif GetGlobal("MJM_Challenge1Complete") == 1 and GetGlobal("MJM_Challenge2Complete") == 1 and GetGlobal("MJM_Challenge3Complete") == 1 then
    AnimGBSequence("mjm_zonef.MJ_ZoneF_Door_011", "Opening")
    AnimGBSequence("mjm_zonef.MJ_ZoneF_Door_012", "Opening")
    AnimGBSequence("mjm_zonef.MJ_ZoneF_Door_09", "Opening")
  end
  if GetGlobal("MJM_ModelRoomOpen") == 1 and GetGlobal("MJM_ModelRoomDone") == 0 then
    AnimGBSequence("mjm_zonef.HallEntergate", "opening")
  end
  if GetGlobal("MJM_ChallengeStarted") == 1 and GetGlobal("MJM_Challenge1Complete") == 0 and GetGlobal("MJM_Challenge2Complete") == 0 and GetGlobal("MJM_Challenge3Complete") == 0 then
    AnimGBSequence("mjm_zonef.MJ_ZoneF_trafficLight 01", "green")
    AnimGBSequence("mjm_zonef.Challenge1Door", "opening")
    GetPrefabData("mjm_zonef.seq_projector 08.ProjectorPortal_Stand").StartsInactive = "False"
  end
end
MJM_CavernsLoadCheckpoint = L0_0
function L0_0()
  SetGlobal("MJM_Visit2", 1)
  if GetGlobal("MJM_Visit2") == 1 then
    AnimGBSequence("mjm_zonef.MJ_ZoneF_Door_011", "Opening")
    AnimGBSequence("mjm_zonef.MJ_ZoneF_Door_012", "Opening")
    AnimGBSequence("mjm_zonef.MJ_ZoneF_Door_09", "Opening")
    SetGlobal("MJM_Challenge1Complete", 1)
    SetGlobal("MJM_Challenge2Complete", 1)
    SetGlobal("MJM_Challenge3Complete", 1)
    SetGlobal("MJM_ChallengeStarted", 1)
    Disable("Visit2CameraDisable")
    Disable("mjm_zonef.TriggerRotate 03")
  end
end
CavernsIntroCheck = L0_0
function L0_0()
  if GetGlobal("MJM_Visit2") == 0 then
    StreamZones(GetPlayer(), "stream_17")
  end
end
MJM_CheckStreamCaverns = L0_0
function L0_0()
  if GetGlobal("MJM_Visit2") == 0 and GetGlobal("MJM_ChallengeStarted") == 0 and GetGlobal("MJM_SlopesIntroCamera") == 0 then
    SetGlobal("MJM_SlopesIntroCamera", 1)
    FireUser1("mjm_zonef_igc.grabcamerafancy 01.FancyCameraLookAt 01")
    TeleportToEntity("mjm_zonef_audio.Trigger_Portal 02", GetPlayer())
    Enable("mjm_zonef_audio.Trigger_Portal 02")
    wait(4)
    FireSequence("Gus", "GenricLine40")
    SetPropertyFloat("Oswald", "UsableRadius", 0)
  end
end
MJM_CardIntroHint = L0_0
function L0_0()
  FireUser3("mjm_zonef_igc.grabcamerafancy 01.FancyCameraLookAt 01")
end
GenricLine40_CamRelease = L0_0
function L0_0()
  if GetGlobal("MJM_ChallengeStarted") == 0 then
    StreamInterior(nil, "stream_trolley")
  elseif GetGlobal("MJM_ChallengeStarted") == 1 then
  end
end
MJM_TrolleyLoad = L0_0
function L0_0()
  SetGlobal("MJM_MeetOswaldMoviePlayed", 1)
  SetGlobal("PlayerFirstTimeInZone", 1)
  StartFadeOut(0.8)
  wait(2)
  PlayAndUnlockMovie("MJM_visit1_Oswald_Mickey_Meet.bik", "MJM_visit1_Oswald_Mickey_Meet")
  LoadLevel(GetPlayer(), "Levels/ToonTown_FromMJ1.level")
end
MeetingOswaldBink = L0_0
function L0_0()
  WaitForLevelLoad()
  MoveToEntity(GetPlayer(), "mjm_zonef.Marker(Rotatable) 05")
end
Knight_SafeTele = L0_0
function L0_0()
  wait(1)
  MountOsmoreChallengeCheck()
end
KnightTeleBack = L0_0
function L0_0()
  wait(1)
  MountOsmoreChallengeCheck()
end
GunsTeleBack = L0_0
function L0_0()
  wait(1)
  MountOsmoreChallengeCheck()
end
TrolleyTeleBack = L0_0
function L0_0()
  AnimGBSequence("mjm_zonef.MJ_ZoneF_trafficLight 01", "green")
  AnimGBSequence("mjm_zonef.Challenge1Door", "opening")
  Prefab_Projector_ChangeState("mjm_zonef.seq_projector 08.ProjectorPortal_Stand", "Activate")
  SetGlobal("MJM_ChallengeStarted", 1)
end
ChallengeDoorOpenStart = L0_0
function L0_0()
  SetMap(nil, "MAP_MJ_ZONEF", "GAME")
  FireUser1("mjm_zonef_audio.Trigger_Portal 01")
  Disable("mjm_zonef_audio.Trigger_Portal")
  SetPropertyFloat("Oswald", "UsableRadius", 0)
  if GetGlobal("MJM_Challenge1Complete") == 1 and GetGlobal("MJM_Challenge2Complete") == 0 and GetGlobal("MJM_Challenge3Complete") == 0 then
    ForceSequence("mjm_zonef.PlayingCard 07", "MJM_Ace_1Done")
    AnimGBSequence("mjm_zonef.Challenge1Door", "closing")
    AnimGBSequence("mjm_zonef.MJ_ZoneF_trafficLight 01", "red")
    Prefab_Projector_ChangeState("mjm_zonef.seq_projector 08.ProjectorPortal_Stand", "Deactivate")
    AnimGBSequence("mjm_zonef.MJ_ZoneF_trafficLight 02", "yellow")
    wait(3)
    AnimGBSequence("mjm_zonef.MJ_ZoneF_trafficLight 02", "green")
    AnimGBSequence("mjm_zonef.Challenge2Door", "opening")
    Prefab_Projector_ChangeState("mjm_zonef.seq_projector 05.ProjectorPortal_Stand", "Activate")
    Enable("mjm_zonef.DBC_PortalA1_Inert 02")
    Disable("mjm_zonef.DBC_PortalA1_Inert 01")
  elseif GetGlobal("MJM_Challenge1Complete") == 1 and GetGlobal("MJM_Challenge2Complete") == 1 and GetGlobal("MJM_Challenge3Complete") == 0 then
    ForceSequence("mjm_zonef.PlayingCard 07", "MJM_Ace_2Done")
    AnimGBSequence("mjm_zonef.Challenge2Door", "closing")
    AnimGBSequence("mjm_zonef.MJ_ZoneF_trafficLight 02", "red")
    Prefab_Projector_ChangeState("mjm_zonef.seq_projector 05.ProjectorPortal_Stand", "Deactivate")
    AnimGBSequence("mjm_zonef.MJ_ZoneF_trafficLight 03", "yellow")
    wait(3)
    AnimGBSequence("mjm_zonef.MJ_ZoneF_trafficLight 03", "green")
    AnimGBSequence("mjm_zonef.Challenge3Door", "opening")
    Prefab_Projector_ChangeState("mjm_zonef.seq_projector 04.ProjectorPortal_Stand", "Activate")
    Enable("mjm_zonef.DBC_PortalA1_Inert 03")
    Disable("mjm_zonef.DBC_PortalA1_Inert 02")
  elseif GetGlobal("MJM_Challenge1Complete") == 1 and GetGlobal("MJM_Challenge2Complete") == 1 and GetGlobal("MJM_Challenge3Complete") == 1 then
    ForceSequence("mjm_zonef.PlayingCard 07", "MJM_Ace_3Done")
    AnimGBSequence("mjm_zonef.MJ_ZoneF_trafficLight 03", "red")
    AnimGBSequence("mjm_zonef.Challenge3Door", "closing")
    Prefab_Projector_ChangeState("mjm_zonef.seq_projector 04.ProjectorPortal_Stand", "Deactivate")
    AnimGBSequence("mjm_zonef.MJ_ZoneF_Door_011", "Opening")
    AnimGBSequence("mjm_zonef.MJ_ZoneF_Door_012", "Opening")
    AnimGBSequence("mjm_zonef.MJ_ZoneF_Door_09", "Opening")
    Disable("mjm_zonef.DBC_PortalA1_Inert 03")
  end
end
MountOsmoreChallengeCheck = L0_0
function L0_0()
  if GetGlobal("MountOsmoreChallenges") == 1 then
    AnimGBSequence("mjm_zonef.Challenge1Door", "opening")
  end
  if GetGlobal("MountOsmoreChallenges") == 2 then
    AnimGBSequence("mjm_zonef.Challenge2Door", "opening")
  end
  if GetGlobal("MountOsmoreChallenges") == 3 then
    AnimGBSequence("mjm_zonef.Challenge3Door", "opening")
  end
end
MJM_OpenChallengeDoor = L0_0
function L0_0()
  Bark(GetPlayer(), "Yay you beat a challenge", 3, "Gus", "Gus")
  SetGlobal("MountOsmoreChallenges", GetGlobal("MountOsmoreChallenges") + 1)
  MountOsmoreChallengeCheck()
end
MountOsmoreChallengeBeat = L0_0
function L0_0()
  Bark(GetPlayer(), "You fight the boss and head back to toon town", 3, "Gus", "Gus")
  wait(5)
  SetGlobal("TT_ToonTownProgress", 3)
  SetGlobal("NO_NewOrleansProgress", 3)
  SetGlobal("MS_MeanStreetProgress", 6)
  LoadLevel(GetPlayer(), "Levels/ToonTown_V3.level")
end
MountOsmoreVisit2Beat = L0_0
function L0_0()
  SplineFollower_StopAtPosition("mjm_zonef.TL_SM_Gear1 03", "mjm_zonef.SplineKnot 07", "mjm_zonef.SplineKnot 08", GetGlobal("MountOsmoreHallcount") * 0.01)
  if GetGlobal("MountOsmoreHallcount") * 0.01 == 1 then
    SetSplineFollowerInitialSpeed("Chestplatform", 1)
  elseif GetGlobal("MountOsmoreHallcount") * 0.01 < 1 then
    Reverse("Chestplatform")
  end
end
DBCPlatformMove = L0_0
function L0_0()
  SetGlobal("MountOsmoreHallcount", GetGlobal("MountOsmoreHallcount") + 8)
  AudioPostEventOn("mjm_zonef.TL_SM_Gear1 03", "Play_sfx_MJM_OC_Column_Rise")
  AudioPostEventOn(GetPlayer(), "Play_sfx_MJM_OC_Column_Bubbling")
  DBCPlatformMove()
end
DBCPlatformIncrease = L0_0
function L0_0()
  SetGlobal("MountOsmoreHallcount", GetGlobal("MountOsmoreHallcount") - 8)
  AudioPostEventOn("mjm_zonef.TL_SM_Gear1 03", "Play_sfx_MJM_OC_Column_Sink")
  AudioPostEventOn(GetPlayer(), "Play_sfx_MJM_OC_Column_Bubbling")
  DBCPlatformMove()
end
DBCPlatformDecrease = L0_0
function L0_0()
  SetGlobal("MountOsmoreHallcount", GetGlobal("MountOsmoreHallcount") + 5)
  AudioPostEventOn("mjm_zonef.TL_SM_Gear1 03", "Play_sfx_MJM_OC_Column_Rise")
  AudioPostEventOn(GetPlayer(), "Play_sfx_MJM_OC_Column_Bubbling")
  DBCPlatformMove()
end
DBCPlatform2Increase = L0_0
function L0_0()
  SetGlobal("MountOsmoreHallcount", GetGlobal("MountOsmoreHallcount") - 5)
  AudioPostEventOn("mjm_zonef.TL_SM_Gear1 03", "Play_sfx_MJM_OC_Column_Sink")
  AudioPostEventOn(GetPlayer(), "Play_sfx_MJM_OC_Column_Bubbling")
  DBCPlatformMove()
end
DBCPlatform2Decrease = L0_0
L0_0 = 0
PrizePlatformPainted = L0_0
function L0_0()
  PrizePlatformPainted = PrizePlatformPainted + 1
  MJM_SimpleWay()
end
MJM_SimpleAdd = L0_0
function L0_0()
  PrizePlatformPainted = PrizePlatformPainted - 1
  MJM_SimpleWay()
end
MJM_SimpleSubtract = L0_0
function L0_0()
  if PrizePlatformPainted == 11 then
    Enable("LowerPlatformNewName")
    SplineFollower_StopAtPosition("LowerPlatformNewName", "mjm_zonef.SplineKnot 20", "mjm_zonef.SplineKnot 19", 1)
  elseif PrizePlatformPainted < 11 then
    SplineFollower_StopAtPosition("LowerPlatformNewName", "mjm_zonef.SplineKnot 20", "mjm_zonef.SplineKnot 19", 0)
  end
end
MJM_SimpleWay = L0_0
function L0_0()
  if GetGlobal("MJM_ModelRoomDone") == 1 then
    FireSequence("Gus", "MJM_Gus_SecretAreaDone")
  elseif GetGlobal("MS_pickaxe") == 1 then
    FireSequence("Gus", "MJM_Gus_AxeQuestion")
  elseif GetGlobal("MJM_ModelRoomOpen") == 0 then
    FireSequence("Gus", "Gus_Generic_LockedDoor")
  end
end
MJM_AxeDoorCheck = L0_0
function L0_0()
  AnimGBSequence("mjm_zonef.HallEntergate", "opening")
  SetGlobal("MJM_ModelRoomOpen", 1)
  SetGlobal("MS_pickaxe", 0)
  MJM_Caverns_SaveCheckpoint()
end
MJM_ModelRoomOpen = L0_0
function L0_0()
  AnimGBSequence("mjm_zonef.HallEntergate", "closing")
end
MJM_ModelRoomClosed = L0_0
function L0_0()
  SplineFollower_StopAtPosition("mjm_zonef.WastelandCollumn5", "mjm_zonef.SplineKnot 18", "mjm_zonef.SplineKnot 17", (GetGlobal("HallCollumn1")))
end
HallCollumn1Check = L0_0
function L0_0()
  SetGlobal("HallCollumn1", GetGlobal("HallCollumn1") + 1)
  AudioPostEventOn("mjm_zonef.WastelandCollumn5", "Play_sfx_MJM_OC_Column_Rise")
  HallCollumn1Check()
end
HallCollumn1CheckIncrease = L0_0
function L0_0()
  SetGlobal("HallCollumn1", GetGlobal("HallCollumn1") - 1)
  AudioPostEventOn("mjm_zonef.WastelandCollumn5", "Play_sfx_MJM_OC_Column_Sink")
  HallCollumn1Check()
end
HallCollumn1CheckDecrease = L0_0
function L0_0()
  SplineFollower_StopAtPosition("mjm_zonef.WastelandCollumn1", "mjm_zonef.SplineKnot 09", "mjm_zonef.SplineKnot 10", GetGlobal("HallCollumn2") * 0.1)
end
HallCollumn2Check = L0_0
function L0_0()
  SetGlobal("HallCollumn2", GetGlobal("HallCollumn2") + 10)
  AudioPostEventOn("mjm_zonef.WastelandCollumn1", "Play_sfx_MJM_OC_Column_Rise")
  HallCollumn2Check()
end
HallCollumn2CheckIncrease = L0_0
function L0_0()
  SetGlobal("HallCollumn2", GetGlobal("HallCollumn2") - 10)
  AudioPostEventOn("mjm_zonef.WastelandCollumn1", "Play_sfx_MJM_OC_Column_Sink")
  HallCollumn2Check()
end
HallCollumn2CheckDecrease = L0_0
function L0_0()
  SplineFollower_StopAtPosition("mjm_zonef.WastelandCollumn2", "mjm_zonef.SplineKnot 12", "mjm_zonef.SplineKnot 11", GetGlobal("HallCollumn3") * 0.1)
end
HallCollumn3Check = L0_0
function L0_0()
  SetGlobal("HallCollumn3", GetGlobal("HallCollumn3") + 10)
  AudioPostEventOn("mjm_zonef.WastelandCollumn2", "Play_sfx_MJM_OC_Column_Rise")
  HallCollumn3Check()
end
HallCollumn3CheckIncrease = L0_0
function L0_0()
  SetGlobal("HallCollumn3", GetGlobal("HallCollumn3") - 10)
  AudioPostEventOn("mjm_zonef.WastelandCollumn2", "Play_sfx_MJM_OC_Column_Sink")
  HallCollumn3Check()
end
HallCollumn3CheckDecrease = L0_0
function L0_0()
  SplineFollower_StopAtPosition("mjm_zonef.WastelandCollumn3", "mjm_zonef.SplineKnot 13", "mjm_zonef.SplineKnot 14", GetGlobal("HallCollumn4") * 0.1)
end
HallCollumn4Check = L0_0
function L0_0()
  SetGlobal("HallCollumn4", GetGlobal("HallCollumn4") + 10)
  AudioPostEventOn("mjm_zonef.WastelandCollumn3", "Play_sfx_MJM_OC_Column_Rise")
  HallCollumn4Check()
end
HallCollumn4CheckIncrease = L0_0
function L0_0()
  SetGlobal("HallCollumn4", GetGlobal("HallCollumn4") - 10)
  AudioPostEventOn("mjm_zonef.WastelandCollumn3", "Play_sfx_MJM_OC_Column_Sink")
  HallCollumn4Check()
end
HallCollumn4CheckDecrease = L0_0
function L0_0()
  SplineFollower_StopAtPosition("mjm_zonef.WastelandCollumn4", "mjm_zonef.SplineKnot 15", "mjm_zonef.SplineKnot 16", GetGlobal("HallCollumn5") * 0.1)
end
HallCollumn5Check = L0_0
function L0_0()
  SetGlobal("HallCollumn5", GetGlobal("HallCollumn5") + 10)
  AudioPostEventOn("mjm_zonef.WastelandCollumn4", "Play_sfx_MJM_OC_Column_Rise")
  HallCollumn5Check()
end
HallCollumn5CheckIncrease = L0_0
function L0_0()
  SetGlobal("HallCollumn5", GetGlobal("HallCollumn5") - 10)
  AudioPostEventOn("mjm_zonef.WastelandCollumn4", "Play_sfx_MJM_OC_Column_Sink")
  HallCollumn5Check()
end
HallCollumn5CheckDecrease = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_7")
  WaitForLevelLoad()
  TeleportToEntity(GetPlayer(), "mjm_zoneg.Marker(Parentable) 02")
end
MJM_TeleporttoZoneG = L0_0
function L0_0()
  if GetGlobal("TT_ToonTownProgress") == 2 then
    TeleportToEntity(GetPlayer(), "mjm_zonef.Marker(Parentable) 04")
  end
end
MJM_TeleporttoZoneFV2 = L0_0
function L0_0()
  if GetGlobal("MJM_Oswald_Visit2_Played") == 0 then
    ForceSequence("Oswald", "MJM_Oswald_Visit2")
  end
end
MJM_ForceOswaldFV2 = L0_0
function L0_0()
  GrabCamera("mjm_zonef.SlideControlPoint2", "mjm_zonef.SplineKnot(Parentable) 01", CAMERA_LERP_TRANSITION, 2)
end
MJM_MoveSlideCamera = L0_0
function L0_0()
  if GetPropertyBool("cavernsmask1ear1", "Is Painted") == false and GetPropertyBool("cavernsmask1ear2", "Is Painted") == false then
    SetSplineFollowerInitialSpeed("cavernsmask1", 5)
  end
end
MJM_BunnyHack1 = L0_0
function L0_0()
  if GetPropertyBool("cavernsmask2ear1", "Is Painted") == false and GetPropertyBool("cavernsmask2ear2", "Is Painted") == false then
    SetSplineFollowerInitialSpeed("cavernsmask2", 5)
  end
end
MJM_BunnyHack2 = L0_0
