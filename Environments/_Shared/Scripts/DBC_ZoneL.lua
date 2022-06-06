local L0_0, L1_1
L0_0 = 0
blotattackingT2 = L0_0
L0_0 = 0
DBC_ZoneL_CurrentSide = L0_0
L0_0 = 0
DBC_ZoneL_MeleeSpawned = L0_0
L0_0 = 0
DBC_ZoneL_BlobSpawned = L0_0
L0_0 = 0
DBC_ZoneL_IntroCutscene = L0_0
L0_0 = 0
ZoneL_Gargoyle1_Angle = L0_0
L0_0 = 0
ZoneL_Gargoyle2_Angle = L0_0
L0_0 = 0
ZoneL_Gargoyle3_Angle = L0_0
L0_0 = 0
ZoneL_Gargoyle4_Angle = L0_0
L0_0 = 0
ZoneL_Gargoyle_Heads = L0_0
L0_0 = 0
ZoneL_HideBlotCheck = L0_0
function L0_0()
  DestroyEntity("dbc_zonel_static.RoofAttackPlaneTrigger 01")
  EndTrackingCurrentLevelForScoring("DBC_V2_SorrowTower")
  StartTrackingCurrentLevelForScoring("DBC_V2_GriefTower")
  if GetGlobal("DBC_ZoneL_GemLit") == 0 then
    SetStayInCombatIdle(GetPlayer(), true)
    StormBlot_HandEmmitters()
    ForEachEntityInGroup(Enable, "HandDamage")
    ClearParent("dbc_zonel_dynamic.blottowerspawners 01.StormBlot 01")
    Enable("dbc_zonel.PlayerDeathPlaneTrigger 01")
    Enable("dbc_zonel_static.StormBlotCameraTrigger 01")
    Enable("dbc_zonel_static.TowerTopCameraPlaneTrigger 01")
    AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneL_Tower_Autodoor")
    AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneL_EnterRoof")
    GetPrefabData("TopEntryCamera").fadeInTime = 0
    GetPrefabData("TopEntryCamera").shotOrder = "last"
    FireUser1("TopEntryCamera")
    ForEachEntityInGroup(Enable, "HandDamage")
    ForEachEntityInGroup(DestroyEntity, "FallingFloorPieces")
    FireThread(DBC_ZoneL_TopLoadCheckpointThread)
  else
    Enable("dbc_zonel.PlayerDeathPlaneTrigger 01")
    ForEachEntityInGroup(SetRotatorMaxSpeed, "dbc_zonel.DBC_GargoyleBases", 1000)
    ForEachEntityInGroup(StartRotateToPosition, "dbc_zonel.DBC_GargoyleBases", 180)
    ForEachEntityInGroup(ForcePainted, "dbc_zonel.DBC_GargoyleHeads")
    ForEachEntityInGroup(DestroyEntity, "FallingFloorPieces")
    AnimGBSequence("dbc_zonel.DBC_ZoneL_GargoyleDoor01 01", "OpenRest")
    AnimGBSequence("dbc_zonel.DBC_ZoneL_Fireworks01 01", "End")
    StartEmitters("dbc_zonel.DBC_ZoneL_Crystal_PurgeFX 01")
    FireThread(DBC_ZoneL_TopLoadCheckpointThread2)
  end
end
DBC_ZoneL_TopLoadCheckpoint = L0_0
function L0_0()
  wait(0.1)
  MoveToEntity("StormBlot 01", "dbc_zonel_dynamic.StormBlotPosition 01")
  AnimEvent("StormBlot 01", EVENT_Special_3)
  StormBlot_SpitEmmitters()
  Rumble(nil, 1)
  ShakeCamera(4, 7.5, 0.75, 0.75, 0.025, 0.025)
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneL_Camera_Rumble")
  Unhide("dbc_zonel_dynamic.DBC_ZoneL_RoofDoor 01")
  wait(4)
  SetCameraAttributes("dbc_zonel_static.StormBlotCameraOverride 02")
  wait(1.5)
  ShowHud()
end
DBC_ZoneL_TopLoadCheckpointThread = L0_0
function L0_0()
  wait(0.1)
  Hide("StormBlot 01")
  ForEachEntityInGroup(Unhide, "dbc_zonel.DBC_ProjectedLightbeams")
  Unhide("dbc_zonel_dynamic.DBC_ZoneL_RoofDoor 01")
