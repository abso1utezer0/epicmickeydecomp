local L0_0, L1_1
function L0_0(A0_2)
  SetSplineFollowerInitialSpeed(GetRelativePrefabEntity(A0_2, ".Marker(SplineFollower) 01"), 6)
  Enable(GetRelativePrefabEntity(A0_2, ".TriggerDamageVolume 01"))
  StartEmitters(GetRelativePrefabEntity(A0_2, ".FX_stormBlot_shockWave 01"))
  Unhide(GetRelativePrefabEntity(A0_2, ".FX_stormBlot_shockWave 01"))
end
Prefab_StormBlotSlimeSpawner = L0_0
function L0_0(A0_3)
  SetSplineFollowerInitialSpeed(GetRelativePrefabEntity(A0_3, ".Marker(SplineFollower) 01"), 0)
  SplineFollower_TeleportToKnot(GetRelativePrefabEntity(A0_3, ".Marker(SplineFollower) 01"), GetRelativePrefabEntity(A0_3, ".SplineKnot 01"))
  Disable(GetRelativePrefabEntity(A0_3, ".TriggerDamageVolume 01"))
  StopEmitters(GetRelativePrefabEntity(A0_3, ".FX_stormBlot_shockWave 01"))
  Hide(GetRelativePrefabEntity(A0_3, ".FX_stormBlot_shockWave 01"))
end
Prefab_StormBlotSlimeSpawnerReset = L0_0
