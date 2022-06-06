local L0_0, L1_1
function L0_0()
  if VL_V3_SkipIntro == false then
    VL_V3_SkipIntro = true
    VL_V3_SaveInitialCheckpoint = true
    SetGlobal("HUB_startposition", 1)
    SetGlobal("MS_MeanStreetProgress", 6)
    SetGlobal("MS_InvasionRepelled", 1)
    SetGlobal("MS_adventurelandopen", 1)
    SetGlobal("AL_AdventurelandProgress", 4)
    VL_Setup_Launcher("VLMeanStreetStart")
  end
end
ALV3_AlwaysSetup_Launcher = L0_0
L0_0 = false
VL_V3_SkipIntro = L0_0
L0_0 = false
VL_V3_SaveInitialCheckpoint = L0_0
function L0_0()
  VL_V3_SaveInitialCheckpoint = true
  ALV3_AlwaysSetup()
end
VL_Projector_SetupV3 = L0_0
function L0_0()
  Print("Setting up Ventureland visit 3")
  if GetGlobal("AL_BlotInvasionInProgress") == 2 then
    ActivateScene("environments/meanstreets/HUB_Adventureland_V3_NPC.gsa")
  else
    ActivateScene("environments/meanstreets/HUB_Adventureland_V3_AI.gsa")
  end
  if GetGlobal("AL_V3_InvasionStart_Played") == 1 then
    StartFadeOut(0)
    if GetGlobal("AL_BlotInvasionInProgress") == 2 then
      FireUser1("AL_Horizontal_Tentacle1")
      FireUser1("AL_Horizontal_Tentacle2")
      FireUser1("AL_Vertical_Tentacle2")
    end
  end
  ForEachEntityInGroup(Unhide, "Smee_CollisionZones")
  SetGlobal("MS_MeanStreetProgress", 6)
  SetGlobal("MS_adventurelandopen", 1)
  SetGlobal("AL_AdventurelandProgress", 4)
  GuardianPrefab_PopulateGuardians("MSGuardianSpawner")
  Hide("hub_adventureland_static.Henrietta_Sitting_Collision 01")
  Disable("hub_adventureland_triggers.ConversationDoors")
  Disable("HutShopProximityTrigger")
  Disable("HutShopDoorTrigger")
  NewBaseCamera()
  Unhide("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Weight 01")
  Unhide("hub_adventureland_dynamic.AL_P_CompassA1_Toon_01 01")
  Disable("hub_adventureland_v3.Override_Crownest")
  AnimGBSequence("hub_adventureland_dynamic.AL_CrowsNestTower_01 01", "RotateLoop")
  AudioPostEventOn("hub_adventureland_audio.CrowsNest_Loop", "Play_Crows_Nest_Loop")
  AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Parts 01", "Loop")
  AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_ShipWheel 01", "Loop")
  AnimGBSequence("hub_adventureland_dynamic.AL_P_CompassA1_Toon_01 01", "Loop")
  AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Weight 01", "Loop")
  AudioPostEventOn("hub_adventureland_audio.Bellows", "Play_sfx_AdvLnd_Bellow")
  AudioPostEventOn("hub_adventureland_audio.Pump", "Play_sfx_advlnd_Pump")
  AudioPostEventOn("hub_adventureland_audio.WheelLinkage", "Play_sfx_AdvntLnd_Wheel_LinkageLP")
  AudioPostEventOn("hub_adventureland_audio.WheelPulley1", "Play_sfx_AdvntLnd_Wheel_Pulleys")
  AudioPostEventOn("hub_adventureland_audio.WheelPulley2", "Play_sfx_AdvntLnd_Wheel_Pulleys")
  if GetGlobal("AL_V3_InvasionStart_Played") == 1 then
    GetPrefabData("VLMeanStreetStart").ToFlyThrough = "False"
    Enable("hub_adventureland_static.TriggerProjectorCameraOverride 01")
    SetCameraAttributes("hub_adventureland_static.TriggerProjectorCameraOverride 01")
    wait(0.5)
    Print("----------------Fading in----------------")
    StartFadeIn(1)
  else
    AL_StaggerPainted()
    ForceSequence("hub_adventureland_v3.GusStandIn", "AL_V3_InvasionStart")
  end
  if GetGlobal("AL_BlotInvasionInProgress") == 0 then
    UnrestrictCutSceneInput()
    StartBlotAttack()
  elseif GetGlobal("AL_BlotInvasionInProgress") == 1 then
    Disable("hub_adventureland_v3.Override_Crownest")
    ForEachEntityInGroup(Enable, "ALV3_Wave2Spawner")
    ForEachEntityInGroup(DestroyEntity, "AL_Tentacle1Spots")
  elseif GetGlobal("AL_BlotInvasionInProgress") == 2 then
    V3_AL_StreamNPC()
    WaitForLevelLoad()
    Enable("ALV3_Spawner_NPCs")
    V3_AL_Daisy()
  end
  VL_V3_SkipIntro = true
  VL_SetupMap()
  FireThread(VL_SetProjectorUsable)
  if GetGlobal("AL_V3_InvasionStart_Played") == 1 and VL_V3_SaveInitialCheckpoint == true then
    VL_V3_SaveInitialCheckpoint = false
    VL_CheckpointSave()
  end
