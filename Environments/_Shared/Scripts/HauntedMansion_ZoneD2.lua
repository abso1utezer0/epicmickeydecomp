local L0_0, L1_1
function L0_0()
  SaveCheckpoint(GetPlayer(), "HM_HouseLoadCheckpoint", "hauntedmansion_zoned2.ZoneDForwardMarker")
end
HM_ZoneD2_SaveCheckpoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "HM_HouseLoadCheckpoint", "hauntedmansion_zoned2.FrontYardStartPositionMarker 01")
end
HM_ZoneD2_SaveCheckpointChest = L0_0
function L0_0()
  HM_FrontYardCam()
  StartTrackingCurrentLevelForScoring("HM_ManorHouse")
  SetGlobal("HM_FrontGrem_Talk", 0)
  if GetGlobal("HM_ZoneD2_AnvilCheckpoint") == 0 and GetGlobal("HM_MadDoc_FrontYard") == 0 then
    HM_GrabFrontCamera()
  end
  if GetGlobal("HM_MadDoc_FrontYard") == 1 then
    ForEachEntityInGroup(DestroyEntity, "PlayerCameraGraveyard")
    DestroyEntity("hauntedmansion_zoned2.StreamTrigger")
  end
  if GetGlobal("HM_ZoneD2_AnvilCheckpoint") == 1 then
    ForEachEntityInGroup(DestroyEntity, "PlayerCameraGraveyard")
    Hide("hauntedmansion_zoned2.GusAnvilHintTrigger")
    Disable("hauntedmansion_zoned2.StreamTrigger")
    HM_Anvil_Trained = 1
    FireThread(HM_SpawnSpatterSet02)
    DisableGuardianHint("hauntedmansion_zoned2.PlayerHintMarkers_AnvilChest 01")
    if GetGlobal("HM_Neville_Rescued") == 1 then
      Hide("hauntedmansion_zoned2.ConvoMarkerGremlin 01")
    end
    if GetGlobal("HM_FrontDoor_Opened") == 1 then
      wait(0.2)
      DestroyEntity("hauntedmansion_zoned2.FrontDoorPlaneTrigger 01")
      AnimGBSequence("hauntedmansion_zoned1.Front_Door 01", "Open")
      DisableGuardianHint("hauntedmansion_zoned2.PlayerHintMarkers_AnvilPlate 01")
      Unhide("BalconySpatter")
      SetNextPatrolNode("BalconySpatter", "hauntedmansion_zoned2.PatrolPath03Node 02")
    elseif GetGlobal("HM_FrontDoor_Opened") == 0 then
      wait(0.2)
      DestroyEntity("hauntedmansion_zoned2.FrontDoorPlaneTrigger 01")
      Unhide("hauntedmansion_zoned2.SpatterRanged_Hard 02")
      EnableGuardianHint("hauntedmansion_zoned2.PlayerHintMarkers_AnvilPlate 01")
    end
    FireThread(HM_SpawnSpatterSet01)
  end
  if GetGlobal("MarbleBustKilled_01") == 1 then
    DestroyEntity("MarbleBust01")
  end
  if GetGlobal("MarbleBustKilled_02") == 1 then
    DestroyEntity("MarbleBust02")
  end
end
HM_HouseLoadCheckpoint = L0_0
function L0_0()
  AnimEvent("hauntedmansion_zoned2.Mad Doctor 01", EVENT_Special_0)
end
HM_MadDoc_Idle = L0_0
function L0_0()
  AnimEvent("hauntedmansion_zoned2.Mad Doctor 01", EVENT_Special_5)
end
HM_MadDoc_Scared = L0_0
function L0_0()
  AnimEvent("hauntedmansion_zoned2.Mad Doctor 01", EVENT_Special_3)
end
HM_MadDoc_Happy = L0_0
function L0_0()
  AnimEvent("hauntedmansion_zoned2.Mad Doctor 01", EVENT_Special_6)
end
HM_MadDoc_Talk = L0_0
function L0_0()
  AnimEvent("hauntedmansion_zoned2.Mad Doctor 01", EVENT_Special_8)
end
HM_MadDoc_Listen = L0_0
function L0_0()
  AnimEvent("hauntedmansion_zoned2.Mad Doctor 01", EVENT_Special_7)
  AnimGBSequence("hauntedmansion_zoned2.NOS_HM_MadDr_Pod 01", "Controls_Idle")
end
HM_MadDoc_Controls = L0_0
function L0_0(A0_2, A1_3)
  GrabCamera(A0_2, nil, CAMERA_LERP_TRANSITION, A1_3)
