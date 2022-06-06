local L0_0, L1_1
L0_0 = 0
blotattacking = L0_0
L0_0 = 0
DBC_ZoneK_CurrentSide = L0_0
L0_0 = 0
DBC_ZoneK_MeleeSpawned = L0_0
L0_0 = 0
DBC_ZoneK_RangedSpawned = L0_0
L0_0 = 0
DBC_ZoneK_RoofAttackEnabled = L0_0
L0_0 = 0
DBC_ZoneK_Gargoyleheads = L0_0
L0_0 = 0
DBC_ZoneK_GargoyleInitial = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
end
DBC_ZoneK_CameraRelease = L0_0
function L0_0()
  Enable("dbc_zonek_audio.Trigger_Portal_Top")
  StartTrackingCurrentLevelForScoring("DBC_V2_SorrowTower")
  DestroyEntity("dbc_zonek_dynamic.RoofCheckpointTrigger 01")
  if GetGlobal("DBC_ZoneK_GemLit") == 0 then
    SetStayInCombatIdle(GetPlayer(), true)
    RestrictCutSceneInput()
    Enable("dbc_zonek_dynamic.PlayerKillTrigger 01")
    Enable("dbc_zonek_static.TowerTopCameraTrigger 01")
    MoveToEntity(GetPlayer(), "dbc_zonek_dynamic.TopCutsceneMickeyMarker 01")
    AnimEvent("StormBlot 01", "EVENT_Special_9")
    AnimGBSequence("dbc_zonek.DBC_ZoneK_GargoyleDoor01 01", "Rest")
    AnimGBSequence("dbc_zonek_dynamic.DBC_SlidingUpperFloorSorrow_Inert 01", "Closed")
    AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneK_Tower_Autodoor")
    MoveToEntity("StormBlot 01", "dbc_zonek_dynamic.StormBlotMarker 03")
    FireUser1("DBC_ZoneD_StartRoofAttackCamera")
    FireThread(DBC_ZoneK_TopCheckpointReload2)
  else
    StartEmitters("dbc_zonek.DBC_ZoneK_CrystalPurge 01")
    Enable("dbc_zonek_dynamic.PlayerKillTrigger 01")
    ForEachEntityInGroup(SetRotatorMaxSpeed, "dbc_zonek.DBC_GargoyleBases", 1000)
    ForEachEntityInGroup(StartRotateToPosition, "dbc_zonek.DBC_GargoyleBases", 180)
    ForEachEntityInGroup(ForcePainted, "dbc_zonek.DBC_GargoyleHeads")
    AnimGBSequence("dbc_zonek_dynamic.DBC_SlidingUpperFloorSorrow_Inert 01", "Closed")
    AnimGBSequence("dbc_zonek.DBC_ZoneK_GargoyleDoor01 01", "OpenRest")
    AnimGBSequence("dbc_zonek.DBC_ZoneK_Fireworks01 01", "End")
    ForEachEntityInGroup(Hide, "ColumnCheck")
    ForEachEntityInGroup(Hide, ".FloorPiece")
    DestroyEntity("dbc_zonek.DBC_ZoneK_Toon 01")
    ForEachEntityInGroup(DestroyEntity, "MainInertChunk")
    FireThread(DBC_ZoneK_TopCheckpointReload3)
  end
end
DBC_ZoneK_TopCheckpointReload = L0_0
function L0_0()
  wait(0.1)
  ForEachEntityInGroup(AnimGBSequence, "dbc_zonek.gargoyleEyeBeams", "on")
  ForEachEntityInGroup(Unhide, "dbc_zonek.DBC_ProjectedLightbeams")
end
DBC_ZoneK_TopCheckpointReload3 = L0_0
function L0_0()
  wait(0.1)
  ShakeCamera_Default("camera")
  Unhide("StormBlot 01")
  Wait(8)
  Enable("dbc_zonek_igc.TriggerRotate_blotCameraRelease")
  DBC_ZoneK_CurrentSide = 0
  wait(2)
  FireThread(DBC_ZoneK_StormBlotAttack)
  DestroyEntity("dbc_zonek.DBC_ZoneK_Toon 01")
  ForEachEntityInGroup(DestroyEntity, "MainInertChunk")
  TimerEnable("dbc_zonek_dynamic.BlotAttackLogicTimerMarker 01")
