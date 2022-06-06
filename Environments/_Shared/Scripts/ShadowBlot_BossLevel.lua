local L0_0, L1_1
L0_0 = "mjm_shadowblot_boss.ShadowBlot 01"
THE_BLOT = L0_0
L0_0 = false
chargeAttackInProgress = L0_0
L0_0 = false
firstEmergeDone = L0_0
L0_0 = false
emergeAttackSuccessful = L0_0
function L0_0(A0_2)
  if chargeAttackInProgress then
    ForceSketched(A0_2)
    chargeAttackInProgress = false
  end
end
SBB_ThinProp = L0_0
function L0_0(A0_3)
  GetPrefabData("MickeyEntryPoint").MapLoad_SetupPosition = "True"
  OnMapLoad_ProjectorSetup("MickeyEntryPoint")
  StartTrackingCurrentLevelForScoring("ShadowBlotBoss")
end
ShadowBlot_Projector_Exit = L0_0
function L0_0(A0_4)
  ForceSequence("mjm_shadowblot_boss.Marker(Conversation) 01", "SBB_EnterProjector")
end
ProjectorEnter = L0_0
function L0_0()
  Bark(nil, "in loadventureland", 2)
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "Levels/ToonTown_FromMJ2.level")
end
LoadNextLevel = L0_0
function L0_0(A0_5, A1_6)
  if StimulusEvent_HasStimulusType(A1_6, ST_PAINT) then
    AnimEvent(THE_BLOT, "EVENT_MouthHitPaint")
  elseif StimulusEvent_HasStimulusType(A1_6, ST_THINNER) then
    AnimEvent(THE_BLOT, "EVENT_MouthHitThinner")
  end
end
SBB_MouthHitWithStimulus = L0_0
function L0_0(A0_7, A1_8)
  if AnimEvent_Type(A1_8) == EVENT_Finished_Sequence then
    AnimEvent(THE_GROUND_BLOT, "EVENT_Groundblot_Tentacle_Finish1")
  end
end
SBB_TentacleAnimEvent = L0_0
function L0_0(A0_9)
  AnimEvent(A0_9, "EVENT_Start_IdleEnter")
end
SBB_StartIdleEnter = L0_0
function L0_0(A0_10)
  AnimEvent(A0_10, "EVENT_Start_BattleScene")
  Bark(nil, "SBB_StartOswaldBattle", 1)
end
SBB_StartOswaldBattle = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "SBB_LoadCheckpoint", "mjm_shadowblot_boss_camera.PositionMarker 01")
end
SBB_SaveCheckpoint = L0_0
function L0_0()
  Wait(2)
  SBB_SaveCheckpoint()
end
SBB_SaveCheckpoint_Concept = L0_0
function L0_0()
  Disable("mjm_shadowblot_boss_camera.Trigger 01")
  AnimGBSequence("mjm_sbb.platform_Animation 04", "wobble", false, 0, 0, true)
  AnimGBSequence("mjm_sbb.platform_Animation 04", "fall", false, 0, 0, true)
  AnimGBSequence("mjm_sbb.platform_Animation 02", "wobble", false, 0, 0, true)
  AnimGBSequence("mjm_sbb.platform_Animation 02", "fall", false, 0, 0, true)
  AnimGBSequence("mjm_sbb.platform_Animation 03", "wobble", false, 0, 0, true)
  AnimGBSequence("mjm_sbb.platform_Animation 03", "fall", false, 0, 0, true)
  AnimGBSequence("mjm_sbb.platform_Animation 01", "wobble", false, 0, 0, true)
  AnimGBSequence("mjm_sbb.platform_Animation 01", "fall", false, 0, 0, true)
  Enable("mjm_shadowblot_boss_camera.mickey_fall_TriggerDamage 02")
  Disable("mjm_sbb.mickey_fall_TriggerDamage 01")
  SetMap(nil, "MAP_MJ_SHADOWBOSS", "GAME")
  StartTrackingCurrentLevelForScoring("ShadowBlotBoss")
  Unhide("mjm_shadowblot_boss.ShadowBlot 01")
  SetVisualScale("mjm_shadowblot_boss.ShadowBlot 01", 0.3)
  EnableMotion("mjm_shadowblot_boss.ShadowBlot 01")
  TeleportToEntity("mjm_shadowblot_boss.ShadowBlot 01", "mjm_shadowblot_boss_igc.PositionMarker DefeatedPaint")
  AnimEvent(THE_BLOT, "EVENT_EnableMotion")
  wait(0)
  AnimEvent(THE_BLOT, "EVENT_Start_IdleEnterTop")
  AnimEvent("mjm_shadowblot_boss.OswaldFight 01", "EVENT_Start_BattleScene")
  AnimEvent("mjm_shadowblot_boss.BlobFight 01", "EVENT_Start_BattleScene")
  AnimEvent("mjm_shadowblot_boss.SpatterFight 01", "EVENT_Start_BattleScene")
  AnimEvent("mjm_shadowblot_boss.SpatterFight 02", "EVENT_Start_BattleSceneAlt")
  wait(1.5)
  AudioSetState(GetPlayer(), "Music_State", "Boss")
