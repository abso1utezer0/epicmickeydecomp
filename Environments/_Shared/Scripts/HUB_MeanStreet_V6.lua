local L0_0, L1_1
function L0_0()
  if MS_V6_SkipIntro == false then
    MS_V6_SkipIntro = true
    MS_V6_SaveInitialCheckpoint = false
    SetGlobal("MS_MeanStreetProgress", 6)
    SetGlobal("MS_visitnum", 6)
    SetGlobal("MS_toontownopen", 1)
    SetGlobal("TT_ToonTownProgress", 3)
    SetGlobal("NO_NewOrleansProgress", 3)
    SetGlobal("AL_AdventurelandProgress", 4)
    MS_PickProjectorExit()
  end
end
MS_V6_AlwaysSetup_Launcher = L0_0
L0_0 = false
MS_V6_SkipIntro = L0_0
L0_0 = false
MS_V6_SaveInitialCheckpoint = L0_0
function L0_0()
  MS_V6_SaveInitialCheckpoint = true
  MSV6_AlwaysSetup()
end
Projector_SetupV6 = L0_0
function L0_0()
  Print("Setting up Mean Street visit 6")
  Enable("MSVisit6AudioTrigger")
  MS_V6_SkipIntro = true
  FireThread(MS_SetProjectorCam)
  SetGlobal("MS_MeanStreetProgress", 6)
  SetGlobal("MS_visitnum", 6)
  SetGlobal("TT_ToonTownProgress", 3)
  SetGlobal("NO_NewOrleansProgress", 3)
  SetGlobal("AL_AdventurelandProgress", 4)
  MS_MeanStreetPersist()
  StartEmitters("PortalFX1")
  StartEmitters("PortalFX2")
  StartEmitters("PortalFX3")
  StartEmitters("PortalFX4")
  if GetGlobal("MS_InvasionRepelled") == 0 then
    Disable("hub_meanstreet_dynamic.OpenParlorDoorTrig")
    Disable("hub_meanstreet_dynamic.OpenMuseumDoorTrig")
    Disable("hub_meanstreet_dynamic.OpenDetectiveDoorTrig")
    Disable("hub_meanstreet_dynamic.OpenCityHallDoorTrig")
    Disable("hub_meanstreet_dynamic.OpenEmporiumDoorTrig")
    ForEachEntityInGroup(ForceSketched, "V6Thin")
    SetGlobal("MS_V6_EnemiesKilled", 0)
    SetGlobal("MS_toontownopen", 0)
    SetGlobal("MS_adventurelandopen", 0)
    Prefab_Projector_ChangeState("ToonTownStartMarker", "Deactivate")
    SetGlobal("MS_BloticleCounter", 1)
  else
    FireUser1("hub_meanstreet_v6.Tentacle02")
    SetGlobal("MS_toontownopen", 1)
    SetGlobal("MS_adventurelandopen", 1)
    DestroyEntity("TentacleHint")
    Prefab_Projector_ChangeState("ToonTownStartMarker", "Activate")
    Prefab_Projector_ChangeState("MSVenturelandMarker", "Activate")
    MS6_EnableInteriors()
  end
  if GetGlobal("NO_invasionrepelled") == 0 then
    DestroyEntity("NoMoreBloticlesPin")
  end
  if GetGlobal("AL_BlotInvasionInProgress") == 0 then
    GuardianPrefab_PopulateGuardians("GuardianVentureland")
  elseif GetGlobal("NO_invasionrepelled") == 0 then
    GuardianPrefab_PopulateGuardians("GuardianBogEasy")
  else
    GuardianPrefab_PopulateGuardians("GuardianTomorrowCity")
  end
  if GetGlobal("AL_BlotInvasionInProgress") == 2 then
    MS_unblockNO()
  else
    SetGlobal("MS_neworleansopen", 0)
    Prefab_Projector_ChangeState("MSNewOrleansStart", "Deactivate")
  end
  if GetGlobal("NO_invasionrepelled") == 1 then
    MS_unblockTL()
  else
    Prefab_Projector_ChangeState("MSTomorrowCityMarker", "Deactivate")
  end
  MS_SetDefaultCameraValues()
  MS_SetupMap()
  if GetGlobal("MS_InvasionRepelled") == 0 then
    StartFadeOut(0)
    FireThread(MS_meetwithoswaldbik)
    if GetGlobal("MS_rocketfmv") == 1 then
      ActivateScene("environments/meanstreets/HUB_MeanStreet_V6_EnemyInterior.gsa")
    end
  elseif MS_V6_SaveInitialCheckpoint == true then
    MS_V6_SaveInitialCheckpoint = false
    MS_CheckpointSave()
  end
