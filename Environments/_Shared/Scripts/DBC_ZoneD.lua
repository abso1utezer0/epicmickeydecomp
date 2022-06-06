local L0_0, L1_1
L0_0 = 0
DBC_ZoneD_TimFree = L0_0
L0_0 = 0
DBC_ZoneD_KeySpawn = L0_0
function L0_0()
  StartTrackingCurrentLevelForScoring("DBC_ZoneD")
  GrabCamera("dbc_zoned_dynamic.IntroCamera 03", nil, CAMERA_LERP_TRANSITION, 0)
  SetDefaultCameraValues(6.25, 18, -10)
  SetMap(nil, "MAP_DBC_ZONED", "GAME")
  if GetGlobal("DBC_ZoneD_SteamPuzzleFinished") == 0 then
    SetGlobal("DBC_ZoneD_SteamHoles", 0)
    ForEachEntityInGroup(DisableComponent, "PipeGuardianMarkers", "Guardian Hint Component")
    DisableComponent("dbc_zoned_dynamic.PlayerHintMarkersExitDoor", "Guardian Hint Component")
  elseif GetGlobal("DBC_ZoneD_SteamPuzzleFinished") == 1 then
    DisableComponent("dbc_zoned_dynamic.PlayerHintMarkersStainedGlass", "Guardian Hint Component")
    ForEachEntityInGroup(DisableComponent, "PipeGuardianMarkers", "Guardian Hint Component")
    ForEachEntityInGroup(DestroyEntity, "dbc_zoned_dynamic.ThinnerPipeCoverTriggers")
    AnimGBSequence("dbc_zoned_dynamic.DBC_ZoneD_Thinner 03", "Rest")
    DestroyEntity("dbc_zoned_dynamic.TriggerDamageVolume_ThinnerPoolforJigsaw")
    DestroyEntity("ThinnerPoolVolume")
    DestroyEntity("dbc_zoned_dynamic.DBC_ZoneD_ThinnerKillTrigger 01")
    DestroyEntity("dbc_zoned_dynamic.DBC_ZoneD_Thinner 02")
    DestroyEntity("dbc_zoned_dynamic.DBC_ZoneD_Thinner 01")
    ForcePainted("dbc_zoned_dynamic.PipeCover 01")
    ForcePainted("dbc_zoned_dynamic.PipeCover 02")
    ForcePainted("dbc_zoned_dynamic.PipeCover 03")
    ForcePainted("dbc_zoned_dynamic.PipeCover 04")
    ForcePainted("dbc_zoned_dynamic.PipeCover 05")
    StopEmitters("dbc_zoned_dynamic.SteamJet 06")
    StopEmitters("dbc_zoned_dynamic.SteamJet 07")
    StopEmitters("dbc_zoned_dynamic.SteamJet 09")
    StopEmitters("dbc_zoned_dynamic.SteamJet 10")
    StopEmitters("dbc_zoned_dynamic.SteamJet 11")
    if GetGlobal("DBC_ZoneD_KeyGet") == 0 then
      ForceSpawn("dbc_zoned_dynamic.BlobSpawner 02", 1)
      ForEachEntityInGroup(FireUser1, "dbc_zoned_SpawnerPipes")
    end
    if GetGlobal("DBC_ZoneD_KeyGet") == -1 then
      ForceSpawn("dbc_zoned_dynamic.KeySpawner 01", 1)
    end
    if GetGlobal("DBC_ZoneD_KeyGet") == 2 then
      AnimGBSequence("dbc_zoned_dynamic.DBC_ZoneD_ExitDoor01 01", "Open")
      Disable("dbc_zoned_dynamic.DoorUseTrigger 01")
      AudioPostEventOn("dbc_zoned_audio.Sound_BigDoor", "Play_sfx_dbc_labExitDoor_Open")
    end
  end
