local L0_0, L1_1
function L0_0()
  if VL_V1_SkipIntro == false then
    VL_V1_SkipIntro = true
    VL_V1_SaveInitialCheckpoint = true
    SetGlobal("HUB_startposition", 1)
    if GetGlobal("MS_MeanStreetProgress") == 1 then
      SetGlobal("MS_MeanStreetProgress", 3)
    end
    SetGlobal("MS_adventurelandopen", 1)
    SetGlobal("AL_AdventurelandProgress", 1)
    VL_Setup_Launcher("VLMeanStreetStart")
  end
end
ALV1_AlwaysSetup_Launcher = L0_0
L0_0 = false
VL_V1_SkipIntro = L0_0
L0_0 = false
VL_V1_SaveInitialCheckpoint = L0_0
function L0_0()
  VL_V1_SaveInitialCheckpoint = true
  ALV1_AlwaysSetup()
end
VL_Projector_SetupV1 = L0_0
function L0_0()
  Print("Setting up Ventureland visit 1")
  if GetGlobal("AL_V1_FlythroughPlayed") == 1 then
    StartFadeOut(0)
  end
  StreamInterior(nil, "alv1_defaultinterior")
  StartTrackingCurrentLevelForScoring("HUB_Adventureland")
  GuardianPrefab_PopulateGuardians("VLActionLevel")
  VL_V1_SkipIntro = true
  SetGlobal("MS_MeanStreetProgress", 3)
  SetGlobal("MS_adventurelandopen", 1)
  SetGlobal("AL_AdventurelandProgress", 1)
  if GetGlobal("AL_V1_FlythroughPlayed") == 0 then
    SetGlobal("AL_V1_FlythroughPlayed", 1)
    if GetConfigVariableBool("DisableIGC") == false then
      HUBAdventurelandlandFlythrough()
    else
      CameraReset()
      UnrestrictCutSceneInput()
    end
  else
    Print("----------------Flythrough happened----------------")
    GetPrefabData("VLMeanStreetStart").ToFlyThrough = "False"
    SetGlobal("VL_E3_GreetingPlayed", 1)
    Enable("hub_adventureland_static.TriggerProjectorCameraOverride 01")
    SetCameraAttributes("hub_adventureland_static.TriggerProjectorCameraOverride 01")
    wait(0.5)
    Print("----------------Fading in----------------")
    StartFadeIn(1)
  end
  SetUpMasks()
  HideTikiMasks()
  if GetGlobal("AL_V1_CompassChestOpened") == 1 then
    AnimGBSequence("hub_adventureland_v1.Open_Chest_Sequence", "Idle_Open")
    SetPropertyFloat("hub_adventureland_v1.Open_Chest_Sequence", "UsableRadius", 0)
    DestroyEntity("hub_adventureland_audio.Trigger_ChestLocked 01")
  end
  if GetGlobal("AL_V1_GotCompass") == 1 then
    Hide("hub_adventureland_v1.Pirate Compass 01")
    AnimVarInt("hub_adventureland_v1.Scurvy Pat", "VAR_NPC_State", 0)
  elseif GetGlobal("AL_V1_GotCompass") == 0 then
    AnimVarInt("hub_adventureland_v1.Scurvy Pat", "VAR_NPC_State", 2)
  end
  if GetGlobal("AL_GotTeddy") == 1 or GetGlobal("AL_V1_GotCompass") == 1 then
    ForEachEntityInGroup(DestroyEntity, "VLBear")
  end
  if GetGlobal("AL_V1_DamienChestOpened") == 1 then
    AnimGBSequence("hub_adventureland_v1.seq_openchest 01.Open_Chest_Sequence", "Idle_Open")
    SetPropertyFloat("hub_adventureland_v1.seq_openchest 01.Open_Chest_Sequence", "UsableRadius", 0)
    DestroyEntity("hub_adventureland_audio.Trigger_ChestLocked 01")
  elseif GetGlobal("AL_V1_Flowers_Delivered") == 1 and GetGlobal("AL_V1_DamienChestOpened") == 0 then
    SetPropertyFloat("hub_adventureland_v1.seq_openchest 01.Open_Chest_Sequence", "UsableRadius", 1)
  end
  if GetGlobal("AL_V1_IceCream_Delivered") == 1 then
    AnimVarInt("hub_adventureland_v1.Damien Salt", VAR_Mood_Type, MOOD_Negative)
  elseif GetGlobal("AL_V1_Flowers_Delivered") == 1 then
    TeleportToEntity("hub_adventureland_v1.Damien Salt", "hub_adventureland_v1.DamienLoveSpot")
    TeleportToEntity("hub_adventureland_v1.PedestrianFemaleCow 01", "hub_adventureland_v1.HenriettaLoveSpot")
    wait(0.1)
    AnimVarInt("hub_adventureland_v1.Damien Salt", VAR_NPC_State, 0)
    wait(0)
    AnimVarInt("hub_adventureland_v1.PedestrianFemaleCow 01", VAR_Mood_Type, MOOD_Positive)
    AnimVarInt("hub_adventureland_v1.PedestrianFemaleCow 01", VAR_NPC_State, 0)
  end
  if GetGlobal("AL_tortugaopened") == 1 then
    AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Parts 01", "Loop")
    wait(0.1)
    Unhide("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Weight 01")
    AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Weight 01", "Loop")
    wait(0)
    Unhide("hub_adventureland_dynamic.AL_Minihub_WaterWheel_ShipWheel 01")
    AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_ShipWheel 01", "Loop")
    wait(0)
    Unhide("hub_adventureland_dynamic.AL_P_CompassA1_Toon_01 01")
    AnimGBSequence("hub_adventureland_dynamic.AL_P_CompassA1_Toon_01 01", "Loop")
    AudioPostEventOn("hub_adventureland_audio.Bellows", "Play_sfx_AdvLnd_Bellow")
    AudioPostEventOn("hub_adventureland_audio.Pump", "Play_sfx_advlnd_Pump")
    AudioPostEventOn("hub_adventureland_audio.WheelLinkage", "Play_sfx_AdvntLnd_Wheel_LinkageLP")
    AudioPostEventOn("hub_adventureland_audio.WheelPulley1", "Play_sfx_AdvntLnd_Wheel_Pulleys")
    AudioPostEventOn("hub_adventureland_audio.WheelPulley2", "Play_sfx_AdvntLnd_Wheel_Pulleys")
    AnimGBSequence("hub_adventureland_static.AL_Mercado_Door01 01", "Open")
    Prefab_Projector_ChangeState("AL_PiratesProjector", "Activate")
    DestroyEntity("hub_adventureland_audio.Trigger_DoorLocked 01")
    AudioPostEventOn("hub_adventureland_audio.Sound_Marker_MercadoDoor", "Play_sfx_AdvntLnd_DoorOpen")
    AnimGBSequence("hub_adventureland_dynamic.AL_CrowsNestTower_01 01", "RotateLoop")
    AudioPostEventOn("hub_adventureland_audio.CrowsNest_Loop", "Play_Crows_Nest_Loop")
  end
  VL_SetupMap()
  if VL_V1_SaveInitialCheckpoint == true then
    VL_V1_SaveInitialCheckpoint = false
    VL_CheckpointSave()
  end