end
DBC_ZoneL_TopLoadCheckpointThread2 = L0_0
function L0_0()
  DBC_ZoneL_NoIntro = true
  StormBlot_HandEmmitters()
  EndTrackingCurrentLevelForScoring("DBC_V2_SorrowTower")
  StartTrackingCurrentLevelForScoring("DBC_V2_GriefTower")
  SetCameraAttributes(GetRelativePrefabEntity("dbczonelStartMarker", ".CameraSettings"))
  Hide("dbc_zonel_dynamic.blottowerspawners 01.StormBlot 01")
end
DBC_ZoneL_LoadCheckpoint = L0_0
L0_0 = false
DBC_ZoneL_NoIntro = L0_0
function L0_0()
  if DBC_ZoneL_NoIntro == false then
    GetPrefabData("dbczonelStartMarker").MapLoad_SetupPosition = "True"
    OnMapLoad_ProjectorSetup("dbczonelStartMarker")
  end
end
DBC_ZoneL_Intro_Launcher = L0_0
function L0_0()
  SetGlobal("MS_MeanStreetProgress", 6)
  DBC_ZoneL_IntroCutscene = 0
  StormBlot_HandEmmitters()
  EndTrackingCurrentLevelForScoring("DBC_V2_SorrowTower")
  StartTrackingCurrentLevelForScoring("DBC_V2_GriefTower")
  Hide("StormBlot 01")
  FireUser1("IntroCameraSequence")
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneL_Intro")
  SetMap(nil, "MAP_DBC_ZONEL", "GAME")
  wait(13)
  SaveCheckpoint(nil, "DBC_ZoneL_LoadCheckpoint", "dbc_zonel_dynamic.StartPositionMarker 01")
end
DBC_ZoneL_IntroSequence = L0_0
function L0_0()
  Hide("StormBlot 01")
  GrabCamera("cameraIntro", nil, CAMERA_INSTANT_TRANSITION, 0)
  ShowHud()
end
DBC_ZoneL_IntroSequence_Camera = L0_0
function L0_0()
  Enable("dbc_zonel_static.StormBlotCameraTrigger 01")
  Enable("dbc_zonel_static.TowerTopCameraPlaneTrigger 01")
  wait(0.7)
end
DBC_ZoneL_IntroSequence_CameraRelease = L0_0
function L0_0(A0_2, A1_3, A2_4, A3_5, A4_6)
  wait(0.75)
  AnimGBSequence(A2_4, "toggle", true)
  Hide(A4_6)
  AudioPostEventOn(A2_4, "Play_sfx_dbc_birdhead_painted")
  AudioPostEventOn(A2_4, "Play_sfx_dbc_laser_lp0" .. A3_5)
  AudioPostEventOn("dbc_zonel.DBC_ZoneL_Crystal 01", "Play_sfx_dbc_laser_sizzle_lp")
  ZoneL_Gargoyle_Heads = ZoneL_Gargoyle_Heads + 1
  if GetGlobal("DBC_ZoneL_GemLit") == 0 then
    DBC_ZoneL_ExitDoorOpen()
  end
end
DBC_ZoneL_GargPainted = L0_0
function L0_0(A0_7, A1_8, A2_9, A3_10, A4_11, A5_12)
  AnimGBSequence(A5_12, "off")
  StartEmitters(A4_11)
  Unhide(A4_11)
  Hide(A2_9)
  AudioPostEventOn(A2_9, "Stop_sfx_dbc_laser_lp0" .. A3_10)
  AudioPostEventOn("dbc_zonel.DBC_ZoneL_Crystal 01", "Stop_sfx_dbc_laser_sizzle_lp")
  ZoneL_Gargoyle_Heads = ZoneL_Gargoyle_Heads - 1
  Hide("dbc_zonel.DBC_ProjectedLightbeam 05")
