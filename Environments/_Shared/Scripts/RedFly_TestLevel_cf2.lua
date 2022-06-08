local L0_0, L1_10

isBridge1Down = false
isBridge2Down = false
thinnerBottleCount = 3
isThinner1Broken = false
isThinner2Broken = false
isThinner3Broken = false
isThinner4Broken = false
isBlotEnraged = false
isBlotIdle = false
isBlotMoving = false
isBlotGrounded = false
isBlotInvulnerable = false
isBlotClimbing = false
isBlotUsingHandsAttack = false
didBlotCollide = false
didBlotBeginCharge = false
didBlotBeginSwoop = false
didBlotHandsEmerge = false
isBlotsFirstCharge = true
isBlotThrowingSpawnProjectile = false
isBlotDead = false
isBlotWatchingTV = false
isFirstGearPaint = true
isFirstBridgeChase = true
isBridgeChaseCS = false
isJITBSprung = false
perchPointBlotWasOn = 4
perchPointBlotIsOn = 4
platformMickeyIsOn = 1
platformBlotIsOn = 1
isRespawningAtCheckpoint = false
BlotAIStage = 1
numberOfSpatters = 0
hitsToGetAngry = 2
hitsToGetEnraged = 3
Stage1Idle = 12
Stage1Angry = 2
Stage1Enraged = 3
Stage2Idle = 5
Stage2Angry = 3
Stage2Enraged = 4
Stage3Idle = 6
Stage3Angry = 4
Stage3Enraged = 6
A1CloseDist = 500
A2CloseDist = 400

function LaunchGreeting(param1)
  SetConfigVariableString(GetPlayer(), "FreeCamera_TargetLock_TurnToFaceSpeed", 1)
  SetCameraHintPitch(GetPlayer(), 0)
  SetConfigVariableString(GetPlayer(), "OverShoulderCamera_Enabled", false)
  DialogBox(GetPlayer(), "Defeat the Blot yourself or make it all the way up Mickey Junk Mountain to help Oswald!")
  WaitForDialog(param1)
end

function L0_0(A0_3)
  wait(120)
  if isBridge1Down == false then
    if GetPropertyBool("BridgeGear1", "Is Painted") == true then
      Bark(GetPlayer(), "You ought to get the Blot to knock the bridge loose!", 5, "Oswald", "Oswald")
    else
      Bark(GetPlayer(), "Is that bridge not working?  You ought to find out whats wrong with it!", 5, "Oswald", "Oswald")
    end
  end
  while isBlotDead == false and platformMickeyIsOn ~= 4 do
    wait(120)
    if thinnerBottleCount == 3 then
      Bark(GetPlayer(), "You gotta do something.  What are those big thinner bottles for?", 5, "Oswald", "Oswald")
    else
      Bark(GetPlayer(), "Keep going!  There are more of those thinner bottles.", 5, "Oswald", "Oswald")
    end
    wait(120)
    Bark(GetPlayer(), "You can always head up the junk mountain and help me!", 5, "Oswald", "Oswald")
  end
end
HintsAlongTheWay = L0_0
function L0_0(A0_4, A1_5)
  if isJITBSprung == false and GetPropertyBool(A0_4, "Is Painted") then
    isJITBSprung = true
    AnimGBSequence(A0_4, "open")
    AnimEvent(A1_5, EVENT_Special_0)
    LaunchEntity(GetPlayer(), 0, 4000, 0)
    wait(1.5)
    AnimGBSequence(A0_4, "close")
    AnimEvent(A1_5, EVENT_Special_1)
    wait(0.5)
    isJITBSprung = false
  end
end
ActivateJackInTheBox = L0_0
function L0_0(A0_6, A1_7)
  if A1_7 == "true" then
    Enable(A0_6)
  else
    Disable(A0_6)
  end
end
MovieRealSpin = L0_0
function L0_0(A0_8, A1_9, A2_10)
  A2_10 = tonumber(A2_10)
  RestrictCutSceneInput()
  AI_SetDisabled("ShadowBlot", true)
  ForEachEntityInGroup(AI_SetDisabled, "Spatters", true)
  if A2_10 == nil or A2_10 == 0 then
    GrabCamera(A0_8, A1_9, CAMERA_INSTANT_TRANSITION, 0)
  else
    GrabCamera(A0_8, A1_9, CAMERA_LERP_TRANSITION, A2_10)
  end
  Enable(A0_8)
end
CSLookAtEntity = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  if isBlotDead == false then
    AI_SetDisabled("ShadowBlot", false)
  end
  ForEachEntityInGroup(AI_SetDisabled, "Spatters", false)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
end
CSEndLookAtEntity = L0_0
function L0_0(A0_11, A1_12, A2_13)
  if A0_11 == 0 then
    ReleaseCamera(CAMERA_INSTANT_TRANSITION, 0)
  else
    ReleaseCamera(CAMERA_LERP_TRANSITION, A0_11)
  end
  if A1_12 == true then
    SetCameraHintPitch(GetPlayer(), 0)
  end
  if A2_13 ~= nil then
    SetSecondaryCameraTarget(A2_13)
  end
end
ResetCamera = L0_0
function L0_0(A0_14)
  Disable("Thinner1Trigger")
  Disable("Thinner2Trigger")
  Disable("Thinner2JunkTrigger")
  Disable("Thinner3Trigger")
  Disable("Thinner3JunkTrigger")
  Disable("Thinner4Trigger")
  Disable("Thinner4JunkTrigger")
  Disable("Bridge1Trigger")
  Disable("Bridge2Trigger")
  Disable("Junk1Trigger")
  Disable("Junk2Trigger")
  Disable("Junk3Trigger")
  Disable("Junk4Trigger")
  Disable("Inert1Trigger")
  Disable("Inert2Trigger")
  Disable("Inert3Trigger")
  Disable("Inert4Trigger")
  Disable("Inert5Trigger")
end
DeactivateTriggers = L0_0
function L0_0(A0_15)
  if isThinner1Broken == false then
    Enable("Thinner1Trigger")
    Enable("Inert5Trigger")
  end
  if isThinner2Broken == false then
    Enable("Thinner2Trigger")
    Enable("Thinner2JunkTrigger")
  end
  if isThinner3Broken == false then
    Enable("Thinner3Trigger")
    Enable("Thinner3JunkTrigger")
  end
  if isThinner4Broken == false then
    Enable("Thinner4Trigger")
    Enable("Thinner4JunkTrigger")
  end
  if isBridge1Down == false then
    Enable("Bridge1Trigger")
  end
  if isBridge2Down == false then
    Enable("Bridge2Trigger")
  end
  Enable("Junk1Trigger")
  Enable("Junk2Trigger")
  Enable("Junk3Trigger")
  Enable("Junk4Trigger")
  Enable("Inert1Trigger")
  Enable("Inert2Trigger")
  Enable("Inert3Trigger")
  Enable("Inert4Trigger")
end
ActivateTriggers = L0_0
function L0_0(A0_16, A1_17)
  local L2_18
  L2_18 = tonumber
  L2_18 = L2_18(A1_17)
  platformMickeyIsOn = L2_18
  L2_18 = platformMickeyIsOn
  if L2_18 == 2 then
    L2_18 = BlotAIStage
    if L2_18 == 1 then
      L2_18 = 2
      BlotAIStage = L2_18
      L2_18 = TimerSetInterval
      L2_18("ShadowBlotIdleTimer", Stage2Idle)
      L2_18 = GetChildEntityByIndex
      L2_18 = L2_18("ShadowBlot", 0)
      SetPropertyInt(L2_18, "WeaponAnimationVariable", 1, 0)
    end
  else
    L2_18 = platformMickeyIsOn
    if L2_18 == 4 then
      L2_18 = 3
      BlotAIStage = L2_18
      L2_18 = TimerSetInterval
      L2_18("ShadowBlotIdleTimer", Stage3Idle)
    end
  end
end
SetPlayerPlatform = L0_0
function L0_0(A0_19, A1_20, A2_21, A3_22)
  local L4_23
  L4_23 = tonumber
  L4_23 = L4_23(A1_20)
  isBlotClimbing = false
  if platformMickeyIsOn ~= L4_23 or A3_22 == "true" then
    SetPlayerPlatform(A0_19, L4_23)
    ClearCameraHintAll(GetPlayer())
    SetCameraHintPitch(GetPlayer(), 0)
  end
  if platformBlotIsOn ~= L4_23 and (A2_21 == nil or A2_21 == "false") then
    BlotMoveToNextArena("ShadowBlot")
  end
  if isBlotWatchingTV and isBlotClimbing then
    isBlotClimbing = false
  end
end
Reset = L0_0
function L0_0(A0_24, A1_25)
  if tonumber(A1_25) == 1 and isBridge1Down == false or tonumber(A1_25) == 2 and isBridge2Down == false then
    print("*** Bridge is stuck ***")
    if isBlotEnraged == false then
      if isFirstGearPaint then
        CSLookAtEntity("Bridge" .. A1_25 .. "Cam", A0_24, 0)
      end
      wait(0.5)
      AnimGBSequence("Bridge" .. A1_25, "shudder")
      AnimGBSequence(A0_24, "shudder")
      AudioPostEventOn(A0_24, "Play_sfx_MJM_Lever_Fall")
      wait(2)
      AnimGBSequence("Bridge" .. A1_25, "idle_up")
      AnimGBSequence(A0_24, "idle_up")
      if isFirstGearPaint then
        Bark(GetPlayer(), "Oh no!  The Bridge is stuck!  You gotta find a way to knock it loose!", 5, "Oswald", "Oswald")
        wait(0.5)
        CSEndLookAtEntity()
        print(" Release camera... Bridge Shudder ")
        SetCameraHintPitch(GetPlayer(), 0)
        isFirstGearPaint = false
      end
    end
  end
