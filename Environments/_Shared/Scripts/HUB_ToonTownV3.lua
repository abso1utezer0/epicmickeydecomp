local L0_0, L1_1
function L0_0()
  Print("***********************TTV3 AlwaysSetup Launcher TTV3LAUNCH")
  if TT_V3_SkipIntro == false then
    TT_V3_SkipIntro = true
    TT_V3_SaveInitialCheckpoint = true
    SetGlobal("HUB_startposition", 2)
    SetGlobal("MS_MeanStreetProgress", 6)
    SetGlobal("TT_ToonTownProgress", 3)
    SetGlobal("TT_visitnum", 3)
    TT_Setup_Launcher("TTMJMarker")
  end
end
TTV3_AlwaysSetup_Launcher = L0_0
function L0_0()
  Print("*******STAGGERING*********")
  TT_StaggerSketched()
end
TT_CheckV3Respawn = L0_0
function L0_0()
  Print("TentDestroyed: " .. GetGlobal("TT_tent1destroyed") .. "EnemyStatus: " .. GetGlobal("TT_V3_EnemyState"))
  if GetGlobal("MS_rocketfmv") == 0 then
    if GetGlobal("TT_tent1destroyed") == 0 and GetGlobal("TT_V3_EnemyState") == 0 then
      SetGlobal("HUB_startposition", 2)
      TT_TentIntro(0)
    elseif GetGlobal("TT_tent1destroyed") == 1 and GetGlobal("TT_V3_EnemyState") == 0 then
      TT_TentIntro(1)
    elseif GetGlobal("TT_tent1destroyed") == 0 and GetGlobal("TT_V3_EnemyState") == 1 then
      SetGlobal("TT_V3_EnemyState", 0)
      TT_TentIntro(0)
    elseif GetGlobal("TT_tent1destroyed") == 1 and GetGlobal("TT_V3_EnemyState") == 1 then
      TT_TentIntro(3)
    end
  elseif GetGlobal("MS_rocketfmv") == 1 then
    StreamInterior(nil, "ttv3_defaultinterior")
    WaitForLevelLoad()
    TT_DestroyTentaclesAtStart()
    V3_TT_EnableInteriors()
    SetGlobal("TT_tent1destroyed", 1)
    SetGlobal("TT_V3_EnemyState", 1)
    V3_TT_StreamNPC()
    if GetGlobal("HUB_StartPosition") == 1 then
      Enable("hub_toontown.Trigger_CameraOverride 07")
      SetCameraAttributes("hub_toontown.Trigger_CameraOverride 07")
    elseif GetGlobal("HUB_StartPosition") == 2 then
      Enable("hub_toontown.Trigger_CameraOverride 04")
      SetCameraAttributes("hub_toontown.Trigger_CameraOverride 04")
    end
  end
end
TT_ChooseTentacleSetup = L0_0
function L0_0()
  if GetGlobal("TT_tent1destroyed") == 0 then
    AudioPostEventOn(GetPlayer(), "Play_music_Blot_Interior")
  end
end
TT_BlotMusicCheck = L0_0
L0_0 = false
TT_V3_SkipIntro = L0_0
L0_0 = false
TT_V3_SaveInitialCheckpoint = L0_0
function L0_0()
  TT_V3_SaveInitialCheckpoint = true
  TTV3_AlwaysSetup()
