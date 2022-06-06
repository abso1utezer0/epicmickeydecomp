local L0_0, L1_1
function L0_0()
  Print("Skull Island Setup is Running")
  ForEachEntityInGroup(DestroyEntity, "potw_shared.Cave_Doors")
  FireUser1("potw_zonel_audio.Sound_Marker_PotW_mx")
  StartTrackingCurrentLevelForScoring("potw_Skull_Island")
  SetMap(GetPlayer(), "MAP_P_ZONEL", "GAME")
  potw_ZoneL_SaveCheckpoint()
  Hide("potw_zonel_fx.smeeBoatRipple_0_1")
  Hide("potw_zonel_fx.smeeBoatRipple_1_2")
  Hide("potw_zonel_fx.smeeBoatRipple_2_3")
  GuardianPrefab_PopulateGuardians("potw_MickeyHead_Boat")
  if GetGlobal("PotW_SkullRock_IntroPlayed") == 0 then
    ForEachEntityInGroup(Hide, "potw_zonel_dynamic.P_ZoneL_Thinner_Right")
    ForEachEntityInGroup(Hide, "potw_zonel_dynamic.P_ZoneL_Thinner_Left")
    Hide("potw_zonel_fx.ThinnerFall_Splash_SM 01")
    Hide("potw_zonel_fx.ThinnerFall_Splash_SM 02")
    Disable("potw_zonel_audio2.TriggerRotate_ThinnerFalls_Right")
    Disable("potw_zonel_audio2.TriggerRotate_ThinnerFalls_Left")
    SetGlobal("AL_AdventurelandProgress", 3)
    PotW_SkullRock_IGCFlythrough()
  end
end
PotW_SkullRock_Setup = L0_0
L0_0 = "potw_zoneL.From2DStart"
skullIslandStartLocation = L0_0
function L0_0()
  if GetGlobal("potw_tortuga_startLocation") == 0 then
    skullIslandStartLocation = "potw_zoneL.From2DStart"
  else
    skullIslandStartLocation = "potw_zonel_scripting.StartPosition_2"
  end
  SaveCheckpoint(GetPlayer(), "potw_ZoneL_LoadCheckpoint", skullIslandStartLocation)
end
potw_ZoneL_SaveCheckpoint = L0_0
function L0_0()
  StartTrackingCurrentLevelForScoring("potw_Skull_Island")
  FireUser1("potw_zonel_audio.Sound_Marker_PotW_mx")
  if GetGlobal("PotW_SkullRock_IntroPlayed") == 1 then
    Print("Enabling BWX 2")
    Enable("potw_zonel_ai.Spawner_BWX 03")
    DestroyEntity("potw_zonel_ai.BeetleworxCrawler")
  else
    StartFadeOut(0)
    SetGlobal("PlayerFirstTimeInZone", 1)
  end
  ForEachEntityInGroup(Hide, "potw_zonel_dynamic.P_ZoneL_Thinner_Right")
  ForEachEntityInGroup(Hide, "potw_zonel_dynamic.P_ZoneL_Thinner_Left")
  Hide("potw_zonel_fx.ThinnerFall_Splash_SM 01")
  Hide("potw_zonel_fx.ThinnerFall_Splash_SM 02")
  Disable("potw_zonel_audio2.TriggerRotate_ThinnerFalls_Right")
  Disable("potw_zonel_audio2.TriggerRotate_ThinnerFalls_Left")
  FireThread(GuardianPrefab_PopulateGuardians, "potw_MickeyHead_Boat")
  if GetGlobal("PotW_SR_MachineState") == -1 then
    PotW_SR_PaintMachine_Total = 1
    PotW_SR_ThinnerMachine_Total = 1
  end
  if GetGlobal("PotW_SR_MachineState") == 1 then
    StreamZones(GetPlayer(), "stream_10_2")
    SetGlobal("potw_SR_MachineDestroyed", 1)
    SetGlobal("PotW_SR_MachineState", 1)
    SetGlobal("AL_AdventurelandProgress", 2)
    SetGlobal("potw_SR_PumpsUsed", 4)
    DestroyEntity("potw_zonel_static.PotW_SkullRock_Thinner_Mouth 01")
    ForEachEntityInGroup(DestroyEntity, "potw_zonel_scripting.TriggerDamageMouth 01")
    DestroyEntity("potw_zonel_scripting.TriggerDamageMouth 02")
    DestroyEntity("potw_zonel_scripting.TriggerDamageMouth 03")
    DestroyEntity("PotW_SR_GusCaveTrigger")
    AnimGBSequence("potw_zonel_dynamic.Machine2", "LoopBackwards")
    Enable("Pirate_NPC_Spawner2")
    Print("Pirate NPC Spawner Enabled")
  elseif GetGlobal("PotW_SR_MachineState") == 2 then
    SetGlobal("PotW_SR_MachineState", 2)
    SetGlobal("AL_AdventurelandProgress", 2)
    SetGlobal("potw_SR_PumpsUsed", 4)
    ForEachEntityInGroup(Unhide, "potw_zonel_dynamic.P_ZoneL_Thinner_Right")
    ForEachEntityInGroup(Unhide, "potw_zonel_dynamic.P_ZoneL_Thinner_Left")
    Unhide("potw_zonel_fx.ThinnerFall_Splash_SM 01")
    Unhide("potw_zonel_fx.ThinnerFall_Splash_SM 02")
    Enable("potw_zonel_audio2.TriggerRotate_ThinnerFalls_Left")
    Enable("potw_zonel_audio2.TriggerRotate_ThinnerFalls_Right")
    ForcePainted("potw_zonel_dynamic.WaterfallInvisibleBarrier")
    Unhide("potw_zonel_dynamic.machine_steam1")
    Unhide("potw_zonel_dynamic.machine_steam2")
    Unhide("potw_zonel_dynamic.machine_steam3")
    DestroyEntity("PotW_SR_GusCaveTrigger")
    AudioPostEventOn("potw_zonel_audio2.Sound_Marker_MachineSteam", "Play_sfx_PotW_MachineSteam")
    AnimGBSequence("potw_zonel_dynamic.BW_Spawner_OuterDoors", "RestOpen")
    AnimGBSequence("potw_zonel_dynamic.Machine1", "Rest")
    StopEmitters("potw_zonel_dynamic.Machine2_FX")
    AnimGBSequence("potw_zonel_dynamic.Machine2", "Rest")
    ForceSketched("potw_zonel_dynamic.P_ZoneL_Toon13")
    PotW_SR_ForceSketchToon_Var = 1
    AnimGBSequence("potw_zonel_dynamic.Machine3", "Pump")
    AnimGBSequence("potw_zonel_dynamic.Machine4", "Pump")
  else
    SetGlobal("potw_SR_PumpsUsed", 0)
  end
  if GetGlobal("PotW_SR_BoatComplete") == 1 then
    PotW_SR_SunkenBoatState = 3
    SetGlobal("potw_SR_AnchorCount", 3)
    Enable("potw_zonel_scripting.TriggerExitMission")
    AnimGBSequence("potw_zonel_dynamic.SunkenBoat", "3Idle")
    AnimGBSequence("potw_zonel_dynamic.SunkenBoat_Toon", "3Idle")
    AnimGBSequence("potw_zonel_dynamic.Island2Door", "RestDown")
    AnimGBSequence("potw_zonel_dynamic.Island3Door", "RestDown")
    DestroyEntity("potw_zonel_dynamic.LogicRelayMarker 01")
    AnimGBSequence("potw_zonel_dynamic.Island2Gear", "DownIntoPlace")
    AnimGBSequence("potw_zonel_dynamic.Island3SpireGear", "DownIntoPlace")
    PotW_SR_Island3SpireCheckComplete = 1
    ForceSketched("potw_zonel_dynamic.Anchor1")
    ForceSketched("potw_zonel_dynamic.Anchor2")
    ForceSketched("potw_zonel_dynamic.Anchor3")
    DestroyEntity("potw_zonel_dynamic.PotW_SkullRock_Rope1")
    DestroyEntity("potw_zonel_dynamic.PotW_SkullRock_Rope2")
    DestroyEntity("potw_zonel_dynamic.PotW_SkullRock_Rope3")
    Unhide("potw_zonel_fx.smeeBoatRipple_2_3")
    Hide("potw_zonel_fx.smeeBoatRipple_rest")
    Hide("potw_zonel_fx.smeeBoatRipple_0_1")
    Hide("potw_zonel_fx.smeeBoatRipple_1_2")
    Hide("potw_zonel_fx.smeeBoatRipple_2_3")
  else
    SetGlobal("potw_SR_AnchorCount", 0)
  end
