local L0_0, L1_1
function L0_0(A0_2)
  GetPrefabData(A0_2).MapLoad_SetupPosition = "True"
  OnMapLoad_ProjectorSetup(A0_2)
end
MJM_Setup_Launcher = L0_0
function L0_0()
  SetGlobal("MJM_AirlockProgress", 1)
  SaveCheckpoint(GetPlayer(), "MJM_AirlockLoadCheckpoint", "mjm_airlock3.Marker(Rotatable) 01")
end
MJM_Airlock_SaveCheckpoint = L0_0
function L0_0()
  if GetGlobal("MJM_AirlockProgress") == 1 then
    AnimGBSequence("mjm_airlock3.MJ_ZoneF_Door_01", "Closing")
    DestroyEntity("mjm_airlock3.PlaneTrigger_Enter")
    AudioPostEventOn(GetPlayer(), "Set_State_Amb_MJM_ThePiles_Outside")
    AudioPostEventOn(GetPlayer(), "Play_music_mickeyjunkmountain")
    AudioSetState(GetPlayer(), "Music_State", "Auto")
    StartTrackingCurrentLevelForScoring("MJM_Airlock3")
  end
end
MJM_AirlockLoadCheckpoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "MJM_AlpineALoadCheckpoint", "mjm_alpinea.Marker(Rotatable) 01")
  SetGlobal("MJM_AlpineAProgress", 1)
end
MJM_AlpineA_SaveCheckpoint0 = L0_0
function L0_0()
  if GetGlobal("MJM_AlpineAProgress") == 1 then
  elseif GetGlobal("MJM_AlpineAProgress") == 2 then
  end
end
MJM_AlpineALoadCheckpoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "MJM_AlpineBLoadCheckpoint", "mjm_alpineb.Marker(Rotatable) 01")
end
MJM_AlpineB_SaveCheckpoint0 = L0_0
function L0_0()
  if GetGlobal("MJM_AlpineBProgress") == 1 then
  elseif GetGlobal("MJM_AlpineBProgress") == 2 then
  end
end
MJM_AlpineBLoadCheckpoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "MJM_KnightLoadCheckpoint", "mjm_knighta.seq_projector 01.StartPositionLeft")
  SetGlobal("MJM_KnightProgress", 1)
end
MJM_Knight_SaveCheckpoint0 = L0_0
function L0_0()
  if GetGlobal("MJM_KnightProgress") == 1 then
  elseif GetGlobal("MJM_KnightProgress") == 2 then
  end
end
MJM_KnightLoadCheckpoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "MJM_GunsLoadCheckpoint", "mjm_gunsa.seq_projector 01.StartPositionLeft")
end
MJM_Guns_SaveCheckpoint0 = L0_0
function L0_0()
  if GetGlobal("MJM_GunsProgress") == 1 then
  elseif GetGlobal("MJM_GunsProgress") == 2 then
  end
end
MJM_GunsLoadCheckpoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "MJM_TrolleyLoadCheckpoint", "")
end
MJM_Trolley_SaveCheckpoint0 = L0_0
function L0_0()
  if GetGlobal("MJM_TrolleyProgress") == 1 then
  elseif GetGlobal("MJM_TrolleyProgress") == 2 then
  end
end
MJM_TrolleyLoadCheckpoint = L0_0
function L0_0()
  if GetGlobal("MJM_AboutOswaldMoviePlayed") == 0 then
    StartFadeOut(0.5)
    Wait(0.5)
    PlayAndUnlockMovie("GV_visit1_Establish_Oswald.bik", "GV_Visit1_Establish_Oswald")
    wait(0.1)
    SetGlobal("MJM_AboutOswaldMoviePlayed", 1)
    AnimGBSequence("mjm_airlock3.MJ_ZoneF_Door_01", "Closing")
    EndTrackingCurrentLevelForScoring("MJM_Slopes")
    StartTrackingCurrentLevelForScoring("MJM_Airlock3")
    FireSequence("Gus", "MJM_Gus_QuestEnder")
    Wait(0.25)
    MJM_Stream6()
    StartFadeIn(0.5)
    Wait(0.5)
    MJM_Airlock_SaveCheckpoint()
  end