end
DBC_ZoneK_TopCheckpointReload2 = L0_0
function L0_0()
  FreezeCamera()
end
DBC_ZoneK_PalyerFallingDeathFreezeCamera = L0_0
function L0_0()
  GrabCamera("dbc_zonek_igc.grabcamerafancy_blotIntro.FancyCameraEnd 01", nil, CAMERA_INSTANT_TRANSITION, 0)
  ShowHud()
  if GetGlobal("DBC_ZoneK_RoofSave") == 0 then
    SaveCheckpoint(nil, "DBC_ZoneK_TopCheckpointReload", "dbc_zonek_dynamic.TopCutsceneMickeyMarker 01")
    SetGlobal("DBC_ZoneK_RoofSave", 1)
  end
end
DBC_ZoneK_StormBlotExitCamera = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneK_GemLit") == 0 then
    SetCameraAttributes("dbc_zonek_static.TowerTopCameraOverride 01")
    Enable("dbc_zonek_static.TowerTopCameraTrigger 01")
  else
    ReleaseCamera(CAMERA_EASING_TRANSITION, 1)
  end
end
DBC_ZoneK_StormBlotExitCameraRelease = L0_0
function L0_0(A0_2)
  EnableMotion(A0_2)
  ShakeCamera(2.5, 7.5, 0, 2, 0.05, 0.025)
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneK_Camera_Rumble")
  Rumble(nil, 1.5)
end
DBC_ZoneK_StairDrop = L0_0
function L0_0(A0_3, A1_4, A2_5, A3_6)
  AnimGBSequence(A2_5, "toggle", true)
  Hide(A3_6)
  AudioPostEventOn(A0_3, "Play_sfx_dbc_birdhead_painted")
  DBC_ZoneK_Gargoyleheads = DBC_ZoneK_Gargoyleheads + 1
  if GetGlobal("DBC_ZoneK_GemLit") == 0 then
    DBC_ZoneK_ExitDoorOpen()
  end
end
DBC_ZoneK_GargPainted = L0_0
function L0_0(A0_7, A1_8, A2_9, A3_10, A4_11)
  AnimGBSequence(A4_11, "off")
  StartEmitters(A3_10)
  Unhide(A3_10)
  Hide(A2_9)
  Hide("dbc_zonek.DBC_ProjectedLightbeam 05")
  DBC_ZoneK_Gargoyleheads = DBC_ZoneK_Gargoyleheads - 1
end
DBC_ZoneK_GargThinned = L0_0
L0_0 = 0
ZoneK_Gargoyle1_Angle = L0_0
L0_0 = 0
ZoneK_Gargoyle2_Angle = L0_0
L0_0 = 0
ZoneK_Gargoyle3_Angle = L0_0
L0_0 = 0
ZoneK_Gargoyle4_Angle = L0_0
function L0_0(A0_12, A1_13, A2_14, A3_15)
  if _G[A1_13] == 0 then
    AudioPostEventOn(A0_12, "Play_sfx_dbc_gargoyle_rotate_start")
    Print("rotating start")
    Reverse(A0_12)
    StartEmitters(A3_15)
    Print("What is gear: " .. A2_14)
    Reverse(A2_14)
    SetRotatorMaxSpeed(A0_12, 360)
    SetRotatorMaxSpeed(A2_14, 420)
    wait(0.125)
    if _G[A1_13] == 0 then
      Reverse(A0_12)
      Print("reversing gear: " .. A2_14)
      Reverse(A2_14)
      SetRotatorMaxSpeed(A0_12, 10)
      SetRotatorMaxSpeed(A2_14, 35)
    else
      SetRotatorMaxSpeed(A0_12, 0)
      SetRotatorMaxSpeed(A2_14, 0)
      AudioPostEventOn(A0_12, "Play_sfx_dbc_gargoyle_rotate_end")
      Print("rotating end")
    end
  else
    AudioPostEventOn(A0_12, "Play_sfx_dbc_gargoyle_rotate_locked")
    Print("Not able to turn")
  end
