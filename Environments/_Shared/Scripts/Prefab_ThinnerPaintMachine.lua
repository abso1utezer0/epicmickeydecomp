local L0_0, L1_1
function L0_0(A0_2, A1_3)
  local L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10
  L2_4 = GetPrefabData
  L3_5 = A0_2
  L2_4 = L2_4(L3_5)
  L3_5 = "stop"
  L4_6 = "stop"
  L5_7 = GetRelativePrefabEntity
  L6_8 = A0_2
  L7_9 = ".Nozzle"
  L5_7 = L5_7(L6_8, L7_9)
  L6_8 = GetRelativePrefabEntity
  L7_9 = A0_2
  L8_10 = ".PaintTank"
  L6_8 = L6_8(L7_9, L8_10)
  L7_9 = GetRelativePrefabEntity
  L8_10 = A0_2
  L7_9 = L7_9(L8_10, ".ThinnerTank")
  L8_10 = GetRelativePrefabEntity
  L8_10 = L8_10(A0_2, ".PumpMachine")
  if L2_4.Prefab_MachineBusy == 0 then
    L2_4.Prefab_MachineBusy = 1
    if L2_4.Prefab_MachineRunning == 0 then
      AnimGBReset(L5_7)
      AnimGBSequence(L5_7, "Hit")
      AudioPostEventOn(L5_7, "Play_sfx_paintnozzle")
      Wait(0.25)
      AnimGBReset(L8_10)
      AnimGBSequence(L8_10, "Hit")
      AudioPostEventOn(L8_10, "Play_sfx_machinebase_warp")
      Wait(0.2)
      if tonumber(A1_3) == 1 then
        if L2_4.Prefab_Paint + L2_4.Prefab_Thinner > 3 and 0 < L2_4.Prefab_Thinner then
          L2_4.Prefab_Thinner = L2_4.Prefab_Thinner - 1
          L4_6 = "down"
        end
        L3_5 = "up"
        L2_4.Prefab_Paint = L2_4.Prefab_Paint + 1
      elseif tonumber(A1_3) == 2 then
        if L2_4.Prefab_Paint + L2_4.Prefab_Thinner > 3 and 0 < L2_4.Prefab_Paint then
          L3_5 = "down"
          L2_4.Prefab_Paint = L2_4.Prefab_Paint - 1
        end
        L2_4.Prefab_Thinner = L2_4.Prefab_Thinner + 1
        L4_6 = "up"
      end
      if L3_5 == "up" then
        AnimGBSequence(L6_8, L2_4.Prefab_Paint - 1 .. "To" .. L2_4.Prefab_Paint)
        AudioPostEventOn(L6_8, "Play_sfx_pump" .. L2_4.Prefab_Machine .. "of4_paint" .. L2_4.Prefab_Paint)
        AddHeroPoints(GetPlayer(), 4)
        if L4_6 == "down" then
          AnimGBSequence(L7_9, L2_4.Prefab_Thinner + 1 .. "To" .. L2_4.Prefab_Thinner)
          AudioPostEventOn(L7_9, "Play_sfx_pump" .. L2_4.Prefab_Machine .. "of4_thnnrdn" .. L2_4.Prefab_Thinner)
        end
      elseif L4_6 == "up" then
        AnimGBSequence(L7_9, L2_4.Prefab_Thinner - 1 .. "To" .. L2_4.Prefab_Thinner)
        AudioPostEventOn(L7_9, "Play_sfx_pump" .. L2_4.Prefab_Machine .. "of4_thnnr" .. L2_4.Prefab_Thinner)
        AddScrapperPoints(GetPlayer(), 4)
        if L3_5 == "down" then
          AnimGBSequence(L6_8, L2_4.Prefab_Paint + 1 .. "To" .. L2_4.Prefab_Paint)
          AudioPostEventOn(L6_8, "Play_sfx_pump" .. L2_4.Prefab_Machine .. "of4_paintdn" .. L2_4.Prefab_Paint)
        end
      end
      if L2_4.Prefab_Paint == 4 then
        L2_4.Prefab_MachineRunning = 1
        FireUser1(L5_7)
        Wait(0.2)
        AudioPostEventOn(L5_7, "Play_sfx_fix_pump" .. L2_4.Prefab_Machine .. "of4")
        AudioPostEventOn(L5_7, "Play_sfx_Prefab_PumpMachine_Done")
      end
      if L2_4.Prefab_Thinner == 4 then
        L2_4.Prefab_MachineRunning = 1
        Wait(0.2)
        AudioPostEventOn(L5_7, "Stop_sfx_pump_amb" .. L2_4.Prefab_Machine .. "of4")
        wait(0.8)
        ThinnerPaintMachine_StartSmoke(A0_2)
        Enable(GetRelativePrefabEntity(A0_2, ".SteamTriggerDamage"))
        FireUser2(L5_7)
      end
      wait(0.65)
    end
    L2_4.Prefab_MachineBusy = 0
  end
end
ThinnerPaintMachine = L0_0
function L0_0(A0_11)
  local L1_12
  L1_12 = GetRelativePrefabEntity
  L1_12 = L1_12(A0_11, ".SmokeSpawner")
  SetPropertyString(L1_12, "Spawn Group", "ThinnerPaintMachineSteam" .. GetPrefabData(A0_11).Prefab_Machine, 0)
  if #ForceSpawn(L1_12, 1) > 0 then
    SetParentEntity(ForceSpawn(L1_12, 1)[1], L1_12)
  end