end
AboutOswaldBink = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("MJM_Slopes")
end
MJM_AirlockToonTrackStart = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_1")
end
MJM_Stream1 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_2")
end
MJM_Stream2 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_3")
end
MJM_Stream3 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_4")
end
MJM_Stream4 = L0_0
function L0_0(A0_3)
  StreamZones(GetPlayer(), "stream_5")
  wait(0.1)
  SaveCheckpointSelf(A0_3)
end
MJM_Stream5 = L0_0
function L0_0()
  StreamInterior(nil, "stream_empty")
  StreamZones(GetPlayer(), "stream_6")
  StreamInterior(GetPlayer(), "stream_17_int")
end
MJM_Stream6 = L0_0
function L0_0()
  ActivateScene("environments/thepark/mickeyjunkmountain/gsa/mjm_zonef.gsa")
end
MJM_Stream6_Activate = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_7")
end
MJM_Stream7 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_8")
end
MJM_Stream8 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_9")
end
MJM_Stream9 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_10")
end
MJM_Stream10 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_11")
end
MJM_Stream11 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_12")
end
MJM_Stream12 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_13")
end
MJM_Stream13 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_14")
end
MJM_Stream14 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_15")
end
MJM_Stream15 = L0_0
function L0_0(A0_4)
  StreamZones(GetPlayer(), "stream_16")
  wait(0.1)
  SaveCheckpointSelf(A0_4)
end
MJM_Stream16 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_17")
end
MJM_Stream17 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_18")
end
MJM_Stream18 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_19")
end
MJM_Stream19 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_20")
end
MJM_Stream20 = L0_0
function L0_0(A0_5)
  if GetGlobal("Global_QuickstartLocation") == 0 then
    SetGlobal("Global_QuickstartLocation", 1)
    MoveToEntity(GetPlayer(), A0_5)
  end
end
DEBUG_StartTeleport = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_15")
  WaitForLevelLoad()
  TeleportToEntity(GetPlayer(), "mjm_zonee.Marker(Parentable) 04")
end
MJM_TeleporttoZoneE = L0_0
function L0_0()
  LoadLevel(GetPlayer(), "Levels/ShadowBlot_Boss.level")
end
MJM_TeleporttoBoss = L0_0
function L0_0()
  DialogBoxAdvanced("You beat the boss, but how?", "Escaped", "Defeated")
  wait(0.25)
  if GetDialogResponse() == "No" then
    SetGlobal("TT_ToonTownProgress", 3)
    SetGlobal("NO_NewOrleansProgress", 3)
    SetGlobal("MJ_ShadowBlotResolution", 0)
    LoadLevel(GetPlayer(), "Levels/ToonTown_V3.level")
    SetGlobal("HUB_startposition", 2)
  elseif GetDialogResponse() == "Yes" then
    SetGlobal("TT_ToonTownProgress", 3)
    SetGlobal("NO_NewOrleansProgress", 3)
    SetGlobal("MJ_ShadowBlotResolution", 1)
    LoadLevel(GetPlayer(), "Levels/ToonTown_V3.level")
    SetGlobal("HUB_startposition", 2)
  end
end
MJM_BossDefeat = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "Levels/MJM_ZoneG.level")
end
MJM_TeleportAG = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "Levels/MJM_ZoneE.level")
end
MJM_TeleportGE = L0_0
function L0_0()
  SetPropertyBool(target, "Start Disabled", false)
end
MJM_TV_On = L0_0
function L0_0()
  SetPropertyBool(target, "Start Disabled", true)
end
MJM_TV_Off = L0_0
function L0_0()
  Enable("tvObject")
end
MJM_TV_DOIT = L0_0
function L0_0()
  Disable("tvObject")
end
MJM_TV_STOP = L0_0
function L0_0()
  SetCameraAttributes("mjm_knighta._Marker(CameraOverride)")
end
MJM_KnightCameraOn = L0_0
function L0_0()
  ClearCameraHintAll(GetPlayer())
  UnrestrictCutSceneInput()
