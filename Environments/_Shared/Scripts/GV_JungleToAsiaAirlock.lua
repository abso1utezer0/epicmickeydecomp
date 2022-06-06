local L0_0, L1_1
function L0_0()
  local L0_2
  L0_2 = "gv_jungletoasiaairlock.SmallWorldPete"
  EnterCutscene(L0_2)
  AnimVarInt(L0_2, VAR_Cutscene, 19)
  AnimEvent(L0_2, EVENT_Start_Cutscene)
  SetNextPatrolNode(L0_2, "gv_jungletoasiaairlock.PatrolNode 04")
  Wait(3.5)
  FireUser3("GV_JTA_PeteCamera")
  Wait(0.8)
  DestroyEntity(L0_2)
end
GV_JTA_PeteLeave = L0_0
L0_0 = 0
GV_AAL_Valve01 = L0_0
L0_0 = 0
GV_AAL_Valve02 = L0_0
L0_0 = 0
GV_AAL_Valve03 = L0_0
L0_0 = 0
GV_JTA_Solution = L0_0
L0_0 = 0
GV_JTA_TimerOperation = L0_0
L0_0 = 0
GV_JTA_NeverSpun = L0_0
L0_0 = 0
GV_JTA_PlateFirst = L0_0
function L0_0()
  if GV_JTA_PlateFirst == 0 then
    FireSequence("gv_jungletoasiaairlock.ConversationalTrigger 01", "GV_JTA_HitValve")
    ForEachEntityInGroup(Disable, "GV_JTA_SteamTriggers")
    ForEachEntityInGroup(StopEmitters, "GV_JTA_SteamEmitters")
    GV_JTA_PlateFirst = 1
  elseif GV_JTA_PlateFirst == 1 then
    GV_JTA_Timer()
  end
end
GV_JTA_FirstTimeOnPlate = L0_0
function L0_0()
  if GV_JTA_TimerOperation == 0 then
    Print("########### TIMER OPER 0")
    ForEachEntityInGroup(Disable, "GV_JTA_SteamTriggers")
    ForEachEntityInGroup(StopEmitters, "GV_JTA_SteamEmitters")
    GV_JTA_TimerOperation = 1
    GV_AAL_Valve01 = 1
    GV_AAL_Valve02 = 1
    GV_AAL_Valve03 = 1
    TimerStart(10, 5, 2)
    GV_JTA_TimerEnd()
  elseif GV_JTA_TimerOperation == 1 then
    Print("########### TIMER OPER 1")
    ForEachEntityInGroup(Disable, "GV_JTA_SteamTriggers")
    ForEachEntityInGroup(StopEmitters, "GV_JTA_SteamEmitters")
    GV_AAL_Valve01 = 1
    GV_AAL_Valve02 = 1
    GV_AAL_Valve03 = 1
    TimerSetTime(10)
    GV_JTA_TimerEnd()
  end
end
GV_JTA_Timer = L0_0
function L0_0()
  local L0_3
  L0_3 = Print
  L0_3("########### TIMER END FUNCTION")
  L0_3 = TimerGetState
  L0_3 = L0_3()
  L0_3 = "Ticking"
  while L0_3 == "Ticking" do
    wait(0.25)
    L0_3 = TimerGetState()
  end
  GV_JTA_PuzzleSolveCheck()
end
GV_JTA_TimerEnd = L0_0
function L0_0()
  Print("########### PUZZLE CHECK")
  if GV_JTA_Solution == 3 then
    Print("######### PUZZLE CHECK IS 3")
    TimerStop()
    ForEachEntityInGroup(StopEmitters, "GV_JTA_SteamEmitters")
    ForEachEntityInGroup(DestroyEntity, "GV_JTA_SteamTriggers")
    AudioPostEventOn("gv_jungletoasiaairlock_audio.Sound_Steam_1", "Stop_sfx_GV_Steam")
    AudioPostEventOn("gv_jungletoasiaairlock_audio.Sound_Steam_2", "Stop_sfx_GV_Steam")
    AudioPostEventOn("gv_jungletoasiaairlock_audio.Sound_Steam_3", "Stop_sfx_GV_Steam")
    GV_AAL_Valve01 = 2
    GV_AAL_Valve02 = 2
    GV_AAL_Valve03 = 2
    GV_JTA_TimerOperation = 3
  elseif GV_JTA_Solution ~= 3 then
    Print("######### PUZZLE CHECK NOT 3")
    ForEachEntityInGroup(Enable, "GV_JTA_SteamTriggers")
    ForEachEntityInGroup(StartEmitters, "GV_JTA_SteamEmitters")
    GV_AAL_Valve01 = 0
    GV_AAL_Valve02 = 0
    GV_AAL_Valve03 = 0
    GV_JTA_TimerOperation = 0
    GV_JTA_Solution = 0
    AudioPostEventOn("gv_jungletoasiaairlock_audio.Sound_Steam_1", "Play_sfx_GV_Steam")
    AudioPostEventOn("gv_jungletoasiaairlock_audio.Sound_Steam_2", "Play_sfx_GV_Steam")
    AudioPostEventOn("gv_jungletoasiaairlock_audio.Sound_Steam_3", "Play_sfx_GV_Steam")
    ForEachEntityInGroup(AnimGBSequence, "GV_JTA_Valves", "Rest")
    Wait(0.8)
    if GV_JTA_NeverSpun == 0 then
      FireSequence("gv_jungletoasiaairlock.ConversationalTrigger 01", "Genric Line 13")
    elseif GV_JTA_NeverSpun >= 1 then
      FireSequence("gv_jungletoasiaairlock.ConversationalTrigger 01", "GV_ZoneD_Valve_Steamreset")
    end
  end
