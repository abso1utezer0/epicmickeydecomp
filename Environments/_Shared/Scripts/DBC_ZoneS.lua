local L0_0, L1_10

DBC_ZoneS_WaveOneEnemies = 8
DBC_ZoneS_WaveTwoEnemies = 5
DBC_ZoneS_NoFlythrough = 0
DBC_ZoneS_DisableCheckpoint_Tent01 = 0
DBC_ZoneS_DisableCheckpoint_Tent02 = 0
DBC_ZoneS_DisableCheckpoint_Tent03 = 0
DBC_ZoneS_DisableCheckpoint_Init = 0
daisymov = ""
donaldmov = ""
goofymov = ""
pete1mov = ""
hookmov = ""
clockmov = ""
pete2mov = ""
horacemov = ""
pete3mov = ""
DBC_ZoneS_NoIntro = false

function DBC_ZoneS_Intro_Launcher()
  if DBC_ZoneS_NoIntro == false then
    SetGlobal("PlayerFirstTimeInZone", 1)
    GetPrefabData("DBC_ZoneS_Start").MapLoad_SetupPosition = "True"
    OnMapLoad_ProjectorSetup("DBC_ZoneS_Start")
    StartEmitters("dbc_zones.DBC_ZoneS_BlotHandForm 01")
    FireThread(DBC_ZoneS_Intro_Launcher_FireThread)
  end
end

function DBC_ZoneS_OpenDoor(var1)
  AnimGBSequence(var1, "Open")
  AudioPostEventOn(GetPlayer(), "Play_sfx_IB_Door_Open")
end

function DBC_ZoneS_CloseDoor(var1)
  AnimGBSequence(var1, "Close")
end

function DBC_ZoneS_TentacleKill(var1, var2)
  SetGlobal("DBC_ZoneS_TotalTent", GetGlobal("DBC_ZoneS_TotalTent") + 1)
  SetGlobal(var2, 1)
  DBC_ZoneS_EndCutscene()
end

function DBC_ZoneS_EndCutscene()
  if GetGlobal("DBC_LastHeartBoss") == 25 then
    DoEndGame()
  end
end

function DBC_ZoneS_FirstCheckpoint()
  DBC_ZoneS_NoIntro = true
  DBC_ZoneS_NoFlythrough = 1
  SetGlobal("DBC_ZoneS_RoomFinished", 5)
  SetGlobal("DBC_LastHeart01", 0)
  DBC_ZoneS_ManageDripFX("DripGroup1", "DripGroup5")
  DBC_ZoneS_CheckpointCleanup()
  ForEachEntityInGroup(DisableComponent, "GuardianHintMarkers", "Guardian Hint Component")
  FireThread(DBC_ZoneS_ManageSpawns, "dbc_zones_ai01.HeartRoom_Wave00Spawner 01", 2)
  FireThread(DBC_ZoneS_FirstCheckpoint_FireThread)
end

function DBC_ZoneS_SaveFirstCheckpoint()
  SaveCheckpoint(nil, "DBC_ZoneS_FirstCheckpoint", "CheckpointOneMarker")
end

function DBC_ZoneS_CenterRoomSetup()
  DBC_ZoneS_NoFlythrough = 1
  if GetGlobal("DBC_ZoneS_RoomFinished") == 1 then
    SetGlobal("DBC_LastHeart02", 0)
    TimerDisable("dbc_zones.Hall01_TentacleTimer 01")
    ForEachEntityInGroup(Disable, "CenterRoomTriggers")
    FireThread(DBC_ZoneS_ManageSpawns, "dbc_zones_ai01.HeartRoom_Wave01Spawner 01", 7)
    DBC_ZoneS_CloseDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 03")
    DBC_ZoneS_CloseDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 05")
    ForEachEntityInGroup(DisableComponent, "GuardianHintMarkers", "Guardian Hint Component")
    DBC_ZoneS_ManageDripFX("DripGroup1", "DripGroup5")
    if GetGlobal("DBC_2nd_ZoneS_HeartChamber1_Played") == 0 then
      FireSequence("dbc_zones_static.GusMarker(Conversation) 01", "DBC_2nd_ZoneS_HeartChamber1")
      DBC_ZoneS_WaveOneEnemies = 8
    else
      DBC_ZoneS_CloseDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 01")
      GrabCamera("dbc_zones.CheckPointMarker 01A_CameraControlPoint 01", nil, CAMERA_INSTANT_TRANSITION, 0)
      Enable("dbc_zones.CheckPointMarker 01A_CameraTrigger 01")
      DBC_ZoneS_CheckpointCleanup()
    end
  elseif GetGlobal("DBC_ZoneS_RoomFinished") == 2 then
    SetGlobal("DBC_LastHeart03", 0)
    SetSplineFollowerInitialSpeed("dbc_zones.Mover01_Inert 04", 0)
    SetSplineFollowerInitialSpeed("dbc_zones.Mover01_Inert 05", 0)
    SetSplineFollowerInitialSpeed("dbc_zones.Mover01_Inert 06", 0)
    TimerDisable("dbc_zones.Hall02_TentacleTimer 01")
    ForEachEntityInGroup(Disable, "CenterRoomTriggers")
    FireThread(DBC_ZoneS_ManageSpawns, "dbc_zones_ai03.HeartRoom_Wave02Spawner 01", 4)
    DBC_ZoneS_CloseDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 01")
    DBC_ZoneS_CloseDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 05")
    ForEachEntityInGroup(DisableComponent, "GuardianHintMarkers", "Guardian Hint Component")
    DBC_ZoneS_ManageDripFX("DripGroup1", "DripGroup5")
    if GetGlobal("DBC_2nd_ZoneS_HeartChamber2_Played") == 0 then
      FireSequence("dbc_zones_static.GusMarker(Conversation) 01", "DBC_2nd_ZoneS_HeartChamber2")
    else
      DBC_ZoneS_CloseDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 03")
      GrabCamera("dbc_zones.CheckPointMarker 02A_CameraControlPoint 01", nil, CAMERA_INSTANT_TRANSITION, 0)
      Enable("dbc_zones.CheckPointMarker 02A_CameraTrigger 01")
      DBC_ZoneS_CheckpointCleanup()
    end
  elseif GetGlobal("DBC_ZoneS_RoomFinished") == 3 then
    TimerDisable("dbc_zones.Hall03_TentacleTimer 01")
    ForEachEntityInGroup(Disable, "CenterRoomTriggers")
    FireThread(DBC_ZoneS_FinalSpawn)
    Enable("dbc_zones_ai03.HeartRoom_Wave03Spawner 02")
    DBC_ZoneS_CloseDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 01")
    DBC_ZoneS_CloseDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 03")
    ForEachEntityInGroup(DisableComponent, "GuardianHintMarkers", "Guardian Hint Component")
    DBC_ZoneS_ManageDripFX("DripGroup1", "DripGroup5")
    DBC_ZoneS_WaveTwoEnemies = 500000
    SetGlobal("DBC_LastHeartBoss", 17)
    if GetGlobal("DBC_2nd_ZoneS_HeartChamber3_Played") == 0 then
      FireSequence("dbc_zones_static.GusMarker(Conversation) 01", "DBC_2nd_ZoneS_HeartChamber3")
    else
      DBC_ZoneS_CloseDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 05")
      GrabCamera("dbc_zones.CheckPointMarker 03A_CameraControlPoint 01", nil, CAMERA_INSTANT_TRANSITION, 0)
      Enable("dbc_zones.CheckPointMarker 03A_CameraTrigger 01")
      DBC_ZoneS_CheckpointCleanup()
      FireThread(DBC_ZoneS_CenterRoomSetup_FireThread)
    end
  end
