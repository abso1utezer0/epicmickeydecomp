-- Fully reworked

DBC_1st_ZoneA_TimMachineState = 0
DBC_1st_ZoneA_MortMachineState = 0
DBC_ArmActive = 1
DBC_1st_ZoneA_CurrentMachine = "none"
DBC_1st_ZoneA_GusIntro_Played = 0

function DBC_1st_ZoneA_TeleportGremlinToEntityRight(param1, param2)
  DisableComponent(param1, "Usable")
  TeleportToEntity(param1, param2, true, true)
  StartGremlinTeleportInFX(param1)
  wait(0.66)
  Unhide(param1)
  EnterCutscene(param1, 5)
  wait(3)
  EnableComponent(param1, "Usable")
  if not IsInCutscene(param1) then
    ExitCutscene(param1)
  end
end

function DBC_1st_ZoneA_TeleportGremlinToEntityRightFirst(param1, param2)
  DisableComponent(param1, "Usable")
  TeleportToEntity(param1, param2, true, true)
  StartGremlinTeleportInFX(param1)
  wait(0.66)
  Unhide(param1)
  EnterCutscene(param1, 11)
  wait(2)
  Hide(param1)
  EnableComponent(param1, "Usable")
  if not IsInCutscene(param1) then
    ExitCutscene(param1)
  end
end

function DBC_1st_ZoneA_TeleportGremlinToEntityLeft(param1, param2)
  DisableComponent(param1, "Usable")
  TeleportToEntity(param1, param2, true, true)
  StartGremlinTeleportInFX(param1)
  wait(0.66)
  Unhide(param1)
  EnterCutscene(param1, 10)
  wait(3)
  Hide(param1)
  EnableComponent(param1, "Usable")
  if not IsInCutscene(param1) then
    ExitCutscene(param1)
  end
end

function DBC_1st_ZoneA_TeleportGremlinToEntityTaunt(param1, param2)
  DisableComponent(param1, "Usable")
  EnterCutscene(param1, 6)
  wait(0.9)
  Hide(param1)
  TeleportToEntity(param1, param2, true, true)
  StartGremlinTeleportInFX(param1)
  wait(0.66)
  Unhide(param1)
  EnterCutscene(param1, 10)
  wait(3)
  Hide(param1)
  EnableComponent(param1, "Usable")
  if not IsInCutscene(param1) then
    ExitCutscene(param1)
  end
end

function DBC_1st_ZoneA_LoadCheckpoint()
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

function DBC_1st_SetupArm(param1)

  local var1, var2, var3, var4, var5
  var5 = var4()
  SetPropertyFloat(var2, var3, var4)
  DBC_1st_ZoneA_SetArmIdle(var2, var3)
  SetPropertyEntity(var2, var3, var4, var5, var4())
  SetPropertyEntity(var2, var3, var4, var5, var4())
  SetPropertyEntity1(var2, var3, var4, var5, var4())

  if GetGlobal(var2) + var2 == 2 then
    
    SetRotatorMaxSpeed(var2, var3)
    SetRotatorMaxSpeed(var2, var3)
    SetPropertyEntity(var2, var3, var4)
    SetPropertyEntity(var2, var3, var4)

  else

    SetPropertyEntity(var2, var3, var4, var5, var4())
    SetPropertyEntity(var2, var3, var4, var5, var4())

  end

  SetRotatorMaxSpeed(var2, var3)
  SetRobotArmAttackTypeAngleInfo(var2, var3, var4)
  SetRobotArmAttackTypeAngleInfo(var2, var3, var4)
  SetRobotArmAttackTypeAngleInfo(var2, var3, var4)
  SetRobotArmAttackTypeAngleInfo(var2, var3, var4)
  SetRobotArmSpotlightEntity(var2, var3)
  var1 = 0

  for var5 = 0, 6 do
    SetRobotArmAttackTypeDelayInfo(param1, var5, 1.15)
  end
  for var5 = 10, 11 do
    SetRobotArmAttackTypeDelayInfo(param1, var5, 1.15)
  end
  for var5 = 7, 9 do
    SetRobotArmAttackTypeDelayInfo(param1, var5, 0)
  end
end

function DBC_1st_ZoneA_cutscene()
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

function DBC_1st_ZoneA_cutscene_leftSideStart()
  FireThread(DBC_1st_ZoneA_TeleportGremlinToEntityLeft, "dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 03")
  wait(1.2)
  FireSequence("dbc_1st_gus_tut.Gremlin_Gus 01", "DBC_1st_ZoneA_LeftSideWarning")
