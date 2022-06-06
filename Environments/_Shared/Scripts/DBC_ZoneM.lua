local L0_0, L1_1
L0_0 = 0
blotattackingT3 = L0_0
L0_0 = 0
DBC_ZoneM_CurrentSide = L0_0
L0_0 = 0
DBC_ZoneM_MeleeSpawned = L0_0
L0_0 = 0
DBC_ZoneM_BlobSpawned = L0_0
L0_0 = 0
ZoneM_Gargoyle1_Angle = L0_0
L0_0 = 0
ZoneM_Gargoyle2_Angle = L0_0
L0_0 = 0
ZoneM_Gargoyle3_Angle = L0_0
L0_0 = 0
ZoneM_Gargoyle4_Angle = L0_0
L0_0 = 0
ZoneM_Gargoyle_Heads = L0_0
L0_0 = 0
ZoneM_TowerFell = L0_0
L0_0 = 0
ZoneM_BlotAppears = L0_0
function L0_0()
  StreamInterior(nil, "stream_losstower_anims")
end
DBC_ZoneM_StreamInAnims = L0_0
function L0_0()
  Enable("dbc_zonem.TriggerAudioPORTAL_Top")
  Disable("dbc_zonem_audio.Trigger_Portal 05")
  ForEachEntityInGroup(DestroyEntity, "TowerThreeFallingFloor")
  DestroyEntity("dbc_zonem_static.StartRoofAttackPlaneTrigger 01")
  ForEachEntityInGroup(ForceSketched, "TowerToon")
  ForEachEntityInGroup(DestroyEntity, "BonusChest")
  ForEachEntityInGroup(DestroyEntity, "DBC_Tower3_Checkpoint0")
  ForEachEntityInGroup(DestroyEntity, "DBC_Tower3_Checkpoint1")
  ForEachEntityInGroup(DestroyEntity, "DBC_Tower3_Checkpoint2")
  EndTrackingCurrentLevelForScoring("DBC_V2_LossTower")
  StartTrackingCurrentLevelForScoring("DBC_V2_LossTower")
  Enable("dbc_zonem_dynamic.PlaneTrigger 04")
  ForEachEntityInGroup(AnimGBSequence, "TowerThreePortcullis", "Rest")
  ForEachEntityInGroup(Unhide, "GateCollisionGroup")
  FireThread(GuardianPrefab_PopulateGuardians, "DBC_ZoneM_MickeyHead")
end
DBC_ZoneM_TopLoadCheckpoint = L0_0
function L0_0()
  GrabCamera("dbc_zonem_dynamic.MidCheckpoint_CameraControlPoint 01", nil, CAMERA_INSTANT_TRANSITION, 0)
  Enable("dbc_zonem_dynamic.MidCheckpoint_Trigger 01")
  DestroyEntity("Floor2SetupTrigger")
  AnimGBSequence("dbc_zonem_dynamic.Floor1Portcullis 01", "Rest")
  AnimGBSequence("dbc_zonem_dynamic.Floor1Portcullis 02", "Rest")
  AnimGBSequence("dbc_zonem_dynamic.Floor2Portcullis 01", "Rest")
  DestroyEntity("FallingFloor05")
  DestroyEntity("FallingFloor06")
  DestroyEntity("dbc_zonem_dynamic_anims.fallingfloor 01.FloorPiece")
  DestroyEntity("dbc_zonem_dynamic_anims.fallingfloor 02.FloorPiece")
  DestroyEntity("dbc_zonem_dynamic_anims.fallingfloor 03.FloorPiece")
  DestroyEntity("dbc_zonem_dynamic_anims.fallingfloor 04.FloorPiece")
  EndTrackingCurrentLevelForScoring("DBC_V2_LossTower")
  StartTrackingCurrentLevelForScoring("DBC_V2_LossTower")
  ForEachEntityInGroup(Hide, "TentPlatformGroup01")
  ForEachEntityInGroup(Hide, "TentPlatformGroup02")
  ForEachEntityInGroup(ForceSketched, "TowerToon")
  ForEachEntityInGroup(Unhide, "GateCollision1")
  FireThread(GuardianPrefab_PopulateGuardians, "DBC_ZoneM_MickeyHead")
  FireThread(DBC_ZoneM_MidLoadCheckpoint_Firethread)
