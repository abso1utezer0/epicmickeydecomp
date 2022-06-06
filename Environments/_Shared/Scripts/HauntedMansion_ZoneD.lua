local L0_0, L1_1
L0_0 = 0
HM_Foyer_SkullRght = L0_0
L0_0 = 0
HM_Foyer_SkullLeft = L0_0
L0_0 = 0
HM_Foyer_SklGhostsRght = L0_0
L0_0 = 0
HM_Foyer_SklGhostsLeft = L0_0
L0_0 = 0
HM_Foyer_ButtonRght = L0_0
L0_0 = 0
HM_Foyer_ButtonLeft = L0_0
L0_0 = 0
HM_Foyer_SkullHint = L0_0
L0_0 = 0
HM_FoyerExitDoor = L0_0
L0_0 = 0
HM_FoyerExitButtonHint = L0_0
L0_0 = 0
HM_FoyerStopLeftTable = L0_0
L0_0 = 0
HM_FoyerStopRghtTable = L0_0
function L0_0()
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
end
HM_Foyer_CamDefault = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "HM_FoyerLoadCheckpoint", "FoyerCheckpointMarker01")
end
HM_ZoneD_SaveCheckpoint = L0_0
function L0_0()
  Mute()
  HM_Foyer_CamDefault()
  StartTrackingCurrentLevelForScoring("HM_Foyer")
  SetGlobal("HM_FoyerGremlinState", 0)
  StartFadeOut(0)
  if GetGlobal("HM_FoyerGhostIsReleased") == 1 then
    wait(0.1)
    Disable("hm_zoned3_dynamic.GhostHelpTrigger 01")
    Hide("hm_zoned3_dynamic.GhostBottle 01")
    AnimGBSequence("hm_zoned_static.DBC_PortcullisA1_Inert 03", "Open")
    DisableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersGhostHall")
    EnableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersSkull01")
    EnableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersSkull02")
    if GetGlobal("HM_FoyerSwitchStates") < 4 then
      Unhide("hm_zoned3_dynamic.Lonesome Ghost Tall 01")
      Unhide("hauntedmansion_zoned3.GhostSpeakTriggerUse 01")
    end
    if GetGlobal("HM_FoyerSwitchStates") < 3 then
      AnimGBSequence("hm_zoned3_dynamic.NOS_HM_ZoneH_RevolvingDoor2 01", "Turn")
      AnimGBSequence("hm_zoned3_dynamic.NOS_HM_ZoneH_RevolvingDoor1 01", "Turn")
    end
  end
  if GetGlobal("HM_FoyerSwitchStates") == 1 then
    HM_FoyerReloadStartup()
    FireUser1("FoyerBwrx01")
    FireUser1("FoyerBwrx02")
  elseif GetGlobal("HM_FoyerSwitchStates") == 2 then
    SetGlobal("HM_FoyerSwitchStates", 1)
    HM_FoyerReloadStartup()
    FireUser1("FoyerBwrx01")
    FireUser1("FoyerBwrx02")
    DisableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersGhostHall")
    EnableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersSkull01")
    EnableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersSkull02")
  elseif GetGlobal("HM_FoyerSwitchStates") == 3 then
    wait(0.1)
    FireUser1("FoyerBwrx01")
    FireUser1("FoyerBwrx02")
    Disable("hm_zoned3_dynamic.GhostHelpTrigger 01")
    Hide("hm_zoned3_dynamic.GhostBottle 01")
    Unhide("hauntedmansion_zoned3.GhostSpeakTriggerUse 01")
    Unhide("hm_zoned3_dynamic.Lonesome Ghost Tall 01")
    AnimGBSequence("hm_zoned_static.DBC_PortcullisA1_Inert 03", "Open")
    AnimGBSequence("hm_zoned1_dynamic.Stairs_01", "LoopPartial")
    AnimGBSequence("hm_zoned3_dynamic.LM_DoorSkull_Eye_L 01", "toggle")
    AnimGBSequence("hm_zoned3_dynamic.LM_DoorSkull_Eye_R 01", "toggle")
    DisableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersGhostHall")
    EnableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersSkull01")
    EnableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersSkull02")
  elseif GetGlobal("HM_FoyerSwitchStates") == 4 then
    wait(0.1)
    FireUser1("FoyerBwrx01")
    FireUser1("FoyerBwrx02")
    Disable("hm_zoned3_dynamic.GhostHelpTrigger 01")
    Hide("hm_zoned3_dynamic.GhostBottle 01")
    AnimGBSequence("hm_zoned_static.DBC_PortcullisA1_Inert 03", "Open")
    Unhide("hauntedmansion_zoned3.TreasureChest 01")
    AnimGBSequence("hm_zoned1_dynamic.Stairs_01", "UpToFull")
    AnimGBSequence("hauntedmansion_zoned3.HM_FoyerMainDoor01", "Open")
    AnimGBSequence("hm_zoned3_dynamic.LM_DoorSkull_Eye_L 01", "toggle")
    AnimGBSequence("hm_zoned3_dynamic.LM_DoorSkull_Eye_R 01", "toggle")
    DisableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersGhostHall")
    DisableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersPainting")
  end
  if GetGlobal("HM_ConceptArt_Foyer") == 1 then
    DestroyEntity("HM_FoyerConceptPickup")
  end
  wait(1.7)
  StartFadeIn(0.5)
  Unmute()