end

function DBC_1st_ZoneA_cutscene_leftSideSmash()
  AnimGBSequence("dbc_1st_zonea_dynamic.DBC_ZoneD_Break_01 01", "Break", true)
  ShakeCamera_Default("camera")
  StartEmitters("dbc_1st_igc.PipeParticle")
  SetSplineFollowerInitialSpeed("dbc_1st_zonea_dynamic.DBC_1st_ZoneA_Thinner_Lab 01", 0.5)
end

function DBC_1st_ZoneA_cutscene_rightSideStartTeleport1()
  FireThread(DBC_1st_ZoneA_TeleportGremlinToEntityRightFirst, "dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 07")
end

function DBC_1st_ZoneA_cutscene_rightSideStartTeleport2()
  FireThread(DBC_1st_ZoneA_TeleportGremlinToEntityRight, "dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 02")
end

function DBC_1st_ZoneA_cutscene_rightSideSmash()
  AnimGBSequence("dbc_1st_zonea_dynamic.DBC_ZoneD_Break_04 01", "Break")
  ShakeCamera_Default("camera")
  AnimEvent(GetPlayer(), EVENT_Finished_Sequence)
  SetStayInCombatIdle(GetPlayer(), true)
end

function DBC_1st_ZoneA_cutscene_end()
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

function DBC_1st_ZoneA_cutscene_restoreArm()
  SetRotatorMaxSpeed("dbc_1st_zonea_dynamic.robotArm_eye 01", 6000)
  SetRotatorMaxSpeed("dbc_1st_zonea_dynamic.robotArm_eyePivot 01", 6000)
  SetPropertyEntity("dbc_1st_zonea_dynamic.robotArm_eye 01", "RotateToEntity", GetPlayer())
  SetPropertyEntity("dbc_1st_zonea_dynamic.robotArm_eyePivot 01", "RotateToEntity", GetPlayer())
  Unhide("dbc_1st_zonea_dynamic.DBC_SpotlightProxyA1 01")
  DBC_1st_ZoneA_SetArmIdle(nil, 1)
  FireSequence("dbc_1st_gus_tut.Gremlin_Gus 01", "DBC_1st_Gus_Introduction")
end

function DBC_1st_ZoneA_MickeyReleaseCamera()
  while DBC_1st_ZoneA_MickeyPosition(GetPosition(GetPlayer()), GetPosition(GetPlayer())) do
    wait(0.5)
    Print("************************************* - Prefab_ProjectorMickeyMove - wait 0.5")
  end
  ReleaseCamera(CAMERA_EASING_TRANSITION, 0.5)
end

function DBC_1st_ZoneA_MickeyPosition(param1, param2)
  local var1, var2
  var1 = param1.x
  var2 = param2.x
  var1 = var1 == var2 and var1 == var2
  return var1
end

function DBC_1st_ZoneA_startCam()
  StartFadeOut(0)
  StartFadeIn(0.5)
  ShowHud()
  SetCameraAttributes("dbc_1st_zonea_offsetcam.Marker(CameraOverride) 05")
end

function DBC_1st_ZoneA_EnterArmZone(param1, param2)
  if DBC_ArmActive == 1 then
    SetRobotArmAttackTypeEnabled("dbc_1st_zonea_dynamic.Robot_Arm", param2, true)
  end
end

function DBC_1st_ZoneA_ExitArmZone(param1, param2)
  SetRobotArmAttackTypeEnabled("dbc_1st_zonea_dynamic.Robot_Arm", param2, false)
end

function DBC_1st_ArmSmashColor(param1, param2)
  if param2 == "purple" then
    RequestRobotArmSmash(param1, -48, "dbc_1st_zonea_dynamic.DBC_ZoneD_Break_05 01", 2)
  elseif param2 == "green" then
    RequestRobotArmSmash(param1, -109, "dbc_1st_zonea_dynamic.DBC_ZoneD_Break_04 01", 1)
  elseif param2 == "blue" then
    RequestRobotArmSmash(param1, 164, "dbc_1st_zonea_dynamic.DBC_ZoneD_Break_02 01", 0)
  elseif param2 == "yellow" then
    RequestRobotArmSmash(param1, 0, "nil", 3)
  end
end