end
DBC_ZoneL_GargThinned = L0_0
function L0_0(A0_13, A1_14, A2_15, A3_16)
  if _G[A1_14] == 0 then
    AudioPostEventOn(A0_13, "Play_sfx_dbc_gargoyle_rotate_start")
    Print("rotating start")
    Reverse(A0_13)
    Reverse(A2_15)
    SetRotatorMaxSpeed(A0_13, 360)
    SetRotatorMaxSpeed(A2_15, 420)
    StartEmitters(A3_16)
    wait(0.125)
    if _G[A1_14] == 0 then
      Reverse(A0_13)
      Reverse(A2_15)
      SetRotatorMaxSpeed(A0_13, 10)
      SetRotatorMaxSpeed(A2_15, 35)
    else
      SetRotatorMaxSpeed(A0_13, 0)
      SetRotatorMaxSpeed(A2_15, 0)
      AudioPostEventOn(A0_13, "Play_sfx_dbc_gargoyle_rotate_end")
      Print("rotating end")
    end
  else
    AudioPostEventOn(A0_13, "Play_sfx_dbc_gargoyle_rotate_locked")
    Print("Not able to turn")
  end
end
DBC_ZoneL_GargoyleSpin = L0_0
function L0_0(A0_17, A1_18, A2_19, A3_20)
  if GetPropertyFloat(A0_17, "Max Speed") == 360 then
    SetRotatorMaxSpeed(A0_17, 0)
    SetRotatorMaxSpeed(A2_19, 0)
    DisableGlint(A2_19)
    AudioPostEventOn(A0_17, "Play_sfx_dbc_gargoyle_rotate_end")
    Print("rotating final position end")
    _G[A1_18] = 1
    if GetGlobal("DBC_ZoneL_GemLit") == 0 then
      if ZoneL_Gargoyle1_Angle + ZoneL_Gargoyle2_Angle + ZoneL_Gargoyle3_Angle + ZoneL_Gargoyle4_Angle < 4 then
        DBC_ZoneL_StormBlotAttack()
      end
      DBC_ZoneL_ExitDoorOpen()
    end
    StopEmitters(A3_20)
  else
    AudioPostEventOn(A0_17, "Play_sfx_dbc_gargoyle_rotate_stop")
    SetRotatorMaxSpeed(A2_19, 0)
    StopEmitters(A3_20)
    Print("Back at start")
  end
end
DBC_ZoneL_GargoyleEnd = L0_0
function L0_0()
  if ZoneL_Gargoyle1_Angle + ZoneL_Gargoyle2_Angle + ZoneL_Gargoyle3_Angle + ZoneL_Gargoyle4_Angle == 4 and ZoneL_Gargoyle_Heads == 4 then
    Unhide("dbc_zonel.DBC_ProjectedLightbeam 05")
    if GetGlobal("DBC_ZoneL_GemLit") == 0 then
      SetGlobal("DBC_ZoneL_GemLit", 1)
      TimerDisable("dbc_zonel_dynamic.LogicTimerMarker 01")
      FireUser1("EndCutsceneCamera0")
      AudioPostEventOn(GetPlayer(), "Stop_music_darkbeautycastle")
      AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_GriefTower_GemIGC_Cut1")
      Wait(2)
      StartEmitters("dbc_zonel.DBC_ZoneL_Crystal_PurgeFX 01")
      StartEmitters("dbc_zonel.DBC_ZoneL_Crystal_BeamFX 01")
      Wait(1.5)
      ForEachEntityInGroup(Kill, "dbc_zonel_dynamic.StormBlot")
      wait(1)
      AnimEvent("StormBlot 01", EVENT_Special_4)
      Wait(4.5)
      StopEmitters("dbc_zonel.DBC_ZoneL_Crystal_BeamFX 01")
      Hide("StormBlot 01")
      wait(1)
      AnimGBSequence("dbc_zonel.DBC_ZoneL_Fireworks01 01", "Activate")
      wait(6.5)
      AnimGBSequence("dbc_zonel.DBC_ZoneL_GargoyleDoor01 01", "Open")
      AudioPostEventOn("dbc_zonel_audio.Sound_Marker_GargoyleDoor", "Play_sfx_dbc_ZoneL_GargoyleDoors")
      SetStayInCombatIdle(GetPlayer(), false)
    end
  end
end
DBC_ZoneL_ExitDoorOpen = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_ZoneL_TopLoadCheckpoint", "dbc_zonel_dynamic.MickeyCutscenePositionMarker 01")
  Disable("dbc_zonel_static.StormBlotCameraTrigger 01")
  Disable("dbc_zonel_static.TowerTopCameraPlaneTrigger 01")
  SetCombatIntensityBias(0)
  wait(2)
  AudioPostEventOn(GetPlayer(), "Play_music_darkbeautycastle")
  AudioSetState("Music_State", "Auto")
  AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_Courtyard_AMB_Guardian_LP")