end
BridgeShudder = L0_0
function L0_0(A0_26, A1_27)
  local L2_28, L3_29
  L2_28 = tonumber
  L3_29 = A1_27
  L2_28 = L2_28(L3_29)
  L3_29 = isBlotEnraged
  if L3_29 then
    L3_29 = GetEntity
    L3_29 = L3_29("ShadowBlot")
    if A0_26 == L3_29 then
      L3_29 = true
      didBlotCollide = L3_29
      L3_29 = GetEntity
      L3_29 = L3_29("BridgeGear" .. A1_27)
      DeactivateTriggers(A0_26)
      ReleaseSecondaryCameraTarget(GetPlayer())
      print(" Release secondary camera target... Colide with Bridge ")
      CSLookAtEntity("Bridge" .. A1_27 .. "Cam", L3_29, 0)
      ShakeCamera(3, 2, 0.05, 2, 0.125, 0.033)
      SplineFollower_SetDisabled(A0_26, true)
      AnimEvent(A0_26, EVENT_Special_3)
      TeleportToEntity("ShadowBlotPuddle", A0_26)
      SetParentEntity("ShadowBlotPuddle", A0_26)
      if L2_28 == 1 and isBridge1Down == false or L2_28 == 2 and isBridge2Down == false then
        if GetPropertyBool(L3_29, "Is Painted") then
          wait(0.5)
          if L2_28 == 1 then
            isBridge1Down = true
          else
            isBridge2Down = true
          end
          AudioPostEventOn(L3_29, "Play_sfx_MJM_Lever_Fall")
          Bark(GetPlayer(), "The Blot loosened up the Bridge! Hurry Mickey!", 5, "Oswald", "Oswald")
          Wait(1.5)
          AnimGBSequence(L3_29, "activate")
          AnimGBSequence("Bridge" .. A1_27, "activate")
          AudioPostEventOn(L3_29, "Play_sfx_MJM_Bridge_Descend")
          if isBridge2Down == false then
            GrabCamera("Bridge" .. A1_27 .. "Cam", "CSMarker0", CAMERA_LERP_TRANSITION, 0.5)
            SetConfigVariableString(A0_26, "BEH_ShadowBlotCharge_Default_CanCharge", "0")
            wait(1)
            Hide("Bridge1CollisionUp")
            Unhide("Bridge1CollisionDown")
            MountainViewStart("Bridge1Cam")
          else
            CSLookAtEntity("Bridge2Cam", "Bridge2", 0)
            wait(3)
            Hide("Bridge2CollisionUp")
            Unhide("Bridge2CollisionDown")
            SetConfigVariableString(A0_26, "BEH_ShadowBlotCharge_Default_CanCharge", "0")
            CSEndLookAtEntity()
            print(" Release camera... Collide with Bridge ")
            SetCameraHintPitch(GetPlayer(), 0)
          end
        else
          if isBlotsFirstCharge then
            Bark(GetPlayer(), "The ShadowBlot charged head first into the bridge!  The Bridge isn't working though!?", 5, "Oswald", "Oswald")
            isBlotsFirstCharge = false
          else
            Bark(GetPlayer(), "The Bridge isn't working!?", 5, "Oswald", "Oswald")
          end
          wait(3)
          SetConfigVariableString(A0_26, "BEH_ShadowBlotCharge_Default_CanCharge", "0")
          CSEndLookAtEntity()
          print(" Release camera... Colide with Bridge 2 ")
          SetCameraHintPitch(GetPlayer(), 0)
        end
      else
        wait(3)
        SetConfigVariableString(A0_26, "BEH_ShadowBlotCharge_Default_CanCharge", "0")
        CSEndLookAtEntity()
        print(" Release camera... Colide with Bridge 3 ")
        SetCameraHintPitch(GetPlayer(), 0)
      end
    end
  end
end
BlotCollidedWithBridge = L0_0
function L0_0(A0_30, A1_31, A2_32, A3_33)
  local L4_34, L5_35, L6_36, L7_37, L8_38, L9_39, L10_40, L11_41
  L4_34 = isBlotEnraged
  if L4_34 then
    L4_34 = GetEntity
    L5_35 = "ShadowBlot"
    L4_34 = L4_34(L5_35)
    if A0_30 == L4_34 then
      if A2_32 == "true" then
        L4_34 = GetEntityGroupSize
        L5_35 = A1_31
        L4_34 = L4_34(L5_35)
        L5_35 = A1_31
        L6_36 = false
        for L10_40 = 1, L4_34 do
          L11_41 = L10_40
          if GetPropertyBool(L5_35 .. L11_41, "Is Painted") == true then
            L6_36 = true
            break
          end
        end
        if L6_36 then
          didBlotCollide = L7_37
          L7_37(L8_38)
          L11_41 = L8_38()
          L7_37(L8_38, L9_39, L10_40, L11_41, L8_38())
          L7_37(L8_38)
          if A3_33 ~= nil then
            L10_40 = CAMERA_INSTANT_TRANSITION
            L11_41 = 0
            L7_37(L8_38, L9_39, L10_40, L11_41)
            L10_40 = 0.05
            L11_41 = 2
            L7_37(L8_38, L9_39, L10_40, L11_41, 0.125, 0.033)
          end
          L7_37(L8_38, L9_39)
          L7_37(L8_38, L9_39)
          L7_37(L8_38, L9_39)
          L7_37(L8_38, L9_39)
          L7_37(L8_38, L9_39)
          if L7_37 then
            isBlotsFirstCharge = L7_37
            L10_40 = 5
            L11_41 = "Oswald"
            L7_37(L8_38, L9_39, L10_40, L11_41, "Oswald")
          end
          L7_37(L8_38)
          L10_40 = "0"
          L7_37(L8_38, L9_39, L10_40)
          L7_37()
          L7_37(L8_38)
          L7_37(L8_38, L9_39)
        end
      else
        L4_34 = isBlotsFirstCharge
        if L4_34 then
          L4_34 = false
          isBlotsFirstCharge = L4_34
          L4_34 = Bark
          L5_35 = GetPlayer
          L5_35 = L5_35()
          L6_36 = "The ShadowBlot charged head first into that junk!?"
          L4_34(L5_35, L6_36, L7_37, L8_38, L9_39)
        end
        L4_34 = true
        didBlotCollide = L4_34
        L4_34 = DeactivateTriggers
        L5_35 = A0_30
        L4_34(L5_35)
        L4_34 = ReleaseSecondaryCameraTarget
        L5_35 = GetPlayer
        L11_41 = L5_35()
        L4_34(L5_35, L6_36, L7_37, L8_38, L9_39, L10_40, L11_41, L5_35())
        L4_34 = print
        L5_35 = " Release secondary camera target... Colide with something 2 "
        L4_34(L5_35)
        if A3_33 ~= nil then
          L4_34 = GrabCamera
          L5_35 = A3_33
          L6_36 = A0_30
          L4_34(L5_35, L6_36, L7_37, L8_38)
          L4_34 = ShakeCamera
          L5_35 = 3
          L6_36 = 2
          L10_40 = 0.033
          L4_34(L5_35, L6_36, L7_37, L8_38, L9_39, L10_40)
        end
        L4_34 = SplineFollower_SetDisabled
        L5_35 = A0_30
        L6_36 = true
        L4_34(L5_35, L6_36)
        L4_34 = AnimEvent
        L5_35 = A0_30
        L6_36 = EVENT_Special_3
        L4_34(L5_35, L6_36)
        L4_34 = TeleportToEntity
        L5_35 = "ShadowBlotPuddle"
        L6_36 = A0_30
        L4_34(L5_35, L6_36)
        L4_34 = SetParentEntity
        L5_35 = "ShadowBlotPuddle"
        L6_36 = A0_30
        L4_34(L5_35, L6_36)
        L4_34 = wait
        L5_35 = 3
        L4_34(L5_35)
        L4_34 = SetConfigVariableString
        L5_35 = A0_30
        L6_36 = "BEH_ShadowBlotCharge_Default_CanCharge"
        L4_34(L5_35, L6_36, L7_37)
        L4_34 = CSEndLookAtEntity
        L4_34()
        L4_34 = print
        L5_35 = " Release camera... Colide with something 2 "
        L4_34(L5_35)
        L4_34 = SetCameraHintPitch
        L5_35 = GetPlayer
        L5_35 = L5_35()
        L6_36 = 0
        L4_34(L5_35, L6_36)
      end
    end
  end
end
BlotCollidedWithSomething = L0_0
function L0_0(A0_42)
  local L1_43
  L1_43 = thinnerBottleCount
  L1_43 = L1_43 - 1
  thinnerBottleCount = L1_43
  L1_43 = BlotAIStage
  if L1_43 < 3 then
    L1_43 = BlotAIStage
    L1_43 = L1_43 + 1
    BlotAIStage = L1_43
    L1_43 = BlotAIStage
    if L1_43 == 2 then
      L1_43 = TimerSetInterval
      L1_43("ShadowBlotIdleTimer", Stage2Idle)
      L1_43 = GetChildEntityByIndex
      L1_43 = L1_43("ShadowBlot", 0)
      SetPropertyInt(L1_43, "WeaponAnimationVariable", 1, 0)
    else
      L1_43 = TimerSetInterval
      L1_43("ShadowBlotIdleTimer", Stage3Idle)
    end
  end
end
DecrementThinnerBottleCount = L0_0
function L0_0(A0_44, A1_45)
  if isBlotEnraged and A0_44 == GetEntity("ShadowBlot") then
    didBlotCollide = true
    DeactivateTriggers(A0_44)
    ReleaseSecondaryCameraTarget(GetPlayer())
    print(" Release secondary camera target... Colide with Thinner ")
    if tonumber(A1_45) == 1 then
      isThinner1Broken = true
    elseif tonumber(A1_45) == 2 then
      isThinner2Broken = true
    elseif tonumber(A1_45) == 3 then
      isThinner3Broken = true
    elseif tonumber(A1_45) == 4 then
      isThinner4Broken = true
    end
    DecrementThinnerBottleCount(A0_44)
    GrabCamera("Thinner" .. A1_45 .. "CollisionCam", A0_44, CAMERA_INSTANT_TRANSITION, 0)
    ShakeCamera(3, 2, 0.05, 2, 0.125, 0.033)
    SplineFollower_SetDisabled(A0_44, true)
    if 0 < thinnerBottleCount then
      isBlotsFirstCharge = false
      AnimEvent(A0_44, EVENT_Force_Idle)
      TeleportToEntity("ShadowBlotPuddle", A0_44)
      SetParentEntity("ShadowBlotPuddle", A0_44)
      Bark(GetPlayer(), "The Blot hit Thinner Bottle!  He's really hurting!", 5, "Oswald", "Oswald")
      BlotCollisionCutScene(A0_44, A1_45)
    else
      SetPropertyBool(A0_44, "InfiniteHealth", "false", 0)
      TeleportToEntity("ShadowBlotPuddle", A0_44)
      SetParentEntity("ShadowBlotPuddle", A0_44)
      Disable("ShadowBlotDamageVolume")
      Kill(A0_44)
      isBlotDead = true
      BlotCollisionDeathCutScene(A0_44, A1_45)
    end
  end
end
BlotCollidedWithThinner = L0_0
function L0_0(A0_46)
  print("*** Switch to Ink Spatter Spawn projectiles")
  numberOfSpatters = GetEntityGroupSize("Spatters")
  isBlotThrowingSpawnProjectile = true
  SetConfigVariableString(A0_46, "BEH_ShadowBlotRanged_Default_AttackVariant", "1")
  wait(1.5)
  isBlotInvulnerable = false
  while numberOfSpatters == numberOfSpatters and isBlotClimbing == false do
    wait(1)
    numberOfSpatters = GetEntityGroupSize("Spatters")
  end
  isBlotThrowingSpawnProjectile = false
  SetConfigVariableString(A0_46, "BEH_ShadowBlotRanged_Default_AttackVariant", "0")
  print("*** Switch back to Thinner projectiles")