end
TT_Projector_SetupV3 = L0_0
function L0_0()
  if GetGlobal("TT_tent1destroyed") == 1 then
    ActivateScene("environments/meanstreets/HUB_ToonTown_V3_NPC.gsa")
  else
    ActivateScene("environments/meanstreets/HUB_ToonTown_V3_AI.gsa")
  end
  Print("Setting up Os Town visit 3")
  RestrictCutSceneInput()
  Prefab_Projector_ChangeState("hub_toontown.ProjectorTTMickeyJunk.ProjectorPortal_Stand", "Deactivate")
  StartTrackingCurrentLevelForScoring("TT_ToonTown")
  Disable("CarHintTrigger")
  GuardianPrefab_PopulateGuardians("MSGuardianSpawner")
  V3_TT_DisableInteriors()
  if GetGlobal("TT_tentintroplayed") == 0 then
    GetPrefabData("TTMJMarker").ToFlyThrough = "True"
    SetGlobal("TT_GuardianQuestMarkerTracker", 0)
  elseif GetGlobal("TT_tentintroplayed") == 1 and GetGlobal("MS_rocketfmv") == 0 then
    TT_CheckV3Respawn()
  elseif GetGlobal("TT_tent1destroyed") == 1 and GetGlobal("MS_rocketfmv") == 0 then
    TT_CheckV3Respawn()
  end
  TT_ChooseTentacleSetup()
  if GetGlobal("TT_PlankThinned") == 0 and GetGlobal("TT_tent1destroyed") == 1 then
    ForcePainted("hub_toontown_static.TT_Minihub_Toon8 01")
  else
    ForceSketched("hub_toontown_static.TT_Minihub_Toon8 01")
  end
  if GetGlobal("TT_Phoneboxes") == 4 then
    ForEachEntityInGroup(ForcePainted, "FuseBoxes")
  else
    ForEachEntityInGroup(DestroyEntity, "FuseBoxes")
  end
  SetGlobal("MS_MeanStreetProgress", 6)
  SetGlobal("TT_ToonTownProgress", 3)
  SetGlobal("TT_visitnum", 3)
  wait(0.1)
  if GetGlobal("TT_boatfixed") == 1 then
    AnimGBSequence("V3DonaldBoat", "Loop")
    if GetGlobal("TT_DonaldBoatTicketCollected") == 0 then
      Unhide("hub_toontown_v2.ETicket_E_Parentable 01")
    end
  else
    AnimGBSequence("V3DonaldBoat", "Rest")
  end
  AnimGBSetIdle("V3DonaldBoat", false)
  AnimGBSequence("hub_toontown.TT_SafeA1_Inert 02", "RestOpened")
  AnimGBSetIdle("hub_toontown.TT_SafeA1_Inert 02", false)
  TT_SetDefaultCamera()
  TT_SetupMap()
  Print("Firing Sequence")
  if GetGlobal("TT_tentintroplayed") == 0 then
    FireThread(FireFirstSequence)
  elseif TT_V3_SaveInitialCheckpoint == true then
    TT_V3_SaveInitialCheckpoint = false
    TT_CheckpointSave()
  end
  TT_GuardianActivationSystem(GetGlobal("TT_GuardianQuestMarkerTracker"))
  if GetGlobal("TT_V3_GusPipGiven") == 1 and GetGlobal("TT_tent1destroyed") == 1 then
    DestroyEntity("GusGremlinUpgradeV3")
  elseif GetGlobal("TT_V3_GusPipGiven") == 0 and GetGlobal("TT_tent1destroyed") == 1 then
    TeleportGremlinIn("GusGremlinUpgradeV3", "GusOwnerMarker", false)
    AnimVarInt("GusGremlinUpgradeV3", VAR_Mood_Type, MOOD_Positive)
  end
  UnrestrictCutSceneInput()
end
TTV3_AlwaysSetup = L0_0
function L0_0()
  FireSequence("hub_toontown_v3.GusConvoV3", "TT_invasionstarthint")
  SetGlobal("TT_tentintroplayed", 1)
end
FireFirstSequence = L0_0
function L0_0(A0_2)
  Print("TentIntroFunction, introPlayed: " .. GetGlobal("TT_tentintroplayed"))
  if GetGlobal("TT_tentintroplayed") == 0 then
    TT_StaggerPainted()
    SetGlobal("MS_neworleansopen", 0)
    SetGlobal("MS_adventurelandopen", 0)
    SetGlobal("MS_tomorrowlandopen", 0)
  elseif GetGlobal("TT_tentintroplayed") == 1 then
    Enable("hub_toontown.Trigger_CameraOverride 04")
    SetCameraAttributes("hub_toontown.Trigger_CameraOverride 04")
  end
  TT_SetUpBossAndEnemies(A0_2)
end
TT_TentIntro = L0_0
function L0_0()
  wait(20)
  ForEachEntityInGroup(Enable, "ToonThinners")
