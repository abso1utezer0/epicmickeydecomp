local L0_0, L1_1
function L0_0(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10
  L1_3 = GetPrefabData
  L2_4 = A0_2
  L1_3 = L1_3(L2_4)
  L2_4 = GetRelativePrefabEntity
  L3_5 = A0_2
  L2_4 = L2_4(L3_5, L4_6)
  L3_5 = GetRelativePrefabEntity
  L3_5 = L3_5(L4_6, L5_7)
  for L7_9, L8_10 in L4_6(L5_7) do
    SetPropertyInt(L2_4, "Index To Spawn", L8_10, 0)
    if 0 < #ForceSpawn(L2_4, 1) then
      SetPropertyString(ForceSpawn(L2_4, 1)[1], "Bone Attach Name", L7_9, 0)
      SetParentEntity(ForceSpawn(L2_4, 1)[1], L3_5)
      L1_3.Guardians[#L1_3.Guardians + 1] = ForceSpawn(L2_4, 1)[1]
    end
    Wait(0)
  end
end
GuardianPrefab_PopulateGuardians = L0_0
function L0_0(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17
  L1_12 = GetPrefabData
  L2_13 = A0_11
  L1_12 = L1_12(L2_13)
  L2_13 = GetRelativePrefabEntity
  L3_14 = A0_11
  L4_15 = ".OutParentKnot"
  L2_13 = L2_13(L3_14, L4_15)
  L3_14 = L1_12.Guardians
  L3_14 = #L3_14
  L4_15 = GetRelativePrefabEntity
  L5_16 = A0_11
  L6_17 = ".MickeyHead"
  L4_15 = L4_15(L5_16, L6_17)
  if L3_14 > 0 then
    L5_16 = L1_12.Guardians
    L5_16 = L5_16[L3_14]
    if L5_16 ~= nil then
      L6_17 = IsValidHandle
      L6_17 = L6_17(L5_16)
      if L6_17 then
        L6_17 = GetPropertyString
        L6_17 = L6_17(L5_16, "Bone Attach Name", 0)
        SetPropertyString(L2_13, "Bone Attach Name", L6_17, 0)
        SetParentEntity(L2_13, L4_15)
        wait(0.0666)
        ClearParent(L5_16)
        SplineFollower_SetDisabled(L5_16, false)
        SplineFollower_TeleportToKnot(L5_16, L2_13)
      end
    end
    L6_17 = table
    L6_17 = L6_17.remove
    L6_17(L1_12.Guardians)
  end
end
GuardianPrefab_StartNextGuardian = L0_0
function L0_0(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24
  L1_19 = GetPrefabData
  L1_19 = L1_19(L2_20)
  for L5_23, L6_24 in L2_20(L3_21) do
    DestroyEntity(L6_24)
  end
  L1_19.Guardians = L2_20
end
GuardianPrefab_KillGuardians = L0_0
function L0_0(A0_25, A1_26)
  local L2_27, L3_28, L4_29, L5_30
  L2_27 = GetPrefabData
  L3_28 = A0_25
  L2_27 = L2_27(L3_28)
  L3_28 = GetRelativePrefabEntity
  L4_29 = A0_25
  L5_30 = ".InParentKnot"
  L3_28 = L3_28(L4_29, L5_30)
  L4_29 = GetRelativePrefabEntity
  L5_30 = A0_25
  L4_29 = L4_29(L5_30, ".MickeyHead")
  L5_30 = GetPropertyString
  L5_30 = L5_30(A1_26, "Bone Attach Name", 0)
  SetPropertyString(L3_28, "Bone Attach Name", L5_30, 0)
  SetParentEntity(L3_28, L4_29)
end
GuardianPrefab_GuardianEnter = L0_0
function L0_0(A0_31, A1_32)
  GetPrefabData(A0_31).Guardians[#GetPrefabData(A0_31).Guardians + 1] = A1_32
  SplineFollower_SetDisabled(A1_32, true)
  SetParentEntity(A1_32, GetRelativePrefabEntity(A0_31, ".MickeyHead"))
end
GuardianPrefab_GuardianStop = L0_0
