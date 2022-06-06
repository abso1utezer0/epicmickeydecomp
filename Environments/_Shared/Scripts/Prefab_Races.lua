local L0_0, L1_1
function L0_0(A0_2)
  if RaceInProgress == false then
    Hide(A0_2)
  end
end
Race_HideGuardian = L0_0
function L0_0()
  local L0_3, L1_4, L2_5, L3_6
  L0_3 = Print
  L1_4 = "*************************** Start_Race: "
  L0_3(L1_4)
  L0_3 = HideHud
  L0_3()
  L0_3 = RestrictCutSceneInput
  L0_3()
  L0_3 = _self
  L0_3 = L0_3()
  L1_4 = GetPrefabData
  L2_5 = L0_3
  L1_4 = L1_4(L2_5)
  L2_5 = GetRelativePrefabEntity
  L3_6 = L0_3
  L2_5 = L2_5(L3_6, ".Race_NPC")
  L3_6 = GetRelativePrefabEntity
  L3_6 = L3_6(L0_3, ".Race_Spawner")
  StartFadeOut(0.3)
  wait(0.3)
  Hide("GildaRaceGuardian")
  TeleportToEntity(L3_6, GetRelativePrefabEntity(L0_3, ".RaceMarker 1"))
  SplineFollower_TeleportToKnot(GetRelativePrefabEntity(L0_3, ".Race_SplineFollower"), GetRelativePrefabEntity(L0_3, ".RaceMarker 1"))
  MarkerNumber = 1
  GuardianNumber = 1
  if not L1_4.EnterFunction == "None" then
    FireThread(_G[L1_4.EnterFunction])
  end
  MarkerEnd = L1_4.Stage1_EndMarker
  RaceTime = L1_4.Stage1_Timer
  Print("*************************** Start_Race: 1st Race with Last Marker being " .. MarkerEnd)
  AudioPostEventOn(GetPlayer(), "Mute_Mickey")
  TeleportToEntity(GetPlayer(), GetRelativePrefabEntity(L0_3, ".Race_StartMarker"))
  wait(0.1)
  AudioPostEventOn(GetPlayer(), "Unmute_Mickey")
  GrabCamera(GetRelativePrefabEntity(L0_3, ".Race_StartCamera"), nil, CAMERA_LERP_TRANSITION, 0)
  TeleportToEntity(L3_6, GetRelativePrefabEntity(L0_3, ".RaceMarker 1"))
  wait(0.2)
  Unhide(GetRelativePrefabEntity(L0_3, ".Race_Guardian"))
  Enable(L3_6)
  StartFadeIn(0.3)
  wait(0.3)
  Print("______________________________________________________________________________________________________GuardianSystemVisible false FlimFlam")
  ForceSequence(L2_5, "MSS_GildaStartRace")
  CurrentRaceSpawner = GetRelativePrefabEntity(L0_3, ".Race_Spawner")
  if CurrentRaceSpawner == "" then
    Print("************************************* - CurrentRaceSpawner == nothing")
  else
    Print("************************************* - CurrentRaceSpawner == something")
  end
  UnrestrictCutSceneInput()
end
Start_Race = L0_0
function L0_0()
  local L0_7
  L0_7 = Print
  L0_7("*************************** Race_Go()")
  L0_7 = _self
  L0_7 = L0_7()
  Print("''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Line 81")
  Unhide(GetRelativePrefabEntity(L0_7, ".Race_Guardian"))
  SplineFollower_TeleportToKnot(GetRelativePrefabEntity(L0_7, ".Race_SplineFollower"), GetRelativePrefabEntity(L0_7, ".RaceMarker 1"))
  RaceInProgress = true
  Print("______________________________________________________________________________________________________GuardianSystemVisible false FlimFlam2")
  ClearAllCameraAttributes()
  ReleaseCamera(CAMERA_EASING_TRANSITION, 0)
  Race_Timer(L0_7)
  wait(0.5)
end
Race_Go = L0_0
function L0_0(A0_8)
  local L1_9
  L1_9 = TimerGetState
  L1_9 = L1_9()
  if L1_9 == "Expired" then
    TimerStart(RaceTime, RaceTime * 2 / 3, 15)
    L1_9 = "Ticking"
    while L1_9 == "Ticking" do
      wait(0.5)
      L1_9 = TimerGetState()
    end
    if GetGlobal("MS_V1RaceActive") == 1 and GetGlobal("Race_Building") == 0 then
      Print("''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Race Lost")
      if GetHealth(GetPlayer()) ~= 0 then
        ForceSequence(GetRelativePrefabEntity(A0_8, ".Race_NPC"), "MSS_GildaRaceTimeUp")
        RaceMusicEnd()
      end
    end
  end
