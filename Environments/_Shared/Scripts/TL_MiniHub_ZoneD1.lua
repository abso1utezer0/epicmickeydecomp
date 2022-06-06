local L0_0, L1_1, L2_2, L3_3, L4_4
function L0_0()
  if GetGlobal("TLMH_ZD1_Gus_GotAPin_Played") == 0 then
    Hide("tl_minihub_zoned1.seq_openchest 01.Chest")
  end
end
TL_ZoneD1_UfoArenaChest = L0_0
function L0_0()
  if GetGlobal("TLMH_ZD1_Gus_GotAPin_Played") == 0 and GetGlobal("TLMH_ZD1_Roger_UFOChallenge_Played") == 1 then
  else
    Hide("tl_minihub_zoned1.TriggerRotate 04")
  end
end
TL_ZoneD1_UfoArenaTrigger = L0_0
function L0_0()
  Print("^&^&^&^&^&^&^&^&^&^&Spawning FX")
  ForEachEntityInGroup(ForceSpawn, "teleportFX", 1)
  wait(1)
  ForceSpawn("tl_minihub_zoned1.Spawner 01", 1)
  wait(0.1)
  ForceSpawn("tl_minihub_zoned1.Spawner 02", 1)
  wait(0.1)
  ForceSpawn("tl_minihub_zoned1.Spawner 03", 1)
  wait(0.1)
  ForceSpawn("tl_minihub_zoned1.Spawner 04", 1)
  wait(0.1)
  ForceSpawn("tl_minihub_zoned1.Spawner 05", 1)
  wait(0.1)
  ForceSpawn("tl_minihub_zoned1.Spawner 06", 1)
end
TL_CarouselArenaStart = L0_0
L0_0 = 6
TL_ZoneD1_UFOArenaEnemies = L0_0
function L0_0(A0_5, A1_6)
  if GetCurrentTeam(A0_5) == 2 then
    _G[A1_6] = _G[A1_6] + 1
  elseif GetCurrentTeam(A0_5) == 3 then
    _G[A1_6] = _G[A1_6] - 1
  end
  TL_ZoneD1_FloorClear(A1_6)
end
TL_ZoneD1_EnemyTeamChange = L0_0
function L0_0(A0_7, A1_8)
  if GetCurrentTeam(A0_7) == 2 then
    _G[A1_8] = _G[A1_8] - 1
  end
  TL_ZoneD1_FloorClear(A1_8)
end
DBC_ZoneM_EnemyDeath = L0_0
function L0_0(A0_9)
  if _G[A0_9] == 0 then
    _G[A0_9] = 500
    if GetGlobal("TLMH_ZD1_Gus_GotAPin_Played") == 0 then
      FireUser1("UFOChestFancyCam")
      wait(0.8)
      MoveToEntity(GetPlayer(), "tl_minihub_zoned1_igc.UFOChallengeMickeyMarker")
      wait(1)
      FireSequence("tl_minihub_zoned1_story.Gus", "TLMH_ZD1_Gus_GotAPin")
      ForceSpawn("SpawnerFXChest", 1)
      wait(1)
      Unhide("tl_minihub_zoned1.seq_openchest 01.Chest")
    end
  end
end
TL_ZoneD1_FloorClear = L0_0
function L0_0()
  if GetGlobal("TL_Pillar2Steam") == 1 then
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Falling_Block03 01", "rise")
    wait(1.36)
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Falling_Block03 01", "bob")
  elseif GetGlobal("TL_Pillar2Steam") == 0 then
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Falling_Block03 01", "fall")
  end
end
TL_FallingBlock2 = L0_0
L0_0 = 0
function L1_1()
  if _UPVALUE0_ == 0 then
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Falling_Block03 01", "fall")
  end
end
DropBlock03 = L1_1
function L1_1()
  local L1_10
  L1_10 = 1
  _UPVALUE0_ = L1_10
end
CancelDropBlock03 = L1_1
function L1_1()
  SetGlobal("TL_Pillar2Steam", 1)
  AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Falling_Block03 01", "rise")
  wait(1.36)
  AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Falling_Block03 01", "bob")
end
TL_FallingBlock3 = L1_1
function L1_1()
  SetGlobal("TL_Pillar2Steam", 0)
  AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Falling_Block03 01", "fall")
end
TL_FallingBlock4 = L1_1
function L1_1()
  SetGlobal("TL_RaisingBlock", GetGlobal("TL_RaisingBlock") + 1)
  if GetGlobal("TL_RaisingBlock") == 1 then
  elseif GetGlobal("TL_RaisingBlock") == 2 then
    ForEachEntityInGroup(Unhide, "LagoonPlatformUnhideGroup")
  end
end
TL_RaisingBlock1 = L1_1
function L1_1()
  SetGlobal("TL_Brackets", GetGlobal("TL_Brackets") + 1)
  if GetGlobal("TL_Pillar1Down") == 0 then
  end
  if GetGlobal("TL_Brackets") == 3 and GetGlobal("TL_Pillar1Down") == 0 then
    FireUser1("tl_minihub_zoned1_igc.grabcamerafancy 02.FancyCameraLookAt 01")
    SetGlobal("TL_Pillar1Down", 1)
    wait(1)
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Falling_Block01 01", "fall")
    wait(0.5)
    ShakeCamera(0.5, 10, 0, 0.75, 0.01, 0.01)
    wait(3.5)
    ShakeCamera(0.5, 10, 0, 0.75, 0.01, 0.01)
  end
