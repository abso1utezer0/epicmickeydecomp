local L0_0, L1_1
function L0_0()
  if VL_V2P_SkipIntro == false then
    VL_V2P_SkipIntro = true
    VL_V2P_SaveInitialCheckpoint = true
    SetGlobal("HUB_startposition", 2)
    SetGlobal("MS_adventurelandopen", 1)
    SetGlobal("AL_AdventurelandProgress", 3)
    SetGlobal("PotW_EndLevelCutscene", 1)
    VL_Setup_Launcher("VLPiratesStart")
  end
end
ALV2Pirates_AlwaysSetup_Launcher = L0_0
L0_0 = false
VL_V2P_SkipIntro = L0_0
L0_0 = false
VL_V2P_SaveInitialCheckpoint = L0_0
function L0_0()
  VL_V2P_SaveInitialCheckpoint = true
  ALV2Pirates_AlwaysSetup()
end
VL_Projector_SetupV2P = L0_0
function L0_0()
  Print("Setting up Ventureland visit 2 with pirates")
  VL_V2P_SkipIntro = true
  StreamInterior(nil, "alv2_p_defaultinterior")
  WaitForLevelLoad()
  GuardianPrefab_PopulateGuardians("MSGuardianSpawner")
  if GetGlobal("MS_MeanStreetProgress") == 1 then
    SetGlobal("MS_MeanStreetProgress", 4)
  end
  if GetGlobal("PowerSparks") == 0 then
    SetGlobal("PowerSparks", 10)
  end
  SetGlobal("AL_V3_PiratesPresent", 1)
  SetGlobal("MS_adventurelandopen", 1)
  SetGlobal("AL_AdventurelandProgress", 3)
  SetGlobal("PotW_EndLevelCutscene", 1)
  Unhide("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Weight 01")
  Unhide("hub_adventureland_dynamic.AL_P_CompassA1_Toon_01 01")
  AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Weight 01", "Appear")
  AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_ShipWheel 01", "Appear")
  AnimGBSequence("hub_adventureland_static.AL_Mercado_Door01 01", "Rest")
  AnimGBSequence("hub_adventureland_dynamic.AL_P_CompassA1_Toon_01 01", "Appear")
  AnimGBSequence("hub_adventureland_dynamic.AL_CrowsNestTower_01 01", "RotateLoop")
  AudioPostEventOn("hub_adventureland_audio.CrowsNest_Loop", "Play_Crows_Nest_Loop")
  AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Parts 01", "Loop")
  AudioPostEventOn("hub_adventureland_audio.Bellows", "Play_sfx_AdvLnd_Bellow")
  AudioPostEventOn("hub_adventureland_audio.Pump", "Play_sfx_advlnd_Pump")
  AudioPostEventOn("hub_adventureland_audio.WheelLinkage", "Play_sfx_AdvntLnd_Wheel_LinkageLP")
  AudioPostEventOn("hub_adventureland_audio.WheelPulley1", "Play_sfx_AdvntLnd_Wheel_Pulleys")
  AudioPostEventOn("hub_adventureland_audio.WheelPulley2", "Play_sfx_AdvntLnd_Wheel_Pulleys")
  AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Parts 01", "Loop")
  AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_ShipWheel 01", "Loop")
  AnimGBSequence("hub_adventureland_dynamic.AL_P_CompassA1_Toon_01 01", "Loop")
  AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Weight 01", "Loop")
  AnimGBSequence("hub_adventureland_static.AL_Mercado_Door01 01", "Rest")
  if GetGlobal("AL_Smee_StayingHere_Played") == 1 then
    TeleportToEntity(GetEntity("hub_adventureland_v2_pirates.HappySmee 01"), "hub_adventureland_v2_pirates.SmeeStandSpot")
  else
    TeleportToEntity(GetEntity("hub_adventureland_v2_pirates.HappySmee 01"), "hub_adventureland_v2_pirates.SmeeFirstStart")
  end
  if GetGlobal("AL_V2_ReAssemble_Played") == 1 then
    Unhide("Daisy_Hint")
  end
  if GetGlobal("AL_V1_IceCream_Delivered") == 1 then
    DestroyEntity("DamienSalt_Hint")
  else
    DestroyEntity("Blake_Hint")
  end
  if GetGlobal("AL_V2_ReAssemble_Played") == 1 then
    DestroyEntity(GetEntity("hub_adventureland_v2_pirates.DaisyHead 01"))
    Unhide("hub_adventureland_v2_pirates.AnimatronicDaisy")
  end
  if GetGlobal("AL_V1_IceCream_Delivered") == 1 then
    AnimVarInt("hub_adventureland_v1.Damien Salt", VAR_Mood_Type, MOOD_Negative)
  elseif GetGlobal("AL_V1_Flowers_Delivered") == 1 then
    TeleportToEntity("hub_adventureland_v2_pirates.Damien Salt 01", "hub_adventureland_v2_pirates.DamienSpot")
    TeleportToEntity("hub_adventureland_v2_pirates.Henrietta 01", "hub_adventureland_v2_pirates.HenriettaSpot")
    AnimVarInt("hub_adventureland_v2_pirates.Henrietta 01", VAR_Mood_Type, MOOD_Positive)
    AnimVarInt("hub_adventureland_v2_pirates.Henrietta 01", VAR_NPC_State, 0)
  end
  if GetGlobal("AL_V2_MovingIn_Played") == 1 then
    TeleportToEntity("hub_adventureland_v2_pirates.Damien Salt 01", "hub_adventureland_treehouseinterior.PirateOccupantMarker 01")
    AnimVarInt("hub_adventureland_v2_pirates.Damien Salt 01", VAR_Mood_Type, MOOD_Positive)
    TeleportToEntity("hub_adventureland_v2_pirates.Henrietta 01", "hub_adventureland_treehouseinterior.Henrietta Occupant Marker")
    AnimVarInt("hub_adventureland_v2_pirates.Henrietta 01", VAR_Mood_Type, MOOD_Positive)
    AnimVarInt("hub_adventureland_v2_pirates.Henrietta 01", VAR_NPC_State, 0)
  elseif GetGlobal("AL_V2_Housequery_Played") == 1 then
    TeleportToEntity("hub_adventureland_v2_pirates.BlakeBlackheart", "hub_adventureland_treehouseinterior.PirateOccupantMarker 01")
    AnimVarInt("hub_adventureland_v2_pirates.BlakeBlackheart", VAR_Mood_Type, MOOD_Positive)
  end
  if GetGlobal("AL_V2_ThanksforGift_Played") == 1 then
    Unhide("hub_adventureland_v2_pirates.CollectibleMask1 01")
  end
  if GetGlobal("MS_V4_DetectiveQuestInProgress") == 1 then
    ForEachEntityInGroup(Unhide, "V4FootprintAssett")
  else
    ForEachEntityInGroup(Hide, "V4FootprintAssett")
  end
  if GetGlobal("AL_V1_IceCream_Delivered") == 0 and GetGlobal("AL_V1_Flowers_Delivered") == 0 then
    SetGlobal("AL_V1_IceCream_Delivered", 1)
  end
  if GetGlobal("AL_V2_FlythroughPlayed") == 0 then
    SetGlobal("AL_V2_FlythroughPlayed", 1)
    AnimGBSequence("hub_adventureland_static.AL_Mercado_Door01 01", "Open")
    GetPrefabData("VLPiratesStart").SkipSideCameraRelease = "True"
    FireUser1("AL_V2_CameraLaunch")
  end
  GetPrefabData("VLMeanStreetStart").ToFlyThrough = "False"
  VL_SetupMap()
  wait(0.2)
  if false == true and VL_V2P_SaveInitialCheckpoint == true then
    VL_V2P_SaveInitialCheckpoint = false
    VL_CheckpointSave()
  end