end
potw_ZoneL_LoadCheckpoint = L0_0
function L0_0()
  SetGlobal("potw_tortuga_startLocation", 1)
  potw_ZoneL_SaveCheckpoint()
end
potw_SI_SetStart = L0_0
function L0_0()
  if GetGlobal("PotW_SkullRockTentaclesKilled") == 1 then
    Enable("potw_zonel.Trig_Boat2Tortuga")
    Unhide("potw_zonel_dynamic.PoTW_BoatA")
    ForEachEntityInGroup(Unhide, "potw_zonel_dynamic.P_ZoneL_Thinner_Right")
    Enable("potw_zonel_audio2.TriggerRotate_ThinnerFalls_Right")
    AudioPostEventOn("potw_zonel_audio.Sound_Marker_thinnerspoutR", "Play_sfx_thinner_spout2")
    AudioPostEventOn("potw_zonel_audio.Sound_Marker_thinnerstreamR", "Play_sfx_thinner_splashing")
    ForEachEntityInGroup(Unhide, "potw_zonel_dynamic.P_ZoneL_Thinner_Left")
    AudioPostEventOn("potw_zonel_audio.Sound_Marker_thinnerspoutL", "Play_sfx_thinner_spout1")
    AudioPostEventOn("potw_zonel_audio.Sound_Marker_thinnerstreamL", "Play_sfx_thinnerstream_beach")
    Enable("potw_zonel_audio2.TriggerRotate_ThinnerFalls_Left")
    ForcePainted("potw_zonel_dynamic.WaterfallInvisibleBarrier")
  else
    Hide("potw_zonel_dynamic.PoTW_BoatA")
  end
end
PotW_SkullRock_V2_Setup = L0_0
function L0_0()
  RestrictCutSceneInput()
  SetCameraHintDist(GetPlayer(), 10)
  SetCameraHintPitch(GetPlayer(), 25)
  SetCameraHintOffset(GetPlayer(), 5)
  Wait(1.5)
  UnrestrictCutSceneInput()
  ForceSequence("potw_zonel_dynamic.Marker(Conversation)_Exit", "Pirate_to_Jollyroger_1_convo")
end
PotW_SR_Leave = L0_0
function L0_0()
  Print("Skull Island IGC Flythrough is running")
  if GetGlobal("PotW_SR_IntroComplete") == 0 and GetConfigVariableBool("DisableIGC") == false then
    AudioPostEventOn(GetPlayer(), "Mute_Mickey")
    AudioPostEventOn(GetPlayer(), "Mute_JollyRoger")
    AudioPostEventOn(GetPlayer(), "Mute_Pumps")
    FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_Intro1")
  end
end
PotW_SkullRock_IGCFlythrough = L0_0
function L0_0()
  StartFadeOut(1.333)
  wait(1.333)
  TeleportToEntity(GetPlayer(), "potw_zoneL.From2DStart")
  wait(0.01)
  GrabCamera("potw_zonel_camera.CameraControlPoint 01", nil, CAMERA_LERP_TRANSITION, 0)
  wait(0.01)
  StartFadeIn()
  AudioPostEventOn(GetPlayer(), "Unmute_Mickey")
  AudioPostEventOn(GetPlayer(), "Unmute_JollyRoger")
  AudioPostEventOn(GetPlayer(), "Unmute_Pumps")
  Wait(0.2)
  FireThread(Prefab_ProjectorMickeyMove)
  Enable("potw_zonel_igc.TriggerRotate 01")
  SetHudFor2D(GetPlayer(), false)
  UnrestrictCutSceneInput()
  EnableGuardianSystem()