end
ThinnerPaintMachine_StartSmoke = L0_0
function L0_0(A0_13)
  local L1_14, L2_15, L3_16
  L1_14 = GetPrefabData
  L2_15 = A0_13
  L1_14 = L1_14(L2_15)
  L2_15 = GetRelativePrefabEntity
  L3_16 = A0_13
  L2_15 = L2_15(L3_16, ".PaintTank")
  L3_16 = GetRelativePrefabEntity
  L3_16 = L3_16(A0_13, ".ThinnerTank")
  DestroyEntity("ThinnerPaintMachineSteam" .. L1_14.Prefab_Machine)
  Disable(GetRelativePrefabEntity(A0_13, ".SteamTriggerDamage"))
  while L1_14.Prefab_Thinner + L1_14.Prefab_Paint > 0 do
    if L1_14.Prefab_Paint > 0 then
      AnimGBSequence(L2_15, L1_14.Prefab_Paint .. "To" .. L1_14.Prefab_Paint - 1)
      AudioPostEventOn(L2_15, "Play_sfx_pump" .. L1_14.Prefab_Machine .. "of4_paintdn" .. L1_14.Prefab_Paint)
      L1_14.Prefab_Paint = L1_14.Prefab_Paint - 1
    end
    if L1_14.Prefab_Thinner > 0 then
      AnimGBSequence(L3_16, L1_14.Prefab_Thinner .. "To" .. L1_14.Prefab_Thinner - 1)
      AudioPostEventOn(L3_16, "Play_sfx_pump" .. L1_14.Prefab_Machine .. "of4_thnnrdn" .. L1_14.Prefab_Thinner)
      L1_14.Prefab_Thinner = L1_14.Prefab_Thinner - 1
    end
    wait(0.5)
  end
  AnimGBSequence(L2_15, "Rest0")
  AnimGBSequence(L3_16, "Rest0")
  AnimGBReset(L2_15)
  AnimGBReset(L3_16)
  AudioPostEventOn(GetRelativePrefabEntity(A0_13, ".Nozzle"), "Play_sfx_pump_amb" .. L1_14.Prefab_Machine .. "of4")
  L1_14.Prefab_Paint = 0
  L1_14.Prefab_Thinner = 0
  L1_14.Prefab_MachineBusy = 0
  L1_14.Prefab_MachineRunning = 0
end
ThinnerPaintMachine_Reset = L0_0
function L0_0(A0_17)
  Print("************ - ThinnerPaintMachine_Initialize")
  if GetPrefabData(A0_17).GlobalToCheck == "None" then
    Print("***************************** You forgot to set up your Pump to have a Global to CHECK!!!!")
  else
    if GetGlobal(GetPrefabData(A0_17).GlobalToCheck) == 2 then
      GetPrefabData(A0_17).Prefab_Thinner = 4
      AnimGBSequence(GetRelativePrefabEntity(A0_17, ".ThinnerTank"), "Rest4")
      ThinnerPaintMachine_StartSmoke(A0_17)
      Enable(GetRelativePrefabEntity(A0_17, ".SteamTriggerDamage"))
    elseif GetGlobal(GetPrefabData(A0_17).GlobalToCheck) == 1 then
      GetPrefabData(A0_17).Prefab_Paint = 4
      AnimGBSequence(GetRelativePrefabEntity(A0_17, ".PaintTank"), "Rest4")
    end
    if GetGlobal(GetPrefabData(A0_17).GlobalToCheck) > 0 then
      GetPrefabData(A0_17).Prefab_MachineRunning = 1
      GetPrefabData(A0_17).Prefab_MachineBusy = 0
      GetPrefabData(A0_17).Prefab_Machine = 1
      AudioPostEventOn(GetRelativePrefabEntity(A0_17, ".Nozzle"), "Stop_sfx_pump_amb" .. GetPrefabData(A0_17).Prefab_Machine .. "of4")
    end
  end
  wait(5)
  Print("************ - ThinnerPaintMachine_Initialize")
  if GetPrefabData(A0_17).Prefab_MachineBusy == 1 then
    Print("************ - ThinnerPaintMachine_Initialize: data.Prefab_MachineBusy = 1")
    ThinnerPaintMachine_StartSmoke(A0_17)
    Enable(GetRelativePrefabEntity(A0_17, ".SteamTriggerDamage"))
  end
end
ThinnerPaintMachine_Initialize = L0_0
function L0_0(A0_18, A1_19)
  if A1_19 == "On" then
    GetPrefabData(A0_18).Prefab_MachineBusy = 0
    DestroyEntity("ThinnerPaintMachineSteam" .. GetPrefabData(A0_18).Prefab_Machine)
    Disable(GetRelativePrefabEntity(A0_18, ".SteamTriggerDamage"))
  elseif A1_19 == "Off" then
    GetPrefabData(A0_18).Prefab_MachineBusy = 1
    AudioPostEventOn(GetRelativePrefabEntity(A0_18, ".Nozzle"), "Stop_sfx_pump_amb" .. GetPrefabData(A0_18).Prefab_Machine .. "of4")
    ThinnerPaintMachine_StartSmoke(A0_18)
    Enable(GetRelativePrefabEntity(A0_18, ".SteamTriggerDamage"))
  end
end
ThinnerPaintMachine_SetState = L0_0