end
ALV1_AlwaysSetup = L0_0
function L0_0()
  SetGlobal("AL_V1_DamienChestOpened", 1)
end
SetDamienChestGlobal = L0_0
function L0_0()
  if GetGlobal("3 Tiki Masks Got_played") == 0 then
    Hide(GetEntity("CollectibleMask1"))
    Hide(GetEntity("CollectibleMask2"))
    Hide(GetEntity("CollectibleMask3"))
  end
  if GetGlobal("3 Tiki Masks Got_played") == 1 then
    Unhide(GetEntity("CollectibleMask1"))
    Unhide(GetEntity("CollectibleMask2"))
    Unhide(GetEntity("CollectibleMask3"))
  end
  if GetGlobal("Got Ships Wheel") == 1 then
    ForEachEntityInGroup(DestroyEntity, "TikiMaskPickups")
  end
end
HideTikiMasks = L0_0
function L0_0()
  if GetGlobal("GotTikiMask1") == 1 then
    ForEachEntityInGroup(DestroyEntity, "hub_adventureland_v1.Mask1Proxy")
  end
  if GetGlobal("GotTikiMask2") == 1 then
    ForEachEntityInGroup(DestroyEntity, "hub_adventureland_v1.Mask2Proxy")
  end
  if GetGlobal("GotTikiMask3") == 1 then
    ForEachEntityInGroup(DestroyEntity, "hub_adventureland_v1.Mask3Proxy")
  end
