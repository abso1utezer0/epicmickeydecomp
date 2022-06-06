local L0_0, L1_1
function L0_0(A0_2)
  DBC_ZoneH_NoIntro = true
  SetCameraAttributes(GetRelativePrefabEntity("dbczonehStartMarker", ".CameraSettings"))
  ForEachEntityInGroup(Hide, "UtilidorProps")
  MoveToEntity("dbc_zoneh_dynamic.AI_Oswald 01", "dbc_zoneh_dynamic.IGC_OswaldPositionMarker 02")
  Enable("dbc_zoneh_dynamic.IntroCamTrigger 01")
  Enable("dbc_zoneh_dynamic.PressurePlate 01")
  EndTrackingCurrentLevelForScoring("DBC_V2_ControlTower")
  StartTrackingCurrentLevelForScoring("DBC_V2_ControlTower")
  FireThread(GuardianPrefab_PopulateGuardians, "DBC_ZoneH_MickeyHead")
  if GetGlobal("DBC_OswaldPin") == 0 then
    AnimVarInt("dbc_zoneh_dynamic.AI_Oswald 01", VAR_Mood_Type, MOOD_Negative)
  end
end
DBC_ZoneH_LoadCheckpoint = L0_0
L0_0 = false
DBC_ZoneH_NoIntro = L0_0
function L0_0()
  if DBC_ZoneH_NoIntro == false then
    GetPrefabData("dbczonehStartMarker").MapLoad_SetupPosition = "True"
    OnMapLoad_ProjectorSetup("dbczonehStartMarker")
  end
end
DBC_ZoneH_Intro_Launcher = L0_0
function L0_0()
  SetGlobal("MS_MeanStreetProgress", 6)
  SetMap(nil, "MAP_DBC_ZONEH", "GAME")
  FireUser1("IntroCameraSequence")
  StreamInterior(nil, "stream_emptypartfile")
  ForEachEntityInGroup(Hide, "UtilidorProps")
  Wait(0.3)
  GuardianPrefab_PopulateGuardians("DBC_ZoneH_MickeyHead")
end
DBC_ZoneH_IntroSequence = L0_0
function L0_0()
  Bark(nil, "Should not see me")
end
DBC_ZoneH_DefaultCameraSetup = L0_0
function L0_0()
  SetGlobal("DBC_ZoneH_NextLevelLoaded", 1)
end
DBC_ZoneH_nextzoneloaded = L0_0
function L0_0()
  Prefab_GrabCamera("StartCamTrigger")
  SetDefaultCameraValues(6.25, 18, -10)
end
DBC_ZoneH_StartCam = L0_0
function L0_0()
  AnimGBSequence("dbc_zoneh_dynamic.DBC_ZoneO_ExitDoor01 01", "Open")
  AudioPostEventOn("dbc_zoneh_audio.Sound_Marker_Doors 01", "Play_SFX_DBC_ZoneG_Door_Open")
end
DBC_ZoneH_opendoors = L0_0
function L0_0()
  AnimGBSequence("dbc_zoneh_dynamic.DBC_ZoneO_ExitDoor01 01", "Close")
  AudioPostEventOn("dbc_zoneh_audio.Sound_Marker_Doors 01", "Play_SFX_DBC_ZoneG_Door_Open")
end
DBC_ZoneH_closedoors = L0_0
function L0_0()
  SetGlobal("DBC_ZoneH_NextLevelLoaded", 2)
  AnimGBSequence("dbc_zoneh_dynamic.DBC_ZoneR_ExitDoor01 01", "Open")
  AudioPostEventOn("dbc_zoneh_audio.Sound_Marker_Doors 02", "Play_SFX_DBC_ZoneG_Door_Open")
end
DBC_ZoneH_openotherdoors = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneH_Portal1") == 0 then
    FireSequence("dbc_zoneh_dynamic.GusMarker(Conversation) 01", "DBC_2nd_ZoneH_ButtonReady")
    DBC_ZoneH_PortalCutscene("dbc_zoneh.CameraControlPoint 03", "dbc_zoneh.DBC_PortalA1_Inert 05", "dbc_zoneh.DBC_PortalA1_Inert 05")
    SetGlobal("DBC_ZoneH_Currentportal", 5)
  end