end
HM_FoyerLoadCheckpoint = L0_0
function L0_0()
  SetGlobal("HM_ConceptArt_Foyer", 1)
  HM_ZoneD_SaveCheckpoint()
end
HM_FoyerConceptArt = L0_0
function L0_0()
  HM_ZoneD_SaveCheckpoint()
end
HM_IntroSaveOff = L0_0
L0_0 = 0
HM_FoyerButton01 = L0_0
L0_0 = 0
HM_FoyerButton02 = L0_0
L0_0 = 0
HM_FoyerAnvilButton01 = L0_0
L0_0 = 0
HM_FoyerAnvilButton02 = L0_0
L0_0 = 0
HM_GhostGateOpened = L0_0
function L0_0()
  if HM_FoyerAnvilButton01 == 0 and HM_FoyerAnvilButton02 == 0 then
    FireSequence("hm_zoned3_dynamic.GusConvoMarker 01", "HM_Gus_AnvilHint")
  end
end
HM_GhostButtonHelp = L0_0
function L0_0(A0_2, A1_3)
  if HM_GhostGateOpened == 0 then
    if A1_3 == "1" then
      HM_FoyerButton01 = 1
    elseif A1_3 == "2" then
      HM_FoyerButton02 = 1
    end
    if HM_FoyerButton01 == 1 and HM_FoyerAnvilButton02 == 1 then
      if GetGlobal("HM_FoyerGhostIsReleased") == 0 then
        Disable("hm_zoned3_dynamic.GhostHelpTrigger 01")
        HM_GhostGateOpened = 1
        FireSequence("hm_zoned_static.ConvoMarkerGhost", "HM_Ghost_DoorOpen")
      end
    elseif HM_FoyerAnvilButton01 == 1 and HM_FoyerButton02 == 1 and GetGlobal("HM_FoyerGhostIsReleased") == 0 then
      Disable("hm_zoned3_dynamic.GhostHelpTrigger 01")
      HM_GhostGateOpened = 1
      FireSequence("hm_zoned_static.ConvoMarkerGhost", "HM_Ghost_DoorOpen")
    end
  end
end
HM_GhostButtonOn = L0_0
function L0_0(A0_4, A1_5)
  local L2_6
  if A1_5 == "1" then
    L2_6 = 0
    HM_FoyerButton01 = L2_6
  elseif A1_5 == "2" then
    L2_6 = 0
    HM_FoyerButton02 = L2_6
  end
