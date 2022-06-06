local L0_0, L1_1
function L0_0(A0_2, A1_3)
  if DeathEvent_DeathType(A1_3) == 6 then
    return
  end
  if IsValidHandle(A0_2) then
    ForceSpawn(A0_2, 1)
  end
end
TurnIntoBunnyBall = L0_0
function L0_0(A0_4)
  if IsValidHandle(A0_4) then
    ForceSpawn(A0_4, 1)
    DestroyEntity(A0_4)
  end
end
TurnIntoBunny = L0_0
function L0_0()
  if GetGlobal("BunnyHasAttached") == 0 then
    SetGlobal("BunnyHasAttached", 1)
  end
end
FirstTimeBunnyAttach = L0_0
function L0_0(A0_5)
  Wait(0.033)
  DestroyEntity(A0_5)
end
BunnyChildThinnerImmunity = L0_0