end
SetUpMasks = L0_0
function L0_0(A0_2, A1_3)
  IncrementGlobal("Masks_Possessed")
  SetGlobal(A1_3, 1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Pickup_FilmCanister")
end
GetTikiMask = L0_0
function L0_0()
  IncrementGlobal("AL_maskscollected")
end
AL_tikiannounceGood = L0_0
function L0_0()
  IncrementGlobal("AL_maskscollected")
  FireSequence("hub_adventureland_v1.GusConversation", "AL_V1_MaskStatusBad")
end
AL_tikiannounceBad = L0_0
function L0_0()
  TikiSamRelease()
  if GetGlobal("GotTikiMask1") == 1 and GetGlobal("AL_V1_Mask1AlreadyTurnedIn") == 0 then
    Unhide("hub_adventureland_v1.BackStoreMask1 01")
    SetGlobal("AL_V1_Mask1AlreadyTurnedIn", 1)
  elseif GetGlobal("GotTikiMask1") == 1 and GetGlobal("AL_V1_Mask1AlreadyTurnedIn") == 1 then
    Unhide("hub_adventureland_v1.BackStoreMask1 02")
  end
  if GetGlobal("GotTikiMask2") == 1 and GetGlobal("AL_V1_Mask2AlreadyTurnedIn") == 0 then
    Unhide("hub_adventureland_v1.BackStoreMask2 01")
    SetGlobal("AL_V1_Mask2AlreadyTurnedIn", 1)
  elseif GetGlobal("GotTikiMask2") == 1 and GetGlobal("AL_V1_Mask2AlreadyTurnedIn") == 1 then
    Unhide("hub_adventureland_v1.BackStoreMask2 02")
  end
  if GetGlobal("GotTikiMask3") == 1 and GetGlobal("AL_V1_Mask3AlreadyTurnedIn") == 0 then
    Unhide("hub_adventureland_v1.BackStoreMask3 01")
    SetGlobal("AL_V1_Mask3AlreadyTurnedIn", 1)
  elseif GetGlobal("GotTikiMask3") == 1 and GetGlobal("AL_V1_Mask3AlreadyTurnedIn") == 1 then
    Unhide("hub_adventureland_v1.BackStoreMask3 02")
  end
end
PutTikiMasksInTheBack = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "BackStorePickups")
  if GetGlobal("GotTikiMask1") == 1 or GetGlobal("AL_V1_Mask1AlreadyTurnedIn") == 1 then
    Unhide("CollectibleMask1")
  end
  if GetGlobal("GotTikiMask2") == 1 or GetGlobal("AL_V1_Mask2AlreadyTurnedIn") == 1 then
    Unhide("CollectibleMask2")
  end
  if GetGlobal("GotTikiMask3") == 1 or GetGlobal("AL_V1_Mask3AlreadyTurnedIn") == 1 then
    Unhide("CollectibleMask3")
  end
  if GetGlobal("GotTikiMask1") == 1 then
    SetGlobal("AL_V1_Mask1AlreadyTurnedIn", 1)
  end
  if GetGlobal("GotTikiMask2") == 1 then
    SetGlobal("AL_V1_Mask2AlreadyTurnedIn", 1)
  end
  if GetGlobal("GotTikiMask3") == 1 then
    SetGlobal("AL_V1_Mask3AlreadyTurnedIn", 1)
  end
