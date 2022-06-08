-- Fully reworked

function BeetleworxCannonPaintAttachment(param1, param2)
  if IsValidHandle(GetPropertyEntity(param1, "Parent Entity")) then
    if IsValidHandle(GetChildEntityByName(GetPropertyEntity(param1, "Parent Entity"), param2)) then
      ForcePainted(GetChildEntityByName(GetPropertyEntity(param1, "Parent Entity"), param2))
    end
  end
end

function BeetleworxCannonThinAttachment(param1, param2)
  if IsValidHandle(GetPropertyEntity(param1, "Parent Entity")) then
    if IsValidHandle(GetChildEntityByName(GetPropertyEntity(param1, "Parent Entity"), param2)) then
      ForceSketched(GetChildEntityByName(GetPropertyEntity(param1, "Parent Entity"), param2))
    end
  end
end

function DisableAllWeapons(param1)
  DisableWeapon(GetChildEntityByName(param1, "BeetleworxCannonBerserkShot"))
  DisableWeapon(GetChildEntityByName(param1, "BeetleworxCannonLeftShotPaintLow"))
  DisableWeapon(GetChildEntityByName(param1, "BeetleworxCannonRightShotPaintLow"))
  DisableWeapon(GetChildEntityByName(param1, "BeetleworxCannonDoubleShot"))
  DisableWeapon(GetChildEntityByName(param1, "BeetleworxCannonLeftShotThinnerLow"))
  DisableWeapon(GetChildEntityByName(param1, "BeetleworxCannonRightShotThinnerLow"))
  DisableWeapon(GetChildEntityByName(param1, "BeetleworxCannonDoubleDownShot"))
end

function EnableBerserkWeapons(param1, param2)
  if param2 then
    EnableWeapon(GetChildEntityByName(param1, "BeetleworxCannonBerserkShot"))
    DisableWeapon(GetChildEntityByName(param1, "BeetleworxCannonRightShotPaintLow"))
    DisableWeapon(GetChildEntityByName(param1, "BeetleworxCannonDoubleShot"))
    DisableWeapon(GetChildEntityByName(param1, "BeetleworxCannonLeftShotThinnerLow"))
    DisableWeapon(GetChildEntityByName(param1, "BeetleworxCannonDoubleDownShot"))
    DisableWeapon(GetChildEntityByName(param1, "BeetleworxCannonSwipe"))
  else
    DisableWeapon(GetChildEntityByName(param1, "BeetleworxCannonBerserkShot"))
    EnableWeapon(GetChildEntityByName(param1, "BeetleworxCannonLeftShotPaintLow"))
    EnableWeapon(GetChildEntityByName(param1, "BeetleworxCannonRightShotPaintLow"))
    EnableWeapon(GetChildEntityByName(param1, "BeetleworxCannonDoubleShot"))
    EnableWeapon(GetChildEntityByName(param1, "BeetleworxCannonLeftShotThinnerLow"))
    EnableWeapon(GetChildEntityByName(param1, "BeetleworxCannonRightShotThinnerLow"))
    EnableWeapon(GetChildEntityByName(param1, "BeetleworxCannonDoubleDownShot"))
    EnableWeapon(GetChildEntityByName(param1, "BeetleworxCannonSwipe"))
  end
end

function BeetleworxCannonCarChangedState(param1)
  if IsValidHandle(GetPropertyEntity(param1, "Parent Entity")) then
    EnableBerserkWeapons(GetPropertyEntity(param1, "Parent Entity"), not GetPropertyBool(param1, "Is Painted"))
  end
end

function BeetleworxCannonGunChangedState(param1)
  if IsValidHandle(GetPropertyEntity(param1, "Parent Entity")) then
    BeetleworxCannonUpdateShotWeapons(GetPropertyEntity(param1, "Parent Entity"))
  end
end

function DisableWeapon(param1)
  if IsValidHandle(param1) then
    SetPropertyInt(param1, "WeaponShots", 0)
  end
end

function EnableWeapon(param1)
  if IsValidHandle(param1) then
    SetPropertyInt(param1, "WeaponShots", -1)
  end
end

function DamageParent(param1, param1)
  if IsValidHandle(GetPropertyEntity(param1, "Parent Entity", 0)) and StimHasDamage(param1) then
    PlayWeakspotHitEffect(GetPropertyEntity(param1, "Parent Entity", 0), param1)
  end
end

function BeetleworxCannonAnvilDamage(param1)
  SetHealth(param1, 0)
end

function BeetleworxBasherAnvilDamage(param1)
  SetHealth(param1, 0)
  EnableComponent(param1, "Template Spawner")
end