end
MSV6_AlwaysSetup = L0_0
function L0_0()
  Print("ReleaseV6Intro V6RLSE")
  StartFadeOut(0.5)
  wait(0.5)
  FireThread(MS_SetProjectorCam)
  SetLetterbox(0)
  SetCharacterInConversation(GetPlayer(), 0)
  wait(0.2)
  ForEachEntityInGroup(SetAppCulled, "cull_b_front")
  StartFadeIn(0.5)
  wait(0.5)
  UnrestrictCutSceneInput()
end
ReleaseV6Intro = L0_0
function L0_0()
  Enable("hub_meanstreet_dynamic.OpenParlorDoorTrig")
  Enable("hub_meanstreet_dynamic.OpenMuseumDoorTrig")
  Enable("hub_meanstreet_dynamic.OpenDetectiveDoorTrig")
  Enable("hub_meanstreet_dynamic.OpenCityHallDoorTrig")
  Enable("hub_meanstreet_dynamic.OpenEmporiumDoorTrig")
end
MS6_EnableInteriors = L0_0
function L0_0()
  if GetGlobal("MS_visit6intro") == 0 then
    SetGlobal("MS_visit6intro", 1)
    FireSequence("hub_meanstreet_v6.GusConvoV6", "MSS_gusmsinvaded")
  end
end
MS_introV6 = L0_0
function L0_0()
  if GetGlobal("AL_BlotInvasionInProgress") == 2 and GetGlobal("MS_noportaltentplayed") == 0 then
    SetGlobal("MS_noportaltentplayed", 1)
    wait(1)
    MS_unblockNO()
  end
end
MS_shownounlock = L0_0
function L0_0()
  if GetGlobal("MS_rocketfmv") == 0 then
    SetGlobal("MS_rocketfmv", 1)
    RestrictCutSceneInput()
    PlayAndUnlockMovie("MS_visit6_MickOswaldTalk.bik", "MS_visit6_MickOswaldTalk")
    wait(0.01)
    ActivateScene("environments/meanstreets/HUB_MeanStreet_V6_EnemyInterior.gsa")
    UnrestrictCutSceneInput()
    FireSequence("hub_meanstreet_v6.GusConvoV6", "MSS_gusmsinvaded")
  end
end
MS_meetwithoswaldbik = L0_0
L0_0 = 0
sweeperspawned = L0_0
function L0_0()
  Print("****************************Seer has sighted Mickey")
  if sweeperspawned == 0 then
    Print("****************************Seer calls for backup")
    sweeperspawned = 1
    ForEachEntityInGroup(Enable, "MS6_Seer_Backup")
  end
end
MS6_SeerSighted = L0_0
function L0_0()
  SetGlobal("MS_TentaclesDestroyed", GetGlobal("MS_TentaclesDestroyed") + 1)
  if GetGlobal("MS_BloticleCounter") > 0 then
    SetGlobal("MS_BloticleCounter", GetGlobal("MS_BloticleCounter") - 1)
  end
  MS_CheckTentaclesComplete()
end
MS_TentacleDeath1 = L0_0
function L0_0()
  SetGlobal("MS_TentaclesDestroyed", GetGlobal("MS_TentaclesDestroyed") + 1)
  if GetGlobal("MS_BloticleCounter") > 0 then
    SetGlobal("MS_BloticleCounter", GetGlobal("MS_BloticleCounter") - 1)
  end
  MS_CheckTentaclesComplete()