end
TL_FallingBlock1Thinned = L1_1
function L1_1()
  SetGlobal("TL_Brackets", GetGlobal("TL_Brackets") - 1)
end
TL_FallingBlock1Painted = L1_1
function L1_1(A0_11, A1_12)
  local L2_13, L3_14, L4_15, L5_16
  for L5_16 = 1, 5 do
    ForEachEntityInGroup(StopEmitters, A1_12)
    wait(0.5)
    ForEachEntityInGroup(Hide, A1_12)
    AudioPostEventOn(A1_12, "Play_sfx_TC_TCL_Env_ThinnerGusher_Stop")
    wait(1)
    ForEachEntityInGroup(Unhide, A1_12)
    ForEachEntityInGroup(StartEmitters, A1_12)
    AudioPostEventOn(A1_12, "Play_sfx_TC_TCL_Env_ThinnerGusher_Start")
    ForceSketched("tl_minihub_zoned1.TL_MiniHub_ZoneD_Toon019 01")
    wait(1)
  end
end
TL_SteamJet1 = L1_1
function L1_1(A0_17, A1_18)
  local L2_19, L3_20, L4_21, L5_22
  for L5_22 = 1, 5 do
    ForEachEntityInGroup(StopEmitters, A1_18)
    wait(0.5)
    ForEachEntityInGroup(Hide, A1_18)
    AudioPostEventOn(A1_18, "Play_sfx_TC_TCL_Env_ThinnerGusher_Stop")
    wait(1)
    ForEachEntityInGroup(Unhide, A1_18)
    ForEachEntityInGroup(StartEmitters, A1_18)
    AudioPostEventOn(A1_18, "Play_sfx_TC_TCL_Env_ThinnerGusher_Start")
    ForceSketched("tl_minihub_zoned1.TL_MiniHub_ZoneD_Toon018 01")
    wait(1)
  end
end
TL_SteamJet2 = L1_1
L1_1 = 0
Fallingblock2played = L1_1
L1_1 = 0
Fallingblock2Setup = L1_1
function L1_1()
  local L0_23, L1_24
  L0_23 = Fallingblock2played
  if L0_23 == 0 then
    L0_23 = Fallingblock2Setup
    if L0_23 == 0 then
      L0_23 = 1
      Fallingblock2Setup = L0_23
    end
  end
end
TL_FallingBlock2CameraSetup = L1_1
function L1_1()
  if Fallingblock2played == 0 and Fallingblock2Setup == 1 then
    Fallingblock2played = 1
    Fallingblock2Setup = 35
    FireUser1("tl_minihub_zoned1_igc.grabcamerafancy 03.FancyCameraLookAt 01")
    wait(1)
    Unhide("Block2ThinnerSprayFX")
    StartEmitters("Block2ThinnerSprayFX")
    ForceSketched("Block2Toon")
    wait(2)
    wait(0.6)
    ShakeCamera(0.5, 10, 0, 0.75, 0.01, 0.01)
    wait(0.4)
    wait(0.8)
    StopEmitters("Block2ThinnerSprayFX")
    wait(0.7)
    ShakeCamera(0.5, 10, 0, 0.75, 0.01, 0.01)
    wait(0.3)
    Hide("Block2ThinnerSprayFX")
    wait(3)
  end
end
TL_FallingBlock2Camera = L1_1
function L1_1()
  SetGlobal("TL_WaterfallShrinkL", GetGlobal("TL_WaterfallShrinkL") + 1)
  SetGlobal("TL_WaterfallShrink", GetGlobal("TL_WaterfallShrink") + 1)
  if GetGlobal("TL_WaterfallShrink") < 8 then
    SetGlobal("TL_valve_Countdown", GetGlobal("TL_valve_Countdown") - 1)
  end
  if GetGlobal("TL_WaterfallShrink") == 7 then
    SetGlobal("TL_QuestUpdateCount", 1)
  end
  if GetGlobal("TL_WaterfallShrink") == 8 then
    SetGlobal("TL_D1_DiagSkip", 1)
  end
  FireUser1("tl_minihub_zoned1_igc.grabcamerafancy 01.FancyCameraLookAt 01")
  wait(2)
  if GetGlobal("TL_WaterfallShrinkL") == 1 then
    ForEachEntityInGroup(AnimGBSequence, "LeftWaterFall1", "TurnOff")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_TCL_Evnt_ThinnerFalls_Subract")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_01_Controller")
    wait(2)
    ForEachEntityInGroup(Hide, "LeftWaterFall1")
  elseif GetGlobal("TL_WaterfallShrinkL") == 2 then
    ForEachEntityInGroup(AnimGBSequence, "LeftWaterFall2", "TurnOff")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_TCL_Evnt_ThinnerFalls_Subract")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_02_Controller")
    wait(2)
    ForEachEntityInGroup(Hide, "LeftWaterFall2")
  elseif GetGlobal("TL_WaterfallShrinkL") == 3 then
    ForEachEntityInGroup(AnimGBSequence, "LeftWaterFall3", "TurnOff")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_TCL_Evnt_ThinnerFalls_Subract")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_03_Controller")
    wait(2)
    ForEachEntityInGroup(Hide, "LeftWaterFall3")
  elseif GetGlobal("TL_WaterfallShrinkL") == 4 then
    ForEachEntityInGroup(AnimGBSequence, "LeftWaterFall4", "TurnOff")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_TCL_Evnt_ThinnerFalls_Subract")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_04_Controller")
    wait(2)
    ForEachEntityInGroup(Hide, "LeftWaterFall4")
  end
  TL_WaterfallShrink()
