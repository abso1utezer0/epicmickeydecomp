local L0_0, L1_1
L0_0 = 0
HM_ZoneK_BrokenKeys = L0_0
L0_0 = 0
HM_ZoneK_CountDownTimer = L0_0
L0_0 = 0
HM_ZoneK_GremlinRescued = L0_0
L0_0 = "0"
HM_ZoneK_CurrentKeyVal = L0_0
L0_0 = "C"
HM_ZoneK_CurrentSound = L0_0
L0_0 = 0
HM_CurrentKeyVal = L0_0
L0_0 = 0
HM_WrongKeyCount = L0_0
L0_0 = 0
HM_RightKeyCount = L0_0
L0_0 = 0
HM_SongGameOn = L0_0
L0_0 = 0
HM_AngryPathSwitch = L0_0
L0_0 = 0
HM_AngryPathWarned = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "HM_BallroomLoadCheckpoint", "hm_zonek_dynamic.BallroomIntroPositionMarker 01")
end
HM_Ballroom_SaveCheckpoint = L0_0
function L0_0()
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
end
HM_Ballroom_CamDefault = L0_0
function L0_0()
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(8, 35, -30)
end
HM_Ballroom_BalconyCam = L0_0
function L0_0()
  StartTrackingCurrentLevelForScoring("HM_Ballroom")
  if GetGlobal("HM_BallroomKeyBrk01") == 1 then
    DestroyEntity("hm_zonek_dynamic.HM_KeyC")
    ForceSketched("hm_zonek_dynamic.HM_KeyDfl")
    ForceSketched("hm_zonek_dynamic.HM_KeyD")
  end
  if GetGlobal("HM_BallroomKeyBrk02") == 1 then
    DestroyEntity("hm_zonek_dynamic.HM_KeyD 01")
    ForceSketched("hm_zonek_dynamic.HM_KeyC 01")
    ForceSketched("hm_zonek_dynamic.HM_KeyE 01")
  end
  if GetGlobal("HM_BallroomKeyBrk03") == 1 then
    DestroyEntity("hm_zonek_dynamic.HM_KeyE")
    ForceSketched("hm_zonek_dynamic.HM_KeyEfl")
    ForceSketched("hm_zonek_dynamic.HM_KeyD")
    ForceSketched("hm_zonek_dynamic.HM_KeyF")
  end
  if GetGlobal("HM_BallroomKeyBrk04") == 1 then
    DestroyEntity("hm_zonek_dynamic.HM_KeyF 01")
    ForceSketched("hm_zonek_dynamic.HM_KeyE 01")
  end
  if GetGlobal("HM_BallroomKeyBrk05") == 1 then
    DestroyEntity("hm_zonek_dynamic.HM_KeyG 01")
    ForceSketched("hm_zonek_dynamic.HM_KeyA 01")
  end
  if GetGlobal("HM_BallroomKeyBrk06") == 1 then
    DestroyEntity("hm_zonek_dynamic.HM_KeyA")
    ForceSketched("hm_zonek_dynamic.HM_KeyAfl")
    ForceSketched("hm_zonek_dynamic.HM_KeyG")
    ForceSketched("hm_zonek_dynamic.HM_KeyBfl")
  end
  if GetGlobal("HM_BallroomKeyBrk07") == 1 then
    DestroyEntity("hm_zonek_dynamic.HM_KeyB")
    ForceSketched("hm_zonek_dynamic.HM_KeyBfl")
    ForceSketched("hm_zonek_dynamic.HM_KeyCx")
  end
  if GetGlobal("HM_BallroomKeyBrk08") == 1 then
    DestroyEntity("hm_zonek_dynamic.HM_KeyCx 01")
    ForceSketched("hm_zonek_dynamic.HM_KeyB 01")
  end
  HM_Ballroom_CamDefault()
  SetGlobal("HM_ZoneK_WrongKeyCount", 0)
  SetGlobal("HM_ZoneK_RightKeyCount", 0)
  SetGlobal("HM_ZoneK_SongGameOn", 0)
  SetGlobal("HM_ZoneK_OrganTalked", 0)
  SetGlobal("HM_ZoneK_HelpingOrgan", 0)
  SetGlobal("HM_ZoneK_OrganMad", 0)
  SetGlobal("HM_ZoneK_LidVal1", 0)
  SetGlobal("HM_ZoneK_LidVal2", 0)
  SetGlobal("HM_ZoneK_LidVal3", 0)
  SetGlobal("HM_ZoneK_LidVal4", 0)
  SetGlobal("HM_ZoneK_LidVal5", 0)
  SetGlobal("HM_ZoneK_LidVal6", 0)
  SetGlobal("HM_ZoneK_LidVal7", 0)
  SetGlobal("HM_ZoneK_LidVal8", 0)
  SetGlobal("HM_ZoneK_LidVal9", 0)
  SetGlobal("HM_ZoneK_LidVal10", 0)
  SetGlobal("HM_ZoneK_LidVal11", 0)
  SetGlobal("HM_ZoneK_LidVal12", 0)
  SetGlobal("HM_ZoneK_LidVal13", 0)
  SetGlobal("HM_ZoneK_InSongSeq", 0)
  if GetGlobal("HM_Ballroom_Intro") == 1 then
    Enable("hm_zonek_dynamic.PipeOrganKeyboardTrigger")
  end
  if GetGlobal("HM_Ballroom_State") == 0 then
    SetGlobal("HM_ZoneK_LidNum1", 0)
    SetGlobal("HM_ZoneK_LidNum2", 0)
    SetGlobal("HM_ZoneK_LidNum3", 0)
    SetGlobal("HM_ZoneK_LidNum4", 0)
    SetGlobal("HM_ZoneK_LidNum5", 0)
    SetGlobal("HM_ZoneK_LidNum6", 0)
    SetGlobal("HM_ZoneK_LidNum7", 0)
    SetGlobal("HM_ZoneK_LidNum8", 0)
    SetGlobal("HM_ZoneK_LidNum9", 0)
    SetGlobal("HM_ZoneK_LidNum10", 0)
    SetGlobal("HM_ZoneK_LidNum11", 0)
    SetGlobal("HM_ZoneK_LidNum12", 0)
    SetGlobal("HM_ZoneK_LidNum13", 0)
    SetGlobal("HM_BallroomKeyBrk01", 0)
    SetGlobal("HM_BallroomKeyBrk02", 0)
    SetGlobal("HM_BallroomKeyBrk03", 0)
    SetGlobal("HM_BallroomKeyBrk04", 0)
    SetGlobal("HM_BallroomKeyBrk05", 0)
    SetGlobal("HM_BallroomKeyBrk06", 0)
    SetGlobal("HM_BallroomKeyBrk07", 0)
    SetGlobal("HM_BallroomKeyBrk08", 0)
  elseif GetGlobal("HM_Ballroom_State") == 1 then
    DisableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersKeyboard")
    EnableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersPipes01")
    EnableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersPipes02")
    HM_BallroomShutdown()
    TimerDisable("hm_zonek_dynamic.PipeOrganWaveUp")
    TimerDisable("hm_zonek_dynamic.PipeOrganWaveDown")
  elseif GetGlobal("HM_Ballroom_State") == 2 then
    DisableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersKeyboard")
    EnableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersMadExit01")
    EnableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersMadExit02")
    HM_AngryPathSetup02()
    FireUser1("CannonSpawner01")
    FireUser1("CannonSpawner02")
  end
  if GetGlobal("MarbleBustKilled_06") == 1 then
    DestroyEntity("MarbleBust06")
  end
  if GetGlobal("MarbleBustKilled_07") == 1 then
    DestroyEntity("MarbleBust07")
  end
