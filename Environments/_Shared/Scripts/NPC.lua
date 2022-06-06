local L0_0, L1_1
function L0_0(A0_2)
  SetPropertyInt(A0_2, "Collision Layer", 7)
end
NPCPuddle_CollisionOff = L0_0
function L0_0(A0_3)
  SetPropertyInt(A0_3, "Collision Layer", 4)
end
NPCPuddle_CollisionOn = L0_0
function L0_0(A0_4)
  return AnimVarIntGet(A0_4, VAR_NPC_State)
end
GetNPCState = L0_0
function L0_0(A0_5)
  if GetPropertyFloat(A0_5, "CounterValue") < 0 then
  else
  end
  if GetPropertyFloat(A0_5, "CounterValue") / GetPropertyFloat(A0_5, "PositiveLimit") + GetHeroPercent(A0_5) - GetScrapperPercent(A0_5) < -1 then
  else
  end
  return 1
end
GetNormalizedNPCMood = L0_0
function L0_0(A0_6)
  return PaintThinnerCounter_GetStatus(A0_6) == PTCS_Thinner
end
IsNPCPuddled = L0_0
function L0_0(A0_7)
  if IsNPCPuddled(A0_7) then
    PaintThinnerCounterReset(A0_7)
  end
end
ForceUnpuddled = L0_0
function L0_0()
  if GetDistanceBetweenEntities(GetPlayer(), _self()) < 20 then
    FireSequence(_self(), "Generic_Pirate_Blunderbus")
  end
end
PirateRangedHeadShot = L0_0
