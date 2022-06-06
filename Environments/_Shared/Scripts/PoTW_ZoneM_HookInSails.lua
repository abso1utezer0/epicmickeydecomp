HookTarget = GetPlayer()
HookWeapon = 0
HookAttack = false
HookFaceTarget = true
RefireTimer = 5
FireDelay = 5
TauntWeaponActive = false
PaintReactionTimer = 0.5
InPaintReaction = false
PaintAccumulationAlpha = 1
InSlowMotion = false
SlowMotionTimer = 5
function PoTW_ZoneM_Sails_VectorDotProduct(A0_0, A1_1)
  local L2_2, L3_3, L4_4
  L2_2 = A0_0.x
  L3_3 = A1_1.x
  L2_2 = L2_2 * L3_3
  L3_3 = A0_0.y
  L4_4 = A1_1.y
  L3_3 = L3_3 * L4_4
  L2_2 = L2_2 + L3_3
  L3_3 = A0_0.z
  L4_4 = A1_1.z
  L3_3 = L3_3 * L4_4
  L2_2 = L2_2 + L3_3
  return L2_2
end
function PoTW_ZoneM_Sails_Enable(A0_5)
  local L1_6, L2_7
  L1_6 = GetGlobal
  L2_7 = "PoTW_ZoneM_HookIsDead"
  L1_6 = L1_6(L2_7)
  if L1_6 == 0 then
    L1_6 = GetGlobal
    L2_7 = "PoTW_ZoneM_HookDistracted"
    L1_6 = L1_6(L2_7)
    if L1_6 == 0 then
      L1_6 = GetChildEntityByName
      L2_7 = A0_5
      L1_6 = L1_6(L2_7, "AnimatronicHookInSails_Clothes")
      L2_7 = GetChildEntityByName
      L2_7 = L2_7(A0_5, "AnimatronicHookInSails_Clothes_IGC")
      Unhide(A0_5)
      Unhide(L1_6)
      Hide(L2_7)
    end
  end
end
function PoTW_ZoneM_Sails_Disable(A0_8)
  local L1_9, L2_10
  L1_9 = GetGlobal
  L2_10 = "PoTW_ZoneM_HookIsDead"
  L1_9 = L1_9(L2_10)
  if L1_9 == 0 then
    L1_9 = GetChildEntityByName
    L2_10 = A0_8
    L1_9 = L1_9(L2_10, "AnimatronicHookInSails_Clothes")
    L2_10 = GetChildEntityByName
    L2_10 = L2_10(A0_8, "AnimatronicHookInSails_Clothes_IGC")
    Hide(A0_8)
    Hide(L1_9)
    Hide(L2_10)
    PoTW_ZoneM_Sails_StopAttack(nil)
  end
end
function PoTW_ZoneM_Sails_MoveToAttackPosition(A0_11, A1_12)
  ClearParent(A0_11)
  TeleportToEntity(A0_11, A1_12)
  SetParentEntity(A0_11, A1_12)
end
function PoTW_ZoneM_Sails_SetTarget(A0_13, A1_14, A2_15, A3_16)
  if GetGlobal("PoTW_ZoneM_HookIsDead") and GetGlobal("PoTW_ZoneM_HookDistracted") == 0 then
    TauntWeaponActive = false
    if tonumber(A2_15) == 0 then
      HookWeapon = GetChildEntityByName(A0_13, "AnimatronicHook_Cannon")
    elseif tonumber(A2_15) == 1 then
      HookWeapon = GetChildEntityByName(A0_13, "AnimatronicHookInSails_PaintHandgun")
    elseif tonumber(A2_15) == 2 then
      HookWeapon = GetChildEntityByName(A0_13, "AnimatronicHookInSails_ThinnerHandgun")
    elseif tonumber(A2_15) == 3 then
      HookWeapon = GetChildEntityByName(A0_13, "AnimatronicHookInSails_ThinnerHandgun")
      TauntWeaponActive = true
    end
    HookTarget = A1_14
    SetTarget(HookWeapon, HookTarget)
    RefireTimer = tonumber(A3_16)
    FireDelay = -1
  end