end
DBC_ZoneK_GargoyleSpin = L0_0
function L0_0(A0_16, A1_17, A2_18, A3_19)
  if DBC_ZoneK_GargoyleInitial == 0 then
    if GetPropertyFloat(A0_16, "Max Speed") == 360 then
      StopEmitters(A3_19)
      SetRotatorMaxSpeed(A0_16, 0)
      SetRotatorMaxSpeed(A2_18, 0)
      DisableGlint(A2_18)
      AudioPostEventOn(A0_16, "Play_sfx_dbc_gargoyle_rotate_end")
      Print("rotating final position end")
      _G[A1_17] = 1
      if GetGlobal("DBC_ZoneK_GemLit") == 0 then
        if ZoneK_Gargoyle1_Angle + ZoneK_Gargoyle2_Angle + ZoneK_Gargoyle3_Angle + ZoneK_Gargoyle4_Angle < 4 then
          DBC_ZoneK_StormBlotAttack()
        end
        DBC_ZoneK_ExitDoorOpen()
      end
    else
      StopEmitters(A3_19)
      AudioPostEventOn(A0_16, "Play_sfx_dbc_gargoyle_rotate_stop")
      Print("Back at start")
      SetRotatorMaxSpeed(A2_18, 0)
    end
  else
    SetRotatorMaxSpeed(A2_18, 0)
  end
end
DBC_ZoneK_GargoyleEnd = L0_0
function L0_0()
  if ZoneK_Gargoyle1_Angle + ZoneK_Gargoyle2_Angle + ZoneK_Gargoyle3_Angle + ZoneK_Gargoyle4_Angle == 4 and DBC_ZoneK_Gargoyleheads == 4 then
    Unhide("dbc_zonek.DBC_ProjectedLightbeam 05")
    if GetGlobal("DBC_ZoneK_GemLit") == 0 then
      SetGlobal("DBC_ZoneK_GemLit", 1)
      TimerDisable("dbc_zonek_dynamic.BlotAttackLogicTimerMarker 01")
      DestroyEntity("EnemySpawner 01")
      DestroyEntity("EnemySpawner 02")
      FireUser1("DBC_ZoneK_TowerOutro0")
      AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_SorrowTower_GemIGC_Cut1")
      Wait(1.5)
      ShakeCamera(5, 5, 0, 0.01, 0.005, 0.005)
      StartEmitters("dbc_zonek.DBC_ZoneK_CrystalPurge 01")
      StartEmitters("dbc_zonek.DBC_ZoneK_CrystalBeam 01")
      AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneK_Crystal_Activate")
      Wait(1.5)
      ShakeCamera(3, 5, 0.6, 2, 0.035, 0.035)
      ForEachEntityInGroup(Kill, "dbc_zonek_dynamic.StormBlot")
      Wait(1.5)
      AnimEvent("StormBlot 01", EVENT_Special_4)
      wait(4.665)
      Hide("StormBlot 01")
      Wait(0.335)
      StopEmitters("dbc_zonek.DBC_ZoneK_CrystalBeam 01")
      AnimGBSequence("dbc_zonek.DBC_ZoneK_Fireworks01 01", "Activate")
      wait(12)
      AnimGBSequence("dbc_zonek.DBC_ZoneK_GargoyleDoor01 01", "Open")
      AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_zoneK_TowerDoor_Open")
      SetStayInCombatIdle(GetPlayer(), false)
    end
  end
end
DBC_ZoneK_ExitDoorOpen = L0_0
function L0_0()
  Disable("dbc_zonek_static.TowerTopCameraTrigger 01")
end
DBC_ZoneK_ExitDoorOpenCheckpoint = L0_0
function L0_0()
  Unhide("dbc_zonek_dynamic.DBC_SlidingUpperFloorSorrow_Inert 01")