end
PotW_SkullRock_AfterIGCFlythroughSetup = L0_0
L0_0 = {}
L0_0[1] = 0
L0_0[2] = 0
L0_0[3] = 0
L0_0[4] = 0
PotW_SR_Machine = L0_0
L0_0 = 0
PotW_SR_PaintMachine_Total = L0_0
L0_0 = 0
PotW_SR_ThinnerMachine_Total = L0_0
function L0_0(A0_2, A1_3)
  Print("****************************** IN PUMP MACHINE FILLED")
  SetGlobal("potw_SR_PumpsUsed", GetGlobal("potw_SR_PumpsUsed") + 1)
  if A1_3 == "Paint" then
    PotW_SR_PaintMachine_Total = PotW_SR_PaintMachine_Total + 1
    PotW_SR_Machine[tonumber(GetPrefabData(A0_2).Prefab_Machine)] = 1
    if PotW_SR_PaintMachine_Total > 0 and 0 < PotW_SR_ThinnerMachine_Total then
      FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_MachineMixed")
    else
      Wait(0.8)
      if PotW_SR_ThinnerMachine_Total == 0 then
        if PotW_SR_PaintMachine_Total == 1 then
          FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_MachineRepair_Intro")
        elseif PotW_SR_PaintMachine_Total == 2 then
          FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_MachineRepair_2")
        elseif PotW_SR_PaintMachine_Total == 3 then
          FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_MachineRepair_3")
        end
      end
      if GetPrefabData(A0_2).Prefab_Machine == 2 then
        FireThread(PotW_SR_PumpMachine2_Stuff, A1_3)
      end
      PotW_SR_PumpFilled(A1_3)
    end
  end
  if A1_3 == "Thinner" then
    Print("############ Thinner used in a pump")
    PotW_SR_ThinnerMachine_Total = PotW_SR_ThinnerMachine_Total + 1
    PotW_SR_Machine[tonumber(GetPrefabData(A0_2).Prefab_Machine)] = 2
    if PotW_SR_PaintMachine_Total > 0 and 0 < PotW_SR_ThinnerMachine_Total then
      Print("############ Thinner used to mix the pumps!")
      Print("############ " .. PotW_SR_PaintMachine_Total .. " paint pumps, and " .. PotW_SR_ThinnerMachine_Total .. " thinner pumps.")
      Print("########## # Thinner used to mix the pumps!")
      FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_MachineMixed")
    else
      wait(0.8)
      if GetPrefabData(A0_2).Prefab_Machine == 1 then
        AnimGBSequence("potw_zonel_dynamic.Machine1", "Rest")
        AudioPostEventOn("potw_zonel_audio2.Sound_Marker_VentStack 03", "Stop_sfx_SkullRock_Machine_SmkStkLft")
        AudioPostEventOn("potw_zonel_audio2.Sound_Marker_VentStack 04", "Stop_sfx_SkullRock_Machine_SmkStkR")
        PotW_SR_ThinnerMachineDialog()
      elseif GetPrefabData(A0_2).Prefab_Machine == 2 then
        FireThread(PotW_SR_PumpMachine2_Stuff, A1_3)
        StopEmitters("potw_zonel_dynamic.Machine2_FX")
        AudioPostEventOn("potw_zonel_audio2.Sound_Marker_PistonGear 02", "Stop_sfx_POTW_SkullRock_BackSideMachine")
        PotW_SR_ThinnerMachineDialog()
        AudioPostEventOn("potw_zonel_audio2.Sound_Marker_VentStack 01", "Stop_sfx_SkullRock_Machine_SmkStkLft")
        AudioPostEventOn("potw_zonel_audio2.Sound_Marker_VentStack 02", "Stop_sfx_SkullRock_Machine_SmkStkR")
      elseif GetPrefabData(A0_2).Prefab_Machine == 3 then
        FireUser1("potw_zonel_igc.grabcamerafancy_thinnerfallLeft.FancyCameraLookAt 06")
        Wait(0.8)
        ForEachEntityInGroup(Unhide, "potw_zonel_dynamic.P_ZoneL_Thinner_Left")
        Enable("potw_zonel_audio2.TriggerRotate_ThinnerFalls_Left")
        Unhide("potw_zonel_fx.ThinnerFall_Splash_SM 01")
        ForcePainted("potw_zonel_dynamic.WaterfallInvisibleBarrier")
        AudioPostEventOn("potw_zonel_audio.Sound_Marker_thinnerspoutL", "Play_sfx_thinner_spout1")
        AudioPostEventOn("potw_zonel_audio.Sound_Marker_thinnerstreamL", "Play_sfx_thinnerstream_beach")
        AnimGBSequence("potw_zonel_dynamic.Machine3", "Pump")
        ForceSketched("potw_zonel_dynamic.P_ZoneL_Toon13")
        PotW_SR_ForceSketchToon_Var = 1
        PotW_SR_ThinnerMachineDialog()
      elseif GetPrefabData(A0_2).Prefab_Machine == 4 then
        FireUser1("potw_zonel_igc.grabcamerafancy_thinnerfallRight.FancyCameraLookAt 06")
        Wait(0.8)
        ForEachEntityInGroup(Unhide, "potw_zonel_dynamic.P_ZoneL_Thinner_Right")
        Enable("potw_zonel_audio2.TriggerRotate_ThinnerFalls_Right")
        Unhide("potw_zonel_fx.ThinnerFall_Splash_SM 02")
        AudioPostEventOn("potw_zonel_audio.Sound_Marker_thinnerspoutR", "Play_sfx_thinner_spout2")
        AudioPostEventOn("potw_zonel_audio.Sound_Marker_thinnerstreamR", "Play_sfx_thinner_splashing")
        AnimGBSequence("potw_zonel_dynamic.Machine4", "Pump")
        PotW_SR_ThinnerMachineDialog()
      end
    end
    PotW_SR_PumpFilled(A1_3)
  end
end
PotW_SR_PumpMachineFilled = L0_0
function L0_0()
  Print("***************** IN PUMP MACHINE MOOT")
  if PotW_SR_PaintMachine_Total > 0 and 0 < PotW_SR_ThinnerMachine_Total then
    FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_MachineMixed")
    Print("***************** FIRE GUS MOOT SEQ")
  end
end
PotW_SR_PumpMachineMoot = L0_0
function L0_0()
  local L0_4, L1_5