end
DBC_ZoneM_MidLoadCheckpoint = L0_0
function L0_0(A0_2)
  DBC_ZoneM_NoIntro = true
  DBC_ZoneM_DefaultCameraSetup()
  SetGlobal("DBC_ZoneM_PlatformTent", 0)
  ForEachEntityInGroup(Hide, "TentPlatformGroup01")
  ForEachEntityInGroup(Hide, "TentPlatformGroup02")
  ForEachEntityInGroup(Hide, "TentPlatformGroup03")
  EndTrackingCurrentLevelForScoring("DBC_V2_LossTower")
  StartTrackingCurrentLevelForScoring("DBC_V2_LossTower")
  AnimGBSequence("dbc_zonem_dynamic.Floor3Portcullis 01", "OpenRest")
  FireThread(DBC_ZoneM_LoadCheckpoint_FireThread)
end
DBC_ZoneM_LoadCheckpoint = L0_0
L0_0 = false
DBC_ZoneM_NoIntro = L0_0
function L0_0()
  if DBC_ZoneM_NoIntro == false then
    GetPrefabData("DBC_ZoneM_StartMarker").MapLoad_SetupPosition = "True"
    OnMapLoad_ProjectorSetup("DBC_ZoneM_StartMarker")
  end
end
DBC_ZoneM_Intro_Launcher = L0_0
function L0_0()
  SetGlobal("MS_MeanStreetProgress", 6)
  Hide("StormBlot 01")
  DBC_ZoneM_StreamInAnims()
  SetMap(nil, "MAP_DBC_ZONEM", "GAME")
  AnimGBSequence("dbc_zonem_dynamic.Floor3Portcullis 01", "OpenRest")
  Hide("dbc_zonem_dynamic.Floor3Portcullis 01")
  GuardianPrefab_PopulateGuardians("DBC_ZoneM_MickeyHead")
  Wait(2)
  FireUser1("IntroCameraSequence")
  wait(10.5)
  EndTrackingCurrentLevelForScoring("DBC_V2_GriefTower")
  StartTrackingCurrentLevelForScoring("DBC_V2_LossTower")
  ForEachEntityInGroup(Hide, "TentPlatformGroup01")
  ForEachEntityInGroup(Hide, "TentPlatformGroup02")
  ForEachEntityInGroup(Hide, "TentPlatformGroup03")
  SaveCheckpoint(nil, "DBC_ZoneM_LoadCheckpoint", "dbc_zonem_static.StartPositionMarker 01")
end
DBC_ZoneM_IntroSequence = L0_0
function L0_0()
  Hide("StormBlot 01")
  SetDefaultCameraValues(6.25, 18, -10)
  SetCameraAttributes("dbc_zonem_dynamic.IntroCameraOverride 01")
  wait(0.2)
  SetCameraAttributes("dbc_zonem_dynamic.IntroCameraOverride 02")
  ShowHud()
end
DBC_ZoneM_DefaultCameraSetup = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneM_Camera_Rumble")
  ShakeCamera_Default("camera")
end
DBC_ZoneM_CamShake = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_ZoneM_TopLoadCheckpoint", "dbc_zonem_static.TopPositionMarker")
  Wait(3)
  ForEachEntityInGroup(ForceSketched, "TowerToon")
  Hide("dbc_zonem.DBC_ZoneM_toon_block4 01")
  wait(1)
