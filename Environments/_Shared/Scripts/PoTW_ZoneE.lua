local L0_0, L1_1
L0_0 = false
potw_jungle_testvar = L0_0
function L0_0()
  if potw_jungle_testvar == false then
    AnimGBSequence("potw_zonee_dynamic.ThinnerFall", "Off")
    Print("Sign Off")
    potw_jungle_testvar = true
  else
    AnimGBSequence("potw_zonee_dynamic.ThinnerFall", "On")
    Print("Sign On")
    potw_jungle_testvar = false
  end
end
potw_jungle_testfunction = L0_0
function L0_0()
  StartTrackingCurrentLevelForScoring("potw_Jungle")
  PotW_Jungle_Intro()
end
PotW_ZoneG_Load = L0_0
L0_0 = false
PotW_Jungle_NoIntro = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Mute_Mickey")
  if PotW_Jungle_NoIntro == false then
    GetPrefabData("potw_ZoneE_Start").MapLoad_SetupPosition = "True"
  end
end
PotW_Jungle_Intro_Launcher = L0_0
function L0_0()
  if GetGlobal("PoTW_ZoneE_GusSeesBot_Played") == 0 then
    Print("########### In Basher Intro")
    FireUser1("BasherIntroCamera")
    SetGlobal("PoTW_ZoneE_GusSeesBot_Played", 1)
    potw_ZoneE_SaveCheckpoint()
    Print("BASHER INTRO: Fired")
  end
end
PotW_BasherIntro = L0_0
function L0_0()
  Enable("potw_zonee_ai.AnimatronicPirateMelee 01")
end
PotW_DisableBasherAI = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Mute_Mickey")
  SetDefaultCameraValues(4, 16, -12)
  SetMap(GetPlayer(), "MAP_P_ZONEE", "GAME")
  PotW_Jungle_ThinnerSounds_Full()
  GuardianPrefab_PopulateGuardians("MickeyHead_JungleExit")
  PotW_Jungle_EnableAI()
  Enable("potw_zonee_ai.AnimatronicPirateMelee 01")
  TeleportToEntity(GetPlayer(), "potw_zonee.start")
  if GetGlobal("potw_JungleIntroPlayed") == 0 then
    FireUser1("potw_zonee_igc.introCameraShot1")
    SetGlobal("potw_JungleIntroPlayed", 1)
    ForEachEntityInGroup(DestroyEntity, "BasherIntroTriggers")
  end
  Print("SAVE from potw_Jungle_Intro")
  potw_ZoneE_SaveCheckpoint()
  AudioPostEventOn(GetPlayer(), "Unmute_Mickey")
end
PotW_Jungle_Intro = L0_0
function L0_0()
  if GetGlobal("potw_jungle_cleared") == 0 then
    ForEachEntityInGroup(Enable, "potw_zonee_ai.Spawner_Basher 01")
    ForEachEntityInGroup(Enable, "potw_zonee_ai.Spawner_Hopper 01")
    ForEachEntityInGroup(Enable, "potw_zonee_ai.Spawner_Spladoosh 01")
    Enable("Spawner_Starkey")
    Print("********************* Jungle AI Enabled")
  else
    ForEachEntityInGroup(DestroyEntity, "potw_zonee_ai.Spawner_Basher 01")
    ForEachEntityInGroup(DestroyEntity, "potw_zonee_ai.Spawner_Hopper 01")
    ForEachEntityInGroup(DestroyEntity, "potw_zonee_ai.Spawner_Spladoosh 01")
    DestroyEntity("Spawner_Starkey")
  end
end
PotW_Jungle_EnableAI = L0_0
function L0_0(A0_2)
  Print("*********************Jungle Starkey Setup")
  if GetGlobal("Starkey_Intro_Played") == 0 then
    AI_SetDisabled(A0_2, true)
    AnimVarInt(A0_2, VAR_NPC_State, 3)
    AnimVarInt(A0_2, VAR_Mood_Type, 1)
  end
  if GetGlobal("potw_Jungle_Cleared") == 1 then
    Hide(A0_2)
  end
end
Jungle_Starkey_Setup = L0_0
function L0_0()
  FireThread(PotW_Jungle_Intro)
  StreamZones(GetPlayer(), "stream_6")
end
PotW_JungleLaunchFrom2D = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "potw_ZoneE_LoadCheckpoint", "potw_zonee.start")
end
potw_ZoneE_SaveCheckpoint = L0_0
function L0_0()
  potw_ZoneE_SaveCheckpoint()
  if TimerGetTime() < 7 then
    TimerAddTime(5)
  end
  TimerUnpause()
  SetCameraAttributes("Override_ThinnerChest")
  Prefab_ProjectorMickeyMove()
end
potw_ZoneE_SaveCheckpoint_Chest = L0_0
function L0_0()
  TimerPause()