end
TL_WaterfallShrinkL = L1_1
function L1_1()
  ForEachEntityInGroup(DestroyEntity, "SpinnerTipGroup")
end
SpinnerTraining = L1_1
function L1_1()
  SetGlobal("TL_WaterfallShrinkR", GetGlobal("TL_WaterfallShrinkR") + 1)
  SetGlobal("TL_WaterfallShrink", GetGlobal("TL_WaterfallShrink") + 1)
  if GetGlobal("TL_WaterfallShrink") < 8 then
    SetGlobal("TL_valve_Countdown", GetGlobal("TL_valve_Countdown") - 1)
  end
  if GetGlobal("TL_WaterfallShrink") == 7 then
    SetGlobal("TL_QuestUpdateCount", 1)
  end
  if GetGlobal("TL_WaterfallShrink") == 8 then
    SetGlobal("TL_D1_DiagSkip", 1)
  end
  FireUser1("tl_minihub_zoned1_igc.grabcamerafancy 01.FancyCameraLookAt 01")
  if GetGlobal("TL_WaterfallShrinkR") == 1 then
    wait(2)
    ForEachEntityInGroup(AnimGBSequence, "RightWaterFall1", "TurnOff")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_TCL_Evnt_ThinnerFalls_Subract")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_05_Controller")
    wait(2)
    ForEachEntityInGroup(Hide, "RightWaterFall1")
  elseif GetGlobal("TL_WaterfallShrinkR") == 2 then
    wait(2)
    ForEachEntityInGroup(AnimGBSequence, "RightWaterFall2", "TurnOff")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_TCL_Evnt_ThinnerFalls_Subract")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_06_Controller")
    wait(2)
    ForEachEntityInGroup(Hide, "RightWaterFall2")
  elseif GetGlobal("TL_WaterfallShrinkR") == 3 then
    wait(2)
    ForEachEntityInGroup(AnimGBSequence, "RightWaterFall3", "TurnOff")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_TCL_Evnt_ThinnerFalls_Subract")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_07_Controller")
    wait(2)
    ForEachEntityInGroup(Hide, "RightWaterFall3")
  end
  TL_WaterfallShrink()
end
TL_WaterfallShrinkR = L1_1
L1_1 = 0
function L2_2()
  local L1_25
  L1_25 = 1
  _UPVALUE0_ = L1_25
end
DontTrapMickeyBehindThinnerFall = L2_2
function L2_2()
  local L1_26
  L1_26 = 0
  _UPVALUE0_ = L1_26
end
ClearTheVolume = L2_2
function L2_2()
  FireSequence("tl_minihub_zoned1hall.ConversationalTrigger 01", "D2 Gus_HallwayChat")
end
QuestupdateThread = L2_2
function L2_2()
  if GetGlobal("TL_WaterfallShrink") > 6 then
    if GetGlobal("TL_ThroughDoor") == 0 and GetGlobal("TL_WaterfallShrink") == 7 then
      AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Gate01 01", "opening")
      FireThread(TL_ExitDoorSteam)
    end
    if GetGlobal("TL_WaterfallShrink") < 8 then
    end
    wait(3)
    if GetGlobal("TL_ThroughDoor") == 0 and GetGlobal("TL_WaterfallShrink") == 7 then
      SetGlobal("TL_ZoneD1_ValveFixMethod", 1)
      TL_ZoneD1_SaveValve()
    elseif GetGlobal("TL_ThroughDoor") == 1 then
      SetGlobal("TL_ThroughDoor", 50)
      SetGlobal("TL_ZoneD1_ValveFixMethod", 50)
      SetGlobal("TL_WaterfallShrink", 3)
    end
    if GetGlobal("TL_WaterfallShrink") > 9 then
      TL_ZoneD1_SaveValve()
    end
    if GetGlobal("TL_ThroughDoor") > 0 then
    end
  end
end
TL_WaterfallShrink = L2_2
function L2_2()
  AudioPostEventOn(GetPlayer(), "Event_TC_Lagoon_MainDoor_open")
  ForEachEntityInGroup(Unhide, "DoorSteam")
  ForEachEntityInGroup(Unhide, "DoorSteam2")
  ForEachEntityInGroup(StartEmitters, "DoorSteam")
  ForEachEntityInGroup(StartEmitters, "DoorSteam2")
  wait(1.5)
  ForEachEntityInGroup(StopEmitters, "DoorSteam")
  wait(0.5)
  ForEachEntityInGroup(Hide, "DoorSteam")
  wait(3)
  ForEachEntityInGroup(StopEmitters, "DoorSteam2")
  wait(0.5)
  ForEachEntityInGroup(Hide, "DoorSteam2")
end
TL_ExitDoorSteam = L2_2
function L2_2()
  SetGlobal("TL_ThroughDoor", 1)
