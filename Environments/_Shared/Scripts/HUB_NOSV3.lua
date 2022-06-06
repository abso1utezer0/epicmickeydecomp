local L0_0, L1_1
function L0_0()
  if NO_V3_SkipIntro == false then
    NO_V3_SkipIntro = true
    NO_V3_SaveInitialCheckpoint = true
    SetGlobal("HUB_startposition", 1)
    SetGlobal("MS_MeanStreetProgress", 6)
    SetGlobal("NO_NewOrleansProgress", 3)
    SetGlobal("MS_InvasionRepelled", 1)
    SetGlobal("AL_BlotInvasionInProgress", 2)
    SetGlobal("MS_adventurelandopen", 1)
    SetGlobal("MS_neworleansopen", 1)
    NO_Setup_Launcher("NOSBogStart")
  end
end
NOV3_AlwaysSetup_Launcher = L0_0
L0_0 = false
NO_V3_SkipIntro = L0_0
L0_0 = false
NO_V3_SaveInitialCheckpoint = L0_0
function L0_0()
  NO_V3_SaveInitialCheckpoint = true
  NOV3_AlwaysSetup()
end
NO_Projector_SetupV3 = L0_0
function L0_0()
  if GetGlobal("NO_tentdestroy") == 1 then
    V3_NO_StreamNPCNoFade()
  else
    ActivateScene("environments/meanstreets/HUB_NOSquare_V3_AI.gsa")
  end
  StartTrackingCurrentLevelForScoring("NO_BE_JigSaw")
  Print("Setting up NOS visit 3")
  NO_V3_SkipIntro = true
  if GetGlobal("NO_bellcompleted") == 1 then
    Unhide("TownSquareBell")
  else
    Hide("TownSquareBell")
  end
  NO_V3_SkipIntro = true
  StreamInterior(nil, "bog_ship")
  Disable("hub_nosquare_camera.Trigger_GateOverride")
  SetGlobal("MS_MeanStreetProgress", 6)
  SetGlobal("NO_NewOrleansProgress", 3)
  if GetGlobal("NO_tentdestroy") == 1 then
    Enable("hub_nosquare.BogShopDoorOpenTrig")
    Enable("hub_nosquare.DoorTriggerBogShop")
    V3_NO_EnableNPCs()
    V3_NO_Donald()
    V3_NO_EnableInteriors()
    ForEachEntityInGroup(DestroyEntity, "hub_nosquare_v3.TentacleHearts")
    ForEachEntityInGroup(DestroyEntity, "hub_nosquare_v3.TentacleHearts2")
    ForEachEntityInGroup(DestroyEntity, "hub_nosquare_v3.TentacleHearts3")
    DestroyEntity("hub_nosquare_v3.HeartTentacleA1_Inert 07")
    DestroyEntity("hub_nosquare_v3.NOS_Tentacles 01")
    Prefab_Projector_ChangeState("NOSBogStart", "Activate")
  else
    ForEachEntityInGroup(ForceSketched, "NOS_V3_SketchedToon")
    SetGlobal("NO_tentdestroy", 0)
    MultiPosSoundStart("Sound_Marker_BE_Tentacle_1_Controller")
    MultiPosSoundStart("Sound_Marker_BE_Tentacle_2_Controller")
    MultiPosSoundStart("Sound_Marker_BE_Tentacle_3_Controller")
    Print("NDEV**********Activate Spawners visit 3***********VEDN")
    ForEachEntityInGroup(Enable, "hub_nosquare_v3_Spawners_Tent1")
    ForEachEntityInGroup(Enable, "hub_nosquare_v3_Spawners_Tent2")
    if GetGlobal("NO_bellcompleted") == 0 then
      ForEachEntityInGroup(Enable, "hub_nosquare_v3_Spawners_Blob")
    end
    ForEachEntityInGroup(Enable, "hub_nosquare_v3_Spawners_Tent3")
    V3_NO_DisableInteriors()
  end
  if GetGlobal("NO_bellcompleted") == 1 then
    Hide("hub_nosquare_v3.HeartTentacleA1_Inert 07")
    Hide("hub_nosquare_v3.Tentacle3")
  end
  if GetGlobal("NO_signget") == 1 then
    Unhide("hub_nosquare_dynamic.BogStoreSign")
  end
  if GetGlobal("NO_V3_Intro") == 0 then
    SetGlobal("NO_V3_Intro", 1)
    GetPrefabData("NOSBogStart").ToFlyThrough = "True"
    FireSequence("hub_nosquare_v3.ConversationalTrigger 01", "NO_Gus_BlotBattleStart")
    Prefab_Projector_ChangeState("NOSBogStart", "Deactivate")
  else
    GetPrefabData("NOSBogStart").ToFlyThrough = "False"
    Enable("ZoneInMSCameraTriggerv3")
    SetCameraAttributes("ZoneInMSCameraTriggerv3")
    UnrestrictCutSceneInput()
  end
  NO_SetDefaultCamera()
  NO_SetupMap()
  wait(3)
  if NO_V3_SaveInitialCheckpoint == true then
    NO_V3_SaveInitialCheckpoint = false
    NO_CheckpointSave()
  end