end
POTW_ZoneE_TimerPause = L0_0
function L0_0()
  local L0_3, L1_4, L2_5, L3_6
  L0_3(L1_4)
  L0_3()
  PotW_Jungle_NoIntro = L0_3
  L3_6 = "GAME"
  L0_3(L1_4, L2_5, L3_6)
  L0_3(L1_4)
  if L0_3 == 1 then
    L0_3(L1_4)
    L0_3(L1_4)
    L3_6 = true
    L0_3(L1_4, L2_5, L3_6)
  else
    L3_6 = true
    L0_3(L1_4, L2_5, L3_6)
  end
  L3_6 = -12
  L0_3(L1_4, L2_5, L3_6)
  if L0_3 == 1 then
    L0_3(L1_4)
  end
  if L0_3 == 1 then
    L0_3(L1_4, L2_5)
    L0_3(L1_4, L2_5)
    for L3_6 = 1, 3 do
      SetGlobal("PotW_Jungle_HiddenSymbol" .. L3_6, 1)
      DisableGuardianHint("potw_zonee_scripting.PlayerHintMarker Symbol 0" .. L3_6)
    end
    L0_3(L1_4, L2_5)
    L0_3(L1_4)
  else
    for L3_6 = 1, 3 do
      SetGlobal("PotW_Jungle_HiddenSymbol" .. L3_6, 0)
      SetGlobal("PotW_DecipheredSymbols", 0, true)
    end
  end
  if L0_3 == 1 then
    L0_3()
    L0_3(L1_4)
    L0_3(L1_4, L2_5)
    PotW_Jungle_TreeDoorOpen = L0_3
    L0_3(L1_4, L2_5)
  else
    L3_6 = true
    L0_3(L1_4, L2_5, L3_6)
  end
  L0_3(L1_4)
  if L0_3 == 0 then
    L0_3(L1_4)
    L3_6 = true
    L0_3(L1_4, L2_5, L3_6)
    L0_3(L1_4, L2_5)
    L0_3(L1_4, L2_5)
    L0_3(L1_4, L2_5)
    L0_3(L1_4, L2_5)
    L0_3(L1_4, L2_5)
    L0_3(L1_4, L2_5)
  elseif L0_3 == 1 then
    L0_3(L1_4)
    L3_6 = true
    L0_3(L1_4, L2_5, L3_6)
    L0_3(L1_4, L2_5)
    PotW_Jungle_HeadsIn = L0_3
    PotW_Jungle_ElevatorState = L0_3
    L0_3(L1_4, L2_5)
    PotW_Jungle_EyesPlayerInput = L0_3
    L0_3(L1_4, L2_5)
    PotW_Jungle_EyesPlayerInput = L0_3
    for L3_6 = 1, 4 do
      Print("######################### Fire Heads Check Turn Stone Heads")
      PotW_Rotate_Head(L3_6, 1)
    end
    L0_3(L1_4, L2_5)
  end
  if L0_3 == 0 then
    L3_6 = true
    L0_3(L1_4, L2_5, L3_6)
  else
    L0_3(L1_4, L2_5)
    PotW_Jungle_HiddenLanternScene = L0_3
  end
  if L0_3 == 1 then
    L0_3(L1_4)
    PotW_Jungle_HiddenLanternScene = L0_3
    L0_3(L1_4)
    L0_3(L1_4)
    L0_3(L1_4)
    L0_3(L1_4)
    L0_3(L1_4, L2_5)
    PotW_Jungle_ThinnerSounds = L0_3
    L0_3()
    L0_3(L1_4)
    L0_3(L1_4)
    L0_3(L1_4, L2_5)
    L0_3(L1_4, L2_5)
    L0_3(L1_4, L2_5)
    L0_3(L1_4, L2_5)
    L3_6 = "potw_zonee_dynamic.SK_Thinner2"
    L0_3(L1_4, L2_5, L3_6, 1)
    L0_3(L1_4, L2_5)
    L3_6 = "potw_zonee_dynamic.SK Boat 02"
    L0_3(L1_4, L2_5, L3_6, 1)
    L0_3(L1_4, L2_5)
    L3_6 = "potw_zonee_dynamic.SK Boat 04"
    L0_3(L1_4, L2_5, L3_6, 1)
  else
    L3_6 = true
    L0_3(L1_4, L2_5, L3_6)
    L0_3()
  end
end
potw_ZoneE_LoadCheckpoint = L0_0
function L0_0()
  FireSequence("PirateStarkey", "Starkey_Intro")
  Print("******** Force Starkey Intro")
end
potw_Jungle_ForceStarkeyIntro = L0_0
function L0_0()
  SetGlobal("PotW_DaisyParts", GetGlobal("PotW_DaisyParts") + 1, true)
  potw_ZoneE_SaveCheckpoint()
end
PotW_ZoneE_GetDaisyBody = L0_0
function L0_0(A0_7)
  AudioPostEventOn(GetPlayer(), "Play_sfx_PU_Daisy")
  DestroyEntity(A0_7)
  DestroyEntity("potw_zonee_dynamic.DaisyWaist")
  wait(3)
  SetGlobal("PotW_DaisyWaist", 1)
  SetGlobal("PotW_DaisyParts", GetGlobal("PotW_DaisyParts") + 1)
end
PotW_ZoneE_GetDaisyWaist = L0_0
function L0_0()
  if GetGlobal("potw_Jungle_GremlinBuzzFree") == 0 then
    Print("* * * * * * * * * * * Lower River Active")
    FireUser1("CameraThinnerFalls")
    ForEachEntityInGroup(Hide, "potw_zonee_fx.ThinnerFall_Splash_LG 01")
    ForEachEntityInGroup(Unhide, "potw_zonee_fx.ThinnerFall_Splash_LG 02")
    Wait(1)
    AnimGBSequence("potw_zonee_dynamic.RiverGate", "Close")
    AudioPostEventOn("potw_zonee_dynamic.RiverGate", "Play_sfx_POTW_Jungle_FloodGate_Close")
    AnimGBSequence("potw_zonee_dynamic.RiverGateToon", "SpinClose")
    Wait(0.5)
    AnimGBSequence("ThinnerFall", "Off")
    PotW_Jungle_ThinnerSounds_Empty()
    Wait(0.3)
    Hide("ThinnerFall")
    Hide("ThinnerFallDamage")
    ForEachEntityInGroup(Hide, "potw_zonee_dynamic.Small ThinnerFall Top Boot")
    Wait(0.1)
    AnimGBSequence("potw_zonee_dynamic.RiverGate", "RestClosed")
    AnimGBSequence("potw_zonee_dynamic.RiverGateToon", "Rest1")
    SetSplineFollowerInitialSpeed("potw_zonee_dynamic.Thinner 00", 2)
    SplineFollower_StopAtPosition("potw_zonee_dynamic.Thinner 00", "potw_zonee_dynamic.SK_Thinner1", "potw_zonee_dynamic.SK_Thinner2", 1)
    SetSplineFollowerInitialSpeed("potw_zonee_dynamic.ThinnerBoat", 2)
    SplineFollower_StopAtPosition("potw_zonee_dynamic.ThinnerBoat", "potw_zonee_dynamic.SK Boat 01", "potw_zonee_dynamic.SK Boat 02", 1)
    SetSplineFollowerInitialSpeed("potw_zonee_dynamic.ThinnerBoat 2", 2)
    SplineFollower_StopAtPosition("potw_zonee_dynamic.ThinnerBoat 2", "potw_zonee_dynamic.SK Boat 03", "potw_zonee_dynamic.SK Boat 04", 1)
    SetPropertyBool("ThinnerRiver_Chest", "ForceInvulnerable", false)
    Disable("RiverChestThinerVolume")
    wait(7)
    if GetGlobal("PotW_GremlinBuzz_Thanks_Played") == 0 then
      FireSequence("Jungle_Gus", "Jungle_ThinnerBark")
    end
  end
