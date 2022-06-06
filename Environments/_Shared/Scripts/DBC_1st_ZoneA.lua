local L0_0, L1_1
L0_0 = 0
DBC_1st_ZoneA_TimMachineState = L0_0
L0_0 = 0
DBC_1st_ZoneA_MortMachineState = L0_0
L0_0 = 1
DBC_ArmActive = L0_0
L0_0 = "none"
DBC_1st_ZoneA_CurrentMachine = L0_0
L0_0 = 0
DBC_1st_ZoneA_GusIntro_Played = L0_0
function L0_0(A0_2, A1_3)
  DisableComponent(A0_2, "Usable")
  TeleportToEntity(A0_2, A1_3, true, true)
  StartGremlinTeleportInFX(A0_2)
  wait(0.66)
  Unhide(A0_2)
  EnterCutscene(A0_2, 5)
  wait(3)
  EnableComponent(A0_2, "Usable")
  if not IsInCutscene(A0_2) then
    ExitCutscene(A0_2)
  end
end
DBC_1st_ZoneA_TeleportGremlinToEntityRight = L0_0
function L0_0(A0_4, A1_5)
  DisableComponent(A0_4, "Usable")
  TeleportToEntity(A0_4, A1_5, true, true)
  StartGremlinTeleportInFX(A0_4)
  wait(0.66)
  Unhide(A0_4)
  EnterCutscene(A0_4, 11)
  wait(2)
  Hide(A0_4)
  EnableComponent(A0_4, "Usable")
  if not IsInCutscene(A0_4) then
    ExitCutscene(A0_4)
  end
end
DBC_1st_ZoneA_TeleportGremlinToEntityRightFirst = L0_0
function L0_0(A0_6, A1_7)
  DisableComponent(A0_6, "Usable")
  TeleportToEntity(A0_6, A1_7, true, true)
  StartGremlinTeleportInFX(A0_6)
  wait(0.66)
  Unhide(A0_6)
  EnterCutscene(A0_6, 10)
  wait(3)
  Hide(A0_6)
  EnableComponent(A0_6, "Usable")
  if not IsInCutscene(A0_6) then
    ExitCutscene(A0_6)
  end
end
DBC_1st_ZoneA_TeleportGremlinToEntityLeft = L0_0
function L0_0(A0_8, A1_9)
  DisableComponent(A0_8, "Usable")
  EnterCutscene(A0_8, 6)
  wait(0.9)
  Hide(A0_8)
  TeleportToEntity(A0_8, A1_9, true, true)
  StartGremlinTeleportInFX(A0_8)
  wait(0.66)
  Unhide(A0_8)
  EnterCutscene(A0_8, 10)
  wait(3)
  Hide(A0_8)
  EnableComponent(A0_8, "Usable")
  if not IsInCutscene(A0_8) then
    ExitCutscene(A0_8)
  end
end
DBC_1st_ZoneA_TeleportGremlinToEntityTaunt = L0_0
function L0_0()
  DisableGuardianSystem()
  PlayerSetDripsVisible(GetPlayer(), false)
  DestroyEntity("dbc_1st_zonea_dynamic.DBC_ZoneD_Break_04 01")
  DestroyEntity("dbc_1st_zonea_dynamic.DBC_ZoneD_Break_01 01")
  StartEmitters("dbc_1st_igc.PipeParticle")
  SetSplineFollowerInitialSpeed("dbc_1st_zonea_dynamic.DBC_1st_ZoneA_Thinner_Lab 01", 500000)
  if GetGlobal("DBC_1st_ZoneA_TimMachine") + GetGlobal("DBC_1st_ZoneA_MortMachine") == 2 then
    DestroyEntity("dbc_1st_zonea_dynamic.DBC_ZoneD_Break_02 01")
    DestroyEntity("dbc_1st_gus_tut.ExitDoorTrigger 01")
    ForEachEntityInGroup(DestroyEntity, "DBC_1st_ZoneA_SplineCameraTriggers")
    DBC_1st_ZoneA_TimMachineState = 2
    DBC_1st_ZoneA_MortMachineState = 2
    MoveToEntity("dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 04")
    SetRobotArmSpotlightEntity("dbc_1st_zonea_dynamic.Robot_Arm", "dbc_1st_zonea_dynamic.DBC_SpotlightProxyA1 01")
    SetRobotArmSpotlightDisabled("dbc_1st_zonea_dynamic.Robot_Arm", true)
    RequestRobotArmElectrocute("dbc_1st_zonea_dynamic.Robot_Arm", 3, true)
    Hide("dbc_1st_zonea_dynamic.DBC_SpotlightProxyA1 01")
    DBC_ArmActive = 0
    DestroyEntity("dbc_1st_zonea_static.DBC_ZoneA_SafetyRail 01")
    StartEmitters("PanelE3")
    DestroyEntity("dbc_1st_zonea_dynamic.DBC_ZoneA_SecretDoorA1_Inert 01")
    DestroyEntity("dbc_1st_gus_tut.GusSpinAttackTrigger 01")
    AnimGBSequence("TimMachine", "3rdStage")
    AnimGBSequence("MortMachine", "3rdStage")
    ForEachEntityInGroup(StartEmitters, "ConsoleParticles")
    ForEachEntityInGroup(Disable, "dbc_1st_zonea_dynamic.RobotArmDamageVolumes")
    DBC_1st_ZoneA_OpenLabExitDoors()
    FireThread(DBC_1st_ZoneA_Music_AfterFight)
  else
    SetStayInCombatIdle(GetPlayer(), true)
    MoveToEntity("dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 02")
    Hide("dbc_1st_zonea_dynamic.DBC_ZoneA_DeadArmCollision 01")
  end
  ShowHud()
