local L0_0, L1_1, L2_2, L3_3
function L0_0(A0_4)
  for _FORV_4_ = 1, 4 do
    if GetGlobal("AL_AdventurelandProgress") == _FORV_4_ then
      if _FORV_4_ == 1 then
        StreamInterior(nil, "alv1_defaultinterior")
      elseif _FORV_4_ == 2 then
        StreamInterior(nil, "alv2_np_defaultinterior")
      elseif _FORV_4_ == 3 then
        StreamInterior(nil, "alv2_p_defaultinterior")
      else
        StreamInterior(nil, "alv3_defaultinterior")
      end
    end
  end
  GetPrefabData(A0_4).MapLoad_SetupPosition = "True"
  OnMapLoad_ProjectorSetup(A0_4)
  StartTrackingCurrentLevelForScoring("HUB_Adventureland")
end
VL_Setup_Launcher = L0_0
function L0_0()
  Print("Picking a setup script")
  if GetGlobal("AL_AdventurelandProgress") == 1 then
    VL_Projector_SetupV1()
  elseif GetGlobal("AL_AdventurelandProgress") == 2 then
    VL_Projector_SetupV2NP()
  elseif GetGlobal("AL_AdventurelandProgress") == 3 then
    VL_Projector_SetupV2P()
  elseif GetGlobal("AL_AdventurelandProgress") == 4 then
    VL_Projector_SetupV3()
  end
end
AL_PickSetupScript = L0_0
function L0_0()
  local L0_5, L1_6
  L0_5 = "ALV1_AlwaysSetup"
  L1_6 = "VLMeanStreetStart"
  if GetGlobal("AL_AdventurelandProgress") == 2 then
    L0_5 = "ALV2NoPirates_AlwaysSetup"
  elseif GetGlobal("AL_AdventurelandProgress") == 3 then
    L0_5 = "ALV2Pirates_AlwaysSetup"
  elseif GetGlobal("AL_AdventurelandProgress") == 4 then
    L0_5 = "ALV3_AlwaysSetup"
  end
  if GetGlobal("HUB_startposition") == 2 then
    L1_6 = "VLPiratesStart2"
  end
  SaveCheckpoint(GetPlayer(), L0_5, L1_6)
  Print("Ventureland checkpoint saved with parameters:" .. L0_5 .. " , " .. L1_6)
end
VL_CheckpointSave = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("HUB_Adventureland")
  UnrestrictCutSceneInput()
  EnableGuardianSystem()
  LoadLevel(GetPlayer(), "Levels/MSUSA_ZoneM.Level")
end
LoadJungleRythym = L0_0
function L0_0(A0_7)
  SetPropertyFloat("hub_adventureland_v1.Tiki Sam", "UsableRadius", 0)
  StartFadeOut(0.8)
  wait(0.8)
  SetCharacterInConversation(GetPlayer(), 0)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  TeleportToEntity(GetPlayer(), "mickeyReferenceMarker", true, false)
  wait(0)
  SetCameraAttributes("SidescrollOverrideMarker")
  AnimVarInt("hub_adventureland_v1.Tiki Sam", VAR_NPC_State, 0)
  wait(0.4)
  UnrestrictCutSceneInput()
  StartFadeInNoHUD(0.6)
  SetPropertyFloat("hub_adventureland_v1.Tiki Sam", "UsableRadius", 3)
end
TikiSamRelease = L0_0
function L0_0()
  Print("Setting up the map")
  SetMap(nil, "MAP_AL_MINIHUB", "HUB")
end
VL_SetupMap = L0_0
function L0_0()
  SetGlobal("HUB_startposition", 1)
end
MeanStreetProjectorStart = L0_0
function L0_0()
  SetGlobal("HUB_startposition", 2)
end
SetupZoneWithoutPirates = L0_0
function L0_0()
  SetGlobal("AL_AdventurelandProgress", 3)
  SetGlobal("PotW_EndLevelCutscene", 1)
  SetGlobal("HUB_startposition", 2)
end
SetupZoneWithPirates = L0_0
function L0_0(A0_8, A1_9)
  StreamInterior(nil, A1_9)
end
VL_StreamBuilding = L0_0
function L0_0()
  RestrictCutSceneInput()
  StartFadeOut(1.2)
  Enable2DSetup()
  AudioPostEventOn(GetPlayer(), "Set_LPF_Adventureland_Ambient")
  wait(1.2)
  WaitForLevelLoad()
  SetConfigVariableString(GetPlayer(), "CameraFieldOfView", 0)
  wait(1)
  StartFadeInNoHUD()
  wait(0.5)
  UnrestrictCutSceneInput()