end
potw_Jungle_LowerRiver = L0_0
function L0_0()
  local L0_8
  L0_8 = TimerStart
  L0_8(30)
  L0_8 = "Ticking"
  while L0_8 == "Ticking" do
    if TimerGetTime() <= 5 and false == false then
      AudioPostEventOn(GetPlayer(), "Play_sfx_Jungle_Thinner_Fall_River_FillUp")
    else
      if TimerGetTime() <= 15 and false == false then
        AudioPostEventOn(GetPlayer(), "Play_sfx_Jungle_Rumble")
      else
      end
    end
    wait(0.3)
    L0_8 = TimerGetState()
    if L0_8 == "Expired" then
      SetPropertyFloat("ThinnerRiver_Chest", "UsableRadius", 0)
      AudioPostEventOn(GetPlayer(), "Stop_sfx_Jungle_Rumble")
      TimerStop()
      FireSequence("Jungle_Gus", "Jungle_ThinnerWarning")
    end
  end
end
potw_Jungle_ThinnerFall_Timer = L0_0
function L0_0()
  TimerStop()
end
potw_jungle_stoptimer = L0_0
function L0_0()
  Print("* * * * * * * * * * * Raise River Active")
  TimerStop()
  if GetGlobal("PotW_GremlinBuzz_Thanks_Played") == 0 then
    Reverse("potw_zonee_dynamic.Thinner 00")
    ForEachEntityInGroup(ForceSketched, "PotW_Jungle.ThinnerPlatforms")
    ForEachEntityInGroup(Unhide, "potw_zonee_fx.ThinnerFall_Splash_LG 01")
    ForEachEntityInGroup(Hide, "potw_zonee_fx.ThinnerFall_Splash_LG 02")
    ForceSketched("potw_zonee_dynamic.RiverGateToon")
    AnimGBSequence("potw_zonee_dynamic.RiverGateToon", "SpinOpen")
    AnimGBSequence("potw_zonee_dynamic.RiverGate", "Open")
    AudioPostEventOn("potw_zonee_dynamic.RiverGate", "Play_sfx_POTW_Jungle_FloodGate_Open")
    Wait(0.2)
    Unhide("ThinnerFall")
    Unhide("ThinnerFallDamage")
    AnimGBSequence("ThinnerFall", "On")
    PotW_Jungle_ThinnerSounds_Full()
    Wait(0.7)
    ForceSketched("ThinnerRiver_Chest")
    SetPropertyBool("ThinnerRiver_Chest", "ForceInvulnerable", true)
    AnimGBSequence("potw_zonee_dynamic.RiverGate", "RestOpen")
    AnimGBSequence("potw_zonee_dynamic.RiverGateToon", "Rest2")
    SetSplineFollowerInitialSpeed("potw_zonee_dynamic.Thinner 00", 3)
    SplineFollower_StopAtPosition("potw_zonee_dynamic.Thinner 00", "potw_zonee_dynamic.SK_Thinner1", "potw_zonee_dynamic.SK_Thinner2", 0)
    Wait(0.2)
    SetSplineFollowerInitialSpeed("potw_zonee_dynamic.ThinnerBoat", 3)
    SplineFollower_StopAtPosition("potw_zonee_dynamic.ThinnerBoat", "potw_zonee_dynamic.SK Boat 01", "potw_zonee_dynamic.SK Boat 02", 0)
    SetSplineFollowerInitialSpeed("potw_zonee_dynamic.ThinnerBoat 2", 4)
    SplineFollower_StopAtPosition("potw_zonee_dynamic.ThinnerBoat 2", "potw_zonee_dynamic.SK Boat 03", "potw_zonee_dynamic.SK Boat 04", 0)
    Wait(1.2)
    Enable("RiverChestThinerVolume")
    ForEachEntityInGroup(Unhide, "potw_zonee_dynamic.Small ThinnerFall Top Boot")
  end
end
potw_Jungle_RaiseRiver = L0_0
function L0_0()
  Enable("potw_zonee_scripting.Trig_ViewThinnerHint")
end
PotW_Jungle_Enable_ViewThinnerHint = L0_0
L0_0 = 0
PotW_Jungle_ThinnerSounds = L0_0
function L0_0()
  Print("****>>>>\tPotW_Jungle_ThinnerSounds_Full")
  if PotW_Jungle_ThinnerSounds == 0 then
    Print("****<<<< Filling River Sounds")
    ForEachEntityInGroup(FireUser1, "potw_zonee_audio.Sound_Marker_Thinner_Emitters")
    ForEachEntityInGroup(Enable, "potw_zonee_dynamic.TriggerRotate_BoatSound")
    PotW_Jungle_ThinnerSounds = 1
  end
