local L0_0, L1_1
function L0_0(A0_2)
  SetCameraAttributes(A0_2)
end
SafteyCam = L0_0
function L0_0()
  SetDefaultCameraValues(8, 7.5, -2)
  Wait(1)
  ClearAllCameraAttributesTimed(1)
  DestroyEntity("TL_SV_ReleaseIntroCamera")
end
SetupBaseCamTLSM = L0_0
function L0_0()
  FireUser1("introShot1")
  StartTrackingCurrentLevelForScoring("Space Voyage")
  ForEachEntityInGroup(Hide, "SM_Unhide")
  SetMap(nil, "MAP_SM_TL_ZONEB", "GAME")
end
IntroFlycam = L0_0
function L0_0()
  ShakeCamera(0.5, 7, 0, 0.75, 0.01, 0.005)
end
TL_Minihub_cam_shake = L0_0
function L0_0()
  if GetGlobal("SMB_Intro_setting") == 0 then
    FireSequence("sm_tl_zoneb_story.ConversationalTrigger 01", "SMB_Gus_OpeningScene")
    wait(1)
    AnimGBSequence("sm_tl_zoneb.TL_SM_Moonliner", "MoveUpAndRotate")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_SV_RocketRide_LIFT")
    ShakeCamera(3, 6, 0, 0.5, 0.002, 0.002)
    Disable("sm_tl_zoneb.TL_SM_Gear1 05")
    wait(0.8)
    ForEachEntityInGroup(Unhide, "SM_Moonliner_Rise_jet")
    MultiPosSoundStart("sm_tl_zoneb_audio.Sound_Marker_SteamOn_Controller")
    wait(1.2)
    Print("************************************************** TRAMSTART **************")
    AnimGBSequence("TramAnimMasterOuter", "Start", true)
    AnimGBSequence("TramAnimMasterInner", "Start", true)
    Enable("sm_tl_zoneb.Spawner 01")
    Enable("sm_tl_zoneb.Spawner 04")
    Enable("sm_tl_zoneb.Spawner 02")
    SetGlobal("SM_Rocket_trams_count", -2)
    wait(1)
    ForEachEntityInGroup(Unhide, "SM_Unhide")
    Enable("sm_tl_zoneb.Spawner 03")
    wait(1.5)
    ForEachEntityInGroup(Hide, "SM_Moonliner_Rise_jet")
    MultiPosSoundStart("sm_tl_zoneb_audio.Sound_Marker_SteamOff_Controller")
    wait(0.8)
    ShakeCamera(3.5, 6, 0, 0.5, 0.002, 0.002)
  end
  Cleanup_TL_Gear_Puzzle()
  Cleanup_TL_Minihub()
end
Intro_Setup = L0_0
function L0_0()
  Wait(1)
  ShowHud()
  SaveCheckpoint(GetPlayer(), "SM_V2_LoadCheckpoint", "sm_tl_v2_uberlayer.Marker(Rotatable) 03")
end
TL_SV_SaveAndShowHud = L0_0
function L0_0()
  FireSequence("sm_tl_zoneb_story.ConversationalTrigger 01", "SMB_Gus_ToPete")
end
SM_TOPETEquest = L0_0
function L0_0()
  local L0_3, L1_4
end
SpaceVoyage2dStream = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_28")
end
TL_Stream28 = L0_0
function L0_0()
  LoadLevel(GetPlayer(), "Levels/MeanStreet.Level")
end
TL_GotoMeanStreets = L0_0
function L0_0()
  SetGlobal("TL_ShortPuzzlecount", GetGlobal("TL_ShortPuzzlecount") + 1)
  TL_SM_Puzzle1path1Check()
end
TL_SM_Puzzle1Shortpath1countIncrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzlecount", GetGlobal("TL_LongPuzzlecount") + 1)
  TL_SM_Puzzle1path1Check()
end
TL_SM_Puzzle1Longpath1countIncrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzlecount", GetGlobal("TL_LongPuzzlecount") + 0.25)
  TL_SM_Puzzle1path1Check()
end
TL_SM_Puzzle1Longpath1QuarterCountIncrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzlecount", GetGlobal("TL_LongPuzzlecount") + 0.75)
  TL_SM_Puzzle1path1Check()
end
TL_SM_Puzzle1Longpath1Quarter3CountIncrease = L0_0
function L0_0()
  SetGlobal("TL_ShortPuzzlecount", GetGlobal("TL_ShortPuzzlecount") - 1)
  TL_SM_Puzzle1path1Check()
end
TL_SM_Puzzle1Shortpath1countDecrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzlecount", GetGlobal("TL_LongPuzzlecount") - 1)
  TL_SM_Puzzle1path1Check()
end
TL_SM_Puzzle1Longpath1countDecrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzlecount", GetGlobal("TL_LongPuzzlecount") - 0.25)
  TL_SM_Puzzle1path1Check()
end
TL_SM_Puzzle1Longpath1QuarterCountDecrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzlecount", GetGlobal("TL_LongPuzzlecount") - 0.75)
  TL_SM_Puzzle1path1Check()
end
TL_SM_Puzzle1Longpath1Quarter3CountDecrease = L0_0
function L0_0()
  SetGlobal("TL_ShortPuzzle2count", GetGlobal("TL_ShortPuzzle2count") + 1)
  TL_SM_Puzzle2path2Check()
end
TL_SM_Puzzle2Shortpath2countIncrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzle2count", GetGlobal("TL_LongPuzzle2count") + 1)
  TL_SM_Puzzle2path2Check()
end
TL_SM_Puzzle2Longpath2countIncrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzle2count", GetGlobal("TL_LongPuzzle2count") + 0.25)
  TL_SM_Puzzle2path2Check()
end
TL_SM_Puzzle2Longpath2QuarterCountIncrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzle2count", GetGlobal("TL_LongPuzzle2count") + 0.75)
  TL_SM_Puzzle2path2Check()
end
TL_SM_Puzzle2Longpath2Quarter3CountIncrease = L0_0
function L0_0()
  SetGlobal("TL_ShortPuzzle2count", GetGlobal("TL_ShortPuzzle2count") - 1)
  TL_SM_Puzzle2path2Check()
end
TL_SM_Puzzle2Shortpath2countDecrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzle2count", GetGlobal("TL_LongPuzzle2count") - 1)
  TL_SM_Puzzle2path2Check()