end
HM_GhostButtonOff = L0_0
function L0_0(A0_7, A1_8)
  if HM_GhostGateOpened == 0 then
    if A1_8 == "1" then
      HM_FoyerAnvilButton01 = 1
    elseif A1_8 == "2" then
      HM_FoyerAnvilButton02 = 1
    end
    if HM_FoyerButton01 == 1 and HM_FoyerAnvilButton02 == 1 then
      if GetGlobal("HM_FoyerGhostIsReleased") == 0 then
        Disable("hm_zoned3_dynamic.GhostHelpTrigger 01")
        HM_GhostGateOpened = 1
        FireSequence("hm_zoned_static.ConvoMarkerGhost", "HM_Ghost_DoorOpen")
      end
    elseif HM_FoyerAnvilButton01 == 1 and HM_FoyerButton02 == 1 and GetGlobal("HM_FoyerGhostIsReleased") == 0 then
      Disable("hm_zoned3_dynamic.GhostHelpTrigger 01")
      HM_GhostGateOpened = 1
      FireSequence("hm_zoned_static.ConvoMarkerGhost", "HM_Ghost_DoorOpen")
    end
  end
end
HM_GhostAnvilButtonOn = L0_0
function L0_0(A0_9, A1_10)
  local L2_11
  if A1_10 == "1" then
    L2_11 = 0
    HM_FoyerAnvilButton01 = L2_11
  elseif A1_10 == "2" then
    L2_11 = 0
    HM_FoyerAnvilButton02 = L2_11
  end
end
HM_GhostAnvilButtonOff = L0_0
function L0_0()
  HM_ReleaseCam()
  SetCameraHintYaw(GetPlayer(), 1)
  DestroyEntity("FoyerGremlin01")
  Hide("hm_zoned3_dynamic.PressurePlate 01")
  Unhide("hm_zoned3_dynamic.PressurePlateHidden")
end
HM_ButtonSwitchOut = L0_0
L0_0 = 0
HM_FoyerTimerReset = L0_0
function L0_0()
  if HM_FoyerExitButtonHint == 0 then
    HM_FoyerExitButtonHint = 1
    RestrictCutSceneInput()
    FireUser1("ExitCameraMarker")
    wait(2)
    AnimGBSequence("hauntedmansion_zoned3.HM_FoyerMainDoor01", "Open")
    wait(3.5)
    HM_ReleaseCam()
    wait(0.8)
    UnrestrictCutSceneInput()
    HM_FoyerTimerReset = 1
    AnimGBSequence("hauntedmansion_zoned3.HM_FoyerMainDoor01", "Open")
    TimerStart(10.9, 5, 2)
    wait(0.8)
    TimerPause()
  elseif HM_FoyerExitButtonHint == 1 then
    if HM_FoyerTimerReset == 0 then
      HM_FoyerTimerReset = 1
      AnimGBSequence("hauntedmansion_zoned3.HM_FoyerMainDoor01", "Open")
      TimerStart(10.9, 5, 2)
      wait(0.8)
      TimerPause()
    elseif HM_FoyerTimerReset == 1 then
      TimerSetTime(10.9)
      wait(0.8)
      TimerPause()
    end
  end
end
HM_ExitButtonOn = L0_0
function L0_0()
  local L0_12
  L0_12 = SetCameraHintYaw
  L0_12(GetPlayer(), 1)
  L0_12 = TimerUnpause
  L0_12()
  L0_12 = "Ticking"
  while L0_12 == "Ticking" do
    wait(0.3)
    L0_12 = TimerGetState()
  end
  HM_ExitButtonOff()
end
HM_ExitClock = L0_0
function L0_0()
  if GetGlobal("HM_FoyerSwitchStates") < 4 then
    if HM_MickeyEscaped == 1 and HM_FoyerExitDone == 0 then
      HM_FoyerExitDone = 1
      HM_FoyerTimerReset = 0
      FireSequence("hm_zoned3_dynamic.GusConvoMarker 01", "Gus_MickeyLeavesFoyer")
    else
      HM_FoyerTimerReset = 0
      AnimGBSequence("hauntedmansion_zoned3.HM_FoyerMainDoor01", "Rest")
      AudioPostEventOn("hauntedmansion_zoned3.HM_FoyerMainDoor01", "Play_sfx_LM_Foyer_Portcullis_Close")
    end
  end