end
DBC_ZoneL_ExitDoorOpen_Checkpoint = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
end
DBC_ZoneL_ReleaseCamera = L0_0
function L0_0(A0_21)
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneL_Camera_Rumble")
  ShakeCamera(6, 10, 0, 20, 0.025, 0.025)
  AnimGBReset("dbc_zonel.DBC_ZoneL_floorbreak12 01")
  AnimGBSequence("dbc_zonel.DBC_ZoneL_floorbreak12 01", "Break")
  Wait(0.1)
  SetPropertyInt(A0_21, "Collision Layer", 14)
  Wait(8)
  DestroyEntity(A0_21)
end
DBC_ZoneL_FloorFall = L0_0
function L0_0(A0_22)
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneL_Camera_Rumble")
  ShakeCamera(6, 10, 0, 20, 0.025, 0.025)
  EnableMotion(A0_22)
  Wait(0.1)
  SetPropertyInt(A0_22, "Collision Layer", 14)
  Wait(2.5)
  DestroyEntity(A0_22)
end
DBC_ZoneL_FloorFall02 = L0_0
function L0_0()
  ZoneL_HideBlotCheck = ZoneL_HideBlotCheck + 1
  FireUser1("MidIGCCamera")
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneL_Camera_Rumble")
  MoveToEntity("StormBlot 01", "dbc_zonel_dynamic.StormBlotMidPosition 01")
  Unhide("StormBlot 01")
  AnimEvent("StormBlot 01", EVENT_Special_8)
  AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_GriefTower_BlotSuprise")
  FireThread(Prefab_FallingFloor, "MidTowerIGC")
  StartEmitters("dbc_zonel_dynamic.BlotHand_Form_01 10")
  StartEmitters("dbc_zonel_dynamic.BlotHand_Form_01 09")
  AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_Towers_Wall_Blot_Telegraph")
  wait(1)
  FireThread(DBC_ZoneL_MickeyStartled)
  wait(1)
  StopEmitters("dbc_zonel_dynamic.BlotHand_Form_01 10")
  StopEmitters("dbc_zonel_dynamic.BlotHand_Form_01 09")
  wait(4.5)
  MoveToEntity("StormBlot 01", "dbc_zonel_dynamic.StormBlotPosition 01")
  Hide("StormBlot 01")
  ZoneL_HideBlotCheck = ZoneL_HideBlotCheck - 1
end
DBC_ZoneL_MidIGC = L0_0
function L0_0()
  SetCameraAttributes("dbc_zonel_dynamic.SplineCameraOverride 01")
  ShowHud()
end
DBC_ZoneL_MidIGCCamReturn = L0_0
function L0_0()
  RestrictCutSceneInput()
  Wait(6)
  GrabCamera("dbc_zonel.CameraControlPointSplineFollower 03", GetPlayer(), CAMERA_LERP_TRANSITION, 0.7)
  Enable("dbc_zonel.CameraControlPointSplineFollower 03")
  Wait(10)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
  UnrestrictCutSceneInput()
end
DBC_ZoneL_CamTest02 = L0_0
function L0_0()
  ZoneL_HideBlotCheck = ZoneL_HideBlotCheck + 1
  SetStayInCombatIdle(GetPlayer(), true)
  Enable("dbc_zonel.PlayerDeathPlaneTrigger 01")
  ForEachEntityInGroup(Enable, "HandDamage")
  FireUser1("TopEntryCamera")
  AudioPostEventOn(GetPlayer(), "Stop_music_darkbeautycastle")
  ForEachEntityInGroup(Enable, "HandDamage")
  Unhide("StormBlot 01")
  MoveToEntity("StormBlot 01", "dbc_zonel_dynamic.StormBlotPosition 01")
  AnimEvent("StormBlot 01", EVENT_Special_3)
  AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_GriefTower_TowerIntro_Cut1")
  StormBlot_SpitEmmitters()
  Rumble(nil, 1)
  ShakeCamera(4, 7.5, 0.75, 0.75, 0.025, 0.025)
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneL_Camera_Rumble")
  wait(4)
  MoveToEntity(GetPlayer(), "dbc_zonel_dynamic.MickeyCutscenePositionMarker 01")
  wait(0.1)
  FireThread(DBC_ZoneL_MickeyStartled)
  Unhide("dbc_zonel_dynamic.DBC_ZoneL_RoofDoor 01")
  SetCameraAttributes("dbc_zonel_static.StormBlotCameraOverride 02")
  AudioPostEventOn(GetPlayer(), "Play_music_darkbeautycastle")
  SetCombatIntensityBias(100)
