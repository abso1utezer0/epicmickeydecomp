local L0_0, L1_1
L0_0 = false
MJM_SkipIntro = L0_0
function L0_0()
  if MJM_SkipIntro == false then
    StartFadeOut(0)
    MJM_SkipIntro = true
    MJM_Setup_Launcher("mjm_zonea.seq_projector 01.ExitProjectorMarker")
    StartTrackingCurrentLevelForScoring("MJM_Heaps")
    MJM_GuardianActivationSystem(GetGlobal("MJM_HeapsGuardianProgress"))
    SetGlobal("MS_MeanStreetProgress", 1)
    GuardianPrefab_PopulateGuardians("MJM_Heaps_GuardianSpawner")
    MJM_Hide_TV_Screens()
  end
end
MJM_ZoneA_AlwaysSetup_Launcher = L0_0
function L0_0()
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
end
MJM_ZoneA_CamDefault = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("MJM_Heaps")
end
MJM_ZoneA_LeavingHeaps = L0_0
function L0_0()
  SetMap(nil, "MAP_MJ_ZONEA", "GAME")
  MJM_ZoneA_CamDefault()
  ForceSequence("Gus", "MJM_Gus_IntroCrane")
end
MJM_Heaps_SaveCheckpoint0 = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "MJM_HeapsLoadCheckpoint", "mjm_zonea.ExitUponDeathMarker")
end
MJM_Heaps_SaveCheckpoint = L0_0
function L0_0()
  MJM_ZoneA_CamDefault()
  Print("*********************************Load Checkpoint")
  MJM_SkipIntro = true
  GuardianPrefab_PopulateGuardians("MJM_Heaps_GuardianSpawner")
  StartTrackingCurrentLevelForScoring("MJM_Heaps")
  MJM_GuardianActivationSystem(GetGlobal("MJM_HeapsGuardianProgress"))
  if GetGlobal("MJM_HeapsProgress") == 1 then
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Steamshovel 01", "RestUnlock")
    SetGlobal("MJM_CraneAnimPlayed", 1)
    SetGlobal("MJM_StartedDeckerQuest", 1)
    MJM_Hide_TV_Screens()
    ForEachEntityInGroup(Hide, "mjmtvfx")
  elseif GetGlobal("MJM_HeapsProgress") == 2 then
  end
  if GetGlobal("MJM_Kip_ThankYou_Played") == 1 then
    DestroyEntity("MJM_Caged_Gremlin_CageBreak")
    DestroyEntity("mjm_zonea.dbc_gremlin_clean 01.dbc_gremlin_clean.Gremlin_CageBreakable01")
  end
  if GetGlobal("MJM_CraneAnimPlayed") == 0 then
    SetGlobal("MJM_TV1Painted", 0)
    SetGlobal("MJM_TV2Painted", 0)
    SetGlobal("MJM_TV3Painted", 0)
    SetGlobal("MJM_TVCounter", 0)
  end
  if GetGlobal("MJM_CraneAnimPlayed") == 1 then
    MJM_Hide_TV_Screens()
    ForEachEntityInGroup(Hide, "mjmtvfx")
  else
    MJM_Hide_TV_Screens()
    ForEachEntityInGroup(Hide, "mjmtvfx")
  end
end
MJM_HeapsLoadCheckpoint = L0_0
function L0_0()
  Hide("mjm_zonea.TV_Screen 01")
  Hide("mjm_zonea.TV_Screen 02")
  Hide("mjm_zonea.TV_Screen 03")
  Hide("mjm_zonea.TV_Sparks 02")
  Hide("mjm_zonea.TV_Sparks 03")
end
MJM_Hide_TV_Screens = L0_0
function L0_0()
  SetCameraAttributes("mjm_zonea.PlaneTrigger_CameraOverride 02")
end
MJM_Heaps_AfterGumballRelease = L0_0
function L0_0()
  FireUser1("mjm_zonea.grabcamerafancy 04.FancyCameraLookAt 01")
end
MJM_BunnyIntro = L0_0
function L0_0()
  FireUser1("mjm_zonea.spatterpipespawner 01.Pipe_Straight_2m_Spawner 01")
end
MJM_IntroRelease = L0_0
function L0_0()
  Hide("Spray1")
  wait(5)
  AnimGBSequence("mjm_zonea.MJ_GasMask01_Head 01", "spray")
  wait(1)
  ForceSketched("mjm_zonea.MJ_GasMask01_Head 01")
  Unhide("Spray3")
  wait(0.5)
  Hide("Spray3")
  Unhide("Spray2")
  wait(0.5)
  Hide("Spray2")
  Unhide("Spray1")
  AnimGBSequence("mjm_zonea.MJ_GasMask01_Head 01", "rest")
