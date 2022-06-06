local L0_0, L1_1
L0_0 = false
MJM_SkipIntro = L0_0
function L0_0()
  if MJM_SkipIntro == false then
    MJM_SkipIntro = true
    MJM_Setup_Launcher("MJM_GEnter")
    StartTrackingCurrentLevelForScoring("MJM_Piles")
  end
end
MJM_ZoneG_AlwaysSetup_Launcher = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("MJM_Piles")
end
MJM_ZoneG_LeavingPiles = L0_0
function L0_0()
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
end
MJM_Piles_CamDefault = L0_0
function L0_0()
  FireSequence("Gus", "MJM_Gus_BeetleworxReminder")
  SetMap(nil, "MAP_MJ_ZONEG", "GAME")
  FireUser1("mjm_zoneg1_audio.Portal")
end
MJM_Piles_SaveCheckpoint0 = L0_0
function L0_0()
  MJM_Piles_CamDefault()
  SaveCheckpoint(GetPlayer(), "MJM_PilesLoadCheckpoint", "mjm_zoneg.Marker(Rotatable) 01")
  UnrestrictCutSceneInput()
end
MJM_Piles_IntroEnd = L0_0
function L0_0()
  Print("******************************MJM_Piles_SaveCheckpoint")
  SetGlobal("MJM_PilesProgress", 1)
  wait(0.1)
  SaveCheckpoint(GetPlayer(), "MJM_PilesLoadCheckpoint", "mjm_zoneg.Marker(Rotatable) 01")
end
MJM_Piles_SaveCheckpoint = L0_0
function L0_0()
  Print("******************************MJM_Piles_SaveCheckpoint2")
  SetGlobal("MJM_PilesProgress", 2)
  wait(0.1)
  SaveCheckpoint(GetPlayer(), "MJM_PilesLoadCheckpoint", "mjm_zoneg.Marker(Rotatable) 02")
end
MJM_Piles_SaveCheckpoint2 = L0_0
function L0_0()
  Print("******************************MJM_Piles_SaveCheckpoint3")
  SetGlobal("MJM_PilesProgress", 3)
  wait(0.1)
  SaveCheckpoint(GetPlayer(), "MJM_PilesLoadCheckpoint", "mjm_zoneg.Marker(Rotatable) 03")
end
MJM_Piles_SaveCheckpoint3 = L0_0
function L0_0(A0_2, A1_3)
  Print("******************************MJM_Piles_SaveCheckpoint4")
  if GetGlobal("MJM_PilesProgress") == 4 then
  else
    SetGlobal("MJM_PilesProgress", 4)
    SetGlobal("MJM_Piles_TopOrBottom", tonumber(A1_3))
  end
  if GetGlobal("MJM_Piles_Cranes_Activated") == 0 and GetGlobal("MJM_Gus_ExitAlert_Played") == 0 then
    FireSequence("Gus", "MJM_Gus_ExitAlert")
  end
  wait(0.5)
  if true == false then
    if GetGlobal("MJM_Piles_TopOrBottom") == 0 then
      SaveCheckpoint(GetPlayer(), "MJM_PilesLoadCheckpoint", "mjm_zoneg.Checkpoint4MarkerTopTrack")
    elseif GetGlobal("MJM_Piles_TopOrBottom") == 1 then
      SaveCheckpoint(GetPlayer(), "MJM_PilesLoadCheckpoint", "mjm_zoneg.Checkpoint4MarkerBottomTrack")
    end
  end
end
MJM_Piles_SaveCheckpoint4 = L0_0
function L0_0()
  Print("******************************MJM_Piles_SaveCheckpoint4alt")
  if GetGlobal("MJM_Piles_TopOrBottom") == 0 then
    SaveCheckpoint(GetPlayer(), "MJM_PilesLoadCheckpoint", "mjm_zoneg.Checkpoint4MarkerTopTrack")
  elseif GetGlobal("MJM_Piles_TopOrBottom") == 1 then
    SaveCheckpoint(GetPlayer(), "MJM_PilesLoadCheckpoint", "mjm_zoneg.Checkpoint4MarkerBottomTrack")
  end
