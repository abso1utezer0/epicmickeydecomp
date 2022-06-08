

local L0_0, L1_1

Pump_Machine1 = {}
Pump_Machine2 = {}
Pump_Machine3 = {}
Pump_Machine4 = {}
Pump_MachineArray_BUSY = 0
Pump_LastMachineUsed = "none"
Pump_LastUsedStatus = 0
Pump_FirstTimeUsed = false

function TL_Pump_MachineArray(param1, param2, param3, param4)
  local var1, var2, var3, var4

  if Pump_MachineArray_BUSY == 0 then
    var1 = 1
    Pump_MachineArray_BUSY = var1
    var1 = Pump_Machine4
    if param2 == "M1" then
      var1 = Pump_Machine1
    elseif param2 == "M2" then
      var1 = Pump_Machine2
    elseif param2 == "M3" then
      var1 = Pump_Machine3
    end
    var2 = Pump_LastMachineUsed
    if var2 == param2 then
    else
      var2 = Pump_FirstTimeUsed
      if var2 == false then
        var2 = true
        Pump_FirstTimeUsed = var2
      else
        var2 = Pump_Machine4
        var3 = GetGlobal
        var3 = var3(var4)
        if var4 == "M1" then
          var2 = Pump_Machine1
          var3 = var4
        elseif var4 == "M2" then
          var2 = Pump_Machine2
          var3 = var4
        elseif var4 == "M3" then
          var2 = Pump_Machine3
          var3 = var4
        end
        if var3 > 0 then
        else
          var4(GetPlayer(), "NO FIRE", 2)
          var2 = var4
          Pump_TwoInMotion = var4
          Pump_InMotion = var4
          Pump_ResetMotion = var4
          Pump_ResetAll = var4
          var4(SetPropertyFloat, "SKs_" .. param2, "BranchPathChance", 1)
          if var4 == 0 then
          elseif var4 > -3 then
            if var4 == "Up" then
              var4(param2 .. "_Paint")
            end
            var4(param2 .. "_Paint", 3)
            Pump_ResetMotion = var4
          elseif var4 < 3 then
            if var4 == "Down" then
              var4(param2 .. "_Thinner")
            end
            var4(param2 .. "_Thinner", 3)
            Pump_ResetMotion = var4
          end
          Pump_PaintDirection = var4
          Pump_ThinnerDirection = var4
        end
      end
    end
    Pump_LastMachineUsed = param2
    var2 = 0
    var3 = false
    if var4 > 2 then
      for _FORV_10_ = 1, 3 do
        if var1[_FORV_10_] == "Paint" then
          var2 = var2 + 1
        elseif var1[_FORV_10_] == "Thinner" then
          var2 = var2 - 1
        end
      end
      var4(var1)
      if var2 == 3 then
      elseif var2 == -3 then
      elseif param3 == "Paint" then
        var1[3] = param3
      else
        var1[1] = param3
      end
      var3 = true
    else
      var4(var1, param3)
    end
    Pump_LastUsedStatus = var2
    if var2 == -3 then
    elseif var2 == 3 then
    else
      if param3 == "Thinner" then
      end
      if var3 == true then
        Pump_TwoInMotion = true
        if Pump_PaintDirection == "Up" then
          Reverse(param2 .. "_" .. var4)
          if param3 == "Paint" then
            Pump_PaintDirection = "Up"
            Pump_ThinnerDirection = "Down"
          else
            Pump_PaintDirection = "Down"
            Pump_ThinnerDirection = "Up"
          end
        end
        SetSpeed(param2 .. "_" .. var4, 3)
      end
      if Pump_ThinnerDirection == "Down" then
        Reverse(param2 .. "_" .. param3)
      end
      SetSpeed(param2 .. "_" .. param3, 3)
      wait(0.1)
      Pump_InMotion = 1
    end
    var4(1.5)
    Pump_MachineArray_BUSY = var4
  end
end

Pump_PaintDirection = "Up"
Pump_ThinnerDirection = "Up"
Pump_TwoInMotion = false
Pump_InMotion = 0
Pump_ResetMotion = 0
Pump_ResetAll = false

function TL_Pump_StopMotion(param1)
  if Pump_ResetAll == false and Pump_InMotion == 1 then
    SetSpeed(param1, 0)
    if Pump_TwoInMotion == true then
      Pump_TwoInMotion = false
    else
      Pump_InMotion = 0
    end
  end
end

function TL_Pump_ResetFunction(param1)
  if Pump_ResetAll == true then
    SetSpeed(param1, 0)
    ForEachEntityInGroup(SetPropertyFloat, "SKs_" .. Machine, "BranchPathChance", 0)
    if Pump_ResetMotion == 1 then
      Pump_ResetAll = false
      Pump_ResetMotion = 0
    elseif Pump_ResetMotion == 2 then
      Pump_ResetMotion = 1
    end
  end
end

function TL_Pump_FilledFunction(A0_12, A1_13, A2_14, A3_15)
  local L4_16, L5_17, L6_18, L7_19
  L7_19 = "_Paint"
  L4_16(L5_17)
  L7_19 = "_Thinner"
  L4_16(L5_17)
  if A1_13 == "Paint" then
    L4_16(L5_17, L6_18)
    L4_16(L5_17, L6_18)
    L4_16(L5_17)
    L4_16(L5_17, L6_18)
    L4_16()
    L7_19 = CAMERA_LERP_TRANSITION
    L4_16(L5_17, L6_18, L7_19, 0)
    L4_16()
    L4_16(L5_17, L6_18)
    L4_16(L5_17)
    L4_16(L5_17, L6_18)
    L4_16()
  elseif A1_13 == "Thinner" then
    L4_16(L5_17, L6_18)
    L4_16(L5_17, L6_18)
    L4_16(L5_17)
    L4_16()
    L4_16(L5_17)
    L4_16(L5_17, L6_18)
  end
  for L7_19 = 1, 4 do
    if 0 < GetGlobal("Pump_Machine" .. L7_19) then
    else
      break
    end
    if L7_19 == 4 then
      FireUser2(A0_12)
    end
  end
  Pump_TwoInMotion = L4_16
  Pump_InMotion = L4_16
end

function TL_Restore_RocketRide1()
  local L0_20, L1_21
end