end

function DBC_ZoneS_CenterRoomDone(var1)
  if DBC_ZoneS_WaveOneEnemies == 0 then
    FireUser1("WaveOneDoorCam")
    wait(2)
    DBC_ZoneS_OpenDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 03")
    AnimGBSequence("dbc_zones.HeartTentacleA102_Inert 01", "Grow")
    ForEachEntityInGroup(Enable, "EndStreamTriggers")
    EnableComponent("HintMarker5", "Guardian Hint Component")
    DBC_ZoneS_WaveOneEnemies = 500000
    FireThread(DBC_ZoneS_ManageSpawns, "dbc_zones.Hall02_Tentacle_Spawner 01", 7)
    Wait(2.5)
    TimerEnable("dbc_zones.Hall02_TentacleTimer 01")
  elseif DBC_ZoneS_WaveTwoEnemies == 0 then
    FireUser1("WaveTwoDoorCam")
    wait(0.25)
    Enable("dbc_zones.MoverDisc01_Inert 01")
    Enable("dbc_zones.MoverDisc01_Inert 02")
    Wait(1.75)
    DBC_ZoneS_OpenDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 05")
    AnimGBSequence("dbc_zones.HeartTentacleA103_Inert 01", "Grow")
    ForEachEntityInGroup(Enable, "EndStreamTriggers")
    EnableComponent("HintMarker7", "Guardian Hint Component")
    DBC_ZoneS_WaveTwoEnemies = 500000
    FireThread(DBC_ZoneS_ManageSpawns, "dbc_zones.Hall03_Tentacle_Spawner 01", 6)
    Wait(3)
    TimerEnable("dbc_zones.Hall03_TentacleTimer 01")
  end
end

function DBC_ZoneS_EnemyTeamChange(var1, var2)
  if GetCurrentTeam(var1) == 2 then
    _G[var2] = _G[var2] + 1
    Print("Changing bad")
    Print("enemy  Wave Number: " .. _G[var2])
  elseif GetCurrentTeam(var1) == 3 then
    _G[var2] = _G[var2] - 1
    Print("Changing good")
    Print("friend  Wave Number: " .. _G[var2])
  end
  DBC_ZoneS_CenterRoomDone(nil)
end

function DBC_ZoneS_EnemyDeath(var1, var2)
  if GetCurrentTeam(var1) == 2 then
    _G[var2] = _G[var2] - 1
    Print("dead  Wave Number: " .. _G[var2])
  else
    Print("Friendly fire")
    Print("dead  Wave Number: " .. _G[var2])
  end
  DBC_ZoneS_CenterRoomDone(nil)
end

function L0_0(A0_11, A1_12, A2_13)
  if GetGlobal("DBC_LastHeart01") == tonumber(A1_12) - 1 then
    Print(GetGlobal("DBC_LastHeart01"))
    SetGlobal("DBC_LastHeart01", tonumber(A1_12))
    AnimGBSequence(A0_11, "Pop")
    AudioPostEventOn(A0_11, "Play_sfx_IB_Node_Impact")
    Wait(2.25)
    AnimGBSequence(A2_13, "Grow")
    SetPropertyFloat(A0_11, "Target Value", 0)
    SetPropertyFloat(A2_13, "Target Value", 1)
    SetPropertyBool(A2_13, "ForceInvulnerable", false)
  end
end
DBC_DamageTentacle01 = L0_0
function L0_0()
  local L0_14
  L0_14 = GetGlobal("DBC_LastHeart01") + 1
  if GetGlobal("DBC_LastHeart01") >= 1 then
    Unhide("dbc_zones.HeartTentacleA101_Inert 0" .. tostring(GetGlobal("DBC_LastHeart01")))
    Hide("dbc_zones.HeartTentacleA101_Inert 0" .. tostring(L0_14))
    SetGlobal("DBC_LastHeart01", GetGlobal("DBC_LastHeart01") - 1)
  end
end
DBC_RepairTentacle01 = L0_0
function L0_0()
  QueueBrainEvent("dbc_zones.Hall01_Tentacle_SmallThree 04", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall01_Tentacle_SmallThree 03", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall01_Tentacle_SmallThree 02", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall01_Tentacle_SmallThree 01", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall01_Tentacle_SmallThree 05", "BRAIN_CustomBehaviorTwo")
end
DBC_ZoneS_TentacleAttack01 = L0_0
function L0_0()
  if GetGlobal("DBC_LastHeartBoss") == 5 then
    SetGlobal("DBC_LastHeartBoss", 6)
    AnimGBSequence("dbc_zones.HeartTentacleA1Boss01_Inert 06", "Pop")
    Wait(1)
    FireSequence("dbc_zones_static.GusMarker(Conversation) 01", "DBC_2nd_ZoneS_FinalPoint1Gone")
    Wait(2)
    ForEachEntityInGroup(Kill, "Boss01_Zombies")
    ForEachEntityInGroup(DestroyEntity, "dbc_zones_ai02.Hall01_BossSpawner 01")
    wait(0.5)
    AudioPostEventOn(GetPlayer(), "Play_sfx_IB_Platform_Raise")
    ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "mover01", 1)
    Enable("dbc_zones.Hall01_ExitTrigger 01")
    Enable("dbc_zones.Hall01_Trigger 01")
    Enable("dbc_zones.Hall01_Trigger 02")
    Enable("dbc_zones.ExitChamberTrigger 01")
    DBC_ZoneS_OpenDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 02")
    FireThread(DBC_ZoneS_ManageSpawns, "dbc_zones.Hall01_Tentacle_Spawner 01", 4)
  end