end
PotW_Jungle_ThinnerSounds_Full = L0_0
function L0_0()
  Print("****>>>>\tPotW_Jungle_ThinnerSounds_Empty")
  if PotW_Jungle_ThinnerSounds == 1 then
    Print("****<<<< Emptying River Sounds")
    AudioPostEventOn(GetPlayer(), "Play_sfx_Jungle_Thinner_Fall_Stop")
    ForEachEntityInGroup(FireUser2, "potw_zonee_audio.Sound_Marker_Thinner_Emitters")
    ForEachEntityInGroup(Disable, "potw_zonee_dynamic.TriggerRotate_BoatSound")
    PotW_Jungle_ThinnerSounds = 0
  end
end
PotW_Jungle_ThinnerSounds_Empty = L0_0
function L0_0()
  Wait(0.81)
  AnimVarInt("caged_gremlin_gremlin", VAR_Cutscene, 1)
  AnimEvent("caged_gremlin_gremlin", EVENT_Start_Cutscene)
  Wait(1)
  AnimGBSequence("potw_zonee_dynamic.RiverGate", "Close")
  AudioPostEventOn("potw_zonee_dynamic.RiverGate", "Play_sfx_POTW_Jungle_FloodGate_Close")
  AnimGBSequence("potw_zonee_dynamic.RiverGateToon", "SpinClose")
  Wait(0.5)
  AnimGBSequence("ThinnerFall", "Off")
  PotW_Jungle_ThinnerSounds_Empty()
  Wait(0.3)
  TeleportGremlinToEntity("caged_gremlin_gremlin", "potw_zonee.start")
  Hide("ThinnerFall")
  Hide("ThinnerFallDamage")
  ForEachEntityInGroup(Hide, "potw_zonee_dynamic.Small ThinnerFall Top Boot")
  Wait(0.1)
  AnimGBSequence("potw_zonee_dynamic.RiverGate", "RestClosed")
  AnimGBSequence("potw_zonee_dynamic.RiverGateToon", "Rest1")
  SetSplineFollowerInitialSpeed("potw_zonee_dynamic.Thinner 00", 2)
  SplineFollower_StopAtPosition("potw_zonee_dynamic.Thinner 00", "potw_zonee_dynamic.SK_Thinner1", "potw_zonee_dynamic.SK_Thinner2", 1)
  SetSplineFollowerInitialSpeed("potw_zonee_dynamic.ThinnerBoat", 2)
  SplineFollower_StopAtPosition("potw_zonee_dynamic.ThinnerBoat", "potw_zonee_dynamic.SK Boat 01", "potw_zonee_dynamic.SK Boat 02", 1)
  SetSplineFollowerInitialSpeed("potw_zonee_dynamic.ThinnerBoat 2", 2)
  SplineFollower_StopAtPosition("potw_zonee_dynamic.ThinnerBoat 2", "potw_zonee_dynamic.SK Boat 03", "potw_zonee_dynamic.SK Boat 04", 1)
  Disable("RiverChestThinerVolume")
  SetPropertyBool("ThinnerRiver_Chest", "ForceInvulnerable", false)
  wait(5)
  DestroyEntity("caged_gremlin_gremlin")
  DestroyEntity("RiverChestThinerVolume")
  potw_ZoneE_SaveCheckpoint()
end
PotW_Jungle_DestroyedGremlinCage = L0_0
function L0_0(A0_9, A1_10)
  SetPropertyFloat(A0_9, "UsableRadius", A1_10)
end
PotW_Jungle_SetSymbolRadius = L0_0
function L0_0(A0_11, A1_12)
  PotW_ZoneE_HintDisableSymbol(A1_12)
  if GetGlobal("PotW_Jungle_HiddenSymbol" .. A1_12) == 0 then
    SetGlobal("PotW_DecipheredSymbols", GetGlobal("PotW_DecipheredSymbols") + 1)
    SetGlobal("PotW_Jungle_HiddenSymbol" .. A1_12, 1)
    if GetGlobal("Starkey_Intro_Played") == 1 then
      FireSequence("Jungle_Gus", "Jungle_Symbol_Barks")
    else
      FireSequence("Jungle_Gus", "Jungle_Symbol_Found")
    end
  else
    FireSequence("Jungle_Gus", "Jungle_Symbol_Known")
  end
end
PotW_Jungle_SymbolCheck = L0_0
L0_0 = false
PotW_Jungle_HiddenLanternScene = L0_0
function L0_0(A0_13, A1_14)
  if GetGlobal("Jungle_LanternDoor_Played") == 0 then
    if A1_14 == "Paint" then
      SetGlobal("potw_jungle_lanterns", GetGlobal("potw_jungle_lanterns") + 1)
    elseif A1_14 == "Thinner" then
      SetGlobal("potw_jungle_lanterns", GetGlobal("potw_jungle_lanterns") - 1)
    end
    if GetGlobal("potw_jungle_lanterns") == 1 then
      FireSequence("Jungle_Gus", "Jungle_Gus_Lantern1_Painted")
    elseif GetGlobal("potw_jungle_lanterns") == 2 then
      FireSequence("Jungle_Gus", "Jungle_Gus_Lantern2_Found")
    end
    if GetPropertyBool("potw_zonee_dynamic.Lantern1_Toon", "Is Painted") and GetPropertyBool("potw_zonee_dynamic.Lantern2_Toon", "Is Painted") and GetPropertyBool("potw_zonee_dynamic.Lantern3_Toon", "Is Painted") and PotW_Jungle_HiddenLanternScene == false then
      PotW_Jungle_HiddenLanternScene = true
      wait(1)
      SetGlobal("PotW_Jungle_LanternsComplete", 1)
      FireUser1("CameraLanternDoor")
      wait(1.3)
      AnimGBReset("potw_zonee_dynamic.CaveDoor2")
      AnimGBSequence("potw_zonee_dynamic.CaveDoor2", "Open")
    end
  end
