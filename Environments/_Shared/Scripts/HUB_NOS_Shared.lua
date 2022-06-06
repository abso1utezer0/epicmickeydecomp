local L0_0, L1_1
function L0_0()
  Print("Starting Bog Easy Visit 2 with ghosts and setting hub startposition to 2")
  SetGlobal("HUB_startposition", 2)
end
StartNOSV2Ghosts = L0_0
function L0_0()
  Print("Starting Bog Easy Visit 2 without ghosts and setting hub startposition to 2")
  SetGlobal("HUB_startposition", 2)
  SetGlobal("NO_organfixed", 1)
end
StartNOSV2NoGhosts = L0_0
function L0_0()
  Print("Setup Script Check")
  if GetGlobal("NO_NewOrleansProgress") == 1 then
    NO_Projector_SetupV1()
  elseif GetGlobal("NO_NewOrleansProgress") == 2 then
    NO_Projector_SetupV2()
  elseif GetGlobal("NO_NewOrleansProgress") == 3 then
    GetPrefabData("NOSBogStart").ToFlyThrough = "True"
    NO_Projector_SetupV3()
  end
end
NO_SetupScriptCheck = L0_0
function L0_0()
  if GetGlobal("HUB_startposition") == 1 then
    Print("**************************** NO_StartPosition: 1")
    GetPrefabData("NOSBogStart").MapLoad_SetupPosition = "True"
  end
  if GetGlobal("HUB_startposition") == 2 then
    Print("**************************** NO_StartPosition: 2")
    GetPrefabData("NOSMansionStart").MapLoad_SetupPosition = "True"
  end
end
NO_StartPosition = L0_0
function L0_0()
  local L0_2, L1_3
  L0_2 = "NOV1_AlwaysSetup"
  L1_3 = "NOSBogStart"
  if GetGlobal("NO_NewOrleansProgress") == 2 then
    L0_2 = "NOV2_AlwaysSetup"
  elseif GetGlobal("NO_NewOrleansProgress") == 3 then
    L0_2 = "NOV3_AlwaysSetup"
  end
  if GetGlobal("HUB_startposition") == 2 then
    L1_3 = "NOSMansionStart"
  end
  SaveCheckpoint(GetPlayer(), L0_2, L1_3)
  Print("Bog Easy checkpoint saved with parameters:" .. L0_2 .. " , " .. L1_3)
end
NO_CheckpointSave = L0_0
function L0_0(A0_4)
  GetPrefabData(A0_4).MapLoad_SetupPosition = "True"
  OnMapLoad_ProjectorSetup(A0_4)
end
NO_Setup_Launcher = L0_0
function L0_0()
  Print("Setting up the map")
  SetMap(nil, "MAP_NOS_MINIHUB", "HUB")
end
NO_SetupMap = L0_0
function L0_0()
  SetDefaultCameraValues(4.25, 14, -10)
end
NO_SetDefaultCamera = L0_0
function L0_0()
  SetFirstPersonCameraEnabled(true)
end
NO_EnableFirstPerson = L0_0
function L0_0()
  SetFirstPersonCameraEnabled(false)
end
NO_DisableFirstPerson = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "BasicAbilityPickup")
end
DestroyAbilityPickups = L0_0
function L0_0()
  if GetGlobal("VL_V2_BogEasyPlantEnd_Played") == 0 and 0 < GetGlobal("VL_PlantsLeftBE") and GetGlobal("NO_NewOrleansProgress") < 3 then
    if GetGlobal("VL_V2_BogEasyPlantStart_Played") == 1 then
      SetGlobal("NO_PlantsPainted", GetGlobal("NO_PlantsPainted") + 1)
      SetGlobal("VL_PlantsLeftBE", GetGlobal("VL_PlantsLeftBE") - 1)
      if GetGlobal("NO_PlantsPainted") == 20 and GetGlobal("VL_V2_BogEasyPlantStart_played") == 1 then
        FireSequence("hub_nosquare.GusConvos", "NO_PlantsPainted")
      end
    elseif GetGlobal("VL_V2_BogEasyPlantStart_Played") == 0 then
      SetGlobal("NO_PlantsPainted", GetGlobal("NO_PlantsPainted") + 1, true)
      SetGlobal("VL_PlantsLeftBE", GetGlobal("VL_PlantsLeftBE") - 1, true)
    end
  end