end
DBC_ZoneM_StartRoofAttack = L0_0
function L0_0(A0_3, A1_4, A2_5, A3_6)
  AnimGBSequence(A3_6, "on", true)
  Hide(A2_5)
  AudioPostEventOn(A0_3, "Play_sfx_dbc_birdhead_painted")
  ZoneM_Gargoyle_Heads = ZoneM_Gargoyle_Heads + 1
  if GetGlobal("DBC_ZoneM_GemLit") == 0 then
    DBC_ZoneM_ExitDoorOpen()
  end
end
DBC_ZoneM_GargPainted = L0_0
function L0_0(A0_7, A1_8, A2_9, A3_10, A4_11)
  AnimGBSequence(A3_10, "off")
  Unhide(A2_9)
  StartEmitters(A2_9)
  Hide(A4_11)
  ZoneM_Gargoyle_Heads = ZoneM_Gargoyle_Heads - 1
end
DBC_ZoneM_GargThinned = L0_0
function L0_0(A0_12, A1_13, A2_14, A3_15)
  if _G[A1_13] == 0 then
    AudioPostEventOn(A0_12, "Play_sfx_dbc_gargoyle_rotate_start")
    Print("rotating start")
    Reverse(A0_12)
    StartEmitters(A3_15)
    Reverse(A2_14)
    SetRotatorMaxSpeed(A0_12, 360)
    SetRotatorMaxSpeed(A2_14, 420)
    wait(0.125)
    if _G[A1_13] == 0 then
      Reverse(A0_12)
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
DBC_ZoneM_GargoyleSpin = L0_0
function L0_0(A0_16, A1_17, A2_18, A3_19)
  if GetPropertyFloat(A0_16, "Max Speed") == 360 then
    StopEmitters(A3_19)
    SetRotatorMaxSpeed(A0_16, 0)
    SetRotatorMaxSpeed(A2_18, 0)
    DisableGlint(A2_18)
    AudioPostEventOn(A0_16, "Play_sfx_dbc_gargoyle_rotate_end")
    Print("rotating final position end")
    _G[A1_17] = 1
    if GetGlobal("DBC_ZoneM_GemLit") == 0 then
      DBC_ZoneM_ExitDoorOpen()
    end
  else
    StopEmitters(A3_19)
    AudioPostEventOn(A0_16, "Play_sfx_dbc_gargoyle_rotate_stop")
    SetRotatorMaxSpeed(A2_18, 0)
    Print("Back at start")
  end
end
DBC_ZoneM_GargoyleEnd = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneM_Garg02") == 0 then
    if ZoneM_Gargoyle1_Angle + ZoneM_Gargoyle2_Angle + ZoneM_Gargoyle3_Angle + ZoneM_Gargoyle4_Angle == 1 then
      ShakeCamera(1, 3, 1, 0.75, 0.025, 0.025)
    elseif ZoneM_Gargoyle1_Angle + ZoneM_Gargoyle2_Angle + ZoneM_Gargoyle3_Angle + ZoneM_Gargoyle4_Angle == 2 then
      ShakeCamera(1.1, 4, 1, 0.75, 0.025, 0.025)
      FireSequence("dbc_zonem_dynamic.Marker(Conversation) 01", "DBC_ZoneM_SomethingWrong")
    elseif ZoneM_Gargoyle1_Angle + ZoneM_Gargoyle2_Angle + ZoneM_Gargoyle3_Angle + ZoneM_Gargoyle4_Angle == 3 then
      ShakeCamera(1.3, 7.5, 1, 0.75, 0.025, 0.025)
    elseif ZoneM_Gargoyle1_Angle + ZoneM_Gargoyle2_Angle + ZoneM_Gargoyle3_Angle + ZoneM_Gargoyle4_Angle == 4 and ZoneM_Gargoyle_Heads ~= 4 then
      ShakeCamera(1.3, 7.5, 1, 0.75, 0.025, 0.025)
    elseif ZoneM_Gargoyle1_Angle + ZoneM_Gargoyle2_Angle + ZoneM_Gargoyle3_Angle + ZoneM_Gargoyle4_Angle == 4 and ZoneM_Gargoyle_Heads == 4 then
      Unhide("dbc_zonem.DBC_ProjectedLightbeam 05")
      if GetGlobal("DBC_ZoneM_GemLit") == 0 then
        StartEmitters("dbc_zonem.fx_gemLightPurge 01")
        AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_LossTower_GemCut_IGC")
        StreamInterior(nil, "stream_lossfallingtower")
        ShakeCamera(1.5, 7.5, 1, 0.75, 0.025, 0.025)
        SetGlobal("DBC_ZoneM_GemLit", 1)
        wait(1.5)
        RestrictCutSceneInput()
        FireSequence("dbc_zonem_dynamic.Marker(Conversation) 01", "DBC_2nd_ZoneM_TopHint")
      end
    end
  end
