-- Fully reworked

function MJM_Setup_Launcher(param1)
  GetPrefabData(param1).MapLoad_SetupPosition = "True"
  OnMapLoad_ProjectorSetup(param1)
end

function MJM_Airlock_SaveCheckpoint()
  SetGlobal("MJM_AirlockProgress", 1)
  SaveCheckpoint(GetPlayer(), "MJM_AirlockLoadCheckpoint", "mjm_airlock3.Marker(Rotatable) 01")
end

function MJM_AirlockLoadCheckpoint()
  if GetGlobal("MJM_AirlockProgress") == 1 then
    AnimGBSequence("mjm_airlock3.MJ_ZoneF_Door_01", "Closing")
    DestroyEntity("mjm_airlock3.PlaneTrigger_Enter")
    AudioPostEventOn(GetPlayer(), "Set_State_Amb_MJM_ThePiles_Outside")
    AudioPostEventOn(GetPlayer(), "Play_music_mickeyjunkmountain")
    AudioSetState(GetPlayer(), "Music_State", "Auto")
    StartTrackingCurrentLevelForScoring("MJM_Airlock3")
  end
end

function MJM_AlpineA_SaveCheckpoint0()
  SaveCheckpoint(GetPlayer(), "MJM_AlpineALoadCheckpoint", "mjm_alpinea.Marker(Rotatable) 01")
  SetGlobal("MJM_AlpineAProgress", 1)
end

function MJM_AlpineALoadCheckpoint()
  if GetGlobal("MJM_AlpineAProgress") == 1 then
  elseif GetGlobal("MJM_AlpineAProgress") == 2 then
  end
end

function MJM_AlpineB_SaveCheckpoint0()
  SaveCheckpoint(GetPlayer(), "MJM_AlpineBLoadCheckpoint", "mjm_alpineb.Marker(Rotatable) 01")
end

function MJM_AlpineBLoadCheckpoint()
  if GetGlobal("MJM_AlpineBProgress") == 1 then
  elseif GetGlobal("MJM_AlpineBProgress") == 2 then
  end
end

function MJM_Knight_SaveCheckpoint0()
  SaveCheckpoint(GetPlayer(), "MJM_KnightLoadCheckpoint", "mjm_knighta.seq_projector 01.StartPositionLeft")
  SetGlobal("MJM_KnightProgress", 1)
end

function MJM_KnightLoadCheckpoint()
  if GetGlobal("MJM_KnightProgress") == 1 then
  elseif GetGlobal("MJM_KnightProgress") == 2 then
  end
end

function MJM_Guns_SaveCheckpoint0()
  SaveCheckpoint(GetPlayer(), "MJM_GunsLoadCheckpoint", "mjm_gunsa.seq_projector 01.StartPositionLeft")
end

function MJM_GunsLoadCheckpoint()
  if GetGlobal("MJM_GunsProgress") == 1 then
  elseif GetGlobal("MJM_GunsProgress") == 2 then
  end
end

function MJM_Trolley_SaveCheckpoint0()
  SaveCheckpoint(GetPlayer(), "MJM_TrolleyLoadCheckpoint", "")
end

function MJM_TrolleyLoadCheckpoint()
  if GetGlobal("MJM_TrolleyProgress") == 1 then
  elseif GetGlobal("MJM_TrolleyProgress") == 2 then
  end
end

function AboutOswaldBink()
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

function MJM_AirlockToonTrackStart()
  EndTrackingCurrentLevelForScoring("MJM_Slopes")
end

function MJM_Stream1()
  StreamZones(GetPlayer(), "stream_1")
end

function MJM_Stream2()
  StreamZones(GetPlayer(), "stream_2")
end

function MJM_Stream3()
  StreamZones(GetPlayer(), "stream_3")
end

function MJM_Stream4()
  StreamZones(GetPlayer(), "stream_4")
end

function MJM_Stream5(param1)
  StreamZones(GetPlayer(), "stream_5")
  wait(0.1)
  SaveCheckpointSelf(param1)
