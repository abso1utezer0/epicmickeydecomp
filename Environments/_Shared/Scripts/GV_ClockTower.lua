local L0_0
L0_0 = "sw_clockworkboss_dynamic.BoatPath_1_1"
LANE1 = L0_0
L0_0 = "docked"
LeftArmState = L0_0
L0_0 = "docked"
RightArmState = L0_0
L0_0 = "docked"
eArmStateDocked = L0_0
L0_0 = "available"
eArmStateAvailable = L0_0
L0_0 = "recoiling"
eArmStateRecoiling = L0_0
L0_0 = "attacking"
eArmStateAttacking = L0_0
L0_0 = "disabled"
eArmStateDisabled = L0_0
L0_0 = "defeated"
eArmStateDefeated = L0_0
L0_0 = "none"
eArmNone = L0_0
L0_0 = "hand"
eArmWeakHand = L0_0
L0_0 = "NoHand"
eArmNoHand = L0_0
L0_0 = "forearm"
eArmWeakArm = L0_0
L0_0 = "NoArm"
eArmNoArm = L0_0
L0_0 = "all"
eArmWeakAll = L0_0
L0_0 = "paint"
eArmPaint = L0_0
L0_0 = "paint_noHand"
eArmPaintNoHand = L0_0
L0_0 = eArmNone
LeftArmWeakness = L0_0
L0_0 = eArmNone
RightArmWeakness = L0_0
L0_0 = "none"
LiftArm = L0_0
L0_0 = "none"
LastArmHit = L0_0
L0_0 = 1
LeftArmSlow = L0_0
L0_0 = 1
RightArmSlow = L0_0
L0_0 = false
LeftInterPaint = L0_0
L0_0 = false
RightInterPaint = L0_0
L0_0 = false
Loaded = L0_0
L0_0 = 0
fistPounds = L0_0
L0_0 = "fists"
FightStage = L0_0
L0_0 = "fists"
eFightStageFists = L0_0
L0_0 = "face"
eFightStageFace = L0_0
L0_0 = {
  0,
  0,
  0,
  0
}
boatSpawn = L0_0
L0_0 = 0
gearsEnabled = L0_0
L0_0 = -1
RightTargetZone = L0_0
L0_0 = -1
LeftTargetZone = L0_0
L0_0 = 5
prevZone = L0_0
L0_0 = 0
currentZone = L0_0
L0_0 = 0
LastKnownCamera = L0_0
L0_0 = "S"
LastKnownRiverCamera = L0_0
L0_0 = "gear_turn"
ANIM_ChoiceGear_Turn = L0_0
L0_0 = "idle_still"
ANIM_ChoiceGear_Idle = L0_0
L0_0 = 999
BadGears = L0_0
L0_0 = false
SMASHINGFIST = L0_0
L0_0 = false
BULLETTIME = L0_0
function L0_0()
  if GetGlobal("CT_DefeatedPaint") == 0 and GetGlobal("CT_DefeatedThinner") == 0 then
    for _FORV_3_ = 1, 18 do
      ct_paintTexture(PartStati[_FORV_3_], 1)
    end
    SetGlobal("CT_ClockTowerResolution", -1)
    Hide("ClocktowerFistBreak")
    Hide("ClocktowerArmBreakR")
    Hide("ClocktowerArmBreakL")
    Hide("ClocktowerArmGearsR")
    Hide("ClocktowerArmGearsL")
    AnimVarFloat("LeftArm", VAR_Playback_Speed, LeftArmSlow)
    AnimVarFloat("RightArm", VAR_Playback_Speed, RightArmSlow)
    TimerDisable("LeftArmTimer")
    TimerDisable("RightArmTimer")
    AnimGBSetIdle("SunAndClouds", false)
    AnimGBSequence("SunAndClouds", "idle_loop")
  end
end
ct_launchGreeting = L0_0
function L0_0(A0_1)
  local L1_2
  function L1_2(A0_3)
    AnimEvent(A0_3, _UPVALUE0_)
  end
  ForEachEntityInGroup(L1_2, "BossAll")
end
ct_AnimEvent = L0_0
function L0_0(A0_4)
  if FightStage ~= eFightStageFists then
    return
  end
  currentZone = ct_getZoneNumber(A0_4)
end
ct_MarkCurrentZone = L0_0
function L0_0(A0_5)
  if FightStage ~= eFightStageFists then
    return
  end
  currentZone = ct_getZoneNumber(A0_5)
end
ct_TriggerZone = L0_0
function L0_0(A0_6)
  local L1_7, L2_8
  L1_7 = GetName
  L2_8 = A0_6
  L1_7 = L1_7(L2_8)
  L2_8 = string
  L2_8 = L2_8.sub
  L2_8 = L2_8(L1_7, string.len(L1_7))
  return (tonumber(L2_8))
end
ct_getZoneNumber = L0_0
function L0_0(A0_9)
  local L1_10
  L1_10 = FightStage
  if L1_10 ~= eFightStageFists then
    return
  end
  L1_10 = ct_chooseAttackingHandByZone
  L1_10 = L1_10(currentZone)
  if L1_10 ~= "neither" then
    ct_MainHandAttack(L1_10, currentZone)
  end
end
ct_FistTimer = L0_0
function L0_0(A0_11, A1_12)
  local L2_13, L3_14, L4_15, L5_16
  L2_13 = FightStage
  L3_14 = eFightStageFists
  if L2_13 ~= L3_14 then
    return
  end
  L2_13 = RightArmWeakness
  L3_14 = eArmWeakHand
  if L2_13 ~= L3_14 then
    L2_13 = RightArmWeakness
    L3_14 = eArmNone
  elseif L2_13 == L3_14 then
    L2_13 = SetPropertyBool
    L3_14 = "RArmForearm"
    L4_15 = "ForceInvulnerable"
    L5_16 = true
    L2_13(L3_14, L4_15, L5_16)
    L2_13 = SetPropertyBool
    L3_14 = "RArmForearm"
    L4_15 = "InvulnerableToPaintThinner"
    L5_16 = true
    L2_13(L3_14, L4_15, L5_16)
  end
  L2_13 = LeftArmWeakness
  L3_14 = eArmWeakHand
  if L2_13 ~= L3_14 then
    L2_13 = LeftArmWeakness
    L3_14 = eArmNone
  elseif L2_13 == L3_14 then
    L2_13 = SetPropertyBool
    L3_14 = "LArmForearm"
    L4_15 = "ForceInvulnerable"
    L5_16 = true
    L2_13(L3_14, L4_15, L5_16)
    L2_13 = SetPropertyBool
    L3_14 = "LArmForearm"
    L4_15 = "InvulnerableToPaintThinner"
    L5_16 = true
    L2_13(L3_14, L4_15, L5_16)
  end
  if A0_11 == "neither" or A0_11 == nil then
    return
  end
  prevZone = A1_12
  L2_13 = A1_12
  L3_14 = A0_11
  L4_15 = "Arm"
  L3_14 = L3_14 .. L4_15
  L4_15, L5_16 = nil, nil
  if A0_11 == "Right" then
    if RightArmWeakness == eArmWeakHand then
      SetCameraAttributes("sw_clockworkboss_cameras.FistRight(CameraOverride) 01")
    elseif RightArmWeakness == eArmWeakArm then
      SetCameraAttributes("sw_clockworkboss_cameras.ArmRight(CameraOverride) 01")
    end
    RightTargetZone = L2_13
    L4_15 = "LeftArm"
    L5_16 = RightTargetZone + 4
  else
    if (LeftArmWeakness == eArmNone or LeftArmWeakness == eArmNoHand) and A0_11 == "Left" then
      if LeftArmWeakness == eArmWeakHand then
        SetCameraAttributes("sw_clockworkboss_cameras.FistLeft(CameraOverride) 01")
      elseif LeftArmWeakness == eArmWeakArm then
        SetCameraAttributes("sw_clockworkboss_cameras.ArmLeft(CameraOverride) 01")
      end
      L2_13 = L2_13 + 2
      LeftTargetZone = L2_13 - 2
      L4_15 = "RightArm"
      L5_16 = LeftTargetZone - 2
    else
    end
  end
  AnimVarInt(L3_14, VAR_Attack_Type, L2_13)
  AnimVarInt(L4_15, VAR_Attack_Type, L5_16)
  fistPounds = fistPounds + 1
  if fistPounds >= 3 and true == true then
    AnimEvent(L4_15, EVENT_Special_0)
    fistPounds = 0
    AnimEvent("BossFace", EVENT_Special_6)
  end
  AnimEvent(L3_14, EVENT_Special_0)
end
ct_MainHandAttack = L0_0
function L0_0(A0_17)
  local L1_18, L2_19
  L1_18 = A0_17
  L2_19 = prevZone
  if L2_19 <= A0_17 - 1 then
    L1_18 = A0_17 + 1
  elseif L2_19 >= A0_17 + 1 then
    L1_18 = A0_17 - 1
  else
  end
  if L1_18 < 0 then
    L1_18 = 0
  end
  if L1_18 > 7 then
    L1_18 = 7
  end
  return L1_18
end
ct_getNextZone = L0_0
function L0_0(A0_20)
  local L1_21
  print("zone: " .. A0_20)
  if A0_20 == 0 then
    L1_21 = ct_chooseAttackingHand("Right", "Right")
  elseif A0_20 == 1 then
    L1_21 = ct_chooseAttackingHand("Right", "Right")
  elseif A0_20 == 2 then
    L1_21 = ct_chooseAttackingHand("Right", "Right")
  elseif A0_20 == 3 then
    L1_21 = ct_chooseAttackingHand("either", "Right")
  elseif A0_20 == 4 then
    L1_21 = ct_chooseAttackingHand("either", "Left")
  elseif A0_20 == 5 then
    L1_21 = ct_chooseAttackingHand("Left", "Left")
  elseif A0_20 == 6 then
    L1_21 = ct_chooseAttackingHand("Left", "Left")
  elseif A0_20 == 7 then
    L1_21 = ct_chooseAttackingHand("Left", "Left")
  end
  return L1_21
end
ct_chooseAttackingHandByZone = L0_0
function L0_0(A0_22, A1_23)
  local L2_24
  L2_24 = "neither"
  if A0_22 == "either" then
    if A1_23 == "Left" then
      if LeftArmState == eArmStateAvailable == true then
        L2_24 = "Left"
      elseif RightArmState == eArmStateAvailable == true then
        L2_24 = "Right"
      else
        L2_24 = "neither"
      end
    elseif A1_23 == "Right" then
      if RightArmState == eArmStateAvailable == true then
        L2_24 = "Right"
      elseif LeftArmState == eArmStateAvailable then
        L2_24 = "Left"
      else
        L2_24 = "neither"
      end
    end
  elseif ct_handAvailable(A0_22) then
    L2_24 = A0_22
  else
    L2_24 = "neither"
  end
  return L2_24