end
HM_ExitButtonOff = L0_0
L0_0 = 0
HM_FoyerExitDone = L0_0
function L0_0()
  if GetGlobal("HM_FoyerSwitchStates") < 4 and HM_MickeyEscaped == 1 and HM_FoyerExitDone == 0 then
    HM_FoyerExitDone = 1
    Disable("hm_zoned3_dynamic.ExitPlaneTrigger 03")
    TimerStop()
    FireSequence("hm_zoned3_dynamic.GusConvoMarker 01", "Gus_MickeyLeavesFoyer")
    Hide("hm_zoned3_dynamic.ExitPlaneTrigger 02")
  end
end
HM_MickeyEscapeCommit = L0_0
L0_0 = 0
HM_MickeyEscaped = L0_0
function L0_0()
  local L1_13
  L1_13 = 1
  HM_MickeyEscaped = L1_13
end
HM_FoyerEscapeOn = L0_0
function L0_0()
  local L1_14
  L1_14 = 0
  HM_MickeyEscaped = L1_14
end
HM_FoyerEscapeOff = L0_0
function L0_0()
  if GetGlobal("HM_FoyerSwitchStates") == 1 then
    FireSequence("hm_zoned3_dynamic.Lonesome Ghost Tall 01", "HM_Ghost_Waiting01")
  elseif GetGlobal("HM_FoyerSwitchStates") == 2 then
    FireSequence("hm_zoned3_dynamic.Lonesome Ghost Tall 01", "HM_Ghost_Waiting02")
  elseif GetGlobal("HM_FoyerSwitchStates") == 3 then
    FireSequence("hm_zoned3_dynamic.Lonesome Ghost Tall 01", "HM_Ghost_SkullsDone")
  end
end
HM_GhostSpeak = L0_0
function L0_0()
  FireSequence("hm_zoned_static.ConvoMarkerGhost", "HM_Ghost_Released")
end
HM_FYGhostTalk = L0_0
function L0_0()
  if GetGlobal("HM_FoyerIntroPlayed") == 0 then
    wait(1)
    SetMap(GetPlayer(), "MAP_HM_ZONED", "GAME")
    HM_Foyer_CamDefault()
    FireSequence("hm_zoned3_dynamic.GusConvoMarker 01", "HM_Gus_Foyer01")
    SetGlobal("HM_FoyerIntroPlayed", 1)
    StartTrackingCurrentLevelForScoring("HM_Foyer")
  end
end
HM_FoyerIntro = L0_0
function L0_0()
  wait(0.7)
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "RightGhost_Intro", 13)
  wait(1)
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "LeftGhost_Intro", 13)
  wait(2)
  AnimGBSequence("hm_zoned1_dynamic.Stairs_01", "FallDown")
  wait(2)
  SetGlobal("HM_FoyerSwitchStates", 1)
  Enable("hm_zoned3_dynamic.LeftDiningTable")
  AudioPostEventOn("hm_zoned3_dynamic.LeftDiningTable", "Play_sfx_HM_Foyer_FloatingPlatform_LP")
  Enable("hauntedmansion_zoned3.DiningTableRight")
  AudioPostEventOn("hauntedmansion_zoned3.DiningTableRight", "Play_sfx_HM_Foyer_FloatingPlatform_LP")
  wait(0.2)
end
HM_FoyerStartup = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "RightGhost_Intro")
  ForEachEntityInGroup(DestroyEntity, "LeftGhost_Intro")
  AnimGBSequence("hm_zoned1_dynamic.Stairs_01", "FallDown")
  SetGlobal("HM_FoyerSwitchStates", 1)
  Enable("hm_zoned3_dynamic.LeftDiningTable")
  AudioPostEventOn("hm_zoned3_dynamic.LeftDiningTable", "Play_sfx_HM_Foyer_FloatingPlatform_LP")
  Enable("hauntedmansion_zoned3.DiningTableRight")
  AudioPostEventOn("hauntedmansion_zoned3.DiningTableRight", "Play_sfx_HM_Foyer_FloatingPlatform_LP")