end
MJM_Piles_SaveCheckpoint4alt = L0_0
function L0_0()
  Print("******************************MJM_Piles_SaveCheckpoint5")
  if GetGlobal("MJM_PilesProgress") == 5 then
  else
    SetGlobal("MJM_PilesProgress", 5)
    SaveCheckpoint(GetPlayer(), "MJM_PilesLoadCheckpoint", "mjm_zoneg.Marker(Rotatable) 05")
  end
end
MJM_Piles_SaveCheckpoint5 = L0_0
function L0_0()
  MJM_Piles_CamDefault()
  MJM_SkipIntro = true
  StartTrackingCurrentLevelForScoring("MJM_Piles")
  FireUser1("mjm_zoneg1_audio.Portal")
  SetMap(nil, "MAP_MJ_ZoneG", "GAME")
  ForEachEntityInGroup(FireUser1, "PilesCheckpoints")
  if GetGlobal("MJM_PilesProgress") == 1 then
    Disable("mjm_zoneg.grabcamerafancy 02.FancyTriggerRotate 01")
    Hide("mjm_zoneg.BeetleworxFodder 01")
    Disable("mjm_zoneg.Spawner 01")
    Hide("mjm_zoneg.MJ_ZoneG_Gate01 01")
    DestroyEntity("mjm_zoneg.MJ_ZoneG_Gate01 01")
    DisableGuardianHint("mjm_zoneg1.PlayerHintMarkers 01")
  elseif GetGlobal("MJM_PilesProgress") == 2 then
    Disable("mjm_zoneg.grabcamerafancy 02.FancyTriggerRotate 01")
    Hide("mjm_zoneg.BeetleworxFodder 01")
    Disable("mjm_zoneg.Spawner 01")
    Hide("mjm_zoneg.MJ_ZoneG_Gate01 01")
    Disable("mjm_zoneg.grabcamerafancy 01.FancyTriggerRotate 01")
    DestroyEntity("mjm_zoneg.KamikazeBlotlingStationary 02")
    DestroyEntity("mjm_zoneg.KamikazeBlotlingStationary 01")
    Hide("mjm_zoneg.MJ_ZoneG_Breakable_Wall01 01")
  elseif GetGlobal("MJM_PilesProgress") == 3 then
    Disable("mjm_zoneg.grabcamerafancy 02.FancyTriggerRotate 01")
    Hide("mjm_zoneg.BeetleworxFodder 01")
    Disable("mjm_zoneg.Spawner 01")
    Hide("mjm_zoneg.MJ_ZoneG_Gate01 01")
    Disable("mjm_zoneg.grabcamerafancy 01.FancyTriggerRotate 01")
    Hide("mjm_zoneg.KamikazeBlotlingStationary 02")
    Hide("mjm_zoneg.KamikazeBlotlingStationary 01")
    Hide("mjm_zoneg.MJ_ZoneG_Breakable_Wall01 01")
    SetCameraAttributes("mjm_zoneg2.PlaneTrigger_CameraOverride 07")
    TeleportToEntity("mjm_zoneg2_audio.Portal_respawn4 01", GetPlayer())
    Enable("mjm_zoneg2_audio.Portal_respawn4 01")
  elseif GetGlobal("MJM_PilesProgress") == 4 or GetGlobal("MJM_PilesProgress") == 5 then
    if GetGlobal("MJM_PilesProgress") == 5 then
      FireUser2("mjm_zoneg2.PlaneTrigger_CheckpointEnd")
    end
    Disable("mjm_zoneg.grabcamerafancy 02.FancyTriggerRotate 01")
    Hide("mjm_zoneg.BeetleworxFodder 01")
    Disable("mjm_zoneg.Spawner 01")
    Hide("mjm_zoneg.MJ_ZoneG_Gate01 01")
    Disable("mjm_zoneg.grabcamerafancy 01.FancyTriggerRotate 01")
    Hide("mjm_zoneg.KamikazeBlotlingStationary 02")
    Hide("mjm_zoneg.KamikazeBlotlingStationary 01")
    Hide("mjm_zoneg.MJ_ZoneG_Breakable_Wall01 01")
    if GetGlobal("MJM_PilesProgress") == 4 then
      FireUser2("mjm_zoneg2.PlaneTrigger_CheckpointTop")
      FireUser2("mjm_zoneg2.PlaneTrigger_CheckpointBottom")
    end
    TeleportToEntity("mjm_zoneg2_audio.Portal_respawn4", GetPlayer())
    Enable("mjm_zoneg2_audio.Portal_respawn4")
    if GetGlobal("MJM_Piles_Cranes_Activated") == 1 then
      Print("**********ACTIVATING CRANES************")
      AnimGBSequence("mjm_zoneg.MJ_ZoneG_Crane01 01", "Stepping_Stone")
      MJM_LastNumberPressed = -1
    end
  elseif GetGlobal("MJM_PilesProgress") == 10 then
    ForEachEntityInGroup(DestroyEntity, "AirlockKamikazes")
    AnimGBSequence("mjm_zonegairlock.MJ_ZoneG_Door02 01", "Opened")
    GetPrefabData("MJMnozzle").Prefab_MachineBusy = 1
    AnimGBSequence("mjm_zonegairlock.MJ_ZoneG_Door01 01", "Closed")
    Hide("mjm_zonegairlock.Trigger_CameraOverride 01")
    ClearAllCameraAttributesTimedSD(GetPlayer(), 2)
    DisableGuardianHint("mjm_zonegairlock.PlayerHintMarkers 01")
    AnimGBSequence("MJMGPaintTank", "Rest4")
  elseif GetGlobal("MJM_PilesProgress") == 11 then
    ForEachEntityInGroup(DestroyEntity, "AirlockKamikazes")
    AnimGBSequence("mjm_zonegairlock.MJ_ZoneG_Door03 01", "Opened")
    GetPrefabData("MJMnozzle").Prefab_MachineBusy = 1
    AnimGBSequence("mjm_zonegairlock.MJ_ZoneG_Door01 01", "Closed")
    Hide("mjm_zonegairlock.Trigger_CameraOverride 01")
    ClearAllCameraAttributesTimedSD(GetPlayer(), 2)
    DisableGuardianHint("mjm_zonegairlock.PlayerHintMarkers 01")
    AnimGBSequence("MJMGThinnerTank", "Rest4")
  end