end
ct_chooseAttackingHand = L0_0
function L0_0(A0_25)
  local L1_26, L2_27, L3_28
  L1_26 = false
  if A0_25 == "Left" then
    L2_27 = LeftArmState
    L3_28 = eArmStateAvailable
    if L2_27 == L3_28 then
      L1_26 = true
    end
  elseif A0_25 == "Right" then
    L2_27 = RightArmState
    L3_28 = eArmStateAvailable
    if L2_27 == L3_28 then
      L1_26 = true
    end
  end
  return L1_26
end
ct_handAvailable = L0_0
function L0_0(A0_29)
  local L1_30, L2_31, L3_32
  L1_30 = false
  if A0_29 == "Left" then
    L2_31 = LeftArmWeakness
    L3_32 = eArmWeakHand
    if L2_31 ~= L3_32 then
      L2_31 = LeftArmWeakness
      L3_32 = eArmNoHand
      if L2_31 ~= L3_32 then
        L2_31 = LeftArmWeakness
        L3_32 = eArmWeakArm
        if L2_31 ~= L3_32 then
          L2_31 = LeftArmWeakness
          L3_32 = eArmNoArm
          if L2_31 ~= L3_32 then
            L2_31 = LeftArmWeakness
            L3_32 = eArmWeakAll
          end
        end
      end
    elseif L2_31 == L3_32 then
      L1_30 = true
    end
  elseif A0_29 == "Right" then
    L2_31 = RightArmWeakness
    L3_32 = eArmWeakHand
    if L2_31 ~= L3_32 then
      L2_31 = RightArmWeakness
      L3_32 = eArmNoHand
      if L2_31 ~= L3_32 then
        L2_31 = RightArmWeakness
        L3_32 = eArmWeakArm
        if L2_31 ~= L3_32 then
          L2_31 = RightArmWeakness
          L3_32 = eArmNoArm
          if L2_31 ~= L3_32 then
            L2_31 = RightArmWeakness
            L3_32 = eArmWeakAll
          end
        end
      end
    elseif L2_31 == L3_32 then
      L1_30 = true
    end
  end
  return L1_30
end
ct_broken = L0_0
function L0_0(A0_33)
  local L1_34
  L1_34 = A0_33
  L1_34 = L1_34 .. "HandDamage"
  Hide(L1_34)
end
ct_disableArmForDamage = L0_0
function L0_0(A0_35, A1_36)
  if A0_35 == GetEntity("LeftArm") then
    ct_manageDamageTrigger(A1_36, "LeftHandDamage")
    if AnimEvent_Type(A1_36) == EVENT_Collision_PaintLFront then
      Enable("sw_clockworkboss_cameras.PlaneTrigger 01")
      Enable("sw_clockworkboss_cameras.PlaneTrigger 03")
      Enable("sw_clockworkboss_cameras.PlaneTrigger 06")
      Enable("sw_clockworkboss_cameras.PlaneTrigger 07")
    elseif AnimEvent_Type(A1_36) == EVENT_Collision_HelpHandsLFront then
    end
  end
  if A0_35 == GetEntity("RightArm") then
    ct_manageDamageTrigger(A1_36, "RightHandDamage")
    if AnimEvent_Type(A1_36) == EVENT_Collision_PaintRFront then
      Enable("sw_clockworkboss_cameras.PlaneTrigger 01")
      Enable("sw_clockworkboss_cameras.PlaneTrigger 03")
      Enable("sw_clockworkboss_cameras.PlaneTrigger 06")
      Enable("sw_clockworkboss_cameras.PlaneTrigger 07")
    elseif AnimEvent_Type(A1_36) == EVENT_Collision_HelpHandsRFront then
    end
  end
end
ct_handAnimEvent = L0_0
function L0_0(A0_37, A1_38)
  local L2_39
  L2_39 = LeftArmState
  if L2_39 == eArmStateDefeated then
    L2_39 = print
    L2_39("ct_manageDamageTrigger - Left arm is already disabled: " .. LeftArmState .. " Event: " .. tostring(A0_37))
    return
  end
  L2_39 = RightArmState
  if L2_39 == eArmStateDefeated then
    L2_39 = print
    L2_39("Right arm is already disabled: " .. RightArmState .. " Event: " .. tostring(A0_37))
    return
  end
  L2_39 = AnimEvent_Type
  L2_39 = L2_39(A0_37)
  if L2_39 == EVENT_Start_WeaponFiring then
    if A1_38 == "LeftHandDamage" then
      L2_39 = eArmStateAttacking
      LeftArmState = L2_39
    elseif A1_38 == "RightHandDamage" then
      L2_39 = eArmStateAttacking
      RightArmState = L2_39
    end
  else
    L2_39 = AnimEvent_Type
    L2_39 = L2_39(A0_37)
    if L2_39 == EVENT_Stop_WeaponFiring then
      L2_39 = wait
      L2_39(0.25)
      if A1_38 == "LeftHandDamage" then
        L2_39 = ForEachEntityInGroup
        L2_39(SetPropertyInt, "LArmHand", "Collision Layer", 5)
        L2_39 = ForEachEntityInGroup
        L2_39(SetPropertyInt, "LArmForearm", "Collision Layer", 5)
      elseif A1_38 == "RightHandDamage" then
        L2_39 = ForEachEntityInGroup
        L2_39(SetPropertyInt, "RArmHand", "Collision Layer", 5)
        L2_39 = ForEachEntityInGroup
        L2_39(SetPropertyInt, "RArmForearm", "Collision Layer", 5)
      end
    else
      L2_39 = AnimEvent_Type
      L2_39 = L2_39(A0_37)
      if L2_39 == EVENT_Start_AttackMelee then
        L2_39 = nil
        if A1_38 == "LeftHandDamage" then
          L2_39 = "LArmPalm"
        elseif A1_38 == "RightHandDamage" then
          L2_39 = "RArmPalm"
        else
          ct_BigWarning("whichDamage is " .. A1_38 .. "? - manageDamageTrigger")
        end
        ct_FistImpact(L2_39, A1_38)
      elseif A1_38 == "LeftHandDamage" then
        L2_39 = LeftArmState
        if L2_39 == eArmStateAttacking then
          L2_39 = eArmStateAvailable
          LeftArmState = L2_39
          L2_39 = -2
          LeftTargetZone = L2_39
        end
      elseif A1_38 == "RightHandDamage" then
        L2_39 = RightArmState
        if L2_39 == eArmStateAttacking then
          L2_39 = eArmStateAvailable
          RightArmState = L2_39
          L2_39 = -2
          RightTargetZone = L2_39
        end
      end
    end
  end
end
ct_manageDamageTrigger = L0_0
function L0_0(A0_40, A1_41)
  local L2_42, L3_43
  L2_42 = GetPlayer
  L2_42 = L2_42()
  if A1_41 == L2_42 then
    L2_42 = SMASHINGFIST
    if not L2_42 then
      L2_42 = true
      SMASHINGFIST = L2_42
      L2_42 = GetPosition
      L3_43 = A0_40
      L2_42 = L2_42(L3_43)
      L3_43 = GetPosition
      L3_43 = L3_43(A1_41)
      L2_42 = L2_42 - L3_43
      L3_43 = "LaunchPointLeft"
      if L2_42.x > 0 then
        L3_43 = "LaunchPointRight"
      end
      Damage(A1_41, 1)
      if BULLETTIME then
        StimulusEntityWithAliasInEntityDirectionInRadius(A0_40, ST_KNOCKBACK, 1000, 0, A1_41, L3_43, "")
        wait(10)
      else
        StimulusEntityWithAliasInEntityDirectionInRadius(A0_40, ST_KNOCKBACK, 1000, 0, A1_41, L3_43, "")
        wait(1)
      end
      SMASHINGFIST = false
    end
  end
end
ct_FistSmash = L0_0
function L0_0(A0_44)
  AudioPostEventOn("ClocktowerFistBreak", "Play_sfx_ClockTower_Hand_Shatter")
  BULLETTIME = true
  SetPercentGameSpeed(0.1)
  Disable("sw_clockworkboss_dynamic.ThinnerDamage")
  Enable("sw_clockworkboss_dynamic.ThinnerDamageSloMo")
  SetTransformation("ClocktowerFistBreak", A0_44, vector4(0, 0, 0))
  Unhide("ClocktowerFistBreak")
  AnimGBReset("ClocktowerFistBreak")
  AnimGBSequence("ClocktowerFistBreak", "HandBreak")
  SetTransformation("ClocktowerFistFX_Explode", A0_44, vector4(0, 0, 0))
  StartEmitters("ClocktowerFistFX_Explode")
  wait(0.2)
  Disable("sw_clockworkboss_dynamic.ThinnerDamageSloMo")
  Enable("sw_clockworkboss_dynamic.ThinnerDamage")
  SetPercentGameSpeed(1)
  BULLETTIME = false
  wait(0.8)
  SetCameraAttributes("sw_clockworkboss_cameras.Marker(CameraOverride) 01")
  StopEmitters("ClocktowerFistFX_Explode")
end
ct_FistExplode = L0_0
function L0_0(A0_45, A1_46)
  AudioPostEventOn(A1_46, "Play_sfx_ClockTower_Forearm_Shatter")
  SetPercentGameSpeed(0.1)
  Unhide(A1_46)
  AnimGBReset(A1_46)
  AnimGBSequence(A1_46, "ArmBreak")
  SetTransformation("ClocktowerFistFX_Explode", A0_45, vector4(0, 0, 0))
  StartEmitters("ClocktowerFistFX_Explode")
  wait(0.2)
  SetPercentGameSpeed(1)
  wait(0.8)
  SetCameraAttributes("sw_clockworkboss_cameras.Marker(CameraOverride) 01")
  StopEmitters("ClocktowerFistFX_Explode")
end
ct_ArmExplode = L0_0
function L0_0(A0_47, A1_48)
  AudioPostEventOn("ClocktowerFistBreak", "Play_sfx_ClockTower_Hand_Shatter")
  AudioPostEventOn(A1_48, "Play_sfx_ClockTower_Forearm_Shatter")
  BULLETTIME = true
  SetPercentGameSpeed(0.1)
  SetTransformation("ClocktowerFistBreak", A0_47, vector4(0, 0, 0))
  Unhide("ClocktowerFistBreak")
  AnimGBReset("ClocktowerFistBreak")
  AnimGBSequence("ClocktowerFistBreak", "HandBreak")
  SetTransformation("ClocktowerFistFX_Explode", A0_47, vector4(0, 0, 0))
  StartEmitters("ClocktowerFistFX_Explode")
  wait(1)
  Unhide(A1_48)
  AnimGBReset(A1_48)
  AnimGBSequence(A1_48, "ArmBreak")
  wait(0.2)
  SetPercentGameSpeed(1)
  BULLETTIME = false
  wait(0.8)
  SetCameraAttributes("sw_clockworkboss_cameras.Marker(CameraOverride) 01")
  StopEmitters("ClocktowerFistFX_Explode")