end
DBC_ZoneL_RoofShut = L0_0
function L0_0()
  StreamInterior(nil, "stream_grieftower_topinterior")
  SaveCheckpoint(nil, "DBC_ZoneL_TopLoadCheckpoint", "dbc_zonel_dynamic.MickeyCutscenePositionMarker 01")
  ClearParent("dbc_zonel_dynamic.blottowerspawners 01.StormBlot 01")
  TimerEnable("dbc_zonel_dynamic.LogicTimerMarker 01")
  Enable("dbc_zonel_static.StormBlotCameraTrigger 01")
  Enable("dbc_zonel_static.TowerTopCameraPlaneTrigger 01")
  wait(1)
  SetCameraAttributes("dbc_zonel_static.StormBlotCameraOverride 02")
  DBC_ZoneL_StormBlotAttack()
end
DBC_ZoneL_RoofShut_Checkpoint = L0_0
function L0_0(A0_23, A1_24)
  DBC_ZoneL_CurrentSide = tonumber(A1_24)
end
DBC_ZoneL_SetSide = L0_0
L0_0 = 0
lastdata = L0_0
function L0_0()
  local L0_25, L1_26
  L0_25 = blotattackingT2
  if L0_25 == 0 then
    L0_25 = DBC_ZoneL_CurrentSide
    L1_26 = 1
    blotattackingT2 = L1_26
    L1_26 = AnimEvent
    L1_26("StormBlot 01", EVENT_Special_3)
    L1_26 = ForEachEntityInGroup
    L1_26(Enable, "RoarCenterTrigger 01")
    L1_26 = StormBlot_SpitEmmitters
    L1_26()
    L1_26 = Rumble
    L1_26(nil, 1)
    L1_26 = ShakeCamera
    L1_26(4, 7.5, 0.75, 0.75, 0.025, 0.025)
    L1_26 = AudioPostEventOn
    L1_26(GetPlayer(), "Play_sfx_dbc_ZoneL_Camera_Rumble")
    L1_26 = wait
    L1_26(1)
    L1_26 = ForEachEntityInGroup
    L1_26(Disable, "RoarCenterTrigger 01")
    L1_26 = StormBlot_SpitEmmittersStop
    L1_26()
    L1_26 = AnimEvent
    L1_26("StormBlot 01", "EVENT_Special_" .. L0_25)
    L1_26 = wait
    L1_26(0.5)
    L1_26 = ShakeCamera
    L1_26(6, 10, 0, 20, 0.025, 0.025)
    L1_26 = AudioPostEventOn
    L1_26(GetPlayer(), "Play_sfx_dbc_ZoneL_Camera_Rumble")
    L1_26 = wait
    L1_26(2.7)
    L1_26 = ForEachEntityInGroup
    L1_26(AnimGBSequence, "ColumnBreak" .. L0_25, "Break")
    L1_26 = wait
    L1_26(0.3)
    L1_26 = FireUser1
    L1_26("SlimeSpawnerStart" .. L0_25)
    L1_26 = StormBlot_HandEmmitters
    L1_26()
    L1_26 = wait
    L1_26(3)
    L1_26 = ZoneL_Gargoyle1_Angle
    L1_26 = L1_26 + ZoneL_Gargoyle2_Angle
    L1_26 = L1_26 + ZoneL_Gargoyle3_Angle
    L1_26 = L1_26 + ZoneL_Gargoyle4_Angle
    if L1_26 > DBC_ZoneL_MeleeSpawned then
      L1_26 = GetGlobal
      L1_26 = L1_26("DBC_ZoneL_GemLit")
      if L1_26 == 0 then
        L1_26 = ZoneL_Gargoyle1_Angle
        L1_26 = L1_26 + ZoneL_Gargoyle2_Angle
        L1_26 = L1_26 + ZoneL_Gargoyle3_Angle
        L1_26 = L1_26 + ZoneL_Gargoyle4_Angle
        L1_26 = L1_26 - DBC_ZoneL_MeleeSpawned
        ForceSpawn("EnemySpawner 02", L1_26)
        DBC_ZoneL_MeleeSpawned = ZoneL_Gargoyle1_Angle + ZoneL_Gargoyle2_Angle + ZoneL_Gargoyle3_Angle + ZoneL_Gargoyle4_Angle
      end
    end
    L1_26 = DBC_ZoneL_BlobSpawned
    if L1_26 == 0 then
      L1_26 = GetGlobal
      L1_26 = L1_26("DBC_ZoneL_GemLit")
      if L1_26 == 0 then
        L1_26 = 1
        DBC_ZoneL_BlobSpawned = L1_26
        L1_26 = ForceSpawn
        L1_26("EnemySpawner 01", 1)
      end
    end
    L1_26 = 0
    blotattackingT2 = L1_26
  end