end
function PoTW_ZoneM_Sails_SetTarget10(A0_17, A1_18, A2_19, A3_20)
  if GetGlobal("PoTW_ZoneM_HookIsDead") == 0 and GetGlobal("PoTW_ZoneM_HookDistracted") == 0 then
    if SAIL10_PAINTED == false then
      if tonumber(A2_19) == 0 then
        HookWeapon = GetChildEntityByName(A0_17, "AnimatronicHook_Cannon")
      elseif tonumber(A2_19) == 1 then
        HookWeapon = GetChildEntityByName(A0_17, "AnimatronicHookInSails_PaintHandgun")
      elseif tonumber(A2_19) == 2 then
        HookWeapon = GetChildEntityByName(A0_17, "AnimatronicHookInSails_ThinnerHandgun")
      end
      HookTarget = A1_18
      SetTarget(HookWeapon, HookTarget)
      RefireTimer = tonumber(A3_20)
      FireDelay = -1
      wait(0.2)
      if HookAttack == false then
        HookAttack = true
        AnimVarFloat(A0_17, VAR_Playback_Speed, 1)
        repeat
          AnimEvent(A0_17, "EVENT_AttackGunMid")
          wait(0.15)
          Shooter_PrepareProjectiles(HookWeapon)
          Shooter_LaunchProjectiles(HookWeapon)
          FireDelay = tonumber(RefireTimer)
          while HookAttack and 0 < FireDelay do
            FireDelay = FireDelay - 0.1
            wait(0.1)
          end
        until not HookAttack
      end
    else
      PoTW_ZoneM_Sails_StopAttack(nil)
    end
  end