end
BogPlantPainted = L0_0
function L0_0()
  if GetGlobal("VL_V2_BogEasyPlantEnd_Played") == 0 and 0 < GetGlobal("NO_PlantsPainted") and GetGlobal("NO_NewOrleansProgress") < 3 then
    if GetGlobal("VL_V2_BogEasyPlantStart_Played") == 1 then
      SetGlobal("NO_PlantsPainted", GetGlobal("NO_PlantsPainted") - 1)
      SetGlobal("VL_PlantsLeftBE", GetGlobal("VL_PlantsLeftBE") + 1)
    end
    if GetGlobal("VL_V2_BogEasyPlantStart_Played") == 0 then
      SetGlobal("NO_PlantsPainted", GetGlobal("NO_PlantsPainted") - 1, true)
      SetGlobal("VL_PlantsLeftBE", GetGlobal("VL_PlantsLeftBE") + 1, true)
    end
  end
end
BogPlantThinned = L0_0
function L0_0()
  Print("Setting up quest plants")
  if GetGlobal("NO_PlantsPainted") < 20 then
    ForEachEntityInGroup(ForceSketched, "BogPlant")
    SetGlobal("NO_PlantsPainted", 0)
  elseif GetGlobal("NO_PlantsPainted") > 19 or GetGlobal("VL_V2_BogEasyPlantEnd_Played") == 1 then
    SetGlobal("NO_PlantsPainted", 20)
    ForEachEntityInGroup(ForcePainted, "BogPlant")
  end
end
SetupPlants = L0_0
L0_0 = 0
bellringing = L0_0
function L0_0(A0_5, A1_6)
  if DamageEvent_HasStimulusType(A1_6, ST_SPIN) and bellringing == 0 then
    bellringing = 1
    AnimGBSequence("TownSquareBell", "Ring")
    AudioPostEventOn(GetPlayer(), "Play_sfx_NOS_V2_Bell")
    wait(2.8)
    AnimGBSequence("TownSquareBell", "Rest")
    bellringing = 0
  end
end
NO_BellRing = L0_0
function L0_0()
  FireSequence("hub_nosquare.GusConvos", "NO_gusmansionenter")
end
NO_loadmansion = L0_0
function L0_0()
  SetGlobal("2dDirection", 1)
  UnrestrictCutSceneInput()
  wait(0.1)
  LoadLevel(GetPlayer(), "Levels/HM_Start.Level")
end
NO_projectormansion = L0_0
function L0_0()
  FireSequence("hub_nosquare.GusConvos", "NO_gusmeanstreetenter")
end
NO_loadmeanstreet = L0_0
function L0_0()
  SetGlobal("2dDirection", 0)
  UnrestrictCutSceneInput()
  wait(0.1)
  LoadLevel(GetPlayer(), "Levels/2D_LonesomeGhost01.level")
end
NO_projectormeanstreet = L0_0
function L0_0()
  AnimVarInt("hub_nosquare.PedestrianFemaleCow 01", VAR_NPC_State, 0)
end
NO_stopknock = L0_0
function L0_0(A0_7)
  AnimVarInt(A0_7, VAR_NPC_State, 0)
  AnimVarInt(A0_7, VAR_Mood_Type, 0)
end
NO_stopwave = L0_0
function L0_0(A0_8)
  AnimGBSequence(A0_8, "Open")
end
OpenShackDoor = L0_0
function L0_0(A0_9)
  AnimGBSequence(A0_9, "Rest")
end
CloseShackDoor = L0_0
function L0_0()
  SetGlobal("NO_donaldpartsfound", GetGlobal("NO_donaldpartsfound") + 1)
end
NO_BuyDonaldPart = L0_0
function L0_0()
  wait(1)
  if GetGlobal("NO_donaldpartsfound") == 4 then
    FireSequence("hub_nosquare.GusConvos", "NO_UpdateDonaldQuest")
  else
    NO_CheckpointSave()
  end
end
NO_UpdateDonaldQuest = L0_0
function L0_0()
  ForEachEntityInGroup(AnimGBSequence, "ShopFadeBackground", "On")
end
StartShopFade = L0_0
function L0_0()
  ForEachEntityInGroup(AnimGBSequence, "ShopFadeBackground", "Off")
end
EndShopFade = L0_0
function L0_0(A0_10, A1_11)
  StreamInterior(nil, A1_11)
end
NO_StreamInterior = L0_0
function L0_0()
  StreamInterior(nil, "bog_ship")
  FireThread(NO_EnterBuildings)
  ActivateScene("environments/meanstreets/hub_nosquare_ship.gsa")
  wait(1.3)
  wait(0.25)
  TeleportToEntity(GetPlayer(), "hub_nosquare_ship.ShipEnterMarker")
  wait(0.01)
  CameraReset()
  wait(0.01)
  SetCameraAttributes("SidescrollOverrideMarker")