end
TT_EnableToonThinners = L0_0
function L0_0(A0_3)
  Print("SETUP CALLED -- Case: " .. A0_3)
  if A0_3 == 0 then
    ForEachEntityInGroup(Enable, "Wave1Spawner")
    TT_ResetTentacles()
    FireThread(TT_EnableToonThinners)
  elseif A0_3 == 1 then
    ForEachEntityInGroup(Enable, "Wave1Spawner")
    V3_TT_EnableInteriors()
    TT_DestroyTentaclesAtStart()
  elseif A0_3 == 3 then
    V3_TT_EnableInteriors()
    TT_DestroyTentaclesAtStart()
    V3_TT_StreamNPC()
    ForEachEntityInGroup(Disable, "ToonThinners")
  end
end
TT_SetUpBossAndEnemies = L0_0
function L0_0()
  if GetPrefabData("TT_WaveCombat").EnemiesFriended < 2 then
    SetPropertyInt("Wave2Spawner_Melee", "Number To Spawn", 2, 0)
    GetPrefabData("TT_WaveCombat").Total_Enemies_InWave = 4 + GetPrefabData("TT_WaveCombat").EnemiesFriended
  elseif GetPrefabData("TT_WaveCombat").EnemiesFriended > 3 then
    SetPropertyInt("Wave2Spawner_Melee", "Number To Spawn", 1, 0)
    GetPrefabData("TT_WaveCombat").Total_Enemies_InWave = 4 + GetPrefabData("TT_WaveCombat").EnemiesFriended
  end
  GetPrefabData("TT_WaveCombat").WaveCompleteFunction = "TT_AllEnemiesKilled"
  GetPrefabData("TT_WaveCombat").EnemyEntityGroup = "Wave2Enemies"
  wait(2)
end
TT_SpawnWave2 = L0_0
function L0_0()
  SetGlobal("TT_V3_EnemyState", 1)
  V3_TT_CheckState()
end
TT_AllEnemiesKilled = L0_0
function L0_0()
  if GetGlobal("TT_tent1destroyed") == 1 and GetGlobal("TT_V3_EnemyState") == 0 then
    Print("Tentacles dead")
    GetPrefabData("TT_WaveCombat").WaveCompleteFunction = "TT_AllEnemiesKilled"
    Print("WaveComplete Set")
    FireSequence("hub_toontown_v3.GusConvoV3", "TT_tentclear")
    StartTrackingCurrentLevelForScoring("TT_ToonTown")
    V3_TT_EnableInteriors()
    wait(0.7)
  end
end
V3_TT_CheckState = L0_0
function L0_0()
  Print("Streaming NOW...")
  StreamInterior(nil, "ttv3_defaultinterior")
  ActivateScene("environments/meanstreets/HUB_ToonTown_V3_NPC.gsa")
end
V3_TT_StreamNPC = L0_0
function L0_0()
  if GetGlobal("TT_OrtHouseUnlocked") == 1 then
    Enable("hub_toontown_dynamic.DoorAnimateOrtensia")
  end
  Enable("hub_toontown.OrtDoorTrigger")
  Enable("hub_toontown_dynamic.DoorAnimateMickey")
  Enable("hub_toontown.MickeyDoorTrigger 01")
  Enable("hub_toontown_dynamic.DoorAnimateTriggerClarabelle")
  Enable("hub_toontown.ClaraDoorTrigger")
end
V3_TT_EnableInteriors = L0_0
function L0_0()
  Disable("hub_toontown_dynamic.DoorAnimateMickey")
  Disable("hub_toontown_dynamic.DoorAnimateOrtensia")
  Disable("hub_toontown_dynamic.DoorAnimateTriggerClarabelle")
end
V3_TT_DisableInteriors = L0_0
function L0_0(A0_4, A1_5)
  Print("************NPCSTATE CALLED, TARGET: " .. A1_5)
  Print("PickingStates")
  if A1_5 == "0" then
    if GetGlobal("TT_goofyconstructed") == 1 then
      Print("Goofy Assembled")
      ForceSpawn("v3.GoofySpawner", 1)
      DestroyEntity(A0_4)
      PickGoofyMood()
    end
  elseif A1_5 == "1" then
    if GetGlobal("MS_FindPirateQuest") < 2 then
      Print("Moody's cousin not saved")
      DestroyEntity(A0_4)
    end
  elseif A1_5 == "2" and GetGlobal("TT_badrescue") == 1 then
    Print("Moody squashed")
    DestroyEntity(A0_4)
  end