end
PotW_Jungle_LanternCheck = L0_0
L0_0 = "Stopped"
PotW_Jungle_ElevatorState = L0_0
function L0_0(A0_15, A1_16)
  local L2_17
  L2_17 = GetGlobal
  L2_17 = L2_17("potw_Jungle_WellLockCount")
  if L2_17 == 4 then
    L2_17 = "raise"
    if A1_16 == L2_17 then
      L2_17 = "lower"
    end
    if PotW_Jungle_ElevatorState == A1_16 then
      GetPrefabData("WellElevatorCam_" .. A1_16).shotOrder = "first"
      GetPrefabData("WellElevatorCam_" .. A1_16).ReverseCameras = "false"
      GetPrefabData("WellElevatorCam_" .. A1_16).fadeInTime = 0.8
      GetPrefabData("WellElevatorCam_" .. A1_16).fadeOutTime = 0.25
      GetPrefabData("WellElevatorCam_" .. L2_17).shotOrder = "last"
      GetPrefabData("WellElevatorCam_" .. L2_17).ReverseCameras = "true"
      GetPrefabData("WellElevatorCam_" .. L2_17).fadeInTime = 0.25
      GetPrefabData("WellElevatorCam_" .. L2_17).fadeOutTime = 0.8
      FireUser1("WellElevatorCam_" .. A1_16)
      wait(0.8)
      Disable("potw_zonee_cameras.WellCameraTrigger")
      TeleportToEntity(GetPlayer(), "potw_zonee_igc.WellCapTeleport_" .. A1_16)
      wait(1)
      AnimGBSequence(A0_15, A1_16)
      wait(GetPrefabData("WellElevatorCam_" .. A1_16).transitionTime - 1.8)
      FireUser1("WellElevatorCam_" .. L2_17)
      if A1_16 == "raise" then
        Wait(GetPrefabData("WellElevatorCam_" .. A1_16).transitionTime - 0.8)
        SetCameraAttributes("potw_zonee_cameras.Marker(CameraOverride) 03")
        Enable("potw_zonee_cameras.WellCameraTrigger")
      end
    else
      PotW_Jungle_ElevatorState = A1_16
      Disable("potw_zonee_scripting.Trig_WellCap" .. A1_16)
      wait(5)
      Enable("potw_zonee_scripting.Trig_WellCap" .. A1_16)
    end
  end
end
PotW_Jungle_ElevatorDir = L0_0
function L0_0()
  Print("Starkey Escapes")
  SetGlobal("PotW_PlayerHasKeyToVillage", 1)
  SetRotatorMaxSpeed("PotW_Jungle.HangmanTreeDoor", 12)
  AudioPostEventOn(GetPlayer(), "Play_sfx_HMT_open")
  PotW_Jungle_TreeDoorOpen = true
  FireUser1("StarkeyEscape_Camera")
  Wait(0.6)
  MoveToEntity("potw_zonee_ai.PirateStarkey", "potw_zonee.Marker_StarkeyEscape")
  wait(0.1)
  SetNextPatrolNode("potw_zonee_ai.PirateStarkey", "potw_zonee.PatrolNode_StarkeyEscape")
  Wait(2)
  FireUser3("StarkeyEscape_Camera")
  Wait(1)
  Hide("potw_zonee_ai.PirateStarkey")
end
PotW_Jungle_Clear = L0_0
function L0_0(A0_18, A1_19, A2_20)
  Print("************************** PotW_Jungle_Badies:   state = " .. A1_19)
  if A1_19 == "1" then
    SetGlobal("potw_Jungle_EnemiesEliminated", GetGlobal("potw_Jungle_EnemiesEliminated") - 1)
    Print("************************* potw_Jungle_EnemiesEliminated +1")
  elseif A1_19 == "2" then
    if GetCurrentTeam(A0_18) == 2 then
      Print("************************** PotW_Jungle_Badies:   GetCurrentTeam = 2")
      SetGlobal("potw_Jungle_EnemiesEliminated", GetGlobal("potw_Jungle_EnemiesEliminated") + 1)
    else
      Print("************************** PotW_Jungle_Badies:   GetCurrentTeam != 2")
      SetGlobal("potw_Jungle_EnemiesEliminated", GetGlobal("potw_Jungle_EnemiesEliminated") - 1)
      A1_19 = 1
    end
  end
  _G["PotW_ZoneE_potw_Jungle_hintDeaths" .. A2_20](A1_19)
end
PotW_Jungle_Badies = L0_0
L0_0 = 0
PotW_Jungle_OpeningHMTDoor = L0_0
L0_0 = false
PotW_Jungle_CaveDoorEnabled = L0_0
L0_0 = false
PotW_Jungle_TreeDoorOpen = L0_0
L0_0 = false
PotW_Jungle_CaveDoorClosing = L0_0
function L0_0(A0_21)
  Print("************* - PotW_Jungle_OpenTreeDoor_Check")
  AnimGBSequence("potw_zonee.HMTPlatform", "down")
  if GetGlobal("PotW_PlayerHasKeyToVillage") == 1 then
    PotW_Jungle_OpenTreeDoor()
    wait(3)
  end
  potw_Jungle_OpenCave()
end
PotW_Jungle_OpenTreeDoor_Check = L0_0
function L0_0()
  Print("************* - PotW_Jungle_OpenTreeDoor_Check")
  if PotW_Jungle_TreeDoorOpen == false then
    Print("************* - PotW_Jungle_OpenTreeDoor False now True")
    FireUser1("Camera_HMT_Doors")
    wait(1)
    AudioPostEventOn(GetPlayer(), "Play_sfx_HMT_open")
    SetRotatorMaxSpeed("PotW_Jungle.HangmanTreeDoor", 12)
    FireSequence("Jungle_Gus", "Jungle_Gus_DoorOpening")
  end
end
PotW_Jungle_OpenTreeDoor = L0_0
function L0_0()
  wait(0.5)
  Print("##############  Reset Called")
  AnimGBSequence("potw_zonee.HMTPlatform", "up")
