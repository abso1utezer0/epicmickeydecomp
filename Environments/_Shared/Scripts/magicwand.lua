-- Fully reworked

function DisableSketchTarget(param1)
  param1 = _self()
  Print("myself  ", param1)
  if IsValidHandle(GetAutoTarget_Player()) then
    Disable(GetAutoTarget_Player())
    Print("DisableSketchTarget ", GetAutoTarget_Player())
    if global_entity_data_table[param1] == nil then
      global_entity_data_table[param1] = {}
    end
    global_entity_data_table[param1].Target = GetAutoTarget_Player()
  end
end

function EnableSketchTarget(param1)
  local var1, var2
  param1 = _self()
  var1 = global_entity_data_table[param1]
  if var1 == nil then
    global_entity_data_table[param1] = {}
    var2 = global_entity_data_table
    var1 = var2[param1]
  end
  var2 = var1.Target
  var1.Target = nil
  if IsValidHandle(var2) then
    Print("EnableSketchTarget ", var2)
    Enable(var2)
  end
end