end
MJM_KnightCameraOff = L0_0
function L0_0()
  SetCameraAttributes("mjm_gunsa._Marker(CameraOverride)")
end
MJM_GunsCameraOn = L0_0
function L0_0()
  SetCameraAttributes("mjm_trolleya._Marker(CameraOverride)")
end
MJM_TrolleyCameraOn = L0_0
function L0_0()
  StreamInterior(nil, "stream_empty")
end
MJM_InteriorClear = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_G2")
  StreamInterior(GetPlayer(), "stream_g2_start")
end
MJM_StreamG2 = L0_0
function L0_0()
  ForceSequence("Gus", "MJM_Gus_ClockPainted")
end
MJM_Clockbark = L0_0
L0_0 = 0
previousPaint = L0_0
L0_0 = 0
previousThinner = L0_0
function L0_0()
  local L0_6
  L0_6 = wait
  L0_6(0.5)
  L0_6 = Print
  L0_6("MJM_AirlockPaintGear")
  L0_6 = Print
  L0_6("GetPrefabData('MJMnozzle').Prefab_Paint: " .. GetPrefabData("MJMnozzle").Prefab_Paint)
  L0_6 = Print
  L0_6("GetPrefabData('MJMnozzle').Prefab_Thinner: " .. GetPrefabData("MJMnozzle").Prefab_Thinner)
  L0_6 = previousThinner
  L0_6 = L0_6 > GetPrefabData("MJMnozzle").Prefab_Thinner
  Print("shouldMoveThinnerGear: ")
  Print(L0_6)
  previousThinner = GetPrefabData("MJMnozzle").Prefab_Thinner
  previousPaint = GetPrefabData("MJMnozzle").Prefab_Paint
  if GetPrefabData("MJMnozzle").Prefab_MachineRunning == 0 then
    if GetPrefabData("MJMnozzle").Prefab_Paint == 1 then
      AudioPostEventOn("mjm_zonegairlock.MJ_Paint_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_P")
      SetSplineFollowerInitialSpeed("mjm_zonegairlock.MJ_Paint_Gear01 01", 5)
      SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Paint_Gear01 01", "mjm_zonegairlock.SplineKnot 06", "mjm_zonegairlock.SplineKnot 10", 0.25)
    elseif GetPrefabData("MJMnozzle").Prefab_Paint == 2 then
      AudioPostEventOn("mjm_zonegairlock.MJ_Paint_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_P")
      SetSplineFollowerInitialSpeed("mjm_zonegairlock.MJ_Paint_Gear01 01", 5)
      SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Paint_Gear01 01", "mjm_zonegairlock.SplineKnot 06", "mjm_zonegairlock.SplineKnot 10", 0.5)
      if L0_6 == true then
        AudioPostEventOn("mjm_zonegairlock.MJ_Thinner_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_T")
        SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Thinner_Gear01 01", "mjm_zonegairlock.SplineKnot 01", "mjm_zonegairlock.SplineKnot 04", 0.5)
      end
    elseif GetPrefabData("MJMnozzle").Prefab_Paint == 3 then
      AudioPostEventOn("mjm_zonegairlock.MJ_Paint_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_P")
      SetSplineFollowerInitialSpeed("mjm_zonegairlock.MJ_Paint_Gear01 01", 5)
      SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Paint_Gear01 01", "mjm_zonegairlock.SplineKnot 06", "mjm_zonegairlock.SplineKnot 10", 0.75)
      if L0_6 == true then
        AudioPostEventOn("mjm_zonegairlock.MJ_Thinner_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_T")
        SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Thinner_Gear01 01", "mjm_zonegairlock.SplineKnot 01", "mjm_zonegairlock.SplineKnot 04", 0.25)
      end
    end
  end