end
AL_EnterBuildings = L0_0
function L0_0()
  RestrictCutSceneInput()
  StartFadeOut(1)
  Disable2DSetup()
  AudioPostEventOn(GetPlayer(), "Reset_LPF_Adventureland_Ambient")
  wait(1.1)
  for _FORV_3_ = 1, 4 do
    if GetGlobal("AL_AdventurelandProgress") == _FORV_3_ then
      if _FORV_3_ == 1 then
        StreamInterior(nil, "alv1_defaultinterior")
      elseif _FORV_3_ == 2 then
        StreamInterior(nil, "alv2_np_defaultinterior")
      elseif _FORV_3_ == 3 then
        StreamInterior(nil, "alv2_p_defaultinterior")
      else
        StreamInterior(nil, "alv3_defaultinterior")
      end
    end
  end
  _FOR_()
  if GetGlobal("AL_V2_ReAssemble_Played") == 1 and GetGlobal("AL_AdventurelandProgress") == 2 then
    Hide("hub_adventureland_v2_nopirates.DaisyHead 02")
    Unhide("hub_adventureland_v2_nopirates.AnimatronicDaisy")
  end
  if GetGlobal("AL_V2_ReAssemble_Played") == 1 and GetGlobal("AL_AdventurelandProgress") == 3 then
    Hide("hub_adventureland_v2_pirates.DaisyHead 01")
    Unhide("hub_adventureland_v2_pirates.AnimatronicDaisy")
  end
  if GetGlobal("AL_AdventurelandProgress") == 2 and GetGlobal("Smee No Pirates Return_Played") == 1 then
    Hide("hub_adventureland_v2_nopirates.HappySmee")
  end
  if GetGlobal("AL_AdventurelandProgress") == 4 and GetGlobal("AL_V3_InvasionOver_Played") == 1 then
    if GetGlobal("AL_V2_ReAssemble_Played") == 1 then
      Enable("ALV3_Spawner_Daisy")
    else
      Enable("ALV3_Spawner_DaisyHead")
    end
  end
  if 4 > GetGlobal("AL_AdventurelandProgress") and (GetGlobal("AL_V1_Flowers_Delivered") == 0 or GetGlobal("AL_V2_MovingIn") == 0) then
    Unhide("hub_adventureland_static.Henrietta_Sitting_Collision 01")
  end
  StartFadeIn()
  wait(0.5)
  UnrestrictCutSceneInput()
end
AL_ExitBuildings = L0_0
function L0_0(A0_10)
  StartFadeOut(0.8)
  wait(0.8)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  TeleportToEntity(GetPlayer(), "mickeyReferenceMarker")
  wait(0)
  SetCameraAttributes("SidescrollOverrideMarker")
  SetCharacterInConversation(GetPlayer(), 0)
  wait(0.4)
  UnrestrictCutSceneInput()
  StartFadeInNoHUD(0.6)
end
GenericConvoRelease = L0_0
function L0_0()
  StreamInterior(nil, "hut_shop")
  FireThread(AL_EnterBuildings)
  wait(1.3)
  wait(0.25)
  TeleportToEntity(GetPlayer(), "HutFrontDoorMarker")
  wait(0.01)
  EndShopFade()
  CameraReset()
  wait(0.01)
  SetCameraAttributes("SidescrollOverrideMarker")
end
EnterHutShop = L0_0
L0_0 = false
HutShopExitCamActive = L0_0
function L0_0()
  FireThread(AL_ExitBuildings)
  wait(1)
  FireUser1("ExitHutShopCam")