end
MJM_MickeyGasMask1 = L0_0
function L0_0()
  RestrictCutSceneInput()
  GrabCamera("mjm_zonea.CameraControlPoint 01", "mjm_zonea.Marker(Parentable) 04", CAMERA_LERP_TRANSITION, 0)
  wait(3)
  GrabCamera("mjm_zonea.CameraControlPoint 02", "mjm_zonea.Marker(Parentable) 05", CAMERA_LERP_TRANSITION, 0)
  wait(3)
  GrabCamera("mjm_zonea.CameraControlPointSplineFollower 01", "mjm_zonea.Marker(Parentable) 07", CAMERA_LERP_TRANSITION, 0)
  Enable("mjm_zonea.CameraControlPointSplineFollower 01")
  GrabCamera("mjm_zonea.CameraControlPointSplineFollower 01", "mjm_zonea.Marker(Parentable) 08", CAMERA_LERP_TRANSITION, 5)
  wait(7)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  UnrestrictCutSceneInput()
end
MJM_ZoneAIntro = L0_0
function L0_0()
  if GetGlobal("MJM_BlockDown") == 1 then
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Anvil 01", "fall")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Ruler 01", "fail from anvil")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Toon12 01", "fail from anvil")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Toon14 01", "fail from anvil")
  else
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Block_Weight 01", "tilt")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Toon12 01", "thinned")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Toon14 01", "tilt")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Anvil 01", "fall")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Ruler 01", "tilt2")
    SetGlobal("MJM_AnvilDown", 1)
  end
end
MJM_ZoneAAnvilSide = L0_0
function L0_0()
  if GetGlobal("MJM_AnvilDown") == 1 then
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Block_Weight 01", "fall")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Ruler 01", "fail from block")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Toon12 01", "fail from block")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Toon14 01", "fail from block")
  else
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Block_Weight 01", "fall")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Toon12 01", "tilt")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Toon14 01", "thinned")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Anvil 01", "tilt")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_Ruler 01", "Tilt")
    SetGlobal("MJM_BlockDown", 1)
  end
end
MJM_ZoneABlockSide = L0_0
function L0_0()
  TeleportToEntity("mjm_zonea.StandAtGremlinMarker2", GetPlayer())
  TeleportToEntity(GetPlayer(), "mjm_zonea.StandAtGremlinMarker")
end
MJM_PlaceMickeyAtGremlin = L0_0
function L0_0()
  if GetGlobal("MJM_HeapsProgress") == 1 then
    SetPropertyVector("MJM_Caged_Gremlin_CageBreak", "UsableEffectOffset", vector4(0, -100, 0), 0)
    SetPropertyFloat("MJM_Caged_Gremlin_CageBreak", "UsableRadius", 0)
    FireUser1("ForceSolveGremlin 01")
    Wait(1.6)
    FireSequence("MJM_Caged_Gremlin_CageBreak", "Genric Line 01")
    Wait(1)
    TeleportGremlinOut("MJM_Caged_Gremlin_CageBreak")
    StartFadeOut(0.8)
    Wait(0.8)
    CameraReset()
    StartFadeIn(0.8)
    UnrestrictCutSceneInput()
    DestroyEntity("MJM_Caged_Gremlin_CageBreak")
    SetGlobal("MJM_Kip_ThankYou_Played", 1)
    MJM_Heaps_SaveCheckpoint()
  else
    FireSequence("MJM_Caged_Gremlin_CageBreak", "MJM_Kip_ThankYou")
  end