end
HM_GrabCam = L0_0
function L0_0()
  GrabCamera("hauntedmansion_zoned2.HM_IntroShotReleaseCamera 01", GetPlayer(), CAMERA_LERP_TRANSITION, 2)
  wait(0.1)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1)
  wait(1)
end
HM_ReleaseCamModify = L0_0
L0_0 = 0
HM_TrainingButton = L0_0
L0_0 = false
HM_TrainingButtonDepressed = L0_0
function L0_0()
  HM_TrainingButtonDepressed = true
  Print("Button Depressed")
  if HM_TrainingButton == 0 then
    HM_TrainingButton = 1
    FireSequence("hauntedmansion_zoned2.GusConvoMarker 01", "HM_TrainingButtonOn")
    HM_TrainingButtonOn()
    AudioPostEventOn("hauntedmansion_zoned2_audio.Platform_2", "Play_sfx_HM_FYard_Platforms_2D")
  elseif HM_TrainingButton == 1 then
    HM_TrainingButtonOn()
  end
end
HM_UseTrainingButton = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(1)
  UnpauseAllAI()
  SetCameraAttributes("hauntedmansion_zoned2.GraveyardCameraMarker 03")
  wait(0.1)
  StartFadeIn(0)
end
HM_TrainingButtonReleaseCam = L0_0
function L0_0()
  if HM_TrainingButtonDepressed == true then
    SplineFollower_StopAtPosition("hauntedmansion_zoned2.Platform01 01", "hauntedmansion_zoned2.PlatformSplineKnot 01", "hauntedmansion_zoned2.PlatformSplineKnot 02", 1)
    SetSplineFollowerInitialSpeed("hauntedmansion_zoned2.Platform01 01", 3)
    AudioPostEventOn("hauntedmansion_zoned2_audio.Platform_1", "Play_sfx_HM_FYard_Platforms_Rise_1")
    wait(0.5)
    if HM_TrainingButtonDepressed == true then
      SplineFollower_StopAtPosition("hauntedmansion_zoned2.Platform02 01", "hauntedmansion_zoned2.PlatformSplineKnot 01", "hauntedmansion_zoned2.PlatformSplineKnot 02", 1)
      SetSplineFollowerInitialSpeed("hauntedmansion_zoned2.Platform02 01", 3)
      AudioPostEventOn("hauntedmansion_zoned2_audio.Platform_2", "Play_sfx_HM_FYard_Platforms_Rise_2")
      wait(0.3)
      if HM_TrainingButtonDepressed == true then
        SplineFollower_StopAtPosition("hauntedmansion_zoned2.Platform03 01", "hauntedmansion_zoned2.PlatformSplineKnot 01", "hauntedmansion_zoned2.PlatformSplineKnot 02", 1)
        SetSplineFollowerInitialSpeed("hauntedmansion_zoned2.Platform03 01", 3)
        AudioPostEventOn("hauntedmansion_zoned2_audio.Platform_3", "Play_sfx_HM_FYard_Platforms_Rise_2")
      end
    end
  end
end
HM_TrainingButtonOn = L0_0
L0_0 = 0
HM_AnvilTraining01Fail = L0_0
function L0_0()
  Print("Button Clear")
  HM_TrainingButtonDepressed = false
  if HM_AnvilTraining01Fail == 0 then
    HM_AnvilTraining01Fail = 1
    FireSequence("hauntedmansion_zoned2.GusConvoMarker 01", "HM_Gus_Anvil01Fail")
    HM_AnvilPlatformsDown()
  elseif HM_AnvilTraining01Fail == 1 then
    HM_AnvilPlatformsDown()
  end
end
HM_TrainingButtonOff = L0_0
function L0_0()
  if HM_TrainingButtonDepressed == false then
    SplineFollower_StopAtPosition("hauntedmansion_zoned2.Platform01 01", "hauntedmansion_zoned2.PlatformSplineKnot 01", "hauntedmansion_zoned2.PlatformSplineKnot 02", 0)
    AudioPostEventOn("hauntedmansion_zoned2_audio.Platform_2", "Play_sfx_HM_FYard_Platforms_Lower")
    wait(0.5)
    if HM_TrainingButtonDepressed == false then
      SplineFollower_StopAtPosition("hauntedmansion_zoned2.Platform02 01", "hauntedmansion_zoned2.PlatformSplineKnot 01", "hauntedmansion_zoned2.PlatformSplineKnot 02", 0)
      wait(0.3)
      if HM_TrainingButtonDepressed == false then
        SplineFollower_StopAtPosition("hauntedmansion_zoned2.Platform03 01", "hauntedmansion_zoned2.PlatformSplineKnot 01", "hauntedmansion_zoned2.PlatformSplineKnot 02", 0)
      end
    end
  end
