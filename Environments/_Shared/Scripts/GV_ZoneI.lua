local L0_0, L1_1
function L0_0()
  SetDefaultCameraValues(4.5, 12, -10)
  SetMap(nil, "MAP_GV_ZONEI", "GAME")
  StartTrackingCurrentLevelForScoring("GV_ZoneI")
  Hide("gv_zonei_dynamic.GV_ZoneI_Cage_Door_Down")
  Hide("gv_zonei_dynamic.GV_ZoneI_Tower_DownCollision")
  Hide("gv_zonei_dynamic.GV_ZoneI_ETower_DownCollision")
  AnimGBSequence("GV_ZoneI_BoatAnims1", "Loop2")
  AnimGBSequence("GV_ZoneI_BoatAnims2", "Loop2", false, 0, 7)
  GV_ZoneI_SetUpGuardianHints()
end
GV_ZoneI_MiscSetup = L0_0
function L0_0()
  StreamInterior(nil, "stream_8_Audio_Collesium")
end
GV_ZoneI_AudioStream_Colisem = L0_0
function L0_0()
  StreamInterior(nil, "stream_10b")
end
GV_ZoneI_StreamInSteamC = L0_0
function L0_0()
  GV_ZoneI_AudioStream_Colisem()
end
GV_ZoneI_SetupTopColiseumAudio = L0_0
function L0_0()
  Wait(1)
  StreamZones(nil, "stream_8")
end
GV_StreamInZoneI_Flowers = L0_0
function L0_0()
  local L0_2, L1_3
end
GV_ZoneI_StreamOutZoneI = L0_0
function L0_0()
  if GetGlobal("GV_Arena_Pete_Intro_Played") == 0 then
    if GetGlobal("GV_ZoneI_Shortcut") == 0 then
      EnableGuardianHint("PlayerHint_Clouds")
    end
    if GetGlobal("GV_ZoneI_Tower") == 0 then
      EnableGuardianHint("PlayerHint_Pillars")
      if GetGlobal("GV_ZoneI_Boats") == 0 then
        EnableGuardianHint("PlayerHint_Pump")
      end
    end
    if GetGlobal("GV_ZoneI_ETowerComplete") == 0 then
      EnableGuardianHint("PlayerHint_Eifel")
    end
    EnableGuardianHint("PlayerHint_Flowers")
    EnableGuardianHint("PlayerHint_FrontEntrance")
    EnableGuardianHint("PlayerHint_BackEntrance")
  end
  if GetGlobal("GV_Arena_Pete_Intro_Played") == 0 then
    if GetGlobal("GV_ZoneI_GusColiseumIntro_Played") == 0 then
      FireThread(GuardianPrefab_PopulateGuardians, "Euro_GuardianSpawner_Eifel")
    else
      FireThread(GuardianPrefab_PopulateGuardians, "Euro_GuardianSpawner_Arena")
    end
  else
    FireThread(GuardianPrefab_PopulateGuardians, "Euro_GuardianSpawner_Arena")
  end
end
GV_ZoneI_SetUpGuardianHints = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "GV_ZoneI_LoadCheckpoint", "GV_ZoneI_ColiseumSafeMarker01")
end
GV_ZoneI_ConceptArtCheckPoint = L0_0
function L0_0(A0_4)
  Print("******************** GV_ZoneI_LoadCheckpoint()")
  GV_ZoneI_NoIntro = true
  if GetGlobal("GV_ZoneI_Shortcut") == 1 then
    ForEachEntityInGroup(DestroyEntity, "gv_zonei.Trigger_ColiseumEnterChat")
  end
  if GetGlobal("GV_Arena_Pete_Intro_Played") == 1 then
    ForEachEntityInGroup(DestroyEntity, "GV_ZoneI_Outside_AI_Spawners")
  end
  GV_ZoneI_MiscSetup()
  GV_ZoneI_TowerAndPumpSaveData()
  GV_ZoneI_EiffelSaveData()
  GV_ZoneI_ColiseumSaveData()
  if GetGlobal("GV_ZoneI_GusColiseumIntro_Played") == 1 or GetGlobal("GV_ZoneI_GusEifelFalling_Played") == 1 then
    ForEachEntityInGroup(DestroyEntity, "gv_zonei.Trigger_ColiseumEnterChat")
    DestroyEntity("gv_zonei.AI_Oswald")
    DestroyEntity("gv_zonei.AI_Oswald2")
  end
end
GV_ZoneI_LoadCheckpoint = L0_0
function L0_0(A0_5)
  SaveCheckpoint(GetPlayer(), "GV_ZoneI_LoadCheckpoint", A0_5)
end
GV_ZoneI_SaveCheckpoint = L0_0
function L0_0()
  GV_ZoneI_SaveCheckpoint("Position_EifelStart")
end
GV_ZoneI_SaveCheckpoint_Eifel = L0_0
function L0_0()
  GV_ZoneI_SaveCheckpoint("GV_ZoneI_Start_Flowers")
end
GV_ZoneI_SaveCheckpoint_Flowers = L0_0
L0_0 = false
GV_ZoneI_NoIntro = L0_0
function L0_0()
  if GV_ZoneI_NoIntro == false then
    GetPrefabData("GV_ZoneI_Start").MapLoad_SetupPosition = "True"
    GetPrefabData("GV_ZoneI_Start").ExitFunction = "GV_ZoneI_IntroCutScene"
    OnMapLoad_ProjectorSetup("GV_ZoneI_Start")
  end