end
ct_HandArmExplode = L0_0
function L0_0(A0_49, A1_50)
  local L2_51
  L2_51 = Enable
  L2_51(A1_50)
  L2_51 = ct_shakeCamera_Medium
  L2_51()
  L2_51 = AnimGBReset
  L2_51("SunAndClouds")
  L2_51 = AnimGBSequence
  L2_51("SunAndClouds", "ground_pound_react")
  L2_51 = AudioPostEventOn
  L2_51("Smash_2D", "Play_sfx_ClockTower_FistSlam_Impact")
  L2_51 = GetPosition
  L2_51 = L2_51(A0_49)
  L2_51.y = 0
  if A1_50 == "LeftHandDamage" and (LeftArmWeakness == eArmWeakHand or LeftArmWeakness == eArmWeakAll) then
    SetBoneScaleAll("LeftArm", 0)
    SetBoneScale("LeftArm", "leftforearm", 1)
    ForEachEntityInGroup(Hide, "LArmHand")
    StartEmitters("sw_clockworkboss_dynamic.HydraulicSpurtLeftWrist1")
    StartEmitters("sw_clockworkboss_dynamic.HydraulicSpurtLeftWrist2")
    if LeftArmWeakness == eArmWeakHand then
      LeftArmWeakness = eArmNoHand
      ct_FistExplode(L2_51)
      ct_UnpaintHand("Right")
    end
  elseif A1_50 == "RightHandDamage" and (RightArmWeakness == eArmWeakHand or RightArmWeakness == eArmWeakAll) then
    SetBoneScaleAll("RightArm", 0)
    SetBoneScale("RightArm", "rightforearm", 1)
    ForEachEntityInGroup(Hide, "RArmHand")
    StartEmitters("sw_clockworkboss_dynamic.HydraulicSpurtRightWrist")
    if RightArmWeakness == eArmWeakHand then
      RightArmWeakness = eArmNoHand
      ct_FistExplode(L2_51)
      ct_UnpaintHand("Left")
    end
  end
  if A1_50 == "LeftHandDamage" and (LeftArmWeakness == eArmWeakArm or LeftArmWeakness == eArmWeakAll) then
    SetBoneScale("LeftArm", "leftforearm", 0)
    Hide("LArmForearm")
    LeftArmWeakness = eArmNoArm
    L2_51.z = L2_51.z - 13
    SetTransformation("ClocktowerArmBreakL", L2_51, vector4(0, 0, 0))
    StopEmitters("sw_clockworkboss_dynamic.HydraulicSpurtLeftWrist1")
    StopEmitters("sw_clockworkboss_dynamic.HydraulicSpurtLeftWrist2")
    StartEmitters("sw_clockworkboss_dynamic.HydraulicSpurtLeftElbow1")
    StartEmitters("sw_clockworkboss_dynamic.HydraulicSpurtLeftElbow2")
    StartEmitters("sw_clockworkboss_dynamic.HydraulicSpurtRightCheek")
    if LeftArmWeakness == eArmWeakAll then
      ct_HandArmExplode(L2_51, "ClocktowerArmBreakL")
      ct_UnpaintHand("Right")
    else
      ct_ArmExplode(L2_51, "ClocktowerArmBreakL")
      ct_UnpaintHand("Right")
    end
    ct_disableArmForDamage("Left")
    LeftArmState = eArmStateDisabled
    if RightArmState == eArmStateDisabled then
      ct_BossDefeatSequence()
    end
  elseif A1_50 == "RightHandDamage" and (RightArmWeakness == eArmWeakArm or RightArmWeakness == eArmWeakAll) then
    SetBoneScale("RightArm", "rightforearm", 0)
    Hide("RArmForearm")
    RightArmWeakness = eArmNoArm
    L2_51.z = L2_51.z - 13
    SetTransformation("ClocktowerArmBreakR", L2_51, vector4(0, 0, 0))
    StopEmitters("sw_clockworkboss_dynamic.HydraulicSpurtRightWrist")
    StartEmitters("sw_clockworkboss_dynamic.HydraulicSpurtLeftCheek")
    StartEmitters("sw_clockworkboss_dynamic.HydraulicSpurtRightElbow")
    if RightArmWeakness == eArmWeakAll then
      ct_HandArmExplode(L2_51, "ClocktowerArmBreakR")
      ct_UnpaintHand("Left")
    else
      ct_ArmExplode(L2_51, "ClocktowerArmBreakR")
      ct_UnpaintHand("Left")
    end
    ct_disableArmForDamage("Right")
    RightArmState = eArmStateDisabled
    if LeftArmState == eArmStateDisabled then
      ct_BossDefeatSequence()
    end
  end
  if true == false then
    if A1_50 == "LeftHandDamage" then
      SetTransformation("ClocktowerFistFX_DustL", L2_51, vector4(0, 0, 0))
      StartEmitters("ClocktowerFistFX_DustL")
      wait(0.1)
      ClockBoss_DropPickup("BouncyPickupPositionGun2", "Ammo_PaintThinner", L2_51)
    elseif A1_50 == "RightHandDamage" then
      SetTransformation("ClocktowerFistFX_DustR", L2_51, vector4(0, 0, 0))
      StartEmitters("ClocktowerFistFX_DustR")
      wait(0.1)
      ClockBoss_DropPickup("BouncyPickupPositionGun1", "Ammo_PaintThinner", L2_51)
    end
  end
  if A1_50 == "RightHandDamage" then
    AnimVarFloat("RightArm", VAR_Playback_Speed, 0)
    wait(0.1)
    Disable(A1_50)
    ForEachEntityInGroup(SetPropertyInt, "RArmHand", "Collision Layer", 17)
    ForEachEntityInGroup(SetPropertyInt, "RArmForearm", "Collision Layer", 17)
    wait(0.4)
    AnimVarFloat("RightArm", VAR_Playback_Speed, 1)
  elseif A1_50 == "LeftHandDamage" then
    AnimVarFloat("LeftArm", VAR_Playback_Speed, 0)
    wait(0.1)
    Disable(A1_50)
    ForEachEntityInGroup(SetPropertyInt, "LArmHand", "Collision Layer", 17)
    ForEachEntityInGroup(SetPropertyInt, "LArmForearm", "Collision Layer", 17)
    wait(0.4)
    AnimVarFloat("LeftArm", VAR_Playback_Speed, 1)
  end
  wait(1.5)
  StopEmitters("ClocktowerFistFX_DustL")
  StopEmitters("ClocktowerFistFX_DustR")
  StopEmitters("ClocktowerFistFX_Explode")
  wait(0.5)
  AnimGBSequence("SunAndClouds", "idle_loop")
  Hide("ClocktowerFistBreak")
  AnimGBReset("ClocktowerFistBreak")
  Hide("ClocktowerArmBreakL")
  Hide("ClocktowerArmBreakR")
  SetPropertyBool("LArmForearm", "ForceInvulnerable", false)
  SetPropertyBool("RArmForearm", "ForceInvulnerable", false)
  SetPropertyBool("LArmForearm", "InvulnerableToPaintThinner", false)
  SetPropertyBool("RArmForearm", "InvulnerableToPaintThinner", false)