end
DBC_ZoneS_TentacleOneDead = L0_0
function L0_0()
  wait(1)
  StreamInterior(nil, "stream_blotai1")
  ForEachEntityInGroup(AnimGBSequence, "BigTentacle1", "Wilt")
  wait(3)
  DestroyEntity("dbc_zones.DBC_ZoneS_Tentacle01B 01")
  ForEachEntityInGroup(DestroyEntity, "SoreGroup01")
  ForEachEntityInGroup(DestroyEntity, "SoreGroupBoss01")
  ForEachEntityInGroup(Enable, "CenterStreamTriggers")
  ForEachEntityInGroup(Enable, "HallCamera1Triggers")
  SetGlobal("DBC_ZoneS_RoomFinished", 1)
  SetGlobal("DBC_ZoneS_ProgressCheck", 2)
  wait(3)
  DestroyEntity("dbc_zones.DBC_ZoneS_Tentacle01A 01")
  DestroyEntity("dbc_zones.DBC_ZoneS_SpecialCollision 01")
  TimerEnable("dbc_zones.Hall01_TentacleTimer 01")
  if DBC_ZoneS_DisableCheckpoint_Tent01 == 0 then
    DBC_ZoneS_DisableCheckpoint_Tent01 = 1
    SaveCheckpoint(nil, "DBC_ZoneS_TentacleOneCheckpointReload", "dbc_zones.CheckPointMarker 01")
  end
end
DBC_ZoneS_TentacleOneDeadPartTwo = L0_0
function L0_0()
  DBC_ZoneS_NoFlythrough = 1
  FireThread(DBC_ZoneS_ManageSpawns, "dbc_zones.Hall01_Tentacle_Spawner 01", 4)
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "mover01", 100)
  ForEachEntityInGroup(Enable, "CenterStreamTriggers")
  ForEachEntityInGroup(Disable, "EndStreamTriggers")
  DBC_ZoneS_CheckpointCleanup()
  Enable("dbc_zones.Hall01_ExitTrigger 01")
  Enable("dbc_zones.Hall01_Trigger 01")
  Enable("dbc_zones.Hall01_Trigger 02")
  Enable("dbc_zones.ExitChamberTrigger 01")
  ForEachEntityInGroup(Enable, "HallCamera1Triggers")
  Disable("dbc_zones.PlaneTriggerDoorShut 01")
  Disable("dbc_zones_static.PlaneTriggerHint 02")
  DBC_ZoneS_ManageDripFX("DripGroup1", "DripGroup2")
  ForEachEntityInGroup(DisableComponent, "GuardianHintMarkers", "Guardian Hint Component")
  FireThread(DBC_ZoneS_TentacleOneCheckpointReload_FireThread)
end
DBC_ZoneS_TentacleOneCheckpointReload = L0_0
function L0_0()
  FireSequence("dbc_zones_static.GusMarker(Conversation) 01", "DBC_2nd_ZoneS_ZombieHint")
  wait(1)
  Enable("Hall1Spawner1")
  AnimGBSequence("dbc_zones.HeartTentacleA1Boss01_Inert 01", "Grow")
  wait(0.3)
  Enable("Hall1Spawner2")
  Wait(0.3)
  Enable("Hall1Spawner3")
  Wait(0.3)
  if GetGlobal("GV_PeteStuff") == 0 then
    Enable("Hall1Spawner4")
  else
    Enable("Hall1Spawner5")
  end
  Wait(0.1)
  ForEachEntityInGroup(AnimVarInt, "dbc_zones_ai02.PedestrianMaleGoat 01", "VAR_Mood_Type", "MOOD_Negative")
end
DBC_ZoneS_TentacleOneRoomSetup = L0_0
function L0_0(A0_15, A1_16, A2_17)
  if GetGlobal("DBC_LastHeart02") == tonumber(A1_16) - 1 then
    Print(GetGlobal("DBC_LastHeart02"))
    SetGlobal("DBC_LastHeart02", tonumber(A1_16))
    AnimGBSequence(A0_15, "Pop")
    AudioPostEventOn(A0_15, "Play_sfx_IB_Node_Impact")
    Wait(2.25)
    AnimGBSequence(A2_17, "Grow")
    SetPropertyFloat(A0_15, "Target Value", 0)
    SetPropertyFloat(A2_17, "Target Value", 1)
    SetPropertyBool(A2_17, "ForceInvulnerable", false)
  end
end
DBC_DamageTentacle02 = L0_0
function L0_0()
  local L0_18
  L0_18 = GetGlobal("DBC_LastHeart02") + 1
  if GetGlobal("DBC_LastHeart02") >= 1 then
    Unhide("dbc_zones.HeartTentacleA102_Inert 0" .. tostring(GetGlobal("DBC_LastHeart02")))
    Hide("dbc_zones.HeartTentacleA102_Inert 0" .. tostring(L0_18))
    SetGlobal("DBC_LastHeart02", GetGlobal("DBC_LastHeart02") - 1)
  end
end
DBC_RepairTentacle02 = L0_0
function L0_0()
  if GetGlobal("DBC_LastHeart02") == 6 then
    SetGlobal("DBC_LastHeart02", 7)
    AnimGBSequence("dbc_zones.HeartTentacleA102_Inert 07", "Pop")
    Wait(2.25)
    TimerDisable("dbc_zones.HeartTentacleA102 Timer 02")
    Enable("Hall2Spawner1")
    DBC_ZoneS_OpenDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 04")
    wait(0.3)
    Enable("Hall2Spawner2")
    Wait(0.3)
    Enable("Hall2Spawner3")
    Wait(0.3)
    if GetGlobal("MS_petetronicresolution") == 1 and GetGlobal("GV_PeteStuff") == 1 and GetGlobal("MS_petepanresolution") == 1 then
      Enable("Hall2Spawner5")
    else
      Enable("Hall2Spawner4")
    end
    Wait(0.1)
    ForEachEntityInGroup(AnimVarInt, "dbc_zones_ai02.PedestrianMaleGoat 04", "VAR_Mood_Type", "MOOD_Negative")
    Wait(1.5)
  end
end
DBC_ZoneS_TentacleTwoRoomSetup = L0_0
function L0_0()
  if GetGlobal("DBC_LastHeartBoss") == 11 then
    SetGlobal("DBC_LastHeartBoss", 12)
    AnimGBSequence("dbc_zones.HeartTentacleA1Boss02_Inert 06", "Pop")
    Wait(1)
    FireSequence("dbc_zones_static.GusMarker(Conversation) 01", "DBC_2nd_ZoneS_FinalPoint2Gone")
    wait(2.5)
    AudioPostEventOn(GetPlayer(), "Play_sfx_IB_Platform_Raise")
    ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "mover02", 1)
    Enable("dbc_zones.Hall02_Exit_Trigger 01")
    DBC_ZoneS_OpenDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 04")
    ForEachEntityInGroup(DestroyEntity, "dbc_zones_ai02.Hall02_BossSpawner 01")
    FireThread(DBC_ZoneS_ManageSpawns, "dbc_zones.Hall02_Tentacle_Spawner 01", 7)
  end
