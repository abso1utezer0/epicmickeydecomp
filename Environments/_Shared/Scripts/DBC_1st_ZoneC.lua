local L0_0, L1_1
L0_0 = 0
DBC_1st_ZoneC_CurrentGear = L0_0
L0_0 = 0
DBC_1st_ZoneC_Gearbarks = L0_0
function L0_0(A0_2, A1_3, A2_4)
  if DBC_1st_ZoneC_Gearbarks == 0 then
    DBC_1st_ZoneC_Gearbarks = 1
    RestrictCutSceneInput()
    ForEachEntityInGroup(StartEmitters, "dbc_scaletest.Steam_BlastGear 0" .. A2_4)
    ForEachEntityInGroup(StopEmitters, "dbc_scaletest.Steam_Jet_01 0" .. A2_4)
    DBC_1st_ZoneC_CurrentGear = tonumber(A2_4)
    AudioPostEventOn(A0_2, "Play_sfx_DBC_Courtyard_GearLever_Med_Spin_start")
    SetRotatorMaxSpeed(A0_2, 360)
    DisableGlint(A0_2)
    wait(1)
    UnrestrictCutSceneInput()
    FireUser1("ExitDoorCamera")
    wait(2)
    AudioPostEventOn(A0_2, "Play_sfx_DBC_Courtyard_GearLever_Med_Spin_end")
    AnimGBSequence("dbc_scaletest.DBC_EntranceDoorB 01", "Opened")
  elseif DBC_1st_ZoneC_Gearbarks == 1 then
    DBC_1st_ZoneC_Gearbarks = 2
    DBC_1st_ZoneC_CurrentGear = tonumber(A2_4)
    RestrictCutSceneInput()
    ForEachEntityInGroup(StartEmitters, "dbc_scaletest.Steam_BlastGear 0" .. A2_4)
    ForEachEntityInGroup(StopEmitters, "dbc_scaletest.Steam_Jet_01 0" .. A2_4)
    AudioPostEventOn(A0_2, "Play_sfx_DBC_Courtyard_GearLever_Med_Spin_start")
    SetRotatorMaxSpeed(A0_2, 360)
    DisableGlint(A0_2)
    wait(1)
    UnrestrictCutSceneInput()
    FireUser1("AfterPortalReveal")
    wait(2)
    AudioPostEventOn(A0_2, "Play_sfx_DBC_Courtyard_GearLever_Med_Spin_end")
    AnimGBSequence("dbc_scaletest.DBC_ZoneB_Portcullis", "Raised")
    Wait(2)
    DoStinger("Stinger_Success", 7)
    SetGlobal("DBC_1st_ZoneC_PortalOpen", 1)
    StreamInterior(nil, "stream_4")
    SaveCheckpoint(GetPlayer(), "DBC_1st_ZoneC_LoadCheckpoint", "dbc_scaletest.CheckpointMarker 01")
  end
  wait(5)
  SetRotatorMaxSpeed(A0_2, 0)
end
DBC_1st_ZoneC_DoorGear = L0_0
function L0_0()
  if GetGlobal("DBC_1st_ZoneC_PortalOpen") == 0 then
    FireSequence("dbc_scaletest.Marker(Conversation) 01", "DBC_1st_ZoneC_GearHelp")
  end
end
DBC_1st_ZoneC_DoorDearReminder = L0_0
function L0_0()
  local L0_5
  L0_5 = "dbc_1st_zonec_igc.AI_Oswald 01"
  EnterCutscene(L0_5)
  AnimVarInt(L0_5, VAR_Cutscene, 3)
  AnimEvent(L0_5, EVENT_Start_Cutscene)
  wait(8)
  DestroyEntity(L0_5)