end
ct_FistImpact = L0_0
function L0_0()
  ct_RemoveFistsAndForearms()
  ct_HideBossCollisionAndGus()
  SetParentEntity("ClocktowerArmPartLeft", nil)
  SetParentEntity("ClocktowerArmPartRight", nil)
  SetTransformation("ClocktowerArmPartLeft", vector4(9.4, 7.8, -2), vector4(-90, 0, 0))
  SetTransformation("ClocktowerArmPartRight", vector4(-9.4, 7.8, -2), vector4(90, 0, 0))
  SaveCurrentCameraOverride()
  RestrictCutSceneInput()
  SetLetterbox(1)
  AnimEvent("RightArm", EVENT_Special_5)
  AnimEvent("LeftArm", EVENT_Special_5)
  AnimEvent("BossFace", EVENT_Special_5)
  TeleportToEntity("sw_clockworkboss_igc.ClockDefeatCamera", "sw_clockworkboss_igc.ClockDefeatPositionMarker")
  GrabCameraNif("sw_clockworkboss_igc.ClockDefeatCamera", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("sw_clockworkboss_igc.ClockDefeatCamera")
  AnimGBSequence("sw_clockworkboss_igc.ClockDefeatCamera", "camera")
  StartEmitters("ClocktowerArmFX_SplashDownArms")
  StartEmitters("ClocktowerArmFX_SplashDownFace")
  SetGlobal("CT_DefeatedThinner", 1)
  Disable("sw_clockworkboss_cameras.PlaneTrigger 10")
  ct_thinspeak()
  Hide("sw_clockworkboss_dynamic.ClockSmile")
  Hide("sw_clockworkboss_cameras.StaticScriptableProp 01")
  TimerEnable("sw_clockworkboss_cameras.EndShake 01")
  Unhide("sw_clockworkboss_cameras.CollisionBrokenArms")
  Unhide("sw_clockworkboss_cameras.CollisionBrokenFace")
  wait(5)
  AudioPostEventOn("BossFace", "Play_sfx_ClockTower_Broken2")
  ForceSequence("sw_clockworkboss_cameras.Marker(Conversation) 05", "PoTW_ZM_HookHurt4")
  StopEmitters("sw_clockworkboss_dynamic.HydraulicSpurtRightElbow")
  wait(8)
  AudioPostEventOn("sw_clockworkboss_audio.Sound_Marker_BrokenArms", "Play_sfx_ClockTower_sparks")
  wait(7)
  AudioSetState(GetPlayer(), "Music_State", "Boss_Win")
  StartEmitters("ClocktowerArmFX_DeathHydraulics")
  wait(5)
  StopEmitters("ClocktowerArmFX_SplashDownArms")
  StopEmitters("ClocktowerArmFX_SplashDownFace")
  SetCameraAttributes("sw_clockworkboss_cameras.DeadArm(CameraOverride) 02")
  SetSplineFollowerInitialSpeed("sw_clockworkboss_cameras.DeadArmCameraControlPoint 01", 10)
  wait(1)
  SetRotatorMaxSpeed("sw_clockworkboss_cameras.ExitDoor 01", 100)
  SetRotatorMaxSpeed("sw_clockworkboss_cameras.ExitDoor 02", 100)
  AudioPostEventOn(GetPlayer(), "Play_sfx_ClockTower_DoubleDoors_Open")
  wait(0.1)
  StartRotateToPosition("sw_clockworkboss_cameras.ExitDoor 01", 110)
  StartRotateToPosition("sw_clockworkboss_cameras.ExitDoor 02", -110)
  wait(2)
  StartFadeOut(1)
  wait(1)
  CameraReset()
  LoadSavedCameraOverride()
  ForEachEntityInGroup(StopEmitters, "HydraulicThinnerSpurt1")
  Unhide("sw_clockworkboss_dynamic.Gremlin_Gus 01")
  StartFadeIn(1)
  SetCameraAttributes("sw_clockworkboss_cameras.Marker(CameraOverride) 02")
  wait(1)
  SetLetterbox(0)
  Enable("sw_clockworkboss_cameras.PlaneTrigger 01")
  ForceSequence("sw_clockworkboss_cameras.Marker(Conversation) 02", "CT_BeatSucess")
  wait(1)
  SetGlobal("PaintUpgrade_Clocktower", 1)
  SetGlobal("CT_ClockTowerResolution", 0)
  ct_GusUpgradeType = 2
  FireSequence("sw_clockworkboss_dynamic.Gremlin_Gus 01", "Gus_IncreasedAmmo")
end
ct_BossDefeatSequence = L0_0
function L0_0()
  SetBoneScaleAll("LeftArm", 0)
  SetBoneScale("LeftArm", "leftforearm", 0)
  ForEachEntityInGroup(Hide, "LArmHand")
  Hide("LArmForearm")
  SetBoneScaleAll("RightArm", 0)
  SetBoneScale("RightArm", "rightforearm", 0)
  ForEachEntityInGroup(Hide, "RArmHand")
  Hide("RArmForearm")
  LeftArmWeakness = eArmNoArm
  RightArmWeakness = eArmNoArm
  SetShadowScale("LeftArm", vector4(0, 0, 0))
  SetShadowScale("RightArm", vector4(0, 0, 0))
end
ct_RemoveFistsAndForearms = L0_0
function L0_0()
  Hide("sw_clockworkboss_dynamic.Gremlin_Gus 01")
  Hide("sw_clockworkboss_dynamic.Gremlin_Gus 02")
  Hide("sw_clockworkboss_cameras.CollisionBrokenArms")
  Hide("sw_clockworkboss_cameras.CollisionBrokenFace")
  Hide("sw_clockworkboss_cameras.CollisionPaintedArmsRF")
  Hide("sw_clockworkboss_cameras.CollisionPaintedArmsLF")
  Hide("sw_clockworkboss_cameras.CollisionHelpingArmsRF")
  Hide("sw_clockworkboss_cameras.CollisionHelpingArmsLF")
end
ct_HideBossCollisionAndGus = L0_0
function L0_0()
  local L0_52, L1_53, L2_54, L3_55, L4_56, L5_57
  L0_52 = 2.5
  L1_53 = 5
  L2_54 = 0.1
  L3_55 = 8
  L4_56 = 0.2
  L5_57 = 0.001
  ShakeCamera(L0_52, L1_53, L2_54, L3_55, L4_56, L5_57)
end
ct_shakeCamera_Hard = L0_0
function L0_0()
  local L0_58, L1_59, L2_60, L3_61, L4_62, L5_63
  L0_58 = 2.5
  L1_59 = 5
  L2_60 = 0
  L3_61 = 9
  L4_62 = 0.2
  L5_63 = 0.001
  ShakeCamera(L0_58, L1_59, L2_60, L3_61, L4_62, L5_63)
end
ct_shakeCamera_Medium = L0_0
function L0_0()
  local L0_64, L1_65, L2_66, L3_67, L4_68, L5_69
  L0_64 = 0.5
  L1_65 = 0.5
  L2_66 = 1
  L3_67 = 0.25
  L4_68 = 0.2
  L5_69 = 0.05
  ShakeCamera(L0_64, L1_65, L2_66, L3_67, L4_68, L5_69)
end
ct_shakeCamera_Soft = L0_0
function L0_0()
  local L0_70, L1_71, L2_72, L3_73, L4_74, L5_75
  L0_70 = 1
  L1_71 = 0.5
  L2_72 = 0.5
  L3_73 = 0.015
  L4_74 = 0.015
  L5_75 = 0.01
  ShakeCamera(L0_70, L1_71, L2_72, L3_73, L4_74, L5_75)
end
ct_ConstantShake = L0_0
function L0_0(A0_76)
  local L1_77, L2_78, L3_79, L4_80, L5_81
  L1_77 = GetName
  L2_78 = A0_76
  L1_77 = L1_77(L2_78)
  L2_78 = L1_77.sub
  L3_79 = L1_77
  L4_80 = 26
  L2_78 = L2_78(L3_79, L4_80)
  L3_79 = LiftArm
  if L3_79 ~= "Right" or L2_78 == "TriggerHand" then
    L3_79 = LiftArm
  elseif L3_79 == "Left" and L2_78 ~= "TriggerHandLeftRotate" then
    return
  end
  L3_79 = LiftArm
  if L3_79 ~= "none" then
    L3_79 = Loaded
    if L3_79 == false then
      L3_79 = Disable
      L4_80 = A0_76
      L3_79(L4_80)
      L3_79 = DisableMovementInput
      L4_80 = GetPlayer
      L5_81 = L4_80()
      L3_79(L4_80, L5_81, L4_80())
      L3_79 = wait
      L4_80 = 0.5
      L3_79(L4_80)
    end
  end
  L3_79 = LiftArm
  if L3_79 == "Right" then
    L3_79 = AnimEvent
    L4_80 = "LeftArm"
    L5_81 = EVENT_LiftMickeyRF
    L3_79(L4_80, L5_81)
    L3_79 = AnimEvent
    L4_80 = "RightArm"
    L5_81 = EVENT_LiftMickeyRF
    L3_79(L4_80, L5_81)
    L3_79 = 0.7
    L4_80 = GetFacing
    L5_81 = GetPlayer
    L5_81 = L5_81()
    L4_80 = L4_80(L5_81, L5_81())
    L5_81 = GetPosition
    L5_81 = L5_81("MickeyInRightHand")
    AudioPostEventOn(GetPlayer(), "Play_sfx_ClockTower_BigArm_Lift")
    while L3_79 > 0 do
      L5_81 = GetPosition("MickeyInRightHand") + (GetPosition(GetPlayer()) - L5_81)
      SetTransformation(GetPlayer(), L5_81, L4_80)
      L3_79 = L3_79 - 0.033
      wait(0.033)
    end
  end
  L3_79 = LiftArm
  if L3_79 == "Left" then
    L3_79 = AnimEvent
    L4_80 = "LeftArm"
    L5_81 = EVENT_LiftMickeyLF
    L3_79(L4_80, L5_81)
    L3_79 = AnimEvent
    L4_80 = "RightArm"
    L5_81 = EVENT_LiftMickeyLF
    L3_79(L4_80, L5_81)
    L3_79 = 0.7
    L4_80 = GetFacing
    L5_81 = GetPlayer
    L5_81 = L5_81()
    L4_80 = L4_80(L5_81, L5_81())
    L5_81 = GetPosition
    L5_81 = L5_81("MickeyInLeftHand")
    AudioPostEventOn(GetPlayer(), "Play_sfx_ClockTower_BigArm_Lift")
    while L3_79 > 0 do
      L5_81 = GetPosition("MickeyInLeftHand") + (GetPosition(GetPlayer()) - L5_81)
      SetTransformation(GetPlayer(), L5_81, L4_80)
      L3_79 = L3_79 - 0.033
      wait(0.033)
    end
  end
end
ct_paintLift = L0_0
function L0_0(A0_82, A1_83)
  local L2_84
  L2_84 = vector4
  L2_84 = L2_84(0, 0, 1, A1_83)
  SetR3MTConstReg(A0_82, 2, L2_84)
end
ct_paintTexture = L0_0
L0_0 = false
isDegrading = L0_0
function L0_0(A0_85)
  local L1_86
  L1_86 = GetName
  L1_86 = L1_86(A0_85)
  TimerDisable(A0_85)
  if L1_86.sub(L1_86, 26) == "LeftArmTimer" then
    LeftArmSlow = 0
    isDegrading = true
    while (LeftArmWeakness == eArmPaint or LeftArmWeakness == eArmPaintNoHand) and FightStage == "fists" and LeftArmSlow < 1 and LeftInterPaint == false do
      LeftArmSlow = LeftArmSlow + 0.1
      if LeftArmSlow > 1 then
        LeftArmSlow = 1
      end
      for _FORV_6_ = 1, 9 do
        ct_paintTexture(PartStati[_FORV_6_], LeftArmSlow)
      end
      wait(0.5)
    end
    isDegrading = false
    if (LeftArmWeakness == eArmPaint or LeftArmWeakness == eArmPaintNoHand) and FightStage == "fists" and LeftInterPaint == false then
      if LeftArmWeakness == eArmPaint then
        LeftArmWeakness = eArmNone
      elseif LeftArmWeakness == eArmPaintNoHand then
        LeftArmWeakness = eArmNoHand
      end
      LeftArmState = eArmStateAvailable
      StopEmitters("ClocktowerFistFX_GoodL")
      AnimEvent("LeftArm", EVENT_Start_HitReaction)
      AudioPostEventOn("LeftHandDamage", "Play_sfx_ClockTower_BigArm_UnStuck")
      ct_ChangeLeftArmTeamBad()
    end
    if LeftInterPaint == true then
      LeftInterPaint = false
      TimerReset(A0_85)
      TimerEnable(A0_85)
    end
  end
  if L1_86.sub(L1_86, 26) == "RightArmTimer" then
    RightArmSlow = 0
    isDegrading = true
    while (RightArmWeakness == eArmPaint or RightArmWeakness == eArmPaintNoHand) and FightStage == "fists" and 1 > RightArmSlow and RightInterPaint == false do
      RightArmSlow = RightArmSlow + 0.1
      if 1 < RightArmSlow then
        RightArmSlow = 1
      end
      for _FORV_6_ = 10, 18 do
        ct_paintTexture(PartStati[_FORV_6_], RightArmSlow)
      end
      wait(0.5)
    end
    isDegrading = false
    if (RightArmWeakness == eArmPaint or RightArmWeakness == eArmPaintNoHand) and FightStage == "fists" and RightInterPaint == false then
      if RightArmWeakness == eArmPaint then
        RightArmWeakness = eArmNone
      elseif RightArmWeakness == eArmPaintNoHand then
        RightArmWeakness = eArmNoHand
      end
      RightArmState = eArmStateAvailable
      StopEmitters("ClocktowerFistFX_GoodR")
      AnimEvent("RightArm", EVENT_Start_HitReaction)
      AudioPostEventOn("RightHandDamage", "Play_sfx_ClockTower_BigArm_UnStuck")
      ct_ChangeRightArmTeamBad()
    end
    if RightInterPaint == true then
      RightInterPaint = false
      TimerReset(A0_85)
      TimerEnable(A0_85)
    end
  end
end
ct_unfreezeHand = L0_0
function L0_0(A0_87)
  local L1_88
  L1_88 = FightStage
  if L1_88 ~= eFightStageFace then
    L1_88 = GetName
    L1_88 = L1_88(A0_87)
    if L1_88.sub(L1_88, 26, 29) == "LArm" and LeftArmWeakness == eArmPaint then
      ct_UnpaintHand("Left")
    elseif L1_88.sub(L1_88, 26, 29) == "RArm" and RightArmWeakness == eArmPaint then
      ct_UnpaintHand("Right")
    end
  end
end
ct_unpaintArms = L0_0
function L0_0(A0_89)
  if A0_89 == "Left" and LeftArmWeakness == eArmPaint then
    AnimEvent("LeftArm", EVENT_Start_HitReaction)
    AudioPostEventOn("LeftHandDamage", "Play_sfx_ClockTower_BigArm_UnStuck")
    if LeftArmWeakness == eArmPaint then
      LeftArmWeakness = eArmNone
    elseif LeftArmWeakness == eArmPaintNoHand then
      LeftArmWeakness = eArmNoHand
    end
    LeftArmState = eArmStateAvailable
    LeftArmSlow = 1
    for _FORV_4_ = 1, 9 do
      ct_paintTexture(PartStati[_FORV_4_], LeftArmSlow)
    end
    StopEmitters("ClocktowerFistFX_GoodL")
    ct_ChangeLeftArmTeamBad()
  end
  if A0_89 == "Right" and RightArmWeakness == eArmPaint then
    AnimEvent("RightArm", EVENT_Start_HitReaction)
    AudioPostEventOn("RightHandDamage", "Play_sfx_ClockTower_BigArm_UnStuck")
    if RightArmWeakness == eArmPaint then
      RightArmWeakness = eArmNone
    elseif RightArmWeakness == eArmPaintNoHand then
      RightArmWeakness = eArmNoHand
    end
    RightArmState = eArmStateAvailable
    RightArmSlow = 1
    for _FORV_4_ = 10, 18 do
      ct_paintTexture(PartStati[_FORV_4_], RightArmSlow)
    end
    StopEmitters("ClocktowerFistFX_GoodR")
    ct_ChangeRightArmTeamBad()
  end
end
ct_UnpaintHand = L0_0
function L0_0()
  local L0_90, L1_91, L2_92
  FightStage = L0_90
  LeftArmWeakness = L0_90
  LeftArmState = L0_90
  RightArmWeakness = L0_90
  RightArmState = L0_90
  for _FORV_3_ = 1, 18 do
    ct_paintTexture(PartStati[_FORV_3_], 0)
  end
end
ct_cleanUpSetPaint = L0_0
function L0_0()
  local L0_93, L1_94, L2_95
  for _FORV_3_ = 1, 18 do
    SetPropertyBool(PartStati[_FORV_3_], "InvulnerableToPaintThinner", true)
  end
end
ct_inertArms = L0_0
L0_0 = 0
updatePaint = L0_0
function L0_0(A0_96)
  local L1_97
  L1_97 = GetName
  L1_97 = L1_97(A0_96)
  if L1_97.sub(L1_97, 26, 29) == "LArm" and (LeftArmWeakness == eArmPaint or LeftArmWeakness == eArmPaintNoHand) then
    if isDegrading == true then
      LeftInterPaint = true
    end
    TimerReset("LeftArmTimer")
    TimerEnable("LeftArmTimer")
  end
  if L1_97.sub(L1_97, 26, 29) == "RArm" and (RightArmWeakness == eArmPaint or RightArmWeakness == eArmPaintNoHand) then
    if isDegrading == true then
      RightInterPaint = true
    end
    TimerReset("RightArmTimer")
    TimerEnable("RightArmTimer")
  end
  if L1_97.sub(L1_97, 26, 29) == "LArm" and (LeftArmWeakness == eArmNone or LeftArmWeakness == eArmNoHand or LeftArmWeakness == eArmPaint or LeftArmWeakness == eArmPaintNoHand) and RightArmWeakness ~= eArmWeakArm and RightArmWeakness ~= eArmWeakAll then
    LeftArmSlow = LeftArmSlow - 0.01
    updatePaint = updatePaint + 1
    if LeftArmSlow <= 0 then
      LeftArmSlow = 0
      if LeftArmWeakness ~= eArmPaint and LeftArmWeakness ~= eArmPaintNoHand then
        if LeftArmWeakness == eArmNoHand and RightArmWeakness == eArmPaint then
          ct_cleanUpSetPaint()
          ForEachEntityInGroup(SetPropertyInt, "LArmParts", "Team", 4)
          AnimEvent("RightArm", EVENT_React_HelpHandsRFront)
          AudioPostEventOn("RightHandDamage", "Play_sfx_ClockTower_BigArm_Move")
          AnimEvent("LeftArm", EVENT_LeadMusicStart)
          wait(1)
          LiftArm = "Right"
          Disable("TriggerHandLeft")
          Hide("TriggerHandLeft")
          ct_inertArms()
        elseif (RightArmWeakness == eArmPaint or RightArmWeakness == eArmPaintNoHand) and ct_broken("Left") ~= true then
          ct_cleanUpSetPaint()
          ForEachEntityInGroup(SetPropertyInt, "LArmParts", "Team", 4)
          AnimEvent("LeftArm", EVENT_React_HelpHandsLFront)
          AudioPostEventOn("LeftHandDamage", "Play_sfx_ClockTower_BigArm_Move")
          wait(1)
          LiftArm = "Left"
          Disable("TriggerHandRight")
          Hide("TriggerHandRight")
          ct_inertArms()
        else
          Hide("sw_clockworkboss_cameras.StaticScriptableProp 01")
          AnimEvent("LeftArm", EVENT_LeadMusicStart)
          TimerEnable("LeftArmTimer")
        end
        if LeftArmWeakness == eArmNone then
          LeftArmWeakness = eArmPaint
        else
          LeftArmWeakness = eArmPaintNoHand
        end
        LeftArmState = eArmStateDisabled
        ForEachEntityInGroup(SetPropertyInt, "LArmHand", "Collision Layer", 17)
        ForEachEntityInGroup(SetPropertyInt, "LArmForearm", "Collision Layer", 17)
        StartEmitters("ClocktowerFistFX_GoodL")
        ct_ChangeLeftArmTeamGood()
        AddHeroPoints(GetPlayer(), GetGlobal("HeroReward_Clocktower"))
        wait(1)
        StartEmitters("ClocktowerFistFX_ConvertL")
        wait(1)
        StopEmitters("ClocktowerFistFX_ConvertL")
      end
    end
    if 6 <= updatePaint then
      updatePaint = 0
      for _FORV_9_ = 1, 9 do
        ct_paintTexture(PartStati[_FORV_9_], LeftArmSlow)
      end
    end
  elseif L1_97.sub(L1_97, 26, 29) == "RArm" and (RightArmWeakness == eArmNone or RightArmWeakness == eArmNoHand or RightArmWeakness == eArmPaint or RightArmWeakness == eArmPaintNoHand) and LeftArmWeakness ~= eArmWeakArm and LeftArmWeakness ~= eArmWeakAll then
    RightArmSlow = RightArmSlow - 0.01
    updatePaint = updatePaint + 1
    if 0 >= RightArmSlow then
      RightArmSlow = 0
      if RightArmWeakness ~= eArmPaint and RightArmWeakness ~= eArmPaintNoHand then
        if RightArmWeakness == eArmNoHand and LeftArmWeakness == eArmPaint then
          ct_cleanUpSetPaint()
          ForEachEntityInGroup(SetPropertyInt, "LArmParts", "Team", 4)
          AnimEvent("LeftArm", EVENT_React_HelpHandsLFront)
          AudioPostEventOn("LeftHandDamage", "Play_sfx_ClockTower_BigArm_Move")
          AnimEvent("RightArm", EVENT_LeadMusicStart)
          wait(1)
          LiftArm = "Left"
          Disable("TriggerHandRight")
          Hide("TriggerHandRight")
          ct_inertArms()
        elseif (LeftArmWeakness == eArmPaint or LeftArmWeakness == eArmPaintNoHand) and ct_broken("Right") ~= true then
          ct_cleanUpSetPaint()
          ForEachEntityInGroup(SetPropertyInt, "LArmParts", "Team", 4)
          AnimEvent("RightArm", EVENT_React_HelpHandsRFront)
          AudioPostEventOn("RightHandDamage", "Play_sfx_ClockTower_BigArm_Move")
          wait(1)
          LiftArm = "Right"
          Disable("TriggerHandLeft")
          Hide("TriggerHandLeft")
          ct_inertArms()
        else
          Hide("sw_clockworkboss_cameras.StaticScriptableProp 01")
          AnimEvent("RightArm", EVENT_LeadMusicStart)
          TimerEnable("RightArmTimer")
        end
        if RightArmWeakness == eArmNone then
          RightArmWeakness = eArmPaint
        else
          RightArmWeakness = eArmPaintNoHand
        end
        RightArmState = eArmStateDisabled
        ForEachEntityInGroup(SetPropertyInt, "RArmHand", "Collision Layer", 17)
        ForEachEntityInGroup(SetPropertyInt, "RArmForearm", "Collision Layer", 17)
        StartEmitters("ClocktowerFistFX_GoodR")
        ct_ChangeRightArmTeamGood()
        AddHeroPoints(GetPlayer(), GetGlobal("HeroReward_Clocktower"))
        wait(1)
        StartEmitters("ClocktowerFistFX_ConvertR")
        wait(1)
        StopEmitters("ClocktowerFistFX_ConvertR")
      end
    end
    if 6 <= updatePaint then
      updatePaint = 0
      for _FORV_9_ = 10, 18 do
        ct_paintTexture(PartStati[_FORV_9_], RightArmSlow)
      end
    end
  end
end
ct_paintArms = L0_0
L0_0 = {
  "LArmForearm",
  "LArmPalm",
  "LArmThumb",
  "LArmPinky",
  "LArmPinkyBase",
  "LArmIndex",
  "LArmIndexBase",
  "LArmMiddle",
  "LArmMiddleBase",
  "RArmForearm",
  "RArmPalm",
  "RArmThumb",
  "RArmPinky",
  "RArmPinkyBase",
  "RArmIndex",
  "RArmIndexBase",
  "RArmMiddle",
  "RArmMiddleBase"
}
PartStati = L0_0
L0_0 = 0
sequentialOwie = L0_0
L0_0 = false
ArmsDefeated = L0_0
function L0_0(A0_98)
  local L1_99, L2_100, L3_101, L4_102, L5_103, L6_104
  L1_99 = GetName
  L2_100 = A0_98
  L1_99 = L1_99(L2_100)
  L2_100 = L1_99.sub
  L3_101 = L1_99
  L4_102 = 26
  L5_103 = 29
  L2_100 = L2_100(L3_101, L4_102, L5_103)
  if L2_100 == "LArm" then
    L3_101 = LeftArmWeakness
    L4_102 = eArmPaint
    if L3_101 ~= L4_102 then
      L3_101 = LeftArmWeakness
      L4_102 = eArmPaintNoHand
    elseif L3_101 == L4_102 then
      L3_101 = ct_unpaintArms
      L4_102 = A0_98
      L3_101(L4_102)
      L3_101 = ct_unfreezeHand
      L4_102 = "LeftArmTimer"
      L3_101(L4_102)
    end
  elseif L2_100 == "RArm" then
    L3_101 = RightArmWeakness
    L4_102 = eArmPaint
    if L3_101 ~= L4_102 then
      L3_101 = RightArmWeakness
      L4_102 = eArmPaintNoHand
    elseif L3_101 == L4_102 then
      L3_101 = ct_unpaintArms
      L4_102 = A0_98
      L3_101(L4_102)
      L3_101 = ct_unfreezeHand
      L4_102 = "RightArmTimer"
      L3_101(L4_102)
    end
  end
  L3_101 = TimerDisable
  L4_102 = "TimerFists"
  L3_101(L4_102)
  L3_101 = L1_99.sub
  L4_102 = L1_99
  L5_103 = 26
  L3_101 = L3_101(L4_102, L5_103)
  L4_102 = L1_99.sub
  L5_103 = L1_99
  L6_104 = 30
  L4_102 = L4_102(L5_103, L6_104)
  L5_103 = currentZone
  L6_104 = 2.4
  if L4_102 == "Forearm" then
    if L2_100 == "LArm" and (LeftArmWeakness == eArmNone or LeftArmWeakness == eArmWeakHand or LeftArmWeakness == eArmNoHand) then
      if LeftArmWeakness == eArmNone then
        LeftArmWeakness = eArmWeakAll
      else
        LeftArmWeakness = eArmWeakArm
      end
      AnimEvent("LeftArm", EVENT_Start_HitReaction)
      wait(L6_104)
      if L5_103 < 2 then
        L5_103 = 2
      end
      ct_MainHandAttack("Left", L5_103)
      AddScrapperPoints(GetPlayer(), GetGlobal("ScrapperReward_Clocktower"))
    elseif L2_100 == "RArm" and (RightArmWeakness == eArmNone or RightArmWeakness == eArmWeakHand or RightArmWeakness == eArmNoHand) then
      if RightArmWeakness == eArmNone then
        RightArmWeakness = eArmWeakAll
      else
        RightArmWeakness = eArmWeakArm
      end
      AnimEvent("RightArm", EVENT_Start_HitReaction)
      wait(L6_104)
      if L5_103 > 6 then
        L5_103 = 6
      end
      ct_MainHandAttack("Right", L5_103)
      AddScrapperPoints(GetPlayer(), GetGlobal("ScrapperReward_Clocktower"))
    end
  elseif L4_102 == "Palm" then
    if L2_100 == "LArm" and LeftArmWeakness == eArmNone then
      LeftArmWeakness = eArmWeakHand
      AnimEvent("LeftArm", EVENT_Start_HitReaction)
      wait(L6_104)
      if L5_103 < 2 then
        L5_103 = 2
      end
      ct_MainHandAttack("Left", L5_103)
      AddScrapperPoints(GetPlayer(), GetGlobal("ScrapperReward_Clocktower"))
    elseif L2_100 == "RArm" and RightArmWeakness == eArmNone then
      RightArmWeakness = eArmWeakHand
      AnimEvent("RightArm", EVENT_Start_HitReaction)
      wait(L6_104)
      if L5_103 > 6 then
        L5_103 = 6
      end
      ct_MainHandAttack("Right", L5_103)
      AddScrapperPoints(GetPlayer(), GetGlobal("ScrapperReward_Clocktower"))
    end
  end
  TimerReset("TimerFists")
  TimerEnable("TimerFists")
end
ct_thinArms = L0_0
function L0_0(A0_105)
  if GetGlobal("CT_DefeatedPaint") == 0 then
    Hide("RiverWall")
  end
  if GetGlobal("CT_DefeatedPaint") == 0 and GetGlobal("CT_DefeatedThinner") == 0 then
    LeftArmState = eArmStateAvailable
    RightArmState = eArmStateAvailable
    if GetGlobal("CT_Gus_FaceHint_Played") == 0 then
      StartFadeInNoHUD(0.5)
    end
    AudioPostEventOn("sw_clockworkboss_audio.Sound_Marker 01", "Play_music_gremlinvillage_boss")
    AudioSetState(GetPlayer(), "Music_State", "Boss")
    ct_HideBossCollisionAndGus()
    RestrictCutSceneInput()
    SetWallPushingEnabled(GetPlayer(), false)
    SetLetterbox(1)
    SetMap(nil, "MAP_GV_CLOCKBOSS", "GAME")
    SetCameraAttributes("sw_clockworkboss_cameras.IntroMarker(CameraOverride) 01")
    AudioPostEventOn("Sound_Marker_AmbientMain", "Play_sfx_ClockTower_BigArms_Reveal_Extend")
    wait(2)
    ForceSequence("sw_clockworkboss_cameras.Marker(Conversation) 01", "GV_Zonel_CompleteObjective")
    ForceSketched("sw_clockworkboss_dynamic.ClockSmile")
    AudioPostEventOn("sw_clockworkboss_dynamic.ClockSmile", "Play_sfx_ClockFace_thinned_out")
    wait(1.5)
    AnimEvent("RightArm", EVENT_Special_7)
    AnimEvent("LeftArm", EVENT_Special_7)
    wait(1.5)
    ct_shakeCamera_Hard()
    AnimGBSequence("SunAndClouds", "ground_pound_react")
    AnimGBSequence("ClocktowerArmDoorsBreak", "break")
    wait(1)
    SetCameraAttributes("sw_clockworkboss_cameras.Marker(CameraOverride) 10")
    wait(1.5)
    EnterCutscene(GetPlayer(), 22)
    wait(2)
    EnterCutscene(GetPlayer(), 23)
    wait(2)
    ExitCutscene(GetPlayer())
    AnimEvent(GetPlayer(), EVENT_Finished_Sequence)
    ForceSequence("sw_clockworkboss_cameras.Marker(Conversation) 01", "CT_BeatFace")
    SetCameraAttributes("sw_clockworkboss_cameras.Marker(CameraOverride) 01")
    SetLetterbox(0)
    UnrestrictCutSceneInput()
    ShowHud()
    Hide("ClocktowerArmDoorsBreak")
    ForEachEntityInGroup(Enable, "Zones")
    TimerEnable("TimerFists")
    ct_SaveCheckpointBoss()
  end
end
ct_IntroCutScene = L0_0
function L0_0(A0_106)
  local L1_107, L2_108, L3_109
  L1_107 = AudioSetState
  L2_108 = GetPlayer
  L2_108 = L2_108()
  L3_109 = "Music_State"
  L1_107(L2_108, L3_109, "Boss_Win")
  L1_107 = Disable
  L2_108 = "sw_clockworkboss_cameras.TriggerRotate 01"
  L1_107(L2_108)
  L1_107 = Enable
  L2_108 = "sw_clockworkboss_cameras.TriggerRotate 02"
  L1_107(L2_108)
  L1_107 = SetGlobal
  L2_108 = "CT_DefeatedPaint"
  L3_109 = 1
  L1_107(L2_108, L3_109)
  L1_107 = Hide
  L2_108 = "sw_clockworkboss_cameras.StaticScriptableProp 01"
  L1_107(L2_108)
  L1_107 = RestrictCutSceneInput
  L1_107()
  L1_107 = Disable
  L2_108 = "sw_clockworkboss_cameras.PlaneTrigger 01"
  L1_107(L2_108)
  L1_107 = Disable
  L2_108 = "sw_clockworkboss_cameras.PlaneTrigger 03"
  L1_107(L2_108)
  L1_107 = Disable
  L2_108 = "sw_clockworkboss_cameras.PlaneTrigger 04"
  L1_107(L2_108)
  L1_107 = Disable
  L2_108 = "sw_clockworkboss_cameras.PlaneTrigger 05"
  L1_107(L2_108)
  L1_107 = Disable
  L2_108 = "sw_clockworkboss_cameras.PlaneTrigger 06"
  L1_107(L2_108)
  L1_107 = Disable
  L2_108 = "sw_clockworkboss_cameras.PlaneTrigger 07"
  L1_107(L2_108)
  L1_107 = Disable
  L2_108 = "sw_clockworkboss_cameras.PlaneTrigger 10"
  L1_107(L2_108)
  L1_107 = Disable
  L2_108 = "sw_clockworkboss_cameras.TriggerRotate 01"
  L1_107(L2_108)
  L1_107 = Disable
  L2_108 = "sw_clockworkboss_cameras.TriggerRotate 02"
  L1_107(L2_108)
  L1_107 = AudioPostEventOn
  L2_108 = "BossFace"
  L3_109 = "Play_sfx_ClockTower_Happy"
  L1_107(L2_108, L3_109)
  L1_107 = ForceSequence
  L2_108 = "sw_clockworkboss_cameras.Marker(Conversation) 03"
  L3_109 = "CT_SaveSucess"
  L1_107(L2_108, L3_109)
  L1_107 = wait
  L2_108 = 6
  L1_107(L2_108)
  L1_107 = SetCameraAttributes
  L2_108 = "sw_clockworkboss_cameras.FacePainted(CameraOverride) 01"
  L1_107(L2_108)
  L1_107 = SetCameraAttributes
  L2_108 = "sw_clockworkboss_cameras.FacePainted(CameraOverride) 02"
  L1_107(L2_108)
  L1_107 = LiftArm
  if L1_107 == "Left" then
    L1_107 = AnimEvent
    L2_108 = "RightArm"
    L3_109 = EVENT_React_HelpHandsRFront
    L1_107(L2_108, L3_109)
    L1_107 = AnimEvent
    L2_108 = "LeftArm"
    L3_109 = EVENT_LiftMickeyLFEnd
    L1_107(L2_108, L3_109)
    L1_107 = Unhide
    L2_108 = "sw_clockworkboss_dynamic.clockworkArmsHelpRFCollision_LT 01"
    L1_107(L2_108)
    L1_107 = Unhide
    L2_108 = "sw_clockworkboss_dynamic.clockworkArmsHelpRFCollision_RT 01"
    L1_107(L2_108)
    L1_107 = 0.7
    L2_108 = GetFacing
    L3_109 = GetPlayer
    L3_109 = L3_109()
    L2_108 = L2_108(L3_109, L3_109())
    L3_109 = GetPosition
    L3_109 = L3_109("MickeyInLeftHand")
    AudioPostEventOn(GetPlayer(), "Play_sfx_ClockTower_BigArm_Lift")
    while L1_107 > 0 do
      L3_109 = GetPosition("MickeyInLeftHand") + (GetPosition(GetPlayer()) - L3_109)
      SetTransformation(GetPlayer(), L3_109, L2_108)
      L1_107 = L1_107 - 0.033
      wait(0.033)
    end
  else
    L1_107 = LiftArm
    if L1_107 == "Right" then
      L1_107 = AnimEvent
      L2_108 = "RightArm"
      L3_109 = EVENT_LiftMickeyRFEnd
      L1_107(L2_108, L3_109)
      L1_107 = AnimEvent
      L2_108 = "LeftArm"
      L3_109 = EVENT_React_HelpHandsLFront
      L1_107(L2_108, L3_109)
      L1_107 = Unhide
      L2_108 = "sw_clockworkboss_dynamic.clockworkArmsHelpLFCollision_LT 01"
      L1_107(L2_108)
      L1_107 = Unhide
      L2_108 = "sw_clockworkboss_dynamic.clockworkArmsHelpLFCollision_RT 01"
      L1_107(L2_108)
      L1_107 = 0.7
      L2_108 = GetFacing
      L3_109 = GetPlayer
      L3_109 = L3_109()
      L2_108 = L2_108(L3_109, L3_109())
      L3_109 = GetPosition
      L3_109 = L3_109("MickeyInRightHand")
      AudioPostEventOn(GetPlayer(), "Play_sfx_ClockTower_BigArm_Lift")
      while L1_107 > 0 do
        L3_109 = GetPosition("MickeyInRightHand") + (GetPosition(GetPlayer()) - L3_109)
        SetTransformation(GetPlayer(), L3_109, L2_108)
        L1_107 = L1_107 - 0.033
        wait(0.033)
      end
    end
  end
  L1_107 = wait
  L2_108 = 3
  L1_107(L2_108)
  L1_107 = Unhide
  L2_108 = "sw_clockworkboss_dynamic.Gremlin_Gus 02"
  L1_107(L2_108)
  L1_107 = SetRotatorMaxSpeed
  L2_108 = "sw_clockworkboss_cameras.ExitDoor 01"
  L3_109 = 100
  L1_107(L2_108, L3_109)
  L1_107 = SetRotatorMaxSpeed
  L2_108 = "sw_clockworkboss_cameras.ExitDoor 02"
  L3_109 = 100
  L1_107(L2_108, L3_109)
  L1_107 = StartRotateToPosition
  L2_108 = "sw_clockworkboss_cameras.ExitDoor 01"
  L3_109 = 110
  L1_107(L2_108, L3_109)
  L1_107 = StartRotateToPosition
  L2_108 = "sw_clockworkboss_cameras.ExitDoor 02"
  L3_109 = -110
  L1_107(L2_108, L3_109)
  L1_107 = AudioPostEventOn
  L2_108 = GetPlayer
  L2_108 = L2_108()
  L3_109 = "Play_sfx_ClockTower_DoubleDoors_Open"
  L1_107(L2_108, L3_109)
  L1_107 = wait
  L2_108 = 2
  L1_107(L2_108)
  L1_107 = wait
  L2_108 = 1
  L1_107(L2_108)
  L1_107 = EnableMovementInput
  L2_108 = GetPlayer
  L3_109 = L2_108()
  L1_107(L2_108, L3_109, L2_108())
  L1_107 = Disable
  L2_108 = "sw_clockworkboss_cameras.PlaneTrigger 02"
  L1_107(L2_108)
  L1_107 = Enable
  L2_108 = "sw_clockworkboss_cameras.PlaneTrigger 01"
  L1_107(L2_108)
  L1_107 = Enable
  L2_108 = "sw_clockworkboss_cameras.PlaneTrigger 04"
  L1_107(L2_108)
  L1_107 = Enable
  L2_108 = "sw_clockworkboss_cameras.PlaneTrigger 05"
  L1_107(L2_108)
  L1_107 = Enable
  L2_108 = "sw_clockworkboss_cameras.PlaneTrigger 10"
  L1_107(L2_108)
  L1_107 = Enable
  L2_108 = "sw_clockworkboss_cameras.TriggerRotate 01"
  L1_107(L2_108)
  L1_107 = Enable
  L2_108 = "sw_clockworkboss_cameras.TriggerRotate 02"
  L1_107(L2_108)
  L1_107 = wait
  L2_108 = 2
  L1_107(L2_108)
  L1_107 = SetGlobal
  L2_108 = "PaintUpgrade_Clocktower"
  L3_109 = 1
  L1_107(L2_108, L3_109)
  L1_107 = SetGlobal
  L2_108 = "CT_ClockTowerResolution"
  L3_109 = 1
  L1_107(L2_108, L3_109)
  L1_107 = 1
  ct_GusUpgradeType = L1_107
  L1_107 = FireSequence
  L2_108 = "sw_clockworkboss_dynamic.Gremlin_Gus 02"
  L3_109 = "Gus_IncreasedAmmo"
  L1_107(L2_108, L3_109)
end
ct_PaintedCutScene = L0_0
L0_0 = 0
ct_GusUpgradeType = L0_0
function L0_0()
  DoStinger("Stinger_Success", 7)
  if ct_GusUpgradeType == 1 then
    Mickey_Receive_Item_NPC("sw_clockworkboss_dynamic.seq_getitemfromnpc 02.Spawner", "PaintUpgrade")
    wait(1.5)
    IncreaseMaxPaintAmmo()
  elseif ct_GusUpgradeType == 2 then
    Mickey_Receive_Item_NPC("sw_clockworkboss_dynamic.seq_getitemfromnpc 01.Spawner", "ThinnerUpgrade")
    wait(1.5)
    IncreaseMaxThinnerAmmo()
  end
end
ct_GusGiveUpgrade_Start = L0_0
function L0_0()
  if ct_GusUpgradeType == 1 then
    Mickey_GetItem_ClearItem("sw_clockworkboss_dynamic.seq_getitemfromnpc 02.Spawner", "PaintUpgrade")
    GiveCollectible("CapIncrease_Paint")
    wait(3)
    GiveCollectible("Stop_the_Music")
    wait(3)
    ct_SaveCheckpointBossDefeatPainted()
    TeleportGremlinOut("sw_clockworkboss_dynamic.Gremlin_Gus 02")
    Hide("sw_clockworkboss_dynamic.Gremlin_Gus 02")
    Show("RiverWall")
  elseif ct_GusUpgradeType == 2 then
    Mickey_GetItem_ClearItem("sw_clockworkboss_dynamic.seq_getitemfromnpc 01.Spawner", "ThinnerUpgrade")
    GiveCollectible("CapIncrease_Thinner")
    wait(3)
    GiveCollectible("Unwind_the_Clock")
    wait(3)
    ct_SaveCheckpointBossDefeatThinned()
    TeleportGremlinOut("sw_clockworkboss_dynamic.Gremlin_Gus 01")
    Hide("sw_clockworkboss_dynamic.Gremlin_Gus 01")
    Hide("RiverWall")
  end
  StartFadeOut(0.8)
  wait(0.8)
  UnpauseAllAI()
  UnrestrictCutSceneInput()
  if ct_GusUpgradeType == 1 then
    SetCameraAttributes("sw_clockworkboss_cameras.Marker(CameraOverride) 04")
  elseif ct_GusUpgradeType == 2 then
    SetCameraAttributes("sw_clockworkboss_cameras.Marker(CameraOverride) 02")
  end
  wait(0.1)
  StartFadeIn(0.5)
  Enable("sw_clockworkboss_cameras.PlaneTrigger 02")
end
ct_GusGiveUpgrade_Finish = L0_0
function L0_0()
  local L0_110, L1_111
end
ct_DeadArms = L0_0
function L0_0(A0_112)
  if A0_112 == "All" or A0_112 == "Arms" then
    print([[


LeftArmState:]] .. LeftArmState)
    print("RightArmState:" .. RightArmState)
    print("FightStage:" .. FightStage)
    print("prevZone:" .. prevZone)
    print("currentZone:" .. currentZone)
    print("LeftFistDamage:" .. LeftFistDamage)
    print("RightFistDamage:" .. RightFistDamage)
  end
  if A0_112 == "All" or A0_112 == "ThinParts" then
    print("PartStatus_LArmForearm:" .. PartStati.LArmForearm)
    print("PartStatus_LArmPalm:" .. PartStati.LArmPalm)
    print("PartStatus_LArmThumb:" .. PartStati.LArmThumb)
    print("PartStatus_LArmPinky:" .. PartStati.LArmPinky)
    print("PartStatus_LArmPinkyBase:" .. PartStati.LArmPinkyBase)
    print("PartStatus_LArmIndex:" .. PartStati.LArmIndex)
    print("PartStatus_LArmIndexBase:" .. PartStati.LArmIndexBase)
    print("PartStatus_LArmMiddle:" .. PartStati.LArmMiddle)
    print("PartStatus_LArmMiddleBase:" .. PartStati.LArmMiddleBase)
    print("PartStatus_RArmForearm:" .. PartStati.RArmForearm)
    print("PartStatus_RArmPalm:" .. PartStati.RArmPalm)
    print("PartStatus_RArmThumb:" .. PartStati.RArmThumb)
    print("PartStatus_RArmPinky:" .. PartStati.RArmPinky)
    print("PartStatus_RArmPinkyBase:" .. PartStati.RArmPinkyBase)
    print("PartStatus_RArmIndex:" .. PartStati.RArmIndex)
    print("PartStatus_RArmIndexBase:" .. PartStati.RArmIndexBase)
    print("PartStatus_RArmMiddle:" .. PartStati.RArmMiddle)
    print("PartStatus_RArmMiddleBase:" .. PartStati.RArmMiddleBase)
  end
end
ct_DisplayUsefulInfo = L0_0
function L0_0()
  Hide(GetEntity("RightArm"))
  Hide(GetEntity("LeftArm"))
  Disable(GetEntity("RightHandDamage"))
  Disable(GetEntity("LeftHandDamage"))
  ForEachEntityInGroup(Hide, "RArmParts")
  ForEachEntityInGroup(Hide, "LArmParts")
end
HACK_RemoveArms = L0_0
function L0_0(A0_113)
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "Levels/MeanStreet_V1.level")
end
ct_ExitThroughProjector = L0_0
function L0_0(A0_114)
  SetBoneScaleAll("LeftArm", 0)
  SetBoneScale("LeftArm", "leftforearm", 1)
  ForEachEntityInGroup(Hide, "LArmHand")
  SetBoneScaleAll("RightArm", 0)
  SetBoneScale("RightArm", "rightforearm", 1)
  ForEachEntityInGroup(Hide, "RArmHand")
  StartEmitters("sw_clockworkboss_dynamic.HydraulicSpurtRightWrist")
  StartEmitters("sw_clockworkboss_dynamic.HydraulicSpurtLeftWrist1")
  StartEmitters("sw_clockworkboss_dynamic.HydraulicSpurtLeftWrist2")
  LeftArmWeakness = eArmNoHand
  RightArmWeakness = eArmNoHand