end
BlotThrowSpawningProjectile = L0_0
function L0_0(A0_47)
  local L1_48, L2_49, L3_50
  L1_48 = platformBlotIsOn
  L2_49 = platformMickeyIsOn
  if L1_48 == L2_49 then
    L1_48 = print
    L2_49 = "*** BLOT entering Swoop ***"
    L1_48(L2_49)
    L1_48 = platformBlotIsOn
    L2_49 = perchPointBlotIsOn
    L3_50 = 0
    isBlotMoving = true
    didBlotBeginSwoop = false
    BlotIdleAbort()
    isBlotInvulnerable = true
    SetPropertyBool(A0_47, "ForceInvulnerable", true)
    wait(1)
    L3_50 = perchPointBlotIsOn + 2
    if L3_50 > 4 then
      L3_50 = L3_50 - 4
    end
    perchPointBlotWasOn = perchPointBlotIsOn
    perchPointBlotIsOn = L3_50
    SetConfigVariableString(A0_47, "BEH_ShadowBlotRanged_Default_CanShoot", "0")
    SplineFollower_TeleportToKnot(A0_47, "A" .. L1_48 .. "P" .. L2_49 .. "SwoopStartKnot")
    SetPropertyEntity(A0_47, "LookAtEntity", "A" .. L1_48 .. "Perch" .. L3_50)
    if (GetPosition("A" .. L1_48 .. "P" .. L2_49 .. "Mid1Knot").x - GetPosition(GetPlayer()).x) * (GetPosition("A" .. L1_48 .. "P" .. L2_49 .. "Mid1Knot").x - GetPosition(GetPlayer()).x) + (GetPosition("A" .. L1_48 .. "P" .. L2_49 .. "Mid1Knot").y - GetPosition(GetPlayer()).y) * (GetPosition("A" .. L1_48 .. "P" .. L2_49 .. "Mid1Knot").y - GetPosition(GetPlayer()).y) + (GetPosition("A" .. L1_48 .. "P" .. L2_49 .. "Mid1Knot").z - GetPosition(GetPlayer()).z) * (GetPosition("A" .. L1_48 .. "P" .. L2_49 .. "Mid1Knot").z - GetPosition(GetPlayer()).z) < (GetPosition("A" .. L1_48 .. "P" .. L2_49 .. "Mid2Knot").x - GetPosition(GetPlayer()).x) * (GetPosition("A" .. L1_48 .. "P" .. L2_49 .. "Mid2Knot").x - GetPosition(GetPlayer()).x) + (GetPosition("A" .. L1_48 .. "P" .. L2_49 .. "Mid2Knot").y - GetPosition(GetPlayer()).y) * (GetPosition("A" .. L1_48 .. "P" .. L2_49 .. "Mid2Knot").y - GetPosition(GetPlayer()).y) + (GetPosition("A" .. L1_48 .. "P" .. L2_49 .. "Mid2Knot").z - GetPosition(GetPlayer()).z) * (GetPosition("A" .. L1_48 .. "P" .. L2_49 .. "Mid2Knot").z - GetPosition(GetPlayer()).z) then
      SetPropertyFloat("A" .. L1_48 .. "P" .. L2_49 .. "BranchKnot", "BranchPathChance", 0)
      print("*** BLOT swooping on main path ***")
    else
      SetPropertyFloat("A" .. L1_48 .. "P" .. L2_49 .. "BranchKnot", "BranchPathChance", 1)
      print("*** BLOT swooping on branch path ***")
    end
    SplineFollower_SetDisabled(A0_47, false)
    wait(0.1)
    SplineFollower_SetDisabled(A0_47, true)
    Print("BlotSwoopAttack: disabling spline knot, platform 1")
    SetConfigVariableString(A0_47, "BEH_ShadowBlotSwoop_Default_CanSwoop", "1")
    print("*** BLOT should be Swooping ***")
    while didBlotBeginSwoop == false and 0 < 5 do
      wait(1)
    end
    if didBlotBeginSwoop == false then
      SetConfigVariableString(A0_47, "BEH_ShadowBlotSwoop_Default_CanSwoop", "0")
      perchPointBlotIsOn = perchPointBlotWasOn
      BlotAttachToDestPerchKnot(A0_47)
      print("*** BLOT aborting Swoop attack ***")
    else
      Enable("ShadowBlotDamageVolume")
      wait(0.25)
      SetPropertyBool(A0_47, "ForceInvulnerable", false)
      isBlotInvulnerable = false
    end
  else
    L1_48 = BlotIdleAbort
    L1_48()
    L1_48 = BlotIdleAtPerch
    L1_48()
  end
end
BlotSwoopAttack = L0_0
function L0_0(A0_51)
  wait(0.25)
  SplineFollower_SetDisabled(A0_51, false)
  SetPropertyEntity(A0_51, "LookAtEntity", GetPlayer())
  if GetConfigVariableBool("BEH_ShadowBlotSwoop_Default_CanSwoop") == false then
    BlotAttachToDestPerchKnot(A0_51)
  end
end
BlotSwoopEndLookAtPlayer = L0_0
L0_0 = nil
currentSwoopAnim = L0_0
function L0_0(A0_52, A1_53)
  if (EVENT_Start_Swoop == AnimEvent_Type(A1_53) or EVENT_Finish_SwoopWindup == AnimEvent_Type(A1_53) or EVENT_Finish_SwoopLoop == AnimEvent_Type(A1_53)) and EVENT_Finish_SwoopWindup == AnimEvent_Type(A1_53) then
    didBlotBeginSwoop = true
  end
  if GetConfigVariableBool("BEH_ShadowBlotSwoop_Default_CanSwoop") and true then
    currentSwoopAnim = AnimEvent_Type(A1_53)
  end
end
BlotSwoopAnimEvent = L0_0
function L0_0(A0_54, A1_55)
  local L2_56
  L2_56 = AIBehaviorExitEvent_BehaviorName
  L2_56 = L2_56(A1_55)
  print("*** BLOT end of behavior: " .. L2_56 .. " ***")
  if AIBehaviorExitEvent_BehaviorName(A1_55) == "ShadowBlotSwoop" then
    print("*** BLOT end of Swoop ***")
    SetConfigVariableString(A0_54, "BEH_ShadowBlotSwoop_Default_CanSwoop", "0")
    SetPropertyBool(A0_54, "ForceInvulnerable", false)
    isBlotInvulnerable = false
    didBlotBeginSwoop = true
    if currentSwoopAnim == EVENT_Start_Swoop then
      Print("*** BLOT back to starting perch")
      perchPointBlotIsOn = perchPointBlotWasOn
      BlotAttachToDestPerchKnot(A0_54)
    elseif currentSwoopAnim == EVENT_Finish_SwoopWindup then
      Print("Blot finished swoop wind up before exit, let him fly!")
    elseif currentSwoopAnim == EVENT_Finish_SwoopLoop then
      Print("*** BLOT to destination perch")
      BlotAttachToDestPerchKnot(A0_54)
    end
  end
end
BlotSwoopIsDone = L0_0
function L0_0(A0_57)
  local L1_58
  while true do
    L1_58 = isBlotMoving
    if L1_58 == true then
      L1_58 = wait
      L1_58(1)
    end
  end
  L1_58 = print
  L1_58("*** BLOT diving to center ***")
  L1_58 = platformBlotIsOn
  isBlotMoving = true
  BlotIdleAbort()
  SetConfigVariableString(A0_57, "BEH_ShadowBlotRanged_Default_CanShoot", "0")
  SetPropertyBool(A0_57, "ForceInvulnerable", true)
  isBlotInvulnerable = true
  wait(0.25)
  TeleportToEntity("DiveStartKnot", A0_57)
  TeleportToEntity("DiveEndKnot", "Arena" .. L1_58 .. "Center")
  SplineFollower_TeleportToKnot(A0_57, "DiveStartKnot")
  Print("BlotDiveToArenaCenter: disabling spline follower")
  SplineFollower_SetDisabled(A0_57, true)
  SetPropertyEntity(A0_57, "LookAtEntity", nil)
  AnimEvent(A0_57, EVENT_Special_0)
  wait(0.1)
  SplineFollower_SetDisabled(A0_57, false)
  Enable("ShadowBlotDamageVolume")
  EnableComponent("Arena" .. L1_58 .. "ChargeMarker", "Rotator")
  GrabCamera("A" .. L1_58 .. "OverHeadCam", GetPlayer(), CAMERA_INSTANT_TRANSITION, 0)
end
BlotDiveToArenaCenter = L0_0
function L0_0(A0_59)
  local L1_60
  L1_60 = platformBlotIsOn
  didBlotBeginCharge = false
  isBlotGrounded = true
  ShakeCamera(3, 2, 0.05, 2, 0.15, 0.05)
  TeleportToEntity("ShadowBlotPuddle", "Arena" .. L1_60 .. "Center")
  AnimEvent("ShadowBlotPuddle", EVENT_Special_0)
  StartEmitters("BlotSplashFX")
  wait(0.5)
  SetSplineFollowerInitialSpeed(A0_59, 25)
  TeleportToEntity("IdleEmergeKnot", "Arena" .. L1_60 .. "Center")
  SplineFollower_TeleportToKnot(A0_59, "IdleEmergeKnot")
  SplineFollower_SetDisabled(A0_59, false)
  SetPropertyEntity(A0_59, "LookAtEntity", "Charge" .. L1_60 .. "EndKnot")
  wait(1)
  Print("BlotChargeAttack: disabling spline follower")
  SplineFollower_TeleportToKnot(A0_59, "Arena" .. L1_60 .. "Center")
  SplineFollower_SetDisabled(A0_59, true)
  SetConfigVariableString(A0_59, "BEH_ShadowBlotCharge_Default_CanCharge", "1")
  SetParentEntity("ShadowBlotPuddle", A0_59)
  print("*** BLOT is Charging! ***")
  while didBlotBeginCharge == false and 0 < 8 do
    wait(1)
    print("*** BLOT abort counter ***")
  end
  if didBlotBeginCharge == false then
    SetConfigVariableString(A0_59, "BEH_ShadowBlotCharge_Default_CanCharge", "0")
    SetPropertyBool(A0_59, "ForceInvulnerable", false)
    isBlotInvulnerable = false
    BlotAbortPuddle(A0_59)
    Enable("ShadowBlotDamageVolume")
    print("*** BLOT aborting Charge attack ***")
  end