end
DBC_ZoneM_ExitDoorOpen = L0_0
function L0_0()
  SetCameraAttributes("dbc_zonem_static.MarkerCameraOverride 01")
end
DBC_ZoneM_PlatformingCamera = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneM_GemLit") == 1 and ZoneM_TowerFell == 0 then
    ZoneM_TowerFell = 1
    FireUser1("TowerDrop")
    ForEachEntityInGroup(DestroyEntity, "TowerChests")
    Wait(2)
    AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_LossTower_TowerDrop")
    DestroyEntity("dbc_zonem.DBC_ZoneK_GargoyleDoor01 01")
    Prefab_FallingFloor("FallingTower")
    DestroyEntity("FauxCollision")
    Wait(0.3)
    GuardianPrefab_KillGuardians("DBC_ZoneM_MickeyHead")
    wait(2.7)
    ShakeCamera(4, 7.5, 0.5, 0.5, 0.025, 0.025)
    AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ZoneM_Camera_Rumble")
    AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_LossTower_Gem_Fall")
    wait(2)
    StopEmitters("dbc_zonem.fx_gemLightPurge 01")
    EnableMotion("dbc_zonem.DBC_ZoneK_Crystal 01")
    ClearParent("dbc_zonem.DBC_ZoneK_Crystal 01")
    ForceSketched("dbc_zonem.DBC_GargoyleC2_Inert 01")
    ForceSketched("dbc_zonem.DBC_GargoyleC2_Inert 02")
    ForceSketched("dbc_zonem.DBC_GargoyleC2_Inert 03")
    ForceSketched("dbc_zonem.DBC_GargoyleC2_Inert 04")
    Hide("dbc_zonem.DBC_ProjectedLightbeam 05")
    ForEachEntityInGroup(DestroyEntity, "dbc_zonem_dynamic.ExitProjector")
    ActivateScene("environments/thepark/darkbeautycastle/gsa/dbc_zonemr.gsa")
    wait(3)
  end
end
DBC_ZoneM_TowerDestroy = L0_0
function L0_0()
  if ZoneM_TowerFell == 1 and ZoneM_BlotAppears == 0 then
    ZoneM_BlotAppears = 1
    FireUser1("BlotRoarsCamera")
    AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_LossTower_BlotAttack")
    wait(0.8)
    MoveToEntity(GetPlayer(), "dbc_zonem.PositionMarker_FaceStormBlot")
    Unhide("StormBlot 01")
    AnimEvent("StormBlot 01", EVENT_Special_9)
    wait(6.33)
    AnimEvent("StormBlot 01", EVENT_Special_3)
    StormBlot_SpitEmmitters()
    wait(0.5)
    ShakeCamera(4, 7.5, 1, 0.75, 0.025, 0.025)
    Rumble(nil, 1)
    wait(1.2)
    AnimEvent("StormBlot 01", EVENT_Special_0)
    Wait(3)
    Rumble(nil, 1)
    FireThread(Prefab_FallingFloor, "TowerCenter")
    AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_LossTower_Collapse_Start")
    Wait(0.2)
    ForEachEntityInGroup(AnimGBSequence, "ColumnBreak0", "Break")
    Wait(3.8)
  end
end
DBC_ZoneM_TopCollapse = L0_0
function L0_0()
  MoveToEntity(GetPlayer(), "dbc_zonemr.TeleportInboundMarker")