end
ct_Cheat_DestroyFists = L0_0
function L0_0(A0_115)
  SetBoneScaleAll("LeftArm", 0)
  SetBoneScale("LeftArm", "leftforearm", 0)
  ForEachEntityInGroup(Hide, "LArmHand")
  Hide("LArmForearm")
  SetBoneScaleAll("RightArm", 0)
  SetBoneScale("RightArm", "rightforearm", 0)
  ForEachEntityInGroup(Hide, "RArmHand")
  Hide("RArmForearm")
  StartEmitters("sw_clockworkboss_dynamic.HydraulicSpurtRightElbow")
  StartEmitters("sw_clockworkboss_dynamic.HydraulicSpurtLeftElbow1")
  StartEmitters("sw_clockworkboss_dynamic.HydraulicSpurtLeftElbow2")
  LeftArmWeakness = eArmNoArm
  RightArmWeakness = eArmNoArm
end
ct_Cheat_DestroyForeArms = L0_0
function L0_0()
  wait(0.1)
  AudioPostEventOn("BossFace", "Play_sfx_ClockTower_Happy2")
  if math.random(1, 3) == 1 then
    ForceSequence("sw_clockworkboss_cameras.Marker(Conversation) 04", "ClockTower_Painted01")
  elseif math.random(1, 3) == 2 then
    ForceSequence("sw_clockworkboss_cameras.Marker(Conversation) 04", "ClockTower_Painted02")
  elseif math.random(1, 3) == 3 then
    ForceSequence("sw_clockworkboss_cameras.Marker(Conversation) 04", "ClockTower_Painted03")
  end