end
ConvertMaskPickupsToProps = L0_0
function L0_0()
  if GetGlobal("Got Compass") == 1 and GetGlobal("Got Mermaid Figurehead") == 1 and GetGlobal("Got Ships Wheel") == 1 then
    ForceSequence("hub_adventureland_v1.GusConversation", "AL_V1_ContraptionStatus")
  end
  VL_CheckpointSave()
end
SetupContraption = L0_0
function L0_0()
  if GetGlobal("AL_tortugaopened") == 0 then
  end
end
ContraptionProgressUpdate = L0_0
function L0_0()
  SetGlobal("AL_tortugaopened", 1)
  RestrictCutSceneInput()
  GrabCamera("hub_adventureland_camera.PiratesDoorCam", "hub_adventureland_triggers.WheelTrigger", CAMERA_LERP_TRANSITION, 2)
  AudioPostEventOn(GetPlayer(), "Play_sfx_AdvLnd_Solve_Waterwheel")
  wait(3.5)
  GrabCamera("hub_adventureland_camera.PiratesDoorCam", "hub_adventureland_static.AL_Mercado_Door01 01", CAMERA_LERP_TRANSITION, 1)
  wait(2)
  AnimGBReset("hub_adventureland_static.AL_Mercado_Door01 01")
  AnimGBSequence("hub_adventureland_static.AL_Mercado_Door01 01", "Open")
  Prefab_Projector_ChangeState("AL_PiratesProjector", "Activate")
  DestroyEntity("hub_adventureland_audio.Trigger_DoorLocked 01")
  AudioPostEventOn("hub_adventureland_audio.Sound_Marker_MercadoDoor", "Play_sfx_AdvntLnd_DoorOpen")
  wait(2)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 2)
  UnrestrictCutSceneInput()
end
AL_StartContraption = L0_0
function L0_0()
  Bark(nil, "Collected parts", 1)
  SetGlobal("AL_ContraptionReady_Played", 1)
end
AL_cheat = L0_0
function L0_0()
  SetGlobal("AL_tortugaopened", 1)
  SetPropertyFloat("hub_adventureland_v1.SadSmee 01", "UsableRadius", 0)
  FireUser1("hub_adventureland_igc.grabcamerafancy 01.FancyCameraLookAt 01")
  wait(0.8)
  AudioPostEventOn(GetPlayer(), "Play_sfx_AdvLnd_Solve_Waterwheel")
  wait(1.2)
  Unhide("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Weight 01")
  AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Weight 01", "Appear")
  wait(0.1)
  AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_ShipWheel 01", "Appear")
  wait(0.13)
  Unhide("hub_adventureland_dynamic.AL_P_CompassA1_Toon_01 01")
  AnimGBSequence("hub_adventureland_dynamic.AL_P_CompassA1_Toon_01 01", "Appear")
  wait(0.75)
  AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Parts 01", "Loop")
  AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_ShipWheel 01", "Loop")
  AnimGBSequence("hub_adventureland_dynamic.AL_P_CompassA1_Toon_01 01", "Loop")
  AnimGBSequence("hub_adventureland_dynamic.AL_Minihub_WaterWheel_Weight 01", "Loop")
  AudioPostEventOn("hub_adventureland_audio.Bellows", "Play_sfx_AdvLnd_Bellow")
  AudioPostEventOn("hub_adventureland_audio.Pump", "Play_sfx_advlnd_Pump")
  AudioPostEventOn("hub_adventureland_audio.WheelLinkage", "Play_sfx_AdvntLnd_Wheel_LinkageLP")
  AudioPostEventOn("hub_adventureland_audio.WheelPulley1", "Play_sfx_AdvntLnd_Wheel_Pulleys")
  AudioPostEventOn("hub_adventureland_audio.WheelPulley2", "Play_sfx_AdvntLnd_Wheel_Pulleys")
  wait(5)
  AnimGBSequence("hub_adventureland_static.AL_Mercado_Door01 01", "Open")
  Prefab_Projector_ChangeState("AL_PiratesProjector", "Activate")
  DestroyEntity("hub_adventureland_audio.Trigger_DoorLocked 01")
  AudioPostEventOn("hub_adventureland_audio.Sound_Marker_MercadoDoor", "Play_sfx_AdvntLnd_DoorOpen")
  wait(2)
  AnimGBSequence("hub_adventureland_dynamic.AL_CrowsNestTower_01 01", "RotateLoop")
  VL_CheckpointSave()