end
DBC_ZoneK_TopShut = L0_0
function L0_0()
  Enable("dbc_zonek_audio.Trigger_Portal_Start")
  HideHud()
  SetGlobal("MS_MeanStreetProgress", 6)
  TimerDisable("WorldShakeLogicTimerMarker")
  EndTrackingCurrentLevelForScoring("DBC_V2_Utilidor4")
  StartTrackingCurrentLevelForScoring("DBC_V2_SorrowTower")
  FireUser1("DBC_ZoneD_IntroFancyCamera")
  MoveToEntity("StormBlot 01", "dbc_zonek_dynamic.StormBlotMarker 01")
  wait(1)
  SetDefaultCameraValues(6.25, 18, -10)
  ShakeCamera(8, 12, 0.1, 4, 0.035, 0.035)
  Rumble(nil, 2)
  FireSequence("dbc_zonek_dynamic.Marker(Conversation) 01", "DBC_2nd_ZoneK_BlotAttack01")
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneK_Camera_Rumble")
  AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_ZoneK_FloorFall_Intro")
  Unhide("StormBlot 01")
  AnimEvent("StormBlot 01", EVENT_Special_5)
  FireThread(Prefab_FallingFloor, "IntroFloorPiece")
  wait(1)
  Hide("StormBlot 01")
  StreamZones(nil, "stream_sorrowtower")
  Unhide("dbc_zonek_dynamic.DBC_ZoneK_ShamWall 01")
  SetGlobal("DBC_ZoneOtoKDoor", 1)
  SetMap(nil, "MAP_DBC_ZONEK", "GAME")
  wait(2)
  ActivateScene("environments/thepark/darkbeautycastle/gsa/dbc_zonek.gsa")
  SaveCheckpoint(nil, "DBC_ZoneK_StartCheckpointReload", "dbc_zonek_dynamic.StartPositionMarker 01")
end
DBC_ZoneK_IntroFall = L0_0
function L0_0()
  SetCameraAttributes("dbc_zonek_dynamic.SplineCameraMarker(CameraOverride) 01")
  wait(0)
  SaveCurrentCameraOverride()
  wait(0)
  LoadSavedCameraOverride()
  ShowHud()
end
DBC_ZoneK_IntroCameraReturn = L0_0
function L0_0()
  Enable("dbc_zonek_audio.Trigger_Portal_Start")
  StartTrackingCurrentLevelForScoring("DBC_V2_SorrowTower")
  DestroyEntity("IntroFloorPiece")
  DestroyEntity("dbc_zonek_dynamic.IntroPlaneTrigger 01")
  Unhide("dbc_zonek_dynamic.DBC_ZoneK_ShamWall 01")
  FireThread(DBC_ZoneK_StartCheckpointReloadThread)
end
DBC_ZoneK_StartCheckpointReload = L0_0
function L0_0()
  wait(0.1)
  SetCameraAttributes("dbc_zonek_dynamic.SplineCameraMarker(CameraOverride) 01")
  SaveCurrentCameraOverride()
  LoadSavedCameraOverride()
end
DBC_ZoneK_StartCheckpointReloadThread = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneOtoKDoor") == 0 then
    Hide("dbc_zonek_dynamic.DBC_ZoneK_ShamWall 01")
  elseif GetGlobal("DBC_ZoneOtoKDoor") == 1 then
    Unhide("dbc_zonek_dynamic.DBC_ZoneK_ShamWall 01")
  end
end
DBC_ZoneOtoKDoorFunction = L0_0
function L0_0()
  EnableMotion("dbc_zonek.DBC_ZoneK_InertWallChunk08 01")
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneK_Camera_Rumble")
end
DBC_ZoneK_IntroFall02 = L0_0
function L0_0()
  StreamInterior(nil, "stream_sorrowtower_topinterior")
  FireUser1("DBC_ZoneD_TowerTopCamera")
  AudioPostEventOn(GetPlayer(), "Stop_music_darkbeautycastle")
  wait(0.8)
  SetStayInCombatIdle(GetPlayer(), true)
  MoveToEntity(GetPlayer(), "dbc_zonek_dynamic.TopCutsceneMickeyMarker 01")
  FireSequence("dbc_zonek_dynamic.Marker(Conversation) 01", "DBC_2nd_ZoneK_Safe1")
  wait(2)
  ForEachEntityInGroup(SetRotatorMaxSpeed, "dbc_zonek.DBC_GargoyleBases", 30)
  ForEachEntityInGroup(Reverse, "dbc_zonek.DBC_GargoyleBases")
  ForEachEntityInGroup(SetRotatorMaxSpeed, "GargoyleGears_Inert", 60)
  AnimGBSequence("dbc_zonek_dynamic.DBC_SlidingUpperFloorSorrow_Inert 01", "Move")
  AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_Sorrow_RoofIntro_Cam1")
  wait(6)
  ForEachEntityInGroup(SetRotatorMaxSpeed, "GargoyleGears_Inert", 0)
  wait(0.1)
  DBC_ZoneK_GargoyleInitial = 0
