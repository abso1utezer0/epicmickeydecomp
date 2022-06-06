local L0_0, L1_1
function L0_0(A0_2)
  local L1_3
  L1_3 = _self
  L1_3 = L1_3()
  A0_2 = L1_3
  L1_3 = Print
  L1_3("myself  ", A0_2)
  L1_3 = GetAutoTarget_Player
  L1_3 = L1_3()
  if IsValidHandle(L1_3) then
    Disable(L1_3)
    Print("DisableSketchTarget ", L1_3)
    if global_entity_data_table[A0_2] == nil then
      global_entity_data_table[A0_2] = {}
    end
    global_entity_data_table[A0_2].Target = L1_3
  end
end
DisableSketchTarget = L0_0
function L0_0(A0_4)
  local L1_5, L2_6
  L1_5 = _self
  L1_5 = L1_5()
  A0_4 = L1_5
  L1_5 = global_entity_data_table
  L1_5 = L1_5[A0_4]
  if L1_5 == nil then
    L2_6 = global_entity_data_table
    L2_6[A0_4] = {}
    L2_6 = global_entity_data_table
    L1_5 = L2_6[A0_4]
  end
  L2_6 = L1_5.Target
  L1_5.Target = nil
  if IsValidHandle(L2_6) then
    Print("EnableSketchTarget ", L2_6)
    Enable(L2_6)
  end
end
EnableSketchTarget = L0_0
