-- Fully reworked

local L0_0, L1_1

function Spatter_Kamikaze_Explode(var1)
  local invar1
  invar1 = GetPropertyEntity(var1, "Parent Entity")
  DialogBox(GetPlayer(), invar1)
  KnockbackExplode_Default(invar1)
  Damage(GetPlayer(), 1)
  wait(0.2)
  Kill(invar1)
  wait(0.1)
  DestroyEntity(var1)
end

function Spladoosh_Play_Spin_React(var1, var2)
  if StimulusEvent_HasStimulusType(var2, ST_SPIN) then
    AudioPostEventOn(var1, "Play_sfx_BltKmk_mvmt_HitReact")
  end
end

function Spatter_SetReward(var1)
  if GetHeroPercent(GetPlayer()) > 0.33 then
    SetPropertyInt(var1, "RewardSpawnIndex", 1, 0)
  elseif GetScrapperPercent(GetPlayer()) > 0.33 then
    SetPropertyInt(var1, "RewardSpawnIndex", 2, 0)
  else
    SetPropertyInt(var1, "RewardSpawnIndex", 0, 0)
  end
end

function SpatterRanged_SetReward(var1)
  wait(0.1)
  if math.random(1, 100) > 66 then
    SetPropertyInt(var1, "RewardSpawnIndex", 1, 0)
  else
    SetPropertyInt(var1, "RewardSpawnIndex", 2, 0)
  end
end

function SpatterOceanDeath()
  Wait(0.1)
  DisableMotion(_self())
  AIController_SetDisabled(_self(), true)
end

function SpatterOceanDeath_RemoveRewards()
  SetPropertyInt(_self(), "RewardDeathTypes", 0, 0)
  SetPropertyString(_self(), "Templates To Spawn", "", 0)
end

function SweeperLowerProjectileSplash(var1)
  local invar1
  invar1 = GetPosition(var1)
  invar1 = invar1 + vector4(0, -1.1, 0)
  SetTransformation(var1, invar1, vector4(0, 0, 0))
end