end
BlotChargeAttack = L0_0
function L0_0(A0_61)
  SetConfigVariableString(A0_61, "BEH_ShadowBlotCharge_Default_CanCharge", "0")
  SetPropertyBool(A0_61, "ForceInvulnerable", false)
  isBlotInvulnerable = false
  ResetEnragedHits(A0_61)
  AnimEvent("ShadowBlotPuddle", EVENT_Special_1)
  wait(0.5)
  TeleportToEntity("ShadowBlotPuddle", "IdleHandsMarker")
  Enable("ShadowBlotDamageVolume")
  BlotFlyUpToPerchPoint(A0_61)
end
BlotChargeIsDone = L0_0
function L0_0(A0_62, A1_63)
  local L2_64
  L2_64 = isBlotEnraged
  if L2_64 then
    L2_64 = AnimEvent_Type
    L2_64 = L2_64(A1_63)
    if L2_64 == EVENT_Start_AttackCharge then
      L2_64 = true
      didBlotBeginCharge = L2_64
      L2_64 = StartEmitters
      L2_64("BlotSplashFX")
      L2_64 = SplineFollower_SetDisabled
      L2_64(A0_62, false)
      L2_64 = wait
      L2_64(3.5)
      L2_64 = SplineFollower_SetDisabled
      L2_64(A0_62, true)
      L2_64 = ActivateTriggers
      L2_64(A0_62)
      L2_64 = platformBlotIsOn
      DisableComponent("Arena" .. L2_64 .. "ChargeMarker", "Rotator")
      wait(1)
      SetParentEntity("ShadowBlotPuddle", nil)
      TeleportToEntity("ShadowBlotPuddle", "IdleHandsMarker")
      print("*** BLOT charge has begun ***")
    end
  end
end
BlotChargeHasBegun = L0_0
function L0_0(A0_65)
  local L1_66, L2_67, L3_68, L4_69, L5_70, L6_71, L7_72, L8_73, L9_74, L10_75, L11_76, L12_77, L13_78, L14_79
  L1_66 = print
  L2_67 = "*** BLOT entering Crash Land ***"
  L1_66(L2_67)
  L1_66 = platformBlotIsOn
  L2_67 = perchPointBlotIsOn
  L3_68 = false
  didBlotHandsEmerge = L3_68
  L3_68 = true
  isBlotMoving = L3_68
  L3_68 = BlotIdleAbort
  L3_68()
  L3_68 = SetPropertyBool
  L4_69 = A0_65
  L5_70 = "ForceInvulnerable"
  L6_71 = true
  L3_68(L4_69, L5_70, L6_71)
  L3_68 = true
  isBlotInvulnerable = L3_68
  L3_68 = wait
  L4_69 = 1
  L3_68(L4_69)
  L3_68 = SetConfigVariableString
  L4_69 = A0_65
  L5_70 = "BEH_ShadowBlotRanged_Default_CanShoot"
  L6_71 = "0"
  L3_68(L4_69, L5_70, L6_71)
  L3_68 = GetPosition
  L4_69 = "A"
  L5_70 = L1_66
  L6_71 = "DiveMarker1"
  L4_69 = L4_69 .. L5_70 .. L6_71
  L3_68 = L3_68(L4_69)
  L4_69 = GetPosition
  L5_70 = "A"
  L6_71 = L1_66
  L7_72 = "DiveMarker2"
  L5_70 = L5_70 .. L6_71 .. L7_72
  L4_69 = L4_69(L5_70)
  L5_70 = GetPosition
  L6_71 = "A"
  L7_72 = L1_66
  L8_73 = "DiveMarker3"
  L6_71 = L6_71 .. L7_72 .. L8_73
  L5_70 = L5_70(L6_71)
  L6_71 = GetPosition
  L7_72 = "A"
  L8_73 = L1_66
  L9_74 = "DiveMarker4"
  L7_72 = L7_72 .. L8_73 .. L9_74
  L6_71 = L6_71(L7_72)
  L7_72 = GetPosition
  L8_73 = "Arena"
  L9_74 = L1_66
  L10_75 = "Center"
  L8_73 = L8_73 .. L9_74 .. L10_75
  L7_72 = L7_72(L8_73)
  L8_73 = GetPosition
  L9_74 = GetPlayer
  L14_79 = L9_74()
  L8_73 = L8_73(L9_74, L10_75, L11_76, L12_77, L13_78, L14_79, L9_74())
  L9_74 = L3_68.x
  L10_75 = L8_73.x
  L9_74 = L9_74 - L10_75
  L10_75 = L3_68.x
  L11_76 = L8_73.x
  L10_75 = L10_75 - L11_76
  L9_74 = L9_74 * L10_75
  L10_75 = L3_68.y
  L11_76 = L8_73.y
  L10_75 = L10_75 - L11_76
  L11_76 = L3_68.y
  L12_77 = L8_73.y
  L11_76 = L11_76 - L12_77
  L10_75 = L10_75 * L11_76
  L9_74 = L9_74 + L10_75
  L10_75 = L3_68.z
  L11_76 = L8_73.z
  L10_75 = L10_75 - L11_76
  L11_76 = L3_68.z
  L12_77 = L8_73.z
  L11_76 = L11_76 - L12_77
  L10_75 = L10_75 * L11_76
  L9_74 = L9_74 + L10_75
  L10_75 = L4_69.x
  L11_76 = L8_73.x
  L10_75 = L10_75 - L11_76
  L11_76 = L4_69.x
  L12_77 = L8_73.x
  L11_76 = L11_76 - L12_77
  L10_75 = L10_75 * L11_76
  L11_76 = L4_69.y
  L12_77 = L8_73.y
  L11_76 = L11_76 - L12_77
  L12_77 = L4_69.y
  L13_78 = L8_73.y
  L12_77 = L12_77 - L13_78
  L11_76 = L11_76 * L12_77
  L10_75 = L10_75 + L11_76
  L11_76 = L4_69.z
  L12_77 = L8_73.z
  L11_76 = L11_76 - L12_77
  L12_77 = L4_69.z
  L13_78 = L8_73.z
  L12_77 = L12_77 - L13_78
  L11_76 = L11_76 * L12_77
  L10_75 = L10_75 + L11_76
  L11_76 = L5_70.x
  L12_77 = L8_73.x
  L11_76 = L11_76 - L12_77
  L12_77 = L5_70.x
  L13_78 = L8_73.x
  L12_77 = L12_77 - L13_78
  L11_76 = L11_76 * L12_77
  L12_77 = L5_70.y
  L13_78 = L8_73.y
  L12_77 = L12_77 - L13_78
  L13_78 = L5_70.y
  L14_79 = L8_73.y
  L13_78 = L13_78 - L14_79
  L12_77 = L12_77 * L13_78
  L11_76 = L11_76 + L12_77
  L12_77 = L5_70.z
  L13_78 = L8_73.z
  L12_77 = L12_77 - L13_78
  L13_78 = L5_70.z
  L14_79 = L8_73.z
  L13_78 = L13_78 - L14_79
  L12_77 = L12_77 * L13_78
  L11_76 = L11_76 + L12_77
  L12_77 = L6_71.x
  L13_78 = L8_73.x
  L12_77 = L12_77 - L13_78
  L13_78 = L6_71.x
  L14_79 = L8_73.x
  L13_78 = L13_78 - L14_79
  L12_77 = L12_77 * L13_78
  L13_78 = L6_71.y
  L14_79 = L8_73.y
  L13_78 = L13_78 - L14_79
  L14_79 = L6_71.y
  L14_79 = L14_79 - L8_73.y
  L13_78 = L13_78 * L14_79
  L12_77 = L12_77 + L13_78
  L13_78 = L6_71.z
  L14_79 = L8_73.z
  L13_78 = L13_78 - L14_79
  L14_79 = L6_71.z
  L14_79 = L14_79 - L8_73.z
  L13_78 = L13_78 * L14_79
  L12_77 = L12_77 + L13_78
  L13_78 = L7_72.x
  L14_79 = L8_73.x
  L13_78 = L13_78 - L14_79
  L14_79 = L7_72.x
  L14_79 = L14_79 - L8_73.x
  L13_78 = L13_78 * L14_79
  L14_79 = L7_72.y
  L14_79 = L14_79 - L8_73.y
  L14_79 = L14_79 * (L7_72.y - L8_73.y)
  L13_78 = L13_78 + L14_79
  L14_79 = L7_72.z
  L14_79 = L14_79 - L8_73.z
  L14_79 = L14_79 * (L7_72.z - L8_73.z)
  L13_78 = L13_78 + L14_79
  L14_79 = 1
  if L10_75 < L9_74 then
    L14_79 = 2
  end
  if L11_76 < L10_75 then
    L14_79 = 3
  end
  if L12_77 < L11_76 then
    L14_79 = 4
  end
  if L13_78 < L12_77 then
    L14_79 = 5
  end
  TeleportToEntity("CrashLandStartKnot", A0_65)
  if L14_79 ~= 5 then
    TeleportToEntity("CrashLandEndKnot", "A" .. L1_66 .. "DiveMarker" .. L14_79)
  else
    TeleportToEntity("CrashLandEndKnot", "Arena" .. L1_66 .. "Center")
  end
  SetSecondaryCameraTarget(A0_65)
  SplineFollower_TeleportToKnot(A0_65, "CrashLandStartKnot")
  Print("BlotCrashLanding: disabling spline follower")
  SplineFollower_SetDisabled(A0_65, true)
  SetPropertyEntity(A0_65, "LookAtEntity", nil)
  AnimEvent(A0_65, EVENT_Special_0)
  wait(0.1)
  SplineFollower_SetDisabled(A0_65, false)
  Enable("ShadowBlotDamageVolume")