end
MJM_KipDialog = L0_0
function L0_0()
  AnimGBSequence("mjm_zonea.MJ_ZoneA_Steamshovel 01", "Rest")
  SetGlobal("MJM_HeapsProgress", 1)
  if GetGlobal("MJM_Kip_ThankYou_Played") == 1 then
    SetGlobal("MJM_TVorKipQuestComplete", 1)
    TeleportGremlinOut("MJM_Caged_Gremlin_CageBreak")
    Print("Firing camera 2")
    FireUser1("ForceSolveGremlin 02")
    Print("waiting .81")
    wait(0.81)
    FireThread(TeleportGremlinIn, "MJM_Caged_Gremlin_CageBreak", "mjm_zonea.Marker(Rotatable)GremlinFixPoint1", false)
    wait(0.3)
    DisableMotion("MJM_Caged_Gremlin_CageBreak")
    wait(0.4)
    EnterCutscene("MJM_Caged_Gremlin_CageBreak", 1)
    Print("waiting .1")
    Wait(4)
    TeleportGremlinOut("MJM_Caged_Gremlin_CageBreak")
    Wait(0.5)
    FireThread(TeleportGremlinIn, "MJM_Caged_Gremlin_CageBreak", "mjm_zonea.Marker(Rotatable)GremlinFixPoint2", false)
    wait(0.3)
    DisableMotion("MJM_Caged_Gremlin_CageBreak")
    wait(0.4)
    EnterCutscene("MJM_Caged_Gremlin_CageBreak", 1)
    GetPrefabData("cameraCraneShot1").shotOrder = "mid"
  else
    SetGlobal("MJM_TVorKipQuestComplete", 0)
  end
  GuardianPrefab_KillGuardians("MJM_Heaps_GuardianSpawner")
  if GetGlobal("MJM_Kip_ThankYou_Played") == 1 then
    wait(2.7)
  end
  FireUser1("cameraCraneShot1")
  AudioPostEventOn(GetPlayer(), "Stop_music_mickeyjunkmountain")
  AudioPostEventOn(GetPlayer(), "Play_sfx_MJM_Heaps_Crane_fix_stinger")
  wait(0.8)
  EnterCutscene("mjm_zonea.PlayingCard 01", 0)
  AudioPostEventOn(GetPlayer(), "Play_sfx_MJM_Heaps_Crane_Levers")
  if GetGlobal("MJM_Kip_ThankYou_Played") == 1 then
    TeleportGremlinOut("MJM_Caged_Gremlin_CageBreak")
    DestroyEntity("MJM_Caged_Gremlin_CageBreak")
  end
  wait(9)
  AnimGBSequence("mjm_zonea.MJ_ZoneA_Steamshovel 01", "Unlock")
  wait(6)
  ExitCutscene("mjm_zonea.PlayingCard 01")
  SetGlobal("MJM_StartedDeckerQuest", 1)
  SetGlobal("MJM_CraneAnimPlayed", 1)
  MJM_GuardianActivationSystem(2)
  Wait(5)
  GuardianPrefab_PopulateGuardians("MJM_Heaps_GuardianSpawner")
end
MJM_CraneForcedByGremlinFreed = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Play_music_mickeyjunkmountain")
  AudioSetState(GetPlayer(), "Music_State", "Auto")
  ShowHud()
  MJM_Heaps_SaveCheckpoint()
end
MJM_Heaps_CraneShowHUD = L0_0
L0_0 = false
MJM_CraneTextEnded = L0_0
function L0_0()
  local L1_2
  L1_2 = true
  MJM_CraneTextEnded = L1_2
end
MJM_CraneTextEnd = L0_0
function L0_0()
  while MJM_CraneTextEnded == false do
    wait(0.2)
  end
  FireUser3("cameraCraneShot3")
end
MJM_CraneCameraEnd = L0_0
function L0_0()
  AnimGBSequence("mjm_zonea.MJ_ZoneA_Cartridge_Slide 01", "Fall")
  AudioPostEventOn(GetPlayer(), "Play_sfx_MJM_Heaps_carts_fall")
end
MJM_SNESAnim = L0_0
function L0_0()
  AnimGBSequence("mjm_zonea.MJ_ZoneA_Gremlin_Bridge 01", "Fall")
end
MJM_BridgeAnim = L0_0
function L0_0()
  TeleportToEntity("mjm_zonea.Gremlin_Base 01", "mjm_zonea.Marker(Parentable) 02")
end
MJM_ZoneAGremlin = L0_0
function L0_0()
  if GetGlobal("MJM_WaterfallRight") == 1 then
    ForceSketched("mjm_zonea.MJ_ZoneA_Toon02 01")
  elseif GetGlobal("MJM_WaterfallRight") == 0 then
    ForcePainted("mjm_zonea.MJ_ZoneA_Toon02 01")
  end
end
MJM_WaterfallRightResolve = L0_0
L0_0 = 0
PhoneFalls = L0_0
function L0_0()
  local L1_3
  L1_3 = 1
  PhoneFalls = L1_3
end
MJM_ZoneA_PhoneFallsHold = L0_0
function L0_0()
  local L1_4
  L1_4 = 0
  PhoneFalls = L1_4
