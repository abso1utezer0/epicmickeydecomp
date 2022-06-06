local L0_0, L1_1
function L0_0(A0_2)
  ForceSpawn(GetRelativePrefabEntity(A0_2, ".RippleFXSpawner"), 1)
  AudioPostEventOn(GetRelativePrefabEntity(A0_2, ".Sound_Marker_Boat_R"), "Play_sfx_land_on_boat_R")
  AudioPostEventOn(GetRelativePrefabEntity(A0_2, ".Sound_Marker_Boat_L"), "Play_sfx_land_on_boat_L")
end
Prefab_OverturnedBoat_Start = L0_0
function L0_0(A0_3)
  AnimGBSequence(GetRelativePrefabEntity(A0_3, ".OverturnedBoat"), "JumpOff")
  AudioPostEventOn(GetRelativePrefabEntity(A0_3, ".Sound_Marker_Boat_R"), "Stop_sfx_land_on_boat_R")
  AudioPostEventOn(GetRelativePrefabEntity(A0_3, ".Sound_Marker_Boat_L"), "Stop_sfx_land_on_boat_L")
  Wait(1.267)
  AnimGBSequence(GetRelativePrefabEntity(A0_3, ".OverturnedBoat"), "Rest")
end
Prefab_OverturnedBoat_Stop = L0_0