end
TT_SetNPCStates = L0_0
function L0_0()
  ForceSketched("TTClaraHouse")
  AudioPostEventOn(GetPlayer(), "Play_sfx_HubInfestation_Hub_Thinned")
  wait(0.3)
  ForEachEntityInGroup(ForceSketched, "levelgeo3")
  wait(0.3)
  ForceSketched("TTOrtHouse")
  wait(0.3)
  ForceSketched("TTGagFactory")
  wait(0.3)
  ForEachEntityInGroup(ForceSketched, "levelgeo2")
  wait(0.3)
  ForceSketched("TTMickeyHouse")
  wait(0.3)
  ForEachEntityInGroup(ForceSketched, "levelgeo1")
  wait(0.3)
  ForceSketched("TTMoodyHouse")
end
TT_StaggerSketched = L0_0
function L0_0()
  ForcePainted("TTClaraHouse")
  wait(0.3)
  ForEachEntityInGroup(ForcePainted, "levelgeo3")
  wait(0.3)
  ForcePainted("TTOrtHouse")
  wait(0.3)
  ForcePainted("TTGagFactory")
  wait(0.3)
  ForEachEntityInGroup(ForcePainted, "levelgeo2")
  wait(0.3)
  ForcePainted("TTMickeyHouse")
  wait(0.3)
  ForEachEntityInGroup(ForcePainted, "levelgeo1")
  wait(0.3)
  ForcePainted("TTMoodyHouse")
end
TT_StaggerPainted = L0_0
function L0_0()
  if GetGlobal("TT_LocketSold") == 1 then
    Print("Set Goofy to negative")
    AnimVarInt("hub_toontown_v2.AnimatronicGoofy 01", VAR_Mood_Type, 0)
  else
    Print("Set Goofy to positive")
    AnimVarInt("hub_toontown_v2.AnimatronicGoofy 01", VAR_Mood_Type, 1)
  end
end
PickGoofyMood = L0_0
function L0_0()
  local L0_6, L1_7
end
TT_safefall = L0_0
function L0_0()
  SetGlobal("TT_NumTentaclesDestroyed", GetGlobal("TT_NumTentaclesDestroyed") - 1)
  if GetGlobal("TT_NumTentaclesDestroyed") == 0 then
    SetGlobal("TT_tent1destroyed", 1)
    V3_TT_CheckState()
  end
end
TT_TentacleDestroyed = L0_0
function L0_0(A0_8)
  if A0_8 == "1" then
    Disable("hub_toontown_v3.HintMarker.Tentacle1Hint")
  elseif A0_8 == "2" then
    Disable("hub_toontown_v3.HintMarker.Tentacle2Hint")
  elseif A0_8 == "3" then
    Disable("hub_toontown_v3.HintMarker.Tentacle3Hint")
  elseif A0_8 == "4" then
    Disable("hub_toontown_v3.HintMarker.Tentacle4Hint")
  elseif A0_8 == "5" then
    Disable("hub_toontown_v3.HintMarker.Tentacle5Hint")
  end
end
TT_DestroyGuardiansOnTentacleDestroy = L0_0
function L0_0()
  SetGlobal("TT_NumTentaclesDestroyed", 3, true)
end
TT_ResetTentacles = L0_0
function L0_0()
  local L0_9, L1_10, L2_11, L3_12
  for L3_12 = 1, 3 do
    FireUser1("Tentacle" .. L3_12)
  end
end
TT_DestroyTentaclesAtStart = L0_0
function L0_0()
  Prefab_Horizontal_Tentacle_Boil_Damage("Tent1Boil1", "2")
  wait(1)
  Prefab_Horizontal_Tentacle_Boil_Damage("Tent1Boil2", "3")
  wait(1)
  Prefab_Horizontal_Tentacle_Boil_Damage("Tent1Boil3", "4")
end
_SOUNDDEBUG_DestroyTent1 = L0_0
function L0_0()
  Prefab_Horizontal_Tentacle_Boil_Damage("Tent2Boil1", "2")
  wait(1)
  Prefab_Horizontal_Tentacle_Boil_Damage("Tent2Boil2", "3")
  wait(1)
  Prefab_Horizontal_Tentacle_Boil_Damage("Tent2Boil3", "4")
end
_SOUNDDEBUG_DestroyTent2 = L0_0
function L0_0()
  Prefab_Horizontal_Tentacle_Boil_Damage("Tent3Boil1", "2")
  wait(1)
  Prefab_Horizontal_Tentacle_Boil_Damage("Tent3Boil2", "3")
  wait(1)
  Prefab_Horizontal_Tentacle_Boil_Damage("Tent3Boil3", "4")