end
TL_ThroughDoorCheck = L2_2
function L2_2()
  StreamInterior(nil, "stream2D_5")
end
ClearInteriorStream = L2_2
function L2_2()
  if GetGlobal("TL_WaterfallShrink") < 7 then
    SetGlobal("TL_WaterfallShrinkL", 4)
    SetGlobal("TL_WaterfallShrinkR", 3)
    SetGlobal("TL_WaterfallShrink", 15)
    ForEachEntityInGroup(Hide, "ThinnerUnhide")
    ForEachEntityInGroup(MultiPosSoundStop, "tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_B_Controller")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 01", "Play_sfx_TC_TCL_Env_ThinnerGusher_Stop")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 02", "Play_sfx_TC_TCL_Env_ThinnerGusher_Stop")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 03", "Play_sfx_TC_TCL_Env_ThinnerGusher_Stop")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 04", "Play_sfx_TC_TCL_Env_ThinnerGusher_Stop")
    TeleportToEntity("tl_minihub_zoned1.TL_MiniHub_Floating_Box01 01", "tl_minihub_zoned1.SplineKnot 05")
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Floating_Box01 01", "rest")
    SplineFollower_SetDisabled("tl_minihub_zoned1.TL_MiniHub_Floating_Box01 01", true)
    wait(2)
    FireUser1("tl_minihub_zoned1_igc.grabcamerafancy 01.FancyCameraLookAt 01")
    FireThread(TelportWilcoOut)
    wait(2)
    ForEachEntityInGroup(Hide, "ThinnersprayGroup1")
    ForEachEntityInGroup(Hide, "ThinnersprayGroup2")
    ForEachEntityInGroup(AnimGBSequence, "RightWaterFall1", "TurnOff")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_TCL_Evnt_ThinnerFalls_Subract")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_01_Controller")
    ForEachEntityInGroup(AnimGBSequence, "LeftWaterFall1", "TurnOff")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_TCL_Evnt_ThinnerFalls_Subract")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_02_Controller")
    wait(2)
    ForEachEntityInGroup(Hide, "LeftWaterFall1")
    ForEachEntityInGroup(Hide, "RightWaterFall1")
    ForEachEntityInGroup(AnimGBSequence, "RightWaterFall2", "TurnOff")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_TCL_Evnt_ThinnerFalls_Subract")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_03_Controller")
    ForEachEntityInGroup(AnimGBSequence, "LeftWaterFall2", "TurnOff")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_TCL_Evnt_ThinnerFalls_Subract")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_04_Controller")
    wait(2)
    ForEachEntityInGroup(Hide, "LeftWaterFall2")
    ForEachEntityInGroup(Hide, "RightWaterFall2")
    ForEachEntityInGroup(AnimGBSequence, "RightWaterFall3", "TurnOff")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_TCL_Evnt_ThinnerFalls_Subract")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_05_Controller")
    ForEachEntityInGroup(AnimGBSequence, "LeftWaterFall3", "TurnOff")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_TCL_Evnt_ThinnerFalls_Subract")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_06_Controller")
    wait(2)
    ForEachEntityInGroup(Hide, "LeftWaterFall3")
    ForEachEntityInGroup(Hide, "RightWaterFall3")
    ForEachEntityInGroup(AnimGBSequence, "LeftWaterFall4", "TurnOff")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_TCL_Evnt_ThinnerFalls_Subract")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_07_Controller")
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Gate01 01", "opening")
    FireThread(TL_ExitDoorSteam)
    wait(1)
    ForEachEntityInGroup(AnimGBSequence, "WaterfallGroup", "TurnOff")
    ForEachEntityInGroup(Hide, "WaterfallGroup")
    ForEachEntityInGroup(Hide, "LeftWaterFall4")
    TL_WaterfallShrink()
    ForEachEntityInGroup(Disable, "TL_ValveUse")
    ForEachEntityInGroup(DisableGlint, "TL_ValveUse")
    ForEachEntityInGroup(DestroyEntity, "TL_ValveHint")
    ForEachEntityInGroup(Unhide, "ThinnerLeakingToon")
    TimerDisable("tl_minihub_zoned1.LogicTimerMarker 01")
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Falling_Block03 01", "fall")
    TimerDisable("tl_minihub_zoned1.LogicTimerMarker 02")
    wait(1)
  elseif GetGlobal("TL_WaterfallShrink") > 6 then
    SetGlobal("TL_WaterfallShrinkL", 4)
    SetGlobal("TL_WaterfallShrinkR", 3)
    SetGlobal("TL_WaterfallShrink", 15)
    ForEachEntityInGroup(Hide, "ThinnerUnhide")
    ForEachEntityInGroup(MultiPosSoundStop, "tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_B_Controller")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 01", "Play_sfx_TC_TCL_Env_ThinnerGusher_Stop")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 02", "Play_sfx_TC_TCL_Env_ThinnerGusher_Stop")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 03", "Play_sfx_TC_TCL_Env_ThinnerGusher_Stop")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 04", "Play_sfx_TC_TCL_Env_ThinnerGusher_Stop")
    wait(2)
    FireUser1("tl_minihub_zoned1_igc.grabcamerafancy 01.FancyCameraLookAt 01")
    FireThread(TelportWilcoOut)
    wait(2)
    ForEachEntityInGroup(Hide, "ThinnersprayGroup1")
    ForEachEntityInGroup(Hide, "ThinnersprayGroup2")
    wait(1)
    ForEachEntityInGroup(AnimGBSequence, "WaterfallGroup", "TurnOff")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_A_Controller")
    ForEachEntityInGroup(Hide, "LeftWaterFall4")
    TL_WaterfallShrink()
    ForEachEntityInGroup(Disable, "TL_ValveUse")
    ForEachEntityInGroup(DisableGlint, "TL_ValveUse")
    ForEachEntityInGroup(DestroyEntity, "TL_ValveHint")
    TimerDisable("tl_minihub_zoned1.LogicTimerMarker 01")
    TimerDisable("tl_minihub_zoned1.LogicTimerMarker 02")
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Falling_Block03 01", "fall")
    wait(1)
    ForEachEntityInGroup(Hide, "WaterfallGroup")
  end
