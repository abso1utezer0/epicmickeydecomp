
local L0_0, L1_1

function BeetleworxCannonPaintAttachment(A0_2, A1_3)
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

function BeetleworxCannonThinAttachment(A0_6, A1_7)
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

function DisableAllWeapons(var1)
  DisableWeapon(GetChildEntityByName(var1, "BeetleworxCannonBerserkShot"))
  DisableWeapon(GetChildEntityByName(var1, "BeetleworxCannonLeftShotPaintLow"))
  DisableWeapon(GetChildEntityByName(var1, "BeetleworxCannonRightShotPaintLow"))
  DisableWeapon(GetChildEntityByName(var1, "BeetleworxCannonDoubleShot"))
  DisableWeapon(GetChildEntityByName(var1, "BeetleworxCannonLeftShotThinnerLow"))
  DisableWeapon(GetChildEntityByName(var1, "BeetleworxCannonRightShotThinnerLow"))
  DisableWeapon(GetChildEntityByName(var1, "BeetleworxCannonDoubleDownShot"))
end

function EnableBerserkWeapons(A0_18, A1_19)
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

function BeetleworxCannonCarChangedState(A0_28)
  local L1_29
  L1_29 = GetPropertyEntity
  L1_29 = L1_29(A0_28, "Parent Entity")
  if IsValidHandle(L1_29) then
    EnableBerserkWeapons(L1_29, not GetPropertyBool(A0_28, "Is Painted"))
  end
end

function BeetleworxCannonGunChangedState(A0_30)
  local L1_31
  L1_31 = GetPropertyEntity
  L1_31 = L1_31(A0_30, "Parent Entity")
  if IsValidHandle(L1_31) then
    BeetleworxCannonUpdateShotWeapons(L1_31)
  end
end

function DisableWeapon(A0_32)
  if IsValidHandle(A0_32) then
    SetPropertyInt(A0_32, "WeaponShots", 0)
  end
end

function EnableWeapon(A0_33)
  if IsValidHandle(A0_33) then
    SetPropertyInt(A0_33, "WeaponShots", -1)
  end
end

function DamageParent(A0_34, A1_35)
  local L2_36
  L2_36 = GetPropertyEntity
  L2_36 = L2_36(A0_34, "Parent Entity", 0)
  if IsValidHandle(L2_36) and StimHasDamage(A1_35) then
    PlayWeakspotHitEffect(L2_36, A1_35)
  end
end

function BeetleworxCannonAnvilDamage(A0_37)
  local L1_38
  L1_38 = 0
  SetHealth(A0_37, L1_38)
end

function BeetleworxBasherAnvilDamage(A0_39)
  local L1_40
  L1_40 = 0
  SetHealth(A0_39, L1_40)
  EnableComponent(A0_39, "Template Spawner")
end

function BeetleworxThinnerOceanDestroy(A0_41)
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

lastDamageTime = nil

function PlayOrientedEffect(A0_43, A1_44, A2_45)
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

function WeakspotExposed(A0_50)
  local L1_51
  L1_51 = GetChildEntityByName
  L1_51 = L1_51(A0_50, "BeetleworxCannonWeakSpot")
  if IsValidHandle(L1_51) and (GetPropertyBool(A0_50, "ForceInvulnerable") or GetPropertyFloat(A0_50, "InvulnerableDuration") > 0) then
    return false
  end
  return true
end

function StimHasDamage(A0_52)
  local L1_53
  L1_53 = false
  if StimulusEvent_HasStimulusType(A0_52, ST_SPIN) and StimulusEvent_EffectiveAmount(A0_52, ST_SPIN) > 0 then
    return true
  end
  return false
end

function PlayWeakspotHitEffect(A0_54, A1_55)
  if WeakspotExposed(A0_54) and StimHasDamage(A1_55) and (lastDamageTime == nil or timestamp() - lastDamageTime > 0.5) then
    lastDamageTime = timestamp()
  end
end

function PlayInvulnerableHitEffect(A0_56, A1_57)
  if not WeakspotExposed(A0_56) and StimulusEvent_HasStimulusType(A1_57, ST_SPIN) and (lastDamageTime == nil or timestamp() - lastDamageTime > 0.5) then
    lastDamageTime = timestamp()
  end
end

function BeetleworxCannonReorientLeftShooter(A0_58)
  local L1_59
  L1_59 = GetLeft
  L1_59 = L1_59(A0_58)
  SetFacing(A0_58, L1_59)
end

function BeetleworxCannonReorientRightShooter(A0_60)
  local L1_61
  L1_61 = GetLeft
  L1_61 = L1_61(A0_60)
  L1_61 = -L1_61
  SetFacing(A0_60, L1_61)
end

function BeetleworxCannonReorientHealthRing(A0_62)
  local L1_63
  L1_63 = GetUp
  L1_63 = L1_63(A0_62)
  SetFacing(A0_62, L1_63)
end

function BeetleworxCannonEndHindrance(A0_64, A1_65)
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

function BeetleworxGibAngularImpulse()
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

function HinderTurnRate(A0_70)
  SetOverrideTurnRate(A0_70, 0)
end

function EndHinderTurnRate(A0_71)
  ResetOverrideTurnRate(A0_71)
end

function OnBeetleworxCrawlerToonStimmedPaintThinner(A0_72)
  BeetleworxToonShellThinnedUpdateSound(A0_72, "BW_Thinned", 100)
end

function OnBeetleworxFodderToonStimmedPaintThinner(A0_73)
  BeetleworxToonShellThinnedUpdateSound(A0_73, "BW_Thinned", 100)
end

function OnBeetleworxMeleeToonStimmedPaintThinner(A0_74)
  BeetleworxToonShellThinnedUpdateSound(A0_74, "BW_Thinned", 100)
end

function OnBeetleworxCannonToonStimmedPaintThinner(A0_75)
  BeetleworxToonShellThinnedUpdateSound(A0_75, "BW_Thinned", 100)
end

function BeetleworxToonShellThinnedUpdateSound(A0_76, A1_77, A2_78)
  AudioSetParameter(nil, A1_77, A2_78 * PaintThinnerCounter_GetPaintedPercentage(A0_76))
end

function BeetleworxGibFadeOut(A0_79)
  local L2_80
  L2_80 = 0.05
  SetR3MTOverrideTransparent(A0_79)
  while 0 < 1 do
    SetR3MTConstRegAlpha(A0_79, 3, 1 - (0 + L2_80))
    Wait(0.05)
  end
end

function BW_SpawnerOrb(A0_81, A1_82)
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