end
HutShopExit = L0_0
function L0_0()
  StreamInterior(nil, "tiki_shop")
  FireThread(AL_EnterBuildings)
  wait(1.3)
  Wait(0.25)
  TeleportToEntity(GetPlayer(), "TikiFrontDoorMarker", true, false)
  wait(0.01)
  EndShopFade()
  AnimVarInt("hub_adventureland_v1.Tiki Sam", VAR_NPC_State, 0)
  CameraReset()
  wait(0.01)
  SetCameraAttributes("SidescrollOverrideMarker")
  if GetGlobal("3 Tiki Masks Got_Played") == 0 then
    if GetGlobal("GotTikiMask1") == 0 and GetGlobal("AL_V1_Mask1AlreadyTurnedIn") == 1 then
      Unhide("hub_adventureland_v1.BackStoreMask1 01")
    elseif GetGlobal("GotTikiMask1") == 1 and GetGlobal("AL_V1_Mask1AlreadyTurnedIn") == 1 then
      Unhide("hub_adventureland_v1.BackStoreMask1 02")
    end
    if GetGlobal("GotTikiMask2") == 0 and GetGlobal("AL_V1_Mask2AlreadyTurnedIn") == 1 then
      Unhide("hub_adventureland_v1.BackStoreMask2 01")
    elseif GetGlobal("GotTikiMask2") == 1 and GetGlobal("AL_V1_Mask2AlreadyTurnedIn") == 1 then
      Unhide("hub_adventureland_v1.BackStoreMask2 02")
    end
    if GetGlobal("GotTikiMask3") == 0 and GetGlobal("AL_V1_Mask3AlreadyTurnedIn") == 1 then
      Unhide("hub_adventureland_v1.BackStoreMask3 01")
    elseif GetGlobal("GotTikiMask3") == 1 and GetGlobal("AL_V1_Mask3AlreadyTurnedIn") == 1 then
      Unhide("hub_adventureland_v1.BackStoreMask3 02")
    end
  end
  if GetGlobal("3 Tiki Masks Got_Played") == 1 then
    if GetGlobal("AL_V1_Mask1AlreadyTurnedIn") == 1 then
      Unhide("CollectibleMask1")
    end
    if GetGlobal("AL_V1_Mask2AlreadyTurnedIn") == 1 then
      Unhide("CollectibleMask2")
    end
    if GetGlobal("AL_V1_Mask3AlreadyTurnedIn") == 1 then
      Unhide("CollectibleMask3")
    end
  end
end
EnterFrontTikiShop = L0_0
function L0_0()
  FireThread(AL_ExitBuildings)
  wait(1)
  TeleportToEntity(GetPlayer(), "TikiFrontDoorExitMarker")
  wait(0.01)
  CameraReset()
  StartFadeOut(0)
  Enable("hub_adventureland_static.Trigger_CameraOverride 02")
  SetCameraAttributes("hub_adventureland_static.Trigger_CameraOverride 02")
  wait(0.5)
  StartFadeIn(1)
end
ExitFrontTikiShop = L0_0
function L0_0()
  StreamInterior(nil, "tiki_shop")
  FireThread(AL_EnterBuildings)
  wait(1.3)
  wait(0.25)
  TeleportToEntity(GetPlayer(), "TikiBackDoorMarker")
  wait(0.01)
  EndShopFade()
  CameraReset()
  wait(0.01)
  SetCameraAttributes("BackTikiShopCameraOverride")
  SetGlobal("MickeyInTheBack", 1)
  if GetGlobal("3 Tiki Masks Got_Played") == 0 then
    if GetGlobal("GotTikiMask1") == 0 and GetGlobal("AL_V1_Mask1AlreadyTurnedIn") == 1 then
      Unhide("hub_adventureland_v1.BackStoreMask1 01")
    elseif GetGlobal("GotTikiMask1") == 1 and GetGlobal("AL_V1_Mask1AlreadyTurnedIn") == 1 then
      Unhide("hub_adventureland_v1.BackStoreMask1 02")
    end
    if GetGlobal("GotTikiMask2") == 0 and GetGlobal("AL_V1_Mask2AlreadyTurnedIn") == 1 then
      Unhide("hub_adventureland_v1.BackStoreMask2 01")
    elseif GetGlobal("GotTikiMask2") == 1 and GetGlobal("AL_V1_Mask2AlreadyTurnedIn") == 1 then
      Unhide("hub_adventureland_v1.BackStoreMask2 02")
    end
    if GetGlobal("GotTikiMask3") == 0 and GetGlobal("AL_V1_Mask3AlreadyTurnedIn") == 1 then
      Unhide("hub_adventureland_v1.BackStoreMask3 01")
    elseif GetGlobal("GotTikiMask3") == 1 and GetGlobal("AL_V1_Mask3AlreadyTurnedIn") == 1 then
      Unhide("hub_adventureland_v1.BackStoreMask3 02")
    end
  end
  if GetGlobal("3 Tiki Masks Got_Played") == 1 then
    if GetGlobal("AL_V1_Mask1AlreadyTurnedIn") == 1 then
      Unhide("CollectibleMask1")
    end
    if GetGlobal("AL_V1_Mask2AlreadyTurnedIn") == 1 then
      Unhide("CollectibleMask2")
    end
    if GetGlobal("AL_V1_Mask3AlreadyTurnedIn") == 1 then
      Unhide("CollectibleMask3")
    end
  end