end
DBC_ZoneL_StormBlotAttack = L0_0
function L0_0(A0_27, A1_28)
  local L3_29
  L3_29 = _G
  L3_29[A1_28] = _G[A1_28] - 1
end
DBC_ZoneL_KillEnemy = L0_0
function L0_0(A0_30)
  local L1_31, L2_32
  L1_31 = blotattackingT2
  if L1_31 == 0 then
    L1_31 = DBC_ZoneL_CurrentSide
    L2_32 = 1
    blotattackingT2 = L2_32
    L2_32 = AnimEvent
    L2_32("StormBlot 01", EVENT_Special_3)
    L2_32 = ForEachEntityInGroup
    L2_32(Enable, "RoarCenterTrigger 01")
    L2_32 = StormBlot_SpitEmmitters
    L2_32()
    L2_32 = Rumble
    L2_32(nil, 1)
    L2_32 = ShakeCamera
    L2_32(4, 7.5, 0.75, 0.75, 0.025, 0.025)
    L2_32 = AudioPostEventOn
    L2_32(GetPlayer(), "Play_sfx_dbc_ZoneL_Camera_Rumble")
    L2_32 = wait
    L2_32(1)
    L2_32 = ForEachEntityInGroup
    L2_32(Disable, "RoarCenterTrigger 01")
    L2_32 = StormBlot_SpitEmmittersStop
    L2_32()
    L2_32 = AnimEvent
    L2_32("StormBlot 01", "EVENT_Special_" .. L1_31)
    L2_32 = wait
    L2_32(0.5)
    L2_32 = ShakeCamera
    L2_32(6, 10, 0, 20, 0.025, 0.025)
    L2_32 = AudioPostEventOn
    L2_32(GetPlayer(), "Play_sfx_dbc_ZoneL_Camera_Rumble")
    L2_32 = wait
    L2_32(2.7)
    L2_32 = ForEachEntityInGroup
    L2_32(AnimGBSequence, "ColumnBreak" .. L1_31, "Break")
    L2_32 = wait
    L2_32(0.3)
    L2_32 = FireUser1
    L2_32("SlimeSpawnerStart" .. L1_31)
    L2_32 = StormBlot_HandEmmitters
    L2_32()
    L2_32 = wait
    L2_32(3)
    L2_32 = ZoneL_Gargoyle1_Angle
    L2_32 = L2_32 + ZoneL_Gargoyle2_Angle
    L2_32 = L2_32 + ZoneL_Gargoyle3_Angle
    L2_32 = L2_32 + ZoneL_Gargoyle4_Angle
    if L2_32 > DBC_ZoneL_MeleeSpawned then
      L2_32 = GetGlobal
      L2_32 = L2_32("DBC_ZoneL_GemLit")
      if L2_32 == 0 then
        L2_32 = ZoneL_Gargoyle1_Angle
        L2_32 = L2_32 + ZoneL_Gargoyle2_Angle
        L2_32 = L2_32 + ZoneL_Gargoyle3_Angle
        L2_32 = L2_32 + ZoneL_Gargoyle4_Angle
        L2_32 = L2_32 - DBC_ZoneL_MeleeSpawned
        ForceSpawn("EnemySpawner 02", L2_32)
        DBC_ZoneL_MeleeSpawned = ZoneL_Gargoyle1_Angle + ZoneL_Gargoyle2_Angle + ZoneL_Gargoyle3_Angle + ZoneL_Gargoyle4_Angle
      end
    end
    L2_32 = DBC_ZoneL_BlobSpawned
    if L2_32 == 0 then
      L2_32 = GetGlobal
      L2_32 = L2_32("DBC_ZoneL_GemLit")
      if L2_32 == 0 then
        L2_32 = 1
        DBC_ZoneL_BlobSpawned = L2_32
        L2_32 = ForceSpawn
        L2_32("EnemySpawner 01", 1)
      end
    end
    L2_32 = 0
    blotattackingT2 = L2_32
  end
