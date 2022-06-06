local L0_0, L1_1
L0_0 = 0
BeetleworxKilled = L0_0
L0_0 = 0
HM_MadDoctorKilled = L0_0
L0_0 = 0
HM_Doombuggy_State = L0_0
function L0_0()
  SetMap(GetPlayer(), "MAP_HM_ZONEM", "GAME")
  HM_Attic_CamDefault()
  Prefab_Projector_ChangeState("MadDoc_PortalExit", "Deactivate")
  StartTrackingCurrentLevelForScoring("HM_Attic")
  StreamInterior(GetPlayer(), "stream_13_ai_1")
  HM_Attic_SaveCheckpoint()
end
HM_IntoTheAttic = L0_0
function L0_0()
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
end
HM_Attic_CamDefault = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "HM_AtticLoadCheckpoint", "hauntedmansion_zonem.AtticIntroMarker 01")
end
HM_Attic_SaveCheckpoint = L0_0
function L0_0()
  HM_Attic_CamDefault()
  StartTrackingCurrentLevelForScoring("HM_Attic")
  if GetGlobal("HM_Attic_IntroPlayed") == 1 and GetGlobal("HM_Attic_BwrxQuest") == 0 then
    DestroyEntity("hm_zonem_dynamic.Trigger 01")
    AnimGBSequence("hm_zonem_dynamic.Track 01", "Up")
    HM_MadDocBattle_Intro()
    AudioPostEventOn("hm_zonem_audio.Sound_SpawnerDoor", "Play_sfx_Attic_MadDoc_Open_SpawnerDoor")
    FireUser1("BwrxSpawner01Marker")
    if GetGlobal("HM_JarvisHelped") == 1 or GetGlobal("HM_StuffusHelped") == 1 then
      HM_BwrxSpawner03 = 1
      HM_RoofSpawners = 2
      wait(0.1)
      DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersLeftSpawner")
      ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineBig_FX_Left")
      AudioPostEventOn("hm_zonem_dynamic.Sound_MarkerLeftSpawner", "Play_sfx_Attic_Spawner_Damage_LP")
      ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineLeft_FX")
      AnimGBSequence("hm_zonem_dynamic.SpawnerLight03", "Break")
      wait(0.01)
      AnimGBSequence("hm_zonem_dynamic.SpawnerLight03x", "Break")
      Unhide("hm_zonem_fx.BeetleworxMachineBig_SpawnerLight03x_Smoke")
    else
      FireUser1("BwrxSpawner03Marker")
    end
    if GetGlobal("HM_JarvisHelped") == 1 and GetGlobal("HM_StuffusHelped") == 1 then
      HM_BwrxSpawner02 = 1
      HM_RoofSpawners = 1
      wait(0.1)
      DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersRightSpawner")
      ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineBig_FX_Right")
      AudioPostEventOn("hm_zonem_dynamic.Sound_MarkerRightSpawner", "Play_sfx_Attic_Spawner_Damage_LP")
      ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineRight_FX")
      AnimGBSequence("hm_zonem_dynamic.SpawnerLight02", "Break")
      wait(0.01)
      AnimGBSequence("hm_zonem_dynamic.SpawnerLight02x", "Break")
      Unhide("hm_zonem_fx.BeetleworxMachineBig_SpawnerLight02x_Smoke")
    else
      FireUser1("BwrxSpawner02Marker")
    end
  end
  if GetGlobal("HM_Attic_BwrxQuest") == 1 then
    DestroyEntity("hm_zonem_dynamic.Trigger 01")
    Hide("hm_zonem_dynamic.Mad Doctor 01")
    Hide("hm_zonem_dynamic.NOS_HM_ZoneM_MadDr_Pod 01")
    TimerDisable("hm_zonem_dynamic.DoomBuggyLogicTimerMarker 01")
    Disable("BwrxSpawner02")
    ForEachEntityInGroup(DestroyEntity, "AtticBwrx")
    AnimGBSequence("hm_zonem_dynamic.Track 01", "Up")
    AnimGBSequence("hm_zonem_dynamic.SpawnerLight03", "Break")
    wait(0.1)
    ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineBig_FX_Left")
    wait(0.01)
    AnimGBSequence("hm_zonem_dynamic.SpawnerLight02", "Break")
    wait(0.01)
    ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineRight_FX")
    AudioPostEventOn("hm_zonem_dynamic.Sound_MarkerRightSpawner", "Play_sfx_Attic_Spawner_Damage_LP")
    wait(0.01)
    ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineBig_FX_Right")
    wait(0.01)
    ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineBig_FX_End")
    AudioPostEventOn("hm_zonem_dynamic.Sound_MarkerBigSpawner", "Play_sfx_Attic_Spawner_Damage_LP")
    wait(0.01)
    AnimGBSequence("hm_zonem_dynamic.SpawnerLight03x", "Break")
    Unhide("hm_zonem_fx.BeetleworxMachineBig_SpawnerLight03x_Smoke")
    wait(0.01)
    AnimGBSequence("hm_zonem_dynamic.SpawnerLight02x", "Break")
    wait(0.01)
    ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineLeft_FX")
    AudioPostEventOn("hm_zonem_dynamic.Sound_MarkerLeftSpawner", "Play_sfx_Attic_Spawner_Damage_LP")
    Unhide("hm_zonem_fx.BeetleworxMachineBig_SpawnerLight02x_Smoke")
    AnimGBSequence("hm_zonem_dynamic.SpawnerLight01x", "Break")
    Unhide("hm_zonem_fx.BeetleworxMachineBig_SpawnerLight01x_Smoke")
    DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersBigSpawner")
    DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersButtonAnvil01")
    DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersButtonAnvil02")
    DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersButtonTV")
    DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersLeftSpawner")
    DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersRightSpawner")
    Prefab_Projector_ChangeState("MadDoc_PortalExit", "Activate")
    FireUser1("ExitMickeyHeadGuardian")
  end
