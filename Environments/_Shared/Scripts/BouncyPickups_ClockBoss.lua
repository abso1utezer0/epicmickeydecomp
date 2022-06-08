-- Fully reworked

function ClockBoss_DropPickup(param1, param2, param3)
  local var1 = vector4(0, -2 * math.random(), GetPosition(GetChildEntityByName(param1, "CT_Gun_" .. param2)).z)
  if param1 == "BouncyPickupPositionGun2" then
    if param3.x > 13.4 then
      var1.x = var1.x - 5 - 2 * math.random()
    else
      var1.x = param3.x + 5 + 2 * math.random()
    end
    if var1.x > var1.x then
      var1.x = var1.x - 1
    end
  elseif param1 == "BouncyPickupPositionGun1" then
    if param3.x < -12.5 then
      var1.x = param3.x + 5 + 2 * math.random()
    else
      var1.x = param3.x - 5 - 2 * math.random()
    end
    if var1.x < var1.x then
      var1.x = var1.x + 1
    end
  end
  Shooter_SetTargetPoint(GetChildEntityByName(param1, "CT_Gun_" .. param2), var1)
  Shooter_PrepareProjectiles(GetChildEntityByName(param1, "CT_Gun_" .. param2))
  Shooter_LaunchProjectiles(GetChildEntityByName(param1, "CT_Gun_" .. param2))
  Shooter_ClearTargetPoint(GetChildEntityByName(param1, "CT_Gun_" .. param2))
end