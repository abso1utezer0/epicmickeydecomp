local L0_0, L1_1
function L0_0(A0_2)
  local L1_3
  L1_3 = GetPropertyEntity
  L1_3 = L1_3(A0_2, "Parent Entity")
  DialogBox(GetPlayer(), L1_3)
  KnockbackExplode_Default(L1_3)
  Damage(GetPlayer(), 1)
  wait(0.2)
  Kill(L1_3)
  wait(0.1)
  DestroyEntity(A0_2)
end
Spatter_Kamikaze_Explode = L0_0
function L0_0(A0_4, A1_5)
  if StimulusEvent_HasStimulusType(A1_5, ST_SPIN) then
    AudioPostEventOn(A0_4, "Play_sfx_BltKmk_mvmt_HitReact")
  end
end
Spladoosh_Play_Spin_React = L0_0
function L0_0(A0_6)
  if GetHeroPercent(GetPlayer()) > 0.33 then
    SetPropertyInt(A0_6, "RewardSpawnIndex", 1, 0)
  elseif GetScrapperPercent(GetPlayer()) > 0.33 then
    SetPropertyInt(A0_6, "RewardSpawnIndex", 2, 0)
  else
    SetPropertyInt(A0_6, "RewardSpawnIndex", 0, 0)
  end
end
Spatter_SetReward = L0_0
function L0_0(A0_7)
  local L1_8
  L1_8 = math
  L1_8 = L1_8.random
  L1_8 = L1_8(1, 100)
  wait(0.1)
  L1_8 = math.random(1, 100)
  if L1_8 > 66 then
    SetPropertyInt(A0_7, "RewardSpawnIndex", 1, 0)
  else
    SetPropertyInt(A0_7, "RewardSpawnIndex", 2, 0)
  end
end
SpatterRanged_SetReward = L0_0
function L0_0()
  Wait(0.1)
  DisableMotion(_self())
  AIController_SetDisabled(_self(), true)
end
SpatterOceanDeath = L0_0
function L0_0()
  SetPropertyInt(_self(), "RewardDeathTypes", 0, 0)
  SetPropertyString(_self(), "Templates To Spawn", "", 0)
end
SpatterOceanDeath_RemoveRewards = L0_0
function L0_0(A0_9)
  local L1_10
  L1_10 = GetPosition
  L1_10 = L1_10(A0_9)
  L1_10 = L1_10 + vector4(0, -1.1, 0)
  SetTransformation(A0_9, L1_10, vector4(0, 0, 0))
end
SweeperLowerProjectileSplash = L0_0