function DBC_1st_ZoneA_DontFreeGremlinsCall(param1, param2)
  if param2 == "Left" then
    DBC_1st_ZoneA_DontFreeGremlins("dbc_1st_zonea_dynamic.DBC_ZoneA_ArmMachineLeft", "DBC_1st_ZoneA_TimMachine", "TimBreakMachineSpawner", "DBC_1st_ZoneA_TimMachineState", "LeftMachineParticle2")
  elseif param2 == "Right" then
    DBC_1st_ZoneA_DontFreeGremlins("dbc_1st_zonea_dynamic.DBC_ZoneA_ArmMachineRight", "DBC_1st_ZoneA_MortMachine", "MortBreakMachineSpawner", "DBC_1st_ZoneA_MortMachineState", "RightMachineParticle2")
  end
end

function DBC_1st_ZoneA_DontFreeGremlins(param1, param2, param3, param4, param5)
  if _G[param4] == 0 then
    _G[param4] = 1
    AnimGBSequence(param1, "1stStage")
    AudioPostEventOn(param1, "Play_sfx_DBC_Lab_Arm_Machine_On")
    FireSequence("dbc_1st_gus_tut.Gremlin_Gus 01", "DBC_1st_ZoneA_Machine2ndWarning")
  elseif _G[param4] == 1 then
    _G[param4] = 2
    ForEachEntityInGroup(StartEmitters, param5)
    SetGlobal(param2, 1)
    if GetGlobal("DBC_1st_ZoneA_TimMachine") + GetGlobal("DBC_1st_ZoneA_MortMachine") == 1 then
      RestrictCutSceneInput()
      AnimGBSequence(param1, "2ndStage")
      AudioPostEventOn(param1, "Play_sfx_DBC_Lab_Arm_Machine_Damaged")
      wait(1)
      StartFadeOut(0.8)
      wait(0.8)
      HideHud()
      SetLetterbox(1)
      Disable("dbc_1st_zonea_offsetcam.TriggerRotate 01")
      SetPropertyFloat("dbc_1st_gus_tut.Gremlin_Gus 01", "UsableRadius", 0)
      StartFadeInNoHUD(0.8)
      if param4 == "DBC_1st_ZoneA_TimMachineState" then
        TeleportToEntity(GetPlayer(), "dbc_1st_igc.MickeySpinMarker 02")
        GrabCameraNif("dbc_1st_igc.DBC_visit1_lab_robotArm_electrocutionCamera_left 01", nil, CAMERA_LERP_TRANSITION, 0)
        AnimGBReset("dbc_1st_igc.DBC_visit1_lab_robotArm_electrocutionCamera_left 01")
        AnimGBSequence("dbc_1st_igc.DBC_visit1_lab_robotArm_electrocutionCamera_left 01", "RobotArmTransCam")
      elseif param4 == "DBC_1st_ZoneA_MortMachineState" then
        TeleportToEntity(GetPlayer(), "dbc_1st_zonea_dynamic.MickeySpinMarker 01")
        GrabCameraNif("dbc_1st_igc.DBC_visit1_lab_robotArm_electrocutionCamera_right 01", nil, CAMERA_LERP_TRANSITION, 0)
        AnimGBReset("dbc_1st_igc.DBC_visit1_lab_robotArm_electrocutionCamera_right 01")
        AnimGBSequence("dbc_1st_igc.DBC_visit1_lab_robotArm_electrocutionCamera_right 01", "RobotArmElectroCam")
      end
      StartEmitters("Arm_EffectG" .. GetGlobal("DBC_1st_ZoneA_TimMachine") + GetGlobal("DBC_1st_ZoneA_MortMachine"))
      AudioPostEventOn(GetPlayer(), "Play_sfx_DBC_Evnt_RobotArm_Damage")
      RequestRobotArmElectrocute("dbc_1st_zonea_dynamic.Robot_Arm", 0, false)
      wait(1)
      AnimGBSequence(param1, "3rdStage")
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
      AnimGBSequence(param1, "2ndStage")
      if param4 == "DBC_1st_ZoneA_TimMachineState" then
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
      DBC_1st_ZoneA_CurrentMachine = param4
      if param4 == "DBC_1st_ZoneA_TimMachineState" then
        TeleportToEntity(GetPlayer(), "dbc_1st_igc.MickeySpinMarker 02")
        GrabCameraNif("dbc_1st_igc.DBC_visit1_lab_robotArm_death_cam 01", nil, CAMERA_LERP_TRANSITION, 0)
        AnimGBReset("dbc_1st_igc.DBC_visit1_lab_robotArm_death_cam 01")
        AnimGBSequence("dbc_1st_igc.DBC_visit1_lab_robotArm_death_cam 01", "death")
      elseif param4 == "DBC_1st_ZoneA_MortMachineState" then
        TeleportToEntity(GetPlayer(), "dbc_1st_zonea_dynamic.MickeySpinMarker 01")
        GrabCameraNif("dbc_1st_igc.DBC_visit1_lab_robotArm_death_cam_right 01", nil, CAMERA_LERP_TRANSITION, 0)
        AnimGBReset("dbc_1st_igc.DBC_visit1_lab_robotArm_death_cam_right 01")
        AnimGBSequence("dbc_1st_igc.DBC_visit1_lab_robotArm_death_cam_right 01", "death")
      end
      AnimGBSequence(param1, "3rdStage")
      AudioPostEventOn(param1, "Play_sfx_DBC_Lab_Arm_Machine_Damaged")
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