end
SBB_LoadCheckpoint = L0_0
function L0_0()
  TeleportToEntity(GetPlayer(), "MJM_ShadowBlot_Start")
  SetMap(nil, "MAP_MJ_SHADOWBOSS", "GAME")
  StartTrackingCurrentLevelForScoring("ShadowBlotBoss")
  SaveCheckpoint(GetPlayer(), "SBB_LoadCheckpointStart", "mjm_shadowblot_boss_camera.PositionMarker 08")
  UnrestrictCutSceneInput()
end
SBB_CheckpointStart = L0_0
function L0_0()
  SetMap(nil, "MAP_MJ_SHADOWBOSS", "GAME")
  StartTrackingCurrentLevelForScoring("ShadowBlotBoss")
end
SBB_LoadCheckpointStart = L0_0
function L0_0(A0_11)
  ForceSequence("mjm_shadowblot_boss.Marker(Conversation) 01", A0_11)
end
SBB_StartApprenticeSequenceGus = L0_0
function L0_0(A0_12)
  ForceSequence("mjm_shadowblot_boss.Marker(Conversation) 02", A0_12)
end
SBB_StartApprenticeSequenceOswald = L0_0
function L0_0(A0_13, A1_14)
  if AnimEvent_Type(A1_14) == EVENT_Start_AttackDiveBomb then
    SBB_StartDiveBombState(A0_13)
  elseif AnimEvent_Type(A1_14) == EVENT_Start_AttackCharge then
    SBB_StartChargeAttackState(A0_13)
    chargeAttackInProgress = true
  elseif AnimEvent_Type(A1_14) == EVENT_Start_AttackMeleeSwipe then
    chargeAttackInProgress = false
  elseif AnimEvent_Type(A1_14) == EVENT_Start_EmergeHitExit then
    emergeAttackSuccessful = true
  elseif AnimEvent_Type(A1_14) == EVENT_Start_EmergeEnter then
    SBB_StartEmergeState(A0_13)
    if GetGlobal("SBB_VulnerableMouth_Played") == 0 then
      if firstEmergeDone and emergeAttackSuccessful == false then
        SBB_StartApprenticeSequenceGus("SBB_VulnerableMouth")
      end
      if firstEmergeDone == false then
        firstEmergeDone = true
      end
    end
  elseif AnimEvent_Type(A1_14) == EVENT_Start_IdleEnterTop then
    SBB_StartBattleState(A0_13)
  elseif AnimEvent_Type(A1_14) == EVENT_Start_IdleEnterBottom then
    SBB_StartBattleState(A0_13)
  elseif AnimEvent_Type(A1_14) == EVENT_Finish_AttackDiveBombStart then
    SBB_StartGroundState(A0_13)
  elseif AnimEvent_Type(A1_14) == EVENT_VulnerableMouthSequence then
  elseif AnimEvent_Type(A1_14) == EVENT_GroundHintSequence then
    if GetGlobal("SBB_GroundHint_Played") == 0 and emergeAttackSuccessful == false then
      SBB_StartApprenticeSequenceGus("SBB_GroundHint")
    end
  elseif AnimEvent_Type(A1_14) == EVENT_HelpOswaldSequence then
    SBB_StartApprenticeSequenceOswald("SBB_Hurry")
  end