end
ct_paintspeak = L0_0
function L0_0()
  AudioPostEventOn("BossFace", "Play_sfx_ClockTower_Broken")
  ForceSequence("sw_clockworkboss_cameras.Marker(Conversation) 04", "ClockTower_Thinned01")
end
ct_thinspeak = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "ct_CheckpointLoad", "sw_clockworkboss_cameras.PositionMarker 02")
end
ct_SaveCheckpointBoss = L0_0
function L0_0()
  SetMap(nil, "MAP_GV_CLOCKBOSS", "GAME")
  SetGlobal("CT_Gus_FaceHint_Played", 1)
end
ct_CheckpointLoad = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "ct_CheckpointLoadAfterBossPainted", "sw_clockworkboss_cameras.PositionMarker 02")
end
ct_SaveCheckpointBossDefeatPainted = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "ct_CheckpointLoadAfterBossThinned", "sw_clockworkboss_cameras.PositionMarker 02")
end
ct_SaveCheckpointBossDefeatThinned = L0_0
function L0_0()
  local L0_116, L1_117
  L0_116 = true
  Loaded = L0_116
  L0_116 = RestrictCutSceneInput
  L0_116()
  L0_116 = Disable
  L1_117 = "TriggerHandRight"
  L0_116(L1_117)
  L0_116 = Hide
  L1_117 = "TriggerHandRight"
  L0_116(L1_117)
  L0_116 = Disable
  L1_117 = "TriggerHandLeft"
  L0_116(L1_117)
  L0_116 = Hide
  L1_117 = "TriggerHandLeft"
  L0_116(L1_117)
  L0_116 = SetMap
  L1_117 = nil
  L0_116(L1_117, "MAP_GV_CLOCKBOSS", "GAME")
  L0_116 = SetHealth
  L1_117 = GetPlayer
  L1_117 = L1_117()
  L0_116(L1_117, 5)
  L0_116 = ct_HideBossCollisionAndGus
  L0_116()
  L0_116 = ct_inertArms
  L0_116()
  L0_116 = ct_cleanUpSetPaint
  L0_116()
  L0_116 = AnimEvent
  L1_117 = "RightArm"
  L0_116(L1_117, EVENT_React_HelpHandsRFront)
  L0_116 = AnimEvent
  L1_117 = "LeftArm"
  L0_116(L1_117, EVENT_LiftMickeyLFEnd)
  L0_116 = ForEachEntityInGroup
  L1_117 = SetPropertyInt
  L0_116(L1_117, "RArmHand", "Collision Layer", 17)
  L0_116 = ForEachEntityInGroup
  L1_117 = SetPropertyInt
  L0_116(L1_117, "RArmForearm", "Collision Layer", 17)
  L0_116 = ForEachEntityInGroup
  L1_117 = SetPropertyInt
  L0_116(L1_117, "LArmHand", "Collision Layer", 17)
  L0_116 = ForEachEntityInGroup
  L1_117 = SetPropertyInt
  L0_116(L1_117, "LArmForearm", "Collision Layer", 17)
  L0_116 = Hide
  L1_117 = "sw_clockworkboss_cameras.StaticScriptableProp 01"
  L0_116(L1_117)
  L0_116 = Disable
  L1_117 = "sw_clockworkboss_cameras.TriggerRotate 01"
  L0_116(L1_117)
  L0_116 = Enable
  L1_117 = "sw_clockworkboss_cameras.TriggerRotate 02"
  L0_116(L1_117)
  L0_116 = SetSplineFollowerInitialSpeed
  L1_117 = "sw_clockworkboss_cameras.FacePaintedControlPoint 01"
  L0_116(L1_117, 10)
  L0_116 = SetSplineFollowerInitialSpeed
  L1_117 = "sw_clockworkboss_cameras.FacePaintedControlPoint 01"
  L0_116(L1_117, 0)
  L0_116 = SetRotatorMaxSpeed
  L1_117 = "sw_clockworkboss_cameras.ExitDoor 01"
  L0_116(L1_117, 100)
  L0_116 = SetRotatorMaxSpeed
  L1_117 = "sw_clockworkboss_cameras.ExitDoor 02"
  L0_116(L1_117, 100)
  L0_116 = StartRotateToPosition
  L1_117 = "sw_clockworkboss_cameras.ExitDoor 01"
  L0_116(L1_117, 110)
  L0_116 = StartRotateToPosition
  L1_117 = "sw_clockworkboss_cameras.ExitDoor 02"
  L0_116(L1_117, -110)
  L0_116 = GetFacing
  L1_117 = GetPlayer
  L1_117 = L1_117()
  L0_116 = L0_116(L1_117, L1_117())
  L1_117 = GetPosition
  L1_117 = L1_117("sw_clockworkboss_dynamic.Gremlin_Gus 02")
  SetTransformation(GetPlayer(), L1_117, L0_116)
  wait(2)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  Enable("sw_clockworkboss_cameras.PlaneTrigger 02")
  Show("RiverWall")
  UnrestrictCutSceneInput()
  wait(0.1)
  Unhide("sw_clockworkboss_dynamic.clockworkArmsHelpRFCollision_LT 01")
  Unhide("sw_clockworkboss_dynamic.clockworkArmsHelpRFCollision_RT 01")