end
DBC_ZoneS_TentacleTwoDead = L0_0
function L0_0()
  wait(1)
  StreamInterior(nil, "stream_blotai3")
  ForEachEntityInGroup(AnimGBSequence, "BigTentacle2", "Wilt")
  wait(3)
  DestroyEntity("dbc_zones.DBC_ZoneS_Tentacle03B 01")
  ForEachEntityInGroup(DestroyEntity, "SoreGroup02")
  ForEachEntityInGroup(DestroyEntity, "SoreGroupBoss02")
  ForEachEntityInGroup(Enable, "CenterStreamTriggers")
  Enable("dbc_zones.CenterStreamTrigger 05")
  ForEachEntityInGroup(Enable, "HallTwoReturn_NudgeTriggers")
  Disable("dbc_zones.HallTwoCameraTrigger 01")
  ForEachEntityInGroup(Disable, "HallTwo_NudgeTriggers")
  SetGlobal("DBC_ZoneS_RoomFinished", 2)
  Unhide("dbc_zones.Mover01_Inert 04")
  SetSplineFollowerInitialSpeed("dbc_zones.Mover01_Inert 04", 1)
  SetSplineFollowerInitialSpeed("dbc_zones.Mover01_Inert 05", 1)
  SetSplineFollowerInitialSpeed("dbc_zones.Mover01_Inert 06", 1)
  SetGlobal("DBC_ZoneS_ProgressCheck", 4)
  Wait(3)
  DestroyEntity("dbc_zones.DBC_ZoneS_Tentacle03A 01")
  TimerEnable("dbc_zones.Hall02_TentacleTimer 01")
  if DBC_ZoneS_DisableCheckpoint_Tent02 == 0 then
    DBC_ZoneS_DisableCheckpoint_Tent02 = 1
    SaveCheckpoint(nil, "DBC_ZoneS_TentacleTwoCheckpointReload", "dbc_zones.CheckPointMarker 02")
  end
end
DBC_ZoneS_TentacleTwoDeadPartTwo = L0_0
function L0_0()
  DBC_ZoneS_NoFlythrough = 1
  FireThread(DBC_ZoneS_ManageSpawns, "dbc_zones.Hall02_Tentacle_Spawner 01", 7)
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "mover02", 100)
  ForEachEntityInGroup(Enable, "CenterStreamTriggers")
  ForEachEntityInGroup(Disable, "EndStreamTriggers")
  DBC_ZoneS_CheckpointCleanup()
  Enable("dbc_zones.Hall02_Exit_Trigger 01")
  Enable("dbc_zones.CenterStreamTrigger 05")
  Disable("dbc_zones.PlaneTriggerDoorShut 02")
  Disable("dbc_zones.HallTwoCameraTrigger 01")
  ForEachEntityInGroup(Disable, "HallTwo_NudgeTriggers")
  ForEachEntityInGroup(Enable, "HallTwoReturn_NudgeTriggers")
  Enable("dbc_zones.Mover01_Inert 20")
  DBC_ZoneS_ManageDripFX("DripGroup1", "DripGroup3")
  ForEachEntityInGroup(DisableComponent, "GuardianHintMarkers", "Guardian Hint Component")
  FireThread(DBC_ZoneS_TentacleTwoCheckpointReload_FireThread)
end
DBC_ZoneS_TentacleTwoCheckpointReload = L0_0
function L0_0()
  QueueBrainEvent("dbc_zones.Hall02_Tentacle_SmallThree 01", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall02_Tentacle_SmallThree 02", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall02_Tentacle_SmallThree 03", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall02_Tentacle_SmallThree 04", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall02_Tentacle_SmallThree 05", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall02_Tentacle_SmallThree 06", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall02_Tentacle_SmallThree 07", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall02_Tentacle_SmallThree 08", "BRAIN_CustomBehaviorTwo")
end
DBC_ZoneS_TentacleAttack02 = L0_0
function L0_0(A0_19, A1_20, A2_21)
  if GetGlobal("DBC_LastHeart03") == tonumber(A1_20) - 1 then
    Print(GetGlobal("DBC_LastHeart03"))
    SetGlobal("DBC_LastHeart03", tonumber(A1_20))
    AnimGBSequence(A0_19, "Pop")
    AudioPostEventOn(A0_19, "Play_sfx_IB_Node_Impact")
    Wait(2.25)
    AnimGBSequence(A2_21, "Grow")
    SetPropertyFloat(A0_19, "Target Value", 0)
    SetPropertyFloat(A2_21, "Target Value", 1)
    SetPropertyBool(A2_21, "ForceInvulnerable", false)
  end
end
DBC_DamageTentacle03 = L0_0
function L0_0()
  local L0_22
  L0_22 = GetGlobal("DBC_LastHeart03") + 1
  if GetGlobal("DBC_LastHeart03") >= 1 then
    Unhide("dbc_zones.HeartTentacleA103_Inert 0" .. tostring(GetGlobal("DBC_LastHeart03")))
    Hide("dbc_zones.HeartTentacleA103_Inert 0" .. tostring(L0_22))
    SetGlobal("DBC_LastHeart03", GetGlobal("DBC_LastHeart03") - 1)
  end
end
DBC_RepairTentacle03 = L0_0
function L0_0()
  if GetGlobal("DBC_LastHeartBoss") == 16 then
    SetGlobal("DBC_LastHeartBoss", 17)
    AnimGBSequence("dbc_zones.HeartTentacleA1Boss03_Inert 05", "Pop")
    Wait(1)
    FireSequence("dbc_zones_static.GusMarker(Conversation) 01", "DBC_2nd_ZoneS_Start4thTentacle")
    wait(2.5)
    AudioPostEventOn(GetPlayer(), "Play_sfx_IB_Platform_Raise")
    ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "mover03", 1)
    Enable("dbc_zones.Hall03_Exit_Trigger 01")
    DBC_ZoneS_OpenDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 06")
    ForEachEntityInGroup(DestroyEntity, "dbc_zones_ai02.Hall03_BossSpawner 01")
    ForEachEntityInGroup(Kill, "Boss03_Zombies")
    FireThread(DBC_ZoneS_ManageSpawns, "dbc_zones.Hall03_Tentacle_Spawner 01", 6)
  end