end
DBC_1st_ZoneC_OswaldRuns = L0_0
function L0_0()
  if DBC_1st_ZoneC_CurrentGear == 1 then
    StartFadeOut(0.8)
    wait(0.8)
    StartFadeIn(0.8)
    SetCameraAttributes("dbc_scaletest.RampCameraOverride 03")
    UnrestrictCutSceneInput()
    ShowHud()
    wait(2)
    ForEachEntityInGroup(StopEmitters, "dbc_scaletest.Steam_BlastGear 01")
  elseif DBC_1st_ZoneC_CurrentGear == 2 then
    StartFadeOut(0.8)
    wait(0.8)
    StartFadeIn(0.8)
    SetCameraAttributes("dbc_scaletest.RampCameraOverride 04")
    UnrestrictCutSceneInput()
    ShowHud()
    wait(2)
    ForEachEntityInGroup(StopEmitters, "dbc_scaletest.Steam_BlastGear 02")
  end
end
DBC_1st_ZoneC_ReturnGearCamera = L0_0
function L0_0()
  ActivateScene("environments/thepark/darkbeautycastle/gsa/dbc_1st_zoned.gsa")
  EndTrackingCurrentLevelForScoring("DBC_1st_ZoneC")
  RestrictCutSceneInput()
  StartFadeOut(0.8)
  wait(0.8)
  WaitForLevelLoad()
  SetGlobal("DBC_1st_FilmScreenCutscene", 1)
  AudioPostEventOn(GetPlayer(), "Stop_All_Sounds")
  PlayAndUnlockMovie("DBC_visit1_Training_Filmscreen.bik", "DBC_1st_FilmScreenCutscene")
  SetupPosition("DBC_1st_ZoneD_StarPosition")
  UnrestrictCutSceneInput()
end
DBC_1st_ZoneC_OutroCutscene = L0_0
function L0_0()
  SetGlobal("MS_MeanStreetProgress", 0)
  DisableGuardianSystem()
  StartFadeOut(0.2)
  wait(0.2)
  AnimGBSequence("dbc_scaletest.DBC_EntranceDoorB 01", "Rest")
  SetGlobal("DBC_1st_SeerCutcene", 1)
  PlayAndUnlockMovie("GV_Visit1_Training_Combat.bik", "DBC_1st_SeerCutcene")
  Unhide("dbc_scaletest.DBC_ZoneB_EntryDoorA1 01")
  UnrestrictCutSceneInput()
  CameraReset()
  StartFadeIn(0.2)
  ShowHud()
  SetMap(nil, "MAP_DBC_ZONEB", "MAP")
  SaveCheckpoint(GetPlayer(), "DBC_1st_ZoneC_LoadCheckpoint", "dbc_scaletest.CheckpointMarker 01")
end
DBC_1st_ZoneC_SpawnSeers = L0_0
L0_0 = 0
DEC_ZoneC_SeerSees = L0_0
function L0_0(A0_6)
  if DEC_ZoneC_SeerSees == 0 and GetCurrentTeam(A0_6) == 2 then
    DEC_ZoneC_SeerSees = 1
    RestrictCutSceneInput()
    GrabCamera("dbc_1st_zonec_igc.SeerCamera 01", "dbc_1st_zonec_combattut.FodderBlotling 01", CAMERA_EASING_TRANSITION, 1.5)
    Wait(1.7)
    FireSequence("dbc_scaletest.Marker(Conversation) 01", "DBC_1st_ZoneC_SeerSeesPlayer")
    Print("^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_Stopping the AI")
    PauseAllAI()
  end
end
DBC_1st_ZoneC_PlayerSighted = L0_0
function L0_0()
  SetPropertyBool("dbc_scaletest.NOS_HM_ZoneM_Gear01 01", "ForceInvulnerable", true)
  SetPropertyBool("dbc_scaletest.NOS_HM_ZoneM_Gear01 02", "ForceInvulnerable", true)
  FireSequence("dbc_scaletest.Marker(Conversation) 01", "DBC_1st_Spinattack")
  AudioPostEventOn(GetPlayer(), "Play_sfx_UI_DBC_ZoneB_PopUp_Text")
  wait(1)
  SetPropertyBool("dbc_scaletest.NOS_HM_ZoneM_Gear01 01", "ForceInvulnerable", false)
  SetPropertyBool("dbc_scaletest.NOS_HM_ZoneM_Gear01 02", "ForceInvulnerable", false)