end
NO_EnterShip = L0_0
function L0_0()
  FireThread(NO_ExitBuildings)
  wait(1)
  TeleportToEntity(GetPlayer(), "hub_nosquare_ship.ShipExitMarker")
  wait(0.01)
  CameraReset()
  SetCameraAttributes("hub_nosquare_camera.SwampboatCamMarker")
end
NO_ExitShip = L0_0
function L0_0()
  StreamInterior(nil, "bog_shack")
  FireThread(NO_EnterBuildings)
  ActivateScene("Environments/MeanStreets/HUB_NOSquare_Hidden_Dock.gsa")
  wait(1.3)
  wait(0.25)
  TeleportToEntity(GetPlayer(), "LouisShack_EnterMarker")
  wait(0.01)
  CameraReset()
  wait(0.01)
  SetCameraAttributes("SidescrollOverrideMarker")
end
NO_EnterShack = L0_0
function L0_0()
  FireThread(NO_ExitBuildings)
  wait(1)
  TeleportToEntity(GetPlayer(), "LouisShack_ExitMarker")
  wait(0.01)
  CameraReset()
  SetCameraAttributes("hub_nosquare_camera.SwampboatCamTrigger")
end
NO_ExitShack = L0_0
function L0_0()
  StreamInterior(nil, "bog_store")
  FireThread(NO_EnterBuildings)
  ActivateScene("Environments/MeanStreets/HUB_NOSquare_Metairie_Store.gsa")
  wait(1.3)
  wait(0.25)
  TeleportToEntity(GetPlayer(), "MetairieStore_EnterMarker")
  wait(0.01)
  CameraReset()
  wait(0.01)
  SetCameraAttributes("SidescrollOverrideMarker")
  EndShopFade()
end
NO_EnterStore = L0_0
function L0_0()
  FireThread(NO_ExitBuildings)
  wait(1)
  TeleportToEntity(GetPlayer(), "MetairieStore_ExitMarker")
  wait(0.01)
  CameraReset()
  SetCameraAttributes("hub_nosquare_camera.SwampboatCamTrigger")
end
NO_ExitStore = L0_0
function L0_0()
  RestrictCutSceneInput()
  AudioPostEventOn(GetPlayer(), "Play_sfx_Hub_Door_Trans_enter")
  StartFadeOut(1.2)
  Enable2DSetup()
  AudioPostEventOn(GetPlayer(), "Set_Volume_Enter_Interior")
  wait(1.2)
  WaitForLevelLoad()
  SetConfigVariableString(GetPlayer(), "CameraFieldOfView", 0)
  wait(1)
  StartFadeInNoHUD()
  wait(0.5)
  UnrestrictCutSceneInput()
end
NO_EnterBuildings = L0_0
function L0_0()
  RestrictCutSceneInput()
  AudioPostEventOn(GetPlayer(), "Play_sfx_Hub_Door_Trans_Exit")
  StartFadeOut(1)
  Disable2DSetup()
  AudioPostEventOn(GetPlayer(), "Reset_Volume_Exit_Interior")
  wait(1.1)
  WaitForLevelLoad()
  StartFadeIn(1)
  wait(1)
  UnrestrictCutSceneInput()
end
NO_ExitBuildings = L0_0
L0_0 = false
shackcam = L0_0
function L0_0()
  shackcam = true
  SetCameraAttributes("hub_nosquare_camera.LouisShackCamMarker")
end
NO_LouisShackExternalCam = L0_0
function L0_0()
  local L0_12, L1_13
  L0_12 = shackcam
  if L0_12 == true then
    L0_12 = false
    shackcam = L0_12
  end
end
End_NO_LouisShackExternalCam = L0_0
function L0_0(A0_14)
  SetPropertyFloat("vendor", "UsableRadius", 0)
  StartFadeOut(0.8)
  wait(0.8)
  SetCharacterInConversation(GetPlayer(), 0)
  TeleportToEntity(GetPlayer(), "mickeyReferenceMarker")
  SetCameraAttributes("SidescrollOverrideMarker")
  wait(0.4)
  UnrestrictCutSceneInput()
  StartFadeInNoHUD(0.6)
  SetPropertyFloat("vendor", "UsableRadius", 3)
end
RadioConvoRelease = L0_0
function L0_0(A0_15)
  SetPropertyFloat("vendor", "UsableRadius", 0)
  StartFadeOut(0.8)
  wait(0.8)
  SetCharacterInConversation(GetPlayer(), 0)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  TeleportToEntity(GetPlayer(), "mickeyReferenceMarker")
  wait(0)
  SetCameraAttributes("SidescrollOverrideMarker")
  wait(0.4)
  UnrestrictCutSceneInput()
  StartFadeInNoHUD(0.6)
  SetPropertyFloat("vendor", "UsableRadius", 3)
end
BertrandConvoRelease = L0_0