end
HM_BallroomLoadCheckpoint = L0_0
function L0_0()
  DisableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersKeyboard")
  DisableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersPipes01")
  DisableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersPipes02")
  DisableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersMadExit01")
  DisableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersMadExit02")
end
HM_BallroomExitReached = L0_0
function L0_0()
  DisableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersPipes01")
end
HM_BallroomPipeHint02 = L0_0
function L0_0()
  wait(0.2)
  MoveToEntity(GetPlayer(), "hm_zonek_dynamic.BallroomIntroPositionMarker 01")
  HM_Ballroom_CamDefault()
  SetMap(GetPlayer(), "MAP_HM_ZONEK", "GAME")
  HM_Ballroom_SaveCheckpoint()
  StartTrackingCurrentLevelForScoring("HM_Ballroom")
end
HM_IntoTheBallroom = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("HM_Ballroom")
end
HM_Ballroom_Exit = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
end
HM_BallroomReleaseCam = L0_0
function L0_0(A0_2, A1_3)
  if HM_SongGameOn == 1 then
    if A1_3 == HM_CurrentKeyVal then
      HM_RightKeyCount = HM_RightKeyCount + 1
      Bark(GetPlayer(), "Good!", 2)
    else
      HM_WrongKeyCount = HM_WrongKeyCount + 1
      Bark(GetPlayer(), "Bad!", 2)
    end
  end
end
HM_KeyTest = L0_0
L0_0 = false
HM_bFoundAllNotes = L0_0
L0_0 = 0
HM_OrganAnnoyanceLevel = L0_0
L0_0 = false
HM_bAnnoyedOrgan = L0_0
L0_0 = false
HM_CompletedSong = L0_0
function L0_0()
  if true == true then
    FireUser1(target)
  end
end
HM_HighlightNotes = L0_0
L0_0 = 0
HM_ZoneK_OrganAnger = L0_0
function L0_0(A0_4, A1_5, A2_6)
  if GetGlobal(A1_5) == 0 and GetGlobal(A2_6) == 0 then
    SetGlobal(A2_6, 1)
    Reverse(A0_4)
    wait(0.2)
    FireUser1(A0_4)
  end
end
HM_ZoneK_ActiveLidUp = L0_0
function L0_0(A0_7, A1_8, A2_9)
  if GetGlobal(A2_9) == 1 then
    SetGlobal(A2_9, 0)
    Reverse(A0_7)
    FireUser2(A0_7)
  end