end
ALV3_AlwaysSetup = L0_0
function L0_0()
  Print("Setting projector usable radius")
  wait(5)
  if GetGlobal("AL_BlotInvasionInProgress") == 0 then
    SetPropertyFloat("ToMSProjector", "UsableRadius", 0)
  elseif GetGlobal("AL_BlotInvasionInProgress") == 1 then
    SetPropertyFloat("ToMSProjector", "UsableRadius", 0)
  elseif GetGlobal("AL_BlotInvasionInProgress") == 2 then
    SetPropertyFloat("ToMSProjector", "UsableRadius", 3.5)
  end
end
VL_SetProjectorUsable = L0_0
function L0_0()
  Enable("ALV3_Wave1Spawner")
  Enable("ALV3_Wave1SpawnerRanged")
end
StartBlotAttack = L0_0
function L0_0()
  SetGlobal("AL_V3_Tent1Alive", 0)
  SetGlobal("AL_V3_TentsLeft", GetGlobal("AL_V3_TentsLeft") - 1)
  if GetGlobal("AL_V3_InavasionHelp01_Played") == 0 and GetGlobal("AL_V3_Tent3Alive") == 1 then
    ForceSequence("hub_adventureland_v3.GusStandIn", "AL_V3_InavasionHelp01")
  end
  if GetGlobal("AL_V3_TentsLeft") == 0 then
    V3_AL_CheckState()
  end
end
AL_V3_DestroyTent1 = L0_0
function L0_0()
  SetGlobal("AL_V3_Tent2Alive", 0)
  SetGlobal("AL_V3_TentsLeft", GetGlobal("AL_V3_TentsLeft") - 1)
  if GetGlobal("AL_V3_InavasionHelp01_Played") == 0 and GetGlobal("AL_V3_Tent3Alive") == 1 then
    ForceSequence("hub_adventureland_v3.GusStandIn", "AL_V3_InavasionHelp01")
  end
  if GetGlobal("AL_V3_TentsLeft") == 0 then
    V3_AL_CheckState()
  end
end
AL_V3_DestroyTent2 = L0_0
function L0_0()
  SetGlobal("AL_V3_Tent3Alive", 0)
  SetGlobal("AL_V3_TentsLeft", GetGlobal("AL_V3_TentsLeft") - 1)
  if GetGlobal("AL_V3_TentsLeft") == 0 then
    V3_AL_CheckState()
  end
