-- Fully reworked

function NPCPuddle_CollisionOff(param1)
  SetPropertyInt(param1, "Collision Layer", 7)
end

function NPCPuddle_CollisionOn(param1)
  SetPropertyInt(param1, "Collision Layer", 4)
end

function GetNPCState(param1)
  return AnimVarIntGet(param1, VAR_NPC_State)
end

function GetNormalizedNPCMood(param1)
  if GetPropertyFloat(param1, "CounterValue") < 0 then
  else
  end
  if GetPropertyFloat(param1, "CounterValue") / GetPropertyFloat(param1, "PositiveLimit") + GetHeroPercent(param1) - GetScrapperPercent(param1) < -1 then
  else
  end
  return 1
end

function IsNPCPuddled(param1)
  return PaintThinnerCounter_GetStatus(param1) == PTCS_Thinner
end

function ForceUnpuddled(param1)
  if IsNPCPuddled(param1) then
    PaintThinnerCounterReset(param1)
  end
end

function PirateRangedHeadShot()
  if GetDistanceBetweenEntities(GetPlayer(), _self()) < 20 then
    FireSequence(_self(), "Generic_Pirate_Blunderbus")
  end
end