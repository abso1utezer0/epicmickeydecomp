local L0_0, L1_1
function L0_0()
  wait(1)
  StreamZones(nil, "stream_4")
end
PotW_ZoneEF_Load = L0_0
function L0_0(A0_2, A1_3)
  SplineFollower_SetDisabled(A0_2, true)
  wait(0.5)
  SetParent(A0_2, A1_3)
end
Cave2ThinnerMagic = L0_0
function L0_0()
  Enable_SpatterSpawner("potw_zoned_ai.SpatterSpawner 01", "potw_zoned_ai.Spawner_RangedSpatter1")
  ForEachEntityInGroup(Enable, "potw_zoned_ai.Spawners_Spatters")
end
PotW_Cave_EnableAI = L0_0