end
ALV2Pirates_AlwaysSetup = L0_0
function L0_0()
  IncrementGlobal("AL_V2_BarrelsDestroyed")
end
BreakBarrel = L0_0
function L0_0()
  StartFadeOut(1)
  wait(3.1)
  Hide("hub_adventureland_v2_pirates.Damien Salt 01")
  Hide("hub_adventureland_v2_pirates.Henrietta 01")
  SetGlobal("AL_TreeHouseOccupied", 1)
  AnimVarInt("hub_adventureland_v2_pirates.Damien Salt 01", VAR_Mood_Type, MOOD_Positive)
  AnimVarInt("hub_adventureland_v2_pirates.Henrietta 01", VAR_Mood_Type, MOOD_Positive)
  AnimVarInt("hub_adventureland_v2_pirates.Henrietta 01", VAR_NPC_State, 0)
  wait(0.1)
  StartFadeIn()
  ClearAllCameraAttributes()
  UnrestrictCutSceneInput()
  VL_CheckpointSave()
end
TreeHouseMoveInDamien = L0_0
function L0_0()
  StartFadeOut(1)
  wait(3.1)
  Hide("hub_adventureland_v2_pirates.Boson Blake 01")
  SetGlobal("AL_TreeHouseOccupied", 1)
  AnimVarInt("hub_adventureland_v2_pirates.Boson Blake 01", VAR_Mood_Type, MOOD_Positive)
  wait(0.1)
  StartFadeIn()
  ClearAllCameraAttributes()
  UnrestrictCutSceneInput()
  VL_CheckpointSave()
end
TreeHouseMoveInBlake = L0_0
function L0_0()
  StartFadeOut(0.7)
  wait(0.7)
  TeleportToEntity(GetPlayer(), "hub_adventureland_v2_pirates.EntranceFromPirates")
  UnrestrictCutSceneInput()
  wait(0.01)
  CameraReset()
  wait(0.01)
  FireSequence("hub_adventureland_v2_pirates.HappySmee 01", "AL_Smee_StayingHere")
end
AL_V2_PrepareSmeeCutscene = L0_0
function L0_0()
  GiveCollectible("Animatronic_Daisy")
  wait(4)
  StartFadeOut(1)
  wait(1.1)
  PlayAndUnlockMovie("AL_visit2_Restoration_of_Daisy.bik", "AL_visit2_Restoration_of_Daisy ")
  DestroyEntity(GetEntity("hub_adventureland_v2_pirates.DaisyHead 01"))
  Unhide("hub_adventureland_v2_pirates.AnimatronicDaisy")
  TeleportToEntity(GetPlayer(), "hub_adventureland_v2_pirates.DaisyReassembledMickeyPos")
  wait(0.2)
  StartFadeIn()
  ClearAllCameraAttributes()
  UnrestrictCutSceneInput()
  VL_CheckpointSave()
end
RestoreDaisy = L0_0
function L0_0()
  AnimGBSequence("hub_adventureland_static.AL_Mercado_Door01 01", "Rest")
  wait(0.7)
  AnimGBSequence("hub_adventureland_static.AL_Mercado_Door01 01", "Rest")
  TeleportToEntity(GetEntity("hub_adventureland_v2_pirates.HappySmee 01"), "hub_adventureland_v2_pirates.SmeeStandSpot")
  UnrestrictCutSceneInput()
  NewBaseCamera()
  VL_CheckpointSave()
  wait(0.7)
  ShowHud()
end
MoveSmee = L0_0