end
PotW_SR_PumpMachineDisable = L0_0
function L0_0()
  if PotW_SR_PaintMachine_Total == 0 then
    if PotW_SR_ThinnerMachine_Total == 1 then
      FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_MachineBreak_Intro")
    elseif PotW_SR_ThinnerMachine_Total == 2 then
      FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_MachineBreak_2")
    elseif PotW_SR_ThinnerMachine_Total == 3 then
      FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_MachineBreak_3")
    elseif PotW_SR_PaintMachine_Total > 0 and 0 < PotW_SR_ThinnerMachine_Total then
      FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_MachineMixed")
    end
  end
end
PotW_SR_ThinnerMachineDialog = L0_0
function L0_0(A0_6, A1_7)
  if A1_7 == "1" then
    if PotW_SR_ThinnerMachine_Total > 0 then
      FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_DontCrossTheBeams")
    end
  elseif 0 < PotW_SR_PaintMachine_Total then
    FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_DontCrossTheBeams")
  end
end
PotW_SR_ReverseMachineWarning = L0_0
function L0_0(A0_8)
  AnimGBSequence("potw_zonel_dynamic.Machine2", "Reverse")
  Wait(4.833)
  if A0_8 == "Paint" then
    AnimGBSequence("potw_zonel_dynamic.Machine2", "LoopBackwards")
  else
    AnimGBSequence("potw_zonel_dynamic.Machine2", "Rest")
  end
end
PotW_SR_PumpMachine2_Stuff = L0_0
function L0_0()
  FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_Machine_Intro")
  ForEachEntityInGroup(DestroyEntity, "potw_zonel_scripting.FirstMachineDialog")
end
PotW_SR_FirstMachine = L0_0
function L0_0(A0_9)
  if A0_9 == "Paint" then
    if PotW_SR_Machine[1] == 1 and PotW_SR_Machine[2] == 1 and PotW_SR_Machine[3] == 1 and PotW_SR_Machine[4] == 1 then
      DestroyEntity("potw_zonel_ai.BeetleworxCrawler")
      DestroyEntity("potw_zonel_ai.BeetleworxCrawler2")
      DestroyEntity("potw_zonel_ai.Spawner_BWX 02")
      StreamZones(GetPlayer(), "stream_10_2")
      SetGlobal("potw_SR_MachineDestroyed", 1)
      SetGlobal("PotW_SR_MachineState", 1)
      SetGlobal("AL_AdventurelandProgress", 2)
      RestrictCutSceneInput()
      StartFadeOut(1)
      Wait(1)
      DestroyEntity("potw_zonel_static.PotW_SkullRock_Thinner_Mouth 01")
      ForEachEntityInGroup(DestroyEntity, "potw_zonel_scripting.TriggerDamageMouth 01")
      DestroyEntity("potw_zonel_scripting.TriggerDamageMouth 02")
      DestroyEntity("potw_zonel_scripting.TriggerDamageMouth 03")
      DestroyEntity("PotW_SR_GusCaveTrigger")
      PlayAndUnlockMovie("PotW_visit1_Fix_Pirate_Machine.bik", "PotW_visit1_Fix_Pirate_Machine")
      StartFadeIn(1)
      Wait(1)
      Enable("Pirate_NPC_Spawner2")
      UnrestrictCutSceneInput()
      FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_Machine_Repaired")
    end
  elseif A0_9 == "Thinner" and PotW_SR_Machine[1] == 2 and PotW_SR_Machine[2] == 2 and PotW_SR_Machine[3] == 2 and PotW_SR_Machine[4] == 2 then
    DestroyEntity("potw_zonel_ai.Spawner_BWX 02")
    SetGlobal("PotW_SR_MachineState", 2)
    SetGlobal("AL_AdventurelandProgress", 2)
    FireUser1("potw_zonel_igc.grabcamerafancy 02.FancyCameraLookAt 05")
    Unhide("potw_zonel_dynamic.machine_steam1")
    Unhide("potw_zonel_dynamic.machine_steam2")
    Unhide("potw_zonel_dynamic.machine_steam3")
    DestroyEntity("PotW_SR_GusCaveTrigger")
    AudioPostEventOn("potw_zonel_audio2.Sound_Marker_MachineSteam", "Play_sfx_PotW_MachineSteam")
    AnimGBSequence("potw_zonel_dynamic.BW_Spawner_OuterDoors", "Open")
    Enable("potw_zonel_dynamic.Camera_Machine")
    Enable("potw_zonel_dynamic.Machine_LookAtMarker")
  end
end
PotW_SR_PumpFilled = L0_0
function L0_0(A0_10)
  if GetGlobal("PotW_SR_MachineState") == 2 then
    GetPrefabData(A0_10).Prefab_MachineRunning = 1
    GetPrefabData(A0_10).Prefab_Thinner = 4
    AnimGBSequence(GetRelativePrefabEntity(A0_10, ".ThinnerTank"), "Rest4")
    PotW_SR_Machine[tonumber(GetPrefabData(A0_10).Prefab_Machine)] = 2
    Unhide(GetRelativePrefabEntity(A0_10, ".SteamJet_Blast"))
    Enable(GetRelativePrefabEntity(A0_10, ".SteamTriggerDamage"))
    AnimGBSequence("potw_zonel_dynamic.Machine" .. GetPrefabData(A0_10).Prefab_Machine, "Rest")
    StopEmitters("potw_zonel_dynamic.Machine" .. GetPrefabData(A0_10).Prefab_Machine .. "_FX")
  elseif GetGlobal("PotW_SR_MachineState") == 1 then
    GetPrefabData(A0_10).Prefab_MachineRunning = 1
    GetPrefabData(A0_10).Prefab_Paint = 4
    AnimGBSequence(GetRelativePrefabEntity(A0_10, ".PaintTank"), "Rest4")
    PotW_SR_Machine[tonumber(GetPrefabData(A0_10).Prefab_Machine)] = 1
  end
  if GetGlobal("PotW_SR_MachineState") > 0 then
    PotW_SR_ThinnerMachine_Total = 4
    GetPrefabData(A0_10).Prefab_Machine = 1
    AudioPostEventOn(GetRelativePrefabEntity(A0_10, ".Nozzle"), "Stop_sfx_pump_amb" .. GetPrefabData(A0_10).Prefab_Machine .. "of4")
  end