end
WilcoFixWaterfall = L2_2
function L2_2()
  local L0_27
  L0_27 = GetChildEntityByName
  L0_27 = L0_27("GremlinWaterfall", "GremlinWrench")
  Unhide(L0_27)
  DisableMotion("GremlinWaterfall")
  TeleportGremlinToEntity("GremlinWaterfall", "tl_minihub_zoned1_igc.Marker(Rotatable) 01")
  EnterCutscene("GremlinWaterfall")
  AnimVarInt("GremlinWaterfall", VAR_Cutscene, 1)
  AnimEvent("GremlinWaterfall", EVENT_Start_Cutscene)
  DisableMotion("GremlinWaterfall")
  TeleportGremlinToEntity("GremlinWaterfall", "tl_minihub_zoned1_igc.Marker(Rotatable) 02")
  wait(1)
  DestroyEntity("GremlinWaterfall")
end
TelportWilcoOut = L2_2
function L2_2()
  SetGlobal("TL_ThroughDoor", 50)
  SetGlobal("TL_ZoneD1_ValveFixMethod", 50)
  SetGlobal("TL_WaterfallShrink", 3)
  SetGlobal("TLMH_ZD1_Wilco_TimerTalk_Played", 1)
end
Wilcoglobalset = L2_2
L2_2 = 0
SpawnersDead = L2_2
L2_2 = 0
function L3_3(A0_28)
  if _UPVALUE0_ == 0 then
    _UPVALUE0_ = 1
    AnimGBReset("Trapform_Left")
    AnimGBSequence("Trapform_Left", "fall")
    wait(5.2)
    _UPVALUE0_ = 0
  end
end
CheckTrapform_Left = L3_3
L3_3 = 0
function L4_4(A0_29)
  Print("***************************************")
  Print(_UPVALUE0_)
  if _UPVALUE0_ == 0 then
    _UPVALUE0_ = 1
    AnimGBReset("Trapform_Right")
    AnimGBSequence("Trapform_Right", "fall")
    wait(5.6)
    _UPVALUE0_ = 0
  end
end
CheckTrapform_Right = L4_4
function L4_4()
  TeleportGremlinToEntity("UFOgremlin", "tl_minihub_zoned1_igc.Marker(Rotatable) 02")
  wait(1)
  DestroyEntity("UFOgremlin")
end
TeleportOutRoger = L4_4
function L4_4()
  TeleportGremlinToEntity("GremlinWaterfall", "tl_minihub_zoned1_igc.Marker(Rotatable) 02")
  wait(1)
  DestroyEntity("GremlinWaterfall")
end
TeleportOutWilco = L4_4
function L4_4(A0_30)
  DisableGuardianHint(A0_30)
  DestroyEntity(A0_30)
end
TL_ZoneD1_HintDisable = L4_4
L4_4 = false
TL_Nautilis_Done = L4_4
function L4_4()
  if TL_Nautilis_Done == false then
    TL_Nautilis_Done = true
    if GetGlobal("TLMH_ZD1_Gus_Surfacing_Played") == 0 then
      wait(15)
      FireUser1("tl_minihub_zoned1_audio.Trigger_Portal 01")
    else
      FireUser1("tl_minihub_zoned1_audio.Trigger_Portal 01")
    end
    if GetGlobal("TL_ThroughDoor") == 0 then
      if GetGlobal("TL_WaterfallShrink") < 7 then
        FireUser2("tl_minihub_zoned1_audio.Trigger_Portal 01")
      end
      if GetGlobal("TL_WaterfallShrink") < 10 then
        FireUser3("tl_minihub_zoned1_audio.Trigger_Portal 01")
      end
    end
  end
end
TL_FireUser_StartingAudio = L4_4
function L4_4()
  StartTrackingCurrentLevelForScoring("Lagoon")
  SaveCheckpoint(GetPlayer(), "TL_CarouselCameraPan", "tl_minihub_zoned1.ExitProjectorMarker")
end
TL_ZoneD1_SaveCheckpoint = L4_4
function L4_4()
  Wait(1)
  TL_CarouselCameraPan()
