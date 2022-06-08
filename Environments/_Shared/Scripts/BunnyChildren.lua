-- Fully reworked

function TurnIntoBunnyBall(param1, param2)
  if DeathEvent_DeathType(param2) == 6 then
    return
  end
  if IsValidHandle(param1) then
    ForceSpawn(param1, 1)
  end
end

function TurnIntoBunny(param1)
  if IsValidHandle(param1) then
    ForceSpawn(param1, 1)
    DestroyEntity(param1)
  end
end

function FirstTimeBunnyAttach()
  if GetGlobal("BunnyHasAttached") == 0 then
    SetGlobal("BunnyHasAttached", 1)
  end
end

function BunnyChildThinnerImmunity(param1)
  Wait(0.033)
  DestroyEntity(param1)
end