end
DBC_ZoneK_TowerTopIntro = L0_0
function L0_0()
  DBC_ZoneK_GargoyleInitial = 1
  ForEachEntityInGroup(SetRotatorMaxSpeed, "dbc_zonek.DBC_GargoyleBases", 1000)
  ForEachEntityInGroup(Reverse, "dbc_zonek.DBC_GargoyleBases")
end
DBC_ZoneK_SetupGargoyles = L0_0
function L0_0()
  Enable("dbc_zonek_dynamic.PlayerKillTrigger 01")
  FireUser1("DBC_ZoneD_StartRoofAttackCamera")
  AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_Sorrow_RoofIntro_Cam2")
  wait(1)
  AnimEvent("StormBlot 01", "EVENT_Special_9")
  Wait(0.5)
  Enable("dbc_zonek_igc.TriggerRotate_blotCameraRelease")
  Unhide("StormBlot 01")
  MoveToEntity("StormBlot 01", "dbc_zonek_dynamic.StormBlotMarker 03")
  ShakeCamera_Default("camera")
  Wait(7)
  EnterCutscene(GetPlayer(), 22)
  wait(2)
  ExitCutscene(GetPlayer())
  AnimEvent(GetPlayer(), EVENT_Finished_Sequence)
  Wait(1)
  AudioPostEventOn(GetPlayer(), "Play_music_darkbeautycastle")
  SetCombatIntensityBias(100)
  DBC_ZoneK_CurrentSide = 0
  FireThread(DBC_ZoneK_StormBlotAttack)
  DestroyEntity("dbc_zonek.DBC_ZoneK_Toon 01")
  ForEachEntityInGroup(DestroyEntity, "MainInertChunk")
  TimerEnable("dbc_zonek_dynamic.BlotAttackLogicTimerMarker 01")
end
DBC_ZoneK_StartRoofAttack = L0_0
function L0_0()
  FireUser1("SlimeSpawnerStart")
  StormBlot_HandEmmitters()
end
DBC_ZoneK_StormBlotAttack2 = L0_0
function L0_0(A0_20, A1_21)
  DBC_ZoneK_CurrentSide = tonumber(A1_21)
end
DBC_ZoneK_SetSide = L0_0
L0_0 = 0
lastdata = L0_0
function L0_0()
  local L0_22
  L0_22 = blotattacking
  if L0_22 == 0 then
    L0_22 = DBC_ZoneK_CurrentSide
    blotattacking = 1
    AnimEvent("StormBlot 01", EVENT_Special_3)
    Enable("dbc_zonek_dynamic.RoarCenterTrigger 01")
    StormBlot_SpitEmmitters()
    Rumble(nil, 1)
    ShakeCamera(4, 7.5, 0.75, 0.75, 0.025, 0.025)
    AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneK_Camera_Rumble")
    wait(1)
    Disable("dbc_zonek_dynamic.RoarCenterTrigger 01")
    StormBlot_SpitEmmittersStop()
    AnimEvent("StormBlot 01", "EVENT_Special_" .. L0_22)
    wait(0.5)
    ShakeCamera(6, 10, 0, 20, 0.025, 0.025)
    AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneK_Camera_Rumble")
    wait(2.7)
    ForEachEntityInGroup(AnimGBSequence, "ColumnBreak" .. L0_22, "Break")
    wait(0.3)
    FireUser1("SlimeSpawnerStart" .. L0_22)
    StormBlot_HandEmmitters()
    wait(1)
    DBC_ZoneK_RangedSpawned = DBC_ZoneK_RangedSpawned + 1
    blotattacking = 0
  end