end
DBC_1st_ZoneC_SpinGears = L0_0
function L0_0()
  FireSequence("dbc_scaletest.ConversationalTrigger 01", "DBC_1st_hall1_thinnerblast2")
  AudioPostEventOn(GetPlayer(), "Play_sfx_UI_DBC_ZoneB_PopUp_Text")
end
DBC_1st_ZoneC_ThinnerBlast = L0_0
L0_0 = 0
DBC_1st_ZoneC_GearLocked = L0_0
L0_0 = 0
DBC_1st_ZoneC_TrebuchetPosition = L0_0
L0_0 = 0
DBC_1st_ZoneC_TrebCameraReleased = L0_0
function L0_0()
  DBC_1st_ZoneC_GearLocked = 1
  if DBC_1st_ZoneC_TrebCameraReleased == 0 then
    PauseAllAI()
    DBC_1st_ZoneC_TrebCameraReleased = 1
    StartFadeOut(0.2)
    wait(0.2)
    MoveToEntity(GetPlayer(), "dbc_1st_zonec_igc.CalvinMarker 01")
    wait(0.1)
    DisableMovementInput(GetPlayer())
    SetCameraAttributes("dbc_scaletest.RampCameraOverride 06")
    StartFadeIn(0.2)
  end
  SetSplineFollowerInitialSpeed("dbc_scaletest.TrebuchetSplineFollower 01", 7)
  SplineFollower_StopAtPosition("dbc_scaletest.TrebuchetSplineFollower 01", "dbc_scaletest.TrebuchetSplineKnot 01", "dbc_scaletest.TrebuchetSplineKnot 02", 1)
  AudioPostEventOn("dbc_scaletest.DBC_TrebGear 01", "Play_sfx_DBC_Courtyard_PressurePlate_GearRaise")
end
DBC_1st_ZoneC_TrebuchetPPlate = L0_0
function L0_0()
  if DBC_1st_ZoneC_TrebuchetPosition < 3 then
    DBC_1st_ZoneC_TrebCameraReleased = 0
    ClearAllCameraAttributesTimed(1)
  end
end
DBC_1st_TrebuchetCameraRelease = L0_0
function L0_0()
  if DBC_1st_ZoneC_GearLocked == 1 then
    if DBC_1st_ZoneC_TrebuchetPosition == 0 then
      DBC_1st_ZoneC_TrebuchetPosition = 1
      AudioPostEventOn("dbc_scaletest.DBC_TrebGear 01", "Play_sfx_DBC_Courtyard_GearLever_Med_Spin_start")
      AnimGBSequence("dbc_scaletest.DBC_HandTrebuchetA1 01", "Drop1")
      SetRotatorMaxSpeed("dbc_scaletest.DBC_TrebGear 01", 360)
      SetRotatorMaxSpeed("dbc_scaletest.DBC_trebplat1 01", 46)
      StartRotateToPosition("dbc_scaletest.DBC_trebplat1 01", 60)
    elseif DBC_1st_ZoneC_TrebuchetPosition == 1 then
      DBC_1st_ZoneC_TrebuchetPosition = 2
      AudioPostEventOn("dbc_scaletest.DBC_TrebGear 01", "Play_sfx_DBC_Courtyard_GearLever_Med_Spin_start")
      AnimGBSequence("dbc_scaletest.DBC_HandTrebuchetA1 01", "Drop2")
      SetRotatorMaxSpeed("dbc_scaletest.DBC_TrebGear 01", 360)
      SetRotatorMaxSpeed("dbc_scaletest.DBC_trebplat1 01", 46)
      StartRotateToPosition("dbc_scaletest.DBC_trebplat1 01", 120)
    elseif DBC_1st_ZoneC_TrebuchetPosition == 2 then
      DBC_1st_ZoneC_TrebuchetPosition = 3
      DisableGlint("dbc_scaletest.DBC_TrebGear 01")
      TimerDisable("dbc_scaletest.SpinBarkLogicTimerMarker 01")
      AudioPostEventOn("dbc_scaletest.DBC_TrebGear 01", "Play_sfx_DBC_Courtyard_GearLever_Med_Spin_start")
      AnimGBSequence("dbc_scaletest.DBC_HandTrebuchetA1 01", "Drop3")
      SetRotatorMaxSpeed("dbc_scaletest.DBC_TrebGear 01", 360)
      SetRotatorMaxSpeed("dbc_scaletest.DBC_trebplat1 01", 46)
      StartRotateToPosition("dbc_scaletest.DBC_trebplat1 01", 180)
      AudioPostEventOn("dbc_1st_zonec_audio.Sound_Marker_Trebuchet", "Play_sfx_DBC_Courtyard_Catapult_Armed")
      DestroyEntity("TrebuchetCamera")
      EnableMovementInput(GetPlayer())
      FireUser1("CalvinReadyCamera01")
      Disable("dbc_scaletest.DBC_PressurePlateA1_Inert 01")
      UnpauseAllAI()
    end
    AudioPostEventOn("dbc_scaletest.DBC_TrebGear 01", "Play_sfx_DBC_Courtyard_GearLever_Med_Spin_end")
  end