function DBC_1st_ZoneA_SecondCameraAfterBreak()
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

function DBC_1st_ZoneA_FinalCameraChoose()
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

function DBC_1st_ZoneA_DisableCameraTriggers()
  ForEachEntityInGroup(Disable, "DBC_1st_ZoneA_SplineCameraTriggers")
end

function DBC_1st_ZoneA_ReturnToFirstmachine()
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

function DBC_1st_ZoneA_SetArmIdle(param1, param2)
  RequestRobotArmChangeIdle("dbc_1st_zonea_dynamic.Robot_Arm", param2)
end

function DBC_1st_ZoneA_LeftBreakReturnCamera()
  SaveCheckpoint(nil, "DBC_1st_ZoneA_LoadCheckpoint", "dbc_1st_zonea_dynamic.MickeyStartPositionMarker 01")
  while DBC_1st_ZoneA_MickeyPosition(GetPosition(GetPlayer()), GetPosition(GetPlayer())) do
    wait(0.5)
    Print("************************************* - Prefab_ProjectorMickeyMove - wait 0.5")
  end
  SetCameraAttributes("dbc_1st_igc.NoLedgeCameraOverride 01")
  ForEachEntityInGroup(DestroyEntity, "DBC_1st_ZoneA_SplineCameraTriggers")
  SetPropertyFloat("dbc_1st_gus_tut.Gremlin_Gus 01", "UsableRadius", 0)
end

function DBC_1st_ZoneA_RightBreakReturnCamera()
  SaveCheckpoint(nil, "DBC_1st_ZoneA_LoadCheckpoint", "dbc_1st_zonea_dynamic.MickeyStartPositionMarker 01")
  while DBC_1st_ZoneA_MickeyPosition(GetPosition(GetPlayer()), GetPosition(GetPlayer())) do
    wait(0.5)
    Print("************************************* - Prefab_ProjectorMickeyMove - wait 0.5")
  end
  SetCameraAttributes("dbc_1st_igc.NoLedgeCameraOverride 01")
  ForEachEntityInGroup(DestroyEntity, "DBC_1st_ZoneA_SplineCameraTriggers")
  SetPropertyFloat("dbc_1st_gus_tut.Gremlin_Gus 01", "UsableRadius", 0)
end

function DBC_1st_NearMachineCameraRelease()
  ClearAllCameraAttributesTimed(1)
end

function DBC_1st_ZoneA_ReturnToSplineCamera()
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

function DBC_1st_ZoneA_OpenLabExitDoors()
  AnimGBSequence("dbc_1st_zoneb_dynamic.DBC_ZoneE_LabDoor01 01", "Open")
  AudioPostEventOn("dbc_1st_zonea_audio.Sound_Marker_HallDoor 01", "Play_sfx_DBC_Evnt_HallDoor_Open")
end

function DBC_1st_ZoneA_CloseLabExitDoors()
  AnimGBSequence("dbc_1st_zoneb_dynamic.DBC_ZoneE_LabDoor01 01", "Closed")
  AudioPostEventOn("dbc_1st_zonea_audio.Sound_Marker_HallDoor 01", "Play_sfx_DBC_Evnt_HallDoor_Close")
end

function DBC_1st_ZoneA_PurpleSmashCutscene(param1)
  FireThread(Prefab_GrabCameraFancy, param1)
  DBC_1st_ArmSmashColor("dbc_1st_zonea_dynamic.Robot_Arm", "purple")
end