end
DBC_ZoneD_CheckpointReload = L0_0
function L0_0(A0_2)
  if GetGlobal("DBC_ZoneD_KeyGet") == -1 or GetGlobal("DBC_ZoneD_KeyGet") == 2 or GetGlobal("DBC_ZoneD_KeyGet") == 1 then
    ForEachEntityInGroup(DestroyEntity, "dbc_zoned_dynamic.SpatterRanged_Hard")
  end
end
DBC_ZoneD_KillSelf = L0_0
function L0_0(A0_3, A1_4, A2_5)
  if GetGlobal(A2_5) == 0 then
  elseif GetGlobal(A2_5) == 1 then
    DestroyEntity(A0_3)
    DestroyEntity(A1_4)
  end
end
DBC_ZoneD_gremlinset = L0_0
function L0_0(A0_6)
  if GetGlobal("DBC_1st_RightGremlin") == 1 then
    DestroyEntity(A0_6)
  end
end
DBC_ZoneD_TriggerCheck = L0_0
function L0_0()
  StartFadeOut(0.5)
  SetDefaultCameraValues(6.25, 18, -10)
  wait(0.5)
  SetLetterbox(0)
  ShowHud()
  GrabCamera("dbc_zoned_dynamic.IntroCamera 03", nil, CAMERA_LERP_TRANSITION, 0)
  StartFadeIn(0.5)
  if GetGlobal("DBC_ZoneD_IntroCutscene") == 0 then
    wait(1)
    SetGlobal("DBC_ZoneD_IntroCutscene", 1)
    SaveCheckpoint(nil, "DBC_ZoneD_CheckpointReload", "dbc_zoned_dynamic.StartPositionMarker 01")
  end
end
DBC_ZoneD_IntroNoCamera = L0_0
function L0_0()
  SetGlobal("MS_MeanStreetProgress", 6)
  if GetGlobal("DBC_ZoneD_IntroCutscene") == 0 then
    HideHud()
    ForEachEntityInGroup(DisableComponent, "PipeGuardianMarkers", "Guardian Hint Component")
    DisableComponent("dbc_zoned_dynamic.PlayerHintMarkersExitDoor", "Guardian Hint Component")
    HideHud()
    AnimEvent(GetPlayer(), EVENT_Special_5)
    SetMap(nil, "MAP_DBC_ZONED", "GAME")
    FireUser1("IntroCamera")
    StartTrackingCurrentLevelForScoring("DBC_ZoneD")
    StreamInterior(nil, "stream_sleepingbeauty2d")
  end
end
DBC_ZoneD_IntroCamera = L0_0
function L0_0()
  GrabCamera("dbc_zoned_dynamic.IntroCamera 03", GetPlayer(), CAMERA_EASING_TRANSITION, 2)
end
DBC_ZoneD_ReleaseIntroCamera = L0_0
function L0_0()
  ReleaseCamera(CAMERA_EASING_TRANSITION, 1.5)
end
DBC_ZoneD_ReleaseIntroCameraAll = L0_0
function L0_0(A0_7)
  FireSequence(A0_7, "DBC_ZoneD_MortimerFreeThanks")
  wait(2)
end
DBC_ZoneD_FreeMort = L0_0
function L0_0(A0_8, A1_9)
  SetGlobal(A1_9, GetGlobal(A1_9) + 1)
end
DBC_ZoneD_GlobalAdd = L0_0
function L0_0(A0_10, A1_11)
  SetGlobal(A1_11, GetGlobal(A1_11) - 1)
end
DBC_ZoneD_GlobalSub = L0_0
L0_0 = false
DBC_ThinnerPumpActive = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneD_SteamPuzzleFinished") == 0 and TimerGetState() == "Expired" and DBC_ThinnerPumpActive == false then
    DBC_ThinnerPumpActive = true
    FireUser1("PipeCameras")
    ForEachEntityInGroup(StopEmitters, "dbc_zoned_dynamic.SteamJet 01")
    AnimGBSequence("dbc_zoned_dynamic.DBC_ZoneD_ThinnerMachine_01 01", "Working")
    AnimGBSequence("dbc_zoned_dynamic.DBC_ZoneD_Thinner 03", "Down")
    AudioPostEventOn(GetPlayer(), "Pause_Ambiance")
    AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_SecondVisit_Drain")
    MultiPosSoundStop("dbc_zoned_audio.Sound_ThinnerCore 01")
    DisableComponent("dbc_zoned_dynamic.PlayerHintMarkersStainedGlass", "Guardian Hint Component")
    ForEachEntityInGroup(EnableComponent, "PipeGuardianMarkers", "Guardian Hint Component")
    Wait(1)
    DBC_ThinnerPumpActive = false
  end