end
SBB_AnimEventIntercept = L0_0
function L0_0(A0_15)
  SetCameraAttributes("mjm_shadowblot_boss_camera.Battle")
  wait(3)
  SetCameraAttributes("mjm_shadowblot_boss_camera.Air")
end
SBB_StartDiveBombState = L0_0
function L0_0(A0_16)
  local L1_17
  L1_17 = SBB_GetHeadingToEntity
  L1_17 = L1_17(THE_BLOT)
  SetPropertyFloat("mjm_shadowblot_boss_camera.ChargeAttack", "HintYaw", L1_17)
  SetCameraAttributes("mjm_shadowblot_boss_camera.ChargeAttack")
end
SBB_StartChargeAttackState = L0_0
function L0_0(A0_18)
  SetCameraAttributes("mjm_shadowblot_boss_camera.Emerge")
end
SBB_StartEmergeState = L0_0
function L0_0(A0_19)
  ClearAllCameraAttributes()
  wait(0.1)
  SetCameraAttributes("mjm_shadowblot_boss_camera.Battle")
end
SBB_StartBattleState = L0_0
function L0_0(A0_20)
  SetCameraAttributes("mjm_shadowblot_boss_camera.Air")
end
SBB_StartGroundState = L0_0
function L0_0(A0_21, A1_22)
  SetPropertyFloat(A0_21, "HintYaw", A1_22)
  wait(0.1)
  SetCameraAttributes(A0_21)
  wait(0.1)
end
SBB_SetCameraVector = L0_0
function L0_0(A0_23)
  local L1_24
end
SBB_OnDeath = L0_0
function L0_0(A0_25)
  local L1_26
end
ReInitOnDeath = L0_0
function L0_0(A0_27, A1_28)
end
ReInitOnRevive = L0_0
function L0_0()
  if GetGlobal("SBB_ArenaStart_Played") == 0 then
    RestrictCutSceneInput()
    StartFadeOut(0.5)
    wait(0.5)
    SetLetterbox(1)
    TeleportToEntity(GetPlayer(), "mjm_shadowblot_boss_camera.PositionMarker 01")
    SetCameraAttributes("mjm_shadowblot_boss_camera.IntroCam(CameraOverride) 01")
    wait(0.5)
    SetSplineFollowerInitialSpeed("mjm_shadowblot_boss_camera.IntroCameraControlPoint 07", 10)
    StartFadeInNoHUD(0.5)
  end
end
SBB_ShadowIntro = L0_0
function L0_0()
  SBB_ShadowIntroIGC()
end
SBB_ShadowIntroEnd = L0_0
function L0_0(A0_29)
  SetMap(nil, "Icon_Save_MJM_tex", "GAME")
