local L0_0, L1_1
function L0_0()
  SetGlobal("NO_NewOrleansProgress", 1)
end
NO_SetVisitNumber = L0_0
L0_0 = false
NO_V1_SkipIntro = L0_0
L0_0 = false
NO_V1_SaveInitialCheckpoint = L0_0
function L0_0()
  NO_V1_SaveInitialCheckpoint = true
  NOV1_AlwaysSetup()
end
NO_Projector_SetupV1 = L0_0
function L0_0()
  if NO_V1_SkipIntro == false then
    NO_V1_SkipIntro = true
    NO_V1_SaveInitialCheckpoint = true
    SetGlobal("HUB_startposition", 1)
    SetGlobal("NO_NewOrleansProgress", 1)
    SetGlobal("MS_MeanStreetProgress", 4)
    NO_Setup_Launcher("NOSBogStart")
  end
end
NOV1_AlwaysSetup_Launcher = L0_0
function L0_0()
  Print("V1 Always Setup")
  NO_V1_SkipIntro = true
  if GetGlobal("NO_ghostintroplayed") == 0 then
    GetPrefabData("NOSBogStart").ToFlyThrough = "True"
    GetPrefabData("NOSBogStart").SkipSideCameraRelease = "True"
  else
    Enable("ZoneInMSCameraTriggerv1")
    SetCameraAttributes("ZoneInMSCameraTriggerv1")
  end
  StartFadeOut(0)
  wait(0.1)
  StartTrackingCurrentLevelForScoring("NO_BE_JigSaw")
  SetGlobal("NO_NewOrleansProgress", 1)
  if GetGlobal("MS_MeanStreetProgress") == 1 then
    SetGlobal("MS_MeanStreetProgress", 4)
  end
  if GetGlobal("NO_V1_OpeningIGC_Played") == 1 then
    Disable("hub_nosquare_v1.PlaneTrigger_introIGC")
  end
  SetGlobal("NO_timedlamp", 0)
  DestroyEntity("hub_nosquare_dynamic.BogStoreSign")
  if GetGlobal("NO_mansiongateopened") == 1 then
    AnimGBSequence("hub_nosquare.MansionDoors", "OPEN")
    AudioPostEventOn(GetPlayer(), "Play_sfx_NOS_Gate_Open")
  end
  if GetGlobal("NO_louisgone") == 0 and GetGlobal("NO_gilbertgate_Played") == 0 then
    Enable("hub_nosquare_v1.Spawner_NPC_Louis")
  end
  if GetGlobal("NO_ghostintroplayed") == 1 then
    Print("Gilbert Teleport Check")
    SetNPCState("hub_nosquare_v1.GhostGilbert", 0)
    ForEachEntityInGroup(Enable, "hub_nosquare_v1_Ghosts")
    if GetGlobal("NO_gilbertfear_Played") == 0 then
      TeleportToEntity("hub_nosquare_v1.GhostGilbert", "hub_nosquare_v1.Marker(Parentable) 07")
    else
      TeleportToEntity("hub_nosquare_v1.GhostGilbert", "hub_nosquare_v1.GilbertScareQuestMarker")
    end
  else
    SetNPCState("hub_nosquare_v1.GhostGilbert", 1)
    Enable("hub_nosquare_v1.Spawner_GhostsGilbertIntro")
  end
  if GetGlobal("NO_gilbertgate_Played") == 1 then
    DestroyEntity("hub_nosquare_v1.Louis")
  end
  if GetGlobal("NO_bookget") == 1 then
    ForEachEntityInGroup(DestroyEntity, "NOBook")
  end
  DestroyEntity("TownSquareBell")
  if GetGlobal("NO_bookget") == 1 and "NO_bookintro" == 1 then
    FireSequence("hub_nosquare_v1.GhostIan", "NO_bookturnin")
  end
  if GetGlobal("NO_lamps") < 8 then
    SetGlobal("NO_lamps", 0, true)
  else
    ForEachEntityInGroup(ForcePainted, "Lantern")
    SetGlobal("No_lamps", 8, true)
  end
  ForEachEntityInGroup(Enable, "hub_nosquare_v1_Spawners_NPCs")
  SetupPlants()
  ForEachEntityInGroup(ForcePainted, "BogPlantV1")
  NO_SetDefaultCamera()
  ShowHud()
  NO_SetupMap()
  StartFadeIn(1)
  if GetGlobal("no_louiscourage") == 1 then
    ForEachEntityInGroup(DestroyEntity, "NOMedal")
    if GetGlobal("NO_BuyLouisBadge_Played") == 0 then
      ForcePainted("NOBridgeV1_IanBadge")
      wait(0.2)
      TeleportToEntity("hub_nosquare_v1.GhostIan", "hub_nosquare_v1.IanDockMarker")
      Wait(0.2)
      Enable("hub_nosquare_v1.IanBuyBadgeTrig")
      Enable("hub_nosquare_v1.IanBuyBadgeTrig01")
    end
  end
  SetGlobal("VL_PlantsLeftBE", 20 - GetGlobal("NO_PlantsPainted"), true)
  if GetGlobal("NO_ghostintroplayed") == 0 then
    NO_ghostIGC()
  elseif NO_V1_SaveInitialCheckpoint == true then
    NO_V1_SaveInitialCheckpoint = false
    NO_CheckpointSave()
  end