end
HM_AnvilPlatformsDown = L0_0
function L0_0()
  if GetGlobal("HM_FrontYardIntroPlayed") == 0 then
    StartFadeOut(0.8)
    HideHud()
    PlayAndUnlockMovie("HM_visit1_Intro_to_HauntedMansion.bik", "HM_visit1_Intro_to_HauntedMansion")
    SetGlobal("HM_FrontYardIntroPlayed", 1)
    SetGlobal("MS_MeanStreetProgress", 4)
    SetMap(GetPlayer(), "MAP_HM_ZONED2", "GAME")
    StartTrackingCurrentLevelForScoring("HM_ManorHouse")
    StartFadeInNoHUD(1)
    AudioPostEventOn(GetPlayer(), "Play_sfx_HM_FrontYard_Intro_Moment")
    FireSequence("hauntedmansion_zoned2.GusConvoMarker 01", "HM_Graveyard_Gus_FirstBark")
  end
end
HM_FrontYard_Intro = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("HM_ManorHouse")
end
HM_ManorHouse_Exit = L0_0
function L0_0()
  local L0_4, L1_5
end
Load2DSoundBank = L0_0
function L0_0()
  FireThread(HM_FrontYard_Intro_Camera)
  wait(0.1)
  ShowReticleOnly()
  FireSequence("hauntedmansion_zoned2.GusConvoMarker 01", "HM_Graveyard_Gus_FirstBark2")
end
HM_FrontYard_Intro_DoneFire = L0_0
function L0_0()
  wait(0.8)
  GrabCamera("cameraIntro", nil, CAMERA_INSTANT_TRANSITION, 0)
end
HM_FrontYard_Intro_Camera = L0_0
function L0_0()
  ReleaseCamera(CAMERA_EASING_TRANSITION, 1.5)
  wait(1.5)
  HM_FrontYardCam()
end
HM_FrontYard_Intro_Camera_End = L0_0
function L0_0()
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
end
HM_FrontYardCam = L0_0
function L0_0()
  if GetSketchCount(GetPlayer(), "Sketch_Anvil") == 0 then
    ForceSpawn("hauntedmansion_zoned2.SpatterAnvilSpawner 01", 1)
  end
end
HM_SpatterAnvilSpawn = L0_0
function L0_0()
  MoveToEntity(GetPlayer(), "hauntedmansion_zoned2_igc.Marker(Rotatable) 01_mickeyPosition")
end
HM_MadDoc_Intro_Teleport = L0_0
function L0_0()
  if GetGlobal("HM_MadDoc_FrontYard") == 0 then
    FireSequence("hauntedmansion_zoned2.GusConvoMarker 01", "HM_Gus_DocReveal")
    wait(0.8)
    AudioPostEventOn(GetPlayer(), "Play_sfx_MadDoc_Intro_partA")
    AudioPostEventOn(GetPlayer(), "Reset_Volume_MadDocPod")
    wait(0.2)
    AnimGBSequence("hauntedmansion_zoned2.NOS_HM_MadDr_Pod 01", "Emerge")
    wait(5.667)
    AnimGBSequence("hauntedmansion_zoned2.NOS_HM_MadDr_Pod 01", "Idle")
  end
end
HM_MadDoc_Intro01 = L0_0
function L0_0()
  Unhide("hauntedmansion_zoned2.NOS_HM_MadDr_Pod 01")
  Unhide("hauntedmansion_zoned2.Mad Doctor 01")
  Unhide("hauntedmansion_zoned2.MadDocFX_SnoGlobe 01")
  MoveToEntity(GetPlayer(), "hauntedmansion_zoned2_igc.Marker(Rotatable) 01_mickeyPosition")
end
HM_MadDoc_Intro03 = L0_0
function L0_0()
  wait(1)
  HM_MadDoc_Happy()
  wait(1)
  AnimGBSequence("hauntedmansion_zoned2.NOS_HM_MadDr_Pod 01", "Exit")
  wait(6)
  Hide("hauntedmansion_zoned2.NOS_HM_MadDr_Pod 01")
  Hide("hauntedmansion_zoned2.Mad Doctor 01")
  Hide("hauntedmansion_zoned2.MadDocFX_SnoGlobe 01")
  Wait(0.1)