end
GV_ZoneI_Intro_Launcher = L0_0
function L0_0()
  StreamZones(nil, "stream_8")
  GV_ZoneI_IntroCutScene()
end
GV_SteamB_FromBtoZoneI = L0_0
L0_0 = false
GV_ZoneI_IntroFlowers = L0_0
function L0_0()
  GetPrefabData("GV_ZoneI_OswaldBackCamera").shotOrder = "last"
  SetGlobal("GV_ZoneI_Shortcut", 1)
  GV_ZoneI_MiscSetup()
  DestroyEntity("gv_zonei.AI_Oswald")
  FireUser1("IntroCam_FromFlowers")
  wait(4)
  ForEachEntityInGroup(DestroyEntity, "gv_zonei.Trigger_ColiseumEnterChat")
  FireSequence("GV_ZoneI_Gus", "GV_ZoneI_GusColiseumIntro")
  StreamInterior(nil, "stream_8_audio_Outside")
  wait(8)
  FireThread(GV_ZoneI_Cleanup_GV_ZoneFx)
end
GV_ZoneI_IntroCutScene_Flowers = L0_0
function L0_0()
  if GV_ZoneI_NoIntro == false then
    StreamInterior(nil, "stream_8_audio_Outside")
    FireUser1("GV_ZoneI_IntroCutScene")
    GV_ZoneI_MiscSetup()
    Wait(1)
    FireSequence("GV_ZoneI_Gus", "GV_ZoneI_Intro")
    wait(10)
    FireThread(GV_ZoneI_Cleanup_GV_ZoneFx)
    EnableGuardianSystem()
    GV_ZoneI_SaveCheckpoint("GV_ZoneI_PostIntroStart")
  end
end
GV_ZoneI_IntroCutScene = L0_0
function L0_0()
  Wait(2)
  AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_Pillars2", "Shake")
  AudioPostEventOn("gv_zonei_dynamic.GV_ZoneI_Pillars1", "Play_sfx_GV_EBR_Column_Shake")
  Wait(2)
  AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_Pillars2", "Rest")
end
GV_ZoneI_Wobble = L0_0
function L0_0()
  Cleanup_GV_ZoneFx()
end
GV_ZoneI_Cleanup_GV_ZoneFx = L0_0
L0_0 = 0
GV_ZoneI_PlayerInEifelCameraTrigger = L0_0
function L0_0()
  SetCameraAttributes("GV_ZoneI_TCO_EifelCamera")
  GV_ZoneI_PlayerInEifelCameraTrigger = GV_ZoneI_PlayerInEifelCameraTrigger + 1
end
GV_ZoneI_EifelCamera_StartTouch = L0_0
function L0_0()
  GV_ZoneI_PlayerInEifelCameraTrigger = GV_ZoneI_PlayerInEifelCameraTrigger - 1
  if GV_ZoneI_PlayerInEifelCameraTrigger == 0 then
    ClearAllCameraAttributesTimed(1)
  end
end
GV_ZoneI_EifelCamera_EndTouch = L0_0
function L0_0()
  FireSequence("GV_ZoneI_Gus", "GV_ZoneI_GusLeaningTower")
end
GV_ZoneI_GusLeaningTower = L0_0
function L0_0(A0_6, A1_7)
  local L2_8
  if A1_7 == "1" then
    L2_8 = "gv_zonei.AI_Oswald"
    DestroyEntity("gv_zonei.AI_Oswald2")
    AnimVarInt(L2_8, VAR_Mood_Type, MOOD_Negative)
    EnableMotion(L2_8)
    AnimEvent(L2_8, EVENT_Force_Idle)
    GoToEntity(L2_8, "gv_zonei.PatrolNode 04", 5)
    Wait(7)
    DestroyEntity(L2_8)
  else
    L2_8 = FireThread
    L2_8(GV_ZoneI_OswaldBackIGC)
    L2_8 = wait
    L2_8(1)
    L2_8 = FireSequence
    L2_8("GV_ZoneI_Gus", "GV_ZoneI_GusColiseumIntro")
  end
end
GV_ZoneI_ColiseumEnterChat = L0_0
L0_0 = false
SeersInCombat = L0_0
function L0_0()
  if SeersInCombat == false then
    SeersInCombat = true
    ForEachEntityInGroup(FireUser1, "ZoneI_1stSpawners")
  end
end
GV_ZoneI_1stSeersInCombat = L0_0
function L0_0(A0_9, A1_10)
  if A1_10 == nil then
  else
    SetNextPatrolNode(A0_9, "gv_zonei_ai.PatrolNode_" .. A1_10)
  end
end
GV_ZoneI_SetInitialPatrolNodes = L0_0
function L0_0(A0_11, A1_12)
  if A1_12 == nil then
  else
    SetNextPatrolNode(A0_11, "gv_zonei_ai.PatrolNode_Eifel 0" .. A1_12)
  end