end
MS_TentacleDeath2 = L0_0
function L0_0()
  SetGlobal("MS_TentaclesDestroyed", GetGlobal("MS_TentaclesDestroyed") + 1)
  if GetGlobal("MS_BloticleCounter") > 0 then
    SetGlobal("MS_BloticleCounter", GetGlobal("MS_BloticleCounter") - 1)
  end
  MS_CheckTentaclesComplete()
end
MS_TentacleDeath3 = L0_0
function L0_0()
  SetGlobal("MS_TentaclesDestroyed", GetGlobal("MS_TentaclesDestroyed") + 1)
  if GetGlobal("MS_BloticleCounter") > 0 then
    SetGlobal("MS_BloticleCounter", GetGlobal("MS_BloticleCounter") - 1)
  end
  MS_CheckTentaclesComplete()
end
MS_TentacleDeath4 = L0_0
function L0_0()
  if GetGlobal("MS_TentaclesDestroyed") == 1 then
    SetGlobal("MS_invasionrepelled", 1)
    SetGlobal("MS_toontownopen", 1)
    AudioPostEventOn(GetPlayer(), "Stop_music_Blot_Interior")
    MS_V6_WaveCombat_CheckState()
  end
end
MS_CheckTentaclesComplete = L0_0
function L0_0()
  Print("****************************Wave 1 Defeated")
  ForEachEntityInGroup(DestroyEntity, "Wave1_Spawner")
  MS_V3_SpawnMoreCheck(nil, "2", true)
end
MS_V3_Destroytent1 = L0_0
function L0_0()
  Print("****************************Wave 2 Defeated")
  ForEachEntityInGroup(DestroyEntity, "Wave2_Spawner")
  MS_V3_SpawnMoreCheck(nil, "3", true)
end
MS_V3_Destroytent2 = L0_0
function L0_0(A0_2, A1_3, A2_4)
  local L3_5, L4_6
  L3_5 = Print
  L4_6 = "*****************Spawn More Check"
  L3_5(L4_6)
  L3_5 = GetPrefabData
  L4_6 = "MS_WaveCombat"
  L3_5 = L3_5(L4_6)
  L4_6 = L3_5.Total_Enemies_InWave
  L4_6 = L4_6 - (L3_5.EnemiesFriended + L3_5.EnemiesDefeated)
  if L4_6 < 3 then
    L3_5.Total_Enemies_InWave = 0
    Print("Firing:MS_V3_SpawnWave" .. A1_3)
    FireThread(_G["MS_V3_SpawnWave" .. A1_3], A2_4, L4_6)
  end
end
MS_V3_SpawnMoreCheck = L0_0
function L0_0(A0_7, A1_8, A2_9)
  Print("******************MS_V3_SpawnWave2")
  if A2_9 == nil then
    A2_9 = GetPrefabData("MS_WaveCombat").EnemiesFriended
  end
  if GetPrefabData("MS_WaveCombat").EnemiesFriended == 0 then
    SetPropertyInt("Wave2_Spawner_Seers", "Number To Spawn", 3, 0)
    GetPrefabData("MS_WaveCombat").Total_Enemies_InWave = 5 + A2_9
  elseif GetPrefabData("MS_WaveCombat").EnemiesFriended > 0 and GetPrefabData("MS_WaveCombat").EnemiesFriended < 3 then
    SetPropertyInt("Wave2_Spawner_Seers", "Number To Spawn", 2, 0)
    GetPrefabData("MS_WaveCombat").Total_Enemies_InWave = 4 + A2_9
  elseif GetPrefabData("MS_WaveCombat").EnemiesFriended > 3 then
    SetPropertyInt("Wave2_Spawner_Seers", "Number To Spawn", 1, 0)
    GetPrefabData("MS_WaveCombat").Total_Enemies_InWave = 3 + A2_9
  end
  GetPrefabData("MS_WaveCombat").WaveCompleteFunction = "MS_V3_SpawnWave3"
  GetPrefabData("MS_WaveCombat").EnemyEntityGroup = "Wave2Enemies"
  if not A1_8 then
  end
  wait(2)
  ForEachEntityInGroup(Enable, "Wave2_Spawner")