end
function PoTW_ZoneM_Sails_FaceTarget(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28
  L1_22 = GetGlobal
  L2_23 = "PoTW_ZoneM_HookDistracted"
  L1_22 = L1_22(L2_23)
  while true do
    if L1_22 == 0 then
      L1_22 = HookFaceTarget
      if L1_22 then
        L1_22 = GetPosition
        L2_23 = HookTarget
        L1_22 = L1_22(L2_23)
        L2_23 = GetPosition
        L3_24 = A0_21
        L2_23 = L2_23(L3_24)
        L3_24 = L1_22 - L2_23
        L4_25 = GetFacing
        L5_26 = A0_21
        L4_25 = L4_25(L5_26)
        L3_24.y = 0
        L6_27 = L3_24
        L5_26 = L3_24.normalize3
        L5_26(L6_27)
        L4_25.y = 0
        L6_27 = L4_25
        L5_26 = L4_25.normalize3
        L5_26(L6_27)
        L5_26 = L3_24
        L6_27 = PoTW_ZoneM_Sails_VectorDotProduct
        L7_28 = L4_25
        L6_27 = L6_27(L7_28, L3_24)
        L7_28 = math
        L7_28 = L7_28.pi
        L7_28 = L7_28 * 0.1
        if L6_27 < math.cos(L7_28) then
          L6_27 = math.cos(L7_28)
          L5_26.x = L6_27 * L4_25.x + -math.sin(L7_28) * L4_25.z
          L5_26.z = --math.sin(L7_28) * L4_25.x + L6_27 * L4_25.z
        end
        SetFacing(A0_21, L5_26)
      end
      L1_22 = wait
      L2_23 = 0.05
      L1_22(L2_23)
    end
  end
end
function PoTW_ZoneM_Sails_StartAttack(A0_29)
  if GetGlobal("PoTW_ZoneM_HookIsDead") == 0 and GetGlobal("PoTW_ZoneM_HookDistracted") == 0 and HookAttack == false then
    HookAttack = true
    if not InSlowMotion then
      AnimVarFloat(A0_29, VAR_Playback_Speed, 1)
    end
    repeat
      if TauntWeaponActive then
        wait(0.1)
        if math.random(1, 4) == 1 then
          AnimEvent(A0_29, "EVENT_TauntShakeHook")
        elseif math.random(1, 4) == 2 then
          AnimEvent(A0_29, "EVENT_TauntPointSword")
        elseif math.random(1, 4) == 3 then
          AnimEvent(A0_29, "EVENT_TauntShakeSword")
        elseif math.random(1, 4) == 4 then
          AnimEvent(A0_29, "EVENT_TauntMenace")
        end
      else
        AnimEvent(A0_29, "EVENT_AttackGunMid")
        wait(0.15)
        Shooter_PrepareProjectiles(HookWeapon)
        Shooter_LaunchProjectiles(HookWeapon)
      end
      FireDelay = tonumber(RefireTimer)
      while HookAttack and 0 < FireDelay do
        FireDelay = FireDelay - 0.1
        wait(0.1)
      end
    until not HookAttack
  end
end
function PoTW_ZoneM_Sails_StopAttack(A0_30)
  if GetGlobal("PoTW_ZoneM_HookIsDead") == 0 then
    HookAttack = false
  end
end
function PoTW_ZoneM_Sails_StopAttack9(A0_31)
  if GetGlobal("PoTW_ZoneM_HookIsDead") == 0 and IS_BALLAST_LOWERED == true then
    HookAttack = false
  end
end
function ZoneM_Sails_StopFaceTarget(A0_32)
  HookFaceTarget = false
end
function PoTW_ZoneM_Sails_OnStimulusToClothes(A0_33, A1_34)
  if BaseEvent_Type(A1_34) == OnStimulus then
    if StimulusEvent_HasStimulusType(A1_34, ST_PAINT) then
      if StimulusEvent_SourceStimulusAlias(A1_34) == "Guardian" then
        PaintAccumulationAlpha = 0
      end
      PoTW_ZoneM_Sails_ReactToPaint(A0_33)
    elseif StimulusEvent_HasStimulusType(A1_34, ST_THINNER) and StimulusEvent_SourceStimulusAlias(A1_34) == "Guardian" then
      ForceSketched(A0_33)
      FireThread(PoTW_ZoneM_Sails_ReactToThinner, "potw_zonem.AnimatronicHookInSails 01")
    end
  end
end
function PoTW_ZoneM_Sails_ReactToThinner(A0_35)
  PoTW_ZoneM_Sails_StopAttack(nil)
  AnimEvent(A0_35, "EVENT_ReactNoClothes")
  AddScrapperPoints(GetPlayer(), 5)
  wait(3)
  AnimEvent(A0_35, "EVENT_TauntShakeHook")
  wait(5)
  PoTW_ZoneM_Sails_StartAttack(A0_35)
end
function PoTW_ZoneM_Sails_ReactToPaint(A0_36)
  local L1_37
  L1_37 = PoTW_ZoneM_Sails_StopAttack
  L1_37(nil)
  L1_37 = AnimEvent
  L1_37("potw_zonem.AnimatronicHookInSails 01", "EVENT_ReactPaint")
  L1_37 = 0.5
  PaintReactionTimer = L1_37
  L1_37 = 3
  SlowMotionTimer = L1_37
  L1_37 = InPaintReaction
  if not L1_37 then
    L1_37 = true
    InPaintReaction = L1_37
    L1_37 = FireThread
    L1_37(PoTW_ZoneM_Sails_PaintReactCountdown)
  end
  L1_37 = PaintAccumulationAlpha
  L1_37 = L1_37 - 0.05
  PaintAccumulationAlpha = L1_37
  L1_37 = PaintAccumulationAlpha
  if L1_37 <= 0 then
    L1_37 = 0
    PaintAccumulationAlpha = L1_37
    L1_37 = InSlowMotion
    if not L1_37 then
      L1_37 = true
      InSlowMotion = L1_37
      L1_37 = AnimVarFloat
      L1_37("potw_zonem.AnimatronicHookInSails 01", VAR_Playback_Speed, 0.1)
      L1_37 = FireThread
      L1_37(PoTW_ZoneM_Sails_SlowMotionCountdown)
    end
  end
  L1_37 = vector4
  L1_37 = L1_37(0, 0, 1, PaintAccumulationAlpha)
  SetR3MTConstReg("potw_zonem.AnimatronicHookInSails 01", 2, L1_37)
end
function PoTW_ZoneM_Sails_PaintReactCountdown()
  local L0_38
  while true do
    L0_38 = PaintReactionTimer
    if L0_38 > 0 then
      L0_38 = PaintReactionTimer
      L0_38 = L0_38 - 0.0333
      PaintReactionTimer = L0_38
      L0_38 = wait
      L0_38(0.0333)
    end
  end
  L0_38 = InSlowMotion
  if not L0_38 then
    L0_38 = 1
    PaintAccumulationAlpha = L0_38
    L0_38 = vector4
    L0_38 = L0_38(0, 0, 1, PaintAccumulationAlpha)
    SetR3MTConstReg("potw_zonem.AnimatronicHookInSails 01", 2, L0_38)
  end
  L0_38 = false
  InPaintReaction = L0_38
  L0_38 = AnimEvent
  L0_38("potw_zonem.AnimatronicHookInSails 01", "EVENT_ReactPaintEnd")
  L0_38 = PoTW_ZoneM_Sails_StartAttack
  L0_38("potw_zonem.AnimatronicHookInSails 01")
end
function PoTW_ZoneM_Sails_SlowMotionCountdown()
  local L0_39
  while true do
    L0_39 = SlowMotionTimer
    if L0_39 > 0 then
      L0_39 = SlowMotionTimer
      L0_39 = L0_39 - 0.0333
      SlowMotionTimer = L0_39
      L0_39 = wait
      L0_39(0.0333)
    end
  end
  L0_39 = AnimVarFloat
  L0_39("potw_zonem.AnimatronicHookInSails 01", VAR_Playback_Speed, 1)
  L0_39 = false
  InSlowMotion = L0_39
  L0_39 = 3
  SlowMotionTimer = L0_39
  L0_39 = 1
  PaintAccumulationAlpha = L0_39
  L0_39 = vector4
  L0_39 = L0_39(0, 0, 1, PaintAccumulationAlpha)
  SetR3MTConstReg("potw_zonem.AnimatronicHookInSails 01", 2, L0_39)
end
