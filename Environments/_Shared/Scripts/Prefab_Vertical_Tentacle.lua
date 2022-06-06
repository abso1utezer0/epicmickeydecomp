local L0_0, L1_1
L0_0 = ""
FollowingBoil = L0_0
L0_0 = ""
EndFunction = L0_0
function L0_0(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7
  L1_3 = GetPrefabData
  L1_3 = L1_3(L2_4)
  L2_4(L3_5)
  L2_4(L3_5, L4_6)
  L5_7 = "Sound_Marker_V_Tentacle_Controller"
  L5_7 = L3_5(L4_6, L5_7)
  L2_4(L3_5, L4_6, L5_7, L3_5(L4_6, L5_7))
  L5_7 = ".Tentacle_Sore 1"
  L2_4(L3_5, L4_6)
  L5_7 = ".Tentacle_Sore 1"
  L5_7 = false
  L2_4(L3_5, L4_6, L5_7)
  for L5_7 = 2, L1_3.NumBoils do
    SetPropertyBool(GetRelativePrefabEntity(A0_2, ".Tentacle_Sore " .. L5_7), "ForceInvulnerable", true)
  end
  L2_4(L3_5)
end
Prefab_Vertical_Tentacle_AlwaysSetup = L0_0
function L0_0(A0_8, A1_9)
  Print("********TENTACLE HIT**********")
  GetPrefabData(A0_8).BoilCount = GetPrefabData(A0_8).BoilCount + 1
  Print("Boils Down: " .. GetPrefabData(A0_8).BoilCount)
  Print("End Function: " .. GetPrefabData(A0_8).EndFunction)
  EndFunction = GetPrefabData(A0_8).EndFunction
  AnimGBSequence(A0_8, "Pop")
  wait(2.25)
  if GetPrefabData(A0_8).BoilCount == GetPrefabData(A0_8).NumBoils or A1_9 == "Last" then
    Print("**************LAST BOIL POSSIBLE POPPED--DESTROYING TENTACLE AND RETURNING**************")
    if EndFunction == "None" then
    else
      Print("*********VERTICAL TENTACLE EXIT FUNCTION CALLED*********")
      FireThread(_G[EndFunction], A0_8)
    end
    Prefab_Vertical_Tentacle_Destroy(A0_8)
    DestroyEntity(A0_8)
    return
  end
  Print("**********Getting Next Boil*************")
  FollowingBoil = GetRelativePrefabEntity(A0_8, ".Tentacle_Sore " .. A1_9)
  Print("**********Setting To Grow***************")
  AnimGBSequence(FollowingBoil, "Grow")
  Print("**********Forcing Vuln******************")
  SetPropertyBool(FollowingBoil, "ForceInvulnerable", false)
  Print("**********Destroying Target*************")
end
Prefab_Vertical_Tentacle_Boil_Damage = L0_0
function L0_0(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16
  L1_11 = GetPrefabData
  L2_12 = A0_10
  L1_11 = L1_11(L2_12)
  L2_12 = Print
  L2_12(L3_13)
  L2_12 = GetRelativePrefabEntity
  L2_12 = L2_12(L3_13, L4_14)
  L6_16 = ".HUB_Vertical_Tentacle"
  L3_13(L4_14, L5_15)
  L3_13(L4_14)
  for L6_16 = 1, L1_11.NumBoils do
    DestroyEntity(GetRelativePrefabEntity(A0_10, ".Tentacle_Sore " .. L6_16))
  end
  L6_16 = "Sound_Marker_V_Tentacle_Controller"
  L6_16 = L4_14(L5_15, L6_16)
  L3_13(L4_14, L5_15, L6_16, L4_14(L5_15, L6_16))
  L6_16 = "Sound_Marker_V_Tentacle_Controller"
  L3_13(L4_14, L5_15)
  L3_13(L4_14)
  L3_13(L4_14)
end
Prefab_Vertical_Tentacle_Destroy = L0_0
function L0_0(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22
  L1_18 = GetPrefabData
  L1_18 = L1_18(L2_19)
  L2_19(L3_20)
  for L5_22 = 1, L1_18.NumBoils do
    DestroyEntity(GetRelativePrefabEntity(A0_17, ".Tentacle_Sore " .. L5_22))
  end
  L5_22 = "Sound_Marker_V_Tentacle_Controller"
  L5_22 = L3_20(L4_21, L5_22)
  L2_19(L3_20, L4_21, L5_22, L3_20(L4_21, L5_22))
  L2_19(L3_20)
end
Prefab_Vertical_Tentacle_ForceDestroy = L0_0