end
_SOUNDDEBUG_DestroyTent3 = L0_0
function L0_0()
  Prefab_Horizontal_Tentacle_Boil_Damage("Tent4Boil1", "2")
  wait(1)
  Prefab_Horizontal_Tentacle_Boil_Damage("Tent4Boil2", "3")
  wait(1)
  Prefab_Horizontal_Tentacle_Boil_Damage("Tent4Boil3", "4")
end
_SOUNDDEBUG_DestroyTent4 = L0_0
function L0_0()
  Prefab_Horizontal_Tentacle_Boil_Damage("Tent5Boil1", "2")
  wait(1)
end
_SOUNDDEBUG_DestroyTent5 = L0_0
function L0_0(A0_13)
  SetGlobal("TT_GuardianQuestMarkerTracker", A0_13)
  if A0_13 == 0 then
    Print("0. Tentacles not destroyed")
    Disable("hub_toontown_v3.HintMarker.MeanStreetNeutral")
    Enable("hub_toontown_v3.HintMarker.Tentacle1Hint")
    Enable("hub_toontown_v3.HintMarker.Tentacle2Hint")
    Enable("hub_toontown_v3.HintMarker.Tentacle3Hint")
  elseif A0_13 == 1 then
    Print("1. Tentacles destroyed.")
    Disable("hub_toontown_v3.HintMarker.Tentacle1Hint")
    Disable("hub_toontown_v3.HintMarker.Tentacle2Hint")
    Disable("hub_toontown_v3.HintMarker.Tentacle3Hint")
    Enable("hub_toontown_v3.HintMarker.MeanStreetNeutral")
  end
end
TT_GuardianActivationSystem = L0_0
function L0_0()
  FireSequence("GusGremlinUpgradeV3", "TT_GusAwardHealthPip")
end
TT_FireGusPipUpgrade = L0_0
function L0_0()
  Print("**********STARTING GIVE HP**********")
  Mickey_GiveItemToCharacter("GusGiveHealthUpgradeSpawner", "HealthUpgrade")
  IncreaseMickeysMaxHealth(nil)
end
StartGusGiveHealth = L0_0
function L0_0()
  Print("**********STOPPING GIVE HP**********")
  Mickey_GetItem_ClearItem("GusGiveHealthUpgradeSpawner", "HealthUpgrade")
end
EndGusGiveHealth = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.9)
  WaitForLevelLoad()
  FireThread(TT_MoveGusToMarker)
  FireUser1("GusFancyCam")
end
TT_TransitionToGusCam = L0_0
function L0_0()
  wait(2)
  TeleportGremlinIn("GusGremlinUpgradeV3", "GusOwnerMarker", false)
  AnimVarInt("GusGremlinUpgradeV3", VAR_Mood_Type, MOOD_Positive)
end
TT_MoveGusToMarker = L0_0
function L0_0()
  SetGlobal("TT_goofyconstructed", 1)
  StartFadeOut(1)
  wait(1)
  SetPropertyFloat("hub_toontown_igc.Trigger_CameraOverride 03", "HintPitchSpeed", 0)
  SetPropertyFloat("hub_toontown_igc.Trigger_CameraOverride 03", "HintDistanceSpeed", 0)
  SetCameraAttributes("hub_toontown_igc.Trigger_CameraOverride 03")
  HideHud()
  PlayAndUnlockMovie("TT_visit2_Restoration of Goofy.bik", "TT_visit2_Restoration_of_Goofy")
  DestroyEntity("v3.GoofyHead")
  ForceSpawn("v3.GoofySpawner", 1)
  wait(0.1)
  SetCharacterInConversation(GetPlayer(), 0)
  wait(0.5)
  StartFadeIn(1)
  SetPropertyFloat("hub_toontown_igc.Trigger_CameraOverride 03", "HintPitchSpeed", 0.005)
  SetPropertyFloat("hub_toontown_igc.Trigger_CameraOverride 03", "HintDistanceSpeed", 0.005)
  UnrestrictCutSceneInput()
  ShowHud()
  PickGoofyMood()
  TT_CheckpointSave()
end
TT_constructgoofy = L0_0