end
GV_JTA_PuzzleSolveCheck = L0_0
function L0_0(A0_4)
  if GV_AAL_Valve01 == 0 then
    FireSequence("gv_jungletoasiaairlock.ConversationalTrigger 01", "GV_ZoneD_StoppedValve")
  elseif GV_AAL_Valve01 == 1 then
    GV_AAL_Valve01 = 2
    FireSequence("gv_jungletoasiaairlock.ConversationalTrigger 01", "GV_Airlock_Encourage")
    GV_JTA_Solution = GV_JTA_Solution + 1
    AudioPostEventOn("gv_jungletoasiaairlock.GV_ZoneF_Valve_Inert01", "Play_sfx_GV_Faucet_Turn")
    AnimGBSequence(A0_4, "Spin")
    GV_JTA_NeverSpun = GV_JTA_NeverSpun + 1
    GV_JTA_PeteIntroMaster()
  elseif GV_AAL_Valve01 == 2 then
    FireSequence("gv_jungletoasiaairlock.ConversationalTrigger 01", "GV_Airlock_ValveStuck")
    AudioPostEventOn("gv_jungletoasiaairlock.GV_ZoneF_Valve_Inert01", "Play_sfx_GV_Faucet_Stuck")
  end
end
GV_AAL_Valve01Function = L0_0
function L0_0(A0_5)
  if GV_AAL_Valve02 == 0 then
    FireSequence("gv_jungletoasiaairlock.ConversationalTrigger 01", "GV_ZoneD_StoppedValve")
  elseif GV_AAL_Valve02 == 1 then
    GV_AAL_Valve02 = 2
    AudioPostEventOn("gv_jungletoasiaairlock.GV_ZoneF_Valve_Inert01", "Play_sfx_GV_Faucet_Turn")
    AnimGBSequence(A0_5, "Spin")
    GV_JTA_Solution = GV_JTA_Solution + 1
    GV_JTA_NeverSpun = GV_JTA_NeverSpun + 1
    GV_JTA_PeteIntroMaster()
  elseif GV_AAL_Valve02 == 2 then
    FireSequence("gv_jungletoasiaairlock.ConversationalTrigger 01", "GV_Airlock_ValveStuck")
    AudioPostEventOn("gv_jungletoasiaairlock.GV_ZoneF_Valve_Inert02", "Play_sfx_GV_Faucet_Stuck")
  end
end
GV_AAL_Valve02Function = L0_0
function L0_0(A0_6)
  if GV_AAL_Valve03 == 0 then
    FireSequence("gv_jungletoasiaairlock.ConversationalTrigger 01", "GV_ZoneD_StoppedValve")
  elseif GV_AAL_Valve03 == 1 then
    GV_AAL_Valve03 = 2
    GV_JTA_Solution = GV_JTA_Solution + 1
    GV_JTA_NeverSpun = GV_JTA_NeverSpun + 1
    AudioPostEventOn("gv_jungletoasiaairlock.GV_ZoneF_Valve_Inert03", "Play_sfx_GV_Faucet_Turn")
    AnimGBSequence(A0_6, "Spin")
    GV_JTA_PeteIntroMaster()
  elseif GV_AAL_Valve03 == 2 then
    FireSequence("gv_jungletoasiaairlock.ConversationalTrigger 01", "GV_Airlock_ValveStuck")
    AudioPostEventOn("gv_jungletoasiaairlock.GV_ZoneF_Valve_Inert03", "Play_sfx_GV_Faucet_Stuck")
  end
end
GV_AAL_Valve03Function = L0_0
function L0_0()
  if GV_JTA_Solution == 3 then
    TimerStop()
    WaitForLevelLoad()
    ForceSpawn("gv_jungletoasiaairlock.Spawner 01", 1)
    Enable("gremlinvillage_zoned.Trigger_PeteIntro")
    FireUser1("GV_JTA_PeteCamera")
    AudioPostEventOn(GetPlayer(), "Play_MX_GV_Pete_Introduction")
    Wait(0.8)
    MoveToEntity(GetPlayer(), "GV_JTA_MickeyDuringPeteIGC")
    SetNextPatrolNode("gv_jungletoasiaairlock.SmallWorldPete", "gv_jungletoasiaairlock.PatrolNode 02")
  end