end
MJM_PilesLoadCheckpoint = L0_0
function L0_0()
  SetParentEntity("mjm_zoneg.MJ_ZoneG_BLOCK01 01", "mjm_zoneg.MJ_ZoneG_Crane01 01")
end
MJM_ZoneGCubeParenting = L0_0
function L0_0(A0_4)
  SplineFollower_TeleportToKnot(A0_4, "mjm_zoneg.SplineKnot 17")
end
MJM_ZoneGOnPassTeleport = L0_0
function L0_0(A0_5)
  SplineFollower_TeleportToKnot(A0_5, "mjm_zoneg.SplineKnot 19")
end
MJM_ZoneGOnPassTeleport2 = L0_0
function L0_0(A0_6)
  SplineFollower_TeleportToKnot(A0_6, "mjm_zoneg.SplineKnot 21")
end
MJM_ZoneGOnPassTeleport3 = L0_0
function L0_0(A0_7)
  SplineFollower_TeleportToKnot(A0_7, "mjm_zoneg.SplineKnot 23")
end
MJM_ZoneGOnPassTeleport4 = L0_0
function L0_0(A0_8)
  SplineFollower_TeleportToKnot(A0_8, "mjm_zoneg.SplineKnot 25")
end
MJM_ZoneGOnPassTeleport5 = L0_0
function L0_0(A0_9)
  SetGlobal("MJM_BoxNumber", GetGlobal("MJM_BoxNumber") + 1)
  if GetGlobal("MJM_BoxNumber") == 1 then
    SplineFollower_TeleportToKnot(A0_9, "mjm_zoneg.SplineKnot 03")
  elseif GetGlobal("MJM_BoxNumber") == 2 then
    SplineFollower_TeleportToKnot(A0_9, "mjm_zoneg.SplineKnot 02")
  elseif GetGlobal("MJM_BoxNumber") == 3 then
    SplineFollower_TeleportToKnot(A0_9, "mjm_zoneg.SplineKnot 01")
    SetGlobal("MJM_BoxNumber", 0)
  end