function BeetleworxThinnerOceanDestroy(param1)
  if 0 >= GetPropertyFloat(param1, "Slow Vulnerability", 0) then
    return
  end
  SetPropertyFloat(param1, "Slow Vulnerability", 0, 0)
  Wait(2)
  DisableMotion(param1)
  AIController_SetDisabled(param1, true)
  SetHealth(param1, 0)
end

lastDamageTime = nil

function PlayOrientedEffect(param1, param2, param3)
  StartEmitterByName(param1, param2)
  local var1, var2, var3, var4
  var1 = GetChildEntityByName(param1, param2)
  var2 = GetTargetPosition(param1)
  var3 = StimulusEvent_Direction(param3)
  var3 = -var3
  var4 = var3.y
  if var4 < 0 then
    var3.y = 0
    var4 = var3.normalize3
    var4(var3)
  end
  var4 = var3 * 0.5
  var4 = var2 + var4
  SetTransformation(var1, var4, var3)
end

function WeakspotExposed(param1)
  if IsValidHandle(GetChildEntityByName(param1, "BeetleworxCannonWeakSpot")) and (GetPropertyBool(param1, "ForceInvulnerable") or GetPropertyFloat(param1, "InvulnerableDuration") > 0) then
    return false
  end
  return true
end

function StimHasDamage(param1)
  if StimulusEvent_HasStimulusType(param1, ST_SPIN) and StimulusEvent_EffectiveAmount(param1, ST_SPIN) > 0 then
    return true
  end
  return false
end

function PlayWeakspotHitEffect(param1, param2)
  if WeakspotExposed(param1) and StimHasDamage(param2) and (lastDamageTime == nil or timestamp() - lastDamageTime > 0.5) then
    lastDamageTime = timestamp()
  end
end

function PlayInvulnerableHitEffect(param1, param1)
  if not WeakspotExposed(param1) and StimulusEvent_HasStimulusType(param1, ST_SPIN) and (lastDamageTime == nil or timestamp() - lastDamageTime > 0.5) then
    lastDamageTime = timestamp()
  end
end

function BeetleworxCannonReorientLeftShooter(param1)
  SetFacing(param1, GetLeft(param1))
end

function BeetleworxCannonReorientRightShooter(param1)
  local var1
  var1 = GetLeft(param1)
  var1 = -var1
  SetFacing(param1, var1)
end

function BeetleworxCannonReorientHealthRing(param1)
  SetFacing(param1, GetUp(param1))
end

function BeetleworxCannonEndHindrance(param1, param2)
  if StimulusEvent_HasStimulusType(param2, ST_THINNER) then
    if IsValidHandle(GetPropertyEntity(param1, "Parent Entity")) then
      EndHindrance(GetPropertyEntity(param1, "Parent Entity"))
    end
  end
end

function BeetleworxGibAngularImpulse()
  ApplyAngularImpulse(_self(), math.random(20, 40), math.random(20, 40), math.random(20, 40))
end

function HinderTurnRate(param1)
  SetOverrideTurnRate(param1, 0)
end

function EndHinderTurnRate(param1)
  ResetOverrideTurnRate(param1)
end

function OnBeetleworxCrawlerToonStimmedPaintThinner(param1)
  BeetleworxToonShellThinnedUpdateSound(param1, "BW_Thinned", 100)
end

function OnBeetleworxFodderToonStimmedPaintThinner(param1)
  BeetleworxToonShellThinnedUpdateSound(param1, "BW_Thinned", 100)
end

function OnBeetleworxMeleeToonStimmedPaintThinner(param1)
  BeetleworxToonShellThinnedUpdateSound(param1, "BW_Thinned", 100)
end

function OnBeetleworxCannonToonStimmedPaintThinner(param1)
  BeetleworxToonShellThinnedUpdateSound(param1, "BW_Thinned", 100)
end

function BeetleworxToonShellThinnedUpdateSound(param1, param2, param3)
  AudioSetParameter(nil, param2, param3 * PaintThinnerCounter_GetPaintedPercentage(param1))
end

function BeetleworxGibFadeOut(param1)
  SetR3MTOverrideTransparent(param1)
  while 0 < 1 do
    SetR3MTConstRegAlpha(param1, 3, 1 - (0 + 0.05))
    Wait(0.05)
  end
end

function BW_SpawnerOrb(param1, param2)
  Print("DOOR ANIM EVENT")
  if AnimGBSequenceEndedName(param1, param2) == "Close" then
    Print("DOOR CLOSED - SET ORB INVULN")
    SetPropertyBool(GetRelativePrefabEntity(param1, ".BW_Spawner_Orb"), "InvulnerableToPaintThinner", true)
  elseif AnimGBSequenceEndedName(param1, param2) == "Open" then
    Print("DOOR OPEN - SET ORB VULN")
    SetPropertyBool(GetRelativePrefabEntity(param1, ".BW_Spawner_Orb"), "InvulnerableToPaintThinner", false)
  end
end