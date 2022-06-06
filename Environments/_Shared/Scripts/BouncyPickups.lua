local L0_0, L1_1
function L0_0(A0_2)
  local L1_3, L2_4
  L1_3 = wait
  L2_4 = 0.05
  L1_3(L2_4)
  L1_3 = vector4
  L2_4 = 0
  L1_3 = L1_3(L2_4, 0, 1)
  L2_4 = SetFacing
  L2_4(A0_2, L1_3)
  L2_4 = IsValidHandle
  L2_4 = L2_4(A0_2)
  if L2_4 then
    L2_4 = GetChildEntityByIndex
    L2_4 = L2_4(A0_2, 0)
    if IsValidHandle(L2_4) then
      SetPropertyString(L2_4, "Bone Attach Name", "Eticket_attach", 0)
    end
  end
end
BP_OrientBall = L0_0
function L0_0(A0_5)
  if IsValidHandle(A0_5) then
    ForceSpawn(A0_5, 1)
  end
end
BP_SpawnPickup = L0_0
function L0_0(A0_6)
  local L1_7, L2_8
  L1_7 = IsValidHandle
  L2_8 = A0_6
  L1_7 = L1_7(L2_8)
  if L1_7 then
    L1_7 = GetPropertyEntity
    L2_8 = A0_6
    L1_7 = L1_7(L2_8, "Parent Entity", 0)
    L2_8 = IsValidHandle
    L2_8 = L2_8(L1_7)
    if L2_8 then
      L2_8 = GetPropertyEntity
      L2_8 = L2_8(L1_7, "Parent Entity", 0)
      if IsValidHandle(L2_8) then
        ClearParent(A0_6)
        Kill(L1_7)
        Kill(L2_8)
        return
      end
    end
  end
end
BP_UnparentAndKillBall = L0_0