end
GV_ZoneB_EnableEifelPatrol = L0_0
L0_0 = 1
GV_ZoneI_Pillars1Health = L0_0
L0_0 = 1
GV_ZoneI_Pillars2Health = L0_0
function L0_0()
  if GV_ZoneI_Pillars1Health > 0 then
    AnimGBReset("gv_zonei_dynamic.GV_ZoneI_Pillars1")
    AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_Pillars1", "Shake")
    AudioPostEventOn("gv_zonei_dynamic.GV_ZoneI_Pillars1", "Play_sfx_GV_EBR_Column_Shake")
  end
  if 0 < GV_ZoneI_Pillars2Health then
    AnimGBReset("gv_zonei_dynamic.GV_ZoneI_Pillars2")
    AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_Pillars2", "Shake")
    AudioPostEventOn("gv_zonei_dynamic.GV_ZoneI_Pillars2", "Play_sfx_GV_EBR_Column_Shake")
  end
  wait(1)
  if GV_ZoneI_Pillars1Health > 0 then
    AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_Pillars1", "Rest")
  end
  if 0 < GV_ZoneI_Pillars2Health then
    AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_Pillars2", "Rest")
  end
end
GV_ZoneI_ShakeColumns = L0_0
L0_0 = false
GV_ZoneI_PlayerInPillarVolumes = L0_0
function L0_0(A0_13, A1_14)
  local L2_15
  if A1_14 == "In" then
    L2_15 = true
    GV_ZoneI_PlayerInPillarVolumes = L2_15
  elseif A1_14 == "Out" then
    L2_15 = false
    GV_ZoneI_PlayerInPillarVolumes = L2_15
  end
end
GV_ZoneI_PlayerInPillarCheck = L0_0
function L0_0(A0_16, A1_17)
  local L2_18
  L2_18 = _G
  L2_18 = L2_18["GV_ZoneI_Pillars" .. A1_17 .. "Health"]
  SetPropertyBool(A0_16, "ForceInvulnerable", true)
  if L2_18 == 0 then
    AnimGBReset(A0_16)
    AnimGBSequence(A0_16, "Down")
    DisableGlint(A0_16)
    AudioPostEventOn(A0_16, "Play_sfx_GV_EBR_Column_Down")
    SetGlobal("GV_ZoneI_Tower", GetGlobal("GV_ZoneI_Tower") + 1)
    ForEachEntityInGroup(ForcePainted, "GV_ZoneI_Pillar" .. A1_17 .. "_AICollision")
  else
    AnimGBReset(A0_16)
    AnimGBSequence(A0_16, "Shake")
    AudioPostEventOn(A0_16, "Play_sfx_GV_EBR_Column_Shake")
    FireSequence("GV_ZoneI_Gus", "GV_ZoneI_GusColumnHit")
    _G["GV_ZoneI_Pillars" .. A1_17 .. "Health"] = _G["GV_ZoneI_Pillars" .. A1_17 .. "Health"] - 1
    wait(1)
    if GetGlobal("GV_ZoneI_Tower") < 2 then
      AnimGBSequence(A0_16, "Rest")
    end
    SetPropertyBool(A0_16, "ForceInvulnerable", false)
  end
  if GetGlobal("GV_ZoneI_Tower") == 2 then
    FireUser1("IGC_LeaningTowerFall")
    Wait(0.8)
    MoveToEntity(GetPlayer(), "GV_ZoneI_Position_LeaningTowerIGC")
    AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_Tower", "Down")
    AudioPostEventOn(GetPlayer(), "Stop_All_Sounds")
    DestroyEntity("gv_zonei_static.GV_ZoneI_Pump 01")
    DestroyEntity("gv_zonei_dynamic.GV_ZoneE_Wheel01_Inert 01")
    DestroyEntity("gv_zonei_scripting.Trigger_PisaCamera")
    wait(1)
    AudioPostEventOn(GetPlayer(), "Play_sfx_GV_EBR_LeaningTower_Fall")
    Enable("gv_zonei_audio.Trigger_TowerWalkway")
    DisableGuardianHint("PlayerHint_Pump")
    DisableGuardianHint("PlayerHint_Pillars")
    Unhide("gv_zonei_dynamic.GV_ZoneI_Tower_DownCollision")
    DestroyEntity("gv_zonei_dynamic.GV_ZoneI_Tower_UpCollision")
    wait(5)
    AudioPostEventOn(GetPlayer(), "Play_GV_Ambiance")
    AudioPostEventOn(GetPlayer(), "Set_State_AMB_GV_EBR_EuroBoatRide")
    MultiPosSoundStart("gv_zonei_audio.Sound_ToyGear_CONTROLLER")
    MultiPosSoundStart("gv_zonei_audio.Sound_Marker_ThinnerRiver_2_Controller")
    MultiPosSoundStart("gv_zonei_audio.Sound_Marker_Whirlpool_Controller")
    MultiPosSoundStart("gv_zonei_audio.Sound_Marker_ThinnerRiver_1_Controller")
    AudioPostEventOn(GetPlayer(), "Play_music_gremlinvillage")
    AudioSetState(GetPlayer(), "Music_State", "Auto")
    SetPropertyFloat("gv_zonei_dynamic.CloudSK 01", "BranchPathChance", 1)
    if GetGlobal("GV_ZoneI_LeaningTowerComplete_Played") == 0 then
      GV_ZoneI_SaveCheckpoint("GV_ZoneI_PostIntroStart")
    else
      GV_ZoneI_SaveCheckpoint("Position_EifelStart")
    end
  end