end
BlotCrashLanding = L0_0
function L0_0(A0_80)
  local L1_81
  L1_81 = platformBlotIsOn
  ShakeCamera(3, 2, 0.05, 2, 0.125, 0.033)
  TeleportToEntity("ShadowBlotPuddle", "CrashLandEndKnot")
  isBlotGrounded = true
  if isBlotUsingHandsAttack then
    AnimEvent("ShadowBlotPuddle", EVENT_Special_1)
  else
    AnimEvent("ShadowBlotPuddle", EVENT_Special_0)
  end
  StartEmitters("BlotSplashFX")
  wait(0.5)
  SetPropertyBool(A0_80, "ForceInvulnerable", false)
  isBlotInvulnerable = false
  Disable("ShadowBlotDamageVolume")
  if isBridgeChaseCS == false then
    Hide(A0_80)
    if isBlotUsingHandsAttack == false then
      print("*** BLOT Spawning ***")
      TeleportToEntity("A" .. L1_81 .. "PuddleSpawner", "CrashLandEndKnot")
      ForceSpawn("A" .. L1_81 .. "PuddleSpawner", 1)
      wait(0.25)
      ForceSpawn("A" .. L1_81 .. "PuddleSpawner", 1)
      wait(0.75)
      ForceSpawn("A" .. L1_81 .. "PuddleSpawner", 1)
      wait(2)
      ReleaseSecondaryCameraTarget(GetPlayer())
      print(" Release secondary camera target... Crash landed ")
      Unhide(A0_80)
      TeleportToEntity("IdleEmergeKnot", "CrashLandEndKnot")
      SplineFollower_TeleportToKnot(A0_80, "IdleEmergeKnot")
      SetPropertyEntity(A0_80, "LookAtEntity", GetPlayer())
      AnimEvent(A0_80, EVENT_Special_5)
      wait(1)
      AnimEvent("ShadowBlotPuddle", EVENT_Special_1)
      wait(1)
      TeleportToEntity("ShadowBlotPuddle", "IdleHandsMarker")
      BlotFlyUpToPerchPoint(A0_80)
    else
      print("*** BLOT Hands Attack ***")
      TeleportToEntity("ShadowBlotHands", "CrashLandEndKnot")
      while didBlotHandsEmerge == false and 0 < 8 do
        wait(1)
      end
      if didBlotHandsEmerge == false then
        print("*** BLOT aborting hands attack ***")
        BlotHandAttackDone("ShadowBlotHands", nil, "true")
      end
    end
  end
end
BlotCrashedLanded = L0_0
function L0_0(A0_82, A1_83)
  if isBlotUsingHandsAttack and AnimEvent_Type(A1_83) == EVENT_Start_AttackMelee then
    didBlotHandsEmerge = true
    TeleportToEntity("HandsCrawlStartKnot", A0_82)
    TeleportToEntity("HandsCrawlEndKnot", GetPlayer())
    SplineFollower_TeleportToKnot(A0_82, "HandsCrawlStartKnot")
    SplineFollower_SetDisabled(A0_82, false)
    SetParentEntity("ShadowBlotPuddle", A0_82)
    print("*** BLOT hands emerged ***")
  end
end
BlotHandsEmereged = L0_0
function L0_0(A0_84, A1_85, A2_86)
  if isBlotUsingHandsAttack and (A1_85 == nil and A2_86 == "true" or AnimEvent_Type(A1_85) == EVENT_Finished_Sequence) then
    isBlotUsingHandsAttack = false
    didBlotHandsEmerge = false
    Print("BlotHandAttackDone: disabling spline follower")
    SetParentEntity("ShadowBlotPuddle", nil)
    TeleportToEntity(A0_84, "IdleHandsMarker")
    SplineFollower_SetDisabled(A0_84, true)
    ReleaseSecondaryCameraTarget(GetPlayer())
    print(" Release secondary camera target... Hands are done ")
    BlotAbortPuddle("ShadowBlot")
  end
end
BlotHandAttackDone = L0_0
function L0_0(A0_87)
  Unhide(A0_87)
  TeleportToEntity("IdleEmergeKnot", "ShadowBlotPuddle")
  SplineFollower_TeleportToKnot(A0_87, "IdleEmergeKnot")
  SetPropertyEntity(A0_87, "LookAtEntity", GetPlayer())
  AnimEvent(A0_87, EVENT_Special_6)
  wait(1)
  AnimEvent("ShadowBlotPuddle", EVENT_Special_1)
  wait(1)
  TeleportToEntity("ShadowBlotPuddle", "IdleHandsMarker")
  SetPropertyBool(A0_87, "ForceInvulnerable", false)
  isBlotInvulnerable = false
  BlotFlyUpToPerchPoint(A0_87)
end
BlotAbortPuddle = L0_0
function L0_0(A0_88, A1_89)
  local L3_90
  L3_90 = isBlotGrounded
  if L3_90 then
    L3_90 = AnimEvent
    L3_90(A0_88, AnimEvent_Type(A1_89))
  end
end
SyncPuddleWithAnimation = L0_0
function L0_0(A0_91)
  local L1_92, L2_93
  L1_92 = print
  L2_93 = "*** BLOT entering Bridge Chase ***"
  L1_92(L2_93)
  L1_92 = isBridge1Down
  if L1_92 then
    L1_92 = AnimEvent
    L2_93 = A0_91
    L1_92(L2_93, EVENT_Special_2)
    L1_92 = BlotIdleAbort
    L1_92()
    L1_92 = true
    isBlotMoving = L1_92
    L1_92 = true
    isBlotInvulnerable = L1_92
    L1_92 = SetPropertyBool
    L2_93 = A0_91
    L1_92(L2_93, "ForceInvulnerable", true)
    L1_92 = SetConfigVariableString
    L2_93 = A0_91
    L1_92(L2_93, "BEH_ShadowBlotRanged_Default_CanShoot", "0")
    L1_92 = SetConfigVariableString
    L2_93 = A0_91
    L1_92(L2_93, "BEH_ShadowBlotSwoop_Default_CanSwoop", "0")
    L1_92 = AI_SetDisabled
    L2_93 = "ShadowBlot"
    L1_92(L2_93, true)
    L1_92 = ForEachEntityInGroup
    L2_93 = AI_SetDisabled
    L1_92(L2_93, "Spatters", true)
    L1_92 = ReleaseCamera
    L2_93 = CAMERA_LERP_TRANSITION
    L1_92(L2_93, 1.5)
    L1_92 = SetCameraHintPitch
    L2_93 = GetPlayer
    L2_93 = L2_93()
    L1_92(L2_93, 0)
    L1_92 = TeleportToEntity
    L2_93 = GetPlayer
    L2_93 = L2_93()
    L1_92(L2_93, "BridgeChaseMickeyMarker")
    L1_92 = SetSplineFollowerInitialSpeed
    L2_93 = A0_91
    L1_92(L2_93, 7)
    L1_92 = SplineFollower_TeleportToKnot
    L2_93 = A0_91
    L1_92(L2_93, "ChaseStartKnot")
    L1_92 = SplineFollower_SetDisabled
    L2_93 = A0_91
    L1_92(L2_93, false)
    L1_92 = SetPropertyEntity
    L2_93 = A0_91
    L1_92(L2_93, "LookAtEntity", "ChaseEndKnot")
    L1_92 = TeleportToEntity
    L2_93 = "ShadowBlotPuddle"
    L1_92(L2_93, "ChaseStartKnot")
    L1_92 = AnimEvent
    L2_93 = "ShadowBlotPuddle"
    L1_92(L2_93, EVENT_Special_0)
    L1_92 = AnimEvent
    L2_93 = A0_91
    L1_92(L2_93, EVENT_Special_4)
    L1_92 = wait
    L2_93 = 1
    L1_92(L2_93)
    L1_92 = SplineFollower_SetDisabled
    L2_93 = A0_91
    L1_92(L2_93, true)
    L1_92 = Print
    L2_93 = "BlotChaseAcrossBridge: disabling spline follower"
    L1_92(L2_93)
    L1_92 = wait
    L2_93 = 1
    L1_92(L2_93)
    L1_92 = wait
    L2_93 = 1.5
    L1_92(L2_93)
    L1_92 = Bark
    L2_93 = GetPlayer
    L2_93 = L2_93()
    L1_92(L2_93, "Run Mickey! Run!", 2, "Oswald", "Oswald")
    L1_92 = wait
    L2_93 = 0.25
    L1_92(L2_93)
    L1_92 = UnrestrictCutSceneInput
    L1_92()
    L1_92 = SetSecondaryCameraTarget
    L2_93 = "ShadowBlot"
    L1_92(L2_93)
    L1_92 = wait
    L2_93 = 1
    L1_92(L2_93)
    L1_92 = SplineFollower_SetDisabled
    L2_93 = A0_91
    L1_92(L2_93, false)
    L1_92 = true
    isBlotMoving = L1_92
    L1_92 = SetParentEntity
    L2_93 = "ShadowBlotPuddle"
    L1_92(L2_93, A0_91)
    L1_92 = Enable
    L2_93 = "ShadowBlotDamageVolume"
    L1_92(L2_93)
    L1_92 = wait
    L2_93 = 1
    L1_92(L2_93)
    L1_92 = GetFacing
    L2_93 = A0_91
    L1_92 = L1_92(L2_93)
    L2_93 = GetPosition
    L2_93 = L2_93(A0_91)
    L2_93.y = L2_93.y - 0.5
    SetTransformation("ShadowBlotPuddle", L2_93, L1_92)
    wait(1.5)
    ShakeCamera(3, 2, 0.05, 2, 0.125, 0.033)
  end
end
BlotChaseAcrossBridge = L0_0
function L0_0(A0_94)
  isBlotMoving = false
  isBridgeChaseCS = false
  isBlotGrounded = false
  SetParentEntity("ShadowBlotPuddle", nil)
  TeleportToEntity("ShadowBlotPuddle", "IdleHandsMarker")
  AnimEvent(A0_94, EVENT_Special_1)
  SetPropertyEntity(A0_94, "LookAtEntity", GetPlayer())
  isBlotInvulnerable = false
  SetPropertyBool(A0_94, "ForceInvulnerable", false)
  AI_SetDisabled("ShadowBlot", false)
  ForEachEntityInGroup(AI_SetDisabled, "Spatters", false)
  platformBlotIsOn = 2
  BlotFlyUpToPerchPoint(A0_94)
end
BlotEndOfChase = L0_0
function L0_0(A0_95)
  if isFirstBridgeChase and isBlotEnraged == false and platformBlotIsOn == 1 then
    BlotMoveToNextArena(A0_95)
    isFirstBridgeChase = false
  else
    BlotMoveToNextArena(A0_95)
  end
end
BlotBridge1Chase = L0_0
function L0_0(A0_96)
  SetConfigVariableString(A0_96, "BEH_ShadowBlotRanged_Default_CanShoot", "0")
  SetPropertyBool(A0_96, "ForceInvulnerable", true)
  isBlotInvulnerable = true
  AnimEvent(A0_96, EVENT_Special_1)
  SetPropertyEntity(A0_96, "LookAtEntity", "A1Perch4")