end
HM_FoyerReloadStartup = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("HM_Foyer")
end
HM_FoyerShutdown = L0_0
function L0_0()
  local L0_15
  L0_15 = ""
  GrabCamera("hauntedmansion_zoned.DoorSwitchCamera 01", nil, CAMERA_LERP_TRANSITION, 0.8)
  wait(2)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.7)
  for _FORV_4_ = 1, 20 do
    L0_15 = 21 - _FORV_4_
    Display(GetPlayer(), " " .. L0_15 .. " ")
    wait(1)
  end
  RelayTrigger("hauntedmansion_zoned.DoorsRelayMarker 01")
end
HM_DoorExitSwitchOn = L0_0
function L0_0()
  SetGlobal("HM_FoyerDoor", 1)
end
HM_FoyerDoorOpen = L0_0
function L0_0()
  SetGlobal("HM_FoyerDoor", 0)
end
HM_FoyerDoorClose = L0_0
function L0_0()
  Disable("hm_zoned3_dynamic.LeftDiningTable")
  AudioPostEventOn("hm_zoned3_dynamic.LeftDiningTable", "Stop_sfx_HM_Foyer_FloatingPlatform_LP")
end
HM_FoyerTestTriggerRight2 = L0_0
function L0_0()
  Disable("hauntedmansion_zoned3.LeftCandle2")
end
HM_FoyerTestTriggerRight3 = L0_0
function L0_0()
  Disable("hauntedmansion_zoned3.LeftCandle1")
end
HM_FoyerTestTriggerRight4 = L0_0
function L0_0()
  Disable("hauntedmansion_zoned3.LeftCandle3")
end
HM_FoyerTestTriggerRight5 = L0_0
L0_0 = 0
HM_Platform1 = L0_0
function L0_0()
  Disable("hauntedmansion_zoned3.DiningTableRight")
  AudioPostEventOn("hauntedmansion_zoned3.DiningTableRight", "Stop_sfx_HM_Foyer_FloatingPlatform_LP")
end
HM_LeftTablePark = L0_0
function L0_0(A0_16, A1_17)
  GrabCamera(A0_16, nil, CAMERA_LERP_TRANSITION, A1_17)
end
HM_FYGrabCam = L0_0
function L0_0(A0_18, A1_19)
  ReleaseCamera(CAMERA_LERP_TRANSITION, A1_19)
end
HM_FYReleaseCam = L0_0
function L0_0()
  if GetGlobal("HM_FoyerGhostIsReleased") == 1 then
    RestrictCutSceneInput()
    AnimGBSequence("hm_zoned3_dynamic.NOS_HM_Skull_LightRays 02", "on")
    AudioPostEventOn("hm_zoned3_dynamic.NOS_HM_Skull02_Toon 02", "Play_sfx_HM_Paint_Skull")
    wait(1)
    HM_Foyer_SkullRght = 1
    HM_Foyer_SklGhostsRght = 1
    PauseAllAI(GetPlayer())
    wait(1)
    FireUser1("TableLeftCamMarker")
    ForcePainted("hm_zoned3_dynamic.LeftDiningTable")
    SplineFollower_TeleportToKnot("hm_zoned3_dynamic.LeftDiningTable", "hm_zoned3_dynamic.DiningTableLeftSplineKnot 14")
    SetSplineFollowerInitialSpeed("hm_zoned3_dynamic.LeftDiningTable", 1)
    wait(4)
    ForEachEntityInGroup(Unhide, "LeftGhost_Outro")
    ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "LeftGhost_Outro", 9)
    wait(5)
    ForEachEntityInGroup(Hide, "LeftGhost_Outro")
    FireUser1("Skull02CameraMarker")
    DisableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersSkull02")
    ForEachEntityInGroup(Unhide, "LeftGhost_IntoSkull")
    ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "LeftGhost_IntoSkull", 9)
    wait(3)
    AnimGBSequence("hm_zoned3_dynamic.NOS_HM_ZoneH_RevolvingDoor2 01", "TurnBack")
    wait(2.5)
    if HM_Foyer_SklGhostsLeft == 1 then
      FireSequence("hm_zoned3_dynamic.Lonesome Ghost Tall 01", "HM_Ghost_Skull02_Set")
    else
      HM_Skull01Solved()
    end
  end