end
DBC_ZoneM_MickeyTeleport = L0_0
function L0_0()
  MoveToEntity(GetPlayer(), "dbc_zonem.PositionMarker_FaceCrystal")
end
DBC_ZoneM_MickeyTeleport_FaceCrystal = L0_0
L0_0 = 3
DBC_ZoneM_Floor1 = L0_0
L0_0 = 3
DBC_ZoneM_Floor2 = L0_0
L0_0 = 3
DBC_ZoneM_Floor3 = L0_0
function L0_0(A0_20, A1_21)
  if _G[A1_21] == 0 then
    _G[A1_21] = 500
    if A0_20 == "dbc_zonem_dynamic.Floor1Portcullis 02" then
      FireUser1("ExitCombat1")
      Wait(1.2)
      AnimGBSequence(A0_20, "Open")
      AudioPostEventOn(A0_20, "Play_sfx_dbc_ZoneM_PortcullisDoor_Open")
    elseif A0_20 == "dbc_zonem_dynamic.Floor2Portcullis 02" then
      FireUser1("ExitCombat2")
      Wait(1.2)
      AnimGBSequence(A0_20, "Open")
      AudioPostEventOn(A0_20, "Play_sfx_dbc_ZoneM_PortcullisDoor_Open")
      Wait(2.8)
      SaveCheckpoint(nil, "DBC_ZoneM_MidLoadCheckpoint", "dbc_zonem_dynamic.MidCheckpoint_PositionMarker 01")
    elseif A0_20 == "dbc_zonem_dynamic.Floor3Portcullis 02" then
      FireUser1("ExitCombat3")
      Wait(1.2)
      AnimGBSequence(A0_20, "Open")
      AudioPostEventOn(A0_20, "Play_sfx_dbc_ZoneM_PortcullisDoor_Open")
    end
  end
end
DBC_ZoneM_FloorClear = L0_0
function L0_0()
  SetCameraAttributes("dbc_zonem_dynamic.Floor3ToTopCameraOverride 01")
end
DBC_ZoneM_Floor3ToTop_SplineCamera = L0_0
function L0_0(A0_22, A1_23, A2_24)
  if GetCurrentTeam(A0_22) == 2 then
    _G[A1_23] = _G[A1_23] + 1
  elseif GetCurrentTeam(A0_22) == 3 then
    _G[A1_23] = _G[A1_23] - 1
  end
  DBC_ZoneM_FloorClear(A2_24, A1_23)
end
DBC_ZoneM_EnemyTeamChange = L0_0
function L0_0(A0_25, A1_26, A2_27)
  _G[A1_26] = _G[A1_26] - 1
  DBC_ZoneM_FloorClear(A2_27, A1_26)
end
DBC_ZoneM_EnemyDeath = L0_0
function L0_0(A0_28, A1_29)
  DBC_ZoneM_CurrentSide = tonumber(A1_29)