end
HM_AtticLoadCheckpoint = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "Levels/NewOrleans_FromLM.level")
end
HM_To_NOS = L0_0
function L0_0()
  if HM_Doombuggy_State == 0 then
    HM_Doombuggy_State = 1
    AnimGBSequence("hm_zonem_dynamic.NOS_HM_Doom_Buggy_01", "SectionA_1")
  elseif HM_Doombuggy_State == 1 then
    HM_Doombuggy_State = 0
    AnimGBSequence("hm_zonem_dynamic.NOS_HM_Doom_Buggy_01", "SectionA")
    AudioPostEventOn("Audio_DoomBuggy", "Play_sfx_Attic_DoomBuggy_seq")
  end
end
HM_DoomBuggy_Paths = L0_0
function L0_0()
  StartFadeOut(1)
  wait(1)
  PlayAndUnlockMovie("HM_visit1_Mad_Doctor_Defeated.bik", "HM_visit1_Mad_Doctor_Defeated")
  CameraReset()
  HM_MadDoc_Defeat()
  AnimGBSequence("hm_zonem_dynamic.Track 01", "Up")
  UnrestrictCutSceneInput()
  UnpauseAllAI(GetPlayer())
end
HM_MadDoctorMovie = L0_0
function L0_0()
  wait(1)
  SetGlobal("HM_Attic_SkipToRocketQuest", 1)
  FireUser1("GusGiveUpgradeCamMarker")
  Unhide("hm_zonem_ai_2.Gremlin_Gus 01")
  wait(0.1)
  FireSequence("hm_zonem_ai_2.Gremlin_Gus 01", "Gus_IncreasedAmmo")
end
HM_GusGiveUpgrade = L0_0
function L0_0()
  if HM_MadDoctorKilled == 1 then
    Mickey_Receive_Item_NPC("Attic_GusItemSpawner", "PaintUpgrade")
    wait(1.5)
    IncreaseMaxPaintAmmo()
  elseif HM_MadDoctorKilled == 2 then
    Mickey_Receive_Item_NPC("Attic_GusItemSpawner", "ThinnerUpgrade")
    wait(1.5)
    IncreaseMaxThinnerAmmo()
  end
end
HM_GusGiveUpgradeCont = L0_0
function L0_0()
  if HM_MadDoctorKilled == 1 then
    Mickey_GetItem_ClearItem("Attic_GusItemSpawner", "PaintUpgrade")
    GiveCollectible("CapIncrease_Paint")
    wait(2)
  elseif HM_MadDoctorKilled == 2 then
    Mickey_GetItem_ClearItem("Attic_GusItemSpawner", "ThinnerUpgrade")
    GiveCollectible("CapIncrease_Thinner")
    wait(2)
  end
  SetGlobal("HM_Attic_SkipToRocketQuest", 0)
end
HM_GusGiveUpgradeEnd = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.8)
  UnpauseAllAI()
  UnrestrictCutSceneInput()
  UnrestrictCutSceneInput()
  ShowHud()
  Hide("hm_zonem_ai_2.Gremlin_Gus 01")
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  wait(0.1)
  StartFadeIn(0.5)
end
HM_ResolveRocketQuest = L0_0
function L0_0()
  SetGlobal("NO_NewOrleansProgress", 2)
  SetGlobal("MS_MeanStreetProgress", 5)
  Hide("hm_zonem_dynamic.Mad Doctor 01")
  Hide("hm_zonem_dynamic.NOS_HM_ZoneM_MadDr_Pod 01")
  HM_BwrxSpawner01 = 1
  HM_BwrxSpawner02 = 1
  HM_BwrxSpawner03 = 1
  Prefab_Projector_ChangeState("MadDoc_PortalExit", "Activate")
  FireUser1("ExitMickeyHeadGuardian")
  DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersBigSpawner")
  DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersButtonAnvil01")
  DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersButtonAnvil02")
  DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersButtonTV")
  DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersLeftSpawner")
  DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersRightSpawner")
  TimerDisable("hm_zonem_dynamic.CartTimerMarker 01")
  ForEachEntityInGroup(DestroyEntity, "AtticBwrx")
  DestroyEntity("BwrxSpawner01")
  DestroyEntity("BwrxSpawner02")
  DestroyEntity("BwrxSpawner03")
  wait(0.1)
  wait(0.3)
  HM_GusGiveUpgrade()
end
HM_MadDoc_Defeat = L0_0
function L0_0()
  SetUnlockedExtra("HM_visit1_Mad_Doctor_Defeated")
end
HM_GiveFinalMovieUnlock = L0_0
function L0_0()
  AnimGBReset("hm_zonem_dynamic.NOS_HM_Doom_Buggy_01")
  AnimGBSequence("hm_zonem_dynamic.NOS_HM_Doom_Buggy", "SectionA")
end
HM_MadDocBattle_BuggyGo = L0_0
function L0_0()
  SetPropertyFloat("hm_zonem_dynamic.SplineKnot 04", "BranchPathChance", 1)
  SetPropertyFloat("hm_zonem_dynamic.SplineKnot 21", "BranchPathChance", 1)
  SetPropertyFloat("hm_zonem_dynamic.SplineKnot 14", "BranchPathChance", 0)
  TimerEnable("hm_zonem_dynamic.DoomBuggyLogicTimerMarker 01")
  AnimGBSequence("hm_zonem_dynamic.NOS_HM_Doom_Buggy", "SectionA")
  AudioPostEventOn("Audio_DoomBuggy", "Play_sfx_Attic_DoomBuggy_seq")