end
MJM_ZoneA_PhoneFallsLetGo = L0_0
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
function L0_0(A0_5, A1_6)
  MJM_LastNumberPressed = A1_6
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
      Print("349 PRESSED -- MAKE STUFF HAPPEN!")
      SetGlobal("MJM_Gus_CodeReminder_Played", 1)
      FireThread(WaitForWaterfall)
    elseif Second == 3 then
      Print("512 PRESSED -- MAKE STUFF HAPPEN!")
      wait(0.1)
      AudioPostEventOn("mjm_zonea_audio.Sound_Marker_phone_toneLP", "Play_sfx_MJM_Phone_WrongNumber")
    elseif Third == 3 then
      Print("033 PRESSED -- MAKE STUFF HAPPEN!")
      wait(0.1)
      AudioPostEventOn("mjm_zonea_audio.Sound_Marker_phone_toneLP", "Play_sfx_MJM_Phone_WrongNumber")
    elseif Fourth == 3 then
      Print("726 PRESSED -- MAKE STUFF HAPPEN!")
      wait(0.1)
      AudioPostEventOn("mjm_zonea_audio.Sound_Marker_phone_toneLP", "Play_sfx_MJM_Phone_WrongNumber")
      SetGlobal("MJM_WhichPhone", 0)
      FireSequence("mjm_zonea_igc.TelephoneConversationMarker", "TT_SevenTwoSix")
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
MJM_LogNumberHeaps = L0_0
function L0_0()
  if GetGlobal("MJM_WaterfallRight") == 1 then
    FireUser1("mjm_zonea.grabcamerafancy 03.FancyCameraLookAt 01")
    AudioPostEventOn("mjm_zonea_audio.Sound_Marker_thinnerfallsplash_R", "Stop_sfx_MJM_Heaps_phone_thnr_stream")
    wait(2)
    AnimGBSequence("mjm_zonea.MJ_ZoneA_ThinnerFall_02 02", "TurnOff")
    StopEmitters("mjm_zonea_fx.MJ_ZoneA_Thinner_Splash_02 01")
    wait(1)
    Hide("mjm_zonea.triggers_thinnerpool 02.TriggerDamageVolume_ThinnerPool")
    SetGlobal("MJM_WaterfallRight", 0)
    Print("Waiting...")
    wait(23)
    while PhoneFalls == 1 do
      wait(0.5)
    end
    Print("Done Waiting...")
    AnimGBSequence("mjm_zonea.MJ_ZoneA_ThinnerFall_02 02", "TurnOn")
    StartEmitters("mjm_zonea_fx.MJ_ZoneA_Thinner_Splash_02 01")
    wait(1)
    Unhide("mjm_zonea.triggers_thinnerpool 02.TriggerDamageVolume_ThinnerPool")
    AudioPostEventOn("mjm_zonea_audio.Sound_Marker_thinnerfallsplash_R", "Resume_sfx_MJM_Heaps_thinner_falls_phone")
    SetGlobal("MJM_WaterfallRight", 1)
    ForceSketched("mjm_zonea.MJ_ZoneA_Toon02 01")
  end
end
WaitForWaterfall = L0_0
L0_0 = 0
tv1 = L0_0
L0_0 = 0
tv2 = L0_0
L0_0 = 0
tv3 = L0_0
function L0_0()
  Print("*********LUA: MJM_ZoneAMachines*******************")
  tv1 = GetGlobal("MJM_TV1Painted")
  tv2 = GetGlobal("MJM_TV2Painted")
  tv3 = GetGlobal("MJM_TV3Painted")
  Print(tv1)
  Print(tv2)
  Print(tv3)
  if GetGlobal("MJM_CraneAnimPlayed") == 0 then
    if tv1 == 1 and tv2 == 1 and tv3 == 1 then
      SetGlobal("MJM_CraneAnimPlayed", 1)
      MJM_CraneForcedByGremlinFreed()
    elseif tv1 == 1 and tv2 == 0 and tv3 == 0 or tv1 == 0 and tv2 == 1 and tv3 == 0 or tv1 == 0 and tv2 == 0 and tv3 == 1 then
      Print("Would play sequence 1")
      if GetGlobal("MJM_StartedDeckerQuest") == 1 then
        ForceSequence("Gus", "MJM_Gus_TVOnePainted")
      else
        FireSequence("Gus", "MJM_Gus_TV_Mystery")
      end
    elseif tv1 == 1 and tv2 == 1 and tv3 == 0 or tv1 == 1 and tv2 == 0 and tv3 == 1 or tv1 == 0 and tv2 == 1 and tv3 == 1 then
      Print("Would play sequence 2")
      if GetGlobal("MJM_StartedDeckerQuest") == 1 then
        ForceSequence("Gus", "MJM_Gus_TVTwoPainted")
      end
    end
  end