end
PiratesGateOpening = L0_0
function L0_0()
  SetPropertyFloat("hub_adventureland_v1.SadSmee 01", "UsableRadius", 2)
end
RestoreSmeeUsability = L0_0
function L0_0()
  wait(2)
  AnimGBSequence("hub_adventureland_static.AL_Mercado_Door01 01", "Open")
  Prefab_Projector_ChangeState("AL_PiratesProjector", "Activate")
  DestroyEntity("hub_adventureland_audio.Trigger_DoorLocked 01")
  AudioPostEventOn("hub_adventureland_audio.Sound_Marker_MercadoDoor", "Play_sfx_AdvntLnd_DoorOpen")
end
PiratesGateOpeningShot2 = L0_0
function L0_0()
  wait(4)
  AnimGBSequence("hub_adventureland_dynamic.AL_CrowsNestTower_01 01", "RotateLoop")
  AudioPostEventOn("hub_adventureland_audio.CrowsNest_Loop", "Play_Crows_Nest_Loop")
end
PiratesGateOpeningShot3 = L0_0
function L0_0(A0_4, A1_5, A2_6, A3_7)
  AnimGBSetIdle(A3_7, false)
  AnimGBSetIdle(A1_5, false)
  SetPropertyFloat(A1_5, "UsableRadius", 0)
  RestrictCutSceneInput()
  AudioPostEventOn(GetPlayer(), "Play_sfx_Mickey_OpenChest")
  StartFadeOut(0.25)
  wait(0.5)
  StartFadeIn()
  TeleportToEntity(GetPlayer(), A0_4)
  wait(0.1)
  AnimEvent(GetPlayer(), EVENT_Special_9)
  AnimGBReset(A1_5)
  AnimGBSequence(A1_5, "Chest_Open")
  AnimGBReset(A2_6)
  AnimGBSequence(A2_6, "Chest_Open")
  wait(7.166)
  ReleaseCamera(CAMERA_SAMEPLACE_TRANSITION, 1)
  UnrestrictCutSceneInput()
  AnimGBSetIdle(A3_7, true)
  wait(5)
  AnimGBSetIdle(A1_5, true)
  SetPropertyFloat(A1_5, "UsableRadius", 0)
end
Mickey_Open_Compass_Chest = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Play_sfx_ui_quest_item_received")
end
Quest_Item_Received = L0_0
function L0_0()
  LoadLevel(GetPlayer(), "Levels/PotW_Start.Level")
end
LoadPirates = L0_0
function L0_0()
  if GetGlobal("VL_E3_GreetingPlayed") == 0 then
    ForceSequence("hub_adventureland_v1.GusConversation", "AL_V1_FlythroughBark")
    SetGlobal("VL_E3_GreetingPlayed", 1)
  elseif GetGlobal("VL_E3_GreetingPlayed") == 1 then
  end
