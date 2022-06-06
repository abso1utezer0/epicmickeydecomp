local L0_0, L1_1
function L0_0(A0_2, A1_3)
  if tonumber(A1_3) == 1 then
    Hook_DropPickup(A0_2, "ETicket_E", false)
  elseif tonumber(A1_3) == 3 then
    Hook_DropPickup(A0_2, "HealthSmall", false)
  elseif tonumber(A1_3) == 4 then
    Hook_DropPickup(A0_2, "Ammo_Thinner", false)
  end
end
Hook_DropSinglePickup = L0_0
function L0_0(A0_4)
  if math.random(3) == 1 then
    Hook_DropPickup(A0_4, "ETicket_E", false)
  elseif math.random(3) == 2 then
    Hook_DropPickup(A0_4, "HealthSmall", false)
  elseif math.random(3) == 3 then
    Hook_DropPickup(A0_4, "Ammo_Thinner", false)
  end
end
Hook_DropSingleRandomPickup = L0_0
function L0_0(A0_5)
  Hook_DropPickup(A0_5, "Ammo_Thinner", true)
  wait(0.06)
  Hook_DropPickup(A0_5, "HealthSmall", true)
end
Hook_DropSpinPickups = L0_0
function L0_0(A0_6)
  Hook_DropPickup(A0_6, "ETicket_E", true)
  wait(0.06)
  Hook_DropPickup(A0_6, "Ammo_Thinner", true)
  wait(0.06)
  Hook_DropPickup(A0_6, "HealthSmall", true)
end
Hook_DropManyPickups = L0_0
function L0_0(A0_7)
  Hook_DropPickup(A0_7, "ETicket_E", true)
  wait(0.06)
  Hook_DropPickup(A0_7, "HealthSmall", true)
  wait(0.06)
  Hook_DropPickup(A0_7, "Ammo_Thinner", true)
end
Hook_DropBoardPickups = L0_0
function L0_0(A0_8, A1_9, A2_10)
  local L3_11, L4_12, L5_13, L6_14, L7_15
  L3_11 = GetChildEntityByName
  L4_12 = A0_8
  L5_13 = "Gun_"
  L6_14 = A1_9
  L5_13 = L5_13 .. L6_14
  L3_11 = L3_11(L4_12, L5_13)
  L4_12 = GetPosition
  L5_13 = A0_8
  L4_12 = L4_12(L5_13)
  L5_13 = GetFacing
  L6_14 = A0_8
  L5_13 = L5_13(L6_14)
  L6_14 = vector4
  L7_15 = 0
  L6_14 = L6_14(L7_15, 0, 0)
  if A2_10 then
    L7_15 = math
    L7_15 = L7_15.random
    L7_15 = L7_15()
    L7_15 = 5 * L7_15
    L7_15 = -2 - L7_15
    L7_15 = L7_15 * L5_13.x
    L6_14.x = L7_15
    L7_15 = math
    L7_15 = L7_15.random
    L7_15 = L7_15()
    L7_15 = 5 * L7_15
    L7_15 = -2 - L7_15
    L7_15 = L7_15 * L5_13.z
    L6_14.z = L7_15
  else
    L7_15 = L5_13.x
    L7_15 = -3 * L7_15
    L6_14.x = L7_15
    L7_15 = L5_13.z
    L7_15 = -3 * L7_15
    L6_14.z = L7_15
  end
  L7_15 = L4_12 + L6_14
  Shooter_SetTargetPoint(L3_11, L7_15)
  Shooter_PrepareProjectiles(L3_11)
  Shooter_LaunchProjectiles(L3_11)
  Shooter_ClearTargetPoint(L3_11)
end
Hook_DropPickup = L0_0
function L0_0(A0_16)
  wait(5)
  AnimEvent(A0_16, "EVENT_TauntShakeHook")
  wait(3)
  while true do
    Hook_DropSinglePickup(A0_16, 1)
    wait(2)
    Hook_DropSinglePickup(A0_16, 3)
    wait(2)
    Hook_DropSinglePickup(A0_16, 4)
    wait(2)
    Hook_DropSingleRandomPickup(A0_16)
    wait(2)
    Hook_DropManyPickups(A0_16)
    wait(5)
  end
end
Hook_Loop = L0_0