end
MJM_ZoneAMachines = L0_0
function L0_0(A0_7, A1_8)
  if GetGlobal("MJM_CraneAnimPlayed") == 0 then
    Print("*********LUA: MJM_PaintTV*******************")
    Print(A1_8)
    if A1_8 == "1" then
      Print("Set TV1 Painted")
      SetGlobal("MJM_TV1Painted", 1)
      Disable("mjm_zonea.PlayerHintMarkers T1")
      SetGlobal("MJM_TVCounter", GetGlobal("MJM_TVCounter") + 1)
    elseif A1_8 == "2" then
      Print("Set TV2 Painted")
      SetGlobal("MJM_TV2Painted", 1)
      Disable("mjm_zonea.PlayerHintMarkers T2")
      SetGlobal("MJM_TVCounter", GetGlobal("MJM_TVCounter") + 1)
    elseif A1_8 == "3" then
      Print("Set TV3 Painted")
      SetGlobal("MJM_TV3Painted", 1)
      Disable("mjm_zonea.PlayerHintMarkers T3")
      SetGlobal("MJM_TVCounter", GetGlobal("MJM_TVCounter") + 1)
    end
    MJM_ZoneAMachines()
  end
end
MJM_PaintTV = L0_0
function L0_0(A0_9, A1_10)
  if GetGlobal("MJM_CraneAnimPlayed") == 0 then
    Print("*********LUA: MJM_PaintTV*******************")
    Print(A1_10)
    if A1_10 == "1" then
      Print("Set TV1 Painted")
      SetGlobal("MJM_TV1Painted", 0)
      Enable("mjm_zonea.PlayerHintMarkers T1")
      SetGlobal("MJM_TVCounter", GetGlobal("MJM_TVCounter") - 1)
    elseif A1_10 == "2" then
      Print("Set TV2 Painted")
      SetGlobal("MJM_TV2Painted", 0)
      Enable("mjm_zonea.PlayerHintMarkers T2")
      SetGlobal("MJM_TVCounter", GetGlobal("MJM_TVCounter") - 1)
    elseif A1_10 == "3" then
      Print("Set TV3 Painted")
      SetGlobal("MJM_TV3Painted", 0)
      Enable("mjm_zonea.PlayerHintMarkers T3")
      SetGlobal("MJM_TVCounter", GetGlobal("MJM_TVCounter") - 1)
    end
  end
end
MJM_TVCounterDown = L0_0
L0_0 = false
GumballPresent = L0_0
function L0_0()
  AnimGBSequence("mjm_zonea.MJ_ZoneA_Gumball_Crank 01", "Turn180")
  wait(0.66)
  AnimGBSequence("mjm_zonea.MJ_ZoneA_Gumball_Crank 01", "Rest")
  if GumballPresent == false then
    MJM_ZoneAGumballz()
  end
end
MJM_ZoneAGumballCrank = L0_0
function L0_0()
  if GetGlobal("MJM_WaterfallLeft") == 1 then
    ForceSketched("mjm_zonea.MJ_ZoneA_Toon05 01")
  elseif GetGlobal("MJM_WaterfallLeft") == 0 then
    ForcePainted("mjm_zonea.MJ_ZoneA_Toon05 01")
  end
end
MJM_WaterfallLeftResolve = L0_0
L0_0 = 0
PhoneFalls2 = L0_0
function L0_0()
  local L1_11
  L1_11 = 1
  PhoneFalls2 = L1_11
end
MJM_ZoneA_PhoneFallsHold2 = L0_0
function L0_0()
  local L1_12
  L1_12 = 0
  PhoneFalls2 = L1_12