end
DBC_1st_ZoneC_TrebuchetArm = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.8)
  SetCameraAttributes("dbc_scaletest.CalvinReadyCameraOverride 01")
  Enable("dbc_1st_zonec_igc.CatapultTriggerCameraRelease 02")
  StartFadeIn(0.8)
  ShowHud()
  UnrestrictCutSceneInput()
  FireSequence("dbc_scaletest.Marker(Conversation) 01", "DBC_1st_GremlinsAreGood01")
end
DBC_1st_ZoneC_TrebuchetCameraRelease = L0_0
function L0_0()
  DBC_1st_ZoneC_GearLocked = 0
  if DBC_1st_ZoneC_TrebuchetPosition < 3 then
    SplineFollower_StopAtPosition("dbc_scaletest.TrebuchetSplineFollower 01", "dbc_scaletest.TrebuchetSplineKnot 01", "dbc_scaletest.TrebuchetSplineKnot 02", 0)
    AudioPostEventOn("dbc_scaletest.DBC_TrebGear 01", "Play_sfx_DBC_Courtyard_PressurePlate_GearLower")
    AnimGBSequence("dbc_scaletest.DBC_HandTrebuchetA1 01", "Rest")
    if 0 < DBC_1st_ZoneC_TrebuchetPosition then
      SetRotatorMaxSpeed("dbc_scaletest.DBC_TrebGear 01", -720)
      SetRotatorMaxSpeed("dbc_scaletest.DBC_trebplat1 01", 180)
      StartRotateToPosition("dbc_scaletest.DBC_trebplat1 01", 0)
    end
    DBC_1st_ZoneC_GearLocked = 0
    DBC_1st_ZoneC_TrebuchetPosition = 0
  end
end
DBC_1st_ZoneC_TrebuchetArmReachedPosition = L0_0
function L0_0()
  SetRotatorMaxSpeed("dbc_scaletest.DBC_TrebGear 01", 0)
end
DBC_1st_ZoneC_TrebuchetStopSmallGear = L0_0
function L0_0()
  FireUser1("LaunchCalvinCamera")
  PauseAllAI()
  wait(2)
  AnimGBSequence("dbc_scaletest.DBC_HandTrebuchetA1 01", "Fling")
  FireSequence("dbc_scaletest.Marker(Conversation) 01", "DBC_1st_CatapultLaunched")
  SetGlobal("DBC_1st_FreeCalvin", 2)
end
DBC_1st_ZoneC_LaunchCalvin = L0_0
function L0_0()
  Print("*&*&*&*&*&*&*&*&*&*&*&*&*&*&DBC_1st_ZoneC_LaunchCalvinReturnCamera Fired")
  StartFadeOut(0.8)
  wait(0.8)
  StartFadeIn(0.8)
  ShowHud()
  UnpauseAllAI()
  UnrestrictCutSceneInput()
  SaveCheckpoint(GetPlayer(), "DBC_1st_ZoneC_LoadCheckpoint", "dbc_scaletest.CheckpointMarker 01")
  SetCameraAttributes("dbc_scaletest.RampCameraOverride 07")