end
ct_CheckpointLoadAfterBossPainted = L0_0
function L0_0()
  Loaded = true
  RestrictCutSceneInput()
  SetMap(nil, "MAP_GV_CLOCKBOSS", "GAME")
  SetHealth(GetPlayer(), 5)
  ct_RemoveFistsAndForearms()
  ct_HideBossCollisionAndGus()
  SetParentEntity("ClocktowerArmPartLeft", nil)
  SetParentEntity("ClocktowerArmPartRight", nil)
  SetTransformation("ClocktowerArmPartLeft", vector4(9.4, 7.8, -2), vector4(-90, 0, 0))
  SetTransformation("ClocktowerArmPartRight", vector4(-9.4, 7.8, -2), vector4(90, 0, 0))
  AnimEvent("RightArm", EVENT_Special_4)
  AnimEvent("LeftArm", EVENT_Special_4)
  AnimEvent("BossFace", EVENT_Special_4)
  Unhide("sw_clockworkboss_cameras.CollisionBrokenArms")
  Unhide("sw_clockworkboss_cameras.CollisionBrokenFace")
  Hide("sw_clockworkboss_dynamic.ClockSmile")
  Hide("sw_clockworkboss_cameras.StaticScriptableProp 01")
  Disable("sw_clockworkboss_cameras.PlaneTrigger 10")
  StartEmitters("ClocktowerArmFX_DeathHydraulics")
  AudioPostEventOn("sw_clockworkboss_audio.Sound_Marker_BrokenArms", "Play_sfx_ClockTower_sparks")
  SetCameraAttributes("sw_clockworkboss_cameras.DeadArm(CameraOverride) 02")
  SetSplineFollowerInitialSpeed("sw_clockworkboss_cameras.DeadArmCameraControlPoint 01", 10)
  SetRotatorMaxSpeed("sw_clockworkboss_cameras.ExitDoor 01", 100)
  SetRotatorMaxSpeed("sw_clockworkboss_cameras.ExitDoor 02", 100)
  wait(0.1)
  StartRotateToPosition("sw_clockworkboss_cameras.ExitDoor 01", 110)
  StartRotateToPosition("sw_clockworkboss_cameras.ExitDoor 02", -110)
  wait(2)
  SetCameraAttributes("sw_clockworkboss_cameras.Marker(CameraOverride) 02")
  wait(1)
  Hide("RiverWall")
  UnrestrictCutSceneInput()
end
ct_CheckpointLoadAfterBossThinned = L0_0
function L0_0()
  SetCameraAttributes("sw_clockworkboss_cameras.Marker(CameraOverride) 01")
end
ct_ResetCameras = L0_0
function L0_0()
  ForEachEntityInGroup(SetCurrentTeam, "LArmParts", 3)
end
ct_ChangeLeftArmTeamGood = L0_0
function L0_0()
  ForEachEntityInGroup(SetCurrentTeam, "RArmParts", 3)
end
ct_ChangeRightArmTeamGood = L0_0
function L0_0()
  ForEachEntityInGroup(SetCurrentTeam, "LArmParts", 2)
end
ct_ChangeLeftArmTeamBad = L0_0
function L0_0()
  ForEachEntityInGroup(SetCurrentTeam, "RArmParts", 2)
end
ct_ChangeRightArmTeamBad = L0_0