end
DBC_ZoneS_TentacleThreeDead = L0_0
function L0_0()
  wait(1)
  StreamInterior(nil, "stream_blotai3")
  ForEachEntityInGroup(AnimGBSequence, "BigTentacle3", "Wilt")
  wait(3)
  DestroyEntity("dbc_zones.DBC_ZoneS_Tentacle02B 01")
  ForEachEntityInGroup(DestroyEntity, "SoreGroup03")
  ForEachEntityInGroup(DestroyEntity, "SoreGroupBoss03")
  ForEachEntityInGroup(Enable, "CenterStreamTriggers")
  Enable("dbc_zones.CenterStreamTrigger 04")
  Disable("dbc_zones.HallThree_CloseDoorTrigger 01")
  Enable("dbc_zones.HallThree_CloseDoorTrigger 02")
  SetGlobal("DBC_ZoneS_RoomFinished", 3)
  SetGlobal("DBC_ZoneS_ProgressCheck", 6)
  Wait(3)
  DestroyEntity("dbc_zones.DBC_ZoneS_Tentacle02A 01")
  TimerEnable("dbc_zones.Hall03_TentacleTimer 01")
  if DBC_ZoneS_DisableCheckpoint_Tent03 == 0 then
    DBC_ZoneS_DisableCheckpoint_Tent03 = 1
    SaveCheckpoint(nil, "DBC_ZoneS_TentacleThreeCheckpointReload", "dbc_zones.CheckPointMarker 03")
  end
end
DBC_ZoneS_TentacleThreeDeadPartTwo = L0_0
function L0_0()
  DBC_ZoneS_NoFlythrough = 1
  FireThread(DBC_ZoneS_ManageSpawns, "dbc_zones.Hall03_Tentacle_Spawner 01", 6)
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "mover03", 100)
  SetSplineFollowerInitialSpeed("dbc_zones.Mover01_Inert 21", 1)
  SetSplineFollowerInitialSpeed("dbc_zones.Mover01_Inert 24", 1)
  ForEachEntityInGroup(Enable, "CenterStreamTriggers")
  ForEachEntityInGroup(Disable, "EndStreamTriggers")
  Enable("dbc_zones.CenterStreamTrigger 04")
  DBC_ZoneS_CheckpointCleanup()
  Enable("dbc_zones.Hall03_Exit_Trigger 01")
  Disable("dbc_zones.HallThree_CloseDoorTrigger 01")
  Enable("dbc_zones.HallThree_CloseDoorTrigger 02")
  DBC_ZoneS_OpenDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 06")
  Disable("dbc_zones.PlaneTriggerDoorShut 03")
  DBC_ZoneS_ManageDripFX("DripGroup4", "DripGroup5")
  ForEachEntityInGroup(DisableComponent, "GuardianHintMarkers", "Guardian Hint Component")
  FireThread(DBC_ZoneS_TentacleThreeCheckpointReload_FireThread)
end
DBC_ZoneS_TentacleThreeCheckpointReload = L0_0
function L0_0()
  if GetGlobal("DBC_LastHeart03") == 4 then
    SetGlobal("DBC_LastHeart03", 5)
    AnimGBSequence("dbc_zones.HeartTentacleA103_Inert 05", "Pop")
    Wait(2.25)
    TimerDisable("dbc_zones.HeartTentacleA103 Timer 01")
    Enable("Hall3Spawner1")
    DBC_ZoneS_OpenDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 06")
    wait(0.3)
    Enable("Hall3Spawner2")
    Wait(0.3)
    Enable("Hall3Spawner3")
    Wait(0.3)
    if GetGlobal("MS_petetronicresolution") == 1 and GetGlobal("GV_PeteStuff") == 1 and GetGlobal("MS_petepanresolution") == 1 then
      Enable("Hall3Spawner5")
    else
      Enable("Hall3Spawner4")
    end
    Wait(0.1)
    ForEachEntityInGroup(AnimVarInt, "dbc_zones_ai02.PedestrianMaleGoat 07", "VAR_Mood_Type", "MOOD_Negative")
    SetSplineFollowerInitialSpeed("dbc_zones.Mover01_Inert 21", 1)
    SetSplineFollowerInitialSpeed("dbc_zones.Mover01_Inert 24", 1)
    Wait(1.5)
  end