end
DBC_1st_ZoneC_LaunchCalvinReturnCamera = L0_0
function L0_0()
  local L0_7
  L0_7 = RestrictCutSceneInput
  L0_7()
  L0_7 = PauseAllAI
  L0_7()
  L0_7 = ClearParent
  L0_7("GremlinCalvin")
  L0_7 = EnableMotion
  L0_7("GremlinCalvin")
  L0_7 = FireThread
  L0_7(TeleportGremlinToEntity, "GremlinCalvin", "dbc_1st_zonec_igc.CalvinMarker 01")
  L0_7 = wait
  L0_7(1)
  L0_7 = FireUser1
  L0_7("FreeCalvinCamera")
  L0_7 = wait
  L0_7(1)
  L0_7 = GetChildEntityByName
  L0_7 = L0_7("GremlinCalvin", "GremlinWrench")
  Unhide(L0_7)
  EnterCutscene("GremlinCalvin", 1)
  wait(1)
  MoveToEntity(GetPlayer(), "dbc_1st_zonec_igc.CalvinMarker 02")
  wait(1)
  StartEmitters("dbc_scaletest.Steam_Jet_01 05")
end
DBC_1st_ZoneC_FreeCalvin = L0_0
function L0_0()
  FireUser1("FreeCalvinCamera2")
  PauseAllAI()
  wait(2)
  AnimGBSequence("dbc_scaletest.DBC_HandTrebuchetA1 01", "Fling")
  SetRotatorMaxSpeed("dbc_scaletest.DBC_TrebGear 01", -720)
  SetRotatorMaxSpeed("dbc_scaletest.DBC_trebplat1 01", 180)
  StartRotateToPosition("dbc_scaletest.DBC_trebplat1 01", 0)
  wait(5)
  FireUser1("FreeCalvinCamera3")
  PauseAllAI()
  ExitCutscene("GremlinCalvin")
  TeleportGremlinToEntity("GremlinCalvin", "dbc_1st_zonec_igc.CalvinMarker 03")
  SetGlobal("DBC_1st_FreeCalvin", 1)
end
DBC_1st_ZoneC_FreeCalvin2 = L0_0
function L0_0()
  FireSequence("GremlinCalvin", "DBC_1st_ThanksA")
end
DBC_1st_ZoneC_ExtraPipBark = L0_0
function L0_0()
  SetPropertyInt(GetPlayer(), "MaxHealth", GetPropertyInt(GetPlayer(), "MaxHealth") + 1)
  SetPropertyInt(GetPlayer(), "Health", GetPropertyInt(GetPlayer(), "MaxHealth") + 1)