end
DBC_ZoneL_StormBlotTimeAttack = L0_0
function L0_0(A0_33)
  SetExternalVelocity(A0_33, vector4(0, 0, 5), 0.9)
end
DBC_ZoneL_CenterBlow = L0_0
function L0_0(A0_34, A1_35)
  ZoneL_HideBlotCheck = ZoneL_HideBlotCheck + 1
  MoveToEntity("StormBlot 01", A0_34)
  AnimEvent("StormBlot 01", EVENT_Special_7)
  wait(0.2)
  Unhide("StormBlot 01")
  wait(3)
  if ZoneL_HideBlotCheck == 1 then
    Hide("StormBlot 01")
    MoveToEntity("StormBlot 01", "dbc_zonel_dynamic.StormBlotPosition 01")
  end
  ZoneL_HideBlotCheck = ZoneL_HideBlotCheck - 1
end
DBC_ZoneL_BlotRip = L0_0
function L0_0(A0_36, A1_37)
  ZoneL_HideBlotCheck = ZoneL_HideBlotCheck + 1
  MoveToEntity("StormBlot 01", A0_36)
  AnimEvent("StormBlot 01", EVENT_Special_10)
  wait(0.2)
  Unhide("StormBlot 01")
  wait(3)
  if ZoneL_HideBlotCheck == 1 then
    Hide("StormBlot 01")
    MoveToEntity("StormBlot 01", "dbc_zonel_dynamic.StormBlotPosition 01")
  end
  ZoneL_HideBlotCheck = ZoneL_HideBlotCheck - 1
end
DBC_ZoneL_BlotRipLonger = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_ZoneL_LoadCheckpoint", "dbc_zonel_dynamic.StartPositionMarker 01")
end
DBC_ZoneL_RedChestSave = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "PlayerDeathPlaneTrigger")
  DestroyEntity("dbc_zonel_dynamic.PlayerDeathPlaneTrigger 02")
end
DBC_ZoneL_DestroyTriggers = L0_0
function L0_0(A0_38)
  StartEmitters(A0_38)
  AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_Towers_Wall_Blot_Telegraph")
  Wait(2)
  StopEmitters(A0_38)
end
DBC_ZoneL_StartHandForm = L0_0
function L0_0(A0_39, A1_40)
  print("**************i got stimmed!!!!!")
  if StimulusEvent_HasStimulusType(A1_40, 0) then
    print("**************i got thinned!!!!!")
    if StimulusEvent_Source(A1_40) ~= GetPlayer() then
      print("**************the slobber did it!!!!!")
      FireSequence("dbc_zonel_dynamic.Marker(Conversation) 01", "DBC_2nd_ZoneK_HeadThinned")
    elseif StimulusEvent_Source(A1_40) == GetPlayer() then
      print("**************mickey did it!!!!!")
    end
  end
end
DBC_ZoneL_HeadThinnedGarg = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_ZoneL_LoadCheckpoint", "dbc_zonel_dynamic.StartPositionMarker 01")
end
DBC_ZoneL_ConceptArtSave = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_ZoneL_TopLoadCheckpoint", "dbc_zonel_dynamic.MickeyCutscenePositionMarker 01")
end
DBC_ZoneL_ConceptArtSave2 = L0_0
function L0_0()
  EnterCutscene(GetPlayer(), 22)
  wait(2)
  AnimEvent(GetPlayer(), EVENT_Finished_Sequence)
end
DBC_ZoneL_MickeyStartled = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_GriefTower_GemIGC_Cut2")
end
DBC_ZoneL_GemIGCAudio1 = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_GriefTower_GemIGC_Cut3")
end
DBC_ZoneL_GemIGCAudio2 = L0_0