end
MJM_ZoneGOnPassBox = L0_0
function L0_0()
  Print("**********LUA: Bark Phone Hint*************")
  if GetGlobal("MJM_Gus_CodeReminder_Played") == 0 then
    ForceSequence("Gus", "MJM_Gus_CodeReminder2")
  elseif GetGlobal("MJM_Gus_CodeReminder_Played") == 1 then
    ForceSequence("Gus", "MJM_Gus_CodeReminder1")
  end
end
MJM_BarkPhoneHint = L0_0
L0_0 = -1
MJM_LastNumberPressed = L0_0
L0_0 = 0
First = L0_0
L0_0 = 0
Second = L0_0
L0_0 = 0
Third = L0_0
L0_0 = 0
Fourth = L0_0
function L0_0(A0_10, A1_11)
  MJM_LastNumberPressed = A1_11
  if First == 0 and Second == 0 and Third == 0 and Fourth == 0 then
    if MJM_LastNumberPressed == "3" then
      First = 1
      Print("3 Pressed: Starting First Chain. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    elseif MJM_LastNumberPressed == "5" then
      Second = 1
      Print("5 Pressed: Starting Second Chain. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    elseif MJM_LastNumberPressed == "0" then
      Third = 1
      Print("0 Pressed: Starting Third Chain. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    elseif MJM_LastNumberPressed == "7" and GetGlobal("TT_PhoneBoxesComplete_Played") == 1 then
      Fourth = 1
      Print("7 Pressed: Starting Fourth Chain. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    else
      First = -1
      Second = -1
      Third = -1
      Fourth = -1
      Print("FAILING START NUMBER PRESSED. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    end
  elseif First == 1 and Second == 0 and Third == 0 and Fourth == 0 then
    if MJM_LastNumberPressed == "4" then
      First = 2
      Print("4 Pressed: Maintaining First Chain. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    else
      First = -1
      Second = -1
      Third = -1
      Fourth = -1
      Print("FAILING SECOND NUMBER PRESSED. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    end
  elseif First == 0 and Second == 1 and Third == 0 and Fourth == 0 then
    if MJM_LastNumberPressed == "1" then
      Second = 2
      Print("1 Pressed: Maintaining Second Chain. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    else
      First = -1
      Second = -1
      Third = -1
      Fourth = -1
      Print("FAILING SECOND NUMBER PRESSED. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    end
  elseif First == 0 and Second == 0 and Third == 1 and Fourth == 0 then
    if MJM_LastNumberPressed == "3" then
      Third = 2
      Print("3 Pressed: Maintaining Third Chain. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    else
      First = -1
      Second = -1
      Third = -1
      Fourth = -1
      Print("FAILING SECOND NUMBER PRESSED. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    end
  elseif First == 0 and Second == 0 and Third == 0 and Fourth == 1 then
    if MJM_LastNumberPressed == "2" then
      Fourth = 2
      Print("2 Pressed: Maintaining Fourth Chain. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    else
      First = -1
      Second = -1
      Third = -1
      Fourth = -1
      Print("FAILING SECOND NUMBER PRESSED. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    end
  elseif First == 2 and Second == 0 and Third == 0 and Fourth == 0 then
    if MJM_LastNumberPressed == "9" then
      First = 3
      Print("9 Pressed: Maintaining First Chain. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    else
      First = -1
      Second = -1
      Third = -1
      Fourth = -1
      Print("FAILING SECOND NUMBER PRESSED. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    end
  elseif First == 0 and Second == 2 and Third == 0 and Fourth == 0 then
    if MJM_LastNumberPressed == "2" then
      Second = 3
      Print("3 Pressed: Maintaining Second Chain. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    else
      First = -1
      Second = -1
      Third = -1
      Fourth = -1
      Print("FAILING SECOND NUMBER PRESSED. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    end
  elseif First == 0 and Second == 0 and Third == 2 and Fourth == 0 then
    if MJM_LastNumberPressed == "3" then
      Third = 3
      Print("3 Pressed: Maintaining Third Chain. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    else
      First = -1
      Second = -1
      Third = -1
      Fourth = -1
      Print("FAILING SECOND NUMBER PRESSED. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    end
  elseif First == 0 and Second == 0 and Third == 0 and Fourth == 2 then
    if MJM_LastNumberPressed == "6" then
      Fourth = 3
      Print("6 Pressed: Maintaining Fourth Chain. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    else
      First = -1
      Second = -1
      Third = -1
      Fourth = -1
      Print("FAILING SECOND NUMBER PRESSED. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
    end
  else
    Print("SOMETHING WENT HORRIBLY, TERRIBLY WRONG. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
  end
  if First == 3 or Second == 3 or Third == 3 or Fourth == 3 then
    if First == 3 then
      wait(0.1)
      AudioPostEventOn("mjm_zonea_audio.Sound_Marker_phone_toneLP", "Play_sfx_MJM_Heaps_phone_Oswald_033")
    elseif Second == 3 then
      Print("512 PRESSED -- MAKE STUFF HAPPEN!")
      if GetGlobal("MJM_Piles_Cranes_Activated") == 0 then
        AudioSetState(GetPlayer(), "Music_State", "Stinger_Success")
        FireUser1("cameraArmPlatform")
        AnimGBSequence("mjm_zoneg.MJ_ZoneG_Crane01 01", "Stepping_Stone")
        TimerDisable("mjm_zoneg.LogicTimerMarker 01")
        wait(6)
        AudioSetState(GetPlayer(), "Music_State", "Auto")
        SetGlobal("MJM_Piles_Cranes_Activated", 1)
        MJM_Piles_SaveCheckpoint4()
      end
      AudioPostEventOn("mjm_zonea_audio.Sound_Marker_phone_toneLP", "Play_sfx_MJM_Heaps_phone_Oswald_033")
    elseif Third == 3 then
      Print("033 PRESSED -- MAKE STUFF HAPPEN!")
      wait(0.1)
      AudioPostEventOn("mjm_zonea_audio.Sound_Marker_phone_toneLP", "Play_sfx_MJM_Heaps_phone_Oswald_033")
    elseif Fourth == 3 then
      Print("726 PRESSED -- MAKE STUFF HAPPEN!")
      wait(0.1)
      AudioPostEventOn("mjm_zonea_audio.Sound_Marker_phone_toneLP", "Play_sfx_MJM_Heaps_phone_Oswald_033")
      if GetGlobal("TT_PhoneCodeEntered") == 0 then
        SetGlobal("MJM_WhichPhone", 1)
        FireSequence("mjm_zoneg2_igc.TelephonePilesConversationMarker", "TT_SevenTwoSix")
      end
    end
    First = 0
    Second = 0
    Third = 0
    Fourth = 0
    Print("PASSING CODE PRESSED, RESETTING. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
  elseif First == -1 and Second == -1 and Third == -1 and Fourth == -1 then
    First = 0
    Second = 0
    Third = 0
    Fourth = 0
    AudioPostEventOn(GetPlayer(), "Play_sfx_MJM_Phone_WrongNumber")
    Print("FAILED CODE FX PLAYED, RESETTING. FSTF: (_" .. First .. "_" .. Second .. "_" .. Third .. "_" .. Fourth .. "_)")
  end
end
MJM_LogNumber = L0_0
function L0_0()
  PauseAllAI()
end
MJM_PauseAI = L0_0
function L0_0()
  UnpauseAllAI()
end
MJM_UnpauseAI = L0_0
function L0_0()
  if GetGlobal("MJM_PilesProgress") == 10 or GetGlobal("MJM_PilesProgress") == 11 then
    Print("*******************Enable,PilesCheckpoints")
    ForEachEntityInGroup(Enable, "PilesCheckpoints")
    ForEachEntityInGroup(Enable, "PilesCheckpoints")
    Print("*******************Enable,PilesCheckpoints END")
  end
end
MJM_ZoneG2_EnableSaveCheckpoints = L0_0
function L0_0()
  while true do
    StartEmitters("mainjet1")
    Unhide("pilesdmg1")
    wait(5)
    StopEmitters("mainjet1")
    Hide("pilesdmg1")
    AnimGBSequence("fakeout2", "on")
    wait(2)
    AnimGBSequence("fakeout2", "off")
  end
end
MJM_PilesThinnerJet = L0_0
function L0_0()
  if GetGlobal("MJM_Gus_Phone349_Played") == false or GetGlobal("MJM_Piles_Ronald_Freed_Played") == false then
    FireSequence("Gus", "MJM_Gus_DontNeedCode")
  end
end
MJM_NoCodes = L0_0
function L0_0()
  RestrictCutSceneInput()
  GrabCamera("mjm_zoneg.CameraControlPoint 01", "mjm_zoneg.Marker(Parentable) 01", CAMERA_LERP_TRANSITION, 1)
  Bark(GetPlayer(), "The anvil broke it Mickey, check out those cranes!", 3)
  AnimGBSequence("mjm_zoneg.MJ_ZoneG_Crane01 01", "Block_Drop")
  Disable("mjm_zoneg.TriggerRotate 03")
  TimerDisable("mjm_zoneg.LogicTimerMarker 01")
  wait(5)
  Enable("mjm_zoneg.MJ_ZoneG_Hand01 01")
  wait(5)
  Unhide("mjm_zoneg.TreasureChest 01")
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1)
  UnrestrictCutSceneInput()
end
MJM_ZoneGPhoneAnvil = L0_0
function L0_0()
  RestrictCutSceneInput()
  GrabCamera("mjm_zoneg.CameraControlPoint 02", "mjm_zoneg.Marker(Parentable) 03", CAMERA_LERP_TRANSITION, 2)
  wait(3)
  wait(3)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 2)
  UnrestrictCutSceneInput()
end
MJM_ZoneG_Fodder = L0_0
function L0_0()
  SetGlobal("MJM_FodderCount", GetGlobal("MJM_FodderCount") + 1)
  if GetGlobal("MJM_FodderCount") == 1 then
    DisableGuardianHint("mjm_zoneg1.PlayerHintMarkers 01")
    wait(3)
    StartFadeOut(0.2)
    wait(0.2)
    TeleportToEntity("mjm_zoneg.SafetyGateIGCMarkerPlayerPos", GetPlayer())
    TeleportToEntity(GetPlayer(), "mjm_zoneg.SafetyGateIGCMarkerSafe")
    StartFadeIn(0.2)
    FireUser1("cameraBWGate")
    Enable("mjm_zoneg.Spawner 01")
    StartEmitters("mjm_zoneg.Common_Sparks_05 01")
    wait(0.2)
    StartEmitters("mjm_zoneg.Common_Sparks_05 02")
    wait(1)
    AnimGBSequence("mjm_zoneg.MJ_ZoneG_Gate01 01", "Open")
    wait(1.5)
    FireSequence("Gus", "MJM_Gus_MoreFodder")
    StopEmitters("mjm_zoneg.Common_Sparks_05 01")
    StopEmitters("mjm_zoneg.Common_Sparks_05 02")
    wait(2)
    StartFadeOut(0.2)
    wait(0.5)
    TeleportToEntity(GetPlayer(), "mjm_zoneg.SafetyGateIGCMarkerPlayerPos")
    wait(0.5)
    StartFadeIn(0.2)
    wait(0.2)
    MJM_Piles_SaveCheckpoint()
  end
end
MJM_ZoneG_FodderCount = L0_0
function L0_0()
  SetDefaultCameraValues(7, 25, -20)
end
ConveyorCam = L0_0
function L0_0()
  SetDefaultCameraValues(5.5, 16, -13)
end
ConveyorCamUndo = L0_0
function L0_0()
  ForceSequence("Gus", "MJM_Gus_BeetleworxReminder")
end
MJM_ZoneG_NewFodderCam = L0_0
function L0_0()
  ForceSequence("Gus", "MJM_Gus_FactoryBackground")
end
MJM_ZoneG_FactoryBackground = L0_0
function L0_0()
  FireSequence("Gus", "MJM_Gus_SpladooshIntroduction")
end
MJM_ZoneG_SpladooshIntro = L0_0
function L0_0()
  wait(2.5)
  ForceSequence("Gus", "MJM_Gus_SpladooshSneak")
end
MJM_ZoneG_SpladooshSneak = L0_0
function L0_0()
  ForceSequence("Gus", "MJM_Gus_SpladooshBlew")
end
MJM_ZoneG_SpladooshBlew = L0_0
function L0_0()
  StartFadeOut(1)
end
MJM_fadefix = L0_0
function L0_0()
  local L0_12
  L0_12 = FireUser1
  L0_12("cameralookatmjm1")
  L0_12 = wait
  L0_12(1)
  L0_12 = FireThread
  L0_12(TeleportGremlinIn, "caged_gremlin_Ronald", "mjm_zoneg_igc.Camera_GremlinRonaldDialsCrane_TeleportMarker 01", false, false)
  L0_12 = wait
  L0_12(0.1)
  L0_12 = GetChildEntityByName
  L0_12 = L0_12("caged_gremlin_Ronald", "GremlinWrench")
  Unhide(L0_12)
  DisableMotion("caged_gremlin_Ronald")
  wait(0.6)
  EnterCutscene("caged_gremlin_Ronald", 1)
  Wait(0.5)
  TeleportGremlinOut("caged_gremlin_Ronald")
  Wait(0.5)
  FireThread(TeleportGremlinIn, "caged_gremlin_Ronald", "mjm_zoneg_igc.Camera_GremlinRonaldDialsCrane_TeleportMarker 02", false, false)
  wait(0.7)
  EnterCutscene("caged_gremlin_Ronald", 1)
  Wait(0.5)
  TeleportGremlinOut("caged_gremlin_Ronald")
  Wait(0.5)
  FireThread(TeleportGremlinIn, "caged_gremlin_Ronald", "mjm_zoneg_igc.Camera_GremlinRonaldDialsCrane_TeleportMarker 03", false, false)
  wait(0.7)
  EnterCutscene("caged_gremlin_Ronald", 1)
  Wait(0.5)
  GetPrefabData("cameraArmPlatform").shotOrder = "mid"
  TeleportGremlinOut("caged_gremlin_Ronald")
  FireUser1("cameraArmPlatform")
  AnimGBSequence("mjm_zoneg.MJ_ZoneG_Crane01 01", "Stepping_Stone")
  AudioSetState(GetPlayer(), "Music_State", "Stinger_Success")
  Wait(6)
  AudioSetState(GetPlayer(), "Music_State", "Auto")
  SetGlobal("MJM_Piles_Cranes_Activated", 1)
  MJM_Piles_SaveCheckpoint4()
end
MJM_ZoneG_DestroyedGremlinCage = L0_0
function L0_0()
  paintfoddermanually1()
  paintfoddermanually2()
  paintfoddermanually3()
  paintfoddermanually4()
  paintfoddermanually5()
end
paintfoddermanually0 = L0_0
function L0_0()
  local L0_13
  L0_13 = GetChildEntityByName
  L0_13 = L0_13("mjm_zoneg.BeetleworxFodder 01", "BeetleworxFodder_ToonHead_MJ")
  ForcePainted(L0_13)
end
paintfoddermanually1 = L0_0
function L0_0()
  local L0_14
  L0_14 = GetChildEntityByName
  L0_14 = L0_14("mjm_zoneg.BeetleworxFodder 01", "BeetleworxFodder_ToonTorso_MJ")
  ForcePainted(L0_14)
end
paintfoddermanually2 = L0_0
function L0_0()
  local L0_15
  L0_15 = GetChildEntityByName
  L0_15 = L0_15("mjm_zoneg.BeetleworxFodder 01", "BeetleworxFodder_ToonNeck1_MJ")
  ForcePainted(L0_15)
end
paintfoddermanually3 = L0_0
function L0_0()
  local L0_16
  L0_16 = GetChildEntityByName
  L0_16 = L0_16("mjm_zoneg.BeetleworxFodder 01", "BeetleworxFodder_ToonNeck2_MJ")
  ForcePainted(L0_16)
end
paintfoddermanually4 = L0_0
function L0_0()
  local L0_17
  L0_17 = GetChildEntityByName
  L0_17 = L0_17("mjm_zoneg.BeetleworxFodder 01", "BeetleworxFodder_ToonLeg_MJ")
  ForcePainted(L0_17)
end
paintfoddermanually5 = L0_0
function L0_0(A0_18)
  SetPropertyInt(A0_18, "Damage On Collision", 1000)
end
MJM_BlockLethal = L0_0
function L0_0(A0_19)
  SetPropertyInt(A0_19, "Damage On Collision", 0)
end
MJM_BlockNonLethal = L0_0
