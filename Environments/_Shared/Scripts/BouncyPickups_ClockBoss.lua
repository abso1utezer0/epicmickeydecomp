local L1_0
function L1_0(A0_1, A1_2, A2_3)
  local L3_4, L4_5, L5_6
  L3_4 = GetChildEntityByName
  L4_5 = A0_1
  L5_6 = "CT_Gun_"
  L5_6 = L5_6 .. A1_2
  L3_4 = L3_4(L4_5, L5_6)
  L4_5 = GetPosition
  L5_6 = L3_4
  L4_5 = L4_5(L5_6)
  L5_6 = vector4
  L5_6 = L5_6(0, -2 * math.random(), L4_5.z)
  if A0_1 == "BouncyPickupPositionGun2" then
    if A2_3.x > 13.4 then
      L5_6.x = A2_3.x - 5 - 2 * math.random()
    else
      L5_6.x = A2_3.x + 5 + 2 * math.random()
    end
    if L5_6.x > L4_5.x then
      L5_6.x = L5_6.x - 1
    end
  elseif A0_1 == "BouncyPickupPositionGun1" then
    if A2_3.x < -12.5 then
      L5_6.x = A2_3.x + 5 + 2 * math.random()
    else
      L5_6.x = A2_3.x - 5 - 2 * math.random()
    end
    if L5_6.x < L4_5.x then
      L5_6.x = L5_6.x + 1
    end
  end
  Shooter_SetTargetPoint(L3_4, L5_6)
  Shooter_PrepareProjectiles(L3_4)
  Shooter_LaunchProjectiles(L3_4)
  Shooter_ClearTargetPoint(L3_4)
end
ClockBoss_DropPickup = L1_0