end
GV_ZoneI_ToppleTower = L0_0
function L0_0(A0_19, A1_20)
  if DamageEvent_HasStimulusType(A1_20, ST_SPIN) and GetGlobal("GV_ZoneI_Boats") == 0 then
    FireUser1("IGC_ActivatePump")
    AnimGBSequence(A0_19, "Spin")
    AnimGBSequence("GV_ZoneI_WhirlPool_Anim", "FillUp", true)
    AudioPostEventOn("gv_zonei_audio.Sound_Marker_Whirlpool 01", "Stop_sfx_GV_Whirlpool")
    wait(0.7)
    AnimGBSequence("GV_ZoneI_BoatAnims1", "Loop3")
    Hide("GV_RideBoat_Inert2")
    AnimGBSequence("GV_ZoneI_BoatAnims2", "Loop3", false, 0, 8)
    AnimGBSequence("GV_ZoneI_BoatAnims3", "Loop3", false, 0, 16)
    DisableGuardianHint("PlayerHint_Pump")
    DisableGuardianHint("PlayerHint_Pillars")
    SetGlobal("GV_ZoneI_Boats", 1)
    if GetGlobal("GV_ZoneI_LeaningTowerComplete_Played") == 0 then
      GV_ZoneI_SaveCheckpoint("GV_ZoneI_PostIntroStart")
    else
      GV_ZoneI_SaveCheckpoint("Position_EifelStart")
    end
    DisableGlint(A0_19)
    wait(14.5)
    Unhide("GV_RideBoat_Inert2")
  end
end
GV_ZoneI_ActivatePump = L0_0
function L0_0()
  if GetGlobal("GV_ZoneI_LeaningTowerComplete_Played") == 0 then
    FireSequence("GV_ZoneI_Gus", "GV_ZoneI_LeaningTowerComplete")
  end
end
GV_ZoneI_EifelTowerObjective = L0_0
function L0_0()
  local L0_21, L1_22, L2_23, L3_24
  L0_21(L1_22)
  L0_21(L1_22)
  L0_21(L1_22)
  if L0_21 == 2 then
    for L3_24 = 1, 2 do
      AnimGBReset("gv_zonei_dynamic.GV_ZoneI_Pillars" .. L3_24)
      AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_Pillars" .. L3_24, "Down", false, 0.1)
      _G["GV_ZoneI_Pillars" .. L3_24 .. "Health"] = 0
      SetPropertyBool("gv_zonei_dynamic.GV_ZoneI_Pillars" .. L3_24, "ForceInvulnerable", true)
      DisableGlint("gv_zonei_dynamic.GV_ZoneI_Pillars" .. L3_24)
      ForEachEntityInGroup(ForcePainted, "GV_ZoneI_Pillar" .. L3_24 .. "_AICollision")
    end
    L0_21(L1_22)
    L0_21(L1_22)
    L0_21(L1_22, L2_23)
    L0_21(L1_22)
    L0_21(L1_22)
    L0_21(L1_22)
    L0_21(L1_22)
    L0_21(L1_22)
    L0_21(L1_22)
    L0_21(L1_22)
    L3_24 = 1
    L0_21(L1_22, L2_23, L3_24)
  else
    L0_21(L1_22, L2_23)
  end
  if L0_21 == 1 then
    L0_21(L1_22, L2_23)
    L0_21(L1_22)
    L0_21(L1_22, L2_23)
    L3_24 = false
    L0_21(L1_22, L2_23, L3_24, 0, 8)
    L3_24 = false
    L0_21(L1_22, L2_23, L3_24, 0, 16)
    L0_21(L1_22)
  else
    L0_21(L1_22, L2_23)
    L0_21(L1_22, L2_23)
    L3_24 = false
    L0_21(L1_22, L2_23, L3_24, 0, 7)
  end