end
TL_CarouselCameraPan_From2D = L4_4
function L4_4()
  Mute()
  StartFadeOut(0)
  wait(0)
  wait(0)
  RestrictCutSceneInput()
  StartTrackingCurrentLevelForScoring("Lagoon")
  if GetGlobal("TL_WaterfallShrink") < 3 then
    SetGlobal("TL_WaterfallShrink", 3)
  end
  if GetGlobal("TLMH_ZD1_Gus_Surfacing_Played") == 0 then
    WaitForLevelLoad()
    FireUser1("cameraIntro")
    StartFadeInNoHUD(0.8)
    TeleportToEntity(GetPlayer(), "tl_minihub_zoned1.Marker(Parentable) 02")
    UnrestrictCutSceneInput()
    ForEachEntityInGroup(Hide, "tl_minihub_zoned1.seq_projector 01.ProjectorPortal_Screen")
    AnimGBSequence("tl_minihub_zoned1.TL_Minihub_ZoneB_Nautilis_INERT 01", "Emerge")
    SetMap(nil, "MAP_TL_MINIHUB_ZONED", "GAME")
    SetDefaultCameraValues(6.25, 5, 0)
    Enable("tl_minihub_zoned1.CameraControlPointSplineFollower 01")
  elseif GetGlobal("TLMH_ZD1_Gus_Surfacing_Played") == 1 then
    WaitForLevelLoad()
    ClearAllCameraAttributes()
    ExitCutscene("tl_minihub_zoned1.BeetleworxCrawler 01")
    DestroyEntity("tl_minihub_zoned1.CameraControlPointSplineFollower 01")
    ForEachEntityInGroup(DestroyEntity, "SpinnerTipGroup")
    TL_FireUser_StartingAudio()
    AnimGBSequence("tl_minihub_zoned1.TL_Minihub_ZoneB_Nautilis_INERT 01", "idle")
    SetDefaultCameraValues(6.25, 5, 0)
    Unhide("tl_minihub_zoned1.seq_projector 01.ProjectorPortal_Screen")
    FireThread(TL_ZoneD1_ProjSideCam)
  end
  if GetGlobal("TLMH_ZD1_Gus_GotAPin_Played") == 1 then
    ClearAllCameraAttributes()
    DestroyEntity("tl_minihub_zoned1.TriggerRotate 04")
    DestroyEntity("tl_minihub_zoned1.PlayerHintMarkers 09")
    ForEachEntityInGroup(DestroyEntity, "UFOgremlin")
  end
  print("*************************************************************************** PRE Waterfall 10")
  if GetGlobal("TL_ZoneD1_ValveFixMethod") == 1 and GetGlobal("TL_WaterfallShrink") > 9 then
    print("*************************************************************************** Waterfall 10")
    SetGlobal("TL_D1_DiagSkip", 1)
    ClearAllCameraAttributes()
    Fallingblock2played = 1
    Fallingblock2Setup = 35
    wait(0)
    wait(0)
    SetGlobal("TL_WaterfallShrink", 10)
    TeleportToEntity("tl_minihub_zoned1.TL_MiniHub_Floating_Box01 01", "tl_minihub_zoned1.SplineKnot 07")
    FireUser1("tl_minihub_zoned1.thinnerjetanddamage 02.SteamJet_Blast")
    FireUser1("tl_minihub_zoned1.thinnerjetanddamage 01.SteamJet_Blast")
    ForEachEntityInGroup(Disable, "TL_ValveUse")
    ForEachEntityInGroup(DestroyEntity, "TL_ValveHint")
    ForEachEntityInGroup(Hide, "WaterfallGroup")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_A_Controller")
    ForEachEntityInGroup(Unhide, "ThinnerUnhide")
    ForEachEntityInGroup(Enable, "ThinnerUnhideTrigger")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 01", "Play_sfx_TC_TCL_Env_ThinnerGusher_Start")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 02", "Play_sfx_TC_TCL_Env_ThinnerGusher_Start")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 03", "Play_sfx_TC_TCL_Env_ThinnerGusher_Start")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 04", "Play_sfx_TC_TCL_Env_ThinnerGusher_Start")
    MultiPosSoundStart("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_B_Controller")
    ForEachEntityInGroup(Hide, "ThinnerLeakingToon")
    ForEachEntityInGroup(ForceSketchedPop, "Pressurizedthinnedtoon")
    ForEachEntityInGroup(ForceSketchedPop, "Pressurizedthinnedtoon2")
    ForEachEntityInGroup(DisableGlint, "TL_ValveUse")
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Gate01 01", "opening")
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Falling_Block03 01", "rise")
    wait(1.36)
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Falling_Block03 01", "bob")
    TimerEnable("tl_minihub_zoned1.LogicTimerMarker 01")
    wait(2)
    TimerEnable("tl_minihub_zoned1.LogicTimerMarker 02")
  elseif GetGlobal("TL_ZoneD1_ValveFixMethod") == 1 and GetGlobal("TL_WaterfallShrink") < 10 then
    print("*************************************************************************** Waterfall 7")
    SetGlobal("TL_D1_DiagSkip", 1)
    ClearAllCameraAttributes()
    Fallingblock2played = 1
    Fallingblock2Setup = 35
    wait(0)
    wait(0)
    SetGlobal("TL_WaterfallShrinkR", 2)
    SetGlobal("TL_WaterfallShrinkL", 2)
    SetGlobal("TL_WaterfallShrink", 7)
    SetGlobal("TLMH_ZD1_Gus_SteamGearActivated_Played", 1)
    TeleportToEntity("tl_minihub_zoned1.TL_MiniHub_Floating_Box01 01", "tl_minihub_zoned1.SplineKnot 07")
    FireUser1("tl_minihub_zoned1.thinnerjetanddamage 02.SteamJet_Blast")
    FireUser1("tl_minihub_zoned1.thinnerjetanddamage 01.SteamJet_Blast")
    ForEachEntityInGroup(Disable, "TL_ValveSubUse")
    ForEachEntityInGroup(DestroyEntity, "TL_ValveSubHint")
    ForEachEntityInGroup(Hide, "WaterfallSubGroup")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_A_Controller")
    ForEachEntityInGroup(Unhide, "ThinnerUnhide")
    ForEachEntityInGroup(Enable, "ThinnerUnhideTrigger")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 01", "Play_sfx_TC_TCL_Env_ThinnerGusher_Start")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 02", "Play_sfx_TC_TCL_Env_ThinnerGusher_Start")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 03", "Play_sfx_TC_TCL_Env_ThinnerGusher_Start")
    AudioPostEventOn("tl_minihub_zoned1.TL_MiniHub_ZoneD_Steam01 04", "Play_sfx_TC_TCL_Env_ThinnerGusher_Start")
    MultiPosSoundStart("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_B_Controller")
    ForEachEntityInGroup(Hide, "ThinnerLeakingToon")
    ForEachEntityInGroup(ForceSketchedPop, "Pressurizedthinnedtoon")
    ForEachEntityInGroup(ForceSketchedPop, "Pressurizedthinnedtoon2")
    ForEachEntityInGroup(DisableGlint, "TL_ValveUse")
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Gate01 01", "opening")
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Falling_Block03 01", "rise")
    wait(1.36)
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Falling_Block03 01", "bob")
    TimerEnable("tl_minihub_zoned1.LogicTimerMarker 01")
    wait(2)
    TimerEnable("tl_minihub_zoned1.LogicTimerMarker 02")
  elseif 1 < GetGlobal("TL_ThroughDoor") then
    print("*************************************************************************** Wilco")
    SetGlobal("TL_D1_DiagSkip", 1)
    ClearAllCameraAttributes()
    DestroyEntity("tl_minihub_zoned1_igc.grabcamerafancy 01.FancyCameraLookAt 01")
    DestroyEntity("tl_minihub_zoned1_igc.grabcamerafancy 03.FancyCameraLookAt 01")
    wait(0)
    wait(0)
    SetGlobal("TLMH_ZD1_Gus_SteamGearActivated_Played", 1)
    ForEachEntityInGroup(Disable, "TL_ValveUse")
    ForEachEntityInGroup(DestroyEntity, "TL_ValveHint")
    ForEachEntityInGroup(Hide, "WaterfallGroup")
    MultiPosSoundStop("tl_minihub_zoned1_audio.Sound_Marker_ThinnerFalls_A_Controller")
    ForEachEntityInGroup(DestroyEntity, "GremlinWaterfall")
    ForEachEntityInGroup(DisableGlint, "TL_ValveUse")
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Gate01 01", "opening")
  end
  if GetGlobal("TL_D1_Bronzepin") == 2 then
    ForEachEntityInGroup(DestroyEntity, "UFOgremlin")
    DestroyEntity("tl_minihub_zoned1.PlayerHintMarkers 09")
  end
  print("*************************************************************************** End Of Load")
  Unhide("tl_minihub_zoned1.TL_MiniHub_ZoneD_Toon025 05")
  UnrestrictCutSceneInput()
  Unmute()
  Cleanup_TL_Nautilus()