end
potw_Jungle_ResetHMTPlatform = L0_0
L0_0 = false
HangmanTree_CaveTimerEnabled = L0_0
function L0_0()
  if HangmanTree_CaveTimerEnabled == false then
    Enable("potw_zonee_scripting.Trig_CloseHMTDoors")
    AnimGBReset("potw_zonee_dynamic.CaveDoor1")
    AnimGBSequence("potw_zonee_dynamic.CaveDoor1", "Open")
  end
  potw_Jungle_CaveTimer()
end
potw_Jungle_OpenCave = L0_0
function L0_0()
  local L0_22
  L0_22 = HangmanTree_CaveTimerEnabled
  if L0_22 == false then
    L0_22 = true
    HangmanTree_CaveTimerEnabled = L0_22
    L0_22 = TimerStart
    L0_22(15)
    L0_22 = "Ticking"
    repeat
      while L0_22 == "Ticking" do
        wait(0.3)
        L0_22 = TimerGetState()
        potw_Jungle_CloseCave()
        HangmanTree_CaveTimerEnabled = false
      end
    until L0_22 == "Expired"
  else
    L0_22 = TimerSetTime
    L0_22(15)
  end
end
potw_Jungle_CaveTimer = L0_0
function L0_0()
  if PotW_Jungle_CaveDoorEnabled == false then
    PotW_Jungle_CaveDoorClosing = true
    AnimGBReset("potw_zonee_dynamic.CaveDoor1")
    AnimGBSequence("potw_zonee_dynamic.CaveDoor1", "Close")
  end
end
potw_Jungle_CloseCave = L0_0
function L0_0(A0_23)
  PotW_Jungle_CaveDoorEnabled = true
  TimerStop()
  if PotW_Jungle_CaveDoorClosing == false then
    AnimGBSequence(A0_23, "RestOpen")
  elseif PotW_Jungle_CaveDoorClosing == true then
    AnimGBSequence(A0_23, "Open")
  end
end
PotW_Jungle_CaveDoorReOpen = L0_0
function L0_0()
  Print("****************** PotW_Jungle_Enable_HMTAccess")
  FireUser1("Camera_HMT")
  Wait(2)
  AnimGBReset("potw_zonee_dynamic.HMT_SwingingPlatform")
  AnimGBSequence("potw_zonee_dynamic.HMT_SwingingPlatform", "FallDown")
end
PotW_Jungle_Enable_HMTAccess = L0_0
function L0_0()
  if GetGlobal("PotW_PlayerHasKeyToVillage") == 0 and GetPropertyBool("potw_zonee_dynamic.P_ZoneE_Toon14", "Is Painted") then
    FireSequence("Jungle_Gus", "Jungle_HMTPlatformHint")
  end
end
PotW_Jungle_HMTPlatformHint = L0_0
function L0_0()
  Wait(1)
  SetGlobal("PotW_PlayerHasKeyToVillage", 1)
  TimerStop()
  EndTrackingCurrentLevelForScoring("potw_Jungle")
  StreamInterior(GetPlayer(), "stream_4_2")
  ActivateScene("environments/thepark/adventureland/pirates/gsa/potw_zonef.gsa")
  WaitForLevelLoad()
  StartFadeOut(1)
  wait(1)
  SetupPosition("HMTEntrance")
end
PotW_JungleToHangman_Teleport = L0_0
function L0_0()
  PotW_Jungle_TreeDoorOpen = true
  FireUser3("Camera_HMT_Doors")
  wait(0.85)
  Enable("Trigger_HMTPlatform_AfterCutscene")
  Print("Tree pulley return camera enabled")
  SetCameraAttributes("potw_zonee_igc.MCO_HMTPlatform")
  wait(0.3)
  potw_Jungle_CaveTimer()
end
PotW_Jungle_PulleyCamera = L0_0
L0_0 = true
PotW_AllowHeadBarks = L0_0
function L0_0(A0_24, A1_25)
  if PotW_AllowHeadBarks == true then
    FireSequence("Jungle_Gus", "Jungle_StoneHeadBark")
    DestroyEntity(A0_24)
  end
end
PotW_Jungle_StoneHeadBark = L0_0
function L0_0(A0_26)
  AudioPostEventOn(GetPlayer(), "Play_sfx_rockEyeGem_pu")
  FireSequence("Jungle_Gus", "Jungle_PickupGems")
  wait(0.5)
  SetGlobal("PotW_Jungle_EyesCollected", GetGlobal("PotW_Jungle_EyesCollected") + 1)
  DestroyEntity(A0_26)