end
SBB_StartUp = L0_0
function L0_0()
  RestrictCutSceneInput()
  HideHud()
  Wait(0.5)
  StartFadeOut(0.25)
  wait(0.5)
  SetLetterbox(1)
  CameraReset()
  SBB_DefeatedPaintResetActors()
  AnimEvent(THE_BLOT, "EVENT_DisableLifeColor")
  TeleportToEntity("mjm_shadowblot_boss_igc.shadowBlot_Intro_Camera 01", "mjm_shadowblot_boss_igc.PositionMarker DefeatedPaint")
  GrabCameraNif("mjm_shadowblot_boss_igc.shadowBlot_Intro_Camera 01", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("mjm_shadowblot_boss_igc.shadowBlot_Intro_Camera 01")
  AnimGBSequence("mjm_shadowblot_boss_igc.shadowBlot_Intro_Camera 01", "camera")
  EnterCutscene("mjm_shadowblot_boss.ShadowBlot 01", 10)
  EnterCutscene(GetPlayer(), 24)
  StartFadeInNoHUD(0.5)
  wait(1)
  SBB_StartApprenticeSequenceGus("SBB_IntroStart")
  wait(5)
  SBB_StartApprenticeSequenceGus("SBB_Intro")
  wait(11.5)
  StartFadeOut(0.833)
  wait(0.833)
  UnrestrictCutSceneInput()
  EnableMotion_Player(GetPlayer())
  TeleportToEntity(GetPlayer(), "mjm_shadowblot_boss_camera.PositionMarker 01", true, true)
  ExitCutscene(GetPlayer())
  EnableMotion("mjm_shadowblot_boss.ShadowBlot 01")
  SetVisualScale("mjm_shadowblot_boss.ShadowBlot 01", 0.3)
  SetLetterbox(0)
  CameraReset()
  SetCameraAttributes("mjm_shadowblot_boss_camera.IntroMarker(CameraOverride) 06")
  wait(0.7)
  StartFadeInNoHUD(0.5)
  SetPropertyBool(GetPlayer(), "ForceInvulnerable", false, 0)
  AnimEvent(THE_BLOT, "EVENT_EnableMotion")
  wait(0)
  AnimEvent(THE_BLOT, "EVENT_Start_IdleEnterTop")
  AnimEvent(THE_BLOT, "EVENT_EnableLifeColor")
  SetLetterbox(0)
  wait(0.5)
  SetCameraAttributes("mjm_shadowblot_boss_camera.Battle")
  ShowReticleOnly()
  ShowHud()
  ForceSequence("mjm_shadowblot_boss_camera.Marker(Conversation) 01", "SBB_ArenaStart")
  wait(1)
  Enable("mjm_shadowblot_boss_camera.mickey_fall_TriggerDamage 02")
  Disable("mjm_sbb.mickey_fall_TriggerDamage 01")
end
SBB_ShadowIntroIGC = L0_0
function L0_0()
  SplineFollower_TeleportToKnot("mjm_shadowblot_boss_camera.IntroCameraControlPoint 07", "mjm_shadowblot_boss_camera.IntroKnot 01")
  SetSplineFollowerInitialSpeed("mjm_shadowblot_boss_camera.IntroCameraControlPoint 07", 0)
end
SBB_ResetCameraKnots = L0_0
function L0_0(A0_30)
  local L1_31, L2_32, L3_33, L4_34
  L1_31 = GetPosition
  L2_32 = GetPlayer
  L4_34 = L2_32()
  L1_31 = L1_31(L2_32, L3_33, L4_34, L2_32())
  L2_32 = GetPosition
  L3_33 = A0_30
  L2_32 = L2_32(L3_33)
  L3_33 = L2_32 - L1_31
  L4_34 = L3_33.normalize3
  L4_34(L3_33)
  L4_34 = math
  L4_34 = L4_34.atan2
  L4_34 = L4_34(-1 * L3_33.x, -1 * L3_33.z)
  return (math.deg(L4_34))
end
SBB_GetHeadingToEntity = L0_0
function L0_0()
  PlayAndUnlockMovie("MJM_visit2_Blot_Escape.bik", "MJM_visit2_Blot_Escape")
  SetGlobal("PlayerFirstTimeInZone", 1)
  ClearCutSceneStack()
  LoadLevel(GetPlayer(), "Levels/ToonTown_FromMJ2.level")
end
SBB_StartLevelEnd = L0_0
function L0_0()
  Bark(nil, "PLAY", 2)
  AnimEvent(THE_BLOT, "EVENT_Start_IdleEnter")
end
SBB_StartPlay = L0_0
function L0_0()
  Unhide("mjm_shadowblot_boss.ShadowBlot 01")
  SetVisualScale("mjm_shadowblot_boss.ShadowBlot 01", 0.1)
  DisableMotion("mjm_shadowblot_boss.ShadowBlot 01")
  AnimEvent(THE_BLOT, "EVENT_DisableMotion")
  TeleportToEntity("mjm_shadowblot_boss.ShadowBlot 01", "mjm_shadowblot_boss_igc.PositionMarker DefeatedPaint")
  SetPropertyBool(GetPlayer(), "ForceInvulnerable", true, 0)
  DisableMotion_Player(GetPlayer())
  TeleportToEntity(GetPlayer(), "mjm_shadowblot_boss_igc.PositionMarker DefeatedPaint")
end
SBB_DefeatedPaintResetActors = L0_0
function L0_0()
  StartFadeOut(0.7)
  wait(0.7)
  SetLetterbox(1)
  SBB_DefeatedPaintResetActors()
  AnimEvent(THE_BLOT, "EVENT_DisableLifeColor")
  wait(0.5)
  DisableMotion("mjm_shadowblot_boss_thanh.ShadowBlotGround 01")
  TeleportToEntity("mjm_shadowblot_boss_thanh.ShadowBlotGround 01", "mjm_shadowblot_boss_igc.PositionMarker DefeatedThinnerPool")
  EnterCutscene("mjm_shadowblot_boss_thanh.ShadowBlotGround 01", 1)
  Unhide("mjm_shadowblot_boss_thanh.ShadowBlotGround 01")
  ForEachEntityInGroup(DestroyEntity, "ShadowBlot_Spatter")
  TeleportToEntity("mjm_shadowblot_boss_igc.AnimatedScene DefeatedThinner", "mjm_shadowblot_boss_igc.PositionMarker DefeatedPaint")
  GrabCameraNif("mjm_shadowblot_boss_igc.AnimatedScene DefeatedThinner", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("mjm_shadowblot_boss_igc.AnimatedScene DefeatedThinner")
  AnimGBSequence("mjm_shadowblot_boss_igc.AnimatedScene DefeatedThinner", "camera")
  EnterCutscene(GetPlayer(), 40)
  EnterCutscene("mjm_shadowblot_boss.ShadowBlot 01", 20)
  StartFadeInNoHUD(1)
  wait(9.3)
  ForceSequence("mjm_shadowblot_boss.Marker(Conversation) 01", "SBB_ThinnerEnd")
  wait(7)
  StartFadeOut(1)
  wait(1)
  Hide("mjm_shadowblot_boss.ShadowBlot 01")
  SetLetterbox(0)
  wait(0.2)
  SBB_StartLevelEnd()
end
SBB_DefeatedThinner = L0_0
function L0_0()
  AudioPostEventOn("mjm_shadowblot_boss_camera.Trigger 01", "Stop_mickeyjunkmountain_boss")
  StartFadeOut(0.7)
  wait(0.7)
  SetLetterbox(1)
  SBB_DefeatedPaintResetActors()
  wait(0.3)
  AudioPostEventOn(GetPlayer(), "Play_sfx_MJM_ShadowBlotFriended_SFX_MX")
  Hide("mjm_sbb.cover_pt_Prop 02")
  ForEachEntityInGroup(DestroyEntity, "ShadowBlot_Spatter")
  TeleportToEntity("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint", "mjm_shadowblot_boss_igc.PositionMarker DefeatedPaint")
  TeleportToEntity("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 02", "mjm_shadowblot_boss_igc.PositionMarker DefeatedPaint")
  TeleportToEntity("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 03", "mjm_shadowblot_boss_igc.PositionMarker DefeatedPaint")
  TeleportToEntity("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 04", "mjm_shadowblot_boss_igc.PositionMarker DefeatedPaint")
  TeleportToEntity("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 05", "mjm_shadowblot_boss_igc.PositionMarker DefeatedPaint")
  TeleportToEntity("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 06", "mjm_shadowblot_boss_igc.PositionMarker DefeatedPaint")
  TeleportToEntity("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 07", "mjm_shadowblot_boss_igc.PositionMarker DefeatedPaint")
  GrabCameraNif("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint")
  AnimGBSequence("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint", "camera")
  SetPropertyInt(THE_BLOT, "Index To Spawn", 1, 0)
  SetTransformation(ForceSpawn(THE_BLOT, 1)[1], vector4(8.006145, -6.558891, 0), vector4(0, 0, 0))
  EnterCutscene(GetPlayer(), 25)
  EnterCutscene("mjm_shadowblot_boss.ShadowBlot 01", 1)
  wait(0.5)
  EnterCutscene("mjm_shadowblot_boss.ShadowBlot 01", 1)
  StartFadeInNoHUD(1)
  wait(5.3333)
  AnimEvent(THE_BLOT, "EVENT_DisableLifeColor")
  wait(3.6667)
  SBB_DefeatedPaintScene2()
end
SBB_DefeatedPaint = L0_0
function L0_0()
  SBB_DefeatedPaintResetActors()
  GrabCameraNif("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 02", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 02")
  AnimGBSequence("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 02", "camera")
  EnterCutscene(GetPlayer(), 26)
  EnterCutscene("mjm_shadowblot_boss.ShadowBlot 01", 2)
  wait(6.3)
  SBB_DefeatedPaintScene3()
end
SBB_DefeatedPaintScene2 = L0_0
function L0_0()
  SBB_DefeatedPaintResetActors()
  GrabCameraNif("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 03", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 03")
  AnimGBSequence("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 03", "camera")
  EnterCutscene(GetPlayer(), 27)
  EnterCutscene("mjm_shadowblot_boss.ShadowBlot 01", 3)
  wait(8.66)
  SBB_DefeatedPaintScene4()
end
SBB_DefeatedPaintScene3 = L0_0
function L0_0()
  SBB_DefeatedPaintResetActors()
  GrabCameraNif("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 04", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 04")
  AnimGBSequence("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 04", "camera")
  EnterCutscene(GetPlayer(), 28)
  EnterCutscene("mjm_shadowblot_boss.ShadowBlot 01", 4)
  wait(4.6)
  SBB_DefeatedPaintScene5()
end
SBB_DefeatedPaintScene4 = L0_0
function L0_0()
  SBB_DefeatedPaintResetActors()
  TeleportToEntity("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint", "mjm_shadowblot_boss_igc.PositionMarker DefeatedPaint")
  GrabCameraNif("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 05", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 05")
  AnimGBSequence("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 05", "camera")
  EnterCutscene(GetPlayer(), 29)
  EnterCutscene("mjm_shadowblot_boss.ShadowBlot 01", 5)
  wait(6.333)
  SBB_DefeatedPaintScene6()
end
SBB_DefeatedPaintScene5 = L0_0
function L0_0()
  SBB_DefeatedPaintResetActors()
  GrabCameraNif("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 06", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 06")
  AnimGBSequence("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 06", "camera")
  EnterCutscene(GetPlayer(), 30)
  EnterCutscene("mjm_shadowblot_boss.ShadowBlot 01", 6)
  wait(3.333)
  ForceSequence("mjm_shadowblot_boss.Marker(Conversation) 01", "SBB_BlotPainted2")
  wait(3)
  SBB_DefeatedPaintScene7()
end
SBB_DefeatedPaintScene6 = L0_0
function L0_0()
  SBB_DefeatedPaintResetActors()
  GrabCameraNif("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 07", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 07")
  AnimGBSequence("mjm_shadowblot_boss_igc.AnimatedScene DefeatedPaint 07", "camera")
  EnterCutscene(GetPlayer(), 31)
  EnterCutscene("mjm_shadowblot_boss.ShadowBlot 01", 7)
  wait(8)
  StartFadeOut(1)
  wait(1)
  SetLetterbox(0)
  TeleportToEntity(GetPlayer(), "mjm_shadowblot_boss_camera.PositionMarker 01")
  ExitCutscene(GetPlayer())
  AnimEvent(GetPlayer(), EVENT_Finished_Sequence)
  EnableMotion_Player(GetPlayer())
  SetPropertyBool(GetPlayer(), "ForceInvulnerable", false, 0)
  wait(0.1)
  CameraReset()
  Hide("mjm_shadowblot_boss.ShadowBlot 01")
  SBB_StartLevelEnd()
end
SBB_DefeatedPaintScene7 = L0_0
function L0_0()
  if GetGlobal("SBB_IntroStart_Played") == 0 then
  else
    DisableMovementInput(GetPlayer())
    wait(1.6)
    EnableMovementInput(GetPlayer())
    SetCameraAttributes("mjm_shadowblot_boss_camera.Battle")
  end
end
SBB_CameraLoad = L0_0
function L0_0()
  FreezeCamera()
  Kill(GetPlayer())
end
SBB_DeathCameraStart = L0_0
function L0_0()
  FreezeCamera()
  KillAIAndRescuePlayer(GetPlayer())
end
SBB_DeathCameraArena = L0_0