end
BlotSetup = L0_0
function L0_0(A0_97, A1_98)
  local L2_99, L3_100, L4_101
  L2_99 = 0
  if A1_98 ~= nil then
    L3_100 = tonumber
    L4_101 = A1_98
    L3_100 = L3_100(L4_101)
    L2_99 = L3_100
    L3_100 = print
    L4_101 = " perch has a value of "
    L4_101 = L4_101 .. A1_98
    L3_100(L4_101)
  end
  L3_100 = platformBlotIsOn
  L4_101 = perchPointBlotIsOn
  if L2_99 == 0 or L2_99 == L4_101 then
    isBlotMoving = false
    isBlotInvulnerable = false
    SetPropertyBool(A0_97, "ForceInvulnerable", false)
    Disable("ShadowBlotDamageVolume")
    SplineFollower_TeleportToKnot(A0_97, "A" .. L3_100 .. "P" .. L4_101 .. "IdleLoopStartKnot")
    SplineFollower_SetDisabled(A0_97, false)
    SetPropertyEntity(A0_97, "LookAtEntity", GetPlayer())
    ReleaseSecondaryCameraTarget(GetPlayer())
    print(" Release secondary camera target... attached to dest perch knot ")
    wait(0.5)
    AnimEvent(A0_97, EVENT_Finish_SwoopLoop)
    wait(0.5)
    SetConfigVariableString(A0_97, "BEH_ShadowBlotRanged_Default_CanShoot", "1")
    print("*** BLOT attached to perch point ***")
    BlotIdleAtPerch()
  end
end
BlotAttachToDestPerchKnot = L0_0
function L0_0(A0_102)
  local L1_103
  L1_103 = print
  L1_103("*** BLOT flying up to perch ***")
  L1_103 = false
  isBlotGrounded = L1_103
  L1_103 = isBlotsFirstCharge
  if L1_103 then
    L1_103 = Bark
    L1_103(GetPlayer(), "The ShadowBlot blindly charged head first at you!?", 5, "Oswald", "Oswald")
    L1_103 = false
    isBlotsFirstCharge = L1_103
  end
  L1_103 = didBlotCollide
  if L1_103 then
    L1_103 = false
    didBlotCollide = L1_103
  else
    L1_103 = ResetCamera
    L1_103(1.5, true)
  end
  L1_103 = platformBlotIsOn
  perchPointBlotIsOn = 1
  if isBlotDead == false then
    isBlotMoving = true
    TeleportToEntity("A" .. L1_103 .. "FlyUpStartKnot", A0_102)
    SplineFollower_TeleportToKnot(A0_102, "A" .. L1_103 .. "FlyUpStartKnot")
    Print("BlotFlyUpToPerchPoint: disabling spline follower")
    SplineFollower_SetDisabled(A0_102, true)
    SetPropertyEntity(A0_102, "LookAtEntity", "A" .. L1_103 .. "FlyUpEndKnot")
    AnimEvent(A0_102, EVENT_Special_1)
    wait(0.5)
    SplineFollower_SetDisabled(A0_102, false)
    DeactivateTriggers(A0_102)
    ReleaseSecondaryCameraTarget(GetPlayer())
    print(" Release secondary camera target... fly up to perch ")
    wait(3)
    SetCameraHintPitch(GetPlayer(), 0)
  end
end
BlotFlyUpToPerchPoint = L0_0
function L0_0(A0_104)
  local L1_105, L2_106, L3_107, L4_108
  L1_105 = print
  L2_106 = "*** BLOT moving Left ***"
  L1_105(L2_106)
  L1_105 = perchPointBlotIsOn
  L1_105 = L1_105 - 1
  L2_106 = platformBlotIsOn
  if L1_105 < 1 then
    L1_105 = 4
  end
  L3_107 = perchPointBlotIsOn
  L4_108 = L1_105
  isBlotMoving = true
  isBlotInvulnerable = false
  BlotIdleAbort()
  SetConfigVariableString(A0_104, "BEH_ShadowBlotRanged_Default_CanShoot", "0")
  wait(0.1)
  perchPointBlotIsOn = L1_105
  AnimEvent(A0_104, EVENT_Special_1)
  SetSplineFollowerInitialSpeed(A0_104, 8)
  SplineFollower_TeleportToKnot(A0_104, "A" .. L2_106 .. "P" .. L3_107 .. "LeftStartKnot")
  SplineFollower_SetDisabled(A0_104, false)
  SetPropertyEntity(A0_104, "LookAtEntity", "A" .. L2_106 .. "Perch" .. L4_108)
end
BlotMoveToPerchPointLeft = L0_0
function L0_0(A0_109)
  local L1_110, L2_111, L3_112, L4_113
  L1_110 = print
  L2_111 = "*** BLOT moving Right ***"
  L1_110(L2_111)
  L1_110 = perchPointBlotIsOn
  L1_110 = L1_110 + 1
  L2_111 = platformBlotIsOn
  if L1_110 > 4 then
    L1_110 = 1
  end
  L3_112 = perchPointBlotIsOn
  L4_113 = L1_110
  isBlotMoving = true
  isBlotInvulnerable = false
  BlotIdleAbort()
  SetConfigVariableString(A0_109, "BEH_ShadowBlotRanged_Default_CanShoot", "0")
  wait(0.1)
  perchPointBlotIsOn = L1_110
  AnimEvent(A0_109, EVENT_Special_1)
  SetSplineFollowerInitialSpeed(A0_109, 8)
  SplineFollower_TeleportToKnot(A0_109, "A" .. L2_111 .. "P" .. L3_112 .. "RightStartKnot")
  SplineFollower_SetDisabled(A0_109, false)
  SetPropertyEntity(A0_109, "LookAtEntity", "A" .. L2_111 .. "Perch" .. L4_113)
end
BlotMoveToPerchPointRight = L0_0
function L0_0(A0_114)
  local L1_115, L2_116
  L1_115 = platformBlotIsOn
  L2_116 = platformMickeyIsOn
  if L1_115 ~= L2_116 then
    L1_115 = print
    L2_116 = "*** BLOT moving to Next Arena ***"
    L1_115(L2_116)
    while true do
      L1_115 = isBlotMoving
      if L1_115 == true then
        L1_115 = wait
        L2_116 = 1
        L1_115(L2_116)
        L1_115 = print
        L2_116 = "*** BLOT waiting to go to next arena cause he's already moving ***"
        L1_115(L2_116)
      end
    end
    L1_115 = platformBlotIsOn
    L2_116 = platformMickeyIsOn
    if L1_115 ~= L2_116 then
      L1_115 = 2
      perchPointBlotIsOn = L1_115
      L1_115 = true
      isBlotMoving = L1_115
      L1_115 = false
      isBlotClimbing = L1_115
      L1_115 = false
      isBlotInvulnerable = L1_115
      L1_115 = BlotIdleAbort
      L1_115()
      L1_115 = platformMickeyIsOn
      L2_116 = perchPointBlotIsOn
      platformBlotIsOn = platformMickeyIsOn
      if L1_115 == 2.5 then
        print("mickey's platform is 2.5")
        L1_115 = 2
      end
      TeleportToEntity("ArenaTransitionStartKnot", A0_114)
      TeleportToEntity("ArenaTransitionEndKnot", "A" .. L1_115 .. "Perch" .. L2_116)
      SetConfigVariableString(A0_114, "BEH_ShadowBlotRanged_Default_CanShoot", "0")
      AnimEvent(A0_114, EVENT_Special_1)
      SplineFollower_TeleportToKnot(A0_114, "ArenaTransitionStartKnot")
      SplineFollower_SetDisabled(A0_114, false)
      SetPropertyEntity(A0_114, "LookAtEntity", "ArenaTransitionEndKnot")
      ResetEnragedHits(A0_114)
      print("*** BLOT should be on his way to the next arena ***")
    else
      L1_115 = print
      L2_116 = "*** BLOT is already on the same arena ***"
      L1_115(L2_116)
    end
  else
    L1_115 = print
    L2_116 = "*** BLOT is already on the same arena ***"
    L1_115(L2_116)
  end
end
BlotMoveToNextArena = L0_0
function L0_0()
  if isBlotIdle == false then
    isBlotIdle = true
    TimerEnable("ShadowBlotIdleTimer")
    TimerReset("ShadowBlotIdleTimer")
    print("*** BLOT is idle ***")
  end
end
BlotIdleAtPerch = L0_0
function L0_0()
  isBlotIdle = false
  TimerDisable("ShadowBlotIdleTimer")
  print("*** BLOT idle is aborted ***")
end
BlotIdleAbort = L0_0
function L0_0(A0_117)
  local L1_118, L2_119, L3_120
  L1_118 = isBlotIdle
  if L1_118 then
    L1_118 = isBlotMoving
    if L1_118 == false then
      L1_118 = isBlotEnraged
      if L1_118 == false then
        L1_118 = isBlotClimbing
        if L1_118 == false then
          L1_118 = print
          L2_119 = "*** BLOT idled too long ***"
          L1_118(L2_119)
          L1_118 = GetEntityGroupSize
          L2_119 = "Spatters"
          L1_118 = L1_118(L2_119)
          numberOfSpatters = L1_118
          L1_118 = BlotAIStage
          if L1_118 == 1 then
            L1_118 = GetPosition
            L2_119 = A0_117
            L1_118 = L1_118(L2_119)
            L2_119 = GetPosition
            L3_120 = GetPlayer
            L3_120 = L3_120()
            L2_119 = L2_119(L3_120, L3_120())
            L3_120 = L1_118.x
            L3_120 = L3_120 - L2_119.x
            L3_120 = L3_120 * (L1_118.x - L2_119.x)
            L3_120 = L3_120 + (L1_118.y - L2_119.y) * (L1_118.y - L2_119.y)
            L3_120 = L3_120 + (L1_118.z - L2_119.z) * (L1_118.z - L2_119.z)
            print("*** BLOT is " .. L3_120 .. " far away ***")
            if platformBlotIsOn == 1 and L3_120 > A1CloseDist or platformBlotIsOn == 2 and L3_120 > A2CloseDist then
              BlotSwoopAttack(A0_117)
            elseif math.random(2) == 1 then
              BlotMoveToPerchPointLeft(A0_117)
            else
              BlotMoveToPerchPointRight(A0_117)
            end
          else
            L1_118 = BlotAIStage
            if L1_118 == 2 then
              L1_118 = GetPosition
              L2_119 = A0_117
              L1_118 = L1_118(L2_119)
              L2_119 = GetPosition
              L3_120 = GetPlayer
              L3_120 = L3_120()
              L2_119 = L2_119(L3_120, L3_120())
              L3_120 = L1_118.x
              L3_120 = L3_120 - L2_119.x
              L3_120 = L3_120 * (L1_118.x - L2_119.x)
              L3_120 = L3_120 + (L1_118.y - L2_119.y) * (L1_118.y - L2_119.y)
              L3_120 = L3_120 + (L1_118.z - L2_119.z) * (L1_118.z - L2_119.z)
              print("*** BLOT is " .. L3_120 .. " far away ***")
              if platformBlotIsOn == 1 and L3_120 > A1CloseDist or platformBlotIsOn == 2 and L3_120 > A2CloseDist then
                BlotSwoopAttack(A0_117)
              elseif math.random(3) == 1 then
                BlotMoveToPerchPointLeft(A0_117)
              elseif math.random(3) == 2 then
                BlotMoveToPerchPointRight(A0_117)
              elseif numberOfSpatters < 3 and isBlotThrowingSpawnProjectile == false then
                BlotIdleAbort()
                BlotIdleAtPerch()
                BlotThrowSpawningProjectile(A0_117)
              else
                BlotSwoopAttack(A0_117)
              end
            else
              L1_118 = GetPosition
              L2_119 = A0_117
              L1_118 = L1_118(L2_119)
              L2_119 = GetPosition
              L3_120 = GetPlayer
              L3_120 = L3_120()
              L2_119 = L2_119(L3_120, L3_120())
              L3_120 = L1_118.x
              L3_120 = L3_120 - L2_119.x
              L3_120 = L3_120 * (L1_118.x - L2_119.x)
              L3_120 = L3_120 + (L1_118.y - L2_119.y) * (L1_118.y - L2_119.y)
              L3_120 = L3_120 + (L1_118.z - L2_119.z) * (L1_118.z - L2_119.z)
              print("*** BLOT is " .. L3_120 .. " far away ***")
              if platformBlotIsOn == 1 and L3_120 > A1CloseDist or platformBlotIsOn == 2 and L3_120 > A2CloseDist then
                BlotSwoopAttack(A0_117)
              elseif math.random(5) == 1 then
                BlotMoveToPerchPointLeft(A0_117)
              elseif math.random(5) == 2 then
                BlotMoveToPerchPointRight(A0_117)
              elseif math.random(5) == 3 then
                BlotSwoopAttack(A0_117)
              elseif math.random(5) == 4 and isBlotThrowingSpawnProjectile == false and numberOfSpatters < 4 then
                BlotIdleAbort()
                BlotIdleAtPerch()
                BlotThrowSpawningProjectile(A0_117)
              else
                isBlotUsingHandsAttack = true
                BlotCrashLanding(A0_117)
              end
            end
          end
        end
      end
    end
  else
    L1_118 = BlotIdleAbort
    L1_118()
  end