end
PotW_Jungle_HiddenEyeCheck = L0_0
function L0_0(A0_27, A1_28, A2_29, A3_30)
  local L4_31, L5_32, L6_33, L7_34, L8_35, L9_36
  L4_31 = PauseAllAI
  L4_31()
  L4_31 = false
  PotW_AllowHeadBarks = L4_31
  L4_31 = A2_29
  L5_32 = false
  L6_33 = ""
  L7_34 = 1
  if A1_28 == "2" then
    L8_35 = FireSequence
    L9_36 = "Jungle_Gus"
    L8_35(L9_36, "Jungle_PaintGems")
    L8_35 = true
    PotW_AllowHeadBarks = L8_35
  else
    L8_35 = GetGlobal
    L9_36 = "PotW_Jungle_Eye"
    L9_36 = L9_36 .. A1_28 .. A2_29
    L8_35 = L8_35(L9_36)
    L6_33 = L8_35
    if A3_30 == nil then
    else
      L8_35 = GetGlobal
      L9_36 = "PotW_Jungle_Eye"
      L9_36 = L9_36 .. A1_28 .. A3_30
      L8_35 = L8_35(L9_36)
      L7_34 = L8_35
    end
    if L6_33 == 0 then
      L5_32 = true
    end
    if L7_34 == 0 and L5_32 == false then
      L4_31 = A3_30
    end
    L8_35 = "PotW_Jungle.RockHead"
    L9_36 = A1_28
    L8_35 = L8_35 .. L9_36 .. L4_31 .. "Eye"
    L9_36 = "PotW_Jungle_Eye"
    L9_36 = L9_36 .. A1_28 .. L4_31
    if 0 < GetGlobal("PotW_Jungle_EyesCollected") and GetGlobal(L9_36) == 0 then
      AudioPostEventOn(GetPlayer(), "Play_sfx_POTW_Jungle_PlaceJewell")
      PotW_Jungle_EyesPlayerInput = true
      SetGlobal("PotW_Jungle_EyesCollected", GetGlobal("PotW_Jungle_EyesCollected") - 1)
      FireSequence("Jungle_Gus", "Jungle_PlaceGem")
      SetGlobal("PotW_Jungle_EyePlaced", 1)
      SetGlobal(L9_36, 1)
      Unhide(L8_35)
      ForcePainted(L8_35)
      PotW_Jungle_HeadCheck(A0_27, A1_28)
    else
      if L6_33 + L7_34 == 0 then
        FireSequence("Jungle_Gus", "Jungle_MissingGems")
      elseif L6_33 + L7_34 == 1 then
        FireSequence("Jungle_Gus", "Jungle_MissingGem")
      elseif L6_33 + L7_34 == 2 then
        FireSequence("Jungle_Gus", "Jungle_PaintGems")
      end
      PotW_AllowHeadBarks = true
    end
  end
end
PotW_PlaceStoneHeadEye = L0_0
L0_0 = false
PotW_Jungle_EyesPlayerInput = L0_0
function L0_0(A0_37, A1_38)
  if GetGlobal("PotW_Jungle_HeadsComplete") == 0 and PotW_Jungle_EyesPlayerInput == false then
    PotW_Jungle_HeadCheck(A0_37, A1_38)
  end
end
PotW_Jungle_HeadCheck_Eyes = L0_0
function L0_0(A0_39, A1_40)
  local L2_41
  L2_41 = Print
  L2_41("Firing Head Check for Stone Head " .. A1_40)
  L2_41 = "PotW_Jungle.RockHead"
  L2_41 = L2_41 .. A1_40
  AudioPostEventOn(GetPlayer(), "Play_sfx_POTW_Jungle_PlaceJewell")
  if A1_40 == "1" then
  else
  end
  if GetPropertyBool(L2_41 .. "LEye", "Is Painted") then
    if GetPropertyBool(L2_41 .. "REye", "Is Painted") and true then
      Print("Head Check firing off camera for stone head " .. A1_40)
      DestroyEntity("potw_zonee_scripting.TrigSHConvo0" .. A1_40)
      FireUser1("CameraHead" .. A1_40)
      PauseAllAI()
      StartEmitters("potw_zonee_dynamic.Particle_Dust 01 Head 0" .. A1_40)
      StartEmitters("potw_zonee_dynamic.Particle_Dust 02 Head 0" .. A1_40)
      wait(1.15)
      FireThread(PotW_Rotate_Head, A1_40, 1)
      wait(4)
      StopEmitters("potw_zonee_dynamic.Particle_Dust 01 Head 0" .. A1_40)
      StopEmitters("potw_zonee_dynamic.Particle_Dust 02 Head 0" .. A1_40)
      wait(1.85)
      SetGlobal("potw_Jungle_WellLockCount", GetGlobal("potw_Jungle_WellLockCount") + 1)
      AnimGBSequence("potw_zonee_dynamic.WellLock0" .. GetGlobal("potw_Jungle_WellLockCount"), "Unlock")
      AnimGBSequence("potw_zonee_dynamic.WellCover", "Unlock" .. GetGlobal("potw_Jungle_WellLockCount"))
      wait(1.4)
      if A1_40 == "2" then
        AnimGBReset("PotW_Jungle.RockHead3_Plat")
        AnimGBSequence("PotW_Jungle.RockHead3_Plat", "open")
        AudioPostEventOn(GetPlayer(), "Play_sfx_POTW_Jungle_StonePlatform_Fall")
        Enable("potw_zonee_scripting.Statue2_Trigger")
      end
      if PotW_Jungle_HeadsIn == 4 and GetGlobal("PotW_Jungle_HeadsComplete") == 0 then
        SetGlobal("PotW_Jungle_HeadsComplete", 1)
        FireSequence("Jungle_Gus", "Jungle_OpenWell")
        wait(0.2)
        PotW_Jungle_ElevatorState = "lower"
      else
        PauseAllAI()
        FireSequence("Jungle_Gus", "Jungle_RemoveLock")
      end
      wait(2)
      DestroyEntity("potw_zonee_dynamic.WellLock0" .. GetGlobal("potw_Jungle_WellLockCount"))
    end
  elseif GetPropertyBool(L2_41 .. "REye", "Is Painted") == false and true == false then
    PotW_Rotate_Head(A1_40, 0)
  end
  PotW_Jungle_EyesPlayerInput = false
  PotW_AllowHeadBarks = true
end
PotW_Jungle_HeadCheck = L0_0
L0_0 = 0
PotW_Jungle_HeadsIn = L0_0
function L0_0(A0_42, A1_43)
  local L2_44
  L2_44 = Print
  L2_44("####################### In Rotate Head for head " .. A0_42)
  L2_44 = "PotW_Jungle.RockHead"
  L2_44 = L2_44 .. A0_42
  AnimGBReset(L2_44)
  AnimGBSequence(L2_44, "rotate")
  if A1_43 == 1 then
    PotW_Jungle_HeadsIn = PotW_Jungle_HeadsIn + 1
    Disable("potw_zonee_scripting.TrigSHConvo0" .. A0_42)
    Disable("potw_zonee_scripting.TrigSHBark_0" .. A0_42)
    Enable("potw_zonee_scripting.TrigSHConvoInside0" .. A0_42)
  else
    PotW_Jungle_HeadsIn = PotW_Jungle_HeadsIn - 1
    Enable("potw_zonee_scripting.TrigSHConvo0" .. A0_42)
    Enable("potw_zonee_scripting.TrigSHBark_0" .. A0_42)
    Disable("potw_zonee_scripting.TrigSHConvoInside0" .. A0_42)
  end