end
DBC_ZoneD_ThinnerPump = L0_0
function L0_0()
  local L0_12
  L0_12 = wait
  L0_12(1)
  L0_12 = TimerStart
  L0_12(45)
  L0_12 = "Ticking"
  while L0_12 == "Ticking" do
    wait(0.5)
    L0_12 = TimerGetState()
  end
  if GetGlobal("DBC_ZoneD_SteamHoles") < 5 then
    ForEachEntityInGroup(DisableComponent, "PipeGuardianMarkers", "Guardian Hint Component")
    EnableComponent("dbc_zoned_dynamic.PlayerHintMarkersStainedGlass", "Guardian Hint Component")
    ForEachEntityInGroup(StartEmitters, "dbc_zoned_dynamic.SteamJet 01")
    AnimGBSequence("dbc_zoned_dynamic.DBC_ZoneD_ThinnerMachine_01 01", "Broken")
    AnimGBSequence("dbc_zoned_dynamic.DBC_ZoneD_Thinner 03", "RiseUp")
    Print("*****************************Thinner Rising")
    AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_SecondVisit_Fill")
  end
end
DBC_ZoneD_ThinnerPumpSecondState = L0_0
L0_0 = 0
DBC_ZoneD_FirstStep = L0_0
L0_0 = 0
DBC_ZoneD_FirstPipe = L0_0
function L0_0(A0_13, A1_14)
  StopEmitters(A0_13)
  if GetGlobal("DBC_ZoneD_SteamPuzzleFinished") == 0 then
    DisableComponent(A1_14, "Guardian Hint Component")
    SetGlobal("DBC_ZoneD_SteamHoles", GetGlobal("DBC_ZoneD_SteamHoles") + 1)
    if GetGlobal("DBC_ZoneD_SteamHoles") < 5 then
      FireSequence("dbc_zoned_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneD_Pipe" .. GetGlobal("DBC_ZoneD_SteamHoles"))
    elseif GetGlobal("DBC_ZoneD_SteamHoles") == 5 then
      EnableComponent("dbc_zoned_dynamic.PlayerHintMarkersExitDoor", "Guardian Hint Component")
      TimerStop()
      ForEachEntityInGroup(StopEmitters, "dbc_zoned_dynamic.SteamJet 01")
      AnimGBSequence("dbc_zoned_dynamic.DBC_ZoneD_ThinnerMachine_01 01", "Rest")
      AnimGBSequence("dbc_zoned_dynamic.DBC_ZoneD_Thinner 03", "Rest")
      DestroyEntity("ThinnerPoolVolume")
      SetGlobal("DBC_ZoneD_SteamPuzzleFinished", 1)
      AudioPostEventOn(GetPlayer(), "Stop_sfx_DBC_SecondVisit_Fill")
      StopEmitters(A0_13)
      FireSequence("dbc_zoned_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneD_Pipe6")
    end
  end
end
DBC_ZoneD_SteamPipes = L0_0
function L0_0()
  FireUser1("BlobSpawnCutscene")
  wait(0.8)
  DoStinger("IGC", 8)
  ForceSpawn("dbc_zoned_dynamic.BlobSpawner 01", 1)
  wait(1)
  AnimGBSequence("dbc_zoned_dynamic.DBC_ZoneD_ExitDoor01 01", "Open")
  AudioPostEventOn("dbc_zoned_audio.Sound_BigDoor", "Play_sfx_dbc_labExitDoor_Open")
  wait(5)
  AudioPostEventOn(GetPlayer(), "Resume_Music_Ambiance")
  wait(1)
  ForEachEntityInGroup(FireUser1, "dbc_zoned_SpawnerPipes")