end
GV_ZoneI_TowerAndPumpSaveData = L0_0
L0_0 = 1
GV_ZoneI_ETower_SupportsThinned = L0_0
function L0_0(A0_25, A1_26)
  if GetGlobal("GV_ZoneI_ETowerComplete") == 0 then
    if A1_26 == "Thinned" then
      GV_ZoneI_ETower_SupportsThinned = GV_ZoneI_ETower_SupportsThinned + 1
      AudioPostEventOn(A0_25, "Play_sfx_GV_EBR_Obj_EifelTower_MetalWrench")
    elseif A1_26 == "Painted" then
      GV_ZoneI_ETower_SupportsThinned = GV_ZoneI_ETower_SupportsThinned - 1
    end
    Print("************************ GV_ZoneI_ETowerState: GV_ZoneI_ETower_SupportsThinned = " .. GV_ZoneI_ETower_SupportsThinned)
    if GV_ZoneI_ETower_SupportsThinned == 2 then
      FireSequence("GV_ZoneI_Gus", "GV_ZoneI_GusEifelFalling")
      AudioPostEventOn(GetPlayer(), "Stop_All_Sounds")
      wait(0.7)
      AudioPostEventOn(GetPlayer(), "Play_sfx_GV_EBR_Eiffel_Fall_Stinger")
      MoveToEntity(GetPlayer(), "gv_zonei.PositionMarker 01")
      wait(0.9)
      AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_ETower", "Down")
      DisableGuardianHint("PlayerHint_Eifel")
      Unhide("gv_zonei_dynamic.GV_ZoneI_ETower_DownCollision")
      DestroyEntity("gv_zonei_dynamic.GV_ZoneI_ETower_UpCollision")
      DestroyEntity("gv_zonei_dynamic.GV_ZoneI_EStrut1_Toon 01")
      DestroyEntity("gv_zonei_dynamic.GV_ZoneI_EStrut2_Toon 01")
      ForEachEntityInGroup(Enable, "GV_ZoneI_TCO_EifelCameras")
      SetGlobal("GV_ZoneI_ETowerComplete", 1)
      GV_ZoneI_SaveCheckpoint("Position_EifelStart")
      wait(5)
      AudioPostEventOn(GetPlayer(), "Play_GV_Ambiance")
      AudioPostEventOn(GetPlayer(), "Set_State_AMB_GV_EBR_Eiffel_Platform")
      MultiPosSoundStart("gv_zonei_audio.Sound_ToyGear_CONTROLLER")
      MultiPosSoundStart("gv_zonei_audio.Sound_Marker_ThinnerRiver_2_Controller")
      MultiPosSoundStart("gv_zonei_audio.Sound_Marker_Whirlpool_Controller")
      MultiPosSoundStart("gv_zonei_audio.Sound_Marker_ThinnerRiver_1_Controller")
    end
  end
end
GV_ZoneI_ETowerState = L0_0
function L0_0()
  local L0_27
  L0_27 = FireUser1
  L0_27("GV_ZoneI_OswaldFrontCamera")
  L0_27 = wait
  L0_27(0.7)
  L0_27 = "gv_zonei.AI_Oswald"
  AnimVarInt(L0_27, VAR_Mood_Type, MOOD_Negative)
  EnterCutscene(L0_27, 0)
  AudioPostEventOn(GetPlayer(), "Event_sfx_GV_EBR_Eifel_Oswald")
  Wait(2)
  ExitCutscene(L0_27)
  EnableMotion(L0_27)
  AnimEvent(L0_27, EVENT_Force_Idle)
  GoToEntity(L0_27, "gv_zonei.PatrolNode 04", 5)
  Wait(3)
  AudioPostEventOn(GetPlayer(), "Play_music_gremlinvillage")
  AudioSetState(GetPlayer(), "Music_State", "Auto")
  wait(3)
  DestroyEntity(L0_27)
  DestroyEntity("gv_zonei.AI_Oswald2")
end
GV_ZoneI_OswaldFrontIGC = L0_0
function L0_0()
  local L0_28
  L0_28 = "gv_zonei.AI_Oswald2"
  FireUser1("GV_ZoneI_OswaldBackCamera")
  wait(2.5)
  EnterCutscene(L0_28, 4)
  Wait(5)
  GrabCamera("Camera_BackOswaldEnd", "GV_ZoneI_OswaldBackCamera", CAMERA_LERP_TRANSITION, 3)
  wait(3)
  ForEachEntityInGroup(DestroyEntity, "gv_zonei.Trigger_ColiseumEnterChat")
  DestroyEntity("gv_zonei.AI_Oswald")
  DestroyEntity(L0_28)
  if GetGlobal("GV_ZoneI_Shortcut") == 1 then
    GV_ZoneI_SaveCheckpoint_Flowers()
  end
end
GV_ZoneI_OswaldBackIGC = L0_0
function L0_0()
  if GetGlobal("GV_ZoneI_Shortcut") == 1 then
    UnrestrictCutSceneInput()
  end
end
GV_ZoneI_OswaldBackIGC_Release = L0_0
function L0_0()
  Print("******************** GV_ZoneI_EiffelSaveData()")
  if GetGlobal("GV_ZoneI_ETowerComplete") == 1 then
    GV_ZoneI_ETower_SupportsThinned = 2
    AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_ETower", "Down", false, 0.5)
    DestroyEntity("gv_zonei_scripting.Trigger_LeaningTowerHint")
    DestroyEntity("gv_zonei_dynamic.GV_ZoneI_EStrut1_Toon 01")
    DestroyEntity("gv_zonei_dynamic.GV_ZoneI_EStrut2_Toon 01")
    Unhide("gv_zonei_dynamic.GV_ZoneI_ETower_DownCollision")
    DestroyEntity("gv_zonei_dynamic.GV_ZoneI_ETower_UpCollision")
    ForEachEntityInGroup(Enable, "GV_ZoneI_TCO_EifelCameras")
  end