end
TL_CarouselCameraPan = L4_4
function L4_4()
  Prefab_Projector_SetOnlySideCamera("tl_minihub_zoned1.seq_projector 01.ProjectorPortal_Screen")
end
TL_ZoneD1_ProjSideCam = L4_4
function L4_4()
  SaveCheckpoint(GetPlayer(), "TL_CarouselCameraPan", "tl_minihub_zoned1.ExitProjectorMarker")
end
TL_ZoneD1_ChestSaveCheckpoint = L4_4
function L4_4()
  StartFadeOut(0.5)
  wait(0.5)
  ForEachEntityInGroup(Unhide, "tl_minihub_zoned1.seq_projector 01.ProjectorPortal_Screen")
  AnimGBSequence("tl_minihub_zoned1.TL_Minihub_ZoneB_Nautilis_INERT 01", "idle")
  Print("************************************TL_CarouselProjector")
  GetPrefabData("tl_minihub_zoned1.seq_projector 01.EnterProjectorCamera").MapLoad_SetupPosition = "True"
  Wait(0.5)
  OnMapLoad_ProjectorSetup("tl_minihub_zoned1.seq_projector 01.EnterProjectorCamera")
end
TL_CarouselProjector = L4_4
function L4_4()
  FireUser1("cameraSteamGear")
  SetGlobal("TL_Lagoon_GusIntroPart", 2)
  SetGlobal("TLMH_ZD1_Gus_Surfacing_Played", 0)
  wait(0.8)
  FireSequence("tl_minihub_zoned1_story.Gus", "TLMH_ZD1_Gus_Surfacing")
  OnMapLoad_ProjectorSetup("tl_minihub_zoned1.seq_projector 01.EnterProjectorCamera")
end
TL_ZoneD1_IntroFlythroughP2 = L4_4
function L4_4()
  FireUser1("THinnerGremlinIntro")
