local L0_0, L1_1
function L0_0(A0_2, A1_3)
  local L2_4
  L2_4 = GetChildEntityByName
  L2_4 = L2_4(A0_2, A1_3)
  DestroyEntity(L2_4)
end
DeleteChildEntity = L0_0
function L0_0(A0_5, A1_6)
  local L2_7, L3_8, L4_9
  L2_7 = GetPlayer
  L2_7 = L2_7()
  if A1_6 == L2_7 then
    L2_7 = wait
    L3_8 = 0.1
    L2_7(L3_8)
    L2_7 = ST_KNOCKBACK
    L3_8 = GetConfigVariableFloat
    L4_9 = "MickeyAbilities_Sketch_Anvil_AnvilKnockbackStim"
    L3_8 = L3_8(L4_9)
    L4_9 = 0
    StimulusEntityWithAliasCalculateDirectionInRadius(A0_5, L2_7, L3_8, L4_9, A1_6, "TV")
  else
    L2_7 = RemovePhysicsFromWorld
    L3_8 = A0_5
    L2_7(L3_8)
    L2_7 = AnimVarInt
    L3_8 = A0_5
    L4_9 = VAR_Death_Type
    L2_7(L3_8, L4_9, 1)
    L2_7 = AnimEvent
    L3_8 = A0_5
    L4_9 = EVENT_Start_Death
    L2_7(L3_8, L4_9)
    L2_7 = AudioPostEventOn
    L3_8 = A0_5
    L4_9 = "Stop_sfx_tv20"
    L2_7(L3_8, L4_9)
    L2_7 = AudioPostEventOn
    L3_8 = A0_5
    L4_9 = "Stop_sfx_tv_last5"
    L2_7(L3_8, L4_9)
    L2_7 = DeleteChildEntity
    L3_8 = A0_5
    L4_9 = "PaintTV_Screen"
    L2_7(L3_8, L4_9)
    L2_7 = Wait
    L3_8 = 0.6
    L2_7(L3_8)
    L2_7 = DestroyEntity
    L3_8 = A0_5
    L2_7(L3_8)
  end
end
TVImpactCharacter = L0_0
function L0_0(A0_10)
  AnimEvent(A0_10, EVENT_Start_Death)
  RemovePhysicsFromWorld(A0_10)
  Wait(0.33)
  DestroyEntity(A0_10)
end
DestroyAnvil = L0_0
function L0_0(A0_11, A1_12)
  local L2_13, L3_14, L4_15, L5_16
  L2_13 = GetPlayer
  L2_13 = L2_13()
  if A1_12 == L2_13 then
    L2_13 = GetPosition
    L3_14 = A1_12
    L2_13 = L2_13(L3_14)
    L3_14 = wait
    L4_15 = 0.1
    L3_14(L4_15)
    L3_14 = ST_KNOCKBACK
    L4_15 = GetConfigVariableFloat
    L5_16 = "MickeyAbilities_Sketch_Anvil_AnvilKnockbackStim"
    L4_15 = L4_15(L5_16)
    L5_16 = 6
    StimulusEntityWithAliasCalculateDirectionInRadius(A0_11, L3_14, L4_15, L5_16, A1_12, "Anvil")
    StimulusEntityWithAlias(A0_11, ST_PHYSICAL, 1, L2_13, A1_12, "Anvil")
  else
    L2_13 = RaiseCrushedByAnvilEvent
    L3_14 = A0_11
    L4_15 = A1_12
    L2_13(L3_14, L4_15)
    L2_13 = IsAlive
    L3_14 = A1_12
    L2_13 = L2_13(L3_14)
    if L2_13 then
      L2_13 = CanEntitiesCollide
      L3_14 = A0_11
      L4_15 = A1_12
      L2_13 = L2_13(L3_14, L4_15)
      if L2_13 then
        L2_13 = AudioPostEventOn
        L3_14 = A0_11
        L4_15 = "Play_anvil_hit"
        L2_13(L3_14, L4_15)
        L2_13 = DestroyAnvil
        L3_14 = A0_11
        L2_13(L3_14)
      end
    end
  end
end
AnvilImpactCharacter = L0_0
function L0_0(A0_17)
  local L1_18, L2_19, L3_20, L4_21
  L1_18 = ST_PHYSICAL
  L2_19 = 10
  L3_20 = GetPosition
  L4_21 = _self
  L4_21 = L4_21()
  L3_20 = L3_20(L4_21, L4_21())
  L4_21 = 3
  StimulusSphereWithAlias(GetPlayer(), L1_18, L2_19, L3_20, L4_21, "Anvil")
end
AnvilImpactDamage = L0_0
function L0_0(A0_22)
  local L1_23, L2_24, L3_25, L4_26
  L1_23 = wait
  L2_24 = 0.1
  L1_23(L2_24)
  L1_23 = ST_KNOCKBACK
  L2_24 = GetConfigVariableFloat
  L3_25 = "MickeyAbilities_Sketch_Anvil_AnvilKnockbackStim"
  L2_24 = L2_24(L3_25)
  L3_25 = GetPosition
  L4_26 = A0_22
  L3_25 = L3_25(L4_26)
  L4_26 = 5
  StimulusSphereWithAlias(GetPlayer(), L1_23, L2_24, L3_25, L4_26, "Anvil")
  StimulusEntityWithAliasCalculateDirectionInRadius(A0_22, L1_23, L2_24, L4_26, GetPlayer(), "Anvil")