end
GV_ZoneI_EiffelSaveData = L0_0
L0_0 = 1
ArenaWaveNum = L0_0
function L0_0()
  local L0_29, L1_30, L2_31, L3_32
  L0_29 = AudioPostEventOn
  L1_30 = "gv_zonei_audio.Sound_PeteArena_Laugh"
  L2_31 = "Play_sfx_Pete_Arena_Laugh"
  L0_29(L1_30, L2_31)
  L0_29 = 0
  L1_30 = 2
  L2_31 = 4
  L3_32 = 1
  SetPropertyInt("GV_ArenaCounter", "CounterValue", 0)
  if ArenaWaveNum == 4 then
    GV_ZoneI_RemoveFriendlies()
    GV_ZoneI_PeteMadOutro()
  else
    if ArenaWaveNum == 2 then
      L2_31 = 2
      L1_30 = 3
    elseif ArenaWaveNum == 3 then
      SetPropertyInt("GV_ArenaCounter", "CounterMaxValue", 8)
      L0_29 = 1
    end
    GV_ZoneI_RemoveFriendlies()
    for _FORV_7_ = 1, L1_30 do
      for _FORV_11_ = 1, L2_31 do
        SetPropertyInt("Arena_Spawner 0" .. L3_32, "Index To Spawn", L0_29, 0)
        FireUser1("ArenaSpawnerPipe" .. L3_32)
        L3_32 = L3_32 + 1
        Print("**********************  SpawnerStartNum = " .. L3_32)
        Print("**********************  WaveIndex = " .. L0_29)
      end
      if L3_32 == 5 then
        Print("**********************  Reached Last Spawner; Reseting to Spawner 1")
        L3_32 = 1
        wait(3)
      end
      if ArenaWaveNum == 1 then
        L2_31 = 2
      end
      L0_29 = L0_29 + 1
      if ArenaWaveNum == 2 then
        if _FORV_7_ == 2 then
          wait(3)
        end
      else
        wait(3)
      end
    end
    ArenaWaveNum = _FOR_ + 1
    Print("**********************  Next Arena Wave will be Wave " .. ArenaWaveNum)
  end
end
GV_ZoneI_ArenaWaveState = L0_0
L0_0 = 0
Arena_AtLeastOneFriendly = L0_0
function L0_0(A0_33)
  Wait(0)
  Wait(0)
  if GetCurrentTeam(A0_33) == 3 then
    CounterAdd("GV_ArenaCounter", 1)
    Arena_AtLeastOneFriendly = Arena_AtLeastOneFriendly + 1
  elseif GetCurrentTeam(A0_33) == 2 then
    CounterSubtract("GV_ArenaCounter", 1)
    Arena_AtLeastOneFriendly = Arena_AtLeastOneFriendly - 1
  end
end
GV_ZoneI_ArenaWaveCheck = L0_0
function L0_0()
  if Arena_AtLeastOneFriendly > 0 then
    StartFadeOut(0.4)
    wait(0.5)
    ForEachEntityInGroup(DestroyEntity, "GV_Arena_WaveEnemy")
    wait(0.2)
    StartFadeIn()
  end
end
GV_ZoneI_RemoveFriendlies = L0_0
function L0_0()
  FireSequence("GV_ZoneI_Gus", "GV_ZoneI_GusPeteHappy")
end
GV_ZoneI_TempPeteState = L0_0
function L0_0()
  local L0_34
  L0_34 = "gv_zonei_ai.SmallWorldPete 01"
  ClearNextPatrolNode(L0_34)
  TeleportToEntity(L0_34, "gv_zonei_scripting.Position_PeteOutro")
  DisableGuardianHint("PlayerHint_Clouds")
  DisableGuardianHint("PlayerHint_Pump")
  DisableGuardianHint("PlayerHint_Pillars")
  DisableGuardianHint("PlayerHint_Eifel")
  DisableGuardianHint("PlayerHint_FrontEntrance")
  DisableGuardianHint("PlayerHint_BackEntrance")
  GuardianPrefab_StartNextGuardian("Euro_GuardianSpawner_Eifel")
  DestroyEntity("gv_zonei_dynamic.GV_ZoneI_Cage_Door_Up")
  Unhide("gv_zonei_dynamic.GV_ZoneI_Cage_Door_Down")
  AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_EntranceGate 01", "Close")
  DestroyEntity("gv_zonei_scripting.TriggerRotate 03")
  DestroyEntity("gv_zonei.Trigger_EnterColliseumTop")
  ForEachEntityInGroup(DestroyEntity, "gv_zonei_OutsideAI")
  ForEachEntityInGroup(DestroyEntity, "gv_zonei_audio.ColiseumMusicStop")
  FireSequence(L0_34, "GV_Arena_Pete_Intro")
  wait(0.5)
  EnterCutscene(L0_34)
  RestrictCutSceneInput()
  if GetGlobal("GV_PeteStuff") == 1 then
    SetGlobal("GV_ZoneI_GearTurning", 0)
    EnterCutscene(L0_34, 18)
  else
    EnterCutscene(L0_34, 15)
  end
  wait(0.2)
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_EBR_Pete_Laugh_Collesium_Intro")
  DestroyEntity("gv_zonei_scripting.PlaneTrigger 01")
  DestroyEntity("gv_zonei_scripting.PlaneTrigger 02")
  DestroyEntity("gv_zonei_dynamic.Plane_ArenaIntro")
  Enable("Trigger_RestoreJigsaw")
end
GV_ZoneI_PeteCutStart = L0_0
function L0_0()
  MoveToEntity(GetPlayer(), "gv_zonei_dynamic.PeteCutMarker 01")
  Disable("Trigger_RestoreJigsaw")
end
GV_ZoneI_PeteCutStart_Teleport = L0_0
function L0_0()
  local L0_35, L1_36