end
HM_MadDoc_Intro02 = L0_0
function L0_0()
  SetGlobal("HM_MadDoc_FrontYard", 1)
  FireThread(HM_StreamOutDocThread)
end
HM_MadDoc_Streamout = L0_0
function L0_0()
  wait(2)
  StreamInterior(nil, "stream_1_ai2")
end
HM_StreamOutDocThread = L0_0
function L0_0()
  HM_ZoneD2_SaveCheckpointChest()
end
HM_FrontYard_TreasureChest = L0_0
function L0_0()
  SetGlobal("HM_AnvilChestOpened", 1)
  AddItem(GetPlayer(), "Sketch_Anvil", 1)
  FireUser1("hauntedmansion_zoned2.AnvilTrainingLogicRelayMarker")
  HM_ZoneD2_SaveCheckpoint()
end
HM_Anvil_TreasureChest = L0_0
function L0_0()
  if GetGlobal("HM_ZoneD2_AnvilCheckpoint") == 0 then
    HM_Anvil01_Pickup()
  elseif GetGlobal("HM_ZoneD2_AnvilCheckpoint") == 1 then
    HM_FrontGremCutRelease()
  end
end
HM_ExtraAnvilPickup = L0_0
function L0_0()
  if HM_Anvil_Trained == 0 then
    StartFadeOut(0.1)
    RestrictCutSceneInput()
    wait(0.1)
    PlayAndUnlockMovie("HM_visit1_Training_Anvil.bik", "HM_visit1_Training_Anvil")
    HM_Anvil_Trained = 1
    SetGlobal("HM_ZoneD2_AnvilCheckpoint", 1)
    DisableGuardianHint("hauntedmansion_zoned2.PlayerHintMarkers_AnvilChest 01")
    EnableGuardianHint("hauntedmansion_zoned2.PlayerHintMarkers_AnvilPlate 01")
    HM_Anvil01_Pickup_SpattersCamera()
  elseif HM_Anvil_Trained == 1 then
    StartFadeOut(0.5)
    wait(0.5)
    UnpauseAllAI(GetPlayer())
    if HM_NearSpladoosh == 0 then
      SetCameraAttributes("hauntedmansion_zoned2.BalconyCameraMarker(CameraOverride) 01")
    elseif HM_NearSpladoosh == 1 then
      SetCameraAttributes("hauntedmansion_zoned2.BalconyCameraMarker(CameraOverride) 02")
    end
    wait(0.5)
    StartFadeIn()
  end
end
HM_Anvil01_Pickup = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Play_sfx_FYard_SpatterAttack")
  StartFadeIn(0.5)
  FireThread(HM_SpawnSpatterSet02)
  FireUser1("AnvilSpatterCameraMarker")
  Unhide("BalconySpatter")
  AnimGBSequence("hauntedmansion_zoned1.Front_Door 01", "OpenForward")
  wait(2)
  SetNextPatrolNode("BalconySpatter", "hauntedmansion_zoned2.PatrolPath03Node 02")
  FireThread(HM_SpawnSpatterSet01)
end
HM_Anvil01_Pickup_SpattersCamera = L0_0
function L0_0()
  StartFadeOut(0.5)
  wait(0.5)
  if HM_NearSpladoosh == 0 then
    SetCameraAttributes("hauntedmansion_zoned2.BalconyCameraMarker(CameraOverride) 01")
  elseif HM_NearSpladoosh == 1 then
    SetCameraAttributes("hauntedmansion_zoned2.BalconyCameraMarker(CameraOverride) 02")
  end
  wait(0.5)
  FireSequence("hauntedmansion_zoned2.GusConvoMarker 01", "HM_FrontYardAnvilQuest")
  StartFadeIn()
  HM_ZoneD2_SaveCheckpoint()
end
HM_Anvil01_Pickup_SpattersCamera_End = L0_0
L0_0 = 0
HM_NearSpladoosh = L0_0
function L0_0()
  local L1_6
  L1_6 = 1
  HM_NearSpladoosh = L1_6
end
HM_InSpladooshAlcove = L0_0
function L0_0()
  local L1_7
  L1_7 = 0
  HM_NearSpladoosh = L1_7