end
HM_MadDocBattle_Intro = L0_0
function L0_0()
  FireThread(HM_CartLoop)
end
HM_CartLoopSD = L0_0
function L0_0()
  wait(3)
  AnimGBSequence("hm_zonem_dynamic.NOS_HM_Doom_Buggy", "SectionA")
  AudioPostEventOn("Audio_DoomBuggy", "Play_sfx_Attic_DoomBuggy_seq")
end
HM_CartLoop = L0_0
function L0_0()
  AudioPostEventOn("hm_zonem_audio.Sound_SpawnerDoor", "Play_sfx_Attic_MadDoc_Open_SpawnerDoor")
  FireUser1("BwrxSpawner03Marker")
  FireUser1("BwrxSpawner01Marker")
  wait(0.1)
  FireUser1("BwrxSpawner02Marker")
end
HM_MadDocBattle_Intro02 = L0_0
function L0_0()
  FireSequence("hm_zonem_dynamic.ConvoMarkerGus", "Attic_Gus_GiveQuest")
end
HM_MadDocBattle_Intro03 = L0_0
L0_0 = 0
HM_JarvisHelpedCameraFix = L0_0
function L0_0()
  if GetGlobal("HM_JarvisHelped") == 1 then
    RestrictCutSceneInput()
    HM_JarvisHelpedCameraFix = 1
    FireUser1("Spawner03KillCam")
    wait(0.8)
    SetLetterbox(true)
    TeleportGremlinIn("hm_zonem_dynamic.Gremlin_Jarvis", "hm_zonem_dynamic.GremlinJarvisPositionMarker 01", false)
    EnterCutscene("hm_zonem_dynamic.Gremlin_Jarvis", 1)
    wait(1)
    FireSequence("hm_zonem_dynamic.Gremlin_Jarvis", "HM_Attic_Jarvis_Helps")
  elseif GetGlobal("HM_StuffusHelped") == 1 then
    HM_MadDocGremlin02()
  else
    HM_ReleaseCam()
    UnpauseAllAI()
    HM_MadDocBattle_Intro03()
  end
end
HM_MadDocGremlin01 = L0_0
L0_0 = 0
HM_StuffusHelpedCameraFix = L0_0
function L0_0()
  Hide("hm_zonem_dynamic.Gremlin_Jarvis")
  if GetGlobal("HM_StuffusHelped") == 1 then
    if GetGlobal("HM_JarvisHelped") == 1 then
      FireUser1("Spawner02KillCam")
      wait(0.8)
      SetLetterbox(true)
      HM_StuffusHelpedCameraFix = 1
      TeleportGremlinIn("hm_zonem_dynamic.Gremlin_Stuffus", "hm_zonem_dynamic.GremlinStuffusPositionMarker 01", false)
    elseif GetGlobal("HM_JarvisHelped") == 0 then
      RestrictCutSceneInput()
      HM_JarvisHelpedCameraFix = 1
      FireUser1("Spawner03KillCam")
      wait(0.8)
      SetLetterbox(true)
      TeleportGremlinIn("hm_zonem_dynamic.Gremlin_Stuffus", "hm_zonem_dynamic.GremlinJarvisPositionMarker 01", false)
    end
    EnterCutscene("hm_zonem_dynamic.Gremlin_Stuffus", 1)
    wait(1)
    FireSequence("hm_zonem_dynamic.Gremlin_Stuffus", "HM_Attic_Stuffus_Helps")
  elseif GetGlobal("HM_StuffusHelped") == 0 or GetGlobal("HM_StuffusHelped") == 2 then
    HM_CameraRelease()
    if HM_JarvisHelpedCameraFix == 1 then
      UnrestrictCutSceneInput()
      HM_JarvisHelpedCameraFix = 0
    end
    ShowHud()
    UnpauseAllAI()
    HM_MadDocBattle_Intro03()
  end
end
HM_MadDocGremlin02 = L0_0
L0_0 = 0
HM_AtticQuestGiven = L0_0
function L0_0()
  local L1_2
  L1_2 = 1
  HM_AtticQuestGiven = L1_2
end
HM_GotAtticQuest = L0_0
function L0_0()
  if HM_AtticQuestGiven == 0 then
    FireSequence("hm_zonem_dynamic.ConvoMarkerGus", "Attic_Gus_GiveQuest")
  end
end
HM_GiveAtticQuest = L0_0
function L0_0()
  if GetGlobal("HM_JarvisHelped") == 1 then
    HM_RightMachineBreak()
  elseif GetGlobal("HM_JarvisHelped") == 0 then
    SetGlobal("HM_StuffusHelped", 2)
    HM_LeftMachineBreak()
  end
end
HM_MadDocGremlin03 = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.8)
  UnpauseAllAI()
  if HM_StuffusHelpedCameraFix == 1 then
    UnrestrictCutSceneInput()
    HM_StuffusHelpedCameraFix = 0
  end
  if HM_JarvisHelpedCameraFix == 1 then
    UnrestrictCutSceneInput()
    HM_JarvisHelpedCameraFix = 0
  end
  UnrestrictCutSceneInput()
  ShowHud()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  wait(0.1)
  StartFadeIn(0.5)