end
DBC_1st_ZoneA_LoadCheckpoint = L0_0
function L0_0(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15
  L1_11 = SetPropertyFloat
  L1_11(L2_12, L3_13, L4_14)
  L1_11 = DBC_1st_ZoneA_SetArmIdle
  L1_11(L2_12, L3_13)
  L1_11 = SetPropertyEntity
  L5_15 = L4_14()
  L1_11(L2_12, L3_13, L4_14, L5_15, L4_14())
  L1_11 = SetPropertyEntity
  L5_15 = L4_14()
  L1_11(L2_12, L3_13, L4_14, L5_15, L4_14())
  L1_11 = SetPropertyEntity
  L5_15 = L4_14()
  L1_11(L2_12, L3_13, L4_14, L5_15, L4_14())
  L1_11 = GetGlobal
  L1_11 = L1_11(L2_12)
  L1_11 = L1_11 + L2_12
  if L1_11 == 2 then
    L1_11 = SetRotatorMaxSpeed
    L1_11(L2_12, L3_13)
    L1_11 = SetRotatorMaxSpeed
    L1_11(L2_12, L3_13)
    L1_11 = SetPropertyEntity
    L1_11(L2_12, L3_13, L4_14)
    L1_11 = SetPropertyEntity
    L1_11(L2_12, L3_13, L4_14)
  else
    L1_11 = SetPropertyEntity
    L5_15 = L4_14()
    L1_11(L2_12, L3_13, L4_14, L5_15, L4_14())
    L1_11 = SetPropertyEntity
    L5_15 = L4_14()
    L1_11(L2_12, L3_13, L4_14, L5_15, L4_14())
  end
  L1_11 = SetRotatorMaxSpeed
  L1_11(L2_12, L3_13)
  L1_11 = SetRobotArmAttackTypeAngleInfo
  L1_11(L2_12, L3_13, L4_14)
  L1_11 = SetRobotArmAttackTypeAngleInfo
  L1_11(L2_12, L3_13, L4_14)
  L1_11 = SetRobotArmAttackTypeAngleInfo
  L1_11(L2_12, L3_13, L4_14)
  L1_11 = SetRobotArmAttackTypeAngleInfo
  L1_11(L2_12, L3_13, L4_14)
  L1_11 = SetRobotArmSpotlightEntity
  L1_11(L2_12, L3_13)
  L1_11 = 0
  for L5_15 = 0, 6 do
    SetRobotArmAttackTypeDelayInfo(A0_10, L5_15, 1.15)
  end
  for L5_15 = 10, 11 do
    SetRobotArmAttackTypeDelayInfo(A0_10, L5_15, 1.15)
  end
  for L5_15 = 7, 9 do
    SetRobotArmAttackTypeDelayInfo(A0_10, L5_15, 0)
  end
end
DBC_1st_SetupArm = L0_0
function L0_0()
  HideReticleOnly()
  if GetGlobal("DBC_1st_ZoneA_IntroCutscene") == 1 then
    return
  end
  HideHud()
  SetGlobal("MS_MeanStreetProgress", 0)
  Hide("dbc_1st_zonea_dynamic.DBC_ZoneA_DeadArmCollision 01")
  DisableGuardianSystem()
  SetLetterbox(1)
  PlayerSetDripsVisible(GetPlayer(), false)
  SetGlobal("DBC_1st_ZoneA_IntroCutscene", 1)
  StartFadeOut(0)
  SetDefaultCameraValues(5.5, 10, -7)
  DisableGuardianSystem()
  SetMap(nil, "MAP_DBC_ZONEA", "GAME")
  SetGlobal("DBC_1st_IntroCutscene", 1)
  SetGlobal("DBC_1st_ZoneA_PlayIntroMovie", 1)
  AnimEvent(GetPlayer(), EVENT_Special_5)
  Hide("dbc_1st_zonea_dynamic.DBC_SpotlightProxyA1 01")
  SetRotatorMaxSpeed("dbc_1st_zonea_dynamic.robotArm_eye 01", 0)
  SetRotatorMaxSpeed("dbc_1st_zonea_dynamic.robotArm_eyePivot 01", 0)
  StartRotateToPosition("dbc_1st_zonea_dynamic.robotArm_eye 01", 0)
  StartRotateToPosition("dbc_1st_zonea_dynamic.robotArm_eyePivot 01", -90)
  PlayAndUnlockMovie("fmv_intro.bik", "DBC_1st_IntroScene")
  SetUnlockedExtra("DBC_EndGameCutscene", false)
  AudioPostEventOn(GetPlayer(), "Play_sfx_RobotArm_Moment")
  FireThread(DBC_1st_ArmSmashColor, "dbc_1st_zonea_dynamic.Robot_Arm", "yellow")
  StartFadeInNoHUD(0.5)
  RestrictCutSceneInput()
  HideHud()
  Hide("dbc_1st_gus_tut.Gremlin_Gus 01")
  GrabCameraNif("dbc_1st_igc.DBC_lab_intro_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("dbc_1st_igc.DBC_lab_intro_cam 01")
  AnimGBSequence("dbc_1st_igc.DBC_lab_intro_cam 01", "dbc_lab_intro_cam")
end
DBC_1st_ZoneA_cutscene = L0_0
function L0_0()
  FireThread(DBC_1st_ZoneA_TeleportGremlinToEntityLeft, "dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 03")
  wait(1.2)
  FireSequence("dbc_1st_gus_tut.Gremlin_Gus 01", "DBC_1st_ZoneA_LeftSideWarning")
end
DBC_1st_ZoneA_cutscene_leftSideStart = L0_0
function L0_0()
  AnimGBSequence("dbc_1st_zonea_dynamic.DBC_ZoneD_Break_01 01", "Break", true)
  ShakeCamera_Default("camera")
  StartEmitters("dbc_1st_igc.PipeParticle")
  SetSplineFollowerInitialSpeed("dbc_1st_zonea_dynamic.DBC_1st_ZoneA_Thinner_Lab 01", 0.5)
end
DBC_1st_ZoneA_cutscene_leftSideSmash = L0_0
function L0_0()
  FireThread(DBC_1st_ZoneA_TeleportGremlinToEntityRightFirst, "dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 07")
end
DBC_1st_ZoneA_cutscene_rightSideStartTeleport1 = L0_0
function L0_0()
  FireThread(DBC_1st_ZoneA_TeleportGremlinToEntityRight, "dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 02")
end
DBC_1st_ZoneA_cutscene_rightSideStartTeleport2 = L0_0
function L0_0()
  AnimGBSequence("dbc_1st_zonea_dynamic.DBC_ZoneD_Break_04 01", "Break")
  ShakeCamera_Default("camera")
  AnimEvent(GetPlayer(), EVENT_Finished_Sequence)
  SetStayInCombatIdle(GetPlayer(), true)
end
DBC_1st_ZoneA_cutscene_rightSideSmash = L0_0
function L0_0()
  EnterCutscene(GetPlayer(), 23)
  wait(3.3333)
  AnimEvent(GetPlayer(), EVENT_Finished_Sequence)
  SetStayInCombatIdle(GetPlayer(), true)
  StartFadeOut(0.8)
  wait(0.8)
  SetLetterbox(0)
  StartFadeIn(0.8)
  DestroyEntity("dbc_1st_zonea_dynamic.DBC_ZoneD_Break_01 01")
  ShowHud()
  wait(0.05)
  HideReticleOnly()
  wait(0.5)
  UnrestrictCutSceneInput()
  FireThread(DBC_1st_ZoneA_MickeyReleaseCamera)
end
DBC_1st_ZoneA_cutscene_end = L0_0
function L0_0()
  SetRotatorMaxSpeed("dbc_1st_zonea_dynamic.robotArm_eye 01", 6000)
  SetRotatorMaxSpeed("dbc_1st_zonea_dynamic.robotArm_eyePivot 01", 6000)
  SetPropertyEntity("dbc_1st_zonea_dynamic.robotArm_eye 01", "RotateToEntity", GetPlayer())
  SetPropertyEntity("dbc_1st_zonea_dynamic.robotArm_eyePivot 01", "RotateToEntity", GetPlayer())
  Unhide("dbc_1st_zonea_dynamic.DBC_SpotlightProxyA1 01")
  DBC_1st_ZoneA_SetArmIdle(nil, 1)
  FireSequence("dbc_1st_gus_tut.Gremlin_Gus 01", "DBC_1st_Gus_Introduction")
end
DBC_1st_ZoneA_cutscene_restoreArm = L0_0
function L0_0()
  local L0_16
  L0_16 = GetPosition
  L0_16 = L0_16(GetPlayer())
  while DBC_1st_ZoneA_MickeyPosition(GetPosition(GetPlayer()), L0_16) do
    wait(0.5)
    Print("************************************* - Prefab_ProjectorMickeyMove - wait 0.5")
  end
  ReleaseCamera(CAMERA_EASING_TRANSITION, 0.5)
end
DBC_1st_ZoneA_MickeyReleaseCamera = L0_0
function L0_0(A0_17, A1_18)
  local L2_19, L3_20
  L2_19 = A0_17.x
  L3_20 = A1_18.x
  L2_19 = L2_19 == L3_20 and L2_19 == L3_20
  return L2_19
end
DBC_1st_ZoneA_MickeyPosition = L0_0
function L0_0()
  StartFadeOut(0)
  StartFadeIn(0.5)
  ShowHud()
  SetCameraAttributes("dbc_1st_zonea_offsetcam.Marker(CameraOverride) 05")
end
DBC_1st_ZoneA_startCam = L0_0
function L0_0(A0_21, A1_22)
  local L2_23
  L2_23 = "dbc_1st_zonea_dynamic.Robot_Arm"
  if DBC_ArmActive == 1 then
    SetRobotArmAttackTypeEnabled(L2_23, A1_22, true)
  end
end
DBC_1st_ZoneA_EnterArmZone = L0_0
function L0_0(A0_24, A1_25)
  local L2_26
  L2_26 = "dbc_1st_zonea_dynamic.Robot_Arm"
  SetRobotArmAttackTypeEnabled(L2_26, A1_25, false)
end
DBC_1st_ZoneA_ExitArmZone = L0_0
function L0_0(A0_27, A1_28)
  if A1_28 == "purple" then
    RequestRobotArmSmash(A0_27, -48, "dbc_1st_zonea_dynamic.DBC_ZoneD_Break_05 01", 2)
  elseif A1_28 == "green" then
    RequestRobotArmSmash(A0_27, -109, "dbc_1st_zonea_dynamic.DBC_ZoneD_Break_04 01", 1)
  elseif A1_28 == "blue" then
    RequestRobotArmSmash(A0_27, 164, "dbc_1st_zonea_dynamic.DBC_ZoneD_Break_02 01", 0)
  elseif A1_28 == "yellow" then
    RequestRobotArmSmash(A0_27, 0, "nil", 3)
  end
end
DBC_1st_ArmSmashColor = L0_0
function L0_0(A0_29, A1_30)
  if A1_30 == "Left" then
    DBC_1st_ZoneA_DontFreeGremlins("dbc_1st_zonea_dynamic.DBC_ZoneA_ArmMachineLeft", "DBC_1st_ZoneA_TimMachine", "TimBreakMachineSpawner", "DBC_1st_ZoneA_TimMachineState", "LeftMachineParticle2")
  elseif A1_30 == "Right" then
    DBC_1st_ZoneA_DontFreeGremlins("dbc_1st_zonea_dynamic.DBC_ZoneA_ArmMachineRight", "DBC_1st_ZoneA_MortMachine", "MortBreakMachineSpawner", "DBC_1st_ZoneA_MortMachineState", "RightMachineParticle2")
  end
end
DBC_1st_ZoneA_DontFreeGremlinsCall = L0_0
function L0_0(A0_31, A1_32, A2_33, A3_34, A4_35)
  if _G[A3_34] == 0 then
    _G[A3_34] = 1
    AnimGBSequence(A0_31, "1stStage")
    AudioPostEventOn(A0_31, "Play_sfx_DBC_Lab_Arm_Machine_On")
    FireSequence("dbc_1st_gus_tut.Gremlin_Gus 01", "DBC_1st_ZoneA_Machine2ndWarning")
  elseif _G[A3_34] == 1 then
    _G[A3_34] = 2
    ForEachEntityInGroup(StartEmitters, A4_35)
    SetGlobal(A1_32, 1)
    if GetGlobal("DBC_1st_ZoneA_TimMachine") + GetGlobal("DBC_1st_ZoneA_MortMachine") == 1 then
      RestrictCutSceneInput()
      AnimGBSequence(A0_31, "2ndStage")
      AudioPostEventOn(A0_31, "Play_sfx_DBC_Lab_Arm_Machine_Damaged")
      wait(1)
      StartFadeOut(0.8)
      wait(0.8)
      HideHud()
      SetLetterbox(1)
      Disable("dbc_1st_zonea_offsetcam.TriggerRotate 01")
      SetPropertyFloat("dbc_1st_gus_tut.Gremlin_Gus 01", "UsableRadius", 0)
      StartFadeInNoHUD(0.8)
      if A3_34 == "DBC_1st_ZoneA_TimMachineState" then
        TeleportToEntity(GetPlayer(), "dbc_1st_igc.MickeySpinMarker 02")
        GrabCameraNif("dbc_1st_igc.DBC_visit1_lab_robotArm_electrocutionCamera_left 01", nil, CAMERA_LERP_TRANSITION, 0)
        AnimGBReset("dbc_1st_igc.DBC_visit1_lab_robotArm_electrocutionCamera_left 01")
        AnimGBSequence("dbc_1st_igc.DBC_visit1_lab_robotArm_electrocutionCamera_left 01", "RobotArmTransCam")
      elseif A3_34 == "DBC_1st_ZoneA_MortMachineState" then
        TeleportToEntity(GetPlayer(), "dbc_1st_zonea_dynamic.MickeySpinMarker 01")
        GrabCameraNif("dbc_1st_igc.DBC_visit1_lab_robotArm_electrocutionCamera_right 01", nil, CAMERA_LERP_TRANSITION, 0)
        AnimGBReset("dbc_1st_igc.DBC_visit1_lab_robotArm_electrocutionCamera_right 01")
        AnimGBSequence("dbc_1st_igc.DBC_visit1_lab_robotArm_electrocutionCamera_right 01", "RobotArmElectroCam")
      end
      StartEmitters("Arm_EffectG" .. GetGlobal("DBC_1st_ZoneA_TimMachine") + GetGlobal("DBC_1st_ZoneA_MortMachine"))
      AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_Evnt_RobotArm_Damage")
      RequestRobotArmElectrocute("dbc_1st_zonea_dynamic.Robot_Arm", 0, false)
      wait(1)
      AnimGBSequence(A0_31, "3rdStage")
      wait(7.667)
      StartFadeOut(0.8)
      wait(0.8)
      Enable("dbc_1st_zonea_offsetcam.TriggerRotate 01")
      SetPropertyFloat("dbc_1st_gus_tut.Gremlin_Gus 01", "UsableRadius", 2)
      StartFadeInNoHUD(0.8)
      SetLetterbox(0)
      UnrestrictCutSceneInput()
      DBC_1st_ZoneA_ReturnToFirstmachine()
    elseif GetGlobal("DBC_1st_ZoneA_TimMachine") + GetGlobal("DBC_1st_ZoneA_MortMachine") == 2 then
      Unhide("dbc_1st_zonea_dynamic.DBC_ZoneA_DeadArmCollision 01")
      RestrictCutSceneInput()
      DestroyEntity("dbc_1st_zonea_static.DBC_ZoneA_SafetyRail 01")
      ForEachEntityInGroup(Disable, "dbc_1st_zonea_dynamic.RobotArmDamageVolumes")
      AnimGBSequence(A0_31, "2ndStage")
      if A3_34 == "DBC_1st_ZoneA_TimMachineState" then
        DestroyEntity("dbc_1st_gus_tut.ExitDoorTrigger 01")
      end
      wait(1)
      StartFadeOut(0.8)
      wait(0.8)
      HideHud()
      SetLetterbox(1)
      Disable("dbc_1st_zonea_offsetcam.TriggerRotate 01")
      SetPropertyFloat("dbc_1st_gus_tut.Gremlin_Gus 01", "UsableRadius", 0)
      StartFadeInNoHUD(0.8)
      DBC_1st_ZoneA_CurrentMachine = A3_34
      if A3_34 == "DBC_1st_ZoneA_TimMachineState" then
        TeleportToEntity(GetPlayer(), "dbc_1st_igc.MickeySpinMarker 02")
        GrabCameraNif("dbc_1st_igc.DBC_visit1_lab_robotArm_death_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
        AnimGBReset("dbc_1st_igc.DBC_visit1_lab_robotArm_death_cam 01")
        AnimGBSequence("dbc_1st_igc.DBC_visit1_lab_robotArm_death_cam 01", "death")
      elseif A3_34 == "DBC_1st_ZoneA_MortMachineState" then
        TeleportToEntity(GetPlayer(), "dbc_1st_zonea_dynamic.MickeySpinMarker 01")
        GrabCameraNif("dbc_1st_igc.DBC_visit1_lab_robotArm_death_cam_right 01", nil, CAMERA_LERP_TRANSITION, 0)
        AnimGBReset("dbc_1st_igc.DBC_visit1_lab_robotArm_death_cam_right 01")
        AnimGBSequence("dbc_1st_igc.DBC_visit1_lab_robotArm_death_cam_right 01", "death")
      end
      AnimGBSequence(A0_31, "3rdStage")
      AudioPostEventOn(A0_31, "Play_sfx_DBC_Lab_Arm_Machine_Damaged")
      StartEmitters("Arm_EffectG" .. GetGlobal("DBC_1st_ZoneA_TimMachine") + GetGlobal("DBC_1st_ZoneA_MortMachine"))
      AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_Evnt_RobotArm_ShutDown")
      RequestRobotArmElectrocute("dbc_1st_zonea_dynamic.Robot_Arm", 1, true)
      SetRotatorMaxSpeed("dbc_1st_zonea_dynamic.Robot_Arm", 0)
      SetPropertyEntity("dbc_1st_zonea_dynamic.robotArm_eye 01", "RotateToEntity", "dbc_1st_gus_tut.Marker(Rotatable) 20")
      SetPropertyEntity("dbc_1st_zonea_dynamic.robotArm_eyePivot 01", "RotateToEntity", "dbc_1st_gus_tut.Marker(Rotatable) 20")
      DBC_ArmActive = 0
      Hide("dbc_1st_zonea_dynamic.DBC_SpotlightProxyA1 01")
      SetRotatorMaxSpeed("dbc_1st_zonea_dynamic.Robot_Arm", 0)
      DestroyEntity("dbc_1st_zonea_dynamic.DBC_SpotlightProxyA1 01")
      wait(8.667)
      FireThread(DBC_1st_ZoneA_Music_AfterFight)
      FireSequence("dbc_1st_gus_tut.Gremlin_Gus 01", "DBC_1st_ZoneA_HiddenRoom")
      StartEmitters("PanelE3")
      AnimGBSequence("dbc_1st_zonea_dynamic.DBC_ZoneA_SecretDoorA1_Inert 01", "Open")
      wait(6)
      DestroyEntity("dbc_1st_zonea_dynamic.DBC_ZoneA_SecretDoorA1_Inert 01")
      SetStayInCombatIdle(GetPlayer(), false)
    end
  end
end
DBC_1st_ZoneA_DontFreeGremlins = L0_0
function L0_0()
  if DBC_1st_ZoneA_CurrentMachine == "DBC_1st_ZoneA_TimMachineState" then
    FireUser1("LeftMachineGusExitCamera")
  elseif DBC_1st_ZoneA_CurrentMachine == "DBC_1st_ZoneA_MortMachineState" then
    FireUser1("RightMachineGusExitCamera")
  end
  wait(0.3)
  TeleportGremlinToEntity("dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 04")
  wait(0.7)
  if DBC_1st_ZoneA_CurrentMachine == "DBC_1st_ZoneA_TimMachineState" then
    MoveToEntity(GetPlayer(), "dbc_1st_igc.MickeySpinMarker 02")
  elseif DBC_1st_ZoneA_CurrentMachine == "DBC_1st_ZoneA_MortMachineState" then
    MoveToEntity(GetPlayer(), "dbc_1st_zonea_dynamic.MickeySpinMarker 01")
  end
  DBC_1st_ZoneA_OpenLabExitDoors()
  FireSequence("dbc_1st_gus_tut.Gremlin_Gus 01", "DBC_1st_Gus_LabWrapup")
  SetRotatorMaxSpeed("dbc_1st_zonea_dynamic.robotArm_eye 01", 0)
  SetRotatorMaxSpeed("dbc_1st_zonea_dynamic.robotArm_eyePivot 01", 0)
  SetPropertyEntity("dbc_1st_zonea_dynamic.robotArm_eye 01", "RotateToEntity", nil)
  SetPropertyEntity("dbc_1st_zonea_dynamic.robotArm_eyePivot 01", "RotateToEntity", nil)
end
DBC_1st_ZoneA_SecondCameraAfterBreak = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.8)
  if DBC_1st_ZoneA_CurrentMachine == "DBC_1st_ZoneA_TimMachineState" then
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
    SetCameraAttributes("dbc_1st_igc.LeftMachineEndingCameraOverride 01")
    SaveCurrentCameraOverride()
    LoadSavedCameraOverride()
    FireThread(DBC_1st_ZoneA_LeftBreakReturnCamera)
  elseif DBC_1st_ZoneA_CurrentMachine == "DBC_1st_ZoneA_MortMachineState" then
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
    SetCameraAttributes("dbc_1st_igc.RightMachineEndingCameraOverride 01")
    SaveCurrentCameraOverride()
    LoadSavedCameraOverride()
    FireThread(DBC_1st_ZoneA_RightBreakReturnCamera)
  end
  wait(0.3)
  StartFadeIn(0.8)
  ShowHud()
  UnrestrictCutSceneInput()
  wait(0.05)
  HideReticleOnly()
end
DBC_1st_ZoneA_FinalCameraChoose = L0_0
function L0_0()
  ForEachEntityInGroup(Disable, "DBC_1st_ZoneA_SplineCameraTriggers")
end
DBC_1st_ZoneA_DisableCameraTriggers = L0_0
function L0_0()
  if GetGlobal("DBC_1st_ZoneA_MortMachine") == 0 then
    DestroyEntity("dbc_1st_gus_tut.ExitDoorTrigger 01")
    FireUser1("LeftMachineCamera")
    FireThread(TeleportGremlinToEntity, "dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 05")
    Hide("WallBanner")
    wait(1)
    FireThread(TeleportGremlinToEntity, "dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 02")
    FireSequence("dbc_1st_gus_tut.Gremlin_Gus 01", "DBC_1st_ZoneA_BackToFirstMachine")
  else
    DBC_1st_ZoneA_ReturnToSplineCamera()
  end
end
DBC_1st_ZoneA_ReturnToFirstmachine = L0_0
function L0_0(A0_36, A1_37)
  local L2_38
  L2_38 = "dbc_1st_zonea_dynamic.Robot_Arm"
  RequestRobotArmChangeIdle(L2_38, A1_37)
end
DBC_1st_ZoneA_SetArmIdle = L0_0
function L0_0()
  local L0_39
  L0_39 = SaveCheckpoint
  L0_39(nil, "DBC_1st_ZoneA_LoadCheckpoint", "dbc_1st_zonea_dynamic.MickeyStartPositionMarker 01")
  L0_39 = GetPosition
  L0_39 = L0_39(GetPlayer())
  while DBC_1st_ZoneA_MickeyPosition(GetPosition(GetPlayer()), L0_39) do
    wait(0.5)
    Print("************************************* - Prefab_ProjectorMickeyMove - wait 0.5")
  end
  SetCameraAttributes("dbc_1st_igc.NoLedgeCameraOverride 01")
  ForEachEntityInGroup(DestroyEntity, "DBC_1st_ZoneA_SplineCameraTriggers")
  SetPropertyFloat("dbc_1st_gus_tut.Gremlin_Gus 01", "UsableRadius", 0)
end
DBC_1st_ZoneA_LeftBreakReturnCamera = L0_0
function L0_0()
  local L0_40
  L0_40 = SaveCheckpoint
  L0_40(nil, "DBC_1st_ZoneA_LoadCheckpoint", "dbc_1st_zonea_dynamic.MickeyStartPositionMarker 01")
  L0_40 = GetPosition
  L0_40 = L0_40(GetPlayer())
  while DBC_1st_ZoneA_MickeyPosition(GetPosition(GetPlayer()), L0_40) do
    wait(0.5)
    Print("************************************* - Prefab_ProjectorMickeyMove - wait 0.5")
  end
  SetCameraAttributes("dbc_1st_igc.NoLedgeCameraOverride 01")
  ForEachEntityInGroup(DestroyEntity, "DBC_1st_ZoneA_SplineCameraTriggers")
  SetPropertyFloat("dbc_1st_gus_tut.Gremlin_Gus 01", "UsableRadius", 0)
end
DBC_1st_ZoneA_RightBreakReturnCamera = L0_0
function L0_0()
  ClearAllCameraAttributesTimed(1)
end
DBC_1st_NearMachineCameraRelease = L0_0
function L0_0()
  SetCameraAttributes("dbc_1st_zonea_offsetcam.SplineCameraOverride 02")
  Unhide("WallBanner")
  wait(1)
  ShowHud()
  wait(0.05)
  HideReticleOnly()
  Enable("dbc_1st_zonea_offsetcam.TriggerRotate 01")
  SetCameraAttributes("dbc_1st_zonea_offsetcam.SplineCameraOverride 01")
  HideReticleOnly()
end
DBC_1st_ZoneA_ReturnToSplineCamera = L0_0
function L0_0()
  AnimGBSequence("dbc_1st_zoneb_dynamic.DBC_ZoneE_LabDoor01 01", "Open")
  AudioPostEventOn("dbc_1st_zonea_audio.Sound_Marker_HallDoor 01", "Play_sfx_DBC_Evnt_HallDoor_Open")
end
DBC_1st_ZoneA_OpenLabExitDoors = L0_0
function L0_0()
  AnimGBSequence("dbc_1st_zoneb_dynamic.DBC_ZoneE_LabDoor01 01", "Closed")
  AudioPostEventOn("dbc_1st_zonea_audio.Sound_Marker_HallDoor 01", "Play_sfx_DBC_Evnt_HallDoor_Close")
end
DBC_1st_ZoneA_CloseLabExitDoors = L0_0
function L0_0(A0_41)
  FireThread(Prefab_GrabCameraFancy, A0_41)
  DBC_1st_ArmSmashColor("dbc_1st_zonea_dynamic.Robot_Arm", "purple")
end
DBC_1st_ZoneA_PurpleSmashCutscene = L0_0
function L0_0(A0_42, A1_43, A2_44)
  local L3_45, L4_46, L5_47, L6_48, L7_49, L8_50
  if A1_43 == "in" then
    L3_45 = "dbc_1st_zonea_dynamic.Robot_Arm"
    L4_46 = SetRobotArmSpotlightDisabled
    L4_46(L5_47, L6_48)
    L4_46 = DBC_1st_ZoneA_SetArmIdle
    L4_46(L5_47, L6_48)
    L4_46 = 0
    for L8_50 = 7, 9 do
      SetRobotArmAttackTypeAngleInfo(L3_45, L8_50, A2_44)
      SetRobotArmAttackTypeEnabled(L3_45, L8_50, true)
    end
  elseif A1_43 == "out" then
    L3_45 = "dbc_1st_zonea_dynamic.Robot_Arm"
    L4_46 = SetRobotArmSpotlightDisabled
    L4_46(L5_47, L6_48)
    L4_46 = DBC_1st_ZoneA_SetArmIdle
    L4_46(L5_47, L6_48)
    L4_46 = 0
    for L8_50 = 7, 9 do
      SetRobotArmAttackTypeEnabled(L3_45, L8_50, false)
    end
  end
end
DBC_1st_ZoneA_ArmLookAroundMachine = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("DBC_1st_ZoneA")
end
DBC_1st_ZoneA_EndLevelTracking = L0_0
function L0_0()
  RestrictCutSceneInput()
  StartFadeOut(0.5)
  wait(0.5)
  SetLetterbox(1)
  SetPropertyEntity("dbc_1st_zonea_dynamic.robotArm_eye 01", "RotateToEntity", nil)
  SetPropertyEntity("dbc_1st_zonea_dynamic.robotArm_eyePivot 01", "RotateToEntity", nil)
  StartRotateToPosition("dbc_1st_zonea_dynamic.robotArm_eye 01", 0)
  StartRotateToPosition("dbc_1st_zonea_dynamic.robotArm_eyePivot 01", -90)
  MoveToEntity(GetPlayer(), "dbc_1st_zonea_dynamic.MickeySpinMarker 01", false, true)
  wait(0.5)
  StartFadeInNoHUD()
  GrabCameraNif("dbc_1st_igc.DBC_visit1_lab_robotArm_transCam 01", nil, CAMERA_EASING_TRANSITION, 0)
  FireSequence("dbc_1st_gus_tut.Gremlin_Gus 01", "DBC_1st_spinning")
end
DBC_1st_ZoneA_GusMachineIntro = L0_0
function L0_0()
  StartFadeOut(0.5)
  wait(0.5)
  DBC_1st_ZoneA_GusDefault()
  SetLetterbox(0)
  StartFadeIn(0.5)
  DBC_1st_ZoneA_ReturnToSplineCamera()
  wait(0.5)
  UnrestrictCutSceneInput()
  SetPropertyEntity("dbc_1st_zonea_dynamic.robotArm_eye 01", "RotateToEntity", GetPlayer())
  SetPropertyEntity("dbc_1st_zonea_dynamic.robotArm_eyePivot 01", "RotateToEntity", GetPlayer())
  SetPropertyFloat("dbc_1st_gus_tut.Gremlin_Gus 01", "UsableRadius", 2)
  DBC_1st_ZoneA_GusIntro_Played = 1
  ShowHud()
end
DBC_1st_ZoneA_GusMachineIntro_end = L0_0
function L0_0()
  EnterCutscene("dbc_1st_gus_tut.Gremlin_Gus 01", 102)
end
DBC_1st_ZoneA_GusTalk = L0_0
function L0_0()
  EnterCutscene("dbc_1st_gus_tut.Gremlin_Gus 01", 99)
end
DBC_1st_ZoneA_GusBeckon = L0_0
function L0_0()
  ExitCutscene("dbc_1st_gus_tut.Gremlin_Gus 01")
  AnimEvent("dbc_1st_gus_tut.Gremlin_Gus 01", EVENT_Force_Idle)
end
DBC_1st_ZoneA_GusDefault = L0_0
function L0_0()
  if DBC_1st_ZoneA_GusIntro_Played == 0 then
    EnterCutscene("dbc_1st_gus_tut.Gremlin_Gus 01", 23)
  end
end
DBC_1st_ZoneA_GusBeckon2 = L0_0
function L0_0()
  if GetGlobal("DBC_1st_ZoneA_TimMachine") + GetGlobal("DBC_1st_ZoneA_MortMachine") == 2 then
    EnterCutscene("dbc_1st_gus_tut.Gremlin_Gus 01", 103)
  end
end
DBC_1st_ZoneA_GusBeckon3 = L0_0
function L0_0()
  FireThread(DBC_1st_ZoneA_TeleportGremlinToEntityTaunt, "dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 08")
end
DBC_1st_ZoneA_GusBridgeTeleport = L0_0
function L0_0()
  FireThread(DBC_1st_ZoneA_TeleportGremlinToEntityRight, "dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 01")
end
DBC_1st_ZoneA_GusLeftMachineTeleport = L0_0
function L0_0()
  local L0_51, L1_52
end
DBC_1st_ZoneA_SpotlightOff = L0_0
function L0_0()
  local L0_53, L1_54
end
DBC_1st_ZoneA_SpotlightWhite = L0_0
function L0_0()
  local L0_55, L1_56
end
DBC_1st_ZoneA_SpotlightRed = L0_0
function L0_0()
  local L0_57, L1_58
  L0_57 = MoveToEntity
  L1_58 = "dbc_1st_zonea_dynamic.Ability_SpinAttack 02"
  L0_57(L1_58, GetPlayer())
end
DBC_1st_ZoneA_GiveMickeySpin = L0_0
function L0_0()
  RestrictCutSceneInput()
  wait(0.1)
  HideReticleOnly()
  SaveCheckpoint(nil, "DBC_1st_ZoneA_LoadCheckpoint", "dbc_1st_zonea_dynamic.MickeyStartPositionMarker 01")
  wait(4)
  UnrestrictCutSceneInput()
  FireSequence("dbc_1st_gus_tut.Gremlin_Gus 01", "DBC_1st_ZoneC_FirstPin")
end
DBC_1st_ZoneA_RedChestEndFunction = L0_0
function L0_0()
  SetRobotArmSpotlightDisabled("dbc_1st_zonea_dynamic.Robot_Arm", false)
end
DBC_1st_ZoneA_RobotLightOn = L0_0
function L0_0()
  SetRobotArmSpotlightDisabled("dbc_1st_zonea_dynamic.Robot_Arm", true)
end
DBC_1st_ZoneA_RobotLightOff = L0_0
function L0_0()
  SaveCheckpoint(nil, "DBC_1st_ZoneA_LoadCheckpoint", "dbc_1st_zonea_dynamic.MickeyStartPositionMarker 01")
end
DBC_1st_SaveConceptArt = L0_0
function L0_0(A0_59, A1_60)
  SetGlobal(A1_60, 1)
end
DBC_1st_ZoneA_BreakMachineGlobal = L0_0
function L0_0(A0_61, A1_62)
  if GetGlobal(A1_62) == 1 then
    DestroyEntity(A0_61)
  end
end
DBC_1st_ZoneA_BreakMachineGlobalCheck = L0_0
L0_0 = 0
musicStage = L0_0
function L0_0()
  if musicStage == 0 then
    wait(2)
    musicStage = 1
    Print("<<<<<< Now stopping visit 1 DBC Music")
    AudioPostEventOn(GetPlayer(), "Stop_music_darkbeautycastle_Visit1")
    wait(3)
    Print("<<<<<< Now playing regular DBC Music")
    AudioSetState(GetPlayer(), "Music_State", "Auto")
    AudioPostEventOn(GetPlayer(), "Play_music_darkbeautycastle")
  end
end
DBC_1st_ZoneA_Music_AfterFight = L0_0