end
NOV1_AlwaysSetup = L0_0
function L0_0()
  AddPaintAmmo(GetPlayer(), 100)
end
RefillAmmo_Paint = L0_0
function L0_0()
  AddPaintAmmo(GetPlayer(), 100)
  AddThinnerAmmo(GetPlayer(), 100)
end
RefillAmmo = L0_0
function L0_0()
  if GetGlobal("NO_bookget") == 0 then
    FireSequence("hub_nosquare_v1.V1GusConvo", "NO_gusbookget")
  end
end
NO_gusbook = L0_0
function L0_0()
  if GetGlobal("NO_louiscourage") == 0 then
    TeleportToEntity("hub_nosquare_v1.GhostIan", "hub_nosquare_v1.IanDockMarker")
    Enable("hub_nosquare_v1.IanBuyBadgeTrig")
    FireSequence("hub_nosquare_v1.V1GusConvo", "NO_louisbadge")
  end
end
NO_guscourage = L0_0
function L0_0()
  if GetGlobal("NO_BuyLouisBadge_Played") == 0 then
    Disable("hub_nosquare_v1.IanBuyBadgeTrig")
    ForceSequence("hub_nosquare_v1.GhostIan", "NO_BuyLouisBadge")
  end
end
NO_BuyCourageBadge = L0_0
function L0_0()
  ForceSequence("hub_nosquare_v1.Louis", "NO_CourageQuestFailed")
end
NO_FailCourageQuest = L0_0
function L0_0()
  if GetGlobal("NO_louishelped") == 1 and GetGlobal("NO_bertrandhelped") == 1 then
    wait(2)
    FireSequence("hub_nosquare_v1.V1GusConvo", "NO_fearsdone")
  else
    DisableGuardianHint("hub_nosquare_v1.PlayerHintMarkers 01")
    DisableGuardianHint("hub_nosquare_v1.PlayerHintMarkers 02")
    DisableGuardianHint("hub_nosquare_v1.PlayerHintMarkers 03")
    NO_CheckpointSave()
  end
end
NO_guspeoplehelped = L0_0
function L0_0()
  Print("*****************NO_addtimedlamp: Add timed lamp")
  SetGlobal("NO_timedlamp", GetGlobal("NO_timedlamp") + 1)
  if GetGlobal("NO_timedlamp") == 3 and GetGlobal("NO_louishelped") == 0 and GetGlobal("NO_louisscared") == 0 then
    Print("All lamps lit")
    SetGlobal("NO_louisfear", 3)
    NO_scarelouis()
  end
end
NO_addtimedlamp = L0_0
function L0_0()
  Print("Subtract timed lamp")
  SetGlobal("NO_timedlamp", GetGlobal("NO_timedlamp") - 1)
end
NO_subtimedlamp = L0_0
function L0_0()
  if GetGlobal("NO_lampaccept") == 1 and GetGlobal("NO_bertrandhelped") == 0 then
    Print("-----Quest is active-----")
    SetGlobal("NO_lamps", GetGlobal("NO_lamps") + 1)
    if GetGlobal("NO_lamps") == 6 then
      ForceSequence("hub_nosquare_v1.V1GusConvo", "Genric Line 25")
    elseif GetGlobal("NO_lamps") == 8 then
      ForceSequence("hub_nosquare_v1.V1GusConvo", "Genric Line 29")
    end
  else
    SetGlobal("NO_lamps", GetGlobal("NO_lamps") + 1, true)
  end
end
NO_addlamp = L0_0
function L0_0()
  if GetGlobal("NO_lampaccept") == 1 and GetGlobal("NO_bertrandhelped") == 0 then
    Print("-----Quest is active-----")
    SetGlobal("NO_lamps", GetGlobal("NO_lamps") - 1)
  else
    SetGlobal("NO_lamps", GetGlobal("NO_lamps") - 1, true)
  end