end
HM_Foyer_SkullRghtPainted = L0_0
function L0_0()
  if GetGlobal("HM_FoyerGhostIsReleased") == 1 then
    RestrictCutSceneInput()
    AnimGBSequence("hm_zoned3_dynamic.NOS_HM_Skull_LightRays 01", "on")
    AudioPostEventOn("hm_zoned3_dynamic.NOS_HM_Skull01_Toon 01", "Play_sfx_HM_Paint_Skull")
    wait(1)
    PauseAllAI(GetPlayer())
    HM_Foyer_SkullLeft = 1
    HM_Foyer_SklGhostsLeft = 1
    wait(1)
    FireUser1("TableRightCamMarker")
    ForcePainted("hauntedmansion_zoned3.DiningTableRight")
    SplineFollower_TeleportToKnot("hauntedmansion_zoned3.DiningTableRight", "hm_zoned3_dynamic.DiningTableRightSplineKnot 14")
    SetSplineFollowerInitialSpeed("hauntedmansion_zoned3.DiningTableRight", 1)
    wait(4)
    ForEachEntityInGroup(Unhide, "RightGhost_Outro")
    ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "RightGhost_Outro", 9)
    wait(5)
    ForEachEntityInGroup(Hide, "RightGhost_Outro")
    FireUser1("Skull01CameraMarker")
    DisableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersSkull01")
    ForEachEntityInGroup(Unhide, "RightGhost_IntoSkull")
    ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "RightGhost_IntoSkull", 9)
    wait(3)
    AnimGBSequence("hm_zoned3_dynamic.NOS_HM_ZoneH_RevolvingDoor1 01", "TurnBack")
    wait(2.5)
    if HM_Foyer_SklGhostsRght == 1 then
      FireSequence("hm_zoned3_dynamic.Lonesome Ghost Tall 01", "HM_Ghost_Skull02_Set")
    else
      HM_Skull01Solved()
    end
  end
end
HM_Foyer_SkullLeftPainted = L0_0
function L0_0()
  local L1_20
  L1_20 = 0
  HM_Foyer_SkullLeft = L1_20
end
HM_Foyer_SkullLeftThinned = L0_0
function L0_0()
  local L1_21
  L1_21 = 0
  HM_Foyer_SkullRght = L1_21
end
HM_Foyer_SkullRghtThinned = L0_0
function L0_0()
  if GetGlobal("HM_FoyerSwitchStates") == 1 then
    if HM_Foyer_SkullHint == 0 then
      HM_Foyer_SkullHint = 1
      FireSequence("hm_zoned3_dynamic.GusConvoMarker 01", "HM_Gus_Skull01_Set")
    elseif HM_Foyer_SkullHint == 1 then
      FireUser1("SkullCamFancy")
      Wait(3.5)
      HM_ReleaseCam()
    end
    AnimGBSequence("hm_zoned1_dynamic.Stairs_01", "LoopPartial")
  end
end
HM_Skull01Solved = L0_0
function L0_0()
  wait(3)
  SetGlobal("HM_FoyerSwitchStates", 3)
  HM_ZoneD_SaveCheckpoint()
end
HM_OpenExit = L0_0
function L0_0()
  GrabCamera("hauntedmansion_zoned3.GhostIntroCamera 02", nil, CAMERA_LERP_TRANSITION, 0)
  Wait(1)
  AnimGBSequence("hauntedmansion_zoned3.HM_FoyerMainDoor01", "Open")
end
HM_OpenExit02 = L0_0
function L0_0()
  if HM_Foyer_SkullRght == 1 then
    SetSplineFollowerInitialSpeed("hm_zoned3_dynamic.LeftDiningTable", 0)
    HM_FoyerStopLeftTable = 1
  end