end
DBC_ZoneM_SetSide = L0_0
function L0_0()
  local L0_30, L1_31
  L0_30 = blotattackingT3
  if L0_30 == 0 then
    L0_30 = DBC_ZoneM_CurrentSide
    L1_31 = 1
    blotattackingT3 = L1_31
    L1_31 = AnimEvent
    L1_31("StormBlot 01", EVENT_Special_3)
    L1_31 = StormBlot_SpitEmmitters
    L1_31()
    L1_31 = Enable
    L1_31("RoarCenterTrigger 01")
    L1_31 = Rumble
    L1_31(nil, 1)
    L1_31 = ShakeCamera
    L1_31(4, 7.5, 0.75, 0.75, 0.025, 0.025)
    L1_31 = AudioPostEventOn
    L1_31(GetPlayer(), "Play_sfx_dbc_ZoneM_Camera_Rumble")
    L1_31 = wait
    L1_31(1)
    L1_31 = Disable
    L1_31("RoarCenterTrigger 01")
    L1_31 = StormBlot_SpitEmmittersStop
    L1_31()
    L1_31 = AnimEvent
    L1_31("StormBlot 01", "EVENT_Special_" .. L0_30)
    L1_31 = wait
    L1_31(0.5)
    L1_31 = ShakeCamera
    L1_31(6, 10, 0, 20, 0.025, 0.025)
    L1_31 = AudioPostEventOn
    L1_31(GetPlayer(), "Play_sfx_dbc_ZoneM_Camera_Rumble")
    L1_31 = wait
    L1_31(2.7)
    L1_31 = ForEachEntityInGroup
    L1_31(AnimGBSequence, "ColumnBreak" .. L0_30, "Break")
    L1_31 = wait
    L1_31(0.3)
    L1_31 = FireUser1
    L1_31("SlimeSpawnerStart" .. L0_30)
    L1_31 = StormBlot_HandEmmitters
    L1_31()
    L1_31 = wait
    L1_31(3)
    L1_31 = ZoneM_Gargoyle1_Angle
    L1_31 = L1_31 + ZoneM_Gargoyle2_Angle
    L1_31 = L1_31 + ZoneM_Gargoyle3_Angle
    L1_31 = L1_31 + ZoneM_Gargoyle4_Angle
    if L1_31 > DBC_ZoneM_MeleeSpawned then
      L1_31 = ZoneM_Gargoyle1_Angle
      L1_31 = L1_31 + ZoneM_Gargoyle2_Angle
      L1_31 = L1_31 + ZoneM_Gargoyle3_Angle
      L1_31 = L1_31 + ZoneM_Gargoyle4_Angle
      L1_31 = L1_31 - DBC_ZoneM_MeleeSpawned
      ForceSpawn("EnemySpawner 02", L1_31)
      DBC_ZoneM_MeleeSpawned = ZoneM_Gargoyle1_Angle + ZoneM_Gargoyle2_Angle + ZoneM_Gargoyle3_Angle + ZoneM_Gargoyle4_Angle
    end
    L1_31 = DBC_ZoneM_BlobSpawned
    if L1_31 == 0 then
      L1_31 = 1
      DBC_ZoneM_BlobSpawned = L1_31
      L1_31 = ForceSpawn
      L1_31("EnemySpawner 01", 1)
    end
    L1_31 = 0
    blotattackingT3 = L1_31
  end
end
DBC_ZoneM_StormBlotAttack = L0_0
function L0_0(A0_32, A1_33)
  local L3_34
  L3_34 = _G
  L3_34[A1_33] = _G[A1_33] - 1