end
MJM_ZoneA_PhoneFallsLetGo2 = L0_0
function L0_0()
  FireUser1("mjm_zonea.grabcamerafancy 02.FancyCameraLookAt 01")
  Wait(1)
  AnimGBSequence("mjm_zonea.MJ_ZoneA_Gumball_Animator 01", "Use")
  SetGlobal("MJM_WaterfallLeft", 0)
  AnimGBSequence("mjm_zonea.MJ_ZoneA_ThinnerFall_01 01", "TurnOff")
  StopEmitters("mjm_zonea_fx.MJ_ZoneA_Thinner_Splash_01 01")
  wait(0.56)
  AnimGBSequence("mjm_zonea.MJ_ZoneA_Gumball_Animator 01", "Idle")
  Hide("mjm_zonea.triggers_thinnerpool 03.TriggerDamageVolume_ThinnerPool")
  GumballPresent = true
  wait(17)
  while PhoneFalls2 == 1 do
    wait(0.5)
  end
  GumballPresent = false
  AnimGBSequence("mjm_zonea.MJ_ZoneA_Gumball_Animator 01", "Release")
  AnimGBSequence("mjm_zonea.MJ_ZoneA_ThinnerFall_01 01", "TurnOn")
  StartEmitters("mjm_zonea_fx.MJ_ZoneA_Thinner_Splash_01 01")
  Unhide("mjm_zonea.triggers_thinnerpool 03.TriggerDamageVolume_ThinnerPool")
  ForceSketched("mjm_zonea.MJ_ZoneA_Toon05 01")
  SetGlobal("MJM_WaterfallLeft", 1)
end
MJM_ZoneAGumballz = L0_0
function L0_0()
  Enable("mjm_zonea.Spawner 01")
  wait(0.5)
  Disable("mjm_zonea.Spawner 01")
end
MJM_ZoneAWatch = L0_0
function L0_0()
  Enable("mjm_zonea.Spawner 02")
  wait(0.5)
  Disable("mjm_zonea.Spawner 02")
end
MJM_ZoneAWatch2 = L0_0
function L0_0()
  SetPropertyBool("mjm_zonea.MJ_ZoneA_Toon10 01", "InvulnerableToPaintThinner", true)
  AnimGBSequence("mjm_zonea.MJ_ZoneA_Junk_Blocker_01 01", "Fall")
  Wait(5)
  SetPropertyBool("mjm_zonea.MJ_ZoneA_Toon10 01", "InvulnerableToPaintThinner", false)
end
MJM_ZoneAFallBlock = L0_0
function L0_0()
  AnimGBSequence("mjm_zonea.MJ_ZoneA_Drumhead 01", "bounce")
  wait(0.56)
  AnimGBSequence("mjm_zonea.MJ_ZoneA_Drumhead 01", "rest")
end
MJM_ZoneADrum = L0_0
function L0_0()
  AnimGBSequence("mjm_zonea.MJ_ZoneA_Ruler 01", "Tilt")
  Enable("mjm_zonea.Demo_GV_GremlinCageBreakableC1_Inert 01")
  Enable("mjm_zonea.Demo_GV_GremlinCageBreakableC2_Inert 01")
end
MJM_ZoneARuler = L0_0
function L0_0()
  ForceSequence("Gus", "MJM_Gus_PhoneNumbersNoPhone")
end
MJM_Phonebark = L0_0
function L0_0()
  ForceSequence("Gus", "MJM_Gus_PhoneProximity")
end
MJM_PhoneProximity = L0_0
function L0_0()
  local L0_13, L1_14
end
MJM_ZoneA_DeckerCam = L0_0
function L0_0()
  AnimVarInt("MJM_Caged_Gremlin_CageBreak", VAR_Mood_Type, 1)
end
MJM_MakeGremlinHappy = L0_0
function L0_0(A0_15)
  SetGlobal("MJM_HeapsGuardianProgress", A0_15)
  if A0_15 == 0 then
    Print("0. player has just zoned in, NEUTRAL = Crane (talk to the card)")
    Enable("mjm_zonea.PlayerHintMarkers C")
  elseif A0_15 == 1 then
    Print("1. Card has been talked to, PAINT = TVs, THINNER = Gremlin path.")
    Disable("mjm_zonea.PlayerHintMarkers C")
    Enable("mjm_zonea.PlayerHintMarkers T1")
    Enable("mjm_zonea.PlayerHintMarkers T2")
    Enable("mjm_zonea.PlayerHintMarkers T3")
    Enable("mjm_zonea.PlayerHintMarkers G1")
    Enable("mjm_zonea.PlayerHintMarkers G2")
  elseif A0_15 == 2 then
    Print("2. Tv's have been painted in, or gremlin has been rescued, all guardians disabled.")
    Disable("mjm_zonea.PlayerHintMarkers T1")
    Disable("mjm_zonea.PlayerHintMarkers T2")
    Disable("mjm_zonea.PlayerHintMarkers T3")
    Disable("mjm_zonea.PlayerHintMarkers G1")
    Disable("mjm_zonea.PlayerHintMarkers G2")
  end
end
MJM_GuardianActivationSystem = L0_0