end

function MJM_Stream6()
  StreamInterior(nil, "stream_empty")
  StreamZones(GetPlayer(), "stream_6")
  StreamInterior(GetPlayer(), "stream_17_int")
end

function MJM_Stream6_Activate()
  ActivateScene("environments/thepark/mickeyjunkmountain/gsa/mjm_zonef.gsa")
end

function MJM_Stream7()
  StreamZones(GetPlayer(), "stream_7")
end

function MJM_Stream8()
  StreamZones(GetPlayer(), "stream_8")
end

function MJM_Stream9()
  StreamZones(GetPlayer(), "stream_9")
end

function MJM_Stream10()
  StreamZones(GetPlayer(), "stream_10")
end

function MJM_Stream11()
  StreamZones(GetPlayer(), "stream_11")
end

function MJM_Stream12()
  StreamZones(GetPlayer(), "stream_12")
end

function MJM_Stream13()
  StreamZones(GetPlayer(), "stream_13")
end

function MJM_Stream14()
  StreamZones(GetPlayer(), "stream_14")
end

function MJM_Stream15()
  StreamZones(GetPlayer(), "stream_15")
end

function MJM_Stream16(param1)
  StreamZones(GetPlayer(), "stream_16")
  wait(0.1)
  SaveCheckpointSelf(param1)
end

function MJM_Stream17()
  StreamZones(GetPlayer(), "stream_17")
end

function MJM_Stream18()
  StreamZones(GetPlayer(), "stream_18")
end

function MJM_Stream19()
  StreamZones(GetPlayer(), "stream_19")
end

function MJM_Stream20()
  StreamZones(GetPlayer(), "stream_20")
end

function DEBUG_StartTeleport(param1)
  if GetGlobal("Global_QuickstartLocation") == 0 then
    SetGlobal("Global_QuickstartLocation", 1)
    MoveToEntity(GetPlayer(), param1)
  end
end

function MJM_TeleporttoZoneE()
  StreamZones(GetPlayer(), "stream_15")
  WaitForLevelLoad()
  TeleportToEntity(GetPlayer(), "mjm_zonee.Marker(Parentable) 04")
end

function MJM_TeleporttoBoss()
  LoadLevel(GetPlayer(), "Levels/ShadowBlot_Boss.level")
end

function MJM_BossDefeat()
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

function MJM_TeleportAG()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "Levels/MJM_ZoneG.level")
end

function MJM_TeleportGE()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "Levels/MJM_ZoneE.level")
end

function MJM_TV_On()
  SetPropertyBool(target, "Start Disabled", false)
end

function MJM_TV_Off()
  SetPropertyBool(target, "Start Disabled", true)
end

function MJM_TV_DOIT()
  Enable("tvObject")
end

function MJM_TV_STOP()
  Disable("tvObject")
end

function MJM_KnightCameraOn()
  SetCameraAttributes("mjm_knighta._Marker(CameraOverride)")
end

function MJM_KnightCameraOff()
  ClearCameraHintAll(GetPlayer())
  UnrestrictCutSceneInput()
end

function MJM_GunsCameraOn()
  SetCameraAttributes("mjm_gunsa._Marker(CameraOverride)")
end

function MJM_TrolleyCameraOn()
  SetCameraAttributes("mjm_trolleya._Marker(CameraOverride)")
end

function MJM_InteriorClear()
  StreamInterior(nil, "stream_empty")
end

function MJM_StreamG2()
  StreamZones(GetPlayer(), "stream_G2")
  StreamInterior(GetPlayer(), "stream_g2_start")
end

function MJM_Clockbark()
  ForceSequence("Gus", "MJM_Gus_ClockPainted")
end

previousPaint = 0
previousThinner = 0