end
GV_ZoneI_PeteLaugh = L0_0
function L0_0()
  FireThread(GV_ZoneI_ArenaWaveState)
  ExitCutscene("gv_zonei_ai.SmallWorldPete 01")
  AnimVarInt("gv_zonei_ai.SmallWorldPete 01", VAR_Mood_Type, MOOD_Negative)
  AudioPostEventOn("gv_zonei_audio.Sound_PeteArena_Laugh", "Play_sfx_Pete_Arena_Laugh")
  FireSequence("GV_ZoneI_Gus", "GV_ZoneD_PeteLogQuestEnd")
  SetNextPatrolNode("gv_zonei_ai.SmallWorldPete 01", "gv_zonei_ai.PatrolNode_PeteExit1")
  wait(6)
  AudioPostEventOn(GetPlayer(), "Play_music_gremlinvillage")
  AudioSetState(GetPlayer(), "Music_State", "Combat")
  MoveToEntity(GetPlayer(), "gv_zonei_dynamic.PeteCutMarker 01")
  FireUser4("IGC_PeteIntro_Mad")
  Wait(1)
  UnrestrictCutSceneInput()
  GV_ZoneI_SaveCheckpoint("gv_zonei_dynamic.PeteCutMarker 01")
end
GV_ZoneI_PeteMad = L0_0
function L0_0()
  local L0_37
  L0_37 = "gv_zonei_ai.SmallWorldPete 01"
  Print("_________________________________New Animation___________________________________")
  EnterCutscene(L0_37, 14)
end
GV_ZoneI_PeteHappy_Animation = L0_0
function L0_0()
  local L0_38
  L0_38 = "gv_zonei_ai.SmallWorldPete 01"
  EnterCutscene(L0_38, 17)
  wait(3)
  FireUser1("IGC_ShowColiseumExit")
  wait(1)
  AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_ColiseumExitGate", "Open")
  wait(1.5)
  FireSequence("GV_ZoneI_Gus", "GV_ZoneD_PeteLogQuestEnd")
  wait(3.5)
  FireUser1("IGC_ShowTreasureRoom")
  DestroyEntity(L0_38)
  wait(2.2)
  AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_TreasureRoomGate", "Open")
  wait(1)
  FireSequence("GV_ZoneI_Gus", "GV_ZoneI_GusTreasure")
end
GV_ZoneI_PeteHappy = L0_0
function L0_0()
  FireUser3("IGC_ShowTreasureRoom")
  AudioPostEventOn(GetPlayer(), "Play_music_gremlinvillage")
end
GV_ZoneI_PeteHappyEnd = L0_0
function L0_0()
  GV_ZoneI_SaveCheckpoint("gv_zonei_dynamic.PeteCutMarker 01")
end
GV_ZoneI_ColiseumSave = L0_0
function L0_0()
  local L0_39
  L0_39 = "gv_zonei_ai.SmallWorldPete 01"
  Print("******************** GV_ZoneI_ColiseumSaveData()")
  ForEachEntityInGroup(DestroyEntity, "gv_zonei_audio.ColiseumMusicStop")
  if GetGlobal("GV_Arena_Pete_Intro_Played") == 1 then
    AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_EntranceGate 01", "Close")
    DestroyEntity("gv_zonei_scripting.PlaneTrigger 01")
    DestroyEntity("gv_zonei_scripting.PlaneTrigger 02")
    DestroyEntity("gv_zonei_dynamic.Plane_ArenaIntro")
    DestroyEntity("gv_zonei_scripting.TriggerRotate 03")
    DestroyEntity("gv_zonei.Trigger_EnterColliseumTop")
    DestroyEntity("gv_zonei_dynamic.GV_ZoneI_Cage_Door_Up")
    Unhide("gv_zonei_dynamic.GV_ZoneI_Cage_Door_Down")
    AudioSetState(GetPlayer(), "Music_State", "Auto")
  else
    Hide("gv_zonei_dynamic.GV_ZoneI_Cage_Door_Down")
  end
  if GetGlobal("GV_Arena_Pete_Intro_Played") == 1 and GetGlobal("GV_Arena_PeteMadOutro_Played") == 0 then
    if GetGlobal("GV_PeteStuff") == 1 then
      SetGlobal("GV_ZoneI_GearTurning", 0)
      AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_TreasureRoomGate", "Open")
      DestroyEntity(L0_39)
      AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_ColiseumExitGate", "Open")
    else
      FireThread(GV_ZoneI_ArenaWaveState)
      AudioSetState(GetPlayer(), "Music_State", "Combat")
    end
  end
  if GetGlobal("GV_Arena_PeteMadOutro_Played") == 1 then
    AnimGBReset("gv_zonei_dynamic.GV_ZoneI_TreasureValveGate")
    AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_TreasureValveGate", "Open")
    SetPropertyBool("gv_zonei.Valve_OpenTreasureRoom", "ForceInvulnerable", false)
    DestroyEntity(L0_39)
    AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_ColiseumExitGate", "Open")
  end