end
NO_sublamp = L0_0
function L0_0()
  DisableMotion_Player(GetPlayer())
  SetGlobal("NO_louisscared", 1)
  RestrictCutSceneInput()
  SetPropertyFloat("hub_nosquare_v1.Louis", "UsableRadius", 0)
  FireSequence("hub_nosquare_v1.Louis", "NO_louisscared2")
  ForEachEntityInGroup(DestroyEntity, "Watch")
end
NO_scarelouis = L0_0
function L0_0()
  ForceUnpuddled("hub_nosquare_v1.Louis")
  ForceUnpuddled("hub_nosquare_v1.ScareIGCGhost")
  Print("Scare Ghost Move into position")
  Hide("hub_nosquare_v1.GhostGilbert")
  Enable("hub_nosquare_v1.Spawner_Gilbert_Scare")
  wait(0.5)
  Hide("hub_nosquare_v1.ScareIGCGhost")
  wait(0.2)
  TeleportToEntity("hub_nosquare_v1.ScareIGCGhost", "hub_nosquare_v1.PositionMarker_GhostStart")
  wait(1.3)
  EnterCutscene("hub_nosquare_v1.ScareIGCGhost", 7)
  wait(0.01)
  Unhide("hub_nosquare_v1.ScareIGCGhost")
end
NO_scarelouis2 = L0_0
function L0_0()
  Print("BOO!")
  StartFadeOut(2)
  TeleportToEntity(GetPlayer(), "hub_nosquare_v1.basicconvomedium_louisScareConvo.basicconvomedium.PlayerMarker")
  wait(1)
  ForceUnpuddled("hub_nosquare_v1.Louis")
  wait(0.1)
  TeleportToEntity("hub_nosquare_v1.Louis", "hub_nosquare_v1.basicconvomedium_louisScareConvo.basicconvomedium.OwnerMarker")
  ForceUnpuddled("hub_nosquare_v1.ScareIGCGhost")
  ForceUnpuddled("hub_nosquare_v1.Louis")
  wait(1)
  StartFadeInNoHUD()
  wait(1)
  EnterCutscene("hub_nosquare_v1.ScareIGCGhost", 8)
  wait(0.1)
  EnterCutscene("hub_nosquare_v1.Louis")
  AnimEvent("hub_nosquare_v1.Louis", EVENT_Start_Cutscene)
  wait(2)
  MoveToEntity("hub_nosquare_v1.Louis", "hub_nosquare_v1.Marker(Parentable) 07")
  Hide("hub_nosquare_v1.Louis")
  wait(0.1)
  SetPropertyFloat("hub_nosquare_v1.Louis", "UsableRadius", 2)
  ForceUnpuddled("hub_nosquare_v1.GhostGilbert")
  ForceUnpuddled("hub_nosquare_v1.ScareIGCGhost")
  AnimVarInt("hub_nosquare_v1.GhostGilbert", VAR_NPC_State, 0)
  ForceSequence("hub_nosquare_v1.GhostGilbert", "NO_gilbertgate")
  wait(0.8)
  Unhide("hub_nosquare_v1.GhostGilbert")
  MoveToEntity("hub_nosquare_v1.ScareIGCGhost", "hub_nosquare_v1.Marker(Parentable) 07")
  Hide("hub_nosquare_v1.ScareIGCGhost")
  UnrestrictCutSceneInput()
end
NO_scarelouis3 = L0_0
function L0_0()
  SetGlobal("NO_mansiongateopened", 1)
  FireUser1("cameraGateOpen")
  AnimGBSequence("hub_nosquare.LouisShackDoor", "Rest")
  DisableGuardianHint("hub_nosquare_v1.PlayerHintMarkers 01")
end
NO_openmansiondoor = L0_0
function L0_0()
  GetPrefabData("cameraGateOpen").shotOrder = "middle"
end
NO_ScareAdjustCamera = L0_0
function L0_0()
  Print("################## SCARE CLEANUP")
  MoveToEntity("hub_nosquare_v1.GhostGilbert", "hub_nosquare_v1.Marker(Parentable) 07")
  AnimGBSequence("hub_nosquare.MansionDoors", "OPEN")
  AudioPostEventOn(GetPlayer(), "Play_sfx_NOS_Gate_Open")
  Wait(4)
  if GetGlobal("NO_louisscared") == 2 then
    EnableMotion_Player(GetPlayer())
    MoveToEntity(GetPlayer(), "hub_nosquare_v1.PositionMarker_AfterExitOpens")
  end
  UnrestrictCutSceneInput()
  NO_CheckpointSave()