end
GV_JTA_PeteIntroMaster = L0_0
function L0_0()
  FireSequence("gv_jungletoasiaairlock.ConversationalTrigger 01", "GV_ZoneD_StoppedValve")
end
GV_JTA_TouchedWrongValve = L0_0
function L0_0()
  AnimGBSequence("gv_jungletoasiaairlock.ZoneC_ExitDoor 01", "Open")
  FireThread(SetNextPatrolNode, "gv_jungletoasiaairlock.SmallWorldPete", "gv_jungletoasiaairlock.PatrolNode 02")
end
GV_JTA_DoorOpenPeteEnter = L0_0
function L0_0()
  FireSequence("gv_jungletoasiaairlock.SmallWorldPete", "GV_Pete_Intro")
end
GV_JTA_PeteIntro = L0_0
function L0_0()
  DestroyEntity("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01")
  Unhide("GV_JTA_EntranceDoor")
  AnimGBSequence("GV_JTA_EntranceDoor", "Close")
  Wait(0.8)
  AudioPostEventOn(GetPlayer(), "Play_sfx_JAB_Airlock_Door_Shut")
  Wait(5)
  SetGlobal("GV_JTA_CameraGlobal", 1)
  ActivateScene("Environments/thepark/fantasyLand/SmallWorld/GSA/GremlinVillage_ZoneD.gsa")
  StreamZones(nil, "stream_4")
  wait(2)
  GV_JTA_SaveCheckpoint("GV_JungletoAsiaAirlock_Start")
  Cleanup_GV_ZoneC2()
end
GV_JTA_Camera1GlobalSet = L0_0
function L0_0(A0_7)
  SaveCheckpoint(GetPlayer(), "GV_JTA_LoadCheckpoint", A0_7)
end
GV_JTA_SaveCheckpoint = L0_0
function L0_0()
  GV_JTA_EntranceDoorHidden = true
  AudioPostEventOn(GetPlayer(), "Set_State_Amb_GV_Slalom_TunnelRoom")
  if GetGlobal("GV_Airlock_DoorsShut_Played") == 1 then
    AnimGBSequence("GV_JTA_EntranceDoor", "Close", false, 0, 2)
    DestroyEntity("gv_jungletoasiaairlock.PlaneTrigger_Intro")
    DestroyEntity("gv_jungletoasiaairlock_audio.PlaneTrigger_Entry")
    AudioPostEventOn("gv_jungletoasiaairlock_audio.Sound_Steam_1", "Play_sfx_GV_Steam")
    AudioPostEventOn("gv_jungletoasiaairlock_audio.Sound_Steam_2", "Play_sfx_GV_Steam")
    AudioPostEventOn("gv_jungletoasiaairlock_audio.Sound_Steam_3", "Play_sfx_GV_Steam")
  end
  if GetGlobal("GV_Pete_Intro_Played") == 1 then
    WaitForLevelLoad()
    AnimGBSequence("gv_jungletoasiaairlock.ZoneC_ExitDoor 01", "Open", false, 0, 2)
    ForEachEntityInGroup(StopEmitters, "GV_JTA_SteamEmitters")
    ForEachEntityInGroup(DestroyEntity, "GV_JTA_SteamTriggers")
    GV_AAL_Valve01 = 2
    GV_AAL_Valve02 = 2
    GV_AAL_Valve03 = 2
    GV_JTA_TimerOperation = 3
  end
end
GV_JTA_LoadCheckpoint = L0_0
L0_0 = false
GV_JTA_EntranceDoorHidden = L0_0
function L0_0(A0_8)
  if GV_JTA_EntranceDoorHidden == false then
    Hide(A0_8)
  end
end
GV_JTA_HideEntranceDoor = L0_0
function L0_0()
  local L0_9, L1_10
  GV_JTA_Camera1GlobalSet = L0_9
  L0_9 = nil
  GV_AAL_Valve02Function = L0_9
  L0_9 = nil
  GV_JTA_TouchedWrongValve = L0_9
  L0_9 = nil
  GV_JTA_PeteIntro = L0_9
  L0_9 = nil
  GV_AAL_Valve03Function = L0_9
  L0_9 = nil
  GV_JTA_SaveCheckpoint = L0_9
  L0_9 = nil
  GV_JTA_LoadCheckpoint = L0_9
  L0_9 = nil
  GV_AAL_Valve01Function = L0_9
  L0_9 = nil
  GV_JTA_PeteLeave = L0_9
  L0_9 = nil
  GV_JTA_DoorOpenPeteEnter = L0_9
  L0_9 = nil
  GV_JTA_HideEntranceDoor = L0_9
  L0_9 = nil
  Cleanup_GV_JungleToAsiaAirlock = L0_9
end
Cleanup_GV_JungleToAsiaAirlock = L0_0