end
BlotIdledTooLong = L0_0
function L0_0(A0_121)
  isBlotClimbing = false
end
BlotStopClimb = L0_0
function L0_0(A0_122)
  local L1_123
  L1_123 = perchPointBlotIsOn
  isBlotClimbing = true
  isBlotMoving = false
  AnimEvent(A0_122, EVENT_Finish_SwoopLoop)
  SplineFollower_TeleportToKnot(A0_122, "ClimbPerch" .. L1_123)
  SetPropertyEntity(A0_122, "LookAtEntity", GetPlayer())
  SetConfigVariableString(A0_122, "BEH_ShadowBlotRanged_Default_CanShoot", "1")
  print("*** BLOT is done switching climb perches ***")
end
BlotAtNewPerch = L0_0
function L0_0(A0_124, A1_125)
  local L2_126
  while true do
    L2_126 = isBlotMoving
    if L2_126 == true then
      L2_126 = isBlotClimbing
    end
    if L2_126 == false then
      L2_126 = wait
      L2_126(1)
      L2_126 = print
      L2_126("*** BLOT waiting to climb cause he's already moving ***")
    end
  end
  L2_126 = platformMickeyIsOn
  if L2_126 == 2.5 then
    L2_126 = tonumber
    L2_126 = L2_126(A1_125)
    if L2_126 ~= perchPointBlotIsOn or L2_126 == perchPointBlotIsOn and isBlotClimbing == false then
      perchPointBlotIsOn = L2_126
      print("*** BLOT move to Climb perch " .. L2_126 .. " ***")
      platformBlotIsOn = platformMickeyIsOn
      isBlotMoving = true
      isBlotClimbing = true
      BlotIdleAbort()
      SetConfigVariableString(A0_124, "BEH_ShadowBlotRanged_Default_CanShoot", "0")
      TeleportToEntity("ToClimbStartKnot", A0_124)
      TeleportToEntity("ToClimbEndKnot", "ClimbPerch" .. L2_126)
      AnimEvent(A0_124, EVENT_Special_1)
      SplineFollower_TeleportToKnot(A0_124, "ToClimbStartKnot")
      SplineFollower_SetDisabled(A0_124, false)
      SetPropertyEntity(A0_124, "LookAtEntity", "ToClimbEndKnot")
    end
  end
end
BlotMoveToClimbPerch = L0_0
function L0_0(A0_127)
  local L1_128
  while true do
    L1_128 = isBlotMoving
    if L1_128 == true then
      L1_128 = wait
      L1_128(1)
      L1_128 = print
      L1_128("*** BLOT waiting to climb cause he's already moving ***")
    end
  end
  L1_128 = true
  isBlotMoving = L1_128
  L1_128 = SetConfigVariableString
  L1_128(A0_127, "BEH_ShadowBlotRanged_Default_CanShoot", "0")
  L1_128 = GetPosition
  L1_128 = L1_128(A0_127)
  SetTransformation("ClimbDelayLoopStartKnot", L1_128, vector4(0, 0, 0))
  AnimEvent(A0_127, EVENT_Special_1)
  SplineFollower_TeleportToKnot(A0_127, "ClimbDelayLoopStartKnot")
  SplineFollower_SetDisabled(A0_127, false)
end
BlotHitClimbDelayLoop = L0_0
function L0_0(A0_129)
  isBlotEnraged = false
  if BlotAIStage == 1 then
    hitsToGetAngry = Stage1Angry
    hitsToGetEnraged = Stage1Enraged
  elseif BlotAIStage == 2 then
    hitsToGetAngry = Stage2Angry
    hitsToGetEnraged = Stage2Enraged
  else
    hitsToGetAngry = Stage3Angry
    hitsToGetEnraged = Stage3Enraged
  end
  print("*** Reset enraged hits ***")
end
ResetEnragedHits = L0_0
function L0_0(A0_130, A1_131)
  local L2_132, L3_133
  L2_132 = BlotIdleAbort
  L2_132()
  L2_132 = isBlotEnraged
  if L2_132 == false then
    L2_132 = isBlotClimbing
    if L2_132 == false then
      L2_132 = isBlotInvulnerable
      if L2_132 == false then
        L2_132 = hitsToGetEnraged
        if L2_132 > 1 then
          L2_132 = hitsToGetAngry
          L2_132 = L2_132 - 1
          hitsToGetAngry = L2_132
          L2_132 = hitsToGetEnraged
          L2_132 = L2_132 - 1
          hitsToGetEnraged = L2_132
          L2_132 = GetEntityGroupSize
          L3_133 = "Spatters"
          L2_132 = L2_132(L3_133)
          numberOfSpatters = L2_132
          L2_132 = hitsToGetAngry
          L3_133 = hitsToGetEnraged
          print("*** HIT *** Hits to get Angry: " .. L2_132 .. " / Hits to get Enraged: " .. L3_133)
          if isBlotMoving == false then
            isBlotInvulnerable = true
            if A1_131 == "thinner" then
              if BlotAIStage == 1 then
                if 1 > hitsToGetAngry then
                  hitsToGetAngry = Stage1Angry
                  BlotSwoopAttack(A0_130)
                elseif math.random(2) == 1 then
                  BlotMoveToPerchPointLeft(A0_130)
                else
                  BlotMoveToPerchPointRight(A0_130)
                end
              elseif BlotAIStage == 2 then
                if 1 > hitsToGetAngry then
                  hitsToGetAngry = Stage2Angry
                  if math.random(2) == 1 and isBlotThrowingSpawnProjectile == false and numberOfSpatters < 3 then
                    BlotIdleAbort()
                    BlotIdleAtPerch()
                    BlotThrowSpawningProjectile(A0_130)
                  else
                    isBlotUsingHandsAttack = true
                    BlotCrashLanding(A0_130)
                  end
                else
                  BlotSwoopAttack(A0_130)
                end
              elseif 1 > hitsToGetAngry then
                hitsToGetAngry = Stage3Angry
                if numberOfSpatters < 2 then
                  isBlotUsingHandsAttack = false
                else
                  isBlotUsingHandsAttack = true
                end
                BlotCrashLanding(A0_130)
              else
                BlotSwoopAttack(A0_130)
              end
            elseif math.random(2) == 1 then
              BlotMoveToPerchPointLeft(A0_130)
            else
              BlotMoveToPerchPointRight(A0_130)
            end
          else
            print("*** BLOT was hit while moving ***")
          end
        else
          L2_132 = isBlotMoving
          if L2_132 == false then
            L2_132 = 0
            hitsToGetEnraged = L2_132
            L2_132 = 0
            hitsToGetAngry = L2_132
            L2_132 = true
            isBlotEnraged = L2_132
            L2_132 = BlotDiveToArenaCenter
            L3_133 = A0_130
            L2_132(L3_133)
          end
        end
      end
    end
  else
    L2_132 = isBlotClimbing
    if L2_132 then
      L2_132 = isBlotInvulnerable
      if L2_132 == false then
        L2_132 = true
        isBlotInvulnerable = L2_132
        L2_132 = BlotHitClimbDelayLoop
        L3_133 = A0_130
        L2_132(L3_133)
        L2_132 = wait
        L3_133 = 3
        L2_132(L3_133)
        L2_132 = false
        isBlotInvulnerable = L2_132
      end
    else
      L2_132 = print
      L3_133 = "*** BLOT cannot currently be hit ***"
      L2_132(L3_133)
    end
  end
end
BlotIsHit = L0_0
function L0_0(A0_134)
  local L1_135, L2_136
  L1_135 = isBlotInvulnerable
  if L1_135 == false then
    L1_135 = true
    isBlotInvulnerable = L1_135
    L1_135 = hitsToGetAngry
    L1_135 = L1_135 - 1
    hitsToGetAngry = L1_135
    L1_135 = hitsToGetEnraged
    L1_135 = L1_135 - 1
    hitsToGetEnraged = L1_135
    L1_135 = hitsToGetAngry
    L2_136 = hitsToGetEnraged
    print("*** HIT *** Hits to get Angry: " .. L1_135 .. " / Hits to get Enraged: " .. L2_136)
    wait(2)
    isBlotInvulnerable = false
  end
end
BlotHandsAreHit = L0_0
function L0_0(A0_137, A1_138)
  if AnimEvent_Type(A1_138) == EVENT_Start_WatchTV then
    isBlotWatchingTV = true
    isBlotMoving = true
    BlotIdleAbort()
    if isBlotClimbing then
      SetReversed(A0_137, false)
    end
    ReleaseSecondaryCameraTarget(GetPlayer())
    print(" Release secondary camera target... start TV ")
    Print("*** BLOT attracted to TV ***")
  end