end
NO_scareCleanup = L0_0
function L0_0()
  Print("Ghost IGC Check 1")
  if GetGlobal("NO_ghostintroplayed") == 0 then
    Print("Ghost IGC Check 2")
    SetGlobal("NO_ghostintroplayed", 1)
    HideHud()
    ShowReticleOnly()
    TeleportToEntity(GetPlayer(), "hub_nosquare_v1.GhostIGCMickey")
    GrabCamera("hub_nosquare_v1.CameraControlPoint 03", "hub_nosquare_v1.Marker(Parentable) 10", CAMERA_LERP_TRANSITION, 0)
    SetLetterbox(true)
    StartFadeInNoHUD(1)
    EnterCutscene("hub_nosquare_v1.GhostGilbert")
    wait(0.1)
    AnimVarInt("hub_nosquare_v1.GhostGilbert", VAR_Cutscene, 0)
    AnimEvent("hub_nosquare_v1.GhostGilbert", EVENT_Start_Cutscene)
    AnimGBSetIdle("hub_nosquare_v1.GhostGilbert", false)
    wait(1.5)
    ForceSequence("hub_nosquare_v1.GhostGilbert", "NO_GilbertIntro1")
    wait(5)
  end
end
NO_ghostIGC = L0_0
function L0_0()
  EnterCutscene("hub_nosquare_v1.GhostGilbert")
  wait(0.1)
  AnimVarInt("hub_nosquare_v1.GhostGilbert", VAR_Cutscene, 3)
  AnimEvent("hub_nosquare_v1.GhostGilbert", EVENT_Start_Cutscene)
  ForceSequence("hub_nosquare_v1.GhostGilbert", "NO_GilbertIntro2")
end
NO_ghostIGC2 = L0_0
function L0_0()
  GrabCamera("hub_nosquare_v1.CameraControlPointGhostIGC2", "hub_nosquare_v1.Marker(Parentable) 06", CAMERA_LERP_TRANSITION, 0)
  EnterCutscene("hub_nosquare_v1.GenericGhost 01")
  wait(0.1)
  AnimVarInt("hub_nosquare_v1.GenericGhost 01", VAR_Cutscene, 1)
  AnimEvent("hub_nosquare_v1.GenericGhost 01", EVENT_Start_Cutscene)
  wait(0.1)
  ForceSpawn("hub_nosquare_v1.GhostFXSpawner", 1)
  Unhide("hub_nosquare_v1.GenericGhost 01")
  wait(1.3)
  TeleportToEntity("hub_nosquare_v1.GenericGhost 01", "hub_nosquare_v1.Ghostmarker1")
  wait(0.1)
  EnterCutscene("hub_nosquare_v1.GenericGhost 02")
  wait(0.1)
  AnimVarInt("hub_nosquare_v1.GenericGhost 02", VAR_Cutscene, 2)
  AnimEvent("hub_nosquare_v1.GenericGhost 02", EVENT_Start_Cutscene)
  wait(0.1)
  ForceSpawn("hub_nosquare_v1.GhostFXSpawner", 1)
  Unhide("hub_nosquare_v1.GenericGhost 02")
  wait(1.3)
  TeleportToEntity("hub_nosquare_v1.GenericGhost 02", "hub_nosquare_v1.Ghostmarker2")
  wait(0.1)
  EnterCutscene("hub_nosquare_v1.GenericGhost 03")
  wait(0.1)
  AnimVarInt("hub_nosquare_v1.GenericGhost 03", VAR_Cutscene, 3)
  AnimEvent("hub_nosquare_v1.GenericGhost 03", EVENT_Start_Cutscene)
  wait(0.1)
  ForceSpawn("hub_nosquare_v1.GhostFXSpawner", 1)
  Unhide("hub_nosquare_v1.GenericGhost 03")
  wait(1.3)
  TeleportToEntity("hub_nosquare_v1.GenericGhost 03", "hub_nosquare_v1.Ghostmarker3")
  ExitCutscene("hub_nosquare_v1.GhostGilbert")
  AnimVarInt("hub_nosquare_v1.GhostGilbert", VAR_Mood_Type, 1)
  AnimVarInt("hub_nosquare_v1.GhostGilbert", VAR_NPC_State, 0)
  wait(1)
  AnimVarInt("hub_nosquare_v1.GenericGhost 01", VAR_NPC_State, 4)
  AnimVarInt("hub_nosquare_v1.GenericGhost 02", VAR_NPC_State, 5)
  AnimVarInt("hub_nosquare_v1.GenericGhost 03", VAR_NPC_State, 6)
  FireSequence("hub_nosquare_v1.GhostGilbert", "NO_gilbertintro")