end
HM_ZoneK_ActiveLidDown = L0_0
function L0_0()
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 3", "Play_sfx_pipe_lid_hinge")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 3", "HM_ZoneK_LidNum3", "HM_ZoneK_LidVal3")
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 1", "Play_sfx_pipe_lid_hinge")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 1", "HM_ZoneK_LidNum1", "HM_ZoneK_LidVal1")
  wait(0.2)
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 5", "Play_sfx_pipe_lid_hinge")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 5", "HM_ZoneK_LidNum5", "HM_ZoneK_LidVal5")
  wait(0.8)
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 2", "Play_sfx_close_OrganPipeLidA02")
  HM_ZoneK_ActiveLidDown("hm_zonek_dynamic.OrganPipeLidA1 2", "HM_ZoneK_LidNum2", "HM_ZoneK_LidVal2")
  wait(0.2)
  wait(0.2)
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 8", "Play_sfx_pipe_lid_hinge")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 8", "HM_ZoneK_LidNum8", "HM_ZoneK_LidVal8")
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 3", "Play_sfx_close_OrganPipeLidA03")
  HM_ZoneK_ActiveLidDown("hm_zonek_dynamic.OrganPipeLidA1 3", "HM_ZoneK_LidNum3", "HM_ZoneK_LidVal3")
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 1", "Play_sfx_close_OrganPipeLidA01")
  HM_ZoneK_ActiveLidDown("hm_zonek_dynamic.OrganPipeLidA1 1", "HM_ZoneK_LidNum1", "HM_ZoneK_LidVal1")
  wait(0.2)
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 5", "Play_sfx_close_OrganPipeLidA05")
  HM_ZoneK_ActiveLidDown("hm_zonek_dynamic.OrganPipeLidA1 5", "HM_ZoneK_LidNum5", "HM_ZoneK_LidVal5")
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 9", "Play_sfx_pipe_lid_hinge")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 9", "HM_ZoneK_LidNum9", "HM_ZoneK_LidVal9")
  wait(0.2)
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 10", "Play_sfx_pipe_lid_hinge")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 10", "HM_ZoneK_LidNum10", "HM_ZoneK_LidVal10")
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 8", "Play_sfx_close_OrganPipeLidA08")
  HM_ZoneK_ActiveLidDown("hm_zonek_dynamic.OrganPipeLidA1 8", "HM_ZoneK_LidNum8", "HM_ZoneK_LidVal8")
  wait(0.2)
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 9", "Play_sfx_close_OrganPipeLidA09")
  HM_ZoneK_ActiveLidDown("hm_zonek_dynamic.OrganPipeLidA1 9", "HM_ZoneK_LidNum9", "HM_ZoneK_LidVal9")
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 11", "Play_sfx_pipe_lid_hinge")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 11", "HM_ZoneK_LidNum11", "HM_ZoneK_LidVal11")
  wait(0.2)
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 12", "Play_sfx_pipe_lid_hinge")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 12", "HM_ZoneK_LidNum12", "HM_ZoneK_LidVal12")
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 6", "Play_sfx_pipe_lid_hinge")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 6", "HM_ZoneK_LidNum6", "HM_ZoneK_LidVal6")
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 10", "Play_sfx_close_OrganPipeLidA10")
  HM_ZoneK_ActiveLidDown("hm_zonek_dynamic.OrganPipeLidA1 10", "HM_ZoneK_LidNum10", "HM_ZoneK_LidVal10")
  wait(0.2)
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 11", "Play_sfx_close_OrganPipeLidA11")
  HM_ZoneK_ActiveLidDown("hm_zonek_dynamic.OrganPipeLidA1 11", "HM_ZoneK_LidNum11", "HM_ZoneK_LidVal11")
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 2", "Play_sfx_pipe_lid_hinge")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 2", "HM_ZoneK_LidNum2", "HM_ZoneK_LidVal2")
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 13", "Play_sfx_pipe_lid_hinge")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 13", "HM_ZoneK_LidNum13", "HM_ZoneK_LidVal13")
  wait(0.2)
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 12", "Play_sfx_close_OrganPipeLidA12")
  HM_ZoneK_ActiveLidDown("hm_zonek_dynamic.OrganPipeLidA1 12", "HM_ZoneK_LidNum12", "HM_ZoneK_LidVal12")
  wait(0.2)
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 13", "Play_sfx_close_OrganPipeLidA13")
  HM_ZoneK_ActiveLidDown("hm_zonek_dynamic.OrganPipeLidA1 13", "HM_ZoneK_LidNum13", "HM_ZoneK_LidVal13")
  wait(0.6)
  AudioPostEventOn("hm_zonek_dynamic.OrganPipeLidA1 6", "Play_sfx_close_OrganPipeLidA06")
  HM_ZoneK_ActiveLidDown("hm_zonek_dynamic.OrganPipeLidA1 6", "HM_ZoneK_LidNum6", "HM_ZoneK_LidVal6")
end
PipeOrganWaves = L0_0
function L0_0(A0_10, A1_11)
  if A1_11 == "1" then
    SetGlobal("HM_BallroomKeyBrk01", 1)
    AudioPostEventOn("target", "Play_sfx_break_organ_key")
  elseif A1_11 == "2" then
    SetGlobal("HM_BallroomKeyBrk02", 1)
    AudioPostEventOn("target", "Play_sfx_break_organ_key")
  elseif A1_11 == "3" then
    SetGlobal("HM_BallroomKeyBrk03", 1)
    AudioPostEventOn("target", "Play_sfx_break_organ_key")
  elseif A1_11 == "4" then
    SetGlobal("HM_BallroomKeyBrk04", 1)
    AudioPostEventOn("target", "Play_sfx_break_organ_key")
  elseif A1_11 == "5" then
    SetGlobal("HM_BallroomKeyBrk05", 1)
    AudioPostEventOn("target", "Play_sfx_break_organ_key")
  elseif A1_11 == "6" then
    SetGlobal("HM_BallroomKeyBrk06", 1)
    AudioPostEventOn("target", "Play_sfx_break_organ_key")
  elseif A1_11 == "7" then
    SetGlobal("HM_BallroomKeyBrk07", 1)
    AudioPostEventOn("target", "Play_sfx_break_organ_key")
  elseif A1_11 == "8" then
    SetGlobal("HM_BallroomKeyBrk08", 1)
    AudioPostEventOn("target", "Play_sfx_break_organ_key")
  end
end
HM_TrackBrokenKey = L0_0
function L0_0()
  HM_ZoneK_OrganAnger = HM_ZoneK_OrganAnger + 1
  SetGlobal("HM_ZoneK_LidNum" .. HM_ZoneK_OrganAnger, 1)
  HM_ZoneK_OrganAttacks()
end
HM_ZoneK_StopLid = L0_0
function L0_0()
  HM_ZoneK_OrganAnger = HM_ZoneK_OrganAnger - 1
  SetGlobal("HM_ZoneK_LidNum" .. HM_ZoneK_OrganAnger, 0)
  if M_ZoneK_BrokenKeys < 2 then
    FireSequence("hm_zonek_dynamic.PipeOrganConvoMarker", "Ballroom_PipeOrgan_KeyRepaired")
  end
