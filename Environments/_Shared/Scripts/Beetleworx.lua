local L0_0, L1_1
function L0_0(A0_2, A1_3)
  local L2_4, L3_5
  L2_4 = GetPropertyEntity
  L3_5 = A0_2
  L2_4 = L2_4(L3_5, "Parent Entity")
  L3_5 = IsValidHandle
  L3_5 = L3_5(L2_4)
  if L3_5 then
    L3_5 = GetChildEntityByName
    L3_5 = L3_5(L2_4, A1_3)
    if IsValidHandle(L3_5) then
      ForcePainted(L3_5)
    end
  end
end
BeetleworxCannonPaintAttachment = L0_0
function L0_0(A0_6, A1_7)
  local L2_8, L3_9
  L2_8 = GetPropertyEntity
  L3_9 = A0_6
  L2_8 = L2_8(L3_9, "Parent Entity")
  L3_9 = IsValidHandle
  L3_9 = L3_9(L2_8)
  if L3_9 then
    L3_9 = GetChildEntityByName
    L3_9 = L3_9(L2_8, A1_7)
    if IsValidHandle(L3_9) then
      ForceSketched(L3_9)
    end
  end
end
BeetleworxCannonThinAttachment = L0_0
function L0_0(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17
  L1_11 = GetChildEntityByName
  L2_12 = A0_10
  L3_13 = "BeetleworxCannonBerserkShot"
  L1_11 = L1_11(L2_12, L3_13)
  L2_12 = GetChildEntityByName
  L3_13 = A0_10
  L4_14 = "BeetleworxCannonLeftShotPaintLow"
  L2_12 = L2_12(L3_13, L4_14)
  L3_13 = GetChildEntityByName
  L4_14 = A0_10
  L5_15 = "BeetleworxCannonRightShotPaintLow"
  L3_13 = L3_13(L4_14, L5_15)
  L4_14 = GetChildEntityByName
  L5_15 = A0_10
  L6_16 = "BeetleworxCannonDoubleShot"
  L4_14 = L4_14(L5_15, L6_16)
  L5_15 = GetChildEntityByName
  L6_16 = A0_10
  L7_17 = "BeetleworxCannonLeftShotThinnerLow"
  L5_15 = L5_15(L6_16, L7_17)
  L6_16 = GetChildEntityByName
  L7_17 = A0_10
  L6_16 = L6_16(L7_17, "BeetleworxCannonRightShotThinnerLow")
  L7_17 = GetChildEntityByName
  L7_17 = L7_17(A0_10, "BeetleworxCannonDoubleDownShot")
  DisableWeapon(L1_11)
  DisableWeapon(L3_13)
  DisableWeapon(L4_14)
  DisableWeapon(L5_15)
  DisableWeapon(L7_17)
end
DisableAllWeapons = L0_0
function L0_0(A0_18, A1_19)
  local L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27
  L2_20 = GetChildEntityByName
  L3_21 = A0_18
  L4_22 = "BeetleworxCannonBerserkShot"
  L2_20 = L2_20(L3_21, L4_22)
  L3_21 = GetChildEntityByName
  L4_22 = A0_18
  L5_23 = "BeetleworxCannonLeftShotPaintLow"
  L3_21 = L3_21(L4_22, L5_23)
  L4_22 = GetChildEntityByName
  L5_23 = A0_18
  L6_24 = "BeetleworxCannonRightShotPaintLow"
  L4_22 = L4_22(L5_23, L6_24)
  L5_23 = GetChildEntityByName
  L6_24 = A0_18
  L7_25 = "BeetleworxCannonDoubleShot"
  L5_23 = L5_23(L6_24, L7_25)
  L6_24 = GetChildEntityByName
  L7_25 = A0_18
  L8_26 = "BeetleworxCannonLeftShotThinnerLow"
  L6_24 = L6_24(L7_25, L8_26)
  L7_25 = GetChildEntityByName
  L8_26 = A0_18
  L9_27 = "BeetleworxCannonRightShotThinnerLow"
  L7_25 = L7_25(L8_26, L9_27)
  L8_26 = GetChildEntityByName
  L9_27 = A0_18
  L8_26 = L8_26(L9_27, "BeetleworxCannonDoubleDownShot")
  L9_27 = GetChildEntityByName
  L9_27 = L9_27(A0_18, "BeetleworxCannonSwipe")
  if A1_19 then
    EnableWeapon(L2_20)
    DisableWeapon(L4_22)
    DisableWeapon(L5_23)
    DisableWeapon(L6_24)
    DisableWeapon(L8_26)
    DisableWeapon(L9_27)
  else
    DisableWeapon(L2_20)
    EnableWeapon(L3_21)
    EnableWeapon(L4_22)
    EnableWeapon(L5_23)
    EnableWeapon(L6_24)
    EnableWeapon(L7_25)
    EnableWeapon(L8_26)
    EnableWeapon(L9_27)
  end
end
EnableBerserkWeapons = L0_0
function L0_0(A0_28)
  local L1_29
  L1_29 = GetPropertyEntity
  L1_29 = L1_29(A0_28, "Parent Entity")
  if IsValidHandle(L1_29) then
    EnableBerserkWeapons(L1_29, not GetPropertyBool(A0_28, "Is Painted"))
  end
end
BeetleworxCannonCarChangedState = L0_0
function L0_0(A0_30)
  local L1_31
  L1_31 = GetPropertyEntity
  L1_31 = L1_31(A0_30, "Parent Entity")
  if IsValidHandle(L1_31) then
    BeetleworxCannonUpdateShotWeapons(L1_31)
  end
end
BeetleworxCannonGunChangedState = L0_0
function L0_0(A0_32)
  if IsValidHandle(A0_32) then
    SetPropertyInt(A0_32, "WeaponShots", 0)
  end
end
DisableWeapon = L0_0
function L0_0(A0_33)
  if IsValidHandle(A0_33) then
    SetPropertyInt(A0_33, "WeaponShots", -1)
  end
end
EnableWeapon = L0_0
function L0_0(A0_34, A1_35)
  local L2_36
  L2_36 = GetPropertyEntity
  L2_36 = L2_36(A0_34, "Parent Entity", 0)
  if IsValidHandle(L2_36) and StimHasDamage(A1_35) then
    PlayWeakspotHitEffect(L2_36, A1_35)
  end
end
DamageParent = L0_0
function L0_0(A0_37)
  local L1_38
  L1_38 = 0
  SetHealth(A0_37, L1_38)
end
BeetleworxCannonAnvilDamage = L0_0
function L0_0(A0_39)
  local L1_40
  L1_40 = 0
  SetHealth(A0_39, L1_40)
  EnableComponent(A0_39, "Template Spawner")
end
BeetleworxBasherAnvilDamage = L0_0
function L0_0(A0_41)
  local L1_42
  L1_42 = 0
  if 0 >= GetPropertyFloat(A0_41, "Slow Vulnerability", 0) then
    return
  end
  SetPropertyFloat(A0_41, "Slow Vulnerability", 0, 0)
  Wait(2)
  DisableMotion(A0_41)
  AIController_SetDisabled(A0_41, true)
  SetHealth(A0_41, L1_42)
end
BeetleworxThinnerOceanDestroy = L0_0
L0_0 = nil
lastDamageTime = L0_0
function L0_0(A0_43, A1_44, A2_45)
  local L3_46, L4_47, L5_48, L6_49
  L3_46 = StartEmitterByName
  L4_47 = A0_43
  L5_48 = A1_44
  L3_46(L4_47, L5_48)
  L3_46 = GetChildEntityByName
  L4_47 = A0_43
  L5_48 = A1_44
  L3_46 = L3_46(L4_47, L5_48)
  L4_47 = GetTargetPosition
  L5_48 = A0_43
  L4_47 = L4_47(L5_48)
  L5_48 = StimulusEvent_Direction
  L6_49 = A2_45
  L5_48 = L5_48(L6_49)
  L5_48 = -L5_48
  L6_49 = L5_48.y
  if L6_49 < 0 then
    L5_48.y = 0
    L6_49 = L5_48.normalize3
    L6_49(L5_48)
  end
  L6_49 = L5_48 * 0.5
  L6_49 = L4_47 + L6_49
  SetTransformation(L3_46, L6_49, L5_48)
end
PlayOrientedEffect = L0_0
function L0_0(A0_50)
  local L1_51
  L1_51 = GetChildEntityByName
  L1_51 = L1_51(A0_50, "BeetleworxCannonWeakSpot")
  if IsValidHandle(L1_51) and (GetPropertyBool(A0_50, "ForceInvulnerable") or GetPropertyFloat(A0_50, "InvulnerableDuration") > 0) then
    return false
  end
  return true
end
WeakspotExposed = L0_0
function L0_0(A0_52)
  local L1_53
  L1_53 = false
  if StimulusEvent_HasStimulusType(A0_52, ST_SPIN) and StimulusEvent_EffectiveAmount(A0_52, ST_SPIN) > 0 then
    return true
  end
  return false
end
StimHasDamage = L0_0
function L0_0(A0_54, A1_55)
  if WeakspotExposed(A0_54) and StimHasDamage(A1_55) and (lastDamageTime == nil or timestamp() - lastDamageTime > 0.5) then
    lastDamageTime = timestamp()
  end
end
PlayWeakspotHitEffect = L0_0
function L0_0(A0_56, A1_57)
  if not WeakspotExposed(A0_56) and StimulusEvent_HasStimulusType(A1_57, ST_SPIN) and (lastDamageTime == nil or timestamp() - lastDamageTime > 0.5) then
    lastDamageTime = timestamp()
  end
end
PlayInvulnerableHitEffect = L0_0
function L0_0(A0_58)
  local L1_59
  L1_59 = GetLeft
  L1_59 = L1_59(A0_58)
  SetFacing(A0_58, L1_59)
end
BeetleworxCannonReorientLeftShooter = L0_0
function L0_0(A0_60)
  local L1_61
  L1_61 = GetLeft
  L1_61 = L1_61(A0_60)
  L1_61 = -L1_61
  SetFacing(A0_60, L1_61)
end
BeetleworxCannonReorientRightShooter = L0_0
function L0_0(A0_62)
  local L1_63
  L1_63 = GetUp
  L1_63 = L1_63(A0_62)
  SetFacing(A0_62, L1_63)
end
BeetleworxCannonReorientHealthRing = L0_0
function L0_0(A0_64, A1_65)
  local L2_66
  L2_66 = StimulusEvent_HasStimulusType
  L2_66 = L2_66(A1_65, ST_THINNER)
  if L2_66 then
    L2_66 = GetPropertyEntity
    L2_66 = L2_66(A0_64, "Parent Entity")
    if IsValidHandle(L2_66) then
      EndHindrance(L2_66)
    end
  end
end
BeetleworxCannonEndHindrance = L0_0
function L0_0()
  local L0_67, L1_68, L2_69
  L0_67 = math
  L0_67 = L0_67.random
  L1_68 = 20
  L2_69 = 40
  L0_67 = L0_67(L1_68, L2_69)
  L1_68 = math
  L1_68 = L1_68.random
  L2_69 = 20
  L1_68 = L1_68(L2_69, 40)
  L2_69 = math
  L2_69 = L2_69.random
  L2_69 = L2_69(20, 40)
  ApplyAngularImpulse(_self(), L0_67, L1_68, L2_69)
end
BeetleworxGibAngularImpulse = L0_0
function L0_0(A0_70)
  SetOverrideTurnRate(A0_70, 0)
end
HinderTurnRate = L0_0
function L0_0(A0_71)
  ResetOverrideTurnRate(A0_71)
end
EndHinderTurnRate = L0_0
function L0_0(A0_72)
  BeetleworxToonShellThinnedUpdateSound(A0_72, "BW_Thinned", 100)
end
OnBeetleworxCrawlerToonStimmedPaintThinner = L0_0
function L0_0(A0_73)
  BeetleworxToonShellThinnedUpdateSound(A0_73, "BW_Thinned", 100)
end
OnBeetleworxFodderToonStimmedPaintThinner = L0_0
function L0_0(A0_74)
  BeetleworxToonShellThinnedUpdateSound(A0_74, "BW_Thinned", 100)
end
OnBeetleworxMeleeToonStimmedPaintThinner = L0_0
function L0_0(A0_75)
  BeetleworxToonShellThinnedUpdateSound(A0_75, "BW_Thinned", 100)
end
OnBeetleworxCannonToonStimmedPaintThinner = L0_0
function L0_0(A0_76, A1_77, A2_78)
  AudioSetParameter(nil, A1_77, A2_78 * PaintThinnerCounter_GetPaintedPercentage(A0_76))
end
BeetleworxToonShellThinnedUpdateSound = L0_0
function L0_0(A0_79)
  local L2_80
  L2_80 = 0.05
  SetR3MTOverrideTransparent(A0_79)
  while 0 < 1 do
    SetR3MTConstRegAlpha(A0_79, 3, 1 - (0 + L2_80))
    Wait(0.05)
  end
end
BeetleworxGibFadeOut = L0_0
function L0_0(A0_81, A1_82)
  local L2_83, L3_84
  L2_83 = AnimGBSequenceEndedName
  L3_84 = A0_81
  L2_83 = L2_83(L3_84, A1_82)
  L3_84 = GetRelativePrefabEntity
  L3_84 = L3_84(A0_81, ".BW_Spawner_Orb")
  Print("DOOR ANIM EVENT")
  if L2_83 == "Close" then
    Print("DOOR CLOSED - SET ORB INVULN")
    SetPropertyBool(L3_84, "InvulnerableToPaintThinner", true)
  elseif L2_83 == "Open" then
    Print("DOOR OPEN - SET ORB VULN")
    SetPropertyBool(L3_84, "InvulnerableToPaintThinner", false)
  end
end
BW_SpawnerOrb = L0_0