end
AL_V3_DestroyTent3 = L0_0
function L0_0()
  SetGlobal("AL_V3_Tent4Alive2", 0)
  SetGlobal("AL_V3_TentsLeft", GetGlobal("AL_V3_TentsLeft") - 1)
  if GetGlobal("AL_V3_InavasionHelp01_Played") == 0 and GetGlobal("AL_V3_Tent3Alive") == 1 then
    ForceSequence("hub_adventureland_v3.GusStandIn", "AL_V3_InavasionHelp01")
  end
  if GetGlobal("AL_V3_TentsLeft") == 0 then
    V3_AL_CheckState()
  end
end
AL_V3_DestroyTent4 = L0_0
function L0_0()
  SetGlobal("AL_V3_Tent5Alive", 0)
  SetGlobal("AL_V3_TentsLeft", GetGlobal("AL_V3_TentsLeft") - 1)
  if GetGlobal("AL_V3_InavasionHelp01_Played") == 0 and GetGlobal("AL_V3_Tent3Alive") == 1 then
    ForceSequence("hub_adventureland_v3.GusStandIn", "AL_V3_InavasionHelp01")
  end
  if GetGlobal("AL_V3_TentsLeft") == 0 then
    V3_AL_CheckState()
  end
end
AL_V3_DestroyTent5 = L0_0
function L0_0(A0_2)
  ForceSequence("hub_adventureland_v3.GusStandIn", "AL_V3_FirstHeartAppears")
  wait(0.8)
  ClearAllCameraAttributesTimed(0.5)
  if GetGlobal("AL_BlotInvasionInProgress") == 2 then
    SetGlobal("AL_V3_EnemiesKilled", 1)
  else
    StartWave2()
  end
  V3_AL_CheckState()
end
V3_AL_Wave1Complete = L0_0
function L0_0()
  if GetGlobal("AL_BlotInvasionInProgress") == 0 then
    if GetPrefabData("AL_AI_WaveCombat").EnemiesFriended < 2 then
      SetPropertyInt("ALV3_Wave2Spawner_Melee", "Number To Spawn", 3, 0)
      GetPrefabData("AL_AI_WaveCombat").Total_Enemies_InWave = 4 + GetPrefabData("AL_AI_WaveCombat").EnemiesFriended
    elseif GetPrefabData("AL_AI_WaveCombat").EnemiesFriended > 4 then
      SetPropertyInt("ALV3_Wave2Spawner_Melee", "Number To Spawn", 1, 0)
      GetPrefabData("AL_AI_WaveCombat").Total_Enemies_InWave = 2 + GetPrefabData("AL_AI_WaveCombat").EnemiesFriended
    end
    GetPrefabData("AL_AI_WaveCombat").WaveCompleteFunction = "V3_AL_InvasionComplete"
    GetPrefabData("AL_AI_WaveCombat").EnemyEntityGroup = "ALV3_Wave2Enemies"
  end
end
StartWave2 = L0_0
function L0_0()
  SetGlobal("AL_V3_EnemiesKilled", 1)
  V3_AL_EnableInteriors()
end
V3_AL_InvasionComplete = L0_0
function L0_0()
  RestrictCutSceneInput()
  PauseAllAI()
  wait(3)
  SetPropertyFloat("ToMSProjector", "UsableRadius", 3.5)
  SetGlobal("AL_BlotInvasionInProgress", 2)
  StartFadeOut(0.8)
  HideHud()
  Print("Prepare Streaming")
  wait(0.9)
  V3_AL_StreamNPCWithoutWait()
  FireSequence("hub_adventureland_v3.GusStandIn", "AL_V3_InvasionOver")
  StartFadeIn(0.8)
  AudioPostEventOn(GetPlayer(), "Stop_music_Hub_Infestation")
  wait(0.7)