end
HM_OnBalcony = L0_0
L0_0 = 0
HM_Anvil_Trained = L0_0
L0_0 = 0
HM_Anvil_Used = L0_0
function L0_0()
  if GetGlobal("HM_FrontDoor_Opened") == 0 then
    SetGlobal("HM_FrontDoor_Opened", 1)
    if HM_Anvil_Used == 0 then
      Hide("hauntedmansion_zoned2.GusAnvilHintTrigger")
      wait(1)
      FireSequence("hauntedmansion_zoned2.GusConvoMarker 01", "HM_Gus_FrontDoor01")
      HM_Anvil_Used = 1
      DisableGuardianHint("hauntedmansion_zoned2.PlayerHintMarkers_AnvilPlate 01")
    end
    wait(1)
    HM_OpenFrontDoor()
    wait(2)
    AudioPostEventOn(GetPlayer(), "Play_sfx_LonesomeGhostsTaunt")
  end
end
HM_AnvilPlate01_On = L0_0
function L0_0()
  HM_Anvil_Used = 1
  FireSequence("hauntedmansion_zoned2.GusConvoMarker 01", "HM_Gus_AnvilUsed_01")
end
HM_UseAnvil_OnPlate = L0_0
function L0_0()
  if HM_Anvil_Used == 0 and HM_AnvilPlate01 == 1 then
    HM_AnvilPlate01 = 0
    AudioPostEventOn("hm_zoneb_audio.Sound_Marker_teleportdoors1", "Play_sfx_mausoleum_close")
    HM_CloseFrontDoor()
    wait(1.5)
  end
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.7)
end
HM_AnvilPlate01_Off = L0_0
function L0_0()
  AnimGBSequence("hauntedmansion_zoned1.Front_Door 01", "Open")
  AudioPostEventOn(GetPlayer(), "Pause_HM_music")
  wait(0.5)
  AudioPostEventOn("hauntedmansion_zoned2_audio.Sound_ExitDoor", "Play_sfx_HM_frontdoor_open")
end
HM_OpenFrontDoor = L0_0
function L0_0()
  AnimGBSequence("hauntedmansion_zoned1.Front_Door 01", "Close")
  SetPropertyBool("hauntedmansion_zoned1.Front_Door 01", "IsAIObstacle", false, 0)
  AudioPostEventOn("hauntedmansion_zoned2_audio.Sound_ExitDoor", "Play_sfx_HM_front_close")
end
HM_CloseFrontDoor = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.7)
end
HM_ReleaseCamera = L0_0
function L0_0()
  if HM_Anvil_Used == 0 then
    FireUser1("SpatterPipeSpawner01")
    wait(1.8)
    ForceSpawn("hauntedmansion_zoned2.SpatterSpawner 01", 1)
    wait(2)
    SetNextPatrolNode("hauntedmansion_zoned2.SpatterMelee_Hard 01", "hauntedmansion_zoned2.PatrolPath01Node 01")
  end
end
HM_SpawnSpatterSet01 = L0_0
function L0_0()
  if HM_Anvil_Used == 0 then
    FireUser1("SpatterPipeSpawner01")
    wait(1.8)
    ForceSpawn("hauntedmansion_zoned2.SpatterSpawner 02", 1)
    wait(2)
    SetNextPatrolNode("hauntedmansion_zoned2.SpatterMelee_Hard 02", "hauntedmansion_zoned2.PatrolPath01Node 01")
  end
end
HM_SpawnSpatterSet02 = L0_0
function L0_0()
  ForceSequence("hauntedmansion_zoned2.ConvoMarkerGremlin 01", "HM_FrontGremlin_Rescue")
end
HM_RescueFrontGrem = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(1)
  UnpauseAllAI()
  SetCameraAttributes("hauntedmansion_zoned2.BalconyCameraMarker(CameraOverride) 02")
  StartFadeIn(0)
  Hide("hauntedmansion_zoned2.ConvoMarkerGremlin 01")
end
HM_FrontGremCutRelease = L0_0
function L0_0()
  local L0_8, L1_9
end
HM_AutoStateMusic = L0_0
function L0_0()
  GrabCamera("cameraIntro", nil, CAMERA_LERP_TRANSITION, 1.5)
end
HM_GrabFrontCamera = L0_0
function L0_0(A0_10)
  SetPropertyFloat(A0_10, "UsableRadius", 0)
end
HM_ToonGraveThinned = L0_0
function L0_0(A0_11)
  SetPropertyFloat(A0_11, "UsableRadius", 2)
end
HM_ToonGravePainted = L0_0
function L0_0()
  SetPropertyFloat("hm_zoned3_dynamic.Lonesome Ghost Tall 01", "UsableRadius", 0)
end
HM_GhostThinnedOut = L0_0
function L0_0()
  SetPropertyFloat("hm_zoned3_dynamic.Lonesome Ghost Tall 01", "UsableRadius", 2)
end
HM_GhostPaintedIn = L0_0