end
DBC_ZoneK_StormBlotAttack = L0_0
function L0_0(A0_23)
  local L1_24
  L1_24 = blotattacking
  if L1_24 == 0 then
    L1_24 = DBC_ZoneK_CurrentSide
    blotattacking = 1
    AnimEvent("StormBlot 01", EVENT_Special_3)
    Enable("dbc_zonek_dynamic.RoarCenterTrigger 01")
    StormBlot_SpitEmmitters()
    Rumble(nil, 1)
    ShakeCamera(4, 7.5, 0.75, 0.75, 0.025, 0.025)
    AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneK_Camera_Rumble")
    wait(1)
    Disable("dbc_zonek_dynamic.RoarCenterTrigger 01")
    StormBlot_SpitEmmittersStop()
    AnimEvent("StormBlot 01", "EVENT_Special_" .. L1_24)
    wait(0.5)
    ShakeCamera(6, 10, 0, 20, 0.025, 0.025)
    AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneK_Camera_Rumble")
    wait(2.7)
    ForEachEntityInGroup(AnimGBSequence, "ColumnBreak" .. L1_24, "Break")
    wait(0.3)
    FireUser1("SlimeSpawnerStart" .. L1_24)
    StormBlot_HandEmmitters()
    wait(1)
    if DBC_ZoneK_RangedSpawned == 0 then
      DBC_ZoneK_RangedSpawned = 1
    end
    blotattacking = 0
  end
end
DBC_ZoneK_StormBlotTimeAttack = L0_0
function L0_0(A0_25, A1_26)
  local L3_27
  L3_27 = _G
  L3_27[A1_26] = _G[A1_26] - 1
end
DBC_ZoneK_KillEnemy = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneK_Camera_Rumble")
  MoveToEntity("StormBlot 01", "dbc_zonek_dynamic.StormBlotMarker 02")
  FireUser1("DBC_ZoneK_HalfwayCamera")
  AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_Sorrow_TowerFalls_1")
  Wait(2)
  ShakeCamera(5, 5, 0, 0.01, 0.005, 0.005)
  Wait(2)
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneK_Camera_Rumble")
  wait(0.4)
  Unhide("StormBlot 01")
  AnimEvent("StormBlot 01", EVENT_Special_6)
  FireThread(Prefab_FallingFloor, "MidCutsceneFloorpiece")
  wait(2.66)
  Hide("StormBlot 01")
end
DBC_ZoneK_LowerHalfCollapse = L0_0
function L0_0()
  SetCameraAttributes("dbc_zonek_dynamic.SplineCameraMarker(CameraOverride) 02")
  SaveCheckpoint(nil, "DBC_ZoneK_MidLevelCheckpoint", "dbc_zonek_static.MidLevelMarker 01")
end
DBC_ZoneK_LowerHalfCollapseCamera = L0_0
function L0_0()
  Enable("dbc_zonek_audio.Trigger_Portal_Mid")
  StartTrackingCurrentLevelForScoring("DBC_V2_SorrowTower")
  DestroyEntity("dbc_zonek_dynamic.ChandelierTrigger 01")
  DestroyEntity("IntroFloorPiece")
  DestroyEntity("dbc_zonek_dynamic.IntroPlaneTrigger 01")
  DestroyEntity("MidCutsceneFloorpiece")
  ForEachEntityInGroup(DestroyEntity, "MidLevelFloorPiece")
  Unhide("dbc_zonek_dynamic.DBC_ZoneK_ShamWall 01")
  FireThread(DBC_ZoneK_MidLevelCheckpointThread)
end
DBC_ZoneK_MidLevelCheckpoint = L0_0
function L0_0()
  wait(0.1)
  SetCameraAttributes("dbc_zonek_dynamic.SplineCameraMarker(CameraOverride) 02")
  SaveCurrentCameraOverride()
  LoadSavedCameraOverride()
end
DBC_ZoneK_MidLevelCheckpointThread = L0_0
function L0_0()
  EnableMotion("dbc_zonek.DBC_ZoneK_InertWallChunk03 01")
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneK_Camera_Rumble")
end
DBC_ZoneK_EntrancePiece = L0_0
function L0_0(A0_28)
  SetExternalVelocity(A0_28, vector4(0, 0, 5), 0.9)
end
DBC_ZoneK_CenterBlow = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_ZoneK_TopCheckpointReload", "dbc_zonek_dynamic.TopCutsceneMickeyMarker 01")
end
DBC_ZoneK_ConceptArtSave = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_SorrowTower_GemIGC_Cut2")
  AudioPostEventOn(GetPlayer(), "Stop_music_darkbeautycastle")
end
DBC_ZoneK_PlaySoundsForEndCameraOne = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_SorrowTower_GemIGC_Cut3")
  wait(5)
  SetCombatIntensityBias(0)
  wait(1.5)
  AudioPostEventOn(GetPlayer(), "Play_music_darkbeautycastle")
end
DBC_ZoneK_PlaySoundsForEndCameraTwo = L0_0