end
V3_AL_CheckState = L0_0
function L0_0()
  Print("Streaming NOW...")
  StreamZones(nil, "alvisit3npc_wsound")
  ActivateScene("environments/meanstreets/HUB_Adventureland_V3_NPC.gsa")
  StreamInterior(nil, "alv3_defaultinterior")
  WaitForLevelLoad()
  wait(0.01)
  Enable("ALV3_Spawner_NPCs")
  V3_AL_Daisy()
  AudioPostEventOn(GetPlayer(), "Stop_music_Blot_Interior")
  UnpauseAllAI()
  V3_AL_EnableInteriors()
end
V3_AL_StreamNPCWithoutWait = L0_0
function L0_0()
  Print("Streaming NOW...")
  StreamZones(nil, "alvisit3npc_wsound")
  StreamInterior(nil, "alv3_defaultinterior")
  Wait(0.1)
  WaitForLevelLoad()
  Enable("ALV3_Spawner_NPCs")
  V3_AL_Daisy()
  Wait(0.1)
  Disable("TreeHouseDoor")
  StartFadeInNoHUD()
  wait(0.5)
  AudioPostEventOn(GetPlayer(), "Stop_music_Blot_Interior")
  V3_AL_EnableInteriors()
end
V3_AL_StreamNPC = L0_0
function L0_0()
  Print("**********************Enabling Interiors")
  Enable("TikiFrontDoorTrigger")
  Disable("TreeHouseDoor")
  Enable("TikiHutProximityTrigger")
  Enable("TikiBackDoor")
  if GetGlobal("VL_NoPirates") == 1 then
    Print("Enable Hut Shop")
    Enable("HutShopProximityTrigger")
    Enable("HutShopDoorTrigger")
  end
end
V3_AL_EnableInteriors = L0_0
function L0_0()
  if GetGlobal("AL_V2_ReAssemble_Played") == 1 then
    Enable("ALV3_Spawner_Daisy")
  else
    Enable("ALV3_Spawner_DaisyHead")
  end
end
V3_AL_Daisy = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "ALV3_Wave1Enemies")
  Enable("ALV3_Spawner_NPCs")
  Enable("ALV3_Spawner_Daisy")
  Enable("TikiHutProximityTrigger")
end
DEBUG_V3_AL_InvasionComplete = L0_0
function L0_0(A0_3, A1_4)
  Print("********TENTACLE DESTROYED********** TentacleNum: " .. A1_4)
  AnimGBSequence(A0_3, "Pop")
  wait(2.25)
  DestroyEntity(A0_3)
  AnimGBSequence(A1_4, "Wilt")
  wait(2)
  DestroyEntity(A1_4)
end
AL_DestroyTentacle = L0_0
function L0_0(A0_5, A1_6, A2_7)
  Print("********TENTACLE HIT********** TentacleNum: " .. A1_6 .. ", NEXT Boil: " .. A2_7)
  AnimGBSequence(A0_5, "Pop")
  wait(2.25)
  AnimGBSequence(A2_7, "Grow")
  SetPropertyBool(A2_7, "ForceInvulnerable", false)
  DestroyEntity(A0_5)
end
AL_DamageTentacle = L0_0
function L0_0()
  wait(1.3)
  ForEachEntityInGroup(ForceSketched, "levelgeo3")
  wait(0.5)
  ForEachEntityInGroup(ForceSketched, "levelgeo2")
  wait(0.5)
  ForEachEntityInGroup(ForceSketched, "levelgeo1")
end
AL_StaggerSketched = L0_0
function L0_0()
  ForEachEntityInGroup(ForcePainted, "levelgeo3")
  wait(1.3)
  ForEachEntityInGroup(ForcePainted, "levelgeo2")
  wait(1.3)
  ForEachEntityInGroup(ForcePainted, "levelgeo1")
end
AL_StaggerPainted = L0_0
function L0_0()
  FireSequence("Tiki Sam", "MSS_MuseumIdleChatV6_Chatter")
end
TikiSamInvasion = L0_0