end
MJM_AirlockPaintGear = L0_0
function L0_0()
  AudioPostEventOn("mjm_zonegairlock.MJ_Paint_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_P")
  SetSplineFollowerInitialSpeed("mjm_zonegairlock.MJ_Paint_Gear01 01", 5)
  SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Paint_Gear01 01", "mjm_zonegairlock.SplineKnot 06", "mjm_zonegairlock.SplineKnot 10", 1)
  AudioPostEventOn("mjm_zonegairlock.MJ_Thinner_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_T")
  SetSplineFollowerInitialSpeed("mjm_zonegairlock.MJ_Thinner_Gear01 01", 5)
  SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Thinner_Gear01 01", "mjm_zonegairlock.SplineKnot 01", "mjm_zonegairlock.SplineKnot 04", 0)
  wait(1)
  SetRotatorMaxSpeed("mjm_zonegairlock.MJ_Paint_Gear01 01", 100)
  AnimGBSequence("mjm_zonegairlock.MJ_ZoneG_Door02 01", "Opening")
  DisableGuardianHint("mjm_zonegairlock.PlayerHintMarkers 01")
  SetGlobal("MJM_PilesProgress", 10)
  Hide("mjm_zonegairlock.Trigger_CameraOverride 01")
  ClearAllCameraAttributesTimed(2)
  SaveCheckpoint(GetPlayer(), "MJM_PilesLoadCheckpoint", "mjm_zonegairlock.Marker(Rotatable) 02")
  AudioPostEventOn("mjm_zonegairlock_audio.Sound_Marker_Door3", "Play_sfx_MJM_AirlockG_Door1_Open")
  wait(0.2)
  AudioPostEventOn(GetPlayer(), "Set_State_Amb_MJM_ThePiles_Conveyer1")
  MultiPosSoundStart("mjm_zoneg2_audio.Sound_Marker_exhaust_loop_cntrl")
  MultiPosSoundStart("mjm_zoneg2_audio.Sound_Marker_conveyerLP_control")
  MultiPosSoundStop("mjm_zonegairlock_audio.Sound_Airlock_rmbl_CTRL")
  MultiPosSoundStart("mjm_zoneg2_audio.Sound_Marker_exhaust_loop_cntrl")
  MultiPosSoundStart("mjm_zoneg2_audio.Sound_Marker_conveyerLP_control")
  MultiPosSoundStop("mjm_zonegairlock_audio.Sound_Airlock_rmbl_CTRL")
end
MJM_AirlockPaintFinish = L0_0
function L0_0()
  local L0_7
  L0_7 = wait
  L0_7(0.5)
  L0_7 = Print
  L0_7("MJM_AirlockThinnerGear")
  L0_7 = Print
  L0_7("GetPrefabData('MJMnozzle').Prefab_Paint: " .. GetPrefabData("MJMnozzle").Prefab_Paint)
  L0_7 = Print
  L0_7("GetPrefabData('MJMnozzle').Prefab_Thinner: " .. GetPrefabData("MJMnozzle").Prefab_Thinner)
  L0_7 = previousPaint
  L0_7 = L0_7 > GetPrefabData("MJMnozzle").Prefab_Paint
  Print("shouldMovePaintGear: ")
  Print(L0_7)
  previousPaint = GetPrefabData("MJMnozzle").Prefab_Paint
  previousThinner = GetPrefabData("MJMnozzle").Prefab_Thinner
  if GetPrefabData("MJMnozzle").Prefab_MachineRunning == 0 then
    if GetPrefabData("MJMnozzle").Prefab_Thinner == 1 then
      AudioPostEventOn("mjm_zonegairlock.MJ_Thinner_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_T")
      SetSplineFollowerInitialSpeed("mjm_zonegairlock.MJ_Thinner_Gear01 01", 5)
      SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Thinner_Gear01 01", "mjm_zonegairlock.SplineKnot 01", "mjm_zonegairlock.SplineKnot 04", 0.25)
    elseif GetPrefabData("MJMnozzle").Prefab_Thinner == 2 then
      AudioPostEventOn("mjm_zonegairlock.MJ_Thinner_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_T")
      SetSplineFollowerInitialSpeed("mjm_zonegairlock.MJ_Thinner_Gear01 01", 5)
      SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Thinner_Gear01 01", "mjm_zonegairlock.SplineKnot 01", "mjm_zonegairlock.SplineKnot 04", 0.5)
      if L0_7 == true then
        AudioPostEventOn("mjm_zonegairlock.MJ_Paint_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_P")
        SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Paint_Gear01 01", "mjm_zonegairlock.SplineKnot 06", "mjm_zonegairlock.SplineKnot 10", 0.5)
      end
    elseif GetPrefabData("MJMnozzle").Prefab_Thinner == 3 then
      AudioPostEventOn("mjm_zonegairlock.MJ_Thinner_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_T")
      SetSplineFollowerInitialSpeed("mjm_zonegairlock.MJ_Thinner_Gear01 01", 5)
      SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Thinner_Gear01 01", "mjm_zonegairlock.SplineKnot 01", "mjm_zonegairlock.SplineKnot 04", 0.75)
      if L0_7 == true then
        AudioPostEventOn("mjm_zonegairlock.MJ_Paint_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_P")
        SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Paint_Gear01 01", "mjm_zonegairlock.SplineKnot 06", "mjm_zonegairlock.SplineKnot 10", 0.25)
      end
    end
  end