end
EnterBackTikiShop = L0_0
function L0_0()
  FireThread(AL_ExitBuildings)
  wait(1)
  TeleportToEntity(GetPlayer(), "TikiBackDoorExitMarker")
  wait(0.01)
  CameraReset()
  StartFadeOut(0)
  Enable("hub_adventureland_static.Trigger_CameraOverride 02")
  SetCameraAttributes("hub_adventureland_igc.Trigger_CameraOverride 03")
  wait(0.5)
  StartFadeIn(1)
  SetGlobal("MickeyInTheBack", 0)
end
ExitBackTikiShop = L0_0
function L0_0()
  if GetGlobal("AL_CompassKeyGot") == 1 and GetGlobal("AL_AdventurelandProgress") == 1 then
    ForceSequence("hub_adventureland_triggers.ConversationDoors", "AL_Enter_Treehouse")
  elseif GetGlobal("AL_CompassKeyGot") == 0 and GetGlobal("AL_AdventurelandProgress") == 1 then
    ForceSequence("hub_adventureland_dynamic.GusConvo", "AL_V1_DoorLocked")
    AudioPostEventOn("hub_adventureland_audio.Sound_Marker_TreeHouseDoor", "Play_sfx_UI_DoorLocked")
  elseif GetGlobal("AL_AdventurelandProgress") == 2 or GetGlobal("AL_AdventurelandProgress") == 3 then
    ForceSequence("hub_adventureland_triggers.ConversationDoors", "AL_Enter_Treehouse")
  end
end
EnterTreeHouse = L0_0
function L0_0()
  StreamInterior(nil, "tree_house")
  RestrictCutSceneInput()
  StartFadeOut(1.2)
  Enable2DSetup()
  AudioPostEventOn(GetPlayer(), "Set_LPF_Adventureland_Ambient")
  wait(1.2)
  WaitForLevelLoad()
  SetConfigVariableString(GetPlayer(), "CameraFieldOfView", 0)
  if GetGlobal("AL_V2_BlakeMoved") == 1 then
    MoveToEntity("hub_adventureland_v2_pirates.Boson Blake 01", "hub_adventureland_v2_pirates.PirateOccupantMarker 01")
    Unhide("hub_adventureland_v2_pirates.Boson Blake 01")
  end
  if GetGlobal("AL_V2_MovingIn_Played") == 1 then
    MoveToEntity("hub_adventureland_v2_pirates.Damien Salt 01", "hub_adventureland_v2_pirates.PirateOccupantMarker 01")
    MoveToEntity("hub_adventureland_v2_pirates.Henrietta 01", "hub_adventureland_v2_pirates.Henrietta Occupant Marker")
    Unhide("hub_adventureland_v2_pirates.Damien Salt 01")
    Unhide("hub_adventureland_v2_pirates.Henrietta 01")
  end
  wait(1)
  if GetGlobal("AL_TreeHouseOccupied") == 0 then
    TeleportToEntity(GetPlayer(), "hub_adventureland_treehouseinterior.TreeHouseDoorMarker")
  elseif GetGlobal("AL_TreeHouseOccupied") == 1 then
    TeleportToEntity(GetPlayer(), "hub_adventureland_treehouseinterior.TreeHouseDoorMarker 01")
  end
  wait(0.01)
  CameraReset()
  wait(0.01)
  if GetGlobal("AL_TreeHouseOccupied") == 0 then
    SetCameraAttributes("UnoccupiedTreehouseCameraMarker")
  elseif GetGlobal("AL_TreeHouseOccupied") == 1 then
    SetCameraAttributes("OccupiedTreehouseCameraMarker")
  end
  StartFadeInNoHUD()
  wait(0.5)
  UnrestrictCutSceneInput()
  wait(1.3)
  wait(0.25)
