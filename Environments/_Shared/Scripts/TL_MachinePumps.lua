local L0_0, L1_1
L0_0 = {}
Pump_Machine1 = L0_0
L0_0 = {}
Pump_Machine2 = L0_0
L0_0 = {}
Pump_Machine3 = L0_0
L0_0 = {}
Pump_Machine4 = L0_0
L0_0 = 0
Pump_MachineArray_BUSY = L0_0
L0_0 = "none"
Pump_LastMachineUsed = L0_0
L0_0 = 0
Pump_LastUsedStatus = L0_0
L0_0 = false
Pump_FirstTimeUsed = L0_0
function L0_0(A0_2, A1_3, A2_4, A3_5)
  local L4_6, L5_7, L6_8, L7_9
  L4_6 = Pump_MachineArray_BUSY
  if L4_6 == 0 then
    L4_6 = 1
    Pump_MachineArray_BUSY = L4_6
    L4_6 = Pump_Machine4
    if A1_3 == "M1" then
      L4_6 = Pump_Machine1
    elseif A1_3 == "M2" then
      L4_6 = Pump_Machine2
    elseif A1_3 == "M3" then
      L4_6 = Pump_Machine3
    end
    L5_7 = Pump_LastMachineUsed
    if L5_7 == A1_3 then
    else
      L5_7 = Pump_FirstTimeUsed
      if L5_7 == false then
        L5_7 = true
        Pump_FirstTimeUsed = L5_7
      else
        L5_7 = Pump_Machine4
        L6_8 = GetGlobal
        L6_8 = L6_8(L7_9)
        if L7_9 == "M1" then
          L5_7 = Pump_Machine1
          L6_8 = L7_9
        elseif L7_9 == "M2" then
          L5_7 = Pump_Machine2
          L6_8 = L7_9
        elseif L7_9 == "M3" then
          L5_7 = Pump_Machine3
          L6_8 = L7_9
        end
        if L6_8 > 0 then
        else
          L7_9(GetPlayer(), "NO FIRE", 2)
          L5_7 = L7_9
          Pump_TwoInMotion = L7_9
          Pump_InMotion = L7_9
          Pump_ResetMotion = L7_9
          Pump_ResetAll = L7_9
          L7_9(SetPropertyFloat, "SKs_" .. A1_3, "BranchPathChance", 1)
          if L7_9 == 0 then
          elseif L7_9 > -3 then
            if L7_9 == "Up" then
              L7_9(A1_3 .. "_Paint")
            end
            L7_9(A1_3 .. "_Paint", 3)
            Pump_ResetMotion = L7_9
          elseif L7_9 < 3 then
            if L7_9 == "Down" then
              L7_9(A1_3 .. "_Thinner")
            end
            L7_9(A1_3 .. "_Thinner", 3)
            Pump_ResetMotion = L7_9
          end
          Pump_PaintDirection = L7_9
          Pump_ThinnerDirection = L7_9
        end
      end
    end
    Pump_LastMachineUsed = A1_3
    L5_7 = 0
    L6_8 = false
    if L7_9 > 2 then
      for _FORV_10_ = 1, 3 do
        if L4_6[_FORV_10_] == "Paint" then
          L5_7 = L5_7 + 1
        elseif L4_6[_FORV_10_] == "Thinner" then
          L5_7 = L5_7 - 1
        end
      end
      L7_9(L4_6)
      if L5_7 == 3 then
      elseif L5_7 == -3 then
      elseif A2_4 == "Paint" then
        L4_6[3] = A2_4
      else
        L4_6[1] = A2_4
      end
      L6_8 = true
    else
      L7_9(L4_6, A2_4)
    end
    Pump_LastUsedStatus = L5_7
    if L5_7 == -3 then
    elseif L5_7 == 3 then
    else
      if A2_4 == "Thinner" then
      end
      if L6_8 == true then
        Pump_TwoInMotion = true
        if Pump_PaintDirection == "Up" then
          Reverse(A1_3 .. "_" .. L7_9)
          if A2_4 == "Paint" then
            Pump_PaintDirection = "Up"
            Pump_ThinnerDirection = "Down"
          else
            Pump_PaintDirection = "Down"
            Pump_ThinnerDirection = "Up"
          end
        end
        SetSpeed(A1_3 .. "_" .. L7_9, 3)
      end
      if Pump_ThinnerDirection == "Down" then
        Reverse(A1_3 .. "_" .. A2_4)
      end
      SetSpeed(A1_3 .. "_" .. A2_4, 3)
      wait(0.1)
      Pump_InMotion = 1
    end
    L7_9(1.5)
    Pump_MachineArray_BUSY = L7_9
  end
end
TL_Pump_MachineArray = L0_0
L0_0 = "Up"
Pump_PaintDirection = L0_0
L0_0 = "Up"
Pump_ThinnerDirection = L0_0
L0_0 = false
Pump_TwoInMotion = L0_0
L0_0 = 0
Pump_InMotion = L0_0
L0_0 = 0
Pump_ResetMotion = L0_0
L0_0 = false
Pump_ResetAll = L0_0
function L0_0(A0_10)
  if Pump_ResetAll == false and Pump_InMotion == 1 then
    SetSpeed(A0_10, 0)
    if Pump_TwoInMotion == true then
      Pump_TwoInMotion = false
    else
      Pump_InMotion = 0
    end
  end
end
TL_Pump_StopMotion = L0_0
function L0_0(A0_11)
  if Pump_ResetAll == true then
    SetSpeed(A0_11, 0)
    ForEachEntityInGroup(SetPropertyFloat, "SKs_" .. Machine, "BranchPathChance", 0)
    if Pump_ResetMotion == 1 then
      Pump_ResetAll = false
      Pump_ResetMotion = 0
    elseif Pump_ResetMotion == 2 then
      Pump_ResetMotion = 1
    end
  end
end
TL_Pump_ResetFunction = L0_0
function L0_0(A0_12, A1_13, A2_14, A3_15)
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
TL_Pump_FilledFunction = L0_0
function L0_0()
  local L0_20, L1_21
end
TL_Restore_RocketRide1 = L0_0