end
TL_SM_Puzzle2Longpath2countDecrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzle2count", GetGlobal("TL_LongPuzzle2count") - 0.25)
  TL_SM_Puzzle2path2Check()
end
TL_SM_Puzzle2Longpath2QuarterCountDecrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzle2count", GetGlobal("TL_LongPuzzle2count") - 0.75)
  TL_SM_Puzzle2path2Check()
end
TL_SM_Puzzle2Longpath2Quarter3CountDecrease = L0_0
function L0_0()
  if GetGlobal("SMB_CheckpointGears") == 0 and GetGlobal("SMB_Puzzle2") == 0 and GetGlobal("TL_ShortPuzzle2count") == 8 then
    SetGlobal("SMB_Puzzle2", 1)
    FireSequence("sm_tl_zoneb_story.ConversationalTrigger 01", "SMB_Gus_PipePuzzleQuestDone")
    AudioPostEventOn("Puzzle2ShortPath", "Play_sfx_TC_SV_Obj_PowerPipePuzzle_Complete")
    TL_SM_TVExitCheckSetup()
  end
end
TL_SM_Puzzle2path2Check = L0_0
function L0_0()
  SetGlobal("TL_ShortPuzzle3count", GetGlobal("TL_ShortPuzzle3count") + 1)
  TL_SM_Puzzle3path3Check()
end
TL_SM_Puzzle3Shortpath3countIncrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzle3count", GetGlobal("TL_LongPuzzle3count") + 1)
  TL_SM_Puzzle3path3Check()
end
TL_SM_Puzzle3Longpath3countIncrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzle3count", GetGlobal("TL_LongPuzzle3count") + 0.25)
  TL_SM_Puzzle3path3Check()
end
TL_SM_Puzzle3Longpath3QuarterCountIncrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzle3count", GetGlobal("TL_LongPuzzle3count") + 0.75)
  TL_SM_Puzzle3path3Check()
end
TL_SM_Puzzle3Longpath3Quarter3CountIncrease = L0_0
function L0_0()
  SetGlobal("TL_ShortPuzzle3count", GetGlobal("TL_ShortPuzzle3count") - 1)
  TL_SM_Puzzle3path3Check()
end
TL_SM_Puzzle3Shortpath3countDecrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzle3count", GetGlobal("TL_LongPuzzle3count") - 1)
  TL_SM_Puzzle3path3Check()
end
TL_SM_Puzzle3Longpath3countDecrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzle3count", GetGlobal("TL_LongPuzzle3count") - 0.25)
  TL_SM_Puzzle3path3Check()
end
TL_SM_Puzzle3Longpath3QuarterCountDecrease = L0_0
function L0_0()
  SetGlobal("TL_LongPuzzle3count", GetGlobal("TL_LongPuzzle3count") - 0.75)
  TL_SM_Puzzle3path3Check()
end
TL_SM_Puzzle3Longpath3Quarter3CountDecrease = L0_0
function L0_0(A0_5, A1_6)
  GrabCamera(A1_6, A0_5, CAMERA_LERP_TRANSITION, 2)
end
TL_SM_PuzzleCameraSet = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 2)
end
TL_SM_PuzzleCameraClear = L0_0
function L0_0()
  Enable("sm_tl_zoneb.TL_SM_Moonliner")
  ForEachEntityInGroup(Unhide, "SM_Moonliner_Rise_jet")
  MultiPosSoundStart("sm_tl_zoneb_audio.Sound_Marker_SteamOn_Controller")
  wait(3)
  ForEachEntityInGroup(Hide, "SM_Moonliner_Rise_jet")
  MultiPosSoundStart("sm_tl_zoneb_audio.Sound_Marker_SteamOff_Controller")
end
TL_SM_TVExitCheck = L0_0
L0_0 = 0
ElevatorDown = L0_0
function L0_0()
  RestrictCutSceneInput()
  GrabCamera("sm_tl_zoneb.CameraControlPoint 09", "sm_tl_zoneb.SplineKnot 83", CAMERA_LERP_TRANSITION, 0)
  wait(1)
  SetPropertyFloat("sm_tl_zoneb.SplineKnot 84", "BranchPathChance", 0)
  SetPropertyFloat("sm_tl_zoneb.SplineKnot 82", "BranchPathChance", 0)
  SetPropertyFloat("sm_tl_zoneb.SplineKnot 81", "BranchPathChance", 0)
  wait(2)
  SetGlobal("TL_SM_ExitTVCount", GetGlobal("TL_SM_ExitTVCount") + 9000)
  SetGlobal("MS_MeanStreetProgress", 3)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  UnrestrictCutSceneInput()
  TL_ZoneB_PUZZLESaveCheckpoint()
end
TL_SM_TVExitCheckSetup = L0_0
function L0_0()
  ForEachEntityInGroup(StopEmitters, "FuseboxSparks")
  TL_FuseboxPainted()
end
TL_SM_ElevatorcheckPaint = L0_0
function L0_0()
  ForEachEntityInGroup(StartEmitters, "FuseboxSparks")
  TL_FuseboxThinned()
end
TL_SM_ElevatorcheckThinner = L0_0
function L0_0()
  SetGlobal("TL_SM_ExitTVCount", GetGlobal("TL_SM_ExitTVCount") + 1)
  FireSequence("sm_tl_zoneb_story.ConversationalTrigger 01", "SMB_Gus_TVPlaced")