end
PotW_Rotate_Head = L0_0
function L0_0()
  if PotW_Jungle_HeadsIn == 4 and GetGlobal("PotW_Jungle_HeadsComplete") == 0 then
  else
    FireUser3("CameraLocks_LookAt")
  end
end
PotW_Jungle_ReleaseLockCamera = L0_0
function L0_0()
  Bark(GetPlayer(), "Just talkin' about whatever.", 3, "", "Stone Head")
end
PotW_Jungle_StoneHeads_Talk = L0_0
L0_0 = 1
potw_Jungle_enableGroup1 = L0_0
L0_0 = 1
potw_Jungle_enableGroup2 = L0_0
L0_0 = 1
potw_Jungle_enableGroup3 = L0_0
L0_0 = 1
potw_Jungle_enableGroup4 = L0_0
function L0_0()
  Print("Enable Hints From Starkey Intro")
  if potw_Jungle_enableGroup1 == 1 then
    EnableGuardianHint("potw_zonee_scripting.PlayerHintMarker Enemies 01")
  end
  if potw_Jungle_enableGroup2 == 1 then
    EnableGuardianHint("potw_zonee_scripting.PlayerHintMarker Enemies 02")
  end
  if potw_Jungle_enableGroup3 == 1 then
    EnableGuardianHint("potw_zonee_scripting.PlayerHintMarker Enemies 03")
  end
  if potw_Jungle_enableGroup4 == 1 then
    EnableGuardianHint("potw_zonee_scripting.PlayerHintMarker Enemies 04")
  end
  if GetGlobal("PotW_Jungle_HiddenSymbol1") == 0 then
    Print("Enable Hints From Starkey Intro 1")
    EnableGuardianHint("potw_zonee_scripting.PlayerHintMarker Symbol 01")
  end
  if GetGlobal("PotW_Jungle_HiddenSymbol2") == 0 then
    Print("Enable Hints From Starkey Intro 2")
    EnableGuardianHint("potw_zonee_scripting.PlayerHintMarker Symbol 02")
  end
  if GetGlobal("PotW_Jungle_HiddenSymbol3") == 0 then
    Print("Enable Hints From Starkey Intro 3")
    EnableGuardianHint("potw_zonee_scripting.PlayerHintMarker Symbol 03")
  end
end
PotW_ZoneE_EnableStarkeyHints = L0_0
function L0_0()
  DisableGuardianHint("potw_zonee_scripting.PlayerHintMarker Enemies")
  DisableGuardianHint("potw_zonee_scripting.PlayerHintMarker Symbol")
end
PotW_ZoneE_StarkeyCompleteHints = L0_0
function L0_0()
  EnableGuardianHint("potw_zonee_scripting.PlayerHintMarker HMT")
  EnableGuardianHint("potw_zonee_scripting.PlayerHintMarkers 01")
end
PotW_ZoneE_Hangman_Hint = L0_0
function L0_0(A0_45)
  DisableGuardianHint("potw_zonee_scripting.PlayerHintMarker Symbol 0" .. A0_45)
end
PotW_ZoneE_HintDisableSymbol = L0_0
function L0_0()
  DisableGuardianHint("potw_zonee_scripting.PlayerHintMarker Enemies")
end
PotW_ZoneE_HintDisableBadies = L0_0
L0_0 = 0
potw_Jungle_hintDeaths01 = L0_0
L0_0 = 0
potw_Jungle_hintDeaths02 = L0_0
L0_0 = 0
potw_Jungle_hintDeaths03 = L0_0
L0_0 = 0
potw_Jungle_hintDeaths04 = L0_0
function L0_0()
  potw_Jungle_hintDeaths01 = potw_Jungle_hintDeaths01 + 1
  if potw_Jungle_hintDeaths01 >= 2 then
    DisableGuardianHint("potw_zonee_scripting.PlayerHintMarker Enemies 01")
    potw_Jungle_enableGroup1 = 0
  end
end
PotW_ZoneE_potw_Jungle_hintDeaths1 = L0_0
function L0_0(A0_46)
  if A0_46 == 2 then
    potw_Jungle_hintDeaths02 = potw_Jungle_hintDeaths02 - 1
  else
    potw_Jungle_hintDeaths02 = potw_Jungle_hintDeaths02 + 1
    if 2 <= potw_Jungle_hintDeaths02 then
      DisableGuardianHint("potw_zonee_scripting.PlayerHintMarker Enemies 02")
      potw_Jungle_enableGroup2 = 0
    end
  end
end
PotW_ZoneE_potw_Jungle_hintDeaths2 = L0_0
function L0_0(A0_47)
  if A0_47 == 2 then
    potw_Jungle_hintDeaths03 = potw_Jungle_hintDeaths03 - 1
  else
    potw_Jungle_hintDeaths03 = potw_Jungle_hintDeaths03 + 1
    if potw_Jungle_hintDeaths03 >= 4 then
      DisableGuardianHint("potw_zonee_scripting.PlayerHintMarker Enemies 03")
      potw_Jungle_enableGroup3 = 0
    end
  end
end
PotW_ZoneE_potw_Jungle_hintDeaths3 = L0_0
function L0_0()
  DisableGuardianHint("potw_zonee_scripting.PlayerHintMarker Enemies 04")
  potw_Jungle_enableGroup4 = 0
end
PotW_ZoneE_potw_Jungle_hintDeaths4 = L0_0