end
NOV3_AlwaysSetup = L0_0
function L0_0()
  SetGlobal("NOS_NumTentalcesDestroyed", GetGlobal("NOS_NumTentalcesDestroyed") - 1)
  if GetGlobal("NOS_NumTentalcesDestroyed") == 0 then
    NO_alltentdead()
  end
end
CheckComplete = L0_0
function L0_0(A0_2, A1_3)
  AnimGBSequence(A0_2, "Pop")
  wait(2.25)
  AnimGBSequence(A1_3, "Grow")
  SetPropertyBool(A1_3, "ForceInvulnerable", false)
  DestroyEntity(A0_2)
end
BE_DamageTentacle1 = L0_0
function L0_0(A0_4, A1_5)
  AnimGBSequence(A0_4, "Pop")
  wait(2.25)
  AnimGBSequence(A1_5, "Wilt")
  FireThread(BE_Tentacle_ExplodeSound, "Sound_Marker_BE_Tentacle_1_Controller")
  Wait(3.5)
  DestroyEntity("BE_Tentacle1")
  DisableGuardianHint("hub_nosquare_v3.PlayerHintMarkers 03")
  CheckComplete()
end
BE_DestroyTentacle1 = L0_0
function L0_0(A0_6, A1_7)
  AnimGBSequence(A0_6, "Pop")
  wait(2.25)
  AnimGBSequence(A1_7, "Grow")
  SetPropertyBool(A1_7, "ForceInvulnerable", false)
  DestroyEntity(A0_6)
end
BE_DamageTentacle2 = L0_0
function L0_0(A0_8, A1_9)
  AnimGBSequence(A0_8, "Pop")
  wait(2.25)
  AnimGBSequence(A1_9, "Wilt")
  FireThread(BE_Tentacle_ExplodeSound, "Sound_Marker_BE_Tentacle_2_Controller")
  wait(3.5)
  DestroyEntity("BE_Tentacle2")
  DisableGuardianHint("hub_nosquare_v3.PlayerHintMarkers 04")
  CheckComplete()
end
BE_DestroyTentacle2 = L0_0
function L0_0(A0_10, A1_11)
  AnimGBSequence(A0_10, "Pop")
  wait(2.25)
  AnimGBSequence(A1_11, "Grow")
  SetPropertyBool(A1_11, "ForceInvulnerable", false)
  DestroyEntity(A0_10)
end
BE_DamageTentacle3 = L0_0
function L0_0(A0_12, A1_13)
  AnimGBSequence(A0_12, "Pop")
  wait(2.25)
  AnimGBSequence(A1_13, "Wilt")
  FireThread(BE_Tentacle_ExplodeSound, "Sound_Marker_BE_Tentacle_3_Controller")
  wait(3.5)
  DestroyEntity("BE_Tentacle3")
  DisableGuardianHint("hub_nosquare_v3.PlayerHintMarkers 02")
  CheckComplete()