end
PotW_Checkpoint_PumpMachine = L0_0
L0_0 = 0
PotW_SR_25D_Trigger_Touched = L0_0
function L0_0()
  local L0_11, L1_12
  L0_11 = PotW_SR_25D_Trigger_Touched
  L0_11 = L0_11 + 1
  PotW_SR_25D_Trigger_Touched = L0_11
end
PotW_SR_25D_Trigger_StartTouch = L0_0
function L0_0()
  local L0_13
  L0_13 = PotW_SR_25D_Trigger_Touched
  L0_13 = L0_13 - 1
  PotW_SR_25D_Trigger_Touched = L0_13
  L0_13 = PotW_SR_25D_Trigger_Touched
  if L0_13 == 0 then
    L0_13 = ClearCameraHintAll
    L0_13(GetPlayer())
  end
end
PotW_SR_25D_Trigger_EndTouch = L0_0
function L0_0()
  if GetGlobal("PotW_SR_GusIsland3_Played") == 0 then
    RestrictCutSceneInput()
    SetCameraAttributes("potw_zonel_camera.Marker(CameraOverride)_GusIsland3")
    FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_GusIsland3")
    Wait(3)
    ClearAllCameraAttributesTimed(1)
    UnrestrictCutSceneInput()
  end
end
PotW_SR_GusIsland3Landing = L0_0
function L0_0()
  if GetGlobal("PotW_SR_BoatComplete") == 0 then
    AnimGBSequence("potw_zonel_dynamic.Island3SpireGear", "DownIntoPlace")
    AudioPostEventOn("potw_zonel_dynamic.Island3SpireGear", "Play_sfx_POTW_SkullRock_Gear")
    Wait(2)
    FireUser1("potw_zonel_igc.grabcamerafancy 02.FancyCameraLookAt 01")
    Wait(2)
    AudioPostEventOn("potw_zonel_audio.Sound_Marker_Island3Door", "Play_sfx_POTW_PortcullisDoor_Open")
    AnimGBSequence("potw_zonel_dynamic.Island3Door", "Open")
    Wait(1)
    AnimGBSequence("potw_zonel_dynamic.Island3Door", "RestDown")
    FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_ShipRising5")
  end
end
PotW_SR_Island3Gear = L0_0
L0_0 = 0
PotW_SR_Island2PortcullisClosed = L0_0
function L0_0()
  local L1_14
  L1_14 = 1
  PotW_SR_Island2PortcullisClosed = L1_14
end
PotW_SR_Island2Close = L0_0
function L0_0()
  if PotW_SR_Island2PortcullisClosed == 1 then
    PotW_SR_Island2PortcullisClosed = 0
    DestroyEntity("potw_zonel_dynamic.LogicRelayMarker 01")
    AudioPostEventOn("potw_zonel_dynamic.Island2Gear", "Play_sfx_POTW_SkullRock_Gear")
    AnimGBSequence("potw_zonel_dynamic.Island2Gear", "DownIntoPlace")
    Wait(2)
    AnimGBSequence("potw_zonel_dynamic.Island2Door", "Open")
    AudioPostEventOn("potw_zonel_audio.Sound_Marker_Island2Door", "Play_sfx_POTW_PortcullisDoor_Open")
    wait(1)
    AnimGBSequence("potw_zonel_dynamic.Island2Door", "RestDown")
  end
end
PotW_SR_Island2Open = L0_0
L0_0 = 0
PotW_SR_SunkenBoatState = L0_0
function L0_0(A0_15, A1_16)
  local L2_17, L3_18, L4_19, L5_20, L6_21
  L2_17 = ""
  if L3_18 == 0 then
    PotW_SR_SunkenBoatState = L3_18
    L3_18(L4_19, L5_20)
    for L6_21 = 1, 3 do
      if L6_21 == PotW_SR_SunkenBoatState then
        L2_17 = L6_21 - 1 .. "To" .. L6_21
        AnimGBSequence("potw_zonel_dynamic.SunkenBoat", L2_17)
        AnimGBSequence("potw_zonel_dynamic.SunkenBoat_Toon", L2_17)
        if L6_21 == 1 then
          FireUser1("potw_zonel_igc.grabcamerafancy 02.FancyCameraLookAt 02")
          Hide("potw_zonel_fx.smeeBoatRipple_rest")
          Unhide("potw_zonel_fx.smeeBoatRipple_0_1")
          Print("# ################ I JUST CHANGED THE BOAT RIPPLE FX 0-1")
          DoStinger("Stinger_Moment", 7)
          Wait(6.3)
          AudioPostEventOn("potw_zonel_audio.Sound_Marker_sunkenboat_creaks1", "Play_sfx_sunkenboat_creaksngloops")
        elseif L6_21 == 2 then
          FireUser1("potw_zonel_igc.grabcamerafancy 02.FancyCameraLookAt 03")
          Hide("potw_zonel_fx.smeeBoatRipple_0_1")
          Unhide("potw_zonel_fx.smeeBoatRipple_1_2")
          Print("# ################ I JUST CHANGED THE BOAT RIPPLE FX 1-2")
          DoStinger("Stinger_Moment", 7)
          Wait(5)
          AudioPostEventOn("potw_zonel_audio.Sound_Marker_sunkenboat_creaks2", "Play_sfx_thinnershore_gloop")
        else
          ForceSketched("potw_zonel_dynamic.SunkenBoat_Toon")
          FireUser1("potw_zonel_igc.grabcamerafancy 02.FancyCameraLookAt 04")
          Hide("potw_zonel_fx.smeeBoatRipple_1_2")
          Unhide("potw_zonel_fx.smeeBoatRipple_2_3")
          Print("# ################ I JUST CHANGED THE BOAT RIPPLE FX 2-3")
          DoStinger("Stinger_Moment", 7)
          Wait(5.7)
          AudioPostEventOn("potw_zonel_audio.Sound_Marker_sunkenboat_creaks3", "Play_sfx_thinnershore_gloop")
          Enable("potw_zonel_scripting.TriggerExitMission")
          Enable("potw_zonel_scripting.PotW_SR_RestoreHelm")
          SetGlobal("PotW_SR_BoatComplete", 1)
          potw_ZoneL_SaveCheckpoint()
        end
        Wait(1)
        AnimGBSequence("potw_zonel_dynamic.SunkenBoat", L6_21 .. "Idle")
        AnimGBSequence("potw_zonel_dynamic.SunkenBoat_Toon", L6_21 .. "Idle")
      end
    end
  end