end
DBC_ZoneM_KillEnemy = L0_0
function L0_0(A0_35)
  local L1_36, L2_37
  L1_36 = blotattackingT3
  if L1_36 == 0 then
    L1_36 = DBC_ZoneM_CurrentSide
    L2_37 = 1
    blotattackingT3 = L2_37
    L2_37 = AnimEvent
    L2_37("StormBlot 01", EVENT_Special_3)
    L2_37 = Enable
    L2_37("RoarCenterTrigger 01")
    L2_37 = StormBlot_SpitEmmitters
    L2_37()
    L2_37 = Rumble
    L2_37(nil, 1)
    L2_37 = ShakeCamera
    L2_37(4, 7.5, 0.75, 0.75, 0.025, 0.025)
    L2_37 = AudioPostEventOn
    L2_37(GetPlayer(), "Play_sfx_dbc_ZoneM_Camera_Rumble")
    L2_37 = wait
    L2_37(3)
    L2_37 = Disable
    L2_37("RoarCenterTrigger 01")
    L2_37 = AnimEvent
    L2_37("StormBlot 01", "EVENT_Special_" .. L1_36)
    L2_37 = StormBlot_SpitEmmittersStop
    L2_37()
    L2_37 = wait
    L2_37(0.5)
    L2_37 = ShakeCamera
    L2_37(6, 10, 0, 20, 0.025, 0.025)
    L2_37 = AudioPostEventOn
    L2_37(GetPlayer(), "Play_sfx_dbc_ZoneM_Camera_Rumble")
    L2_37 = wait
    L2_37(2.7)
    L2_37 = ForEachEntityInGroup
    L2_37(AnimGBSequence, "ColumnBreak" .. L1_36, "Break")
    L2_37 = wait
    L2_37(0.3)
    L2_37 = FireUser1
    L2_37("SlimeSpawnerStart" .. L1_36)
    L2_37 = StormBlot_HandEmmitters
    L2_37()
    L2_37 = wait
    L2_37(3)
    L2_37 = ZoneM_Gargoyle1_Angle
    L2_37 = L2_37 + ZoneM_Gargoyle2_Angle
    L2_37 = L2_37 + ZoneM_Gargoyle3_Angle
    L2_37 = L2_37 + ZoneM_Gargoyle4_Angle
    if L2_37 > DBC_ZoneM_MeleeSpawned then
      L2_37 = ZoneM_Gargoyle1_Angle
      L2_37 = L2_37 + ZoneM_Gargoyle2_Angle
      L2_37 = L2_37 + ZoneM_Gargoyle3_Angle
      L2_37 = L2_37 + ZoneM_Gargoyle4_Angle
      L2_37 = L2_37 - DBC_ZoneM_MeleeSpawned
      ForceSpawn("EnemySpawner 02", L2_37)
      DBC_ZoneM_MeleeSpawned = ZoneM_Gargoyle1_Angle + ZoneM_Gargoyle2_Angle + ZoneM_Gargoyle3_Angle + ZoneM_Gargoyle4_Angle
    end
    L2_37 = DBC_ZoneM_BlobSpawned
    if L2_37 == 0 then
      L2_37 = 1
      DBC_ZoneM_BlobSpawned = L2_37
      L2_37 = ForceSpawn
      L2_37("EnemySpawner 01", 1)
    end
    L2_37 = 0
    blotattackingT3 = L2_37
  end
end
DBC_ZoneM_StormBlotTimeAttack = L0_0
function L0_0()
  SetCameraAttributes("TowerTopCameraOverride")
  Enable("TowerTopCameraTrigger")
end
DBC_ZoneM_SetTowerTopCamera = L0_0
function L0_0(A0_38)
  SetExternalVelocity(A0_38, vector4(5, 0, 0), 0.9)
end
DBC_ZoneM_CenterBlow = L0_0
function L0_0()
  SetMap(nil, "MAP_DBC_ZONER", "GAME")
  Hide("ZoneH_ShamHide")
  AudioPostEventOn(GetPlayer(), "Play_sfx_Amb_DBC_InsideTower")
end
DBC_ZoneM_SetNextMap = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_ZoneM_MidLoadCheckpoint", "dbc_zonem_dynamic.MidCheckpoint_PositionMarker 01")
  SetCameraAttributes("dbc_zonem_static.MarkerCameraOverride 01")
end
DBC_ZoneM_CollectPin = L0_0
function L0_0()
  SetCameraAttributes("dbc_zonem_dynamic.Floor1ToFloor2CameraOverride 01")
end
DBC_ZoneM_Door1ExitCameraRelease = L0_0
function L0_0(A0_39, A1_40, A2_41)
  if GetGlobal("DBC_ZoneM_PlatformTent") >= 2 then
    QueueBrainEvent(A0_39, "BRAIN_CustomBehaviorOne", vector4(0, 0, 0), A1_40)
    wait(tonumber(A2_41))
    ForceSketched(A1_40)
    QueueBrainEvent(A0_39, "BRAIN_CustomBehaviorTwo")
  end
end
DBC_ZoneM_TentPlatformThin01 = L0_0
function L0_0(A0_42, A1_43, A2_44)
  if GetGlobal("DBC_ZoneM_PlatformTent") == 3 then
    QueueBrainEvent(A0_42, "BRAIN_CustomBehaviorOne", vector4(0, 0, 0), A1_43)
    wait(tonumber(A2_44))
    ForceSketched(A1_43)
    QueueBrainEvent(A0_42, "BRAIN_CustomBehaviorTwo")
  end
