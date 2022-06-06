local L0_0, L3_1
function L0_0()
  if VL_V2NP_SkipIntro == false then
    VL_V2NP_SkipIntro = true
    VL_V2NP_SaveInitialCheckpoint = true
    SetGlobal("HUB_startposition", 2)
    SetGlobal("MS_adventurelandopen", 1)
    SetGlobal("AL_AdventurelandProgress", 2)
    VL_Setup_Launcher("VLPiratesStart")
  end
end
ALV2NoPirates_AlwaysSetup_Launcher = L0_0
L0_0 = false
VL_V2NP_SkipIntro = L0_0
L0_0 = false
VL_V2NP_SaveInitialCheckpoint = L0_0
function L0_0()
  VL_V2NP_SaveInitialCheckpoint = true
  ALV2NoPirates_AlwaysSetup()
end
VL_Projector_SetupV2NP = L0_0
function L0_0()
  Print("Setting up Ventureland visit 2 no pirates")
  VL_V2NP_SkipIntro = true
  StreamInterior(nil, "alv2_np_defaultinterior")
  WaitForLevelLoad()
  GuardianPrefab_PopulateGuardians("MSGuardianSpawner")
  if GetGlobal("MS_MeanStreetProgress") == 1 then
    SetGlobal("MS_MeanStreetProgress", 4)
  end
  if GetGlobal("PowerSparks") == 0 then
    SetGlobal("PowerSparks", 10)
  end
  SetGlobal("MS_adventurelandopen", 1)
  SetGlobal("AL_AdventurelandProgress", 2)
  SetGlobal("VL_NoPirates", 1)
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
  if GetGlobal("AL_V2_PlantsDone_Played") == 0 then
    ForEachEntityInGroup(ForceSketched, "AL_V2_Plants")
    SetGlobal("AL_V2_PlantCount", 0, true)
  end
  if GetGlobal("AL_V2_ReAssemble") == 1 then
    Unhide("Daisy_Hint")
  end
  if GetGlobal("Smee No Pirates Return_Played") == 1 then
    DestroyEntity(GetEntity("hub_adventureland_v2_nopirates.HappySmee"))
  end
  SetGlobal("VL_PlantsLeftVL", 40 - GetGlobal("AL_V2_PlantCount"), true)
  if GetGlobal("AL_V2_MaskSketchProduced") == 1 then
    DestroyEntity("hub_adventureland_v2_nopirates.Ability_TVSketchPaint 01")
  else
    Hide("hub_adventureland_v2_nopirates.Ability_TVSketchPaint 01")
  end
  if GetGlobal("AL_V2_ReAssemble_Played") == 1 then
    DestroyEntity(GetEntity("hub_adventureland_v2_nopirates.DaisyHead 02"))
    Unhide("hub_adventureland_v2_nopirates.AnimatronicDaisy")
    MoveToEntity("hub_adventureland_v2_nopirates.AnimatronicDaisy", "Daisy_PositionMarker")
    Print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$Checking for daisy")
  end
  if GetGlobal("AL_V2_HutShopOpened") == 1 then
    DestroyEntity("Jungle Store Supplies")
  else
    SetGlobal("Global_SuppliesCollected", 0)
  end
  if GetGlobal("AL_V2_FlythroughPlayed") == 0 then
    SetGlobal("AL_V2_FlythroughPlayed", 1)
    AnimGBSequence("hub_adventureland_static.AL_Mercado_Door01 01", "Open")
    GetPrefabData("VLPiratesStart").SkipSideCameraRelease = "True"
    FireUser1("AL_V2_CameraLaunch")
  end
  if GetGlobal("AL_V2_ReAssemble_Played") == 1 then
    DestroyEntity(GetEntity("hub_adventureland_v2_nopirates.DaisyHead 02"))
    Unhide("hub_adventureland_v2_nopirates.AnimatronicDaisy")
  end
  if GetGlobal("MS_V4_DetectiveQuestInProgress") == 1 then
    ForEachEntityInGroup(Unhide, "V4FootprintAssett")
  else
    ForEachEntityInGroup(Hide, "V4FootprintAssett")
  end
  GetPrefabData("VLMeanStreetStart").ToFlyThrough = "False"
  VL_SetupMap()
  if VL_V2NP_SaveInitialCheckpoint == true then
    VL_V2NP_SaveInitialCheckpoint = false
    VL_CheckpointSave()
  end