end
BE_DestroyTentacle3 = L0_0
function L0_0(A0_14)
  wait(1)
  MultiPosSoundStop(A0_14)
  AudioPostEventOn(A0_14, "Play_sfx_IB_Blot_Tentacle_Explosion")
end
BE_Tentacle_ExplodeSound = L0_0
L0_0 = 15
total_enemies = L0_0
L0_0 = 0
total_enemies_done = L0_0
function L0_0()
  total_enemies_done = total_enemies_done + 1
  NO_V3_EnemiesDealthWith()
  Print(total_enemies_done)
end
NO_V3_EnemyDeath = L0_0
function L0_0(A0_15)
  if GetCurrentTeam(A0_15) == 3 then
    total_enemies_done = total_enemies_done + 1
    Print(total_enemies_done)
    NO_V3_EnemiesDealthWith()
  else
    total_enemies_done = total_enemies_done - 1
    Print(total_enemies_done)
  end
end
NO_V3_EnemyTeamChange = L0_0
function L0_0()
  if total_enemies == total_enemies_done and GetGlobal("NO_tentdestroy") == 1 then
    SetGlobal("NO_Visit3AllClear", 1)
    V3_NO_EnableInteriors()
    Wait(6)
    NO_CheckpointSave()
  end
end
NO_V3_EnemiesDealthWith = L0_0
L0_0 = 0
HUB_NOSV3_TentacleTrack = L0_0
function L0_0()
  local L1_16
  L1_16 = 0
  HUB_NOSV3_TentacleTrack = L1_16
end
TentacleTrack1 = L0_0
function L0_0()
  local L1_17
  L1_17 = 1
  HUB_NOSV3_TentacleTrack = L1_17
end
TentacleTrack2 = L0_0
function L0_0()
  local L1_18
  L1_18 = 2
  HUB_NOSV3_TentacleTrack = L1_18
end
TentacleTrack3 = L0_0
function L0_0()
  SetGlobal("NO_invasionrepelled", 1)
  SetGlobal("NO_tentdestroy", 1)
  Disable("spawnsideone")
  Disable("spawnsidetwo")
  Disable("spawnmid")
  Hide("hub_nosquare_v3.PlaneTrigger 01")
  AudioPostEventOn(GetPlayer(), "Stop_music_Blot_Interior")
  wait(1)
  AudioPostEventOn(GetPlayer(), "Play_MX_Stinger_Success")
  V3_NO_StreamNPC()
  ForceSequence("hub_nosquare_v3.ConversationalTrigger 01", "NO_gustent")
  wait(0.8)
  if HUB_NOSV3_TentacleTrack == 0 then
    MoveToEntity(GetPlayer(), "hub_nosquare_v3.Marker(Rotatable) 01")
  elseif HUB_NOSV3_TentacleTrack == 1 then
    MoveToEntity(GetPlayer(), "hub_nosquare_v3.Marker(Rotatable) 02")
  elseif HUB_NOSV3_TentacleTrack == 2 then
    MoveToEntity(GetPlayer(), "hub_nosquare_v3.Marker(Rotatable) 03")
  end
  Prefab_Projector_ChangeState("NOSBogStart", "Activate")
  Enable("hub_nosquare.BogShopDoorOpenTrig")
  Enable("hub_nosquare.DoorTriggerBogShop")
  V3_NO_EnableInteriors()
  ForEachEntityInGroup(DestroyEntity, "hub_nosquare_v3.Tentacles")
  ForEachEntityInGroup(DestroyEntity, "hub_nosquare_v3.TentacleHearts")
  DestroyEntity("hub_nosquare_v3.HeartTentacleA1_Inert 07")
  ForEachEntityInGroup(Disable, "hub_nosquare_v3_Spawners_Tent1")
  ForEachEntityInGroup(Disable, "hub_nosquare_v3_Spawners_Tent2")
  ForEachEntityInGroup(Disable, "hub_nosquare_v3_Spawners_Blob")
  Wait(2)
  wait(6)
  Enable("hub_nosquare_v3.Spawner 01")
  NO_CheckpointSave()