end
DBC_ZoneH_PortalCutsceneChooser = L0_0
function L0_0()
  DestroyEntity("dbc_zoneh_dynamic.PlayerDeathTrigger")
  Disable("dbc_zoneh_dynamic.PressurePlate 01")
  wait(0.8)
  EndTrackingCurrentLevelForScoring("DBC_V2_Utilidor7")
  StartFadeOut(0.3)
  wait(0.3)
  PlayAndUnlockMovie("DBC_visit2_Blot_Grabs_Mickey.bik", "DBC_visit2_Blot_Grabs_Mickey")
  LoadLevel(GetPlayer(), "Levels/DBC_Start_ZoneS.level")
end
DBC_ZoneH_PortalCutscene = L0_0
function L0_0(A0_3, A1_4)
  if GetGlobal(A1_4) == 1 then
    DestroyEntity(A0_3)
  end
end
DBC_ZoneH_ObjectStateCheck = L0_0
function L0_0()
  SetGlobal("DBC_OswaldPin", 1)
end
DBC_ZoneH_OswaldPinGet = L0_0
function L0_0()
  TeleportToEntity(GetPlayer(), "dbc_zoneh_dynamic.IGC_MickeyPositionMarker 01")
  RemovePhysicsFromWorld("dbc_zoneh_dynamic.DBC_PressurePlateA2_Inert 01")
  MoveToEntity("dbc_zoneh_dynamic.AI_Oswald 01", "dbc_zoneh_dynamic.IGC_OswaldPositionMarker 01")
  FireSequence("dbc_zoneh_dynamic.AI_Oswald 01", "DBC_ZoneH_OswaldConversationIntro")
end
DBC_ZoneH_OswaldConversationIntro = L0_0
function L0_0()
  if GetGlobal("DBC_OswaldPin") == 0 then
    AnimVarInt("dbc_zoneh_dynamic.AI_Oswald 01", VAR_Mood_Type, MOOD_Negative)
  end
  EndTrackingCurrentLevelForScoring("DBC_V2_ThroneRoom")
  StartTrackingCurrentLevelForScoring("DBC_V2_ControlTower")
  UnrestrictCutSceneInput()
  Wait(1.5)
  ShowReticleOnly()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 2)
  Wait(1)
  DBC_ZoneO_WorldShake()
  SaveCheckpoint(nil, "DBC_ZoneH_LoadCheckpoint", "dbczonehStartMarker")
end
DBC_ZoneH_OswaldConversationOutro = L0_0
function L0_0(A0_5)
  Print(GetGlobal("DBC_ZoneH_ShamHide"))
  if GetGlobal("DBC_ZoneH_ShamHide") == 1 then
    Hide(A0_5)
    Print("Success")
    MoveToEntity("dbc_zoneh_dynamic.DBC_ZoneR_ExitDoor01 01", "dbc_zoneh_dynamic.DBC_ZoneR_Door_PositionMarker")
  end
end
DBC_ZoneH_HideSham = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_ZoneH_LoadCheckpoint", "dbczonehStartMarker")
end
DBC_ZoneH_OswaldPinSave = L0_0
function L0_0()
  Wait(2.6)
  SaveCheckpoint(nil, "DBC_ZoneH_LoadCheckpoint", "dbczonehStartMarker")
end
DBC_ZoneH_ConceptArtSave = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneM_GemLit") == 1 then
    Enable("CutsceneTrigger")
  end
end
DBC_ZoneH_EnableCutsceneTrigger = L0_0
function L0_0()
  if HasCollectible("Oswald_Pin") then
    Mickey_Receive_Item_NPC("OswaldPin_Spawner", "GreyPin")
  else
    Mickey_Receive_Item_NPC("OswaldPin_Spawner", "Oswald_Pin")
  end
end
DBC_ZoneH_OswaldPinTransfer = L0_0
function L0_0()
  if HasCollectible("Oswald_Pin") then
    Mickey_GetItem_ClearItem("OswaldPin_Spawner", "GreyPin")
  else
    Mickey_GetItem_ClearItem("OswaldPin_Spawner", "Oswald_Pin")
    Wait(0.5)
    GiveCollectible("Oswald_Pin")
  end
end
DBC_ZoneH_OswaldPinTransfer_CleanUp = L0_0