end
AnvilImpactKnockback = L0_0
function L0_0(A0_27)
  local L1_28, L2_29, L3_30, L4_31
  L1_28 = ST_BREAKABLE
  L2_29 = 10
  L3_30 = GetPosition
  L4_31 = _self
  L4_31 = L4_31()
  L3_30 = L3_30(L4_31, L4_31())
  L4_31 = 4
  StimulusSphereWithAlias(GetPlayer(), L1_28, L2_29, L3_30, L4_31, "Anvil")
end
AnvilImpactBreakables = L0_0
function L0_0(A0_32)
  local L1_33
  L1_33 = GetPosition
  L1_33 = L1_33(A0_32)
  StimulusEntityWithAlias(0, ST_THINNER, 1000, L1_33, A0_32, "Anvil")
end
AnvilPuddle = L0_0
function L0_0(A0_34)
  local L1_35, L2_36
  L1_35 = GetConfigVariableFloat
  L2_36 = "MickeyAbilities_Sketch_Anvil_AnvilStunStim"
  L1_35 = L1_35(L2_36)
  L2_36 = GetPosition
  L2_36 = L2_36(A0_34)
  StimulusEntityWithAlias(GetPlayer(), ST_STUN, L1_35, L2_36, A0_34, "Anvil")
end
AnvilStun = L0_0
function L0_0(A0_37)
  local L1_38, L2_39
  L1_38 = GetConfigVariableFloat
  L2_39 = "MickeyAbilities_Sketch_Anvil_AnvilPhysicalStim"
  L1_38 = L1_38(L2_39)
  L2_39 = GetPosition
  L2_39 = L2_39(A0_37)
  StimulusEntityWithAlias(GetPlayer(), ST_PHYSICAL, L1_38, L2_39, A0_37, "Anvil")
end
AnvilDamage = L0_0
function L0_0(A0_40)
  EnableComponent(A0_40, "AttractRepel")
end
TurnOnTV = L0_0
function L0_0()
  local L0_41
  L0_41 = DriveMotionWithPhysics
  L0_41(_activator())
end
BMCComponent_DriveMotionWithPhysics = L0_0
function L0_0()
  local L0_42, L1_43
  L0_42 = GetChildEntityByIndex
  L1_43 = _self
  L1_43 = L1_43()
  L0_42 = L0_42(L1_43, 1)
  L1_43 = IsValidHandle
  L1_43 = L1_43(L0_42)
  if L1_43 then
    L1_43 = GetPropertyEntity
    L1_43 = L1_43(L0_42, "Second Entity", 0)
    if IsValidHandle(L1_43) then
      FallFromAir(L1_43)
    end
  end
end
BMCComponent_StopDriveMotionWithPhysics = L0_0
function L0_0()
  local L0_44
  L0_44 = ActivateForces
  L0_44(_self())
end
PhysicsForceComponent_ActivateForces = L0_0
function L0_0()
  if GetPropertyFloat(_activator(), "Max Air Speed") == 0 then
    SetPropertyFloat(_self(), "Modified Gravity", 0, 0)
  end
  AddAffectedEntity(_self(), _activator())
end
PhysicsForceComponent_AddAffectedEntity = L0_0
function L0_0()
  local L0_45, L1_46, L2_47
  L0_45 = Print
  L1_46 = "Constraint_SetEntities"
  L0_45(L1_46)
  L0_45 = 0
  L1_46 = 0
  L2_47 = 0
  L2_47 = GetChildEntityByIndex(_self(), 1)
  L0_45 = GetPosition(_activator())
  L0_45.y = L0_45.y + 2.5
  L1_46 = GetFacing(_self())
  SetTransformation(_self(), L0_45, L1_46)
  SetConstraintEntities(L2_47, _self(), _activator())
end
Constraint_SetEntities = L0_0
function L0_0(A0_48, A1_49)
  if StimulusEvent_HasStimulusType(A1_49, ST_PHYSICAL) then
    print([[

--------------------- I am getting hit by (more accurately)]] .. StimulusEvent_SourceStimulusAlias(A1_49))
    if StimulusEvent_SourceStimulusAlias(A1_49) == "BeetleworxMeleeWeapon" or StimulusEvent_SourceStimulusAlias(A1_49) == "AnimatronicMeleeWeapon" then
      print([[

--------------------- Valid source of dmg for TV splosion ]] .. StimulusEvent_SourceStimulusAlias(A1_49))
      StartEmitterByName(A0_48, "TVArcFX")
      Wait(0.25)
      AnimVarInt(A0_48, VAR_Death_Type, 1)
      AnimEvent(A0_48, EVENT_Start_Death)
      AudioPostEventOn(A0_48, "Stop_sfx_tv20")
      AudioPostEventOn(A0_48, "Stop_sfx_tv_last5")
      DeleteChildEntity(A0_48, "PaintTV_Screen")
      Wait(0.6)
      DestroyEntity(A0_48)
    end
  elseif StimulusEvent_HasStimulusType(A1_49, ST_THINNER) and StimulusEvent_SourceStimulusAlias(A1_49) == "ThinnerOcean" then
    DisableMotion(A0_48)
    AudioPostEventOn(A0_48, "Play_sfx_Sketch_Thinner_Splash")
    Wait(0.033)
    ForceSketched(A0_48)
  end
end
TV_Damage = L0_0
function L0_0(A0_50, A1_51)
  if StimulusEvent_HasStimulusType(A1_51, ST_THINNER) and StimulusEvent_SourceStimulusAlias(A1_51) == "ThinnerOcean" then
    DisableMotion(A0_50)
    AudioPostEventOn(A0_50, "Play_sfx_Sketch_Thinner_Splash")
    Wait(0.033)
    ForceSketched(A0_50)
  end
end
ForceThin = L0_0