end
DBC_ZoneS_TentacleThreeRoomSetup = L0_0
function L0_0()
  QueueBrainEvent("dbc_zones.Hall03_Tentacle_SmallThree 01", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall03_Tentacle_SmallThree 02", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall03_Tentacle_SmallThree 03", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall03_Tentacle_SmallThree 04", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall03_Tentacle_SmallThree 05", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall03_Tentacle_SmallThree 06", "BRAIN_CustomBehaviorTwo")
  wait(0.5)
  QueueBrainEvent("dbc_zones.Hall03_Tentacle_SmallThree 07", "BRAIN_CustomBehaviorTwo")
end
DBC_ZoneS_TentacleAttack03 = L0_0
function L0_0(A0_23)
  QueueBrainEvent(A0_23, BRAIN_StartFollowEntity, vector4(0, 0, 0), GetPlayer())
  Wait(3)
end
DBC_SetZombieFollow = L0_0
function L0_0()
  if DBC_ZoneS_NoFlythrough == 0 then
    SetGlobal("MS_MeanStreetProgress", 6)
    FireUser1("IntroCam1")
    TeleportToEntity(GetPlayer(), "dbc_zones_igc.IntroFlyby_PositionMarker 01")
    Wait(2.5)
    GuardianPrefab_PopulateGuardians("DBC_ZoneS_MickeyHead")
    ForEachEntityInGroup(DisableComponent, "GuardianHintMarkers", "Guardian Hint Component")
    Wait(0.5)
    SetStayInCombatIdle(GetPlayer(), true)
  end
end
DBC_ZoneS_introFlythrough = L0_0
function L0_0()
  CameraReset()
  FireSequence("dbc_zones_static.GusMarker(Conversation) 01", "DBC_2nd_ZoneS_BlotQuest")
  wait(1)
  SetStayInCombatIdle(GetPlayer(), false)
  SaveCheckpoint(nil, "DBC_ZoneS_StartCheckpoint", "DBC_ZoneS_Start")
end
DBC_ZoneS_IntroFinalCam = L0_0
function L0_0()
  DBC_ZoneS_NoFlythrough = 1
  DBC_ZoneS_NoIntro = true
  Enable("dbc_zones_igc.flythroughTrigger 01")
  ForEachEntityInGroup(DisableComponent, "GuardianHintMarkers", "Guardian Hint Component")
  SetCameraAttributes(GetRelativePrefabEntity("DBC_ZoneS_Start", ".CameraSettings"))
  FireThread(GuardianPrefab_PopulateGuardians, "DBC_ZoneS_MickeyHead")
  if GetGlobal("DBC_ZoneS_FoundGus") == 1 then
    DestroyEntity("dbc_zones_static.Gremlin_Gus 01")
  else
  end
end
DBC_ZoneS_StartCheckpoint = L0_0
function L0_0()
  if DBC_ZoneS_NoFlythrough == 0 then
    MoveToEntity(GetPlayer(), "dbc_zones.ZoneH_MovetoMarker 01")
  end
end
DBC_ZoneS_MoveToStart = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneS_ProgressCheck") == 0 then
    SaveCheckpoint(nil, "DBC_ZoneS_StartCheckpoint", "DBC_ZoneS_Start")
  elseif GetGlobal("DBC_ZoneS_ProgressCheck") == 1 then
    SaveCheckpoint(nil, "DBC_ZoneS_FirstCheckpoint", "CheckpointOneMarker")
  elseif GetGlobal("DBC_ZoneS_ProgressCheck") == 3 then
    SaveCheckpoint(nil, "DBC_ZoneS_CenterRoomSetup", "dbc_zones.CheckPointMarker 01A")
  elseif GetGlobal("DBC_ZoneS_ProgressCheck") == 5 then
    SaveCheckpoint(nil, "DBC_ZoneS_CenterRoomSetup", "dbc_zones.CheckPointMarker 02A")
  elseif GetGlobal("DBC_ZoneS_ProgressCheck") == 7 then
    SaveCheckpoint(nil, "DBC_ZoneS_CenterRoomSetup", "dbc_zones.CheckPointMarker 03A")
  end
end
DBC_ZoneS_RedChestSave = L0_0
function L0_0(A0_24, A1_25, A2_26)
  if GetGlobal("DBC_LastHeartBoss") == tonumber(A1_25) - 1 then
    Print(GetGlobal("DBC_LastHeartBoss"))
    SetGlobal("DBC_LastHeartBoss", tonumber(A1_25))
    AnimGBSequence(A0_24, "Pop")
    AudioPostEventOn(A0_24, "Play_sfx_IB_Node_Impact")
    Wait(2.25)
    AnimGBSequence(A2_26, "Grow")
    SetPropertyFloat(A0_24, "Target Value", 0)
    SetPropertyFloat(A2_26, "Target Value", 1)
    SetPropertyBool(A2_26, "ForceInvulnerable", false)
  end
end
DBC_DamageTentacleBoss = L0_0
function L0_0(A0_27, A1_28, A2_29)
  if GetGlobal(A1_28) == tonumber(A2_29) then
    Wait(2.25)
    DBC_ZoneS_OpenDoor(A0_27)
    AudioPostEventOn(GetPlayer(), "Play_sfx_IB_Door_Open")
  end
end
DBC_ZoneS_OpenDoorCheck = L0_0
function L0_0(A0_30, A1_31, A2_32)
  if GetGlobal(A1_31) == tonumber(A2_32) then
    DBC_ZoneS_CloseDoor(A0_30)
  end
end
DBC_ZoneS_CloseDoorCheck = L0_0
function L0_0()
  SetStayInCombatIdle(GetPlayer(), true)
  FireSequence("dbc_zones_static.GusMarker(Conversation) 01", "DBC_2nd_ZoneS_HeartHint")
end
DBC_ZoneS_EnterCenterCam = L0_0
function L0_0()
  EnableComponent("HintMarker3", "Guardian Hint Component")
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "Front_Collapse", 1.6)
  AudioPostEventOn(GetPlayer(), "Play_sfx_IB_Platform_Lower")
  UnrestrictCutSceneInput()
end
DBC_ZoneS_EnterCenterCam_LowerPlatform = L0_0
function L0_0()
  ClearAllCameraAttributesTimed(1)
  DestroyEntity("StaticHeartCam")
  SetStayInCombatIdle(GetPlayer(), false)
  SetGlobal("DBC_ZoneS_ProgressCheck", 1)
  if DBC_ZoneS_DisableCheckpoint_Init == 0 then
    DBC_ZoneS_DisableCheckpoint_Init = 1
    SaveCheckpoint(nil, "DBC_ZoneS_FirstCheckpoint", "CheckpointOneMarker")
  end
end
DBC_ZoneS_EnterCenterCam_End = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneS_ProgressCheck") >= 1 then
    DestroyEntity("dbc_zones.grabcamerafancy 03.FancyTriggerRotate 01")
    DestroyEntity("dbc_zones.PlaneTrigger 01")
    DestroyEntity("dbc_zones_static.PlaneTrigger 05")
    DestroyEntity("dbc_zones_static.Gremlin_Gus 01")
    DestroyEntity("dbc_zones.Trigger 01")
    DestroyEntity("StaticHeartCam")
    DestroyEntity("dbc_zones.PlaneTrigger_InitStream 01")
    ForEachEntityInGroup(DestroyEntity, "Front_Collapse")
    GuardianPrefab_PopulateGuardians("DBC_ZoneS_MickeyHead")
  end
  if GetGlobal("DBC_ZoneS_ProgressCheck") >= 2 then
    ForEachEntityInGroup(DestroyEntity, "BigTentacle1")
    ForEachEntityInGroup(DestroyEntity, "SoreGroup01")
    ForEachEntityInGroup(DestroyEntity, "SoreGroupBoss01")
    Disable("dbc_zones_static.PlaneTriggerHint 03")
    DestroyEntity("dbc_zones.GuardianHint_Trigger 01")
    DestroyEntity("dbc_zones.TentChamberTrigger 01")
    DestroyEntity("dbc_zones.DBC_ZoneS_SpecialCollision 01")
  end
  if GetGlobal("DBC_ZoneS_ProgressCheck") >= 3 then
  end
  if GetGlobal("DBC_ZoneS_ProgressCheck") >= 4 then
    ForEachEntityInGroup(DestroyEntity, "BigTentacle2")
    ForEachEntityInGroup(DestroyEntity, "SoreGroup02")
    ForEachEntityInGroup(DestroyEntity, "SoreGroupBoss02")
    DestroyEntity("dbc_zones.GuardianHint_Trigger 02")
  end
  if GetGlobal("DBC_ZoneS_ProgressCheck") >= 5 then
  end
  if GetGlobal("DBC_ZoneS_ProgressCheck") >= 6 then
    ForEachEntityInGroup(DestroyEntity, "BigTentacle3")
    ForEachEntityInGroup(DestroyEntity, "SoreGroup03")
    ForEachEntityInGroup(DestroyEntity, "SoreGroupBoss03")
    Enable("dbc_zones.MoverDisc01_Inert 01")
    Enable("dbc_zones.MoverDisc01_Inert 02")
    DestroyEntity("dbc_zones.GuardianHint_Trigger 03")
    DestroyEntity("dbc_zones.TentChamber3_Trigger 01")
  end
  if GetGlobal("DBC_ZoneS_ProgressCheck") == 7 then
  end
end
DBC_ZoneS_CheckpointCleanup = L0_0
function L0_0()
  if GetGlobal("DBC_LastHeartBoss") == 24 then
    FireSequence("dbc_zones_static.GusMarker(Conversation) 01", "DBC_2nd_ZoneS_HeartChamber4")
  end