end
HM_ZoneK_StartLid = L0_0
function L0_0()
  if GetGlobal("HM_Ballroom_State") < 2 then
    if HM_ZoneK_OrganAnger == 1 then
      FireSequence("hm_zonek_dynamic.PipeOrganConvoMarker", "Ballroom_PipeOrgan_KeyThinned")
      wait(2)
    end
    if HM_ZoneK_OrganAnger == 5 then
    end
    if HM_ZoneK_OrganAnger == 9 then
    end
    if HM_ZoneK_OrganAnger ~= 13 or HM_AngryPathSwitch == 0 then
    end
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
  end
end
HM_ZoneK_OrganAttacks = L0_0
function L0_0()
  HM_AngryPathSwitch = 1
  ForEachEntityInGroup(Unhide, "hm_zonek_dynamic.SteamTrigger")
  TimerDisable("hm_zonek_dynamic.PipeOrganWaveUp")
  TimerDisable("hm_zonek_dynamic.PipeOrganWaveDown")
  wait(0.1)
  SetGlobal("HM_ZoneK_LidNum1", 0)
  SetGlobal("HM_ZoneK_LidNum2", 0)
  SetGlobal("HM_ZoneK_LidNum3", 0)
  SetGlobal("HM_ZoneK_LidNum4", 0)
  SetGlobal("HM_ZoneK_LidNum5", 0)
  SetGlobal("HM_ZoneK_LidNum6", 0)
  wait(2.4)
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 1", "HM_ZoneK_LidNum1", "HM_ZoneK_LidVal1")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 2", "HM_ZoneK_LidNum2", "HM_ZoneK_LidVal2")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 3", "HM_ZoneK_LidNum3", "HM_ZoneK_LidVal3")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 4", "HM_ZoneK_LidNum4", "HM_ZoneK_LidVal4")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 5", "HM_ZoneK_LidNum5", "HM_ZoneK_LidVal5")
  HM_ZoneK_ActiveLidUp("hm_zonek_dynamic.OrganPipeLidA1 6", "HM_ZoneK_LidNum6", "HM_ZoneK_LidVal6")
  DisableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersKeyboard")
  EnableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersMadExit01")
  EnableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersMadExit02")
end
HM_AngryPathSetup02 = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Mute_Projectors")
  AudioPostEventOn(GetPlayer(), "Mute_Mickey")
end
HM_MuteIntroSetup = L0_0
function L0_0()
  if GetGlobal("HM_Ballroom_Intro") == 0 and GetGlobal("HM_Ballroom_State") < 2 then
    FireSequence("hm_zonek_dynamic.GusConvoMarker", "BR_Gus_Intro01")
    Enable("hm_zonek_dynamic.PipeOrganKeyboardTrigger")
  end
end
HM_ZoneK_BallroomIntro = L0_0
function L0_0()
  FireSequence("hm_zonek_dynamic.GusConvoMarker", "BR_Gus_Intro04")
  SetGlobal("HM_Ballroom_Intro", 1)
  AudioPostEventOn(GetPlayer(), "Unmute_Mickey")
  AudioPostEventOn(GetPlayer(), "Unmute_Projectors")
end
HM_ZoneK_BallroomIntro02 = L0_0
function L0_0()
  FireSequence("hm_zonek_dynamic.PipeOrganConvoMarker", "Ballroom_PipeOrgan_IntroQuest")
end
HM_ZoneK_BallroomIntroQuest = L0_0
function L0_0()
  HM_bAnnoyedOrgan = true
  GrabCamera("hauntedmansion_zonek.PipeOrganTransformCamera 01", nil, CAMERA_LERP_TRANSITION, 0)
  Hide("hauntedmansion_zonek.PipesStart 01")
  wait(0.5)
  RelayTrigger("hauntedmansion_zonek.CombatLogicRelay 01")
  wait(4)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
end
HM_AnnoyedOrgan = L0_0
function L0_0()
  if GetGlobal("HM_Ballroom_State") < 2 then
    FireUser1("hm_zonek_dynamic.KeyboardCameraMarker(CameraOverride) 01")
  end
end
HM_ZoneK_KeyboardCameraHint = L0_0
function L0_0()
  if GetGlobal("HM_Ballroom_State") < 2 then
    FireUser1("hm_zonek_dynamic.KeyboardCameraMarker(CameraOverride) 01")
  elseif GetGlobal("HM_Ballroom_State") == 2 then
    FireUser1("hm_zonek_dynamic.KeyboardCameraTrigger 01")
  end
end
HM_ZoneK_KeyboardCameraHintQuick = L0_0
function L0_0()
  FireUser1("hm_zonek_dynamic.KeyboardCameraTrigger 01")
end
HM_ZoneK_KeyboardCameraHintRelease = L0_0
function L0_0(A0_12, A1_13)
  if HM_ZoneK_CurrentKeyVal == A1_13 then
    SetGlobal("HM_ZoneK_RightKeyCount", 1)
    HM_ZoneK_CurrentKeyVal = "wrong"
    Print("********************************************************************************** CORRECT NOTE")
  else
    SetGlobal("HM_ZoneK_WrongKeyCount", GetGlobal("HM_ZoneK_WrongKeyCount") + 1)
    Print("********************************************************************************** WRONG NOTE")
  end
  if GetGlobal("HM_ZoneK_HelpingOrgan") == 0 then
    if GetGlobal("HM_ZoneK_OrganMad") == 15 then
      SetGlobal("HM_ZoneK_HelpingOrgan", -1)
    end
    SetGlobal("HM_ZoneK_OrganMad", GetGlobal("HM_ZoneK_OrganMad") + 1)
  end
end
HM_ZoneK_KeyPress = L0_0
function L0_0()
  if GetGlobal("HM_Ballroom_State") == 0 and GetGlobal("HM_ZoneK_InSongSeq") == 0 and HM_ZoneK_BrokenKeys < 4 then
    SetGlobal("HM_ZoneK_InSongSeq", 1)
    FireSequence("hm_zonek_dynamic.PipeOrganConvoMarker", "Ballroom_PipeOrgan_Introduction")
  end