function DBC_1st_ZoneA_ArmLookAroundMachine(param1, param2, param3)
  local var1, var2, var3, var4
  if param2 == "in" then
    SetRobotArmSpotlightDisabled(var2, var3)
    DBC_1st_ZoneA_SetArmIdle(var2, var3)
    var1 = 0
    for var4 = 7, 9 do
      SetRobotArmAttackTypeAngleInfo("dbc_1st_zonea_dynamic.Robot_Arm", var4, param3)
      SetRobotArmAttackTypeEnabled("dbc_1st_zonea_dynamic.Robot_Arm", var4, true)
    end
  elseif param2 == "out" then
    SetRobotArmSpotlightDisabled(var2, var3)
    DBC_1st_ZoneA_SetArmIdle(var2, var3)
    var1 = 0
    for var4 = 7, 9 do
      SetRobotArmAttackTypeEnabled("dbc_1st_zonea_dynamic.Robot_Arm", var4, false)
    end
  end
end

function DBC_1st_ZoneA_EndLevelTracking()
  EndTrackingCurrentLevelForScoring("DBC_1st_ZoneA")
end

function DBC_1st_ZoneA_GusMachineIntro()
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

function DBC_1st_ZoneA_GusMachineIntro_end()
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

function DBC_1st_ZoneA_GusTalk()
  EnterCutscene("dbc_1st_gus_tut.Gremlin_Gus 01", 102)
end

function DBC_1st_ZoneA_GusBeckon()
  EnterCutscene("dbc_1st_gus_tut.Gremlin_Gus 01", 99)
end

function DBC_1st_ZoneA_GusDefault()
  ExitCutscene("dbc_1st_gus_tut.Gremlin_Gus 01")
  AnimEvent("dbc_1st_gus_tut.Gremlin_Gus 01", EVENT_Force_Idle)
end

function DBC_1st_ZoneA_GusBeckon2()
  if DBC_1st_ZoneA_GusIntro_Played == 0 then
    EnterCutscene("dbc_1st_gus_tut.Gremlin_Gus 01", 23)
  end
end

function DBC_1st_ZoneA_GusBeckon3()
  if GetGlobal("DBC_1st_ZoneA_TimMachine") + GetGlobal("DBC_1st_ZoneA_MortMachine") == 2 then
    EnterCutscene("dbc_1st_gus_tut.Gremlin_Gus 01", 103)
  end
end

function DBC_1st_ZoneA_GusBridgeTeleport()
  FireThread(DBC_1st_ZoneA_TeleportGremlinToEntityTaunt, "dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 08")
end

function DBC_1st_ZoneA_GusLeftMachineTeleport()
  FireThread(DBC_1st_ZoneA_TeleportGremlinToEntityRight, "dbc_1st_gus_tut.Gremlin_Gus 01", "dbc_1st_gus_tut.GusPosition 01")
end

function DBC_1st_ZoneA_SpotlightOff()
  local var1, var2
end
function DBC_1st_ZoneA_SpotlightWhite()
  local var1, var2
end

function DBC_1st_ZoneA_SpotlightRed()
  local var1, var2
end

function DBC_1st_ZoneA_GiveMickeySpin()
  MoveToEntity("dbc_1st_zonea_dynamic.Ability_SpinAttack 02", GetPlayer())
end

function DBC_1st_ZoneA_RedChestEndFunction()
  RestrictCutSceneInput()
  wait(0.1)
  HideReticleOnly()
  SaveCheckpoint(nil, "DBC_1st_ZoneA_LoadCheckpoint", "dbc_1st_zonea_dynamic.MickeyStartPositionMarker 01")
  wait(4)
  UnrestrictCutSceneInput()
  FireSequence("dbc_1st_gus_tut.Gremlin_Gus 01", "DBC_1st_ZoneC_FirstPin")
end

function DBC_1st_ZoneA_RobotLightOn()
  SetRobotArmSpotlightDisabled("dbc_1st_zonea_dynamic.Robot_Arm", false)
end

function DBC_1st_ZoneA_RobotLightOff()
  SetRobotArmSpotlightDisabled("dbc_1st_zonea_dynamic.Robot_Arm", true)
end

function DBC_1st_SaveConceptArt()
  SaveCheckpoint(nil, "DBC_1st_ZoneA_LoadCheckpoint", "dbc_1st_zonea_dynamic.MickeyStartPositionMarker 01")
end

function DBC_1st_ZoneA_BreakMachineGlobal(param1, param2)
  SetGlobal(param2, 1)
end

function DBC_1st_ZoneA_BreakMachineGlobalCheck(param1, param2)
  if GetGlobal(param2) == 1 then
    DestroyEntity(param1)
  end
end

musicStage = 0

function DBC_1st_ZoneA_Music_AfterFight()
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