end
NO_ghostIGC3 = L0_0
function L0_0()
  StartFadeOut(0.5)
  wait(0.7)
  TeleportToEntity(GetPlayer(), "hub_nosquare_v1.Marker(Rotatable) 01")
  Disable("ZoneInMSCameraTriggerv1")
  StartFadeIn(0.5)
  UnrestrictCutSceneInput()
  UnrestrictCutSceneInput()
  SetCharacterInConversation(GetPlayer(), 0)
  ClearAllCameraAttributes()
  CameraReset()
  SetGlobal("NO_GilbertNoTalk", 1)
  UnrestrictCutSceneInput()
  ShowReticleOnly()
  ShowHud()
  Prefab_ProjectorMickeyMove()
  EnterCutscene("hub_nosquare_v1.GhostGilbert", 1)
  wait(0.2)
  wait(4.3)
  TeleportToEntity("hub_nosquare_v1.GhostGilbert", "hub_nosquare_v1.Marker(Parentable) 03")
  wait(1)
  ForceUnpuddled("hub_nosquare_v1.GhostGilbert")
  ExitCutscene("hub_nosquare_v1.GhostGilbert")
  SetGlobal("NO_GilbertNoTalk", 0)
  Enable("hub_nosquare_v1.Spawner_NPC_GhostGabriel")
  Enable("hub_nosquare_v1.Spawner_NPC_GhostIan")
  wait(0.5)
  EnterCutscene("hub_nosquare_v1.GenericGhost 01", 4)
  wait(1)
  EnterCutscene("hub_nosquare_v1.GenericGhost 03", 6)
  wait(3)
  ExitCutscene("hub_nosquare_v1.GenericGhost 01")
  DestroyEntity("hub_nosquare_v1.GenericGhost 01")
  wait(0.25)
  EnterCutscene("hub_nosquare_v1.GenericGhost 02", 5)
  wait(1)
  ExitCutscene("hub_nosquare_v1.GenericGhost 03")
  DestroyEntity("hub_nosquare_v1.GenericGhost 03")
  wait(1.5)
  ExitCutscene("hub_nosquare_v1.GenericGhost 02")
  DestroyEntity("hub_nosquare_v1.GenericGhost 02")
end
NO_GilbertDisappear = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.8)
  UnpauseAllAI()
  UnrestrictCutSceneInput()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  wait(0.1)
  StartFadeIn(0.5)
end
NOS_ReleaseCamRestricted = L0_0
function L0_0()
  EnterCutscene("hub_nosquare_v1.GhostIan", 1)
  wait(1)
  TeleportToEntity("hub_nosquare_v1.GhostIan", "hub_nosquare_v1.IanIslandMarker")
  wait(3)
  ExitCutscene("hub_nosquare_v1.GhostIan")
  SetPropertyFloat("hub_nosquare_v1.GhostIan", "UsableRadius", 2)
end
NO_IanDisappear = L0_0
function L0_0()
  EnterCutscene("hub_nosquare_v1.GhostGilbert", 1)
  wait(4)
  TeleportToEntity("hub_nosquare_v1.GhostGilbert", "hub_nosquare_v1.GilbertScareQuestMarker")
  wait(1)
  ExitCutscene("hub_nosquare_v1.GhostGilbert")
end
NO_GilbertToShack = L0_0
function L0_0()
  RestrictCutSceneInput()
  GrabCameraNif("hub_nosquare_v1.NOS_visit1_hub_intro_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("hub_nosquare_v1.NOS_visit1_hub_intro_cam 01")
  AnimGBSequence("hub_nosquare_v1.NOS_visit1_hub_intro_cam 01", "NOS_visit1_hub_intro_cam")
  wait(50)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  UnrestrictCutSceneInput()
end
NO_introflythrough = L0_0
function L0_0(A0_2, A1_3)
  if A1_3 == "puddle" then
    SetGlobal("NO_NPCPuddle", GetGlobal("NO_NPCPuddle") + 1)
  elseif A1_3 == "restore" then
    SetGlobal("NO_NPCPuddle", GetGlobal("NO_NPCPuddle") - 1)
  end
end
NO_PuddleCount = L0_0
function L0_0()
  ForceUnpuddled("hub_nosquare_v1.GhostIan")
end
NO_Ian_Unpuddle = L0_0