end
PotW_SR_AnchorRaise = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Play_sfx_PU_Daisy")
  AudioPostEventOn(GetPlayer(), "Play_sfx_PU_Daisy")
  SetGlobal("PotW_DaisyParts", GetGlobal("PotW_DaisyParts") + 1, true)
  potw_ZoneL_SaveCheckpoint()
end
PotW_ZoneL_GetDaisyBody = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_8")
  WaitForLevelLoad()
  MoveToEntity(GetPlayer(), "potw_zoneb.FromSkullRockStart")
  ForEachEntityInGroup(Unhide, "potw_shared.Cave_Doors")
end
PotW_SkullRock_ToTortuga = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("potw_Skull_Island")
  LoadLevel(GetPlayer(), "Levels/PotW_JollyRoger_Start.Level")
end
PotW_SkullRockToJollyRoger_Teleport = L0_0
function L0_0()
  Print("EXIT MAIN ISLAND")
  PlayerInMainIslandVolume = false
  Wait(0.1)
  Enable("potw_zonel_camera.Trigger_WreckTop")
  Wait(0.1)
  if PlayerInWreckTopVolume == false then
    Enable("potw_zonel_camera.Trigger_Wreck")
    MoveToEntity("potw_zonel_camera.CameraTrigger_MainIsland", "potw_zonel_camera.Marker(Parentable)_MoveTriggerDown")
    Enable("potw_zonel_camera.CameraTrigger_MainIsland")
    SetCameraAttributes("potw_zonel_camera.CameraMainIsland")
  end
end
PotW_SkullRock_RockHop_CameraStart = L0_0
function L0_0()
  Print("ENTER MAIN ISLAND")
  PlayerInMainIslandVolume = true
  ClearAllCameraAttributesTimed(3)
end
PotW_SkullRock_RockHop_CameraEnd = L0_0
function L0_0()
  SetCameraAttributes("potw_zonel_camera.Marker(CameraOverride)_Island2")
  ToggleCameraOcclusion(GetPlayer(), false)
end
PotW_SkullRock_HoleIsland_CameraStart = L0_0
function L0_0()
  ClearAllCameraAttributesTimed(2)
end
PotW_SkullRock_HoleIsland_CameraEnd = L0_0
L0_0 = false
PlayerInWreckVolume = L0_0
L0_0 = false
PlayerInWreckTopVolume = L0_0
L0_0 = false
PlayerInMainIslandVolume = L0_0
L0_0 = "Out"
PlayerDirectionWreckTopVolume = L0_0
L0_0 = "Down"
PlayerDirectionWreckVolume = L0_0
function L0_0(A0_22, A1_23)
  PlayerDirectionWreckTopVolume = A1_23
end
PotW_SkullRock_SetWreckTopDirection = L0_0
function L0_0(A0_24, A1_25)
  PlayerDirectionWreckVolume = A1_25
end
PotW_SkullRock_SetWreckDirection = L0_0
function L0_0()
  Print("ENTER WRECK")
  PlayerInWreckVolume = true
  if PlayerDirectionWreckVolume == "Down" then
    SetCameraAttributes("potw_zonel_camera.Marker(CameraOverride)_WreckDown")
  else
    SetCameraAttributes("potw_zonel_camera.Marker(CameraOverride)_WreckTop")
  end
  Disable("potw_zonel_camera.Trigger_WreckTop")
end
PotW_SkullRock_Wreck_EnterSpline = L0_0
function L0_0()
  Print("EXIT WRECK")
  PlayerInWreckVolume = false
  Disable("potw_zonel_camera.Trigger_Wreck")
  Wait(0.1)
  Enable("potw_zonel_camera.Trigger_WreckTop")
  Wait(0.1)
  if PlayerInWreckTopVolume == false then
    Enable("potw_zonel_camera.Trigger_Wreck")
    Enable("potw_zonel_camera.Trigger_WreckTop")
    MoveToEntity("potw_zonel_camera.CameraTrigger_MainIsland", "potw_zonel_camera.Marker(Parentable)_MoveTriggerDown")
    Enable("potw_zonel_camera.CameraTrigger_MainIsland")
    ClearAllCameraAttributesTimed(1)
  end
end
PotW_SkullRock_Wreck_ExitSpline = L0_0
function L0_0()
  Print("ENTER WRECK TOP")
  PlayerInWreckTopVolume = true
  if PlayerDirectionWreckTopVolume == "Out" then
    Print("############## WRECK TOP OUT")
    SetCameraAttributes("potw_zonel_camera.Marker(CameraOverride)_WreckTop_Out")
  else
    SetCameraAttributes("potw_zonel_camera.Marker(CameraOverride)_WreckTop_In")
    Print("############## WRECK TOP IN")
  end
  Disable("potw_zonel_camera.Trigger_Wreck")
  Disable("potw_zonel_camera.CameraTrigger_MainIsland")
  MoveToEntity("potw_zonel_camera.CameraTrigger_MainIsland", "potw_zonel_camera.Marker(Parentable)_MoveTriggerUp")
  Print("ENTER WRECK TOP - FINISH")
end
PotW_SkullRock_WreckTop_Enter = L0_0
function L0_0()
  Print("EXIT WRECK TOP")
  PlayerInWreckTopVolume = false
  Disable("potw_zonel_camera.Trigger_WreckTop")
  Wait(0.1)
  Enable("potw_zonel_camera.Trigger_Wreck")
  MoveToEntity("potw_zonel_camera.CameraTrigger_MainIsland", "potw_zonel_camera.Marker(Parentable)_MoveTriggerDown")
  Enable("potw_zonel_camera.CameraTrigger_MainIsland")
  Wait(0.1)
  if PlayerInWreckVolume == false and PlayerInMainIslandVolume == false then
    Print("ENABLE WRECK TOP")
    Enable("potw_zonel_camera.Trigger_WreckTop")
    ClearAllCameraAttributesTimed(2)
  end
  if PlayerInMainIslandVolume == true then
    Print("ENABLE WRECK TOP - 2")
    Enable("potw_zonel_camera.Trigger_WreckTop")
  end
  Print("ENABLE WRECK TOP - FINISH")