end
TL_SM_TVExitIncrease = L0_0
function L0_0()
  local L0_7, L1_8, L2_9, L3_10
  if L0_7 == 0 then
    if L0_7 == 0 then
      L0_7(L1_8, L2_9)
      if L0_7 == false then
        L0_7(L1_8, L2_9)
        L0_7(L1_8, L2_9)
        L3_10 = "Play_sfx_TC_SV_Env_ElectricHazard"
        L0_7(L1_8, L2_9, L3_10)
        L3_10 = "Play_sfx_TC_SV_Env_ElectricHazard"
        L0_7(L1_8, L2_9, L3_10)
      end
      if L0_7 == false then
        L0_7(L1_8, L2_9)
        L0_7(L1_8, L2_9)
        L3_10 = "Play_sfx_TC_SV_Env_ElectricHazard"
        L0_7(L1_8, L2_9, L3_10)
        L3_10 = "Play_sfx_TC_SV_Env_ElectricHazard"
        L0_7(L1_8, L2_9, L3_10)
      end
      if L0_7 == false then
        L0_7(L1_8, L2_9)
        L0_7(L1_8, L2_9)
        L3_10 = "Play_sfx_TC_SV_Env_ElectricHazard"
        L0_7(L1_8, L2_9, L3_10)
        L3_10 = "Play_sfx_TC_SV_Env_ElectricHazard"
        L0_7(L1_8, L2_9, L3_10)
      end
      if L0_7 == false then
        L0_7(L1_8, L2_9)
        L0_7(L1_8, L2_9)
        L3_10 = "Play_sfx_TC_SV_Env_ElectricHazard"
        L0_7(L1_8, L2_9, L3_10)
        L3_10 = "Play_sfx_TC_SV_Env_ElectricHazard"
        L0_7(L1_8, L2_9, L3_10)
      end
      if L0_7 == false then
        for L3_10 = 1, 2 do
          ForEachEntityInGroup(Hide, "ElectricArcsSet" .. L3_10)
          ForEachEntityInGroup(AudioPostEventOn, "ElectricArcsSet" .. L3_10, "Stop_sfx_TC_SV_Electricity_LP")
          wait(0.8)
          ForEachEntityInGroup(Unhide, "ElectricArcsSet" .. L3_10)
          ForEachEntityInGroup(AudioPostEventOn, "ElectricArcsSet" .. L3_10, "Play_sfx_TC_SV_Electricity_LP")
        end
      end
      if L0_7 == false then
        for L3_10 = 3, 4 do
          ForEachEntityInGroup(Hide, "ElectricArcsSet" .. L3_10)
          ForEachEntityInGroup(AudioPostEventOn, "ElectricArcsSet" .. L3_10, "Stop_sfx_TC_SV_Electricity_LP")
          wait(0.8)
          ForEachEntityInGroup(Unhide, "ElectricArcsSet" .. L3_10)
          ForEachEntityInGroup(AudioPostEventOn, "ElectricArcsSet" .. L3_10, "Play_sfx_TC_SV_Electricity_LP")
        end
      end
      if L0_7 == false then
        for L3_10 = 5, 6 do
          ForEachEntityInGroup(Hide, "ElectricArcsSet" .. L3_10)
          ForEachEntityInGroup(AudioPostEventOn, "ElectricArcsSet" .. L3_10, "Stop_sfx_TC_SV_Electricity_LP")
          wait(0.8)
          ForEachEntityInGroup(Unhide, "ElectricArcsSet" .. L3_10)
          ForEachEntityInGroup(AudioPostEventOn, "ElectricArcsSet" .. L3_10, "Play_sfx_TC_SV_Electricity_LP")
        end
      end
      if L0_7 == false then
        for L3_10 = 7, 8 do
          ForEachEntityInGroup(Hide, "ElectricArcsSet" .. L3_10)
          ForEachEntityInGroup(AudioPostEventOn, "ElectricArcsSet" .. L3_10, "Stop_sfx_TC_SV_Electricity_LP")
          wait(0.8)
          ForEachEntityInGroup(Unhide, "ElectricArcsSet" .. L3_10)
          ForEachEntityInGroup(AudioPostEventOn, "ElectricArcsSet" .. L3_10, "Play_sfx_TC_SV_Electricity_LP")
        end
      end
      L0_7(L1_8, L2_9)
      L0_7(L1_8)
      L0_7(L1_8, L2_9)
      L3_10 = "Stop_sfx_TC_SV_Electricity_LP"
      L0_7(L1_8, L2_9, L3_10)
      L0_7(L1_8)
    end
  end
  L0_7(L1_8, L2_9)
  L3_10 = "Stop_sfx_TC_SV_Electricity_LP"
  L0_7(L1_8, L2_9, L3_10)
end
SM_TL_ElectricCarts = L0_0
function L0_0()
  SetGlobal("SM_TL_LevelWin", 1)
  Bark(GetPlayer(), "You go to the roof and beat pete", 6)
end
SM_LevelWin = L0_0
L0_0 = 0
SM_OmegaDoorsOpened = L0_0
L0_0 = 0
SM_DeltaDoorsOpened = L0_0
function L0_0(A0_11, A1_12)
  if _G[A1_12] == 0 then
    AnimGBSequence(A0_11, "Open")
    _G[A1_12] = 1
  end
end
SM_SpawnerDoorsOpen = L0_0
function L0_0(A0_13, A1_14)
  AnimGBSequence(A0_13, "Close")
  if _G[A1_14] == 1 then
    _G[A1_14] = 0
  end
end
SM_SpawnerDoorsClose = L0_0
function L0_0()
  Print("************************************************** TRAMSPEED *******************")
  if GetGlobal("SM_Rocket_trams_count") == 0 then
    AnimGBSequence("TramAnimMasterOuter", "Loop", true, 5)
    AnimGBSequence("TramAnimMasterInner", "Loop", true, 5)
  elseif GetGlobal("SM_Rocket_trams_count") == -1 then
    AnimGBSequence("TramAnimMasterOuter", "Loop", true, 10)
    AnimGBSequence("TramAnimMasterInner", "Loop", true, 10)
  elseif GetGlobal("SM_Rocket_trams_count") == -2 then
    AnimGBSequence("TramAnimMasterOuter", "Loop", true, 15)
    AnimGBSequence("TramAnimMasterInner", "Loop", true, 15)
  elseif GetGlobal("SM_Rocket_trams_count") == -3 then
    AnimGBSequence("TramAnimMasterOuter", "Loop", true, 20)
    AnimGBSequence("TramAnimMasterInner", "Loop", true, 20)
  elseif GetGlobal("SM_Rocket_trams_count") == -4 then
    AnimGBSequence("TramAnimMasterOuter", "Loop", true, 25)
    AnimGBSequence("TramAnimMasterInner", "Loop", true, 25)
  else
    if GetGlobal("SM_Rocket_trams_count") > -4 then
      AnimGBSequence("TramAnimMasterInner", "Stop", false, 1)
      AnimGBSequence("TramAnimMasterOuter", "Stop", false, 1)
    else
    end
  end
end
SM_SetTramSpeed = L0_0
function L0_0()
  SetGlobal("SM_Rocket_trams_count", GetGlobal("SM_Rocket_trams_count") + 1)
end
SM_SetTramSpeedIncrease = L0_0
function L0_0()
  SetGlobal("SM_Rocket_trams_count", GetGlobal("SM_Rocket_trams_count") - 1)