end
DBC_ZoneD_SteamPipesFixedSequence = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.8)
  MoveToEntity("dbc_zoned_dynamic.TheBlob_Hard 01", "dbc_zoned_dynamic.BlobSpawner 02")
  StartFadeIn(0.8)
  ShowHud()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  SaveCheckpoint(nil, "DBC_ZoneD_CheckpointReload", "dbc_zoned_dynamic.StartPositionMarker 01")
  UnrestrictCutSceneInput()
  AnimGBSequence("dbc_zoned_dynamic.DBC_ZoneD_ExitDoor01 01", "Close")
end
DBC_ZoneD_SteamPipesFixedCameraReturn = L0_0
function L0_0(A0_15, A1_16)
  if GetGlobal("DBC_ZoneD_SteamPuzzleFinished") == 0 then
    EnableComponent(A1_16, "Guardian Hint Component")
    SetGlobal("DBC_ZoneD_SteamHoles", GetGlobal("DBC_ZoneD_SteamHoles") - 1)
  end
  StartEmitters(A0_15)
end
DBC_ZoneD_SteamPipesThin = L0_0
function L0_0(A0_17, A1_18)
  print("**************i got stimmed!!!!!")
  if StimulusEvent_HasStimulusType(A1_18, 0) then
    print("**************i got thinned!!!!!")
    if StimulusEvent_Source(A1_18) ~= GetPlayer() then
      print("**************the slobber did it!!!!!")
      if GetGlobal("DBC_ZoneD_SteamPuzzleFinished") == 0 then
        FireSequence("dbc_zoned_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneD_PipeThinned")
      end
    elseif StimulusEvent_Source(A1_18) == GetPlayer() then
      print("**************mickey did it!!!!!")
    end
  end
end
DBC_ZoneD_SteamPipesThinStimCheck = L0_0
function L0_0(A0_19)
  if DBC_ZoneD_KeySpawn == 0 then
    SetGlobal("DBC_ZoneD_KeyGet", -1)
    GetFacing("dbc_zoned_dynamic.TheBlob_Hard 01").y = GetFacing("dbc_zoned_dynamic.TheBlob_Hard 01").y + 2
    GetFacing("dbc_zoned_dynamic.TheBlob_Hard 01"):normalize3()
    Print("********************************* velocity: " .. (GetFacing("dbc_zoned_dynamic.TheBlob_Hard 01") * 5.2).x .. ", " .. (GetFacing("dbc_zoned_dynamic.TheBlob_Hard 01") * 5.2).y .. ", " .. (GetFacing("dbc_zoned_dynamic.TheBlob_Hard 01") * 5.2).z)
    ApplyImpulse(ForceSpawn("dbc_zoned_dynamic.TheBlob_Hard 01", 1)[1], (GetFacing("dbc_zoned_dynamic.TheBlob_Hard 01") * 5.2).x, (GetFacing("dbc_zoned_dynamic.TheBlob_Hard 01") * 5.2).y, (GetFacing("dbc_zoned_dynamic.TheBlob_Hard 01") * 5.2).z)
    DBC_ZoneD_KeySpawn = 1
    AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_Lab2_KeySpawn")
    wait(1)
    FireSequence("dbc_zoned_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneD_KeySpawn")
    wait(3)
    SaveCheckpoint(nil, "DBC_ZoneD_CheckpointReload", "dbc_zoned_dynamic.StartPositionMarker 01")
  end
end
DBC_ZoneD_KillBlob = L0_0
function L0_0(A0_20, A1_21)
  if DBC_ZoneD_KeySpawn == 0 then
    FireUser1(A1_21)
  end
end
DBC_Zoned_KillSweepers = L0_0
function L0_0()
  SetGlobal("DBC_ZoneD_KeyGet", 1)
  FireSequence("dbc_zoned_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneD_KeyGrab")