end
ALV2NoPirates_AlwaysSetup = L0_0
function L0_0()
  StartFadeOut(0.7)
  wait(0.7)
  TeleportToEntity(GetPlayer(), "hub_adventureland_v2_nopirates.EntranceFromPirates")
  UnrestrictCutSceneInput()
  wait(0.01)
  CameraReset()
  wait(0.01)
  FireSequence("hub_adventureland_v2_nopirates.HappySmee", "Smee No Pirates Return")
end
AL_V2_PrepareSmeeCutscene = L0_0
function L0_0()
  wait(1.5)
  StartFadeOut(1)
  wait(1.1)
  DestroyEntity(GetEntity("hub_adventureland_v2_nopirates.HappySmee"))
  AnimGBSequence("hub_adventureland_static.AL_Mercado_Door01 01", "Rest")
  wait(0.2)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
  CameraReset()
  StartFadeIn()
  UnrestrictCutSceneInput()
  SetCharacterInConversation(GetPlayer(), 0)
  VL_CheckpointSave()
  NewBaseCamera()
end
SmeeLeaves = L0_0
function L0_0()
  GiveCollectible("Animatronic_Daisy")
  wait(3.5)
  StartFadeOut(1)
  wait(1.1)
  PlayAndUnlockMovie("AL_visit2_Restoration_of_Daisy.bik", "AL_visit2_Restoration_of_Daisy ")
  DestroyEntity(GetEntity("hub_adventureland_v2_nopirates.DaisyHead 02"))
  Unhide("hub_adventureland_v2_nopirates.AnimatronicDaisy")
  TeleportToEntity(GetPlayer(), "hub_adventureland_v2_nopirates.DaisyReassembledMickeyPos")
  wait(0.2)
  StartFadeIn()
  ClearAllCameraAttributes()
  UnrestrictCutSceneInput()
  VL_CheckpointSave()
end
RestoreDaisy = L0_0
function L0_0()
  if GetGlobal("Daisy Find Donald_Played") == 1 and GetGlobal("DaisyAteTheTV") == 0 then
    SetGlobal("DaisyAteTheTV", 1)
    wait(2)
    VL_CheckpointSave()
  end
end
DaisyEatsTV = L0_0
L0_0 = 0
L3_1 = 0
function MaskShake(A0_2)
  if _UPVALUE0_ == 0 and _UPVALUE1_ < 5 then
    _UPVALUE0_ = 1
    AnimGBReset("hub_adventureland_static.TikiHutDecoration")
    wait(0.01)
    AnimGBSequence("hub_adventureland_static.TikiHutDecoration", "Hit")
    _UPVALUE2_ = _UPVALUE2_ + 1
    wait(0.7)
    _UPVALUE0_ = 0
    _UPVALUE1_ = _UPVALUE1_ + 1
  elseif _UPVALUE1_ >= 5 and GetGlobal("AL_V2_MaskSketchProduced") == 0 then
    Unhide("hub_adventureland_v2_nopirates.Ability_TVSketchPaint 01")
    Enable("hub_adventureland_v2_nopirates.Ability_TVSketchPaint 01")
    ForceSequence("hub_adventureland_v2_shared.GusConvoV2", "AL_V2_PuzzleMaskUpdate")
    SetGlobal("AL_V2_MaskSketchProduced", 1)
  end
end
function CollectSupplies()
  IncrementGlobal("Global_SuppliesCollected")
end