end
SM_SetTramSpeedDecrease = L0_0
function L0_0()
  Disable("sm_tl_zoneb.TriggerUse 01")
  FireThread(OmegaShutSpawners)
  wait(7)
  ForceSketched("SpawnerDoor1ToonLook")
end
ShutDownSpawnersOmega = L0_0
function L0_0()
  FireUser1("introShot3")
  wait(0.5)
  Enable("sm_tl_zoneb.Spawner 07")
  AnimGBSequence("sm_tl_zoneb.TL_SM_Moonliner", "RestUp")
  Wait(5)
  Enable("sm_tl_zoneb.PlaneTrigger 02")
end
RocketSetupcamerashot = L0_0
function L0_0(A0_15)
  FireSequence("sm_tl_zoneb_visit1_wrapper.dog_tags_pickup 01.DogTagsMarker", "GP_DogTag")
end
DogTagsPickup2 = L0_0
function L0_0(A0_16)
  if GetGlobal("MS_dogtags") == 1 then
    ForEachEntityInGroup(DestroyEntity, "DogTagsGroup")
  end
end
DogTagsCheck = L0_0
function L0_0()
  local L0_17
  L0_17 = GetChildEntityByName
  L0_17 = L0_17("ssm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01", "GremlinWrench")
  Unhide(L0_17)
  SetGlobal("SM_Gremlin_OmegaDoor", 1)
  FireUser1("sm_tl_zoneb_igc.grabcamerafancy 04.FancyCameraLookAt 01")
  DisableMotion("sm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01")
  TeleportGremlinToEntity("sm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01", "sm_tl_zoneb_igc.Marker(Rotatable) 01")
  wait(1.2)
  EnterCutscene("sm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01")
  AnimVarInt("sm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01", VAR_Cutscene, 1)
  AnimEvent("sm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01", EVENT_Start_Cutscene)
  Print("opening door: " .. SM_OmegaDoorsOpened)
  if SM_OmegaDoorsOpened == 1 then
    AnimGBSequence("OmegaDoor", "Close")
  end
  SM_OmegaDoorsOpened = 2
  wait(3)
  TeleportGremlinToEntity("sm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01", "sm_tl_zoneb_igc.Marker(Rotatable) 02")
  wait(1)
  DestroyEntity("sm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01")
end
OmegaShutSpawners = L0_0
function L0_0()
  local L0_18
  L0_18 = Disable
  L0_18("sm_tl_zoneb.TriggerUse 01")
  L0_18 = GetChildEntityByName
  L0_18 = L0_18("ssm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01", "GremlinWrench")
  Unhide(L0_18)
  ForEachEntityInGroup(Unhide, "GremlinTV2Give")
  DisableMotion("sm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01")
  EnterCutscene("sm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01")
  AnimVarInt("sm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01", VAR_Cutscene, 1)
  AnimEvent("sm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01", EVENT_Start_Cutscene)
  wait(0.5)
  TeleportGremlinToEntity("sm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01", "sm_tl_zoneb_igc.Marker(Rotatable) 02")
  wait(1)
  DestroyEntity("sm_tl_zoneb_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01")
end
GiveTVsOmega = L0_0
function L0_0()
  Disable("sm_tl_zoneb.TriggerUse 02")
  FireThread(DeltaShutSpawner)
  wait(7)
  ForceSketched("SpawnerDoor2Toon")
end
ShutDownSpawnersDelta = L0_0
function L0_0()
  local L0_19
  L0_19 = GetChildEntityByName
  L0_19 = L0_19("sm_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01", "GremlinWrench")
  Unhide(L0_19)
  SetGlobal("SM_Gremlin_DeltaDoor", 1)
  FireUser1("sm_tl_zoneb_igc.grabcamerafancy 05.FancyCameraLookAt 01")
  DisableMotion("sm_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01")
  TeleportGremlinToEntity("sm_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01", "sm_tl_zoneb_igc.Marker(Rotatable) 03")
  wait(1.2)
  EnterCutscene("ssm_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01")
  AnimVarInt("sm_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01", VAR_Cutscene, 1)
  AnimEvent("sm_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01", EVENT_Start_Cutscene)
  if SM_DeltaDoorsOpened == 1 then
    AnimGBSequence("DeltaDoor", "Close")
  end
  SM_DeltaDoorsOpened = 2
  wait(3)
  TeleportGremlinToEntity("sm_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01", "sm_tl_zoneb_igc.Marker(Rotatable) 04")
  wait(1)
  DestroyEntity("sm_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01")
end
DeltaShutSpawner = L0_0
function L0_0()
  local L0_20
  L0_20 = Disable
  L0_20("sm_tl_zoneb.TriggerUse 02")
  L0_20 = ForEachEntityInGroup
  L0_20(Unhide, "GremlinTVGive")
  L0_20 = GetChildEntityByName
  L0_20 = L0_20("sm_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01", "GremlinWrench")
  Unhide(L0_20)
  ForEachEntityInGroup(Unhide, "GremlinTV2Give")
  DisableMotion("sm_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01")
  EnterCutscene("sm_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01")
  AnimVarInt("sm_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01", VAR_Cutscene, 1)
  AnimEvent("sm_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01", EVENT_Start_Cutscene)
  wait(0.5)
  TeleportGremlinToEntity("sm_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01", "sm_tl_zoneb_igc.Marker(Rotatable) 04")
  wait(1)
  DestroyEntity("m_tl_zoneb_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01")
end
GiveTVsDelta = L0_0
function L0_0()
  wait(2)
  FireThread(EpsilonShutTrams)
  wait(2)
  SetGlobal("SM_Rocket_trams_count", -25)
  Print("****************************************** TRAMSTOP *****************************")
  AnimGBSequence("TramAnimMasterInner", "Stop", false, 1)
  AnimGBSequence("TramAnimMasterOuter", "Stop", false, 1)
  ForEachEntityInGroup(DisableComponent, "SM_Rocket_trams", "Physics Stimulus Component")