end
HM_FoyerStopTable01 = L0_0
function L0_0()
  if HM_Foyer_SkullLeft == 1 then
    SetSplineFollowerInitialSpeed("hauntedmansion_zoned3.DiningTableRight", 0)
    HM_FoyerStopRghtTable = 1
  end
end
HM_FoyerStopTable02 = L0_0
function L0_0()
  GrabCamera("hauntedmansion_zoned3.CameraControlPoint 01", nil, CAMERA_LERP_TRANSITION, 0.8)
end
FoyerRightCamera = L0_0
function L0_0()
  GrabCamera("hauntedmansion_zoned3.CameraControlPoint 02", nil, CAMERA_LERP_TRANSITION, 0.8)
end
FoyerLeftCamera = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.7)
end
FoyerCameraRelease = L0_0
function L0_0()
  AnimGBSequence("hauntedmansion_zoned3.NOS_HM_Coffins_01 01", "RaiseUp")
end
FoyerCoffinRaise = L0_0
function L0_0()
  Unhide("hm_zoned3_dynamic.Lonesome Ghost Tall 01")
  Unhide("hauntedmansion_zoned3.GhostSpeakTriggerUse 01")
  Enable("hm_zoned3_dynamic.GhostDustSpawner 01", 1)
end
HM_FoyerGhostReleased = L0_0
function L0_0()
  DisableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersGhostHall")
  EnableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersSkull01")
  EnableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersSkull02")
end
SetGhostReleasedHints = L0_0
L0_0 = 0
HM_FoyerGremlinState = L0_0
function L0_0()
  ForceSequence("FoyerGremlin01", "HM_FoyerGremlin_Rescue")
end
HM_FoyerGremlinFreed = L0_0
function L0_0()
  if HM_FoyerGremlinState == 0 then
    FireSequence("hm_zoned_static.ConvoMarkerGremlin 01", "HM_FoyerGremlin_Help")
  elseif HM_FoyerGremlinState == 1 then
    HM_FoyerGremlinState = 2
    FireSequence("hm_zoned_static.ConvoMarkerGremlin 01", "HM_FoyerGremlin_Rescue")
  elseif HM_FoyerGremlinState == 2 then
    FireSequence("hm_zoned_static.ConvoMarkerGremlin 01", "HM_FoyerGremlin_Thank")
  end
end
HM_FoyerGremlinSpeak = L0_0
function L0_0()
  if HM_FoyerStopRghtTable == 0 then
    SetSplineFollowerInitialSpeed("hauntedmansion_zoned3.DiningTableRight", 1)
  end
end
HM_TableRght_Go = L0_0
function L0_0()
  if HM_FoyerStopLeftTable == 0 then
    SetSplineFollowerInitialSpeed("hm_zoned3_dynamic.LeftDiningTable", 1)
  end
end
HM_TableLeft_Go = L0_0
function L0_0()
  EnterCutscene("hm_zoned3_dynamic.Lonesome Ghost Tall 01", 4)
end
HM_GhostFarewell = L0_0
L0_0 = 0
HM_FoyerSpawner01Broke = L0_0
L0_0 = 0
HM_FoyerSpawner02Broke = L0_0
L0_0 = 0
HM_Crawler01Exit = L0_0
L0_0 = 0
HM_Crawler02Exit = L0_0
L0_0 = 1
HM_Beetleworx01 = L0_0
L0_0 = 1
HM_Beetleworx02 = L0_0
function L0_0()
  HM_Beetleworx01 = 0
  AnimGBSequence("HM_FoyerSpawner01_InnerDoors", "Close")
  AnimGBSequence("HM_FoyerSpawner01_Eye", "Close")
end
HM_Beetleworx01Killed = L0_0
function L0_0()
  HM_FoyerSpawner01Broke = 0
  Enable("FoyerBwrx01Trigger")
  HM_FoyerSpawner01()