end
PotW_SkullRock_WreckTop_Exit = L0_0
L0_0 = false
PlayerInSplineVolume = L0_0
L0_0 = false
PlayerInSideVolume = L0_0
function L0_0()
  PlayerInSplineVolume = false
  Disable("potw_zonel_camera.CameraTrigger_Eyes")
  Wait(0.1)
  Enable("potw_zonel_camera.CameraTrigger_StairsToEyes")
  Wait(0.1)
  if PlayerInSideVolume == false then
    Enable("potw_zonel_camera.CameraTrigger_Eyes")
    ClearAllCameraAttributesTimed(1)
  end
end
PotW_SkullRock_ExitSpline = L0_0
function L0_0()
  PlayerInSideVolume = false
  Disable("potw_zonel_camera.CameraTrigger_StairsToEyes")
  Wait(0.1)
  Enable("potw_zonel_camera.CameraTrigger_Eyes")
  Wait(0.1)
  if PlayerInSplineVolume == false then
    Enable("potw_zonel_camera.CameraTrigger_StairsToEyes")
    ClearAllCameraAttributesTimed(1)
  end
end
PotW_SkullRock_ExitSide = L0_0
function L0_0()
  PlayerInSplineVolume = true
  SetCameraAttributes("potw_zonel_camera.CameraEyes")
  ToggleCameraOcclusion(GetPlayer(), false)
  Disable("potw_zonel_camera.CameraTrigger_StairsToEyes")
end
PotW_SkullRock_EnterSpline = L0_0
function L0_0()
  PlayerInSideVolume = true
  SetCameraAttributes("potw_zonel_camera.CameraLanding")
  ToggleCameraOcclusion(GetPlayer(), false)
  Disable("potw_zonel_camera.CameraTrigger_Eyes")
end
PotW_SkullRock_EnterSide = L0_0
function L0_0()
  RestrictCutSceneInput()
  StartFadeOut(0.8)
  GrabCamera("potw_zonel_camera.Camera_SunkenBoat", "potw_zonel_camera.CameraMarker_SunkenBoat", CAMERA_INSTANT_TRANSITION, 0)
  StartFadeIn()
end
PotW_SunkenBoatCameraStart = L0_0
function L0_0()
  StartFadeOut(0.8)
  ReleaseCamera(CAMERA_INSTANT_TRANSITION, 0)
  StartFadeIn()
  UnrestrictCutSceneInput()
end
PotW_SunkenBoatCameraEnd = L0_0
L0_0 = false
PlayerInDaisyVolume = L0_0
function L0_0()
  PlayerInDaisyVolume = true
  SetCameraAttributes("potw_zonel_camera.CameraDaisy")
  ToggleCameraOcclusion(GetPlayer(), false)
end
PotW_SkullRock_DaisyLandingStart = L0_0
function L0_0()
  PlayerInDaisyVolume = false
  Wait(1)
  if PlayerInDaisyVolume == false then
    ClearAllCameraAttributesTimed(2)
  end
end
PotW_SkullRock_DaisyLandingEnd = L0_0
function L0_0()
  AnimGBSequence("potw_zonel_dynamic.BW_Spawner_OuterDoors", "Open")
  AnimGBSequence("potw_zonel_dynamic.BW_Spawner_Parts", "Loop")
  Wait(1.5)
  AnimGBSequence("potw_zonel_dynamic.BW_Spawner_InnerDoors", "Open")
  AnimGBSequence("potw_zonel_dynamic.BW_Spawner_Orb", "Open")
  Wait(5)
  AnimGBSequence("potw_zonel_dynamic.BW_Spawner_InnerDoors", "Close")
  AnimGBSequence("potw_zonel_dynamic.BW_Spawner_Orb", "Close")
  Wait(2)
  AnimGBSequence("potw_zonel_dynamic.BW_Spawner_OuterDoors", "Close")
  AnimGBSequence("potw_zonel_dynamic.BW_Spawner_Parts", "Rest")
end
PotW_BW_Spawner_Open = L0_0
function L0_0()
  AnimGBSequence("potw_zonel_dynamic.BW_Spawner_InnerDoors", "Close")
  AnimGBSequence("potw_zonel_dynamic.BW_Spawner_Orb", "Close")
end
PotW_BW_Spawner_CloseInner = L0_0
function L0_0()
  AnimGBSequence("potw_zonel_dynamic.BW_Spawner_OuterDoors", "Close")
  AnimGBSequence("potw_zonel_dynamic.BW_Spawner_Parts", "Rest")
end
PotW_BW_Spawner_CloseOuter = L0_0
L0_0 = 0
PotW_SR_ForceSketchToon_Var = L0_0
function L0_0()
  if PotW_SR_ForceSketchToon_Var == 1 then
    ForceSketched("potw_zonel_dynamic.P_ZoneL_Toon13")
  end
end
PotW_SR_ForceSketchToon = L0_0
function L0_0(A0_26)
  local L1_27
end
PotW_SR_ChangeHome = L0_0
function L0_0()
  SetCameraAttributes("potw_zonel_scripting.SmeeBoat_CameraOverride")
  wait(1)
  FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_Ship_Intro")
  wait(3.5)
  ClearAllCameraAttributesTimed(1)
end
PotW_SR_SmeeBoatHint = L0_0
function L0_0()
  Print("HELLO")
  FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "E3_PotW_SR_ChestReward")