end
DBC_ZoneM_TentPlatformThin02 = L0_0
function L0_0(A0_45, A1_46, A2_47)
  if GetGlobal("DBC_ZoneM_PlatformTent") >= 1 then
    QueueBrainEvent(A0_45, "BRAIN_CustomBehaviorOne", vector4(0, 0, 0), A1_46)
    wait(tonumber(A2_47))
    ForceSketched(A1_46)
    QueueBrainEvent(A0_45, "BRAIN_CustomBehaviorTwo")
  end
end
DBC_ZoneM_TentPlatformThin03 = L0_0
function L0_0()
  SetGlobal("DBC_ZoneM_PlatformTent", 2)
  ForEachEntityInGroup(Unhide, "TentPlatformGroup01")
end
DBC_ZoneM_TentPlatformReady01 = L0_0
function L0_0()
  SetGlobal("DBC_ZoneM_PlatformTent", 3)
  ForEachEntityInGroup(Unhide, "TentPlatformGroup02")
end
DBC_ZoneM_TentPlatformReady02 = L0_0
function L0_0()
  SetGlobal("DBC_ZoneM_PlatformTent", 1)
  ForEachEntityInGroup(Unhide, "TentPlatformGroup03")
end
DBC_ZoneM_TentPlatformReady03 = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_ZoneR_LoadCheckpoint", "dbc_zoner_dynamic.PositionMarker 01")
  RestrictCutSceneInput()
  Wait(1.2)
  UnrestrictCutSceneInput()
end
DBC_ZoneMR_ChestSave = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_ZoneMR_LoadCheckpoint", "dbc_zonemr.TeleportInboundMarker")
end
DBC_ZoneMR_ConceptArtSave = L0_0
function L0_0()
  SetCameraAttributes("dbc_zonemr.Marker(CameraOverride) 01")
  ShakeCamera(4, 7.5, 0.75, 0.75, 0.025, 0.025)
  Rumble(nil, 1)
end
DBC_ZoneMR_LoadCheckpoint = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneMR_SaveCheck") == 0 then
    SetGlobal("DBC_ZoneMR_SaveCheck", 1)
    SaveCheckpoint(nil, "DBC_ZoneMR_LoadCheckpoint", "dbc_zonemr.TeleportInboundMarker")
  end
end
DBC_ZoneMR_InitSave = L0_0
function L0_0()
  ShowHud()
end
DBC_ZoneM_ReturnHUD = L0_0
function L0_0()
  Wait(0.1)
  AnimGBSequence("dbc_zonem_dynamic.Floor3Portcullis 01", "OpenRest")
  AnimGBSequence("dbc_zonem_dynamic.Floor2Portcullis 02", "OpenRest")
  Wait(0.1)
  Hide("dbc_zonem_dynamic.Floor3Portcullis 01")
end
DBC_ZoneM_MidLoadCheckpoint_Firethread = L0_0
function L0_0()
  Wait(0.1)
  Hide("dbc_zonem_dynamic.Floor3Portcullis 01")
  GuardianPrefab_PopulateGuardians("DBC_ZoneM_MickeyHead")
end
DBC_ZoneM_LoadCheckpoint_FireThread = L0_0
function L0_0()
  ApplyImpulse(GetPlayer(), 0, 5000, 0)
end
DBC_ZoneM_LaunchMickey = L0_0
function L0_0(A0_48, A1_49)
  Unhide(A1_49)
end
DBC_ZoneM_EnableBeam = L0_0
function L0_0()
  StreamZones(nil, "stream_emptypartfile")
  StreamInterior(nil, "stream_lossfallingtower_wsound")
  wait(2)
  StreamZones(nil, "stream_utilidor7")
end
DBC_ZoneMR_TopStreaming = L0_0