end
HM_FoyerSpawner01On = L0_0
function L0_0()
  Disable("FoyerBwrx01Trigger")
  if HM_Crawler01Exit == 1 then
    Kill("FoyerCrawler01")
  end
  HM_FoyerSpawner01Broke = 1
  AnimGBSequence("HM_FoyerSpawner01_InnerDoors", "Close")
  AnimGBSequence("HM_FoyerSpawner01_Eye", "Close")
end
HM_FoyerSpawner01Off = L0_0
function L0_0()
  if HM_FoyerSpawner01Broke == 0 then
    AnimGBSequence("HM_FoyerSpawner01_InnerDoors", "Close")
  end
end
HM_CloserFoyerSpawner01 = L0_0
function L0_0()
  local L1_22
  L1_22 = 0
  HM_Crawler01Exit = L1_22
end
HM_ExitSpawner01 = L0_0
function L0_0()
  if HM_FoyerSpawner01Broke == 0 and HM_Beetleworx01 == 0 then
    HM_Crawler01Exit = 1
    HM_Beetleworx01 = 1
    FireUser1("FoyerBwrx01")
  end
end
HM_FoyerSpawner01 = L0_0
function L0_0()
  HM_Beetleworx02 = 0
  AnimGBSequence("HM_FoyerSpawner02_InnerDoors", "Close")
  AnimGBSequence("HM_FoyerSpawner02_Eye", "Close")
end
HM_Beetleworx02Killed = L0_0
function L0_0()
  HM_FoyerSpawner02Broke = 0
  Enable("FoyerBwrx02Trigger")
  HM_FoyerSpawner02()
end
HM_FoyerSpawner02On = L0_0
function L0_0()
  Disable("FoyerBwrx02Trigger")
  if HM_Crawler02Exit == 1 then
    Kill("FoyerCrawler02")
  end
  HM_FoyerSpawner02Broke = 1
  AnimGBSequence("HM_FoyerSpawner02_InnerDoors", "Close")
  AnimGBSequence("HM_FoyerSpawner02_Eye", "Close")
end
HM_FoyerSpawner02Off = L0_0
function L0_0()
  if HM_FoyerSpawner02Broke == 0 and HM_Beetleworx02 == 0 then
    HM_Crawler02Exit = 1
    HM_Beetleworx02 = 1
    FireUser1("FoyerBwrx02")
  end
end
HM_FoyerSpawner02 = L0_0
function L0_0()
  if HM_FoyerSpawner02Broke == 0 then
    AnimGBSequence("HM_FoyerSpawner02_InnerDoors", "Close")
  end
end
HM_CloserFoyerSpawner02 = L0_0
function L0_0()
  local L1_23
  L1_23 = 0
  HM_Crawler02Exit = L1_23
end
HM_ExitSpawner02 = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.8)
  SetCameraAttributes("hm_zoned3_dynamic.GhostChamberMarker(CameraOverride) 02")
  wait(0.2)
  StartFadeIn(0.7)
  ShowHud()
end
HM_GhostLeaves_Camera = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.8)
  UnpauseAllAI()
  SetCameraAttributes("hm_zoned3_dynamic.ExitCameraMarker Ex")
  wait(0.2)
  StartFadeIn(0.7)
  ShowHud()
end
HM_MickeyExit_Camera = L0_0
function L0_0(A0_24)
  SetPropertyFloat(A0_24, "Tether Radius", 200, 0)
end
HM_WakeSweeper = L0_0
function L0_0()
  if HM_FoyerAnvilButton01 == 0 and HM_FoyerAnvilButton02 == 0 then
    FireSequence("hm_zoned3_dynamic.GusConvoMarker 01", "HM_Gus_AnvilHint")
  end
end
HM_AnvilButtonHelpBarkFix = L0_0
function L0_0()
  FireSequence("hm_zoned3_dynamic.GusConvoMarker 01", "GP_ColonelCartoons")
end
HM_ColCartoonsChest = L0_0
function L0_0()
  DisableGuardianHint("hm_zoned3_dynamic.PlayerHintMarkersPainting")
end
HM_PaintingThinned = L0_0