end
DBC_ZoneS_FinalHintCheck = L0_0
function L0_0(A0_33)
  if GetCurrentTeam(A0_33) == 3 then
    if GetGlobal("DBC_ZoneS_ProgressCheck") == 3 then
      DBC_ZoneS_WaveOneEnemies = DBC_ZoneS_WaveOneEnemies + 1
    end
    if GetGlobal("DBC_ZoneS_ProgressCheck") == 5 then
      DBC_ZoneS_WaveTwoEnemies = DBC_ZoneS_WaveTwoEnemies + 1
    end
  end
end
DBC_ZoneS_FriendlyKillReset = L0_0
function L0_0(A0_34)
  StartFadeOut(0.8)
  Wait(0.8)
  GrabCamera(A0_34, nil, CAMERA_INSTANT_TRANSITION, 0)
  StartFadeIn(0.8)
  ShowHud()
  Wait(1)
  UnrestrictCutSceneInput()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 2.5)
end
DBC_ZoneS_SkipIGC = L0_0
function L0_0()
  Wait(1.5)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 2.5)
end
DBC_ZoneS_ReleaseCam = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneS_FoundGus") == 0 then
    Unhide("dbc_zones_static.Gremlin_Gus 01")
    FireSequence("dbc_zones_static.Gremlin_Gus 01", "DBC_2nd_ZoneS_FindGusInBlot")
    Wait(0.675)
    DestroyEntity("TV")
    DestroyEntity("Anvil")
    Wait(0.1)
    TeleportToEntity(GetPlayer(), "dbc_zones_static.GusPositionMarker 03")
  end
end
DBC_ZoneS_FindGus = L0_0
function L0_0(A0_35, A1_36)
  ForEachEntityInGroup(StartEmitters, A1_36)
  ForEachEntityInGroup(StopEmitters, A0_35)
end
DBC_ZoneS_ManageDripFX = L0_0
function L0_0()
  if GetGlobal("DBC_LastHeart01") == 7 then
    DBC_ZoneS_TentacleOneRoomSetup()
    Disable("dbc_zones_static.PlaneTriggerHint 03")
  end
end
DBC_ZoneS_EnableZombieIGC = L0_0
function L0_0()
  Wait(1.5)
  if GetGlobal("DBC_ZoneS_ProgressCheck") == 1 then
    SaveCheckpoint(nil, "DBC_ZoneS_FirstCheckpoint", "CheckpointOneMarker")
  elseif GetGlobal("DBC_ZoneS_ProgressCheck") == 3 then
    SaveCheckpoint(nil, "DBC_ZoneS_CenterRoomSetup", "dbc_zones.CheckPointMarker 01A")
  elseif GetGlobal("DBC_ZoneS_ProgressCheck") == 5 then
    SaveCheckpoint(nil, "DBC_ZoneS_CenterRoomSetup", "dbc_zones.CheckPointMarker 02A")
  else
    SaveCheckpoint(nil, "DBC_ZoneS_CenterRoomSetup", "dbc_zones.CheckPointMarker 03A")
  end
end
DBC_ZoneS_ConceptArtSave = L0_0
function L0_0(A0_37, A1_38)
  local L2_39, L3_40, L4_41, L5_42
  for L5_42 = 0, L3_40(L4_41) do
    SetPropertyInt(A0_37, "Index To Spawn", L5_42)
    ForceSpawn(A0_37, 1)
    Wait(0.5)
  end
end
DBC_ZoneS_ManageSpawns = L0_0
function L0_0(A0_43, A1_44, A2_45)
  EnableComponent(A2_45, "Guardian Hint Component")
  DisableComponent(A1_44, "Guardian Hint Component")
end
DBC_ZoneS_ManageGuardianHints = L0_0
function L0_0(A0_46, A1_47)
  DisableComponent(A1_47, "Guardian Hint Component")
end
DBC_ZoneS_DisableGuardianHint = L0_0
function L0_0()
  FireThread(DBC_ZoneS_ManageSpawns, "dbc_zones.Hall01_Tentacle_Spawner 01", 4)
  Wait(1)
  TimerEnable("dbc_zones.Hall01_TentacleTimer 01")
end
DBC_ZoneS_EnableFirstHallTents = L0_0
function L0_0()
  FireUser1("EnterFirstHall")
  Wait(0.2)
  FireThread(DBC_ZoneS_ManageSpawns, "dbc_zones.Hall01_Tentacle_Spawner 01", 4)
  Wait(0.475)
  MoveToEntity(GetPlayer(), "dbc_zones.EnterHall_PositionMarker 01")
  Wait(0.8)
  DBC_ZoneS_CloseDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 01")
  Wait(0.2)
  AnimGBSequence("dbc_zones.HeartTentacleA101_Inert 04", "Grow")
  SetPropertyBool("dbc_zones.HeartTentacleA101_Inert 04", "ForceInvulnerable", false)
  SetPropertyFloat("dbc_zones.HeartTentacleA101_Inert 04", "Target Value", 1)
  Wait(1)
  TimerEnable("dbc_zones.Hall01_TentacleTimer 01")
end
DBC_ZoneS_EnterFirstHall_Intro = L0_0
function L0_0()
  GrabCamera("dbc_zones.EnterHall_CameraControlPoint 01", nil, CAMERA_INSTANT_TRANSITION, 0)
  Enable("dbc_zones.EnterHall_Trigger 01")
end
DBC_ZoneS_EnterFirstHall_Outro = L0_0
function L0_0()
  FireUser1("TentChamber2")
  Wait(0.675)
  MoveToEntity(GetPlayer(), "dbc_zones.TentChamber2_PositionMarker 01")
  Wait(0.8)
  DBC_ZoneS_CloseDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 04")
  Wait(0.2)
  AnimGBSequence("dbc_zones.HeartTentacleA1Boss02_Inert 01", "Grow")
  Wait(0.7)
  Enable("dbc_zones.Mover01_Inert 20")
end
DBC_ZoneS_EnterSecondChamber_Intro = L0_0
function L0_0()
  GrabCamera("dbc_zones.TentChamber2_CameraControlPoint 01", nil, CAMERA_INSTANT_TRANSITION, 0)
  Enable("dbc_zones.TentChamber2_CameraTrigger 01")
end
DBC_ZoneS_EnterSecondChamber_Outro = L0_0
function L0_0(A0_48, A1_49, A2_50)
  if GetGlobal("DBC_LastHeart01") == tonumber(A1_49) - 1 then
    SetGlobal("DBC_LastHeart01", tonumber(A1_49))
    AnimGBSequence(A0_48, "Pop")
    Wait(2.25)
    SetPropertyFloat(A0_48, "Target Value", 0)
  end