end
AL_OpeningBark1 = L0_0
function L0_0()
  SetGlobal("VL_FlythroughPlayed", 1)
  AudioPostEventOn(GetPlayer(), "Mute_Mickey")
  GrabCameraNif("hub_adventureland_camera.AL_visit1_hub_intro_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("hub_adventureland_camera.AL_visit1_hub_intro_cam 01")
  AnimGBSequence("hub_adventureland_camera.AL_visit1_hub_intro_cam 01", "AL_visit1_hub_intro_cam")
  StartFadeInNoHUD()
  wait(39)
  StartFadeOut(0.5)
  wait(0.5)
  StartFadeIn(0.5)
  CameraReset()
  ShowHud()
  UnrestrictCutSceneInput()
  Prefab_Projector_SetOnlySideCamera("VLMeanStreetStart")
  wait(2)
  AudioPostEventOn(GetPlayer(), "Unmute_Mickey")
  EnableGuardianSystem()
  GetPrefabData("VLMeanStreetStart").ToFlyThrough = "False"
end
HUBAdventurelandlandFlythrough = L0_0
function L0_0()
  AnimVarInt("hub_adventureland_v1.Damien Salt", VAR_NPC_State, 5)
  SetGlobal("AL_V1_IceCreamYouBuyNow", 1)
  SetGlobal("AL_V1_IceCream_Delivered", 1)
end
GiveIceCream = L0_0
function L0_0()
  wait(0)
  StartFadeOut(1)
  wait(1.1)
  TeleportToEntity("hub_adventureland_v1.Damien Salt", "hub_adventureland_v1.DamienLoveSpot")
  TeleportToEntity("hub_adventureland_v1.PedestrianFemaleCow 01", "hub_adventureland_v1.HenriettaLoveSpot")
  SetPropertyFloat("hub_adventureland_v1.seq_openchest 01.Open_Chest_Sequence", "UsableRadius", 1)
  AnimVarInt("hub_adventureland_v1.Damien Salt", VAR_NPC_State, 0)
  wait(0)
  AnimVarInt("hub_adventureland_v1.PedestrianFemaleCow 01", VAR_Mood_Type, MOOD_Positive)
  AnimVarInt("hub_adventureland_v1.PedestrianFemaleCow 01", VAR_NPC_State, 0)
  SetGlobal("Got Mermaid Figurehead", 1)
  SetGlobal("AL_V1_Flowers_Delivered", 1)
  Hide("hub_adventureland_static.Henrietta_Sitting_Collision 01")
  wait(0.2)
  StartFadeIn()
  ClearAllCameraAttributes()
  UnrestrictCutSceneInput()
end
MoveDamienAndHenrietta = L0_0
function L0_0()
  if GetGlobal("AL_V1_Flowers_Delivered") == 1 then
    SetPropertyFloat("hub_adventureland_v1.seq_openchest 01.Open_Chest_Sequence", "UsableRadius", 1)
  end
end
DamienChestRepaint = L0_0
function L0_0()
  SetIdle(false)
end
MySetUnidle = L0_0
function L0_0()
  local L0_8
  L0_8 = GetPropertyFloat
  L0_8 = L0_8(GetPlayer(), "ETicket")
  SetGlobal("Mickey_Tickets", L0_8)
end
SetMickeyTickets = L0_0
function L0_0()
  if GetGlobal("AL_V1_DaisyHeadIntro_Played") == 0 and GetGlobal("MS_V1RaceActive") == 0 then
    FireSequence("hub_adventureland_v1.DaisyHead 01", "AL_V1_DaisyHeadIntro")
    SetGlobal("AL_V1_DaisyHeadIntro_Played", 1)
  end
end
DaisyIntro = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Play_sfx_POTW_Pickup_TBear")
  FireSequence("hub_adventureland_v1.GusConversation", "AL_V1_Gus_FoundBear")
  SetGlobal("AL_GotTeddy", 1)
  SetGlobal("AL_TeddyBears", 1)
  Quest_Item_Received()
end
AL_E3BearGet = L0_0
function L0_0()
  FireUser1("hub_adventureland_camera.grabcamerafancy 01.FancyCameraLookAt 01")
end
AL_1stcam = L0_0
function L0_0()
  FireUser1("hub_adventureland_camera.grabcamerafancy 02.FancyCameraLookAt 01")
end
AL_2ndcam = L0_0
function L0_0()
  FireUser1("hub_adventureland_camera.grabcamerafancy 03.FancyCameraLookAt 01")
end
AL_3rdcam = L0_0
L0_0 = 0
totalNPCspuddled = L0_0
function L0_0()
  Print("PuddleTracker")
  totalNPCspuddled = totalNPCspuddled + 1
  wait(0)
  if totalNPCspuddled == 1 then
    Print("totalNPCspuddled == 1")
    FireSequence("hub_adventureland_v1.GusConversation", "AL_V1_Gus_MeltedOne")
    Print("totalNPCspuddled == 1")
  elseif totalNPCspuddled == 3 then
    Print("totalNPCspuddled == 3")
    FireSequence("hub_adventureland_v1.GusConversation", "AL_V1_Gus_MeltedThree")
    Print("totalNPCspuddled == 3")
  end
end
PuddleTracker = L0_0
L0_0 = 0
function L1_1()
  _UPVALUE0_ = _UPVALUE0_ + 1
  if _UPVALUE0_ == 5 then
    ForceSequence("hub_adventureland_v1.GusConversation", "AL_V1_Gus_KillingPlants")
  end
end
ReducePlantCount = L1_1
function L1_1()
  SetDefaultCameraValues(6.5, 6, 0)
end
NewCamera = L1_1
function L1_1()
  TeleportToEntity(GetPlayer(), "hub_adventureland_static.Marker(Parentable) 02")
end
TeleportStartE3 = L1_1
function L1_1()
  ForceSequence("hub_adventureland_v1.GusConversation", "E3_AL_V1_Gus_ChestReward")
end
ChestGotPinE3 = L1_1
function L1_1()
  SetPropertyString(target, "UsableEffect", "UsableFX", 0)
end
SilverButton = L1_1
function L1_1()
  SetPropertyString(target, "UsableEffect", "UsableFXGold", 0)
end
GoldButton = L1_1
function L1_1()
  SetPropertyString("hub_adventureland_v1.Scurvy Pat", "UsableEffect", "UsableFXGold", 0)
  SetPropertyString("hub_adventureland_v1.PedestrianFemaleCow 01", "UsableEffect", "UsableFXGold", 0)
  SetPropertyString("hub_adventureland_v1.Damien Salt", "UsableEffect", "UsableFXGold", 0)
end
MainQuestButtonSilverToGold = L1_1
function L1_1()
  SetPropertyString("hub_adventureland_v1.Damien Salt", "UsableEffect", "UsableFX", 0)
  SetPropertyString("hub_adventureland_v1.PedestrianFemaleCow 01", "UsableEffect", "UsableFX", 0)
end
GoldtoSilverDamien = L1_1
function L1_1()
  SetPropertyString("hub_adventureland_v1.Scurvy Pat", "UsableEffect", "UsableFX", 0)
end
GoldtoSilverPat = L1_1
function L1_1()
  SetPropertyString("hub_adventureland_v1.Tiki Sam", "UsableEffect", "UsableFX", 0)
end
GoldtoSilverSam = L1_1
function L1_1()
  SetPropertyString("hub_adventureland_v1.SadSmee 01", "UsableEffect", "UsableFX", 0)
end
GoldtoSilverSmee = L1_1
function L1_1()
  if GetScrapperPercent(GetPlayer()) > 0.1 then
    SetGlobal("AL_V1_MickeyScrapper", 1)
  end
end
CheckThinnerLevel = L1_1
function L1_1()
  FireThread(TikiSamRelease)
  GoldtoSilverSam()
  ConvertMaskPickupsToProps()
  SetGlobal("Got Ships Wheel", 1)
  Quest_Item_Received()
  VL_CheckpointSave()
end
VL_V1_CompleteTikiSamQuest = L1_1
function L1_1()
  SetGlobal("VL_E3_DamienKarma", GetGlobal("VL_E3_DamienKarma") + 1)
  if GetGlobal("VL_E3_DamienKarma") == 4 then
    Bark(GetPlayer(), "NPC likes you again", 3)
  end
end
VL_E3_DamienKarmaPositive = L1_1
function L1_1()
  SetGlobal("VL_E3_DamienKarma", GetGlobal("VL_E3_DamienKarma") - 1)
  if GetGlobal("VL_E3_DamienKarma") == -1 then
    Bark(GetPlayer(), "Don't do that.", 3)
  elseif GetGlobal("VL_E3_DamienKarma") == -5 then
    Bark(GetPlayer(), "Locked!", 3)
  end
end
VL_E3_DamienKarmaNegative = L1_1
function L1_1()
  SetGlobal("VL_E3_SmeeKarma", GetGlobal("VL_E3_SmeeKarma") + 1)
  if GetGlobal("VL_E3_SmeeKarma") == 3 then
    Bark(GetPlayer(), "NPC likes you now", 3)
    SetGlobal("AL_V1_MickeyScrapper", 1)
  end
end
VL_E3_SmeeKarmaPositive = L1_1
function L1_1()
  SetGlobal("VL_E3_SmeeKarma", GetGlobal("VL_E3_SmeeKarma") - 1)
  if GetGlobal("VL_E3_SmeeKarma") == -1 then
    Bark(GetPlayer(), "Don't do that.", 3)
  elseif GetGlobal("VL_E3_SmeeKarma") == -3 then
    SetGlobal("AL_V1_MickeyScrapper", 1)
  end
end
VL_E3_SmeeKarmaNegative = L1_1
function L1_1()
  SetGlobal("VL_E3_AntonioKarma", GetGlobal("VL_E3_AntonioKarma") + 1)
  if GetGlobal("VL_E3_AntonioKarma") == 5 then
    Bark(GetPlayer(), "NPC likes you now", 3)
    SetGlobal("AL_V1_MickeyScrapper", 1)
  end
end
VL_E3_AntonioKarmaPositive = L1_1
function L1_1()
  SetGlobal("VL_E3_AntonioKarma", GetGlobal("VL_E3_AntonioKarma") - 1)
  if GetGlobal("VL_E3_AntonioKarma") == -1 then
    Bark(GetPlayer(), "Don't do that.", 3)
  elseif GetGlobal("VL_E3_AntonioKarma") == -3 then
    SetGlobal("AL_V1_MickeyScrapper", 1)
  end
end
VL_E3_AntonioKarmaNegative = L1_1
function L1_1()
  SetGlobal("VL_E3_IanKarma", GetGlobal("VL_E3_IanKarma") + 1)
  if GetGlobal("VL_E3_IanKarma") == 7 then
    Bark(GetPlayer(), "NPC likes you now", 3)
    SetGlobal("AL_V1_MickeyScrapper", 1)
  end
end
VL_E3_IanKarmaPositive = L1_1
function L1_1()
  SetGlobal("VL_E3_IanKarma", GetGlobal("VL_E3_IanKarma") - 1)
  if GetGlobal("VL_E3_IanKarma") == -1 then
    Bark(GetPlayer(), "Don't do that.", 3)
  elseif GetGlobal("VL_E3_IanKarma") == -3 then
    SetGlobal("AL_V1_MickeyScrapper", 1)
  end
end
VL_E3_IanKarmaNegative = L1_1