end
DBC_1st_ZoneC_GiveMickeyhealth = L0_0
function L0_0()
  DisableGuardianSystem()
  DestroyEntity("IntroCutsceneTrigger")
  DestroyEntity("dbc_1st_zonec_igc.AI_Oswald 01")
  AnimGBSequence("dbc_scaletest.DBC_EntranceDoorB 01", "Rest")
  if GetGlobal("DBC_1st_ZoneC_PortalOpen") == 1 then
    AnimGBSequence("dbc_scaletest.DBC_ZoneB_Portcullis", "Raised")
    AnimGBSequence("dbc_scaletest.DBC_EntranceDoorB 01", "Opened")
    DBC_1st_ZoneC_Gearbarks = 2
  else
    FireUser1("SeerPipe1")
  end
  if GetGlobal("DBC_1st_ZoneC_GuardianCutscene") == 1 then
    DestroyEntity("DBC_1st_ZoneC_GuardianTrigger")
  end
  if GetGlobal("DBC_1st_FreeCalvin") == 1 then
    DestroyEntity("GremlinCalvin")
    DestroyEntity("CalvinCage")
    DestroyEntity("TrebuchetCamera")
    DestroyEntity("dbc_1st_zonec_combattut.GusWarningTrigger 01")
    SetSplineFollowerInitialSpeed("dbc_scaletest.TrebuchetSplineFollower 01", 100)
    SplineFollower_StopAtPosition("dbc_scaletest.TrebuchetSplineFollower 01", "dbc_scaletest.TrebuchetSplineKnot 01", "dbc_scaletest.TrebuchetSplineKnot 02", 1)
    AnimGBSequence("dbc_scaletest.DBC_HandTrebuchetA1 01", "RestDown")
    DBC_1st_ZoneC_TrebuchetPosition = 3
    Disable("dbc_scaletest.DBC_PressurePlateA1_Inert 02")
    DisableGlint("dbc_scaletest.DBC_TrebGear 01")
    StartEmitters("dbc_scaletest.Steam_Jet_01 05")
  elseif GetGlobal("DBC_1st_FreeCalvin") == 2 then
    DestroyEntity("GremlinCalvin")
    DestroyEntity("CalvinCage")
    DestroyEntity("TrebuchetCamera")
    DestroyEntity("dbc_1st_zonec_combattut.GusWarningTrigger 01")
    DestroyEntity("dbc_scaletest.New TreasureChest 01")
    SetSplineFollowerInitialSpeed("dbc_scaletest.TrebuchetSplineFollower 01", 100)
    SplineFollower_StopAtPosition("dbc_scaletest.TrebuchetSplineFollower 01", "dbc_scaletest.TrebuchetSplineKnot 01", "dbc_scaletest.TrebuchetSplineKnot 02", 1)
    SetRotatorMaxSpeed("dbc_scaletest.DBC_trebplat1 01", 1080)
    StartRotateToPosition("dbc_scaletest.DBC_trebplat1 01", 180)
    AnimGBSequence("dbc_scaletest.DBC_HandTrebuchetA1 01", "RestDown")
    DBC_1st_ZoneC_TrebuchetPosition = 3
    Disable("dbc_scaletest.DBC_PressurePlateA1_Inert 02")
    DisableGlint("dbc_scaletest.DBC_TrebGear 01")
  end
  FireThread(DBC_1st_ZoneC_LoadCheckpointThread)
end
DBC_1st_ZoneC_LoadCheckpoint = L0_0
function L0_0()
  wait(0.1)
  Unhide("dbc_scaletest.DBC_ZoneB_EntryDoorA1 01")
end
DBC_1st_ZoneC_LoadCheckpointThread = L0_0
function L0_0()
  if GetGlobal("DBC_1st_ZoneC_PortalOpen") == 1 then
    DisableGlint("dbc_scaletest.NOS_HM_ZoneM_Gear01 01")
    DisableGlint("dbc_scaletest.NOS_HM_ZoneM_Gear01 02")
  end
end
DBC_1st_ZoneC_DisableGlint = L0_0
function L0_0()
  if GetGlobal("DBC_1st_FreeCalvin") == 1 or GetGlobal("DBC_1st_FreeCalvin") == 2 then
    Print("^^^^^^^^^^^^^^^^^^Disabling pressure plate")
    Disable("dbc_scaletest.DBC_PressurePlateA1_Inert 01")
  end
end
DBC_1st_ZoneC_DisablePPlate = L0_0
function L0_0()
  StartFadeOut(0.5)
  wait(0.8)
  StartFadeIn(0.8)
  SetCameraAttributes("dbc_scaletest.AlcoveChestCameraOverride 02")
  SaveCheckpoint(GetPlayer(), "DBC_1st_ZoneC_LoadCheckpoint", "dbc_scaletest.CheckpointMarker 01")
end
DBC_1st_ZoneC_ChestCameraReturn = L0_0
function L0_0()
  wait(1.5)
  FireSequence("dbc_1st_zonec_guardians.ConversationalTrigger 01", "DBC_1st_Guardian3")
end
DBC_1st_ZoneC_GuardianBark = L0_0
function L0_0()
  Hide("CourtyardSham")
end
DBC_1st_ZoneC_HideSham = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "DBC_1st_ZoneC_LoadCheckpoint", "dbc_scaletest.CheckpointMarker 01")
end
DBC_1st_ZoneC_ConceptUnlock = L0_0
