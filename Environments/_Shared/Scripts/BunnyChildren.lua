-- Fully reworked

function TurnIntoBunnyBall(var1, var2)
  if DeathEvent_DeathType(var2) == 6 then
    return
  end
  if IsValidHandle(var1) then
    ForceSpawn(var1, 1)
  end
end

function TurnIntoBunny(var1)
  if IsValidHandle(var1) then
    ForceSpawn(var1, 1)
    DestroyEntity(var1)
  end
end

function FirstTimeBunnyAttach()
  if GetGlobal("BunnyHasAttached") == 0 then
    SetGlobal("BunnyHasAttached", 1)
  end
end

function BunnyChildThinnerImmunity(var1)
  Wait(0.033)
  DestroyEntity(var1)
end