end
PotW_SR_PinDialog = L0_0
function L0_0()
  Wait(0.5)
  RestrictCutSceneInput()
  StartFadeOut(1)
  wait(2)
  DisableGuardianSystem()
  PlayerHasSketchAbilities(false)
  PlayerHasPaintThinnerAbilities(false)
  DoStinger("IGC", 10)
  Print("####################### Print 1 START")
  Print("####################### Print 2 FOG")
  ForEachEntityInGroup(Unhide, "potw_zonel_igc.P_Rocks_E3_A 01")
  Unhide("potw_zonel_igc.SmeeBoat 02")
  Print("####################### Print 3 UNHIDE")
  AudioPostEventOn(GetPlayer(), "Stop_PotW_music")
  AudioPostEventOn(GetPlayer(), "Stop_sfx_POTW_AMB")
  AudioPostEventOn(GetPlayer(), "Play_sfx_E3_outro")
  DisableMotion_Player(GetPlayer())
  TeleportToEntity(GetPlayer(), "potw_zonel_igc.Marker(ParentRotator) 01")
  SetParentEntity(GetPlayer(), "potw_zonel_igc.Marker(ParentRotator) 01")
  Print("####################### Print 4 TELEPORT")
  AnimEvent(GetPlayer(), EVENT_Special_2)
  Print("####################### Print 5 SPECIAL ANIMS")
  StartFadeInNoHUD()
  GrabCameraNif("potw_zonel_igc.E3_Outro_Cam 01", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("potw_zonel_igc.E3_Outro_Cam 01")
  AnimGBReset("potw_zonel_igc.SmeeBoat 02")
  AnimGBSequence("potw_zonel_igc.E3_Outro_Cam 01", "E3_Outro_Cam")
  AnimGBSequence("potw_zonel_igc.SmeeBoat 02", "E3_Outro_SmeeBoat")
  Print("####################### Print 6 ALL SEQ")
  wait(9.5)
  StartFadeOut(1.5)
  Wait(1.5)
  UnrestrictCutSceneInput()
  Print("####################### Print 7 END")
  PotW_SkullRockToJollyRoger_Teleport()
  Print("####################### Print 8 TELEPORT")
end
potw_OutroIGC = L0_0
function L0_0()
  local L0_28
  L0_28 = Wait
  L0_28(0.5)
  L0_28 = RestrictCutSceneInput
  L0_28()
  L0_28 = StartFadeOut
  L0_28(1)
  L0_28 = wait
  L0_28(2)
  L0_28 = DisableGuardianSystem
  L0_28()
  L0_28 = PlayerHasSketchAbilities
  L0_28(false)
  L0_28 = PlayerHasPaintThinnerAbilities
  L0_28(false)
  L0_28 = BeginFogChanges
  L0_28()
  L0_28 = vector4
  L0_28 = L0_28(0.12549019607843137, 0.19215686274509805, 0.23529411764705882, 0)
  SetFogColor(L0_28)
  SetFogStart(500)
  SetFogEnd(600)
  SetFogType(7)
  SetFogEnable(true)
  EndFogChanges(5)
  ForEachEntityInGroup(Unhide, "potw_zonel_igc.P_Rocks_E3_A 01")
  Unhide("potw_zonel_igc.JollyRoger 01")
  Unhide("potw_zonel_igc.SmeeBoat 02")
  ForEachEntityInGroup(Hide, "MK_drippy_effects")
  AudioPostEventOn(GetPlayer(), "Stop_PotW_music")
  AudioPostEventOn(GetPlayer(), "Stop_sfx_POTW_AMB")
  AudioPostEventOn(GetPlayer(), "Play_sfx_E3_outro")
  DisableMotion_Player(GetPlayer())
  TeleportToEntity(GetPlayer(), "potw_zonel_igc.Marker(ParentRotator) 01")
  SetParentEntity(GetPlayer(), "potw_zonel_igc.Marker(ParentRotator) 01")
  AnimEvent(GetPlayer(), EVENT_Special_2)
  StartFadeInNoHUD()
  GrabCameraNif("potw_zonel_igc.E3_Outro_Cam 01", nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset("potw_zonel_igc.E3_Outro_Cam 01")
  AnimGBReset("potw_zonel_igc.JollyRoger 01")
  AnimGBReset("potw_zonel_igc.SmeeBoat 02")
  AnimGBSequence("potw_zonel_igc.E3_Outro_Cam 01", "E3_Outro_Cam")
  AnimGBSequence("potw_zonel_igc.JollyRoger 01", "E3_Outro_JollyRoger")
  AnimGBSequence("potw_zonel_igc.SmeeBoat 02", "E3_Outro_SmeeBoat")
  wait(9.5)
  StartFadeOut(1.5)
  wait(0.5)
  AudioPostEventOn(GetPlayer(), "Play_sfx_E3_outro_HookLaff")
  wait(5)
  PlayMovie(GetPlayer(), "ComingSoon_TEMP.bik")
  wait(3)
  CleanLoadLevel("Environments/StartScreen.gsa")
  ClearParent(GetPlayer())
  MoveToEntity(GetPlayer(), "potw_zoneL.From2DStart")
  StartFadeIn()
  EnableMotion_Player(GetPlayer())
  CameraReset()
  UnrestrictCutSceneInput()
end
PotW_E3_Outro = L0_0
L0_0 = 0
SpatterKilledCount = L0_0
L0_0 = 0
SpatterFriendedCount = L0_0
function L0_0()
  SpatterKilledCount = SpatterKilledCount + 1
  PotW_SR_PlayStyle()
end
PotW_SR_IncSpatterKilledCount = L0_0
function L0_0()
  SpatterFriendedCount = SpatterFriendedCount + 1
  PotW_SR_PlayStyle()
end
PotW_SR_IncSpatterFriendedCount = L0_0
function L0_0()
  if SpatterKilledCount == 3 then
    FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_PlayStyle_1")
  elseif SpatterKilledCount == 8 then
    FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_PlayStyle_2")
  elseif SpatterFriendedCount == 3 then
    FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_PlayStyle_3")
  end
end
PotW_SR_PlayStyle = L0_0
function L0_0()
  if SpatterKilledCount == 0 then
    FireSequence("potw_zonel_dynamic.Marker(Conversation)_Gus", "PotW_SR_PlayStyle_4")
  end
end
PotW_SR_PlayStyle_4 = L0_0
function L0_0(A0_29, A1_30)
  DisableGuardianHint("potw_zonel_scripting.PlayerHintMarkers 0" .. A1_30)
end
potw_DisableHint = L0_0
function L0_0()
  Print("TURNING OFF WANDER!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
  AIBSetTetherLoc("potw_zonel_ai.PetePan 01", GetPosition("potw_zonel_ai.PetePan 01"))
  SetPropertyFloat("potw_zonel_ai.PetePan 01", "Wander Radius", 0.1)
  ClearNextPatrolNode("potw_zonel_ai.PetePan 01")
end
StopPetePanWander = L0_0
function L0_0()
  Print("TURNING ON WANDER!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
  SetPropertyFloat("potw_zonel_ai.PetePan 01", "Wander Radius", 0)
  SetNextPatrolNode("potw_zonel_ai.PetePan 01", "potw_zonel_ai.PatrolNode 39")
end
StartPetePanWander = L0_0