end
ShutDownTramsEpsilon = L0_0
function L0_0()
  local L0_21
  L0_21 = GetChildEntityByName
  L0_21 = L0_21("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", "GremlinWrench")
  Unhide(L0_21)
  FireUser1("sm_tl_zoneb_story.grabcamerafancy 02.FancyCameraLookAt 01")
  DisableMotion("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
  TeleportGremlinToEntity("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", "sm_tl_zoneb_story.Marker(Rotatable) 01")
  wait(1.2)
  EnterCutscene("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
  AnimVarInt("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", VAR_Cutscene, 1)
  AnimEvent("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", EVENT_Start_Cutscene)
  wait(6)
  StartEmitters("sm_tl_zoneb_pickups.steam+marker_rotatable 01.SteamJet_Blast_01_parentable 08")
  StartEmitters("sm_tl_zoneb_pickups.steam+marker_rotatable 02.SteamJet_Blast_01_parentable 08")
  StartEmitters("sm_tl_zoneb_pickups.steam+marker_rotatable 03.SteamJet_Blast_01_parentable 08")
  wait(3)
  TeleportGremlinToEntity("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", "sm_tl_zoneb_story.Marker(Rotatable) 02")
  wait(1)
  DestroyEntity("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
  SaveQuestGlobal("SM_Rocket_trams_count")
end
EpsilonShutTrams = L0_0
function L0_0()
  wait(2)
  FireThread(EpsilonShutElectric)
  wait(2)
  SetGlobal("SM_TL_area_electrified", 10000)
  SetGlobal("SM_TL_LevelWin", 10000)
  SaveQuestGlobal("SM_TL_area_electrified")
end
ShutDownElectricEpsilon = L0_0
function L0_0()
  local L0_22
  L0_22 = GetChildEntityByName
  L0_22 = L0_22("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", "GremlinWrench")
  Unhide(L0_22)
  FireUser1("sm_tl_zoneb_story.grabcamerafancy 01.FancyCameraLookAt 01")
  DisableMotion("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
  TeleportGremlinToEntity("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", "sm_tl_zoneb_story.Marker(Rotatable) 03")
  wait(1.2)
  EnterCutscene("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
  AnimVarInt("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", VAR_Cutscene, 1)
  AnimEvent("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", EVENT_Start_Cutscene)
  wait(6)
  StartEmitters("sm_tl_zoneb_pickups.steam+marker_rotatable 01.SteamJet_Blast_01_parentable 08")
  StartEmitters("sm_tl_zoneb_pickups.steam+marker_rotatable 02.SteamJet_Blast_01_parentable 08")
  StartEmitters("sm_tl_zoneb_pickups.steam+marker_rotatable 03.SteamJet_Blast_01_parentable 08")
  wait(3)
  TeleportGremlinToEntity("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", "sm_tl_zoneb_story.Marker(Rotatable) 02")
  wait(1)
  DestroyEntity("sm_tl_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
end
EpsilonShutElectric = L0_0
function L0_0()
  if GetGlobal("SM_GearCamCount") == 1 or GetGlobal("SM_GearCam2Count") == 1 or GetGlobal("SM_GearCam3Count") == 1 then
    if GetGlobal("SM_GearCamCount") == 1 then
      SetGlobal("SM_GearCamCount", 10000)
      Disable("sm_tl_zoneb.TriggerRotate 24")
    elseif GetGlobal("SM_GearCam2Count") == 1 then
      SetGlobal("SM_GearCam2Count", 10000)
      Disable("sm_tl_zoneb.TriggerRotate 02")
    elseif GetGlobal("SM_GearCam3Count") == 1 then
      SetGlobal("SM_GearCam3Count", 10000)
      Disable("SM_Rocket_trams_Cam_Trigger")
    end
    RestrictCutSceneInput()
    GrabCamera("sm_tl_zoneb.CameraControlPoint 07", "GearCameraPointNode", CAMERA_LERP_TRANSITION, 3)
    wait(3)
    UnrestrictCutSceneInput()
    ReleaseCamera(CAMERA_LERP_TRANSITION, 3)
  end
end
GearCamFunc = L0_0
function L0_0()
  wait(2)
  LoadLevel(GetPlayer(), "Levels/TL_SpaceMountain_TronPete.Level")
end
TomorrowlandVisit1Beat = L0_0
function L0_0()
  wait(4)
end
TomorrowlandVisit1BeatStuff = L0_0
function L0_0()
  MoveToEntity(GetPlayer(), "SpaceMountainMickeyStart")
end
TomorrowlandVisit1StreamBeat = L0_0
function L0_0()
  MoveToEntity(GetPlayer(), "tl_shared.checkpoint_trigger+marker 01.CP_Marker")
end
TomorrowlandFinal2dStream = L0_0
function L0_0()
  SetGlobal("2dDirection", 0)
  DialogBoxAdvanced("Defeat pete, calm pete down", "Calm down", "Defeat")
  wait(0.3)
  if GetDialogResponse() == "No" then
    SetGlobal("MS_petetronicresolution", 0)
    SetGlobal("MS_MeanStreetProgress", 3)
    LoadLevel(GetPlayer(), "Levels/2D_Plutopia01.level")
  elseif GetDialogResponse() == "Yes" then
    SetGlobal("MS_petetronicresolution", 1)
    SetGlobal("MS_MeanStreetProgress", 3)
    LoadLevel(GetPlayer(), "Levels/2D_Plutopia01.level")
  end
end
TL_DEBUGPeteBeatPortalMagic = L0_0
function L0_0()
  local L0_23, L1_24
end
TL_SpaceMountainBark1 = L0_0
function L0_0()
  local L0_25, L1_26
end
TL_SpaceMountainBark3 = L0_0
function L0_0()
  FireSequence("sm_tl_zoneb_story.ConversationalTrigger 01", "SMB_Gus_Powerelevator")
end
TL_SpaceMountainBark4 = L0_0
L0_0 = 0
MickeyIN = L0_0
L0_0 = 0
fuseboxpainted = L0_0
L0_0 = 0
SND_Open = L0_0
L0_0 = 0
SND_Door_Previous = L0_0
function L0_0()
  fuseboxpainted = 1
  SM_ElevatordoorCheck()
end
TL_FuseboxPainted = L0_0
function L0_0()
  fuseboxpainted = 0
  SM_ElevatordoorCheck()
end
TL_FuseboxThinned = L0_0
function L0_0()
  MickeyIN = 1
  SM_ElevatordoorCheck()
end
TL_InElevator = L0_0
function L0_0()
  MickeyIN = 0
  SM_ElevatordoorCheck()
end
TL_OutElevator = L0_0
function L0_0()
  Print("******************************************************")
  Print(MickeyIN)
  Print(fuseboxpainted)
  if MickeyIN == 0 and fuseboxpainted == 0 then
    Print("******************************************************0 and 0")
    SplineFollower_StopAtPosition("sm_tl_zonebvisit1only.TL_SM_Gear1 02", "sm_tl_zonebvisit1only.SplineKnot 03", "sm_tl_zonebvisit1only.SplineKnot 02", 1)
    SND_Open = 0
  elseif MickeyIN == 1 and fuseboxpainted == 0 then
    Print("******************************************************1 and 0")
    SplineFollower_StopAtPosition("sm_tl_zonebvisit1only.TL_SM_Gear1 02", "sm_tl_zonebvisit1only.SplineKnot 03", "sm_tl_zonebvisit1only.SplineKnot 02", 0)
    SND_Open = 1
  elseif MickeyIN == 1 and fuseboxpainted == 1 then
    Print("******************************************************1 and 1")
    SplineFollower_StopAtPosition("sm_tl_zonebvisit1only.TL_SM_Gear1 02", "sm_tl_zonebvisit1only.SplineKnot 03", "sm_tl_zonebvisit1only.SplineKnot 02", 0)
    SND_Open = 1
  elseif MickeyIN == 0 and fuseboxpainted == 1 then
    Print("******************************************************0 and 1")
    SplineFollower_StopAtPosition("sm_tl_zonebvisit1only.TL_SM_Gear1 02", "sm_tl_zonebvisit1only.SplineKnot 03", "sm_tl_zonebvisit1only.SplineKnot 02", 0)
    SND_Open = 1
  end
  SND_Elevator_DoorSOUND()
end
SM_ElevatordoorCheck = L0_0
function L0_0()
  if SND_Open == 1 and SND_Door_Previous == 0 then
    SND_Door_Previous = 1
    AudioPostEventOn("sm_tl_zoneb_audio.Sound_SV_Door", "Play_sfx_TC_SV_Elevator_Door_Close")
  else
    if SND_Open == 0 and SND_Door_Previous == 1 then
      SND_Door_Previous = 0
      AudioPostEventOn("sm_tl_zoneb_audio.Sound_SV_Door", "Play_sfx_TC_SV_Elevator_Door_Open")
    else
    end
  end
end
SND_Elevator_DoorSOUND = L0_0
function L0_0()
  SetGlobal("SMB_PlayOtherInstructions", GetGlobal("SMB_PlayOtherInstructions") + 1)
  if GetGlobal("SMB_PlayOtherInstructions") == 1 then
    Wait(1)
    FireSequence("sm_tl_zoneb_story.ConversationalTrigger 01", "SMB_Gus_PipePuzzle")
  elseif GetGlobal("SMB_PlayOtherInstructions") == 2 then
    Wait(1)
    FireSequence("sm_tl_zoneb_story.ConversationalTrigger 01", "SMB_Gus_PipePuzzleDoneNext")
  elseif GetGlobal("SMB_PlayOtherInstructions") == 3 then
    Wait(1)
    FireSequence("sm_tl_zoneb_story.ConversationalTrigger 01", "SMB_Gus_PipePuzzlesDone")
  end
end
PlayOtherInstructions = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.8)
  LoadLevel(GetPlayer(), "Levels/TL_SpaceMountain_TronPete.Level")
end
TL_GOTOPetetronicFight = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("Space Voyage")
  PlayAndUnlockMovie("TL_visit1_Rocket_Broken.bik", "TL_visit1_Rocket_Broken")
end
OswaldFMVforSMV1 = L0_0
L0_0 = 0
BeetleworxDead = L0_0
function L0_0()
  if GetGlobal("TL_SM_ZoneB_MoviePlayed") == 0 and MickeyIN == 1 then
    PlayAndUnlockMovie("TL_visit1_Rocket_Broken.bik", "TL_visit1_Rocket_Broken")
    SetGlobal("TL_SM_ZoneB_MoviePlayed", 1)
  elseif GetGlobal("TL_SM_ZoneB_MoviePlayed") == 0 and BeetleworxDead == 1 then
    PlayAndUnlockMovie("TL_visit1_Rocket_Broken.bik", "TL_visit1_Rocket_Broken")
    SetGlobal("TL_SM_ZoneB_MoviePlayed", 1)
  end
end
CheckForIGC = L0_0
function L0_0()
  local L1_27
  L1_27 = 1
  BeetleworxDead = L1_27
end
BeetlworxDead = L0_0
function L0_0()
  local L1_28
  L1_28 = 0
  BeetleworxDead = L1_28
end
BeetlworxAlive = L0_0
L0_0 = 0
UFO1position = L0_0
L0_0 = 0
UFO1clear = L0_0
function L0_0()
  if UFO1position == 0 and UFO1clear == 0 then
    Print("*********************************************ROTATING TO BACK")
    FireUser1("sm_tl_zoneb.grabcamerafancy 02.FancyCameraLookAt 01")
    SetRotatorMaxSpeed("sm_tl_zoneb.TL_SpaceMount_DoorBridge_Inert 17", 30)
    StartRotateToPosition("sm_tl_zoneb.TL_SpaceMount_DoorBridge_Inert 17", -100)
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_SV_UFO")
    UFO1position = 1
    UFO1clear = 1
  elseif UFO1position == 1 and UFO1clear == 0 then
    Print("*********************************************RETURNING TO NORMAL")
    FireUser1("sm_tl_zoneb.grabcamerafancy 02.FancyCameraLookAt 01")
    SetRotatorMaxSpeed("sm_tl_zoneb.TL_SpaceMount_DoorBridge_Inert 17", 30)
    StartRotateToPosition("sm_tl_zoneb.TL_SpaceMount_DoorBridge_Inert 17", -9)
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_SV_UFO")
    UFO1position = 0
    UFO1clear = 1
  end
end
UFO1Rotation = L0_0
function L0_0()
  local L1_29
  L1_29 = 0
  UFO1clear = L1_29
end
UFO1clearVal = L0_0
L0_0 = 0
UFO2position = L0_0
L0_0 = 0
UFO2clear = L0_0
function L0_0()
  if UFO2position == 0 and UFO2clear == 0 then
    Print("*********************************************ROTATING TO BACK")
    Reverse("Space_Voyage_UFO2")
    SetRotatorMaxSpeed("Space_Voyage_UFO2", 30)
    StartRotateToPosition("Space_Voyage_UFO2", 90)
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_SV_UFO")
    UFO2position = 1
    UFO2clear = 1
  elseif UFO2position == 1 and UFO2clear == 0 then
    Print("*********************************************RETURNING TO NORMAL")
    SetSplineFollowerInitialSpeed("Space_Voyage_UFO2", 0)
  end
end
UFO2Rotation = L0_0
function L0_0()
  local L0_30, L1_31
end
UFO2clearVal = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "SM_TL_Load", "sm_tl_zoneb.Marker(Rotatable) 02")
end
SM_TL_ZoneB_SaveCheckpoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "SM_TL_Load", "sm_tl_zoneb.2ndFloorChkPnt")
end
SM_TL_ZoneB_SaveCheckpoint2 = L0_0
function L0_0()
  Mute()
  StartTrackingCurrentLevelForScoring("Space Voyage")
  DestroyEntity("sm_tl_zoneb.TriggerRotate 05")
  SM_ElevatordoorCheck()
  ForEachEntityInGroup(Unhide, "SM_Unhide")
  if GetGlobal("SMB_Gus_OpeningScene_Played") == 1 then
    AnimGBSequence("sm_tl_zoneb.TL_SM_Moonliner", "RestUp", true, 0, 0, true)
    Disable("sm_tl_zoneb.TL_SM_Gear1 05")
    Print("************************************************** TRAMSTARTLOADCP *******************")
    AnimGBSequence("TramAnimMasterOuter", "Start", true)
    AnimGBSequence("TramAnimMasterInner", "Start", true)
    ForEachEntityInGroup(Unhide, "SM_Unhide")
    Unhide("sm_tl_zoneb.BeetleworxCannonMix 07")
  end
  if 1 < GetGlobal("TL_SM_ExitTVCount") then
    wait(0.24)
    Unhide("sm_tl_zoneb.TriggerRotate 11")
    Enable("sm_tl_zoneb.TriggerRotate 11")
    SetGlobal("MS_MeanStreetProgress", 3)
  end
  if GetGlobal("SM_Gremlin_Epsilon") == 1 then
    if GetGlobal("SM_TL_area_electrified") > 50 then
      ForEachEntityInGroup(DestroyEntity, "ElectricArcsSet")
    elseif GetGlobal("SM_Rocket_trams_count") == -25 then
    end
  end
  if GetGlobal("SMB_Gus_OpeningScene_Played") == 1 then
    SM_SetTramSpeed()
    SM_TL_ElectricCarts()
  end
  if GetGlobal("SM_Gremlin_OmegaDoor") == 1 then
    ForceSketched("SpawnerDoor1ToonLook")
    DestroyEntity("SpawnerDoor1Omega")
  end
  if GetGlobal("SM_Gremlin_DeltaDoor") == 1 then
    ForceSketched("SpawnerDoor2Toon")
    DestroyEntity("SpawnerDoor2Delta")
  end
  Unhide("sm_tl_zonebvisit1only.TL_SM_Gear1 02")
  Enable("sm_tl_zoneb.Spawner 07")
  Unmute()
end
SM_TL_Load = L0_0
function L0_0()
  SaveQuestGlobal("TL_SM_ExitTVCount")
  SM_TL_ZoneB_SaveCheckpoint2()
end
TL_ZoneB_TVSaveCheckpoint = L0_0
function L0_0()
  SetGlobal("TT_goofypartsfound", GetGlobal("TT_goofypartsfound") + 1)
  SaveQuestGlobal("TT_goofypartsfound")
  FireSequence("sm_tl_zoneb_story.ConversationalTrigger 05", "GP_GoofyArm")
end
TL_ZoneB_GoofyChestSaveCheckpoint = L0_0
function L0_0()
  if GetGlobal("SMB_V2_Gus_MoreTentacles_Played") == 0 then
    SaveCheckpoint(GetPlayer(), "SM_TL_Load", "sm_tl_zoneb.2ndFloorChkPnt")
  elseif GetGlobal("SMB_V2_Gus_MoreTentacles_Played") == 1 then
    SaveCheckpoint(GetPlayer(), "SM_V2_LoadCheckpoint", "sm_tl_zoneb.2ndFloorChkPnt")
  end
end
SM_TL_ZoneB_redchestSaveCheckpoint = L0_0
function L0_0()
  SetGlobal("SM_Gremlin_Delta", 1)
end
SM_GremlinDeltafreed = L0_0
function L0_0()
  SetGlobal("SM_Gremlin_Omega", 1)
end
SM_GremlinOmegafreed = L0_0
function L0_0()
  SetGlobal("SM_Gremlin_Epsilon", 1)
end
SM_GremlinEpsilonfreed = L0_0
function L0_0(A0_32)
  Wait(1)
  SetHealth(A0_32, 0)
end
TL_SV_PeopleMover_Kill = L0_0
function L0_0()
  local L0_33, L1_34
  TomorrowlandVisit1BeatStuff = L0_33
  L0_33 = nil
  TomorrowlandVisit1Beat = L0_33
  L0_33 = nil
  TL_SM_ElevatorcheckThinner = L0_33
  L0_33 = nil
  TL_SM_Puzzle2Longpath2QuarterCountIncrease = L0_33
  L0_33 = nil
  SM_SetTramSpeed = L0_33
  L0_33 = nil
  SM_SetTramSpeedDecrease = L0_33
  L0_33 = nil
  ShutDownSpawnersDelta = L0_33
  L0_33 = nil
  UFO1Rotation = L0_33
  L0_33 = nil
  SM_SpawnerDoorsClose = L0_33
  L0_33 = nil
  SM_LevelWin = L0_33
  L0_33 = nil
  TL_SM_ElevatorcheckPaint = L0_33
  L0_33 = nil
  TL_SM_Puzzle2Longpath2countDecrease = L0_33
  L0_33 = nil
  TL_SM_TVExitCheckSetup = L0_33
  L0_33 = nil
  TL_ZoneB_TVSaveCheckpoint = L0_33
  L0_33 = nil
  TL_SM_Puzzle3Longpath3countDecrease = L0_33
  L0_33 = nil
  TL_SM_PuzzleCameraSet = L0_33
  L0_33 = nil
  SetupBaseCamTLSM = L0_33
  L0_33 = nil
  TL_SM_Puzzle3Longpath3countIncrease = L0_33
  L0_33 = nil
  TL_DEBUGPeteBeatPortalMagic = L0_33
  L0_33 = nil
  TL_SM_Puzzle2path2Check = L0_33
  L0_33 = nil
  GiveTVsDelta = L0_33
  L0_33 = nil
  SM_TL_ZoneB_SaveCheckpoint2 = L0_33
  L0_33 = nil
  TL_GotoMeanStreets = L0_33
  L0_33 = nil
  TL_SM_Puzzle1Longpath1QuarterCountIncrease = L0_33
  L0_33 = nil
  TL_SM_TVExitIncrease = L0_33
  L0_33 = nil
  ShutDownSpawnersOmega = L0_33
  L0_33 = nil
  SM_TL_ZoneB_redchestSaveCheckpoint = L0_33
  L0_33 = nil
  SM_TOPETEquest = L0_33
  L0_33 = nil
  TL_SM_Puzzle1Longpath1QuarterCountDecrease = L0_33
  L0_33 = nil
  TL_SM_Puzzle1Shortpath1countDecrease = L0_33
  L0_33 = nil
  TL_SM_Puzzle3Longpath3Quarter3CountIncrease = L0_33
  L0_33 = nil
  TL_SV_SaveAndShowHud = L0_33
  L0_33 = nil
  TL_SM_Puzzle1path1Check = L0_33
  L0_33 = nil
  TL_SM_Puzzle2Shortpath2countIncrease = L0_33
  L0_33 = nil
  SafteyCam = L0_33
  L0_33 = nil
  SM_TL_Load = L0_33
  L0_33 = nil
  TL_SM_Puzzle3Shortpath3countIncrease = L0_33
  L0_33 = nil
  TL_ZoneB_GoofyChestSaveCheckpoint = L0_33
  L0_33 = nil
  TomorrowlandFinal2dStream = L0_33
  L0_33 = nil
  TL_SM_Puzzle3Longpath3QuarterCountIncrease = L0_33
  L0_33 = nil
  ShutDownTramsEpsilon = L0_33
  L0_33 = nil
  SM_GremlinOmegafreed = L0_33
  L0_33 = nil
  TL_SM_Puzzle1Longpath1countIncrease = L0_33
  L0_33 = nil
  SM_TL_ElectricCarts = L0_33
  L0_33 = nil
  TL_SM_Puzzle1Shortpath1countIncrease = L0_33
  L0_33 = nil
  SM_TL_ZoneB_SaveCheckpoint = L0_33
  L0_33 = nil
  RocketSetupcamerashot = L0_33
  L0_33 = nil
  TL_SM_Puzzle1Longpath1countDecrease = L0_33
  L0_33 = nil
  SM_SetTramSpeedIncrease = L0_33
  L0_33 = nil
  TL_SM_Puzzle2Longpath2Quarter3CountDecrease = L0_33
  L0_33 = nil
  GiveTVsOmega = L0_33
  L0_33 = nil
  SM_SpawnerDoorsOpen = L0_33
  L0_33 = nil
  DeltaShutSpawner = L0_33
  L0_33 = nil
  TL_SM_Puzzle3Longpath3Quarter3CountDecrease = L0_33
  L0_33 = nil
  EpsilonShutElectric = L0_33
  L0_33 = nil
  ShutDownElectricEpsilon = L0_33
  L0_33 = nil
  TL_SM_Puzzle1Longpath1Quarter3CountDecrease = L0_33
  L0_33 = nil
  TL_Stream28 = L0_33
  L0_33 = nil
  TL_SM_Puzzle2Longpath2Quarter3CountIncrease = L0_33
  L0_33 = nil
  Intro_Setup = L0_33
  L0_33 = nil
  UFO1clearVal = L0_33
  L0_33 = nil
  TL_SM_Puzzle3Longpath3QuarterCountDecrease = L0_33
  L0_33 = nil
  TL_SM_Puzzle1Longpath1Quarter3CountIncrease = L0_33
  L0_33 = nil
  TL_OutElevator = L0_33
  L0_33 = nil
  TomorrowlandVisit1StreamBeat = L0_33
  L0_33 = nil
  TL_SM_Puzzle3Shortpath3countDecrease = L0_33
  L0_33 = nil
  TL_SpaceMountainBark3 = L0_33
  L0_33 = nil
  TL_FuseboxPainted = L0_33
  L0_33 = nil
  TL_FuseboxThinned = L0_33
  L0_33 = nil
  OmegaShutSpawners = L0_33
  L0_33 = nil
  TL_InElevator = L0_33
  L0_33 = nil
  SM_GremlinEpsilonfreed = L0_33
  L0_33 = nil
  PlayOtherInstructions = L0_33
  L0_33 = nil
  EpsilonShutTrams = L0_33
  L0_33 = nil
  SpaceVoyage2dStream = L0_33
  L0_33 = nil
  IntroFlycam = L0_33
  L0_33 = nil
  SM_ElevatordoorCheck = L0_33
  L0_33 = nil
  TL_SV_PeopleMover_Kill = L0_33
  L0_33 = nil
  UFO2clearVal = L0_33
  L0_33 = nil
  TL_Minihub_cam_shake = L0_33
  L0_33 = nil
  SM_GremlinDeltafreed = L0_33
  L0_33 = nil
  TL_SM_Puzzle2Longpath2QuarterCountDecrease = L0_33
  L0_33 = nil
  TL_SpaceMountainBark1 = L0_33
  L0_33 = nil
  TL_SM_Puzzle2Longpath2countIncrease = L0_33
  L0_33 = nil
  UFO2Rotation = L0_33
  L0_33 = nil
  TL_SM_Puzzle2Shortpath2countDecrease = L0_33
  L0_33 = nil
  TL_ZoneB_PUZZLESaveCheckpoint = L0_33
  L0_33 = nil
  TL_SM_TVExitCheck = L0_33
  L0_33 = nil
  DogTagsPickup2 = L0_33
  L0_33 = nil
  TL_SM_PuzzleCameraClear = L0_33
  L0_33 = nil
  TL_SpaceMountainBark4 = L0_33
  L0_33 = nil
  OswaldFMVforSMV1 = L0_33
  L0_33 = nil
  TL_GOTOPetetronicFight = L0_33
  L0_33 = nil
  GearCamFunc = L0_33
  L0_33 = nil
  Cleanup_TL_SpaceMountain = L0_33
end
Cleanup_TL_SpaceMountain = L0_0
function L0_0()
  DoStinger("IGC", 5)
end
MX_TC_CraneStinger = L0_0