end
MJM_AirlockThinnerGear = L0_0
function L0_0()
  AudioPostEventOn("mjm_zonegairlock.MJ_Thinner_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_T")
  SetSplineFollowerInitialSpeed("mjm_zonegairlock.MJ_Thinner_Gear01 01", 5)
  SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Thinner_Gear01 01", "mjm_zonegairlock.SplineKnot 01", "mjm_zonegairlock.SplineKnot 04", 1)
  AudioPostEventOn("mjm_zonegairlock.MJ_Paint_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_P")
  SetSplineFollowerInitialSpeed("mjm_zonegairlock.MJ_Paint_Gear01 01", 5)
  SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Paint_Gear01 01", "mjm_zonegairlock.SplineKnot 06", "mjm_zonegairlock.SplineKnot 10", 0)
  wait(1)
  AudioPostEventOn("mjm_zonegairlock.MJ_Thinner_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_T")
  SetSplineFollowerInitialSpeed("mjm_zonegairlock.MJ_Thinner_Gear01 01", 5)
  SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Thinner_Gear01 01", "mjm_zonegairlock.SplineKnot 04", "mjm_zonegairlock.SplineKnot 05", 1)
  wait(1)
  SetRotatorMaxSpeed("mjm_zonegairlock.MJ_Thinner_Gear01 01", 100)
  AnimGBSequence("mjm_zonegairlock.MJ_ZoneG_Door03 01", "Opening")
  DisableGuardianHint("mjm_zonegairlock.PlayerHintMarkers 01")
  SetGlobal("MJM_PilesProgress", 11)
  Hide("mjm_zonegairlock.Trigger_CameraOverride 01")
  ClearAllCameraAttributesTimed(2)
  SaveCheckpoint(GetPlayer(), "MJM_PilesLoadCheckpoint", "mjm_zonegairlock.Marker(Rotatable) 02")
  AudioPostEventOn("mjm_zonegairlock_audio.Sound_Marker_Door2", "Play_sfx_MJM_AirlockG_Door1_Open")
  wait(0.2)
  MultiPosSoundStart("mjm_zoneg2_audio.Sound_Marker_engineblock_ctrllr")
  AudioPostEventOn(GetPlayer(), "Play_sfx_MJM_Amb")
  AudioSetState(GetPlayer(), "Amb_MJM_ThePiles_Outside")
  MultiPosSoundStart("mjm_zoneg2_audio.Sound_Marker_engineblock_ctrllr")
end
MJM_AirlockThinnerFinish = L0_0
function L0_0()
  StartFadeOut(0.5)
  wait(1)
  TeleportToEntity(GetPlayer(), "mjm_zonegairlock.Marker(Rotatable) 01")
  AnimGBSequence("mjm_zonegairlock.MJ_ZoneG_Door01 01", "Closing")
  FireSequence("Gus", "MJM_Gus_SpladooshIntroduction")
  wait(0.1)
  MJM_StreamG2()
end
NewKamikazeIntro = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "Levels/MJM_ZoneE.level")
end
MJM_LoadToSlopes = L0_0
function L0_0(A0_8)
  if A0_8 == GetPlayer() then
    Print("MJM_DeathFreeze activated")
    FreezeCamera()
  end
end
MJM_DeathFreeze = L0_0