end
DBC_ZoneD_KeyGrab = L0_0
function L0_0(A0_22)
  if GetGlobal("DBC_ZoneD_KeyGet") == 0 then
    FireSequence("dbc_zoned_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneD_DoorHint")
  elseif GetGlobal("DBC_ZoneD_KeyGet") == 1 then
    RestrictCutSceneInput()
    StartFadeOut(0.2)
    wait(0.2)
    MoveToEntity(GetPlayer(), "dbc_zoned.CameraLookatMarker 01")
    GrabCamera("dbc_zoned_dynamic.LedgeHintCamera 02", "dbc_zoned.CameraLookatMarker 01", CAMERA_LERP_TRANSITION, 0)
    StartFadeIn(0.2)
    wait(1)
    AnimGBSequence("dbc_zoned_dynamic.DBC_ZoneD_ExitDoor01 01", "Open")
    AudioPostEventOn("dbc_zoned_audio.Sound_BigDoor", "Play_sfx_dbc_labExitDoor_Open")
    wait(1.5)
    ReleaseCamera(CAMERA_LERP_TRANSITION, 2)
    UnrestrictCutSceneInput()
    SetGlobal("DBC_ZoneD_KeyGet", 2)
    Disable(A0_22)
  end
end
DBC_ZoneD_ExitDoor = L0_0
function L0_0()
  SetCameraAttributes("dbc_zoned_dynamic.LedgeCameraOverride 01")
end
DBC_ZoneD_CameraLedgeHint = L0_0
function L0_0()
  SetCameraAttributes("dbc_zoned_dynamic.LedgeCameraOverride 02")
end
DBC_ZoneD_CameraLedgeHint2 = L0_0
function L0_0()
  ClearAllCameraAttributesTimed(1)
end
DBC_ZoneD_CameraLedgeRelease = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneD_SteamHoles2") == 0 then
    GrabCamera("dbc_zoned_dynamic.StartupCamera 01", nil, CAMERA_LERP_TRANSITION, 0)
  end
end
DBC_ZoneD_CameraStart = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
end
DBC_ZoneD_CameraStartRelease = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_ZoneD_CheckpointReload", "dbc_zoned_dynamic.StartPositionMarker 01")
  RestrictCutSceneInput()
  ShowHud()
  wait(2)
  UnrestrictCutSceneInput()
  DBC_ZoneD_StartThinnerForChest()
end
DBC_ZoneD_RedChestSave = L0_0
function L0_0(A0_23, A1_24)
  Print("************************************************CheckingChestGlobal: " .. A1_24)
  if GetGlobal(A1_24) == 1 then
    AnimGBSequence(A0_23, "Idle_Open")
    ForcePainted(A0_23)
    wait(1.5)
    ForceSketched(A0_23)
  end
end
DBC_ZoneD_ChestOpenCheck = L0_0
function L0_0(A0_25, A1_26)
  if GetGlobal(A1_26) == 1 then
    DestroyEntity(A0_25)
  end
end
DBC_ZoneD_BreakMachineGlobalCheck = L0_0
function L0_0(A0_27, A1_28)
  if GetGlobal(A1_28) == 0 then
    Print("===============pausing thinner")
    AnimGBSetIdle("dbc_zoned_dynamic.DBC_ZoneD_Thinner 03", true)
    TimerPause()
  end
end
DBC_ZoneD_StopThinnerForChest = L0_0
function L0_0()
  AnimGBSetIdle("dbc_zoned_dynamic.DBC_ZoneD_Thinner 03", false)
  TimerUnpause()
end
DBC_ZoneD_StartThinnerForChest = L0_0
function L0_0(A0_29)
  local L1_30, L2_31
  L1_30 = 0
  L2_31 = 0
  L1_30, L2_31 = Jigsaw_GetPercentagePainted(A0_29)
  if L2_31 < 1 then
    Disable(A0_29)
  end
end
DBC_ZoneD_DisableHint = L0_0