end
Race_Timer = L0_0
function L0_0(A0_10)
  local L1_11, L2_12
  L1_11 = GetRelativePrefabEntity
  L2_12 = A0_10
  L1_11 = L1_11(L2_12, ".Race_Spawner")
  L2_12 = GetRelativePrefabEntity
  L2_12 = L2_12(A0_10, ".Race_Guardian")
  RaceInProgress = false
  Race_SplineFollowerInMotion = false
  SetSplineFollowerInitialSpeed(GetRelativePrefabEntity(A0_10, ".Race_SplineFollower"), 0)
  TimerStop()
  AudioPostEventOn(GetPlayer(), "Stop_sfx_counter_ticking_normal")
  SetPropertyInt(L1_11, "Index To Spawn", 0, 0)
  TimerReset(Race_Timer)
  Disable(L1_11)
  MarkerNumber = 1
  GuardianNumber = 1
  TeleportToEntity(L1_11, GetRelativePrefabEntity(A0_10, ".RaceMarker 1"))
  DestroyEntity("RaceItemGroup")
  Hide(L2_12)
  SplineFollower_TeleportToKnot(GetRelativePrefabEntity(A0_10, ".Race_SplineFollower"), GetRelativePrefabEntity(A0_10, ".RaceMarker 1"))
end
Race_CleanUp = L0_0
function L0_0()
  local L0_13, L1_14, L2_15
  L0_13 = SetGlobal
  L1_14 = "MS_V1RaceActive"
  L2_15 = 0
  L0_13(L1_14, L2_15)
  L0_13 = SetGlobal
  L1_14 = "Race_Building"
  L2_15 = 1
  L0_13(L1_14, L2_15)
  L0_13 = Unhide
  L1_14 = "GildaRaceGuardian"
  L0_13(L1_14)
  L0_13 = _self
  L0_13 = L0_13()
  L1_14 = GetRelativePrefabEntity
  L2_15 = L0_13
  L1_14 = L1_14(L2_15, ".Race_Spawner")
  L2_15 = GetRelativePrefabEntity
  L2_15 = L2_15(L0_13, ".Race_Guardian")
  RaceInProgress = false
  Race_SplineFollowerInMotion = false
  SetSplineFollowerInitialSpeed(GetRelativePrefabEntity(L0_13, ".Race_SplineFollower"), 0)
  TimerStop()
  AudioPostEventOn(GetPlayer(), "Stop_sfx_counter_ticking_normal")
  RaceMusicEnd()
  SetPropertyInt(L1_14, "Index To Spawn", 0, 0)
  TimerReset(Race_Timer)
  Disable(L1_14)
  MarkerNumber = 1
  GuardianNumber = 1
  TeleportToEntity(L1_14, GetRelativePrefabEntity(L0_13, ".RaceMarker 1"))
  DestroyEntity("RaceItemGroup")
  SplineFollower_TeleportToKnot(GetRelativePrefabEntity(L0_13, ".Race_SplineFollower"), GetRelativePrefabEntity(L0_13, ".RaceMarker 1"))
  Hide(L2_15)
  SetGlobal("Race_Building", 0)
end
Race_EnterBuilding = L0_0
function L0_0()
  local L0_16
  L0_16 = _self
  L0_16 = L0_16()
  Unhide("GildaRaceGuardian")
  Race_CleanUp(L0_16)
  if not GetPrefabData(L0_16).ExitFunction == "None" then
    FireThread(_G[GetPrefabData(L0_16).ExitFunction])
  end
end
Race_Reset = L0_0
function L0_0()
  StartFadeOut(0.8)
  Wait(0.8)
  ForEachEntityInGroup(ClearAppCulled, "cull_b_front")
  ReleaseCamera(CAMERA_EASING_TRANSITION, 0)
  ShowHud()
  StartFadeIn()
  UnrestrictCutSceneInput()
  ClearAllCameraAttributes()
  SetCharacterInConversation(GetPlayer(), 0)
  AudioPostEventOn(GetPlayer(), "Stop_sfx_counter_ticking_normal")
end
Race_FadeOutShowHud = L0_0
L0_0 = 90
RaceTime = L0_0
L0_0 = false
RaceInProgress = L0_0
L0_0 = 1
MarkerNumber = L0_0
L0_0 = 1
GuardianNumber = L0_0
L0_0 = 100
MarkerEnd = L0_0
L0_0 = ""
CurrentRaceSpawner = L0_0
function L0_0(A0_17)
  Disable(A0_17)
  TeleportToEntity(GetRelativePrefabEntity(A0_17, ".Race_Spawner"), GetRelativePrefabEntity(A0_17, ".RaceMarker " .. MarkerNumber + 1))