end
HM_GremlinUnrestrict = L0_0
function L0_0(A0_3)
  QueueBrainEvent(A0_3, BRAIN_GotoEntity, vector4(0, 0, 0), "hauntedmansion_zonem.BwrxExitMarker")
end
HM_BwrxExit = L0_0
L0_0 = 3
HM_RoofSpawners = L0_0
function L0_0()
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_DocPodPositionMarker 01", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn("hm_zonem_audio.Sound_SpawnerExplosions", "Play_sfx_Attic_Spawner_Explosions")
  wait(0.5)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_DocPodPositionMarker 02", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
end
HM_SpawnerExplosions = L0_0
function L0_0()
  if GetGlobal("HM_Attic_BwrxQuest") == 0 then
    HM_BwrxSpawner03 = 1
    PauseAllAI(GetPlayer())
    RestrictCutSceneInput()
    GrabCameraNif("hm_zonem_igc.HM_visit1_attic_left_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
    AnimGBReset("hm_zonem_igc.HM_visit1_attic_left_cam 01")
    AnimGBSequence("hm_zonem_igc.HM_visit1_attic_left_cam 01", "camera")
    wait(1)
    FireThread(HM_LeftMachineDamageFX)
    AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Destroyed")
    Disable("BwrxSpawner01")
    wait(0.5)
    AnimGBSequence("hm_zonem_dynamic.spawner_beetleworx 02.BW_Spawner_InnerDoors", "Close")
    AnimGBSequence("hm_zonem_dynamic.spawner_beetleworx 02.BW_Spawner_Orb", "Close")
    wait(0.5)
    AnimGBSequence("hm_zonem_dynamic.spawner_beetleworx 02.BW_Spawner_OuterDoors", "Close")
    Kill("Spawner02Bwrx")
    FireThread(HM_DocReactThread)
    FireThread(HM_BigMachineLeftWaveFX)
    ForceSequence("hm_zonem_dynamic.ConvoMarkerGus", "Attic_Gus_Spawner01_Barks")
    wait(2.5)
    AnimEvent("hm_zonem_dynamic.Mad Doctor 01", EVENT_Special_9)
  end
end
HM_LeftMachineBreak = L0_0
function L0_0()
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineLeft_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineLeft_PositionMarker 01", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineLeft_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  ShakeCamera_Default("camera")
  wait(0.2)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineLeft_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineLeft_PositionMarker 02", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineLeft_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(0.3)
  AnimGBSequence("hm_zonem_dynamic.SpawnerLight03", "Break")
  ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineLeft_FX")
  AudioPostEventOn("hm_zonem_dynamic.Sound_MarkerLeftSpawner", "Play_sfx_Attic_Spawner_Damage_LP")
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineLeft_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineLeft_PositionMarker 03", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineLeft_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(1)
  AnimGBReset("hm_zonem_fx.NOS_HM_ZoneM_ElectricShort_Left 01")
  AnimGBSequence("hm_zonem_fx.NOS_HM_ZoneM_ElectricShort_Left 01", "Hit")
  DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersLeftSpawner")
end
HM_LeftMachineDamageFX = L0_0
function L0_0()
  wait(2.5)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_LeftWavePositionMarker 01", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(0.2)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_LeftWavePositionMarker 02", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(0.7)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_LeftWavePositionMarker 03", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(0.3)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_LeftWavePositionMarker 04", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(0.1)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_LeftWavePositionMarker 05", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(1)
  ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineBig_FX_Left")
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_LeftWavePositionMarker 03", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
end
HM_BigMachineLeftWaveFX = L0_0
function L0_0()
  if GetGlobal("HM_Attic_BwrxQuest") == 0 then
    HM_BwrxSpawner02 = 1
    PauseAllAI(GetPlayer())
    RestrictCutSceneInput()
    GrabCameraNif("hm_zonem_igc.HM_visit1_attic_right_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
    AnimGBReset("hm_zonem_igc.HM_visit1_attic_right_cam 01")
    AnimGBSequence("hm_zonem_igc.HM_visit1_attic_right_cam 01", "camera")
    wait(1)
    FireThread(HM_RightMachineDamageFX)
    AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Destroyed")
    Disable("BwrxSpawner02")
    wait(0.5)
    AnimGBSequence("hm_zonem_dynamic.spawner_beetleworx 01.BW_Spawner_InnerDoors", "Close")
    AnimGBSequence("hm_zonem_dynamic.spawner_beetleworx 01.BW_Spawner_Orb", "Close")
    wait(0.5)
    AnimGBSequence("hm_zonem_dynamic.spawner_beetleworx 01.BW_Spawner_OuterDoors", "Close")
    Kill("Spawner01Bwrx")
    FireThread(HM_DocReactThread)
    FireThread(HM_BigMachineRightWaveFX)
    ForceSequence("hm_zonem_dynamic.ConvoMarkerGus", "Attic_Gus_Spawner02_Barks")
    wait(3.5)
    AnimEvent("hm_zonem_dynamic.Mad Doctor 01", EVENT_Special_9)
  end
end
HM_RightMachineBreak = L0_0
function L0_0()
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineRight_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineRight_PositionMarker 01", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineRight_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  ShakeCamera_Default("camera")
  wait(0.2)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineRight_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineRight_PositionMarker 02", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineRight_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(0.1)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineRight_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineRight_PositionMarker 03", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineRight_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(0.2)
  AnimGBReset("hm_zonem_fx.NOS_HM_ZoneM_ElectricShort_Right 01")
  AnimGBSequence("hm_zonem_fx.NOS_HM_ZoneM_ElectricShort_Right 01", "Hit")
  AnimGBSequence("hm_zonem_dynamic.SpawnerLight02", "Break")
  ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineRight_FX")
  AudioPostEventOn("hm_zonem_dynamic.Sound_MarkerRightSpawner", "Play_sfx_Attic_Spawner_Damage_LP")
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineRight_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineRight_PositionMarker 04", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineRight_FXSpawner 01", 1)
  DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersRightSpawner")
end
HM_RightMachineDamageFX = L0_0
function L0_0()
  wait(2.5)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_RightWavePositionMarker 01", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(0.3)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_RightWavePositionMarker 02", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(1.1)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_RightWavePositionMarker 03", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(1)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_RightWavePositionMarker 04", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(0.3)
  ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineBig_FX_Right")
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_RightWavePositionMarker 05", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
end
HM_BigMachineRightWaveFX = L0_0
function L0_0()
  if GetGlobal("HM_Attic_BwrxQuest") == 0 then
    HM_BwrxSpawner01 = 1
    PauseAllAI(GetPlayer())
    RestrictCutSceneInput()
    GrabCameraNif("hm_zonem_igc.HM_visit1_attic_mid_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
    AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Destroy_Back")
    AnimGBReset("hm_zonem_igc.HM_visit1_attic_mid_cam 01")
    AnimGBSequence("hm_zonem_igc.HM_visit1_attic_mid_cam 01", "camera")
    wait(1)
    AnimGBSequence("hm_zonem_dynamic.SpawnerLight02x", "Break")
    Unhide("hm_zonem_fx.BeetleworxMachineBig_SpawnerLight02x_Smoke")
    FireThread(HM_BigMachineEndWaveFX)
    Disable("BwrxSpawner03")
    wait(1)
    AnimGBSequence("hm_zonem_dynamic.spawner_beetleworx 03.BW_Spawner_InnerDoors", "Close")
    AnimGBSequence("hm_zonem_dynamic.spawner_beetleworx 03.BW_Spawner_Orb", "Close")
    wait(0.5)
    AnimGBSequence("hm_zonem_dynamic.spawner_beetleworx 03.BW_Spawner_OuterDoors", "Close")
    Kill("Spawner03Bwrx")
    FireThread(HM_DocReactFinalThread)
    ForceSequence("hm_zonem_dynamic.ConvoMarkerGus", "Attic_Gus_Spawner03_Barks")
    AnimEvent("hm_zonem_dynamic.Mad Doctor 01", EVENT_Special_9)
  end
end
HM_EndMachineBreak = L0_0
function L0_0()
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_EndWavePositionMarker 01", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(0.3)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_EndWavePositionMarker 02", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(0.2)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_EndWavePositionMarker 03", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(0.5)
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_EndWavePositionMarker 04", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_Spawner_Explosion")
  wait(0.5)
  ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineBig_FX_End")
  AudioPostEventOn("hm_zonem_dynamic.Sound_MarkerBigSpawner", "Play_sfx_Attic_Spawner_Damage_LP")
  SetPropertyEntity("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", "Spawn Destinations", "hm_zonem_fx.BeetleworxMachineBig_EndWavePositionMarker 05", 0)
  ForceSpawn("hm_zonem_fx.BeetleworxMachineBig_FXSpawner 01", 1)
  DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersBigSpawner")
end
HM_BigMachineEndWaveFX = L0_0
function L0_0()
  if GetGlobal("HM_Attic_BwrxQuest") == 0 then
    HM_Attic_InstantWin = 1
    PauseAllAI(GetPlayer())
    FireThread(HM_CartBreaksBigMachineCam)
  end
end
HM_AtticButtonsDown = L0_0
L0_0 = 0
HM_BuggyBreakDoor = L0_0
function L0_0()
  RestrictCutSceneInput()
  HideHud()
  TimerDisable("hm_zonem_dynamic.DoomBuggyLogicTimerMarker 01")
  StartFadeOut(0.8)
  wait(0.8)
  SetLetterbox(true)
  MoveToEntity(GetPlayer(), "hm_zonem_dynamic.MickeyOutroPositionMarker 01")
  GrabCameraNif("hm_zonem_igc.HM_visit1_attic_cart_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_ButtonDown")
  AnimGBReset("hm_zonem_igc.HM_visit1_attic_cart_cam 01")
  StartFadeIn(0.5)
  wait(1.5)
  AnimGBSequence("hm_zonem_dynamic.Track 01", "Down")
  wait(1)
  AnimGBSequence("hm_zonem_igc.HM_visit1_attic_cart_cam 01", "camera")
  AnimGBReset("hm_zonem_dynamic.NOS_HM_Doom_Buggy")
  AnimGBSequence("hm_zonem_dynamic.NOS_HM_Doom_Buggy", "SectionB")
  wait(7)
  AnimGBSequence("hm_zonem_dynamic.spawner_beetleworx 03.BW_Spawner_OuterDoors", "Damaged")
  RestrictCutSceneInput()
  if HM_BwrxSpawner01 == 0 then
    HM_BuggyBreakDoor = 1
    HM_GusBarksDone = 1
    HM_MadDoctorKilled = 1
    HM_DoctorReaction3()
    AnimGBSequence("hm_zonem_dynamic.SpawnerLight03", "Break")
    ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineLeft_FX")
    ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineBig_FX_Left")
    AudioPostEventOn("hm_zonem_dynamic.Sound_MarkerLeftSpawner", "Play_sfx_Attic_Spawner_Damage_LP")
    AnimGBSequence("hm_zonem_dynamic.SpawnerLight02", "Break")
    ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineRight_FX")
    ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineBig_FX_Right")
    AudioPostEventOn("hm_zonem_dynamic.Sound_MarkerRightSpawner", "Play_sfx_Attic_Spawner_Damage_LP")
    ForEachEntityInGroup(Unhide, "hm_zonem_fx.BeetleworxMachineBig_FX_End")
    AudioPostEventOn("hm_zonem_dynamic.Sound_MarkerBigSpawner", "Play_sfx_Attic_Spawner_Damage_LP")
    AnimGBSequence("hm_zonem_dynamic.SpawnerLight03x", "Break")
    Unhide("hm_zonem_fx.BeetleworxMachineBig_SpawnerLight03x_Smoke")
    AnimGBSequence("hm_zonem_dynamic.SpawnerLight02x", "Break")
    Unhide("hm_zonem_fx.BeetleworxMachineBig_SpawnerLight02x_Smoke")
    AnimGBSequence("hm_zonem_dynamic.SpawnerLight01x", "Break")
    Unhide("hm_zonem_fx.BeetleworxMachineBig_SpawnerLight01x_Smoke")
  elseif HM_BwrxSpawner01 == 1 then
    FireSequence("hm_zonem_dynamic.ConvoMarkerMadDoc", "Attic_MD_SpawnerAlreadyDead")
    HM_Attic_InstantWin = 0
  end
end
HM_CartBreaksBigMachineCam = L0_0
function L0_0()
  AnimGBSequence("hm_zonem_dynamic.spawner_beetleworx 03.BW_Spawner_OuterDoors", "Damaged")
end
HM_BuggySmashesDoor = L0_0
function L0_0()
  wait(6)
  HM_DetermineDoctorReaction()
end
HM_DocReactThread = L0_0
function L0_0()
  wait(2.5)
  HM_DetermineDoctorReaction()
end
HM_DocReactFinalThread = L0_0
function L0_0()
  HM_RoofSpawners = HM_RoofSpawners - 1
  if HM_RoofSpawners == 2 then
    HM_DoctorReaction1()
  elseif HM_RoofSpawners == 1 then
    HM_DoctorReaction2()
  elseif HM_RoofSpawners == 0 then
    HM_DoctorReaction3()
  end
end
HM_DetermineDoctorReaction = L0_0
L0_0 = 0
HM_MadDocBarkWaiting = L0_0
L0_0 = 0
HM_GusBarksDone = L0_0
function L0_0()
  HM_GusBarksDone = 1
  if HM_MadDocBarkWaiting == 1 then
    HM_DocReactBark1()
  elseif HM_MadDocBarkWaiting == 2 then
    HM_DocReactBark2()
  elseif HM_MadDocBarkWaiting == 3 then
    HM_DocReactBark3()
  end
  HM_MadDocBarkWaiting = 0
end
HM_SpawnersGusWrapped = L0_0
function L0_0()
  GrabCameraNif("hm_zonem_igc.HM_visit1_attic_hit01_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("hm_zonem_igc.HM_visit1_attic_hit01_cam 01")
  AnimGBSequence("hm_zonem_igc.HM_visit1_attic_hit01_cam 01", "camera")
  ShakeCamera_Default("camera")
  AnimGBSequence("hm_zonem_dynamic.SpawnerLight03x", "Break")
  Unhide("hm_zonem_fx.BeetleworxMachineBig_SpawnerLight03x_Smoke")
  FireThread(HM_SpawnerExplosions)
  AnimGBSequence("hm_zonem_dynamic.NOS_HM_ZoneM_MadDr_Pod 01", "Hit")
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_MadDoc_Damage")
  AnimEvent("hm_zonem_dynamic.Mad Doctor 01", EVENT_Special_4)
  wait(6.667)
  HM_DocReactBark1()
end
HM_DoctorReaction1 = L0_0
function L0_0()
  if HM_GusBarksDone == 1 then
    HM_GusBarksDone = 0
    ForceSequence("hm_zonem_dynamic.ConvoMarkerGus", "Attic_Gus_Spawner01")
    AnimGBSequence("hm_zonem_dynamic.NOS_HM_ZoneM_MadDr_Pod 01", "Idle")
    GrabCameraNif("hm_zonem_igc.HM_visit1_attic_defeat_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
    AnimGBReset("hm_zonem_igc.HM_visit1_attic_defeat_cam 01")
    AnimGBSequence("hm_zonem_igc.HM_visit1_attic_defeat_cam 01", "camera")
  elseif HM_GusBarksDone == 0 then
    HM_MadDocBarkWaiting = 1
    AnimEvent("hm_zonem_dynamic.Mad Doctor 01", EVENT_Special_0)
  end
end
HM_DocReactBark1 = L0_0
function L0_0()
  GrabCameraNif("hm_zonem_igc.HM_visit1_attic_hit02_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("hm_zonem_igc.HM_visit1_attic_hit02_cam 01")
  AnimGBSequence("hm_zonem_igc.HM_visit1_attic_hit02_cam 01", "camera")
  ShakeCamera_Default("camera")
  AnimGBSequence("hm_zonem_dynamic.SpawnerLight01x", "Break")
  Unhide("hm_zonem_fx.BeetleworxMachineBig_SpawnerLight01x_Smoke")
  FireThread(HM_SpawnerExplosions)
  AnimGBSequence("hm_zonem_dynamic.NOS_HM_ZoneM_MadDr_Pod 01", "Hit2")
  AudioPostEventOn(GetPlayer(), "Play_sfx_Attic_MadDoc_Damage")
  AnimEvent("hm_zonem_dynamic.Mad Doctor 01", EVENT_Special_5)
  wait(6.667)
  HM_DocReactBark2()
end
HM_DoctorReaction2 = L0_0
function L0_0()
  if HM_GusBarksDone == 1 then
    HM_GusBarksDone = 0
    ForceSequence("hm_zonem_dynamic.ConvoMarkerGus", "Attic_Gus_Spawner02")
    AnimGBSequence("hm_zonem_dynamic.NOS_HM_ZoneM_MadDr_Pod 01", "Idle")
    GrabCameraNif("hm_zonem_igc.HM_visit1_attic_defeat_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
    AnimGBReset("hm_zonem_igc.HM_visit1_attic_defeat_cam 01")
    AnimGBSequence("hm_zonem_igc.HM_visit1_attic_defeat_cam 01", "camera")
  elseif HM_GusBarksDone == 0 then
    HM_MadDocBarkWaiting = 2
    AnimEvent("hm_zonem_dynamic.Mad Doctor 01", EVENT_Special_9)
  end
end
HM_DocReactBark2 = L0_0
function L0_0()
  GrabCameraNif("hm_zonem_igc.HM_visit1_attic_hit03_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("hm_zonem_igc.HM_visit1_attic_hit03_cam 01")
  AnimGBSequence("hm_zonem_igc.HM_visit1_attic_hit03_cam 01", "camera")
  ShakeCamera_Default("camera")
  FireThread(HM_SpawnerExplosions)
  AnimGBSequence("hm_zonem_dynamic.NOS_HM_ZoneM_MadDr_Pod 01", "Hit3")
  AudioPostEventOn(GetPlayer(), "Play_sfx_MadDoc_Pod_Damage_Final")
  AnimEvent("hm_zonem_dynamic.Mad Doctor 01", EVENT_Special_8)
  wait(6.667)
  HM_DocReactBark3()
end
HM_DoctorReaction3 = L0_0
function L0_0()
  if HM_GusBarksDone == 1 then
    HM_GusBarksDone = 0
    ForceSequence("hm_zonem_dynamic.ConvoMarkerGus", "Attic_Gus_Spawner03")
    AnimGBSequence("hm_zonem_dynamic.NOS_HM_ZoneM_MadDr_Pod 01", "Idle")
    GrabCameraNif("hm_zonem_igc.HM_visit1_attic_defeat_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
    AnimGBReset("hm_zonem_igc.HM_visit1_attic_defeat_cam 01")
    AnimGBSequence("hm_zonem_igc.HM_visit1_attic_defeat_cam 01", "camera")
  elseif HM_GusBarksDone == 0 then
    HM_MadDocBarkWaiting = 3
    AnimEvent("hm_zonem_dynamic.Mad Doctor 01", EVENT_Special_9)
  end
end
HM_DocReactBark3 = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  CameraReset()
  ShowHud()
end
HM_CameraRelease = L0_0
function L0_0()
  AnimEvent("hm_zonem_dynamic.Mad Doctor 01", EVENT_Special_6)
end
HM_MadDoctorTalk = L0_0
function L0_0()
  AnimEvent("hm_zonem_dynamic.Mad Doctor 01", EVENT_Special_0)
end
HM_MadDoctorIdle = L0_0
function L0_0()
  if HM_MadDoctorKilled == 0 then
    HM_MadDoctorKilled = 2
  end
  FireSequence("hm_zonem_dynamic.ConvoMarkerMadDoc", "Attic_MD_Outro01")
end
HM_MadDoctorFinal = L0_0
function L0_0()
  SetGlobal("NO_donaldwaistget", 1)
  SetGlobal("NO_donaldparts", GetGlobal("NO_donaldparts") + 1)
  HM_Attic_SaveCheckpoint()
end
HM_OpenAtticBlueChest = L0_0
function L0_0()
  HM_Attic_SaveCheckpoint()
end
HM_OpenAtticGoldPinChest = L0_0
L0_0 = 0
HM_Attic_ButtonsBark = L0_0
L0_0 = 0
HM_Attic_FirstBarkDone = L0_0
L0_0 = 0
HM_Attic_InstantWin = L0_0
function L0_0()
  local L1_4
  L1_4 = 1
  HM_Attic_FirstBarkDone = L1_4
end
HM_AtticFirstBarkGo = L0_0
function L0_0()
  local L1_5
  L1_5 = 1
  HM_Attic_ButtonsBark = L1_5
end
HM_AtticButtonsFlag = L0_0
function L0_0()
  if HM_Attic_ButtonsBark == 1 and GetGlobal("HM_Attic_BwrxQuest") == 0 and HM_Attic_FirstBarkDone == 1 and HM_Attic_InstantWin == 0 then
    HM_Attic_ButtonsBark = 0
    FireSequence("hm_zonem_dynamic.ConvoMarkerGus", "Attic_Gus_ButtonsFailed")
  end
end
HM_AtticButtonsTest = L0_0
function L0_0()
  if HM_Attic_InstantWin == 0 then
    FireSequence("hm_zonem_dynamic.ConvoMarkerGus", "Attic_Gus_FirstButton")
  end
end
HM_AtticFirstButtonUndone = L0_0
function L0_0(A0_6, A1_7)
  ForEachEntityInGroup(AnimGBSequence, "ExitButtonsLights", "TurnOn")
  DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersButtonTV")
  if A1_7 == "1" then
    DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersButtonAnvil01")
  elseif A1_7 == "2" then
    DisableGuardianHint("hm_zonem_dynamic.PlayerHintMarkersButtonAnvil02")
  end
end
HM_AtticButtonsOn = L0_0
function L0_0()
  ForEachEntityInGroup(AnimGBSequence, "ExitButtonsLights", "TurnOff")
end
HM_AtticButtonsOff = L0_0
function L0_0()
  if BeetleworxKilled == 0 and HM_Attic_InstantWin == 0 then
    BeetleworxKilled = 1
    FireSequence("hm_zonem_dynamic.ConvoMarkerGus", "Attic_Gus_KillHint01")
  end
end
HM_BwrxSpawnHint = L0_0
L0_0 = 0
HM_MachineToSpawn = L0_0
function L0_0()
  if HM_MachineToSpawn == 1 then
    FireUser3("hm_zonem_igc.spawnerEnd")
  elseif HM_MachineToSpawn == 2 then
    FireUser3("hm_zonem_igc.spawnerRight")
  elseif HM_MachineToSpawn == 3 then
    FireUser3("hm_zonem_igc.spawnerLeft")
  end
end
HM_ZoneM_ReleaseBwrxSpawnCam = L0_0
L0_0 = 0
HM_BwrxSpawner01 = L0_0
L0_0 = 0
HM_BwrxSpawner02 = L0_0
L0_0 = 0
HM_BwrxSpawner03 = L0_0
L0_0 = 0
HM_SpawnerLeftBroke = L0_0
L0_0 = 1
HM_BeetleworxLeftExit = L0_0
L0_0 = 1
HM_BeetleworxLeft = L0_0
function L0_0()
  local L1_8
  L1_8 = 0
  HM_BeetleworxLeft = L1_8
end
HM_BeetleworxLeftKilled = L0_0
function L0_0()
  local L1_9
  L1_9 = 0
  HM_BeetleworxLeftExit = L1_9
end
HM_ExitSpawnerLeft = L0_0
function L0_0()
  if HM_BeetleworxLeft == 0 and HM_BwrxSpawner03 == 0 and HM_Attic_InstantWin == 0 then
    HM_BeetleworxLeftExit = 1
    HM_BeetleworxLeft = 1
    FireThread(Bwrx03_ForceSpawn)
  end
end
HM_SpawnerLeft = L0_0
function L0_0()
  if HM_BwrxSpawner03 == 0 and HM_Attic_InstantWin == 0 then
    if GetGlobal("Attic_Gus_KillHint01_Played") == 0 then
      FireUser1("hm_zonem_igc.spawnerLeft")
    end
    Wait(1.6)
    FireUser1("BwrxSpawner03Marker")
    HM_MachineToSpawn = 3
    HM_BwrxSpawnHint()
  end
end
Bwrx03_ForceSpawn = L0_0
L0_0 = 0
HM_SpawnerRightBroke = L0_0
L0_0 = 1
HM_BeetleworxRightExit = L0_0
L0_0 = 1
HM_BeetleworxRight = L0_0
function L0_0()
  local L1_10
  L1_10 = 0
  HM_BeetleworxRight = L1_10
end
HM_BeetleworxRightKilled = L0_0
function L0_0()
  local L1_11
  L1_11 = 0
  HM_BeetleworxRightExit = L1_11
end
HM_ExitSpawnerRight = L0_0
function L0_0()
  if HM_BeetleworxRight == 0 and HM_BwrxSpawner02 == 0 and HM_Attic_InstantWin == 0 then
    HM_BeetleworxRightExit = 1
    HM_BeetleworxRight = 1
    FireThread(Bwrx02_ForceSpawn)
  end
end
HM_SpawnerRight = L0_0
function L0_0()
  if HM_BwrxSpawner02 == 0 and HM_Attic_InstantWin == 0 then
    if GetGlobal("Attic_Gus_KillHint01_Played") == 0 then
      FireUser1("hm_zonem_igc.spawnerRight")
    end
    Wait(1.6)
    FireUser1("BwrxSpawner02Marker")
    HM_MachineToSpawn = 2
    HM_BwrxSpawnHint()
  end
end
Bwrx02_ForceSpawn = L0_0
L0_0 = 0
HM_SpawnerEndBroke = L0_0
L0_0 = 1
HM_BeetleworxEndExit = L0_0
L0_0 = 1
HM_BeetleworxEnd = L0_0
function L0_0()
  local L1_12
  L1_12 = 0
  HM_BeetleworxEnd = L1_12
end
HM_BeetleworxEndKilled = L0_0
function L0_0()
  local L1_13
  L1_13 = 0
  HM_BeetleworxEndExit = L1_13
end
HM_ExitSpawnerEnd = L0_0
function L0_0()
  if HM_BeetleworxEnd == 0 and HM_BwrxSpawner01 == 0 and HM_Attic_InstantWin == 0 then
    HM_BeetleworxEndExit = 1
    HM_BeetleworxEnd = 1
    FireThread(Bwrx01_ForceSpawn)
  end
end
HM_SpawnerEnd = L0_0
function L0_0()
  if HM_BwrxSpawner01 == 0 and HM_Attic_InstantWin == 0 then
    if GetGlobal("Attic_Gus_KillHint01_Played") == 0 then
      FireUser1("hm_zonem_igc.spawnerEnd")
    end
    Wait(1.6)
    FireUser1("BwrxSpawner01Marker")
    HM_MachineToSpawn = 1
    HM_BwrxSpawnHint()
  end
end
Bwrx01_ForceSpawn = L0_0
function L0_0()
  AnimGBSequence("PressurePlate_Visuals", "TurnOff")
end
HM_AtticTVButtonOff = L0_0