function MJM_AirlockPaintGear()
  local var1
  wait(0.5)
  Print("MJM_AirlockPaintGear")
  Print("GetPrefabData('MJMnozzle').Prefab_Paint: " .. GetPrefabData("MJMnozzle").Prefab_Paint)
  Print("GetPrefabData('MJMnozzle').Prefab_Thinner: " .. GetPrefabData("MJMnozzle").Prefab_Thinner)
  var1 = previousThinner > GetPrefabData("MJMnozzle").Prefab_Thinner
  Print("shouldMoveThinnerGear: ")
  Print(var1)
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
      if var1 == true then
        AudioPostEventOn("mjm_zonegairlock.MJ_Thinner_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_T")
        SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Thinner_Gear01 01", "mjm_zonegairlock.SplineKnot 01", "mjm_zonegairlock.SplineKnot 04", 0.5)
      end
    elseif GetPrefabData("MJMnozzle").Prefab_Paint == 3 then
      AudioPostEventOn("mjm_zonegairlock.MJ_Paint_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_P")
      SetSplineFollowerInitialSpeed("mjm_zonegairlock.MJ_Paint_Gear01 01", 5)
      SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Paint_Gear01 01", "mjm_zonegairlock.SplineKnot 06", "mjm_zonegairlock.SplineKnot 10", 0.75)
      if var1 == true then
        AudioPostEventOn("mjm_zonegairlock.MJ_Thinner_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_T")
        SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Thinner_Gear01 01", "mjm_zonegairlock.SplineKnot 01", "mjm_zonegairlock.SplineKnot 04", 0.25)
      end
    end
  end
end

function MJM_AirlockPaintFinish()
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

function MJM_AirlockThinnerGear()
  local var1
  wait(0.5)
  Print("MJM_AirlockThinnerGear")
  Print("GetPrefabData('MJMnozzle').Prefab_Paint: " .. GetPrefabData("MJMnozzle").Prefab_Paint)
  Print("GetPrefabData('MJMnozzle').Prefab_Thinner: " .. GetPrefabData("MJMnozzle").Prefab_Thinner)
  var1 = previousPaint > GetPrefabData("MJMnozzle").Prefab_Paint
  Print("shouldMovePaintGear: ")
  Print(var1)
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
      if var1 == true then
        AudioPostEventOn("mjm_zonegairlock.MJ_Paint_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_P")
        SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Paint_Gear01 01", "mjm_zonegairlock.SplineKnot 06", "mjm_zonegairlock.SplineKnot 10", 0.5)
      end
    elseif GetPrefabData("MJMnozzle").Prefab_Thinner == 3 then
      AudioPostEventOn("mjm_zonegairlock.MJ_Thinner_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_T")
      SetSplineFollowerInitialSpeed("mjm_zonegairlock.MJ_Thinner_Gear01 01", 5)
      SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Thinner_Gear01 01", "mjm_zonegairlock.SplineKnot 01", "mjm_zonegairlock.SplineKnot 04", 0.75)
      if var1 == true then
        AudioPostEventOn("mjm_zonegairlock.MJ_Paint_Gear01 01", "Play_sfx_MJM_AirlockG_flr_gear_slide_P")
        SplineFollower_StopAtPosition("mjm_zonegairlock.MJ_Paint_Gear01 01", "mjm_zonegairlock.SplineKnot 06", "mjm_zonegairlock.SplineKnot 10", 0.25)
      end
    end
  end
end

function MJM_AirlockThinnerFinish()
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

function NewKamikazeIntro()
  StartFadeOut(0.5)
  wait(1)
  TeleportToEntity(GetPlayer(), "mjm_zonegairlock.Marker(Rotatable) 01")
  AnimGBSequence("mjm_zonegairlock.MJ_ZoneG_Door01 01", "Closing")
  FireSequence("Gus", "MJM_Gus_SpladooshIntroduction")
  wait(0.1)
  MJM_StreamG2()
end

function MJM_LoadToSlopes()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "Levels/MJM_ZoneE.level")
end

function MJM_DeathFreeze(param1)
  if param1 == GetPlayer() then
    Print("MJM_DeathFreeze activated")
    FreezeCamera()
  end
end