end
EnterTreehouseConfirmed = L0_0
L0_0 = false
function L1_1()
  RestrictCutSceneInput()
  StartFadeOut(1)
  Disable2DSetup()
  AudioPostEventOn(GetPlayer(), "Set_LPF_Adventureland_Ambient")
  wait(1.1)
  for _FORV_3_ = 1, 4 do
    if GetGlobal("AL_AdventurelandProgress") == _FORV_3_ then
      if _FORV_3_ == 1 then
        StreamInterior(nil, "alv1_defaultinterior")
      elseif _FORV_3_ == 2 then
        StreamInterior(nil, "alv2_np_defaultinterior")
      elseif _FORV_3_ == 3 then
        if GetGlobal("AL_V2_BlakeMoved") == 1 then
          Hide("hub_adventureland_v2_pirates.Boson Blake 01")
        end
        if GetGlobal("AL_V2_MovingIn_Played") == 1 then
          Hide("hub_adventureland_v2_pirates.Damien Salt 01")
          Hide("hub_adventureland_v2_pirates.Henrietta 01")
        end
        StreamInterior(nil, "alv2_p_defaultinterior")
      else
        StreamInterior(nil, "alv3_defaultinterior")
      end
    end
  end
  _FOR_()
  TeleportToEntity(GetPlayer(), "hub_adventureland_triggers.TreeHouseExitMarker", true, true)
  wait(0.01)
  CameraReset()
  wait(0.1)
  SetCameraAttributes("hub_adventureland_camera.StationaryTreeCamMarker")
  _UPVALUE0_ = true
  StartTrackingCurrentLevelForScoring("HUB_Adventureland")
  if GetGlobal("AL_V2_ReAssemble_Played") == 1 and GetGlobal("AL_AdventurelandProgress") == 2 then
    Hide("hub_adventureland_v2_nopirates.DaisyHead 02")
    Unhide("hub_adventureland_v2_nopirates.AnimatronicDaisy")
  end
  if GetGlobal("AL_V2_ReAssemble_Played") == 1 and GetGlobal("AL_AdventurelandProgress") == 3 then
    Hide("hub_adventureland_v2_pirates.DaisyHead 01")
    Unhide("hub_adventureland_v2_pirates.AnimatronicDaisy")
  end
  if GetGlobal("AL_AdventurelandProgress") == 2 and GetGlobal("Smee No Pirates Return_Played") == 1 then
    Hide("hub_adventureland_v2_nopirates.HappySmee")
  end
  if GetGlobal("AL_AdventurelandProgress") == 4 and GetGlobal("AL_V3_InvasionOver_Played") == 1 then
    if GetGlobal("AL_V2_ReAssemble_Played") == 1 then
      Enable("ALV3_Spawner_Daisy")
    else
      Enable("ALV3_Spawner_DaisyHead")
    end
  end
  UnrestrictCutSceneInput()
  wait(2.2)
  StartFadeIn()
end
ExitTreeHouse = L1_1
function L1_1()
  GrabCamera("hub_adventureland_camera.MoradoDoorCam", GetPlayer(), CAMERA_LERP_TRANSITION, 1.5)
end
MoradoCam = L1_1
function L1_1()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1)
end
EndMoradoCam = L1_1
function L1_1()
  GrabCamera("hub_adventureland_camera.MastCamera", GetPlayer(), CAMERA_LERP_TRANSITION, 1.5)
end
MastCamera = L1_1
function L1_1()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1)
end
EndMastCamera = L1_1
L1_1 = false
function L2_2()
  SetCameraAttributes("hub_adventureland_camera.Marker(CameraOverride) 01")
  _UPVALUE0_ = true
end
StartTreeCam = L2_2
function L2_2()
  SetCameraAttributes("hub_adventureland_camera.Marker(CameraOverride) 03")
  _UPVALUE0_ = true
end
StartTreeCam2 = L2_2
function L2_2()
  if _UPVALUE0_ == true then
    ClearAllCameraAttributesTimed(1)
  end
end
EndTreeCam = L2_2
L2_2 = false
function L3_3()
  SetCameraAttributes("hub_adventureland_triggers.WheelCamMarker")
  _UPVALUE0_ = true
end
WheelCam = L3_3
function L3_3()
  if _UPVALUE0_ == true then
    ClearAllCameraAttributesTimed(1)
  end
end
EndWheelCam = L3_3
function L3_3()
  if FrontTikiExitCamActive == true then
    ClearAllCameraAttributes()
  elseif _UPVALUE0_ == true then
    ClearAllCameraAttributes()
  elseif BackTikiExitCamActive == true then
    ClearAllCameraAttributes()
  elseif HutShopExitCamActive == true then
    ClearAllCameraAttributes()
  end