end
Race_MoveSpawner = L0_0
L0_0 = false
Race_SplineFollowerInMotion = L0_0
function L0_0(A0_18)
  Print("_________________________________________________________________________Guardian Number:" .. GuardianNumber)
  Print("_________________________________________________________________________Marker Number:" .. MarkerNumber)
  if Race_SplineFollowerInMotion == true and GuardianNumber >= MarkerNumber then
    GuardianNumber = MarkerNumber
    SetSplineFollowerInitialSpeed(A0_18, 0)
    Race_SplineFollowerInMotion = false
  end
  GuardianNumber = GuardianNumber + 1
end
Race_MoveSplineFollower = L0_0
function L0_0()
  local L0_19, L1_20, L2_21, L3_22
  L0_19 = CurrentRaceSpawner
  L1_20 = GetPrefabData
  L2_21 = L0_19
  L1_20 = L1_20(L2_21)
  L2_21 = GetRelativePrefabEntity
  L3_22 = L0_19
  L2_21 = L2_21(L3_22, ".Race_Spawner")
  L3_22 = GetRelativePrefabEntity
  L3_22 = L3_22(L0_19, ".Race_NPC")
  AudioPostEventOn(GetPlayer(), "Play_sfx_MS_Race_CheckPoint")
  Print("*************************** Race_MoveSpawner - MarkerNumber: " .. MarkerNumber)
  if MarkerNumber == MarkerEnd then
    Print("*************************** Race Won!")
    SetGlobal("MS_V1RaceActive", 0)
    AudioPostEventOn(GetPlayer(), "Play_MX_MeanStreet_RaceWon_Stinger")
    Print("*************************** Race_MoveSpawner - MarkerNumber == MarkerEnd")
    ForceSequence(L3_22, "MSS_GildaRaceFinish")
    wait(1)
    StartFadeOut(0.5)
    wait(0.5)
    TeleportToEntity(GetPlayer(), GetRelativePrefabEntity(L0_19, ".Race_Player_EndMarker"))
    Race_CleanUp(L0_19)
    RaceMusicEnd()
    AudioSetState(GetPlayer(), "Music_State", "Auto")
    if GetGlobal("Race" .. L1_20.Number .. "_StageComplete") == 0 then
      SetGlobal("Race" .. L1_20.Number .. "_StageComplete", GetGlobal("Race" .. L1_20.Number .. "_StageComplete") + 1)
    end
    if GetGlobal("Race" .. L1_20.Number .. "_StageComplete") == 1 then
      ForceSequence(L3_22, "MSS_GildaRace" .. L1_20.Number .. "Completed")
    end
    Print("*************************** Race_MoveSpawner - MSS_GildaRace" .. L1_20.Number .. "Completed")
  elseif MarkerNumber < MarkerEnd then
    MarkerNumber = MarkerNumber + 1
    Print("*************************** Race_MoveSpawner - StartCameraPivotSnap")
    if MarkerNumber == MarkerEnd then
      SetPropertyInt(L2_21, "Index To Spawn", 1, 0)
      SetSplineFollowerInitialSpeed(GetRelativePrefabEntity(L0_19, ".Race_SplineFollower"), 8)
    else
      SetSplineFollowerInitialSpeed(GetRelativePrefabEntity(L0_19, ".Race_SplineFollower"), 8)
      Print("*************************** Race_MoveSpawner - SetSplineFollowerInitialSpeed")
    end
    Enable(L2_21)
    wait(0.1)
    Race_SplineFollowerInMotion = true
  end
end
Race_AdvanceIcon = L0_0
function L0_0()
  if GetGlobal("Race_Location") == 1 then
    AudioPostEventOn(GetPlayer(), "Stop_music_meanstreet")
  elseif GetGlobal("Race_Location") == 2 then
    AudioPostEventOn(GetPlayer(), "Stop_music_OsTown")
  elseif GetGlobal("Race_Location") == 3 then
    AudioPostEventOn(GetPlayer(), "Stop_music_adventureland")
  elseif GetGlobal("Race_Location") == 4 then
    AudioPostEventOn(GetPlayer(), "Stop_music_neworleanssquare")
  end
  Wait(2)
  AudioPostEventOn(GetPlayer(), "Play_MX_MeanStreet_Music_Race")
end
RaceMusicStart = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Stop_MX_MeanStreet_Music_Race")
  Wait(2)
  if GetGlobal("Race_Location") == 1 then
    AudioPostEventOn(GetPlayer(), "Play_music_meanstreet")
  elseif GetGlobal("Race_Location") == 2 then
    AudioPostEventOn(GetPlayer(), "Play_music_OsTown")
  elseif GetGlobal("Race_Location") == 3 then
    AudioPostEventOn(GetPlayer(), "Play_music_adventureland")
  elseif GetGlobal("Race_Location") == 4 then
    AudioPostEventOn(GetPlayer(), "Play_music_neworleanssquare")
  end
  AudioSetState(GetPlayer(), "Music_State", "Auto")
end
RaceMusicEnd = L0_0