end
DBC_ZoneS_DamageBlister03 = L0_0
function L0_0()
  FireUser1("TentChamber3")
  Wait(0.675)
  MoveToEntity(GetPlayer(), "dbc_zones.TentChamber3_PositionMarker 01")
  Wait(0.8)
  DBC_ZoneS_CloseDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 06")
  Wait(1.2)
  AnimGBSequence("dbc_zones.HeartTentacleA1Boss03_Inert 01", "Grow")
  Enable("dbc_zones.TentChamber3_Trigger 01")
end
DBC_ZoneS_EnterThirdChamber_Intro = L0_0
function L0_0()
  Enable("dbc_zones.TentChamber3_CameraTrigger 01")
  GrabCamera("dbc_zones_igc.TentChamber3_CameraControlPoint 01", nil, CAMERA_INSTANT_TRANSITION, 0)
end
DBC_ZoneS_EnterThirdChamber_Outro = L0_0
function L0_0()
  Wait(1.5)
  FireThread(DBC_ZoneS_ManageSpawns, "dbc_zones_ai03.HeartRoom_Wave03Spawner 04", 1)
  Wait(1)
end
DBC_ZoneS_ReturnHeart3_Outro = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  GrabCamera("dbc_zones.CheckPointMarker 02A_CameraControlPoint 01", nil, CAMERA_INSTANT_TRANSITION, 0)
end
DBC_ZoneS_ReturnHeart2_Outro = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  GrabCamera("dbc_zones.CheckPointMarker 01A_CameraControlPoint 01", nil, CAMERA_INSTANT_TRANSITION, 0)
end
DBC_ZoneS_ReturnHeart1_Outro = L0_0
function L0_0(A0_51, A1_52)
  SetCameraAttributes(A1_52)
  Print("first")
  Wait(1.2)
  Print("second")
  ClearAllCameraAttributesTimed(1)
end
DBC_ZoneS_NudgeReset = L0_0
function L0_0()
  Enable("dbc_zones_ai03.HeartRoom_Wave03Spawner 01")
  Wait(0.5)
  Enable("dbc_zones_ai03.HeartRoom_Wave03Spawner 02")
  Wait(0.5)
  Enable("dbc_zones_ai03.HeartRoom_Wave03Spawner 03")
  Wait(0.5)
  Enable("dbc_zones_ai03.HeartRoom_Wave03Spawner 04")
  Wait(0.5)
  Enable("dbc_zones_ai03.HeartRoom_Wave03Spawner 05")
  Wait(0.5)
  Enable("dbc_zones_ai03.HeartRoom_Wave03Spawner 06")
  Wait(0.5)
  Enable("dbc_zones_ai03.HeartRoom_Wave03Spawner 07")
  Wait(0.5)
  Enable("dbc_zones_ai03.HeartRoom_Wave03Spawner 08")
  Wait(0.5)
  Enable("dbc_zones_ai03.HeartRoom_Wave03Spawner 09")
  Wait(0.5)
  Enable("dbc_zones_ai03.HeartRoom_Wave03Spawner 10")
  Wait(0.5)
end
DBC_ZoneS_FinalSpawn = L0_0
function L0_0()
  StartFadeOut(0.8)
  Wait(0.8)
  CameraReset()
  StartFadeIn(0.8)
  UnrestrictCutSceneInput()
  Wait(1)
  SaveCheckpoint(nil, "DBC_ZoneS_StartCheckpoint", "DBC_ZoneS_Start")
end
DBC_ZoneS_GremlinPin_Save = L0_0
function L0_0()
  Wait(0.4)
  StopEmitters("dbc_zones.DBC_ZoneS_BlotHandForm 01")
  SetMap(nil, "MAP_DBC_ZONES", "GAME")
end
DBC_ZoneS_Intro_Launcher_FireThread = L0_0
function L0_0()
  Wait(0.5)
  AnimGBSequence("dbc_zones.HeartTentacleA101_Inert 01", "Grow")
  EnableComponent("HintMarker3", "Guardian Hint Component")
end
DBC_ZoneS_FirstCheckpoint_FireThread = L0_0
function L0_0()
  Wait(0.5)
  SetPropertyFloat("dbc_zones.HeartTentacleA1Boss 01", "Target Value", 1)
  SetPropertyBool("dbc_zones.HeartTentacleA1Boss 01", "ForceInvulnerable", false)
  AnimGBSequence("dbc_zones.HeartTentacleA1Boss 01", "Grow")
end
DBC_ZoneS_CenterRoomSetup_FireThread = L0_0
function L0_0()
  Wait(1)
  DBC_ZoneS_OpenDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 02")
  Wait(3)
  TimerEnable("dbc_zones.Hall01_TentacleTimer 01")
end
DBC_ZoneS_TentacleOneCheckpointReload_FireThread = L0_0
function L0_0()
  wait(1)
  Unhide("dbc_zones.Mover01_Inert 04")
  SetSplineFollowerInitialSpeed("dbc_zones.Mover01_Inert 04", 1)
  SetSplineFollowerInitialSpeed("dbc_zones.Mover01_Inert 05", 1)
  SetSplineFollowerInitialSpeed("dbc_zones.Mover01_Inert 06", 1)
  DBC_ZoneS_OpenDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 04")
  Wait(3)
  TimerEnable("dbc_zones.Hall02_TentacleTimer 01")
end
DBC_ZoneS_TentacleTwoCheckpointReload_FireThread = L0_0
function L0_0()
  wait(1)
  DBC_ZoneS_OpenDoor("dbc_zones_static.DBC_ZoneS_Door01_Inert 06")
  Wait(3)
  TimerEnable("dbc_zones.Hall03_TentacleTimer 01")
end
DBC_ZoneS_TentacleThreeCheckpointReload_FireThread = L0_0
function L0_0()
  SetDefaultCameraValues(7, 15, -8)
end
DBC_ZoneS_SetHallTwoCamera = L0_0
function L0_0()
  if HasCollectible("Gremlin_Guardian") then
    Mickey_Receive_Item_NPC("GremlinGuardianPin_Spawner", "GreyPin")
  else
    Mickey_Receive_Item_NPC("GremlinGuardianPin_Spawner", "Gremlin_Guardian")
  end
end
DBC_ZoneS_GusPinTransfer = L0_0
function L0_0()
  if HasCollectible("Gremlin_Guardian") then
    Mickey_GetItem_ClearItem("GremlinGuardianPin_Spawner", "GreyPin")
  else
    Mickey_GetItem_ClearItem("GremlinGuardianPin_Spawner", "Gremlin_Guardian")
    Wait(0.5)
    GiveCollectible("Gremlin_Guardian")
  end
end
DBC_ZoneS_GusPinTransfer_CleanUp = L0_0