end
HM_PipeOrgan_Keyboard = L0_0
function L0_0(A0_14)
  SetGlobal("HM_ZoneK_HelpingOrgan", 1)
  SetGlobal("HM_ZoneK_SongGameOn", 1)
  SetGlobal("HM_ZoneK_RightKeyCount", 0)
  SetGlobal("HM_ZoneK_WrongKeyCount", 0)
  Disable("hm_zonek_dynamic.PipeLidCameraTrigger 03")
  AudioPostEventOn(GetPlayer(), "Stop_music_hauntedmansion")
  wait(1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_organ_game_start")
  HM_ZoneK_KeyboardCameraHint()
  wait(1)
  HM_ZoneK_CountDownTimer = 7
  HM_ZoneK_CurrentSound = "F"
  HM_ZoneK_CurrentKeyVal = "6"
  AudioPostEventOn(GetPlayer(), "Play_sfx_organ_accompany1")
  HM_ZoneK_CurrentNote(GetPlayer(), HM_ZoneK_CurrentKeyVal, HM_ZoneK_CurrentSound)
  if GetGlobal("HM_ZoneK_SongGameOn") == 0 then
    SetGlobal("HM_ZoneK_InSongSeq", 0)
    return
  end
  HM_ZoneK_CountDownTimer = 7
  HM_ZoneK_CurrentKeyVal = "7"
  AudioPostEventOn(GetPlayer(), "Play_sfx_organ_accompany2")
  HM_ZoneK_CurrentNote(GetPlayer(), HM_ZoneK_CurrentKeyVal, HM_ZoneK_CurrentSound)
  if GetGlobal("HM_ZoneK_SongGameOn") == 0 then
    SetGlobal("HM_ZoneK_InSongSeq", 0)
    return
  end
  HM_ZoneK_CountDownTimer = 7
  HM_ZoneK_CurrentKeyVal = "10"
  AudioPostEventOn(GetPlayer(), "Play_sfx_organ_accompany3")
  HM_ZoneK_CurrentNote(GetPlayer(), HM_ZoneK_CurrentKeyVal, HM_ZoneK_CurrentSound)
  if GetGlobal("HM_ZoneK_SongGameOn") == 0 then
    SetGlobal("HM_ZoneK_InSongSeq", 0)
    return
  end
  HM_ZoneK_CountDownTimer = 7
  HM_ZoneK_CurrentKeyVal = "6"
  AudioPostEventOn(GetPlayer(), "Play_sfx_organ_accompany4")
  HM_ZoneK_CurrentNote(GetPlayer(), HM_ZoneK_CurrentKeyVal, HM_ZoneK_CurrentSound)
  if GetGlobal("HM_ZoneK_SongGameOn") == 0 then
    SetGlobal("HM_ZoneK_InSongSeq", 0)
    return
  end
  HM_ZoneK_CountDownTimer = 9
  HM_ZoneK_CurrentKeyVal = "1"
  AudioPostEventOn(GetPlayer(), "Play_sfx_organ_accompany5")
  HM_ZoneK_CurrentNote(GetPlayer(), HM_ZoneK_CurrentKeyVal, HM_ZoneK_CurrentSound)
  if GetGlobal("HM_ZoneK_SongGameOn") == 0 then
    SetGlobal("HM_ZoneK_InSongSeq", 0)
    return
  end
  HM_ZoneK_CountDownTimer = 9
  HM_ZoneK_CurrentKeyVal = "12"
  AudioPostEventOn(GetPlayer(), "Play_sfx_organ_accompany2")
  HM_ZoneK_CurrentNote(GetPlayer(), HM_ZoneK_CurrentKeyVal, HM_ZoneK_CurrentSound)
  if GetGlobal("HM_ZoneK_SongGameOn") == 0 then
    SetGlobal("HM_ZoneK_InSongSeq", 0)
    return
  end
  HM_ZoneK_CountDownTimer = 4
  HM_ZoneK_CurrentKeyVal = "10"
  AudioPostEventOn(GetPlayer(), "Play_sfx_organ_accompany6_1")
  HM_ZoneK_CurrentNote(GetPlayer(), HM_ZoneK_CurrentKeyVal, HM_ZoneK_CurrentSound)
  if GetGlobal("HM_ZoneK_SongGameOn") == 0 then
    SetGlobal("HM_ZoneK_InSongSeq", 0)
    return
  end
  HM_ZoneK_CountDownTimer = 6
  HM_ZoneK_CurrentKeyVal = "6"
  HM_Ballroom_KillSwitchTrip = 1
  AudioPostEventOn(GetPlayer(), "Play_sfx_organ_accompany7")
  HM_ZoneK_CurrentNote(GetPlayer(), HM_ZoneK_CurrentKeyVal, HM_ZoneK_CurrentSound)
  if GetGlobal("HM_ZoneK_SongGameOn") == 0 then
    SetGlobal("HM_ZoneK_InSongSeq", 0)
    return
  end
  DisableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersKeyboard")
  EnableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersPipes01")
  EnableGuardianHint("hm_zonek_dynamic.PlayerHintMarkersPipes02")
  FireThread(Audio_ReleaseLastKey)
  AudioPostEventOn(GetPlayer(), "Play_sfx_organ_flourish_win")
  FireSequence("hm_zonek_dynamic.PipeOrganConvoMarker", "Ballroom_PipeOrgan_PlaySongWon")
  SetGlobal("HM_ZoneK_SongGameOn", 0)
  wait(0.5)
  HM_BallroomShutdown()
  wait(0.5)
  TimerDisable("hm_zonek_dynamic.PipeOrganWaveUp")
  TimerDisable("hm_zonek_dynamic.PipeOrganWaveDown")
  HM_BallroomShutdown()
  wait(4)
  AudioPostEventOn(GetPlayer(), "Play_music_hauntedmansion")
  AudioSetState(GetPlayer(), "Music_State", "Auto")
end
HM_ZoneK_OrganGame = L0_0
function L0_0()
  wait(0.3)
  AudioPostEventOn("hm_zonek_dynamic.NOS_HM_KeyWhite_Collision 04", "Stop_organ_note_F")
end
Audio_ReleaseLastKey = L0_0
function L0_0()
  SetGlobal("HM_ZoneK_LidNum13", 1)
  wait(0.1)
  SetGlobal("HM_ZoneK_LidNum1", 1)
  ForEachEntityInGroup(Hide, "hm_zonek_dynamic.SteamTrigger")
  wait(0.1)
  SetGlobal("HM_ZoneK_LidNum2", 1)
  wait(0.1)
  SetGlobal("HM_ZoneK_LidNum3", 1)
  wait(0.1)
  SetGlobal("HM_ZoneK_LidNum4", 1)
  wait(0.1)
  SetGlobal("HM_ZoneK_LidNum5", 1)
  wait(0.1)
  SetGlobal("HM_ZoneK_LidNum6", 1)
  wait(0.1)
  SetGlobal("HM_ZoneK_LidNum7", 1)
  wait(0.1)
  SetGlobal("HM_ZoneK_LidNum8", 1)
  wait(0.1)
  SetGlobal("HM_ZoneK_LidNum9", 1)
  wait(0.1)
  SetGlobal("HM_ZoneK_LidNum10", 1)
  wait(0.1)
  SetGlobal("HM_ZoneK_LidNum11", 1)
  wait(0.1)
  SetGlobal("HM_ZoneK_LidNum12", 1)
end
HM_BallroomShutdown = L0_0
L0_0 = 0
KeyBrokenDuringGame = L0_0
function L0_0()
  if GetGlobal("HM_Ballroom_State") < 2 then
    HM_ZoneK_BrokenKeys = HM_ZoneK_BrokenKeys + 1
    if GetGlobal("HM_ZoneK_SongGameOn") == 1 then
      KeyBrokenDuringGame = 1
    end
    if HM_ZoneK_BrokenKeys == 1 then
      if HM_AngryPathWarned == 0 then
        FireSequence("hm_zonek_dynamic.PipeOrganConvoMarker", "Ballroom_PipeOrgan_BreakWarning")
      end
    elseif HM_ZoneK_BrokenKeys == 4 then
      AudioPostEventOn(GetPlayer(), "Stop_music_hauntedmansion")
      FireSequence("hm_zonek_dynamic.PipeOrganConvoMarker", "Ballroom_PipeOrgan_KeysBroken01")
    end
  end
end
HM_ZoneK_BreakKeys = L0_0
function L0_0(A0_15, A1_16, A2_17)
  Unhide("hm_zonek_dynamic.HM_BallroomNoteA 0" .. A1_16)
  AnimGBSequence("hm_zonek_dynamic.HM_BallroomNoteA 0" .. A1_16, "Fade_In")
  HM_Ballroom_NoteKillSwitch = A1_16
  wait(1)
  while GetGlobal("HM_ZoneK_SongGameOn") == 1 do
    HM_ZoneK_CountDownTimer = HM_ZoneK_CountDownTimer - 1
    Print("************************************************************************* " .. HM_ZoneK_CountDownTimer)
    wait(0.25)
    if GetGlobal("HM_ZoneK_WrongKeyCount") == 1 then
      SetGlobal("HM_ZoneK_WrongKeyCount", 0)
      SetGlobal("HM_ZoneK_SongGameOn", 0)
      FireSequence("hm_zonek_dynamic.PipeOrganConvoMarker", "Ballroom_PipeOrgan_WrongNote")
      AudioPostEventOn(GetPlayer(), "Mute_organ_failed")
      HM_ZoneK_KeyboardCameraHintRelease()
      FireThread(HM_Ballroom_HideNote, A1_16)
      Enable("hm_zonek_dynamic.PipeLidCameraTrigger 03")
      return
    end
    if GetGlobal("HM_ZoneK_RightKeyCount") == 1 then
      SetGlobal("HM_ZoneK_RightKeyCount", 0)
      FireThread(HM_Ballroom_HideNote, A1_16)
      wait(1)
      if HM_Ballroom_KillSwitchTrip == 0 then
        HM_Ballroom_KillNote()
      else
        HM_Ballroom_KillSwitchTrip = 0
      end
      return
    end
    if HM_ZoneK_CountDownTimer == 3 then
      FireThread(HM_Ballroom_HideNote, A1_16)
    end
    if HM_ZoneK_CountDownTimer <= 0 then
      if KeyBrokenDuringGame == 0 then
        FireSequence("hm_zonek_dynamic.PipeOrganConvoMarker", "Ballroom_PipeOrgan_TooLong")
        HM_ZoneK_KeyboardCameraHintRelease()
      end
      AudioPostEventOn(GetPlayer(), "Mute_organ_failed")
      SetGlobal("HM_ZoneK_WrongKeyCount", 0)
      SetGlobal("HM_ZoneK_SongGameOn", 0)
      KeyBrokenDuringGame = 0
      Enable("hm_zonek_dynamic.PipeLidCameraTrigger 03")
      return
    end
  end
end
HM_ZoneK_CurrentNote = L0_0
L0_0 = 0
HM_Ballroom_KillSwitchTrip = L0_0
L0_0 = 0
HM_Ballroom_NoteKillSwitch = L0_0
function L0_0()
  if HM_Ballroom_NoteKillSwitch == "6" then
    AudioPostEventOn("hm_zonek_dynamic.NOS_HM_KeyWhite_Collision 04", "Stop_organ_note_F")
  elseif HM_Ballroom_NoteKillSwitch == "7" then
    AudioPostEventOn("hm_zonek_dynamic.HM_KeyGfl", "Stop_organ_note_Fsharp")
  elseif HM_Ballroom_NoteKillSwitch == "10" then
    AudioPostEventOn("hm_zonek_dynamic.NOS_HM_KeyWhite_Collision 06", "Stop_organ_note_A")
  elseif HM_Ballroom_NoteKillSwitch == "1" then
    AudioPostEventOn("hm_zonek_dynamic.NOS_HM_KeyWhite_Collision 01", "Stop_organ_note_C")
  elseif HM_Ballroom_NoteKillSwitch == "12" then
    AudioPostEventOn("hm_zonek_dynamic.NOS_HM_KeyWhite_Collision 07", "Stop_organ_note_B")
  end
end
HM_Ballroom_KillNote = L0_0
function L0_0(A0_18)
  AnimGBSequence("hm_zonek_dynamic.HM_BallroomNoteA 0" .. A0_18, "Fade_Out")
  wait(1)
  Hide("hm_zonek_dynamic.HM_BallroomNoteA 0" .. A0_18)
end
HM_Ballroom_HideNote = L0_0
function L0_0()
  SetGlobal("HM_ZoneK_GremlinState", 1)
end
HM_Ballroom_GremlinCage = L0_0
function L0_0()
  if HM_ZoneK_GremlinRescued == 0 then
    FireSequence("hm_zonek_dynamic.ConvoMarkerGremlin", "Ballroom_Gremlin_Help")
  elseif HM_ZoneK_GremlinRescued == 1 then
    HM_ZoneK_GremlinRescued = 2
    FireSequence("hm_zonek_dynamic.ConvoMarkerGremlin", "Ballroom_Gremlin_Thanks")
  elseif HM_ZoneK_GremlinRescued == 2 then
    FireSequence("hm_zonek_dynamic.ConvoMarkerGremlin", "Ballroom_Gremlin_Passive")
  end
end
HM_Ballroom_RescueGremlin = L0_0
L0_0 = 0
HM_TableBrakeL = L0_0
L0_0 = 0
HM_TableBrakeR = L0_0
L0_0 = 1
HM_Table01 = L0_0
L0_0 = 1
HM_Table02 = L0_0
L0_0 = 1
HM_Table03 = L0_0
L0_0 = 1
HM_Table04 = L0_0
function L0_0(A0_19, A1_20)
  SetSplineFollowerInitialSpeed(A0_19, 1)
  if HM_TableBrakeL == 1 then
    if A1_20 == 2 then
      HM_Table02 = 1
      Enable(A0_19)
    elseif A1_20 == 1 then
      HM_Table01 = 1
      Enable(A0_19)
    end
  elseif HM_TableBrakeR == 1 then
    if A1_20 == 4 then
      HM_Table04 = 1
      Enable(A0_19)
    elseif A1_20 == 3 then
      HM_Table03 = 1
      Enable(A0_19)
    end
  end
end
HM_ZoneK_TableGo = L0_0
function L0_0(A0_21, A1_22)
  SetSplineFollowerInitialSpeed(A0_21, 0)
  if A1_22 == 4 then
    HM_Table04 = 0
  elseif A1_22 == 3 then
    HM_Table03 = 0
  elseif A1_22 == 2 then
    HM_Table02 = 0
  elseif A1_22 == 1 then
    HM_Table01 = 0
  end
end
HM_ZoneK_TableStop = L0_0
L0_0 = 1
HM_TablesLeftSideHint = L0_0
L0_0 = 1
HM_TablesRightSideHint = L0_0
L0_0 = 0
HM_LeftSideTablesOn = L0_0
L0_0 = 0
HM_RightSideTablesOn = L0_0
function L0_0()
  if HM_LeftSideTablesOn == 0 then
    HM_LeftSideTablesOn = 1
    FireSequence("hm_zonek_dynamic.PipeOrganConvoMarker", "Ballroom_PipeOrgan_KeyThirteenThinned2")
  end
end
HM_PlayLeftTableStartup = L0_0
function L0_0()
  if HM_RightSideTablesOn == 0 then
    HM_RightSideTablesOn = 1
    FireSequence("hm_zonek_dynamic.PipeOrganConvoMarker", "Ballroom_PipeOrgan_KeyThirteenThinned")
  end
end
HM_PlayRightTableStartup = L0_0
function L0_0()
  HM_TableBrakeL = 1
  wait(0.1)
  HM_TablesLeftSideHint = 0
  ForcePainted("Table01")
  wait(0.2)
  HM_Table01 = 1
  ForEachEntityInGroup(Enable, "Table01")
  AudioPostEventOn(GetPlayer(), "Play_sfx_LM_SpiritsEscape")
  ForcePainted("Table02")
  wait(0.2)
  HM_Table02 = 1
  Enable("hm_zonek_dynamic.HM_DiningTable_Trigger 02")
  ForEachEntityInGroup(Enable, "Table02")
end
HM_ZoneK_TablesStartupLeft = L0_0
function L0_0()
  HM_TableBrakeR = 1
  wait(0.1)
  HM_TablesRightSideHint = 0
  ForcePainted("Table03")
  wait(0.2)
  HM_Table03 = 1
  Enable("hm_zonek_dynamic.HM_DiningTable_Trigger 05")
  ForEachEntityInGroup(Enable, "Table03")
  AudioPostEventOn(GetPlayer(), "Play_sfx_LM_SpiritsEscape")
  ForcePainted("Table04")
  wait(0.2)
  HM_Table04 = 1
  ForEachEntityInGroup(Enable, "Table04")
  AIHintEnable("Table04")
  AIHintEnable("Table03")
end
HM_ZoneK_TablesStartupRight = L0_0
function L0_0()
  SetGlobal("HM_BallroomRedChestOpen", true)
  HM_Ballroom_SaveCheckpoint()
end
HM_OpenBallroomChest = L0_0
L0_0 = 0
HM_SpawnerLeftBroke = L0_0
L0_0 = 0
HM_SpawnerRightBroke = L0_0
L0_0 = 1
HM_CannonLeftExit = L0_0
L0_0 = 1
HM_CannonRightExit = L0_0
L0_0 = 1
HM_BeetleworxCannonLeft = L0_0
L0_0 = 1
HM_BeetleworxCannonRight = L0_0
function L0_0()
  local L1_23
  L1_23 = 0
  HM_BeetleworxCannonLeft = L1_23
end
HM_BeetleworxCannonLeftKilled = L0_0
function L0_0()
  HM_SpawnerLeftBroke = 0
  Enable("BwrxLeft_DoorTrigger")
  AnimGBSequence("SpawnerLeft_OuterDoors", "Close")
  HM_SpawnerLeft()
end
HM_SpawnerLeftOn = L0_0
function L0_0()
  Disable("BwrxLeft_DoorTrigger")
  if HM_CannonLeftExit == 1 then
    Kill("hm_zonek_dynamic.BeetleworxCannonMixLeft")
  end
  HM_SpawnerLeftBroke = 1
  AnimGBSequence("SpawnerLeft_InnerDoors", "Close")
  AnimGBSequence("SpawnerLeft_Orb", "Close")
  AnimGBSequence("SpawnerLeft_OuterDoors", "Close")
  wait(1.5)
  HM_PlayLeftTableStartup()
end
HM_SpawnerLeftOff = L0_0
function L0_0()
  if HM_SpawnerLeftBroke == 0 then
    AnimGBSequence("SpawnerLeft_OuterDoors", "Close")
  end
end
HM_CloseSpawnerLeft = L0_0
function L0_0()
  local L1_24
  L1_24 = 0
  HM_CannonLeftExit = L1_24
end
HM_ExitSpawnerLeft = L0_0
function L0_0()
  if HM_SpawnerLeftBroke == 0 and HM_BeetleworxCannonLeft == 0 then
    wait(1)
    HM_CannonLeftExit = 1
    HM_BeetleworxCannonLeft = 1
    FireUser1("CannonSpawner01")
  end
end
HM_SpawnerLeft = L0_0
function L0_0()
  local L1_25
  L1_25 = 0
  HM_BeetleworxCannonRight = L1_25
end
HM_BeetleworxCannonRightKilled = L0_0
function L0_0()
  HM_SpawnerRightBroke = 0
  Enable("BwrxRight_DoorTrigger")
  AnimGBSequence("SpawnerRight_OuterDoors", "Close")
  wait(1)
  HM_SpawnerRight()
end
HM_SpawnerRightOn = L0_0
function L0_0()
  Disable("BwrxRight_DoorTrigger")
  if HM_CannonRightExit == 1 then
    Kill("hm_zonek_dynamic.BeetleworxCannonMixRight")
  end
  HM_SpawnerRightBroke = 1
  AnimGBSequence("SpawnerRight_InnerDoors", "Close")
  AnimGBSequence("SpawnerRight_Orb", "Close")
  AnimGBSequence("SpawnerRight_OuterDoors", "Close")
  wait(1.5)
  HM_PlayRightTableStartup()
end
HM_SpawnerRightOff = L0_0
function L0_0()
  if HM_SpawnerRightBroke == 0 and HM_BeetleworxCannonRight == 0 then
    HM_CannonRightExit = 1
    HM_BeetleworxCannonRight = 1
    FireUser1("CannonSpawner02")
  end
end
HM_SpawnerRight = L0_0
function L0_0()
  if HM_SpawnerRightBroke == 0 then
    AnimGBSequence("SpawnerRight_OuterDoors", "Close")
  end
end
HM_CloseSpawnerRight = L0_0
function L0_0()
  local L1_26
  L1_26 = 0
  HM_CannonRightExit = L1_26
end
HM_ExitSpawnerRight = L0_0
function L0_0()
  SetGlobal("NO_donaldarmget", 1)
  SetGlobal("NO_donaldparts", GetGlobal("NO_donaldparts") + 1)
  HM_Ballroom_SaveCheckpoint()
end
HM_GetDonaldArm = L0_0
function L0_0()
  if HM_TablesRightSideHint == 1 and HM_TableBrakeR == 0 then
    RestrictCutSceneInput()
    FireUser1("RightTableRattleCamera")
    Hide("Table04")
    Unhide("hm_zonek_dynamic.HM_DiningTableA1_CutsceneRight_Toon 03")
    wait(0.8)
    AudioPostEventOn(GetPlayer(), "Play_sfx_LM_Ballroom_Table_Shake")
    wait(3.5)
    FireUser3("RightTableRattleCamera")
    wait(0.8)
    Unhide("Table04")
    ForcePainted("Table04")
    Hide("hm_zonek_dynamic.HM_DiningTableA1_CutsceneRight_Toon 03")
    FireSequence("hm_zonek_dynamic.GusConvoMarker", "BR_Gus_PressurePlate")
  end
end
HM_RightTableRattle = L0_0
function L0_0()
  if HM_TablesLeftSideHint == 1 and HM_TableBrakeL == 0 then
    RestrictCutSceneInput()
    FireUser1("LeftTableRattleCamera")
    Hide("Table01")
    Unhide("hm_zonek_dynamic.HM_DiningTableA1_CutsceneLeft_Toon 01")
    wait(0.8)
    AudioPostEventOn(GetPlayer(), "Play_sfx_LM_Ballroom_Table_Shake")
    wait(3.5)
    FireUser3("LeftTableRattleCamera")
    wait(0.8)
    Unhide("Table01")
    ForcePainted("Table01")
    Hide("hm_zonek_dynamic.HM_DiningTableA1_CutsceneLeft_Toon 01")
    FireSequence("hm_zonek_dynamic.GusConvoMarker", "BR_Gus_PressurePlate")
  end
end
HM_LeftTableRattle = L0_0