end
MS_V3_SpawnWave2 = L0_0
function L0_0(A0_10, A1_11, A2_12)
  Print("******************MS_V3_SpawnWave3")
  if A2_12 == nil then
    A2_12 = GetPrefabData("MS_WaveCombat").EnemiesFriended
  end
  if GetPrefabData("MS_WaveCombat").EnemiesFriended < 5 then
    SetPropertyInt("Wave3_Spawner_Melee", "Number To Spawn", 2, 0)
    GetPrefabData("MS_WaveCombat").Total_Enemies_InWave = 4 + A2_12
  elseif GetPrefabData("MS_WaveCombat").EnemiesFriended > 4 then
    SetPropertyInt("Wave3_Spawner_Melee", "Number To Spawn", 1, 0)
    GetPrefabData("MS_WaveCombat").Total_Enemies_InWave = 3 + A2_12
  end
  GetPrefabData("MS_WaveCombat").WaveCompleteFunction = "MS_V3_AllEnemiesKilled"
  GetPrefabData("MS_WaveCombat").EnemyEntityGroup = "Wave3Enemies"
  wait(2)
  ForEachEntityInGroup(Enable, "Wave3_Spawner")
end
MS_V3_SpawnWave3 = L0_0
function L0_0()
  SetGlobal("MS_V6_EnemiesKilled", 1)
  MS_V6_WaveCombat_CheckState()
end
MS_V3_AllEnemiesKilled = L0_0
function L0_0()
  wait(0.4)
  SetGlobal("MS_invasionrepelled", 1)
  MS_V6_WaveCombat_CheckState()
end
MS_V3_Destroytent3 = L0_0
function L0_0()
  if GetGlobal("MS_invasionrepelled") == 1 then
    DestroyEntity("TentacleHint")
    MS6_EnableInteriors()
    V6_MS_StreamNPC()
  end
end
MS_V6_WaveCombat_CheckState = L0_0
function L0_0()
  StartFadeOut(0.5)
  Wait(0.5)
  Print("***********Streaming NOW...")
  StreamZones(GetPlayer(), "msvisit6_noenemy")
  StreamInterior(nil, "v6_defaultinterior")
  Wait(0.01)
  WaitForLevelLoad()
  Wait(0.01)
  FireSequence("hub_meanstreet_v6.GusConvoV6", "MSS_gustentaclesgone")
end
V6_MS_StreamNPC = L0_0
function L0_0()
  if GetGlobal("MS_neworleansopen") == 0 then
    FireSequence("hub_meanstreet_v6.GusConvoV6", "MSS_gustentaclesgoneno")
  else
    wait(0.2)
    Prefab_Projector_ChangeState("MSNewOrleansStart", "Activate")
  end
end
MS_unblockNO = L0_0
function L0_0()
  SetGlobal("MS_adventurelandopen", 1)
end
MS_unblockAL = L0_0
function L0_0()
  if GetGlobal("MS_tomorrowlandopen") == 0 then
    FireSequence("hub_meanstreet_v6.GusConvoV6", "MSS_gustentaclesgoneTL")
  else
    Prefab_Projector_ChangeState("MSTomorrowCityMarker", "Activate")
  end
end
MS_unblockTL = L0_0
function L0_0()
  if GetGlobal("MS_InvasionRepelled") == 0 then
    AudioPostEventOn(GetPlayer(), "Play_sfx_NOS_Amb_BlotInfestation")
    wait(0.1)
    AudioPostEventOn(GetPlayer(), "Play_music_Blot_Interior")
  else
    AudioPostEventOn(GetPlayer(), "Play_sfx_NOS_Amb_BlotInfestation")
  end
end
MS_V6_DecideAudioTrack = L0_0
