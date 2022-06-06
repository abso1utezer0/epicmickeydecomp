local L0_0, L1_1
function L0_0(A0_2)
  Print("Adding power spark.  Current count: " .. GetGlobal("PowerSparks"))
  SetGlobal(GetPrefabData(A0_2).SparkVariable, 1)
  FireSequence(GetRelativePrefabEntity(A0_2, ".ItemConversationMarker"), "MSS_GusPickedUpSpark")
  AudioPostEventOn(GetPlayer(), "Play_sfx_Pickup_PowerSpark")
end
AddItemSpark = L0_0
function L0_0(A0_3)
  Print("***************************** - Destroy item spark")
  if GetPrefabData(A0_3).SparkVariable == "None" then
  elseif GetGlobal(GetPrefabData(A0_3).SparkVariable) == 1 then
    Print("Destroying " .. GetGlobal(GetPrefabData(A0_3).SparkVariable))
    DestroyEntity(GetRelativePrefabEntity(A0_3, ".WorldPickupEffect"))
    DestroyEntity(GetRelativePrefabEntity(A0_3, ".WorldPickupAnim"))
    DestroyEntity(A0_3)
  end
end
DestroyItemSpark = L0_0
function L0_0(A0_4)
  Print("***************************** - Prefab_WorldItem_CP_Check")
  if GetPrefabData(A0_4).Checkpoint_Check == "True" then
    DestroyItemSpark(A0_4)
  end
end
Prefab_WorldItem_CP_Check = L0_0
