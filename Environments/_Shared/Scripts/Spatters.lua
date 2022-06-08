-- Fully reworked

function Spatter_Kamikaze_Explode(param1)
  local var1
  var1 = GetPropertyEntity(param1, "Parent Entity")
  DialogBox(GetPlayer(), var1)
  KnockbackExplode_Default(var1)
  Damage(GetPlayer(), 1)
  wait(0.2)
  Kill(var1)
  wait(0.1)
  DestroyEntity(param1)
end

function Spladoosh_Play_Spin_React(param1, param2)
  if StimulusEvent_HasStimulusType(param2, ST_SPIN) then
    AudioPostEventOn(param1, "Play_sfx_BltKmk_mvmt_HitReact")
  end
end

function Spatter_SetReward(param1)
  if GetHeroPercent(GetPlayer()) > 0.33 then
    SetPropertyInt(param1, "RewardSpawnIndex", 1, 0)
  elseif GetScrapperPercent(GetPlayer()) > 0.33 then
    SetPropertyInt(param1, "RewardSpawnIndex", 2, 0)
  else
    SetPropertyInt(param1, "RewardSpawnIndex", 0, 0)
  end
end

function SpatterRanged_SetReward(param1)
  wait(0.1)
  if math.random(1, 100) > 66 then
    SetPropertyInt(param1, "RewardSpawnIndex", 1, 0)
  else
    SetPropertyInt(param1, "RewardSpawnIndex", 2, 0)
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

function SweeperLowerProjectileSplash(param1)
  local var1
  var1 = GetPosition(param1)
  var1 = var1 + vector4(0, -1.1, 0)
  SetTransformation(param1, var1, vector4(0, 0, 0))
end
