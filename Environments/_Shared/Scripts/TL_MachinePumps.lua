

local L0_0, L1_1

Pump_Machine1 = {}
Pump_Machine2 = {}
Pump_Machine3 = {}
Pump_Machine4 = {}
Pump_MachineArray_BUSY = 0
Pump_LastMachineUsed = "none"
Pump_LastUsedStatus = 0
Pump_FirstTimeUsed = false

function TL_Pump_MachineArray(var1, var2, var3, var4)
  local invar1, invar2, invar3, invar4

  if Pump_MachineArray_BUSY == 0 then
    invar1 = 1
    Pump_MachineArray_BUSY = invar1
    invar1 = Pump_Machine4
    if var2 == "M1" then
      invar1 = Pump_Machine1
    elseif var2 == "M2" then
      invar1 = Pump_Machine2
    elseif var2 == "M3" then
      invar1 = Pump_Machine3
    end
    invar2 = Pump_LastMachineUsed
    if invar2 == var2 then
    else
      invar2 = Pump_FirstTimeUsed
      if invar2 == false then
        invar2 = true
        Pump_FirstTimeUsed = invar2
      else
        invar2 = Pump_Machine4
        invar3 = GetGlobal
        invar3 = invar3(invar4)
        if invar4 == "M1" then
          invar2 = Pump_Machine1
          invar3 = invar4
        elseif invar4 == "M2" then
          invar2 = Pump_Machine2
          invar3 = invar4
        elseif invar4 == "M3" then
          invar2 = Pump_Machine3
          invar3 = invar4
        end
        if invar3 > 0 then
        else
          invar4(GetPlayer(), "NO FIRE", 2)
          invar2 = invar4
          Pump_TwoInMotion = invar4
          Pump_InMotion = invar4
          Pump_ResetMotion = invar4
          Pump_ResetAll = invar4
          invar4(SetPropertyFloat, "SKs_" .. var2, "BranchPathChance", 1)
          if invar4 == 0 then
          elseif invar4 > -3 then
            if invar4 == "Up" then
              invar4(var2 .. "_Paint")
            end
            invar4(var2 .. "_Paint", 3)
            Pump_ResetMotion = invar4
          elseif invar4 < 3 then
            if invar4 == "Down" then
              invar4(var2 .. "_Thinner")
            end
            invar4(var2 .. "_Thinner", 3)
            Pump_ResetMotion = invar4
          end
          Pump_PaintDirection = invar4
          Pump_ThinnerDirection = invar4
        end
      end
    end
    Pump_LastMachineUsed = var2
    invar2 = 0
    invar3 = false
    if invar4 > 2 then
      for _FORV_10_ = 1, 3 do
        if invar1[_FORV_10_] == "Paint" then
          invar2 = invar2 + 1
        elseif invar1[_FORV_10_] == "Thinner" then
          invar2 = invar2 - 1
        end
      end
      invar4(invar1)
      if invar2 == 3 then
      elseif invar2 == -3 then
      elseif var3 == "Paint" then
        invar1[3] = var3
      else
        invar1[1] = var3
      end
      invar3 = true
    else
      invar4(invar1, var3)
    end
    Pump_LastUsedStatus = invar2
    if invar2 == -3 then
    elseif invar2 == 3 then
    else
      if var3 == "Thinner" then
      end
      if invar3 == true then
        Pump_TwoInMotion = true
        if Pump_PaintDirection == "Up" then
          Reverse(var2 .. "_" .. invar4)
          if var3 == "Paint" then
            Pump_PaintDirection = "Up"
            Pump_ThinnerDirection = "Down"
          else
            Pump_PaintDirection = "Down"
            Pump_ThinnerDirection = "Up"
          end
        end
        SetSpeed(var2 .. "_" .. invar4, 3)
      end
      if Pump_ThinnerDirection == "Down" then
        Reverse(var2 .. "_" .. var3)
      end
      SetSpeed(var2 .. "_" .. var3, 3)
      wait(0.1)
      Pump_InMotion = 1
    end
    invar4(1.5)
    Pump_MachineArray_BUSY = invar4
  end
end

Pump_PaintDirection = "Up"
Pump_ThinnerDirection = "Up"
Pump_TwoInMotion = false
Pump_InMotion = 0
Pump_ResetMotion = 0
Pump_ResetAll = false

function TL_Pump_StopMotion(var1)
  if Pump_ResetAll == false and Pump_InMotion == 1 then
    SetSpeed(var1, 0)
    if Pump_TwoInMotion == true then
      Pump_TwoInMotion = false
    else
      Pump_InMotion = 0
    end
  end
end

function TL_Pump_ResetFunction(var1)
  if Pump_ResetAll == true then
    SetSpeed(var1, 0)
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