end
NO_alltentdead = L0_0
function L0_0()
  Print("Streaming NOW...")
  StreamZones(nil, "novisit3npc_wsound")
  ActivateScene("environments/meanstreets/HUB_NOSquare_V3_NPC.gsa")
  Wait(0.1)
  WaitForLevelLoad()
  V3_NO_EnableNPCs()
  V3_NO_Donald()
end
V3_NO_StreamNPCNoFade = L0_0
function L0_0()
  StartFadeOut(0.8)
  Wait(0.8)
  Print("Streaming NOW...")
  StreamZones(nil, "novisit3npc_wsound")
  ActivateScene("environments/meanstreets/HUB_NOSquare_V3_NPC.gsa")
  Wait(0.1)
  WaitForLevelLoad()
  V3_NO_EnableNPCs()
  V3_NO_Donald()
  Wait(0.1)
  StartFadeInNoHUD()
end
V3_NO_StreamNPC = L0_0
function L0_0()
  Enable("hub_nosquare.DoorTriggerShack")
  Enable("hub_nosquare.ShackDoorOpenTrig")
  Enable("hub_nosquare_ship.ShipEnterTrigger")
  Enable("hub_nosquare.BogShopDoorOpenTrig")
  Enable("hub_nosquare.DoorTriggerBogShop")
  Enable("hub_nosquare_v3_npc.Spawner_NPC_Bertrand")
  if GetGlobal("NO_storeopened") == 1 then
    Enable("hub_nosquare.BogShopDoorOpenTrig")
  else
    Disable("hub_nosquare.BogShopDoorOpenTrig")
  end
end
V3_NO_EnableInteriors = L0_0
function L0_0()
  Disable("hub_nosquare.DoorTriggerShack")
  Disable("hub_nosquare.ShackDoorOpenTrig")
  Disable("hub_nosquare.BogShopDoorOpenTrig")
  Disable("hub_nosquare_ship.ShipEnterTrigger")
end
V3_NO_DisableInteriors = L0_0
function L0_0()
  if GetGlobal("NO_DonaldFMV_Played") == 1 then
    Enable("hub_nosquare_v3_npc.Spawner_NPC_Donald")
  end
end
V3_NO_Donald = L0_0
function L0_0()
  Enable("hub_nosquare_v3_npc.Spawner_NPC_Metairie")
  Enable("hub_nosquare_v3_npc.Spawner_NPC_Louis")
  Enable("hub_nosquare_v3_npc.Spawner_NPC_Millicent")
  Enable("hub_nosquare_v3_npc.Spawner_NPC_Florence")
  Prefab_Projector_ChangeState("NOSBogStart", "Activate")
end
V3_NO_EnableNPCs = L0_0
function L0_0()
  if GetGlobal("NO_invasionrepelled") == 0 then
    Print("*******************Bog Easy: Kill side one")
    ForEachEntityInGroup(Disable, "hub_nosquare_v3_Spawners_Tent2")
    ForEachEntityInGroup(Disable, "hub_nosquare_v3_Spawners_Blob")
    ForEachEntityInGroup(Enable, "hub_nosquare_v3_Spawners_Tent1")
  end
end
NO_Enter_SteamBoatZone = L0_0
function L0_0()
  if GetGlobal("NO_invasionrepelled") == 0 then
    Print("*******************Bog Easy: Kill side two")
    ForEachEntityInGroup(Enable, "hub_nosquare_v3_Spawners_Tent2")
    if GetGlobal("NO_bellcompleted") == 0 then
      ForEachEntityInGroup(Enable, "hub_nosquare_v3_Spawners_Blob")
    end
    ForEachEntityInGroup(Disable, "hub_nosquare_v3_Spawners_Tent1")
  end
end
NO_Enter_BogEasyZone = L0_0