end
GV_ZoneI_ColiseumSaveData = L0_0
function L0_0()
  local L0_40
  L0_40 = "gv_zonei_ai.SmallWorldPete 01"
  GetPrefabData("IGC_PeteIntro_Happy").shotOrder = "first"
  FireUser1("IGC_PeteIntro_Happy")
  AudioPostEventOn("gv_zonei_audio.Sound_PeteArena_Laugh", "Stop_sfx_Pete_Arena_Laugh")
  Disable("gv_zonei_audio.Trigger_PeteLaugh 01")
  Disable("gv_zonei_audio.Trigger_PeteLaugh")
  AudioSetState(GetPlayer(), "Music_State", "Exploration")
  DoStinger("Stinger_Success", 7)
  ClearNextPatrolNode(L0_40)
  TeleportToEntity(L0_40, "gv_zonei_scripting.Position_PeteOutro")
  EnterCutscene(L0_40, 16)
  wait(0.8)
  FireSequence(L0_40, "GV_Arena_PeteMadOutro")
  Enable("Trigger_RestoreJigsaw")
  GV_ZoneI_PeteCutStart_Teleport()
  Wait(4.2)
  GetPrefabData("IGC_ShowColiseumExit").shotOrder = "last"
  FireUser1("IGC_ShowColiseumExit")
  Disable("Trigger_RestoreJigsaw")
  wait(0.8)
  DestroyEntity(L0_40)
  wait(1)
  AnimGBSequence("gv_zonei_dynamic.GV_ZoneI_ColiseumExitGate", "Open")
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_EBR_Obj_MetalGate_Open")
  wait(4)
  GV_ZoneI_SaveCheckpoint("gv_zonei_dynamic.PeteCutMarker 01")
end
GV_ZoneI_PeteMadOutro = L0_0
function L0_0()
  SetGlobal("GV_ZoneI_GearTurning", 1)
end
GV_ZoneI_GearDisabled = L0_0
function L0_0()
  local L0_41, L1_42
  GV_ZoneI_SetInitialPatrolNodes = L0_41
  L0_41 = nil
  GV_ZoneI_StreamOutZoneI = L0_41
  L0_41 = nil
  GV_ZoneI_ShakeColumns = L0_41
  L0_41 = nil
  GV_ZoneI_ColiseumSaveData = L0_41
  L0_41 = nil
  GV_ZoneI_GusLeaningTower = L0_41
  L0_41 = nil
  GV_ZoneI_EiffelSaveData = L0_41
  L0_41 = nil
  GV_ZoneI_RemoveFriendlies = L0_41
  L0_41 = nil
  GV_ZoneI_ETowerState = L0_41
  L0_41 = nil
  GV_ZoneI_PeteHappy_Animation = L0_41
  L0_41 = nil
  GV_ZoneI_ColiseumSave = L0_41
  L0_41 = nil
  GV_ZoneI_1stSeersInCombat = L0_41
  L0_41 = nil
  GV_ZoneI_PeteMadOutro = L0_41
  L0_41 = nil
  GV_ZoneI_EifelCamera_StartTouch = L0_41
  L0_41 = nil
  GV_ZoneI_TowerAndPumpSaveData = L0_41
  L0_41 = nil
  GV_ZoneI_IntroCutScene = L0_41
  L0_41 = nil
  GV_ZoneI_OswaldFrontIGC = L0_41
  L0_41 = nil
  GV_ZoneI_EifelTowerObjective = L0_41
  L0_41 = nil
  GV_ZoneI_AudioStream_Colisem = L0_41
  L0_41 = nil
  GV_SteamB_FromBtoZoneI = L0_41
  L0_41 = nil
  GV_ZoneI_StreamInSteamC = L0_41
  L0_41 = nil
  GV_ZoneI_LoadCheckpoint = L0_41
  L0_41 = nil
  GV_ZoneI_PeteCutStart = L0_41
  L0_41 = nil
  GV_ZoneI_OswaldBackIGC = L0_41
  L0_41 = nil
  GV_ZoneI_SetupTopColiseumAudio = L0_41
  L0_41 = nil
  GV_ZoneI_EifelCamera_EndTouch = L0_41
  L0_41 = nil
  GV_ZoneI_PeteCutStart_Teleport = L0_41
  L0_41 = nil
  GV_ZoneI_Intro_Launcher = L0_41
  L0_41 = nil
  GV_ZoneI_ColiseumEnterChat = L0_41
  L0_41 = nil
  GV_ZoneI_PeteMad = L0_41
  L0_41 = nil
  GV_ZoneI_ToppleTower = L0_41
  L0_41 = nil
  GV_ZoneI_ActivatePump = L0_41
  L0_41 = nil
  GV_ZoneI_GearDisabled = L0_41
  L0_41 = nil
  GV_ZoneB_EnableEifelPatrol = L0_41
  L0_41 = nil
  GV_ZoneI_SaveCheckpoint = L0_41
  L0_41 = nil
  GV_ZoneI_TempPeteState = L0_41
  L0_41 = nil
  GV_ZoneI_SetUpGuardianHints = L0_41
  L0_41 = nil
  GV_ZoneI_IntroCutScene_Flowers = L0_41
  L0_41 = nil
  GV_ZoneI_MiscSetup = L0_41
  L0_41 = nil
  GV_ZoneI_ArenaWaveState = L0_41
  L0_41 = nil
  GV_ZoneI_ArenaWaveCheck = L0_41
  L0_41 = nil
  GV_StreamInZoneI_Flowers = L0_41
  L0_41 = nil
  GV_ZoneI_PeteHappy = L0_41
  L0_41 = nil
  Cleanup_GV_ZoneI = L0_41
end
Cleanup_GV_ZoneI = L0_0