end
BlotStartTVAttraction = L0_0
function L0_0(A0_139, A1_140)
  if AIBehaviorExitEvent_BehaviorName(A1_140) == "ShadowBlotWatchAttraction" then
    isBlotWatchingTV = false
    if isBlotClimbing then
      BlotMoveToClimb(A0_139)
    else
      BlotFlyUpToPerchPoint(A0_139)
    end
  end
end
BlotEndTVAttraction = L0_0
function L0_0(A0_141)
  print("*** TV was destroyed! ***")
end
DestroyTV = L0_0
function L0_0(A0_142)
  hitsToGetEnraged = 0
  isBlotMoving = true
  BlotIdleAbort()
  SetConfigVariableString(A0_142, "BEH_ShadowBlotRanged_Default_CanShoot", "0")
  TeleportToEntity("AnvilDropStartKnot", A0_142)
  AnimVarInt(A0_142, VAR_HitReaction_Type, 4)
  AnimEvent(A0_142, EVENT_Start_HitReaction)
  SplineFollower_TeleportToKnot(A0_142, "AnvilDropStartKnot")
  SplineFollower_SetDisabled(A0_142, false)
  SetPropertyEntity(A0_142, "LookAtEntity", nil)
  print("*** HIT *** Hit by Anvil ***")
end
BlotHitByAnvil = L0_0
function L0_0(A0_143)
  isBlotMoving = false
  BlotIsHit(A0_143, "thinner")
end
BlotEndAnvilHit = L0_0
function L0_0(A0_144, A1_145)
  local L2_146
  L2_146 = wait
  L2_146(1)
  L2_146 = Hide
  L2_146("ThinnerBottle" .. A1_145)
  L2_146 = Disable
  L2_146("ThinnerBottle" .. A1_145)
  L2_146 = StartEmitters
  L2_146("ThinnerSplat" .. A1_145)
  L2_146 = AudioPostEventOn
  L2_146("ThinnerBottle" .. A1_145, "Play_sfx_MJM_ThinnerBottle_Breaks")
  L2_146 = wait
  L2_146(0.5)
  L2_146 = GrabCamera
  L2_146("Thinner" .. A1_145 .. "UnderCam", "Thinner" .. A1_145 .. "LookAt", CAMERA_INSTANT_TRANSITION, 0)
  L2_146 = wait
  L2_146(0.5)
  L2_146 = ForceSketched
  L2_146("Thinner" .. A1_145 .. "Rebar")
  L2_146 = wait
  L2_146(1)
  L2_146 = Hide
  L2_146("Thinner" .. A1_145 .. "ChunkStatic")
  L2_146 = Unhide
  L2_146("Thinner" .. A1_145 .. "Chunk")
  L2_146 = Enable
  L2_146("Thinner" .. A1_145 .. "Chunk")
  L2_146 = SplineFollower_SetDisabled
  L2_146("Thinner" .. A1_145 .. "Chunk", true)
  L2_146 = UnrestrictCutSceneInput
  L2_146()
  L2_146 = AI_SetDisabled
  L2_146("ShadowBlot", false)
  L2_146 = ForEachEntityInGroup
  L2_146(AI_SetDisabled, "Spatters", false)
  L2_146 = platformBlotIsOn
  GrabCamera("A" .. L2_146 .. "OverHeadCam", GetPlayer(), CAMERA_INSTANT_TRANSITION, 0)
  wait(1)
  if 0 < thinnerBottleCount then
    SetConfigVariableString(A0_144, "BEH_ShadowBlotCharge_Default_CanCharge", "0")
  end
  ForEachEntityInGroup(Enable, "Thinner" .. A1_145 .. "EscapeTrigger")
  wait(3)
  SplineFollower_SetDisabled("Thinner" .. A1_145 .. "Chunk", false)
  wait(4)
  Hide("Thinner" .. A1_145 .. "Chunk")
  ForEachEntityInGroup(Hide, "Thinner" .. A1_145 .. "Inert")
end
BlotCollisionCutScene = L0_0
function L0_0(A0_147, A1_148)
  local L2_149
  L2_149 = wait
  L2_149(1)
  L2_149 = Hide
  L2_149("ThinnerBottle" .. A1_148)
  L2_149 = StartEmitters
  L2_149("ThinnerSplat" .. A1_148)
  L2_149 = AudioPostEventOn
  L2_149("ThinnerBottle" .. A1_148, "Play_sfx_MJM_ThinnerBottle_Breaks")
  L2_149 = TeleportToEntity
  L2_149("ShadowBlotPuddle", A0_147)
  L2_149 = AnimEvent
  L2_149("ShadowBlotPuddle", EVENT_Special_0)
  L2_149 = SetParentEntity
  L2_149("ShadowBlotPuddle", "Thinner" .. A1_148 .. "Chunk")
  L2_149 = wait
  L2_149(2)
  L2_149 = platformBlotIsOn
  GrabCamera("A" .. L2_149 .. "OverHeadCam", "ThinnerBottle" .. A1_148, CAMERA_INSTANT_TRANSITION, 0)
  wait(3)
  ForceSketched("Thinner" .. A1_148 .. "Rebar")
  Hide("Thinner" .. A1_148 .. "ChunkStatic")
  Unhide("Thinner" .. A1_148 .. "Chunk")
  Enable("Thinner" .. A1_148 .. "Chunk")
  SplineFollower_SetDisabled("Thinner" .. A1_148 .. "Chunk", true)
  UnrestrictCutSceneInput()
  wait(3)
  SplineFollower_SetDisabled("Thinner" .. A1_148 .. "Chunk", false)
  wait(4)
  Hide("Thinner" .. A1_148 .. "Chunk")
  ForEachEntityInGroup(Hide, "Thinner" .. A1_148 .. "Inert")
  CSEndLookAtEntity()
  print(" Release camera... death of blot ")
  SetCameraHintPitch(GetPlayer(), 0)
  print(" Set MJ_ShadowBlotResolution to 0")
  SetGlobal("MJ_ShadowBlotResolution", 0)
  StartFadeOut(1)
end
BlotCollisionDeathCutScene = L0_0
function L0_0(A0_150)
  ForEachEntityInGroup(Disable, A0_150)
  wait(1)
  ResetCamera(1.5, true)
end
BlotCollisionCutSceneRelease = L0_0
function L0_0(A0_151)
  if isThinner1Broken == false then
    Bark(GetPlayer(), "Whoa! Look at that giant Bottle of Thinner!", 5, "Oswald", "Oswald")
  end
end
FocusOnThinner = L0_0
function L0_0(A0_152)
  CSLookAtEntity("CSCam1", "CSMarker1", 4)
  wait(3.9)
  GrabCamera("CSCam2", "CSMarker2", CAMERA_LERP_TRANSITION, 3)
  wait(2.9)
  GrabCamera("CSCam2", "CSMarker3", CAMERA_LERP_TRANSITION, 2)
  wait(2.5)
  CSEndLookAtEntity()
  print(" Release camera... mountain view ")
  SetCameraHintPitch(GetPlayer(), 0)
end
MountainViewStart = L0_0
function L0_0(A0_153)
  SetPropertyEntity(A0_153, "LookAtEntity", "CrashLandEndKnot")
  wait(0.25)
  SplineFollower_SetDisabled(A0_153, true)
  CSLookAtEntity("DiveCam", A0_153, 0)
  wait(1)
  TeleportToEntity("CrashLandStartKnot", A0_153)
  TeleportToEntity("CrashLandEndKnot", "ChaseStartKnot")
  SplineFollower_TeleportToKnot(A0_153, "CrashLandStartKnot")
  Print("BridgeChaseSetup: disabling spline follower")
  SetPropertyEntity(A0_153, "LookAtEntity", nil)
  AnimEvent(A0_153, EVENT_Special_0)
  wait(0.1)
  SplineFollower_SetDisabled(A0_153, false)
  isBridgeChaseCS = true
end
BridgeChaseSetup = L0_0
function L0_0(A0_154)
  Bark(GetPlayer(), "You made it Mickey!", 5, "Oswald", "Oswald")
  wait(1)
  StartFadeOut(1)
  print(" Set MJ_ShadowBlotResolution to 1")
  SetGlobal("MJ_ShadowBlotResolution", 1)
end
MickeyMadeItToOswald = L0_0
function L0_0(A0_155)
  isRespawningAtCheckpoint = true
  ResetCamera(1, true)
end
SetRespawnAtCheckpoint = L0_0
function L0_0(A0_156)
  SetConfigVariableString(A0_156, "BEH_ShadowBlotRanged_Default_CanShoot", "0")
  wait(1)
  isBlotClimbing = false
  BlotIdleAbort()
  SetReversed(A0_156, false)
  SetCameraHintPitch(GetPlayer(), 0)
  SetSecondaryCameraTarget("ShadowBlot")
  wait(1)
  ReleaseSecondaryCameraTarget("ShadowBlot")
  print(" Release secondary camera target... on death ")
  SetConfigVariableString(A0_156, "BEH_ShadowBlotRanged_Default_CanShoot", "1")
  BlotMoveToNextArena("ShadowBlot")
end
ReInitOnDeath = L0_0
function L0_0(A0_157, A1_158)
  if AnimEvent_Type(A1_158) == EVENT_Start_Death_Fall_Rescue then
    if isRespawningAtCheckpoint then
      isRespawningAtCheckpoint = false
      if platformMickeyIsOn > 1 then
        RestartFromSave(A0_157)
      else
        TeleportToEntity(GetPlayer(), "PlayerStartingPoint")
      end
    end
    SetConfigVariableString(A0_157, "BEH_ShadowBlotRanged_Default_CanShoot", "0")
    wait(1)
    SetCameraHintPitch(GetPlayer(), 0)
    isBlotClimbing = false
    BlotIdleAbort()
    SetReversed(A0_157, false)
    SetSecondaryCameraTarget("ShadowBlot")
    wait(1)
    ReleaseSecondaryCameraTarget("ShadowBlot")
    print(" Release secondary camera target... on revive ")
    SetConfigVariableString(A0_157, "BEH_ShadowBlotRanged_Default_CanShoot", "1")
    BlotMoveToNextArena("ShadowBlot")
  end
end
ReInitOnRevive = L0_0
function L0_0()
  wait(1)
  SetCameraHintPitch(GetPlayer(), 0)
  isBlotClimbing = false
  BlotIdleAbort()
  SetReversed(target, false)
  SetSecondaryCameraTarget("ShadowBlot")
  wait(1)
  ReleaseSecondaryCameraTarget("ShadowBlot")
  print(" Release secondary camera target... on respawn ")
  BlotMoveToNextArena("ShadowBlot")
end
RespawnAtCheckPoint = L0_0