end
TL_ZoneD1_IntroFlythroughThinnerfallGremlin = L4_4
function L4_4()
  FireSequence("tl_minihub_zoned1_story.Gus", "TLMH_ZD1_Gus_GotAPin")
end
TL_ZoneD1_UFOChallengePin = L4_4
function L4_4()
  FireSequence("tl_minihub_zoned1_story.Gus", "TLMH_ZD1_Gus_GotAPin")
end
TL_ZoneD2load = L4_4
function L4_4()
  SaveQuestGlobal("TLMH_ZD1_Wilco_TimerTalk_Played")
  SaveQuestGlobal("TLMH_ZD1_Gus_SteamGearsDONE_Played")
  SaveQuestGlobal("TLMH_ZD1_Gus_SteamGearActivated_Played")
  SaveQuestGlobal("TL_ThroughDoor")
  SaveQuestGlobal("TL_WaterfallShrinkR")
  SaveQuestGlobal("TL_WaterfallShrink")
  SaveQuestGlobal("TL_WaterfallShrinkL")
  SaveQuestGlobal("TL_ZoneD1_ValveFixMethod")
  SaveQuestGlobal("TL_QuestUpdateCount")
  TL_ZoneD1_SaveCheckpoint()
end
TL_ZoneD1_SaveValve = L4_4
function L4_4()
  SaveQuestGlobal("TLMH_ZD1_Gus_UFO_Played")
  SaveQuestGlobal("TLMH_ZD1_Roger_UFOChallenge_Played")
  SaveQuestGlobal("TLMH_ZD1_Gus_GotAPin_Played")
  SaveQuestGlobal("TL_QuestUpdateCount")
  TL_ZoneD1_SaveCheckpoint()
end
TL_ZoneD1_Savegremlin = L4_4
function L4_4()
  if GetGlobal("TLMH_ZD1_Gus_TomorrowCityProper_Played") == 1 then
    AnimGBSequence("tl_minihub_zoned1.TL_Minihub_ZoneB_Nautilis_INERT 01", "idle")
  end
end
TL_NautilisMover = L4_4
function L4_4()
  local L0_31, L1_32
  TL_ZoneD1_HintDisable = L0_31
  L0_31 = nil
  TL_FallingBlock3 = L0_31
  L0_31 = nil
  TL_FallingBlock2CameraSetup = L0_31
  L0_31 = nil
  TL_ThroughDoorCheck = L0_31
  L0_31 = nil
  TL_WaterfallShrink = L0_31
  L0_31 = nil
  Timerfunc = L0_31
  L0_31 = nil
  TL_CarouselCameraPan = L0_31
  L0_31 = nil
  DontTrapMickeyBehindThinnerFall = L0_31
  L0_31 = nil
  WilcoFixWaterfall = L0_31
  L0_31 = nil
  TeleportOutWilco = L0_31
  L0_31 = nil
  TL_ZoneD1_UFOChallengePin = L0_31
  L0_31 = nil
  TL_RaisingBlock1 = L0_31
  L0_31 = nil
  Timerfunc2 = L0_31
  L0_31 = nil
  TL_ZoneD1_SaveValve = L0_31
  L0_31 = nil
  TL_ZoneD1_IntroFlythroughP2 = L0_31
  L0_31 = nil
  TL_FallingBlock2Camera = L0_31
  L0_31 = nil
  TL_SteamJet2 = L0_31
  L0_31 = nil
  SpinnerTraining = L0_31
  L0_31 = nil
  TL_D2SpawnerDeadIncrease = L0_31
  L0_31 = nil
  TL_FallingBlock2 = L0_31
  L0_31 = nil
  CheckTrapform_Left = L0_31
  L0_31 = nil
  TL_ZoneD2load = L0_31
  L0_31 = nil
  TL_WaterfallShrinkR = L0_31
  L0_31 = nil
  ClearTheVolume = L0_31
  L0_31 = nil
  DropBlock03 = L0_31
  L0_31 = nil
  TeleportOutRoger = L0_31
  L0_31 = nil
  ClearInteriorStream = L0_31
  L0_31 = nil
  TL_ExitDoorSteam = L0_31
  L0_31 = nil
  TelportWilcoOut = L0_31
  L0_31 = nil
  TL_SteamJet1 = L0_31
  L0_31 = nil
  TL_ZoneD1_SaveCheckpoint = L0_31
  L0_31 = nil
  TL_ZoneD1_Savegremlin = L0_31
  L0_31 = nil
  TL_FallingBlock1Painted = L0_31
  L0_31 = nil
  TL_NautilisMover = L0_31
  L0_31 = nil
  Loadtimersetup = L0_31
  L0_31 = nil
  CancelDropBlock03 = L0_31
  L0_31 = nil
  TL_FallingBlock4 = L0_31
  L0_31 = nil
  CheckTrapform_Right = L0_31
  L0_31 = nil
  TL_CarouselArena = L0_31
  L0_31 = nil
  TL_WaterfallShrinkL = L0_31
  L0_31 = nil
  TL_FallingBlock1Thinned = L0_31
  L0_31 = nil
  TL_CarouselProjector = L0_31
  L0_31 = nil
  Cleanup_TL_MiniHub_ZoneD1 = L0_31
end
Cleanup_TL_MiniHub_ZoneD1 = L4_4