end
ConditionalEndCam = L3_3
function L3_3()
  ForEachEntityInGroup(AnimGBSequence, "ShopFadeBackground", "On")
end
StartShopFade = L3_3
function L3_3()
  ForEachEntityInGroup(AnimGBSequence, "ShopFadeBackground", "Off")
end
EndShopFade = L3_3
function L3_3()
  SetDefaultCameraValues(6.5, 6, 0)
end
NewBaseCamera = L3_3
function L3_3()
  Hide("hub_adventureland_v1.Pirate Compass 01")
end
HideCompass = L3_3
function L3_3()
  Unhide("hub_adventureland_v1.Pirate Compass 01")
end
UnhideCompass = L3_3
function L3_3()
  if GetGlobal("AL_V1_Mask1AlreadyTurnedIn") == 1 then
    Unhide("hub_adventureland_v1.BackStoreMask1 01")
  end
  if GetGlobal("AL_V1_Mask1AlreadyTurnedIn") == 2 then
    Unhide("hub_adventureland_v1.BackStoreMask2 01")
  end
  if GetGlobal("AL_V1_Mask1AlreadyTurnedIn") == 3 then
    Unhide("hub_adventureland_v1.BackStoreMask3 01")
  end
end
UnhideTikiMasks = L3_3
function L3_3(A0_11)
  Wait(0.1)
  StimulusSphere(nil, ST_KNOCKBACK, 1, GetPosition("target"), 2)
end
Tiki_KickOut = L3_3
function L3_3()
  local L0_12, L1_13
  L0_12 = SetGlobal
  L1_13 = "Watch_Sketches"
  L0_12(L1_13, GetSketchCount(GetPlayer(), "Sketch_Watch"))
end
GetWatchSketches = L3_3
function L3_3()
  Hide("hub_adventureland_static.Henrietta_Sitting_Collision 01")
  wait(10)
  Unhide("hub_adventureland_static.Henrietta_Sitting_Collision 01")
end
RespawnHenriettaCollision1 = L3_3
function L3_3()
  if GetGlobal("AL_V2_PlantCount") > 0 and GetGlobal("AL_AdventurelandProgress") < 4 then
    if GetGlobal("AL_V2_PlantsQuest_Played") == 0 then
      DecrementGlobal("AL_V2_PlantCount", true)
      SetGlobal("VL_PlantsLeftVL", GetGlobal("VL_PlantsLeftVL") + 1, true)
    elseif GetGlobal("AL_V2_PlantsDone_Played") == 0 then
      DecrementGlobal("AL_V2_PlantCount")
      SetGlobal("VL_PlantsLeftVL", GetGlobal("VL_PlantsLeftVL") + 1)
    end
  end
end
ReducePlantCount = L3_3
function L3_3()
  if GetGlobal("VL_PlantsLeftVL") > 0 and GetGlobal("AL_AdventurelandProgress") < 4 then
    if GetGlobal("AL_V2_PlantsQuest_Played") == 0 then
      IncrementGlobal("AL_V2_PlantCount", true)
      SetGlobal("VL_PlantsLeftVL", GetGlobal("VL_PlantsLeftVL") - 1, true)
    elseif GetGlobal("AL_V2_PlantsDone_Played") == 0 then
      IncrementGlobal("AL_V2_PlantCount")
      SetGlobal("VL_PlantsLeftVL", GetGlobal("VL_PlantsLeftVL") - 1)
    end
  end
end
IncreasePlantCount = L3_3
function L3_3(A0_14)
  local L1_15
  if A0_14 == "Ventureland" then
    L1_15 = GetGlobal
    L1_15 = L1_15("VL_PlantsLeftVL")
    ShowDropdownCounter("HUDElements/Icons/ui_icon_q_plant_tex.nif", L1_15)
  end
  if A0_14 == "Bog" then
    L1_15 = ShowDropdownCounter
    L1_15("HUDElements/Icons/ui_icon_q_plant_tex.nif", 20)
  end
end
ShowPlantCounter = L3_3
function L3_3()
  HideDropdownCounter()
end
HidePlantCounter = L3_3
function L3_3()
  if GetGlobal("MS_wallet1") == 0 then
    SetGlobal("MS_wallet1", 1)
    IncreaseMaxTicket_L1()
  else
    SetGlobal("MS_wallet2", 1)
    IncreaseMaxTicket_L2()
  end
end
AL_PickWalletUpgrade = L3_3
