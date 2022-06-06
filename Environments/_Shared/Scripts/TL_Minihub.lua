local L0_0, L1_1
L0_0 = "tl_minihub.TL_StartPoint"
CurrentCheckpointMarker = L0_0
function L0_0()
  SetDefaultCameraValues(8, 10, -5)
  Cleanup_TL_MiniHub_ZoneD2()
end
SetupBaseCamTLMH = L0_0
function L0_0()
  ForEachEntityInGroup(Enable, "BWFodder")
end
SpawninBeetleworxFodder = L0_0
function L0_0(A0_2, A1_3)
  if A1_3 == "Paint" then
    FireSequence("tl_minihub_story.ConversationalTrigger 01", "TLMH_Gus_PumpsFilled")
    SetGlobal("RocketArmCount", 1)
    FireUser1("tl_minihub_igc.grabcamerafancy 05.FancyCameraLookAt 01")
    TL_RocketManagerCheck()
    Bark(GetPlayer(), "This paint-thinner reservoir will repair the elevation of the Rocket Ride.", 3, "Gus", "Gus:")
    FireSequence("tl_minihub_story.ConversationalTrigger 01", "TLMH_Gus_ElevateRocketRide")
    Wait(3)
  elseif A1_3 == "Thinner" then
    Bark(GetPlayer(), "All that Thinner caused the Machine to break, Mickey.", 3, "Gus", "Gus:")
    FireSequence("tl_minihub_story.ConversationalTrigger 01", "TLMH_Gus_ThinnerMachineBreak")
    SetGlobal("RocketArmCount", 2)
    FireUser1("tl_minihub_igc.grabcamerafancy 05.FancyCameraLookAt 01")
    TL_RocketManagerCheck()
  end
end
TL_PumpsFilled = L0_0
function L0_0()
  LoadLevel(GetPlayer(), "Levels/MeanStreet.Level")
end
TL_GotoMeanStreets = L0_0
function L0_0()
  SetGlobal("TLFutureDiag", GetGlobal("TLFutureDiag") + 10)
  ForEachEntityInGroup(SplineFollower_SetDisabled, "tl_minihub_airlock3.TL_SpaceMount_DoorBridge_Inert 12", false)
  ForEachEntityInGroup(SplineFollower_SetDisabled, "Space_Mountain_Bridge", false)
end
TL_Visit2Setup = L0_0
function L0_0()
  ForEachEntityInGroup(Kill, "SpatterGroup1")
end
TL_KillSpatters1 = L0_0
function L0_0()
  ForEachEntityInGroup(Enable, "SpatterSpawnGroup3")
end
TL_SpawnSpatterGroup3 = L0_0
function L0_0()
  SetGlobal("TL_TV1Count", 1)
  TL_PowerCheck()
end
TL_TV1Increase = L0_0
function L0_0()
  SetGlobal("TL_TV1Count", 0)
  TL_PowerCheck()
end
TL_TV1Decrease = L0_0
function L0_0()
  SetGlobal("TL_TV2Count", 1)
  TL_PowerCheck()
end
TL_TV2Increase = L0_0
function L0_0()
  SetGlobal("TL_TV2Count", 0)
  TL_PowerCheck()
end
TL_TV2Decrease = L0_0
function L0_0()
  SetGlobal("TL_TV3Count", 1)
  TL_PowerCheck()
end
TL_TV3Increase = L0_0
function L0_0()
  SetGlobal("TL_TV3Count", 0)
  TL_PowerCheck()
end
TL_TV3Decrease = L0_0
function L0_0()
  SetGlobal("TL_TV4Count", 1)
  TL_PowerCheck()
end
TL_TV4Increase = L0_0
function L0_0()
  SetGlobal("TL_TV4Count", 0)
  TL_PowerCheck()
end
TL_TV4Decrease = L0_0
function L0_0()
  local L0_4, L1_5, L2_6, L3_7, L4_8
  L0_4 = 0
  if L1_5 == 0 then
    for L4_8 = 1, 3 do
      if GetGlobal("TL_TV" .. L4_8 .. "Count") == 1 and GetPropertyBool("pipeset0" .. L4_8 .. "_01", "Is Painted") and GetPropertyBool("pipeset0" .. L4_8 .. "_02", "Is Painted") and GetGlobal("TL_Power" .. L4_8 .. "Count") == 0 then
        SetGlobal("TL_Power" .. L4_8 .. "Count", 2)
        SetGlobal("TL_trackElectrified" .. L4_8, 1)
      end
      if GetGlobal("TL_Power" .. L4_8 .. "Count") == 2 and (GetPropertyBool("pipeset0" .. L4_8 .. "_01", "Is Painted") == false or GetPropertyBool("pipeset0" .. L4_8 .. "_02", "Is Painted") == false) then
        SetGlobal("TL_Power" .. L4_8 .. "Count", 1)
        SetGlobal("TL_trackElectrified" .. L4_8, 0)
        SetGlobal("TL_PowerRestored", 0)
        break
      end
      if GetGlobal("TL_TV" .. L4_8 .. "Count") == 1 and (GetPropertyBool("pipeset0" .. L4_8 .. "_01", "Is Painted") == false or GetPropertyBool("pipeset0" .. L4_8 .. "_02", "Is Painted") == false) then
        FireSequence("tl_minihub_story.ConversationalTrigger 01", "TLMH_Gus_PowerIsntConnected")
      end
      if GetGlobal("TL_Power" .. L4_8 .. "Count") == 2 then
        L0_4 = L0_4 + 1
        TramPoweredCamCut()
      end
    end
    if L0_4 == 2 then
      L1_5(L2_6)
      L1_5(L2_6)
      L1_5(L2_6, L3_7)
    end
    if L0_4 == 3 then
      L1_5(L2_6, L3_7)
      L1_5()
    end
  end
  if L1_5 == 1 then
    if L1_5 == 1 then
      L1_5(L2_6, L3_7)
      L1_5()
      L1_5(L2_6)
      L4_8 = true
      L1_5(L2_6, L3_7, L4_8)
      L1_5(L2_6)
      L4_8 = true
      L1_5(L2_6, L3_7, L4_8)
      L1_5(L2_6)
      L4_8 = true
      L1_5(L2_6, L3_7, L4_8)
    end
  end
  if L1_5 ~= 0 then
    if L1_5 ~= 0 then
      if L1_5 == false then
      end
    end
  end
end
TL_PowerCheck = L0_0
function L0_0()
  SetGlobal("TLMH_Gus_TramPoweringUp_Played", 1)
  RestrictCutSceneInput()
  if GetGlobal("TL_TramActivated") == 1 then
    FireUser1("tl_minihub_igc.grabcamerafancy 07.FancyCameraLookAt 01")
    wait(1)
    FireSequence("tl_minihub_story.ConversationalTrigger 03", "TLMH_Nova_Thanks")
    FireThread(TeleOutNova)
    wait(2)
    wait(4)
    SpacemountainDoorOpen()
    MultiPosSoundStart("tl_minihub_audio.Sound_Marker_PMover_01_Controller_Low")
    SetGlobal("TL_Minihub_PeopleMovers", 1)
  elseif GetGlobal("TL_TramActivated") == 0 then
    Unhide("tl_minihub.TriggerRotate 19")
    FireUser1("tl_minihub_igc.grabcamerafancy 07.FancyCameraLookAt 01")
    wait(1)
    FireSequence("tl_minihub_story.ConversationalTrigger 03", "TLMH_Nova_Thanks")
    FireThread(TeleOutNova)
    wait(6)
    SpacemountainDoorOpen()
    SplineFollower_SetDisabled("Escort_mover", true)
    SplineFollower_SetDisabled("Escort_mover2", true)
    SplineFollower_SetDisabled("Escort_mover3", true)
    SetSplineFollowerInitialSpeed("Escort_mover", 0)
    SetSplineFollowerInitialSpeed("Escort_mover2", 0)
    SetSplineFollowerInitialSpeed("Escort_mover3", 0)
    SetGlobal("TL_Minihub_PeopleMovers", 1)
  end
  UnrestrictCutSceneInput()
  TL_ZoneTLMH_PowerQuestSave()
end
NovaPeopleMoverPowerDown = L0_0
function L0_0(A0_9)
  if GetGlobal("TL_Minihub_PeopleMovers") == 1 then
    DestroyEntity(A0_9)
  end
end
PeopleMoverStop = L0_0
function L0_0()
  local L0_10
  L0_10 = GetChildEntityByName
  L0_10 = L0_10("tl_minihub_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01", "GremlinWrench")
  Unhide(L0_10)
  wait(1.2)
  DisableMotion("tl_minihub_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01")
  TeleportGremlinToEntity("tl_minihub_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01", "tl_minihub_igc.Marker(Rotatable) 01", false)
  EnterCutscene("tl_minihub_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01")
  AnimVarInt("tl_minihub_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01", VAR_Cutscene, 1)
  AnimEvent("tl_minihub_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01", EVENT_Start_Cutscene)
  wait(3)
  TeleportGremlinToEntity("tl_minihub_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01", "tl_minihub_igc.Marker(Rotatable) 02", false)
  wait(3)
  DestroyEntity("tl_minihub_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01")
end
TeleOutNova = L0_0
function L0_0()
  if GetGlobal("Spacemountaincount") == 0 then
    AudioPostEventOn("tl_minihub_airlock3.TL_SpaceMount_DoorBridge_Inert 12", "Play_sfx_TC_MetalGate_Open_Start")
    ForEachEntityInGroup(SplineFollower_SetDisabled, "tl_minihub_airlock3.TL_SpaceMount_DoorBridge_Inert 12", false)
    SetGlobal("Spacemountaincount", 1)
    wait(2.5)
    AudioPostEventOn("tl_minihub_airlock3.TL_SpaceMount_DoorBridge_Inert 12", "Play_sfx_TC_MetalGate_Open_Stop")
  end
end
SpacemountainDoorOpen = L0_0
function L0_0()
  if GetGlobal("TL_Power1Count") == 2 and GetGlobal("TL_Power2Count") == 2 and GetGlobal("TL_Power3Count") == 2 and GetGlobal("TL_PowerRestored") == 1 then
    SetGlobal("TL_TramActivated", 1)
    Unhide("tl_minihub.TriggerRotate 19")
    DestroyEntity("ElectricArcsOnTracks")
    FireUser1("tl_minihub_igc.grabcamerafancy 07.FancyCameraLookAt 01")
    wait(1)
    TL_PowerCheck()
  end
end
TL_PowerActivated = L0_0
function L0_0(A0_11)
  SetPropertyFloat(A0_11, "BranchPathChance", 0)
end
TL_CloudPathBranch = L0_0
function L0_0(A0_12, A1_13)
  SetPropertyFloat(A0_12, "BranchPathChance", 1)
  SplineFollower_SetDisabled(A1_13, false)
  SplineFollower_TeleportToKnot(A1_13, A0_12)
end
TL_CloudPathBranchNormal = L0_0
function L0_0()
  AnimGBSequence("tl_minihub.AnimSkyTrams1", "Rest")
  FireUser1("tl_minihub_igc.grabcamerafancy 06.FancyCameraLookAt 01")
  ForEachEntityInGroup(Enable, "SkyTramCam")
  wait(1.5)
  DoStinger("Stinger_LightSuccess", 4)
  AnimGBSequence("tl_minihub.AnimSkyTrams1", "ToLoop")
  AnimGBSequence("tl_minihub.AnimSkyTrams2", "ToLoop")
  ShakeCamera(2.5, 7, 0, 0.5, 0.0025, 0.0025)
  wait(6.4)
  AnimGBSequence("tl_minihub.AnimSkyTrams2", "Loop")
  AnimGBSequence("tl_minihub.AnimSkyTrams3", "Loop")
  AnimGBSequence("tl_minihub.AnimSkyTrams1", "Loop")
  wait(3)
end
TL_SkyTramStart = L0_0
function L0_0(A0_14)
  GoToEntity(A0_14, "tl_minihub.SplineKnot 59")
end
TL_CloudUp = L0_0
function L0_0(A0_15)
  GoToEntity(A0_15, "tl_minihub.SplineKnot 60")
end
TL_CloudDown = L0_0
function L0_0()
  FireUser1("introCam")
  wait(4)
  FireSequence("tl_minihub_story.ConversationalTrigger 01", "TLMH_Gus_OpeningScene")
end
TL_CamLevelStart = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 2)
end
TL_CamLevelStartRelease = L0_0
function L0_0(A0_16)
  if GetGlobal("TLMH_Gus_TramPoweringUp_Played") == 0 then
    FireUser1("tl_minihub_igc.grabcamerafancy 03.FancyCameraLookAt 01")
    wait(2)
    wait(6)
  elseif GetGlobal("TLMH_Gus_TramPoweringUp_Played") == 1 then
    FireSequence("tl_minihub_story.ConversationalTrigger 02", "TLMH_Apollo_ThanksAnyway")
    TeleOutApollo()
  end
  SetGlobal("TL_Gremlinfreed", 1)
  SetGlobal("TL_Gremlin_Apollo", 1)
end
TL_freegremlin1 = L0_0
function L0_0()
  if GetGlobal("TL_Gremlinfreed") ~= 1 or GetSketchCount(GetPlayer(), "Sketch_TV") == 0 then
  elseif GetSketchCount(GetPlayer(), "Sketch_TV") > 0 then
  end
end
TL_TVSell_Apollo = L0_0
function L0_0()
  wait(1.2)
  EnterCutscene("tl_minihub_story.dbc_gremlin_clean 01.Gremlin_Variant1_01")
  TeleportGremlinToEntity("tl_minihub_story.dbc_gremlin_clean 01.Gremlin_Variant1_01", "tl_minihubvisit1only.Marker(Rotatable) 02", false)
  wait(1)
  DestroyEntity("tl_minihub_story.dbc_gremlin_clean 01.Gremlin_Variant1_01")
end
TeleOutApollo = L0_0
function L0_0(A0_17)
  if GetGlobal("TL_Gremlin_Nova") == 0 then
    FireSequence("tl_minihub_story.ConversationalTrigger 04", "TLMH_Sparks_SkyTram")
  elseif GetGlobal("TL_Gremlin_Nova") == 1 then
    FireSequence("tl_minihub_story.ConversationalTrigger 04", "TLMH_Sparks_ThanksAnyway")
    TeleOutSparks()
  end
  TL_Gremlin_Sparks_Increase()
end
TL_freegremlin2 = L0_0
function L0_0()
  if GetGlobal("TL_Gremlin_Nova") == 0 then
    wait(1.2)
    EnterCutscene("tl_minihub_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01")
    FireUser1("tl_minihubvisit1only.grabcamerafancy 01.FancyCameraLookAt 01")
    DisableMotion("tl_minihub_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01")
    TeleportGremlinToEntity("tl_minihub_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01", "tl_minihubvisit1only.Marker(Rotatable) 01", false)
    DisableMotion("tl_minihub_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01")
    TeleportGremlinToEntity("tl_minihub_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01", "tl_minihubvisit1only.Marker(Rotatable) 02", false)
    wait(0.5)
    DestroyEntity("tl_minihub_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01")
  elseif GetGlobal("TL_Gremlin_Nova") == 1 then
    TeleportGremlinToEntity("tl_minihub_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01", "tl_minihubvisit1only.Marker(Rotatable) 02", false)
    wait(0.5)
    DestroyEntity("tl_minihub_story.dbc_gremlin_clean 03.dbc_gremlin_clean.Caged_Gremlin01")
  end
end
TeleOutSparks = L0_0
function L0_0(A0_18)
  FireSequence("tl_minihub_story.ConversationalTrigger 03", "TLMH_Nova_Thanks")
  wait(15)
  DestroyEntity("tl_minihub_story.dbc_gremlin_clean 02.dbc_gremlin_clean.Caged_Gremlin01")
end
TL_freegremlin3 = L0_0
function L0_0()
  SetGlobal("TL_ToonBacksideCount", GetGlobal("TL_ToonBacksideCount") + 1)
  TL_ToonBacksideCheck()
end
TL_ToonBacksideIncrease = L0_0
function L0_0()
  SetGlobal("TL_ToonBacksideCount", GetGlobal("TL_ToonBacksideCount") - 1)
  TL_ToonBacksideCheck()
end
TL_ToonBacksideDecrease = L0_0
function L0_0()
  if GetPropertyBool("TL_BacksideTop", "Is Painted") == false and GetPropertyBool("TL_BacksideBottom", "Is Painted") == false then
    AudioPostEventOn("tl_minihub_audio.Sound_Marker_Wall_Fall", "Play_sfx_TC_TCS_Buttress_Open_Start")
    AnimGBSequence("BacksideInertFall", "Drop")
    SetGlobal("TL_ToonBacksideCount", GetGlobal("TL_ToonBacksideCount") + 100)
    wait(0.2)
    ShakeCamera(0.5, 7, 0, 0.75, 0.01, 0.005)
    wait(10)
    DestroyEntity("BacksideInertFall")
  end
end
TL_ToonBacksideCheck = L0_0
L0_0 = 0
ToonV2Set = L0_0
function L0_0(A0_19, A1_20)
  if ToonV2Set == 0 then
    Prefab_SpawnItem_Jigsaw(A0_19, A1_20)
  end
end
TL_ToonV2Set = L0_0
function L0_0()
  local L1_21
  L1_21 = 1
  ToonV2Set = L1_21
end
TL_ToonV2countIncrease = L0_0
function L0_0()
  local L1_22
  L1_22 = 0
  ToonV2Set = L1_22
end
TL_ToonV2countDecrease = L0_0
function L0_0()
  FireUser1("tl_minihub_igc.grabcamerafancy 05.FancyCameraLookAt 01")
  Wait(0.8)
  SetGlobal("RocketManagerCount", 1)
  AudioPostEventOn(GetPlayer(), "Event_sfx_TC_Sq_RocketRide_Fixed")
  DoStinger("Stinger_Moment", 4)
  MultiPosSoundStart("tl_minihub_audio.RocketRideAmbLP_control")
  AnimGBReset("tl_minihub.TL_Rocket_Ride")
  AnimGBReset("tl_minihub.TL_Rocket_Arms")
  AnimGBReset("tl_minihub.TL_Rocket_Top")
  Enable("tl_minihub.SplineFollower 01")
  AnimGBSequence("tl_minihub.TL_Rocket_Ride", "Loop")
  ForEachEntityInGroup(AnimGBSequence, "tl_minihub.TL_Rocket_Top", "Loop")
  ForEachEntityInGroup(AnimGBSequence, "tl_minihub.TL_Rocket_Arms", "Loop")
  ForEachEntityInGroup(Enable, "TL_Rocket_Vertical_Gears")
  AudioPostEventOn("tl_minihub_audio.Sound_Marker_FutureGear 01", "Play_sfx_TC_TCS_Env_FutureGearWall")
  TL_ZoneTLMH_RocketSave()
end
TL_RocketManagerCheck = L0_0
function L0_0()
  if GetGlobal("RocketManagerCount") == 1 then
    Disable("RocketRideSpinnyGear")
    DisableGlint("RocketRideSpinnyGear")
    MultiPosSoundStart("tl_minihub_audio.RocketRideAmbLP_control")
    AnimGBReset("tl_minihub.TL_Rocket_Ride")
    AnimGBReset("tl_minihub.TL_Rocket_Arms")
    AnimGBReset("tl_minihub.TL_Rocket_Top")
    Enable("tl_minihub.SplineFollower 01")
    AnimGBSequence("tl_minihub.TL_Rocket_Ride", "Loop")
    ForEachEntityInGroup(AnimGBSequence, "tl_minihub.TL_Rocket_Top", "Loop")
    ForEachEntityInGroup(AnimGBSequence, "tl_minihub.TL_Rocket_Arms", "Loop")
    ForEachEntityInGroup(Enable, "TL_Rocket_Vertical_Gears")
    AudioPostEventOn("tl_minihub_audio.Sound_Marker_FutureGear 01", "Play_sfx_TC_TCS_Env_FutureGearWall")
  end
end
TL_RocketManagerCheck_Visit2 = L0_0
function L0_0()
  if GetGlobal("TL_PowerRestored") == 1 and GetGlobal("TL_TramPowerRestored") == 0 then
    SetGlobal("TL_TramPowerRestored", 1)
  elseif GetGlobal("TL_PowerRestored") == 0 then
  end
end
TramPoweredCamCut = L0_0
function L0_0()
  SetGlobal("TL_ToonSignCount", GetGlobal("TL_ToonSignCount") + 1)
end
TL_ToonSignIncrease = L0_0
function L0_0()
  SetGlobal("TL_ToonSignCount", GetGlobal("TL_ToonSignCount") - 1)
end
TL_ToonSignDecrease = L0_0
function L0_0()
  if GetPropertyBool("Tomorrowlandsignsupport1", "Is Painted") == false and GetPropertyBool("Tomorrowlandsignsupport2", "Is Painted") == false and GetGlobal("TL_ToonSignCount") == 0 then
    if GetPropertyBool("tl_minihub.TL_MiniHub_Oneshots_01 25", "Is Painted") == false then
      AnimGBSequence("TomorrowlandSign", "DropAllTheWay")
      SetGlobal("TL_ToonSignCount", GetGlobal("TL_ToonSignCount") + 5)
      AnimGBSequence("TL_FloorBreakable", "Break")
      wait(0.5)
      DestroyEntity("TL_hubStart_portal")
      wait(0.4)
      ShakeCamera(1, 10, 0, 0.75, 0.01, 0.01)
      wait(1.6)
      DestroyEntity("TomorrowlandSign")
    elseif GetPropertyBool("tl_minihub.TL_MiniHub_Oneshots_01 25", "Is Painted") == true then
      AnimGBSequence("TomorrowlandSign", "Drop2Platform")
      SetGlobal("TL_ToonSignCount", GetGlobal("TL_ToonSignCount") + 1)
      AnimGBSequence("TL_FloorBreakable", "Break")
      wait(0.5)
      DestroyEntity("TL_hubStart_portal")
      wait(0.4)
      ShakeCamera(1, 10, 0, 0.75, 0.01, 0.01)
    end
  end
  if GetGlobal("TL_ToonSignCount") == 1 and GetPropertyBool("tl_minihub.TL_MiniHub_Oneshots_01 25", "Is Painted") == false then
    AnimGBSequence("TomorrowlandSign", "PlatformDown")
    SetGlobal("TL_ToonSignCount", GetGlobal("TL_ToonSignCount") + 5)
    wait(2)
    DestroyEntity("TomorrowlandSign")
  end
end
TL_ToonSignCheck = L0_0
function L0_0()
  if GetGlobal("TL_trackElectrified1count") == 0 then
    SetGlobal("TL_trackElectrified1count", 10000)
    MultiPosSoundStart("tl_minihub_audio.Sound_Marker_PMover_01_Controller_High")
    if GetGlobal("TL_trackElectrified1") + GetGlobal("TL_trackElectrified2") + GetGlobal("TL_trackElectrified3") + GetGlobal("TL_trackElectrified4") == 1 then
      FireUser1("Electrified_Trigger")
      AnimGBSequence("ElectricArcsOnTracks", "PlatformDown")
      Unhide("ElectricArcsOnTracks")
      AudioPostEventOn(GetPlayer(), "Unhide_TCS_sparksLP")
      Print("***************** Some Valuable Piece of InformationTRACKA ************")
    end
    MultiPosSoundStart("tl_minihub_audio.Sound_Marker_PMover_01_Controller_Low")
  end
end
TL_ElectricTrackA = L0_0
function L0_0()
  TL_ElectricTrackA()
end
TL_ElectricTrackD = L0_0
function L0_0()
  TL_ElectricTrackA()
end
TL_ElectricTrackB = L0_0
function L0_0()
  TL_ElectricTrackA()
end
TL_ElectricTrackC = L0_0
function L0_0()
  SetGlobal("TL_2dBacksideCount", GetGlobal("TL_2dBacksideCount") + 1)
end
TL_2dBacksideIncrease = L0_0
function L0_0()
  SetGlobal("TL_2dBacksideCount", GetGlobal("TL_2dBacksideCount") - 1)
end
TL_2dBacksideDecrease = L0_0
function L0_0()
  if GetGlobal("TL_2dBacksideCount") == 0 then
    ClearCameraHintAll(GetPlayer())
  end
end
TL_clearCameraHints = L0_0
function L0_0(A0_23)
  if GetGlobal("Electric_tracks_cam") == 0 then
    FireUser1("tl_minihub_igc.grabcamerafancy 08.FancyCameraLookAt 01")
    wait(2)
    Unhide("ElectricArcsOnTracks")
    AudioPostEventOn(GetPlayer(), "Unhide_TCS_sparksLP")
    Print("***************** Some Valuable Piece of Information ************")
    Wait(4)
    DestroyEntity("tl_minihub.SplineFollower 01")
    SetGlobal("Electric_tracks_cam", 1000)
  end
end
TL_Eletric_Cam = L0_0
function L0_0()
  TL_CamLevelStart()
  StreamInterior(nil, "stream_16a")
end
StreamOutInterior = L0_0
function L0_0()
  wait(1)
  StreamInterior(nil, "stream2D_3")
end
StreamInInterior = L0_0
function L0_0()
  UnrestrictCutSceneInput()
end
aaassssdsdada = L0_0
function L0_0()
  if GetGlobal("RocketArmCount") > 0 then
    FireSequence("tl_minihub_story.ConversationalTrigger 03", "TLMH_Nova_Rocket")
    ForEachEntityInGroup(Unhide, "TL_Nova_sketches")
  end
  if GetGlobal("RocketArmCount") == 0 then
    FireSequence("tl_minihub_story.ConversationalTrigger 03", "TLMH_Nova_Thanks")
    ForcePainted("tl_gearpuzzletemp.NOS_HM_StretchGearsA3 02_2")
    ForcePainted("tl_gearpuzzletemp.NOS_HM_StretchGearsA2 02_2")
    FireUser1("tl_minihub_igc.grabcamerafancy 01.FancyCameraLookAt 01")
  end
  TL_Gremlin_Nova_Increase()
end
TL_GremlinNova = L0_0
function L0_0(A0_24)
  SetGlobal("TL_GoofyParts", GetGlobal("TL_GoofyParts") + 1)
end
TL_GoofyPartIncrease = L0_0
function L0_0()
  SetMap(nil, "MAP_TL_MINIHUB", "GAME")
  StartTrackingCurrentLevelForScoring("Tomorrow Square")
  SaveCheckpoint(GetPlayer(), "TL_TLMHLoadCheckpoint", CurrentCheckpointMarker)
end
TL_ZoneTLMH_SaveCheckpoint = L0_0
function L0_0()
  SetMap(nil, "MAP_TL_MINIHUB", "GAME")
  CurrentCheckpointMarker = "RocketLoadPoint"
  StartTrackingCurrentLevelForScoring("Tomorrow Square")
  SaveCheckpoint(GetPlayer(), "TL_TLMHLoadCheckpoint", CurrentCheckpointMarker)
end
TL_ZoneTLMH_RocketSaveCheckpoint = L0_0
function L0_0()
  WaitForLevelLoad()
  SetMap(nil, "MAP_TL_MINIHUB", "GAME")
  StartTrackingCurrentLevelForScoring("Tomorrow Square")
  TeleportToEntity("tl_minihub_audio.Trigger_Portal 01", GetPlayer())
  AudioPostEventOn(GetPlayer(), "Hide_TCS_sparksLP")
  if GetGlobal("RocketManagerCount") == 1 then
    ClearAllCameraAttributes()
    AnimGBReset("tl_minihub.TL_Rocket_Ride")
    AnimGBReset("tl_minihub.TL_Rocket_Arms")
    AnimGBReset("tl_minihub.TL_Rocket_Top")
    ForEachEntityInGroup(AnimGBSequence, "tl_minihub.TL_Rocket_Arms", "Loop")
    AnimGBSequence("tl_minihub.TL_Rocket_Ride", "Loop")
    ForEachEntityInGroup(AnimGBSequence, "tl_minihub.TL_Rocket_Top", "Loop")
    DestroyEntity("BacksideInertFall")
    DisableGlint("RocketRideSpinnyGear")
    Disable("RocketRideSpinnyGear")
    MultiPosSoundStart("tl_minihub_audio.RocketRideAmbLP_control")
    CurrentCheckpointMarker = "RocketLoadPoint"
    AudioPostEventOn("tl_minihub_audio.Sound_Marker_FutureGear 01", "Play_sfx_TC_TCS_Env_FutureGearWall")
  end
  if GetGlobal("TT_goofywaistget") > 0 then
    ClearAllCameraAttributes()
    FireThread(TL_ZoneTLMH_GoofyLoad)
  end
  if GetGlobal("TLMH_Gus_TramPoweringUp_Played") == 1 then
    ClearAllCameraAttributes()
    ForEachEntityInGroup(Disable, "PowerPads")
    ForEachEntityInGroup(SplineFollower_SetDisabled, "tl_minihub_airlock3.TL_SpaceMount_DoorBridge_Inert 12", false)
    MultiPosSoundStart("tl_minihub_audio.Sound_Marker_PMover_01_Controller_High")
    if GetGlobal("TL_Minihub_PeopleMovers") == 1 then
      DestroyEntity("Escort_mover3")
      DestroyEntity("Escort_mover2")
      DestroyEntity("Escort_mover1")
    end
    FireThread(TL_TLMH_EscortAnims)
  end
end
TL_TLMHLoadCheckpoint = L0_0
function L0_0()
  wait(4)
  ForEachEntityInGroup(Enable, "SpatterSpawnGroup1")
  AnimGBSequence("Escort_mover1", "Loop", true)
  wait(3.6)
  AnimGBSequence("Escort_mover2", "Loop", true)
  wait(3.6)
  AnimGBSequence("Escort_mover3", "Loop", true)
end
TL_TLMH_EscortAnims = L0_0
function L0_0()
  AnimGBReset("tl_minihub.AnimSkyTrams1")
  AnimGBReset("tl_minihub.AnimSkyTrams2")
  AnimGBReset("tl_minihub.AnimSkyTrams3")
  AnimGBSequence("tl_minihub.AnimSkyTrams1", "ToLoop")
  AnimGBSequence("tl_minihub.AnimSkyTrams2", "ToLoop")
  AnimGBSequence("tl_minihub.AnimSkyTrams3", "ToLoop")
  wait(6.1)
  AnimGBSequence("tl_minihub.AnimSkyTrams2", "Loop")
  AnimGBSequence("tl_minihub.AnimSkyTrams3", "Loop")
  AnimGBSequence("tl_minihub.AnimSkyTrams1", "Loop")
  ForEachEntityInGroup(DestroyEntity, "GoofyQuest")
end
TL_ZoneTLMH_GoofyLoad = L0_0
function L0_0()
  FireSequence("tl_minihub_story.ConversationalTrigger 01", "GP_GoofyWaist")
end
TL_ZoneTLMH_GoofyopenChest = L0_0
function L0_0()
  wait(0.2)
  SaveQuestGlobal("TL_StretchGear02")
  SaveQuestGlobal("TL_StretchGear02_2")
  SaveQuestGlobal("TL_StretchGear02Painted")
  SaveQuestGlobal("TL_StretchGear02Painted_2")
  SaveQuestGlobal("TL_StretchPlatPos_2")
  SaveQuestGlobal("TL_StretchPlatPos")
  SaveQuestGlobal("TL_StretchGear01")
  SaveQuestGlobal("TL_StretchGear01_2")
  SaveQuestGlobal("TL_StretchGear01Painted")
  SaveQuestGlobal("TL_StretchGear01Painted_2")
  SaveQuestGlobal("RocketVerticalCount")
  SaveQuestGlobal("TL_StretchKeyEnabled")
  SaveQuestGlobal("TL_StretchKeyEnabled_2")
  SaveQuestGlobal("TL_StretchMasterRotate_2")
  SaveQuestGlobal("TL_StretchPlatReverse_2")
  SaveQuestGlobal("TL_StretchPlatReverse")
  SaveQuestGlobal("TL_StretchMid")
  SaveQuestGlobal("TL_StretchMid_2")
  SaveQuestGlobal("TLMH_Gus_SkyTramRepaired_Played")
  SaveQuestGlobal("TL_Goofy_PartCheck")
  SaveQuestGlobal("TLMH_Gus_PartofGoofy_Played")
  SaveQuestGlobal("TLMH_Sparks_HelpBarks_Played")
  SaveQuestGlobal("TLMH_Sparks_SkyTram_Played")
  SaveQuestGlobal("TLMH_Sparks_Thanks_Played")
  SaveQuestGlobal("TLMH_Gus_DivertingPower_Played")
  SaveQuestGlobal("TL_GoofyParts")
  TL_ZoneTLMH_SaveCheckpoint()
end
TL_ZoneTLMH_GoofySave = L0_0
function L0_0()
  wait(0.2)
  SaveQuestGlobal("RocketArmCount")
  SaveQuestGlobal("RocketSpinCount")
  SaveQuestGlobal("RocketManagerCount")
  SaveQuestGlobal("TLMH_Nova_HelpBarks_Played")
  SaveQuestGlobal("TLMH_Nova_Thanks_Played")
  SaveQuestGlobal("TLHM_Gus_RocketRepaired_Played")
  SaveQuestGlobal("TLMH_Gus_RotateRocketRide_Played")
  SaveQuestGlobal("TLMH_Gus_ElevateRocketRide_Played")
  SaveQuestGlobal("TLMH_Gus_ExtendRocketRide_Played")
  SaveQuestGlobal("TLMH_Gus_RotateRocketRide_Played")
  SaveQuestGlobal("TLMH_Gus_ThinnerMachineBreak_Played")
  SaveQuestGlobal("TLMH_Gus_PumpsFilled_Played")
  SaveQuestGlobal("TLMH_Gus_PartOfRocket_Played")
  SaveQuestGlobal("TLMH_Gus_DynamoRoom_Played")
  SaveQuestGlobal("TLMH_Gus_InPosition_Played")
  TL_ZoneTLMH_RocketSaveCheckpoint()
end
TL_ZoneTLMH_RocketSave = L0_0
function L0_0()
  wait(0.2)
  SaveQuestGlobal("TLMH_Gus_TramPoweringUp_Played")
  SaveQuestGlobal("TLMH_Apollo_HelpBarks_Played")
  SaveQuestGlobal("TLMH_Apollo_PowerStation_Played")
  SaveQuestGlobal("TLMH_Apollo_Thanks_Played")
  SaveQuestGlobal("TLMH_Gus_PeopleMoverMoves_Played")
  SaveQuestGlobal("TLMH_Gus_PeopleMoverSwitch_Played")
  SaveQuestGlobal("TLMH_Gus_TracksGetElectrified_Played")
  SaveQuestGlobal("TLMH_Gus_ActivateMainSwitch_Played")
  SaveQuestGlobal("TLMH_Gus_PowerIsntConnected_Played")
  SaveQuestGlobal("TLMH_Gus_MainSwitch_Played")
  SaveQuestGlobal("TL_trackElectrified1")
  SaveQuestGlobal("TL_trackElectrified2")
  SaveQuestGlobal("TL_trackElectrified3")
  SaveQuestGlobal("TL_trackElectrified4")
  SaveQuestGlobal("TL_TV1Count")
  SaveQuestGlobal("TL_TV2Count")
  SaveQuestGlobal("TL_TV3Count")
  SaveQuestGlobal("TL_TV4Count")
  SaveQuestGlobal("TL_TramActivated")
  SaveQuestGlobal("TL_PowerRestored")
  SaveQuestGlobal("TL_TramPowerRestored")
  SaveQuestGlobal("TL_trackElectrified1count")
  SaveQuestGlobal("TL_Minihub_PeopleMovers")
  TL_ZoneTLMH_SaveCheckpoint()
end
TL_ZoneTLMH_PowerQuestSave = L0_0
function L0_0()
  SetGlobal("TL_Gremlin_Starr", 1)
end
TL_Gremlin_Starr_Increase = L0_0
function L0_0()
  SetGlobal("TL_Gremlin_Nova", 1)
end
TL_Gremlin_Nova_Increase = L0_0
function L0_0()
  SetGlobal("TL_Gremlin_Apollo", 1)
end
TL_Gremlin_Apollo_Increase = L0_0
function L0_0()
  SetGlobal("TL_Gremlin_Sparks", 1)
end
TL_Gremlin_Sparks_Increase = L0_0
function L0_0()
  local L0_25, L1_26
  SpawninBeetleworxFodder = L0_25
  L0_25 = nil
  TL_TV4Increase = L0_25
  L0_25 = nil
  TL_SkyTramStart = L0_25
  L0_25 = nil
  TL_freegremlin2 = L0_25
  L0_25 = nil
  TeleOutSparks = L0_25
  L0_25 = nil
  TeleOutNova = L0_25
  L0_25 = nil
  TL_TV2Decrease = L0_25
  L0_25 = nil
  TL_TLMHLoadCheckpoint = L0_25
  L0_25 = nil
  TL_ToonBacksideIncrease = L0_25
  L0_25 = nil
  TL_CloudDown = L0_25
  L0_25 = nil
  TL_TVSell_Apollo = L0_25
  L0_25 = nil
  TL_CloudPathBranchNormal = L0_25
  L0_25 = nil
  TL_2dBacksideIncrease = L0_25
  L0_25 = nil
  TL_ZoneTLMH_GoofyLoad = L0_25
  L0_25 = nil
  aaassssdsdada = L0_25
  L0_25 = nil
  TL_ToonBacksideCheck = L0_25
  L0_25 = nil
  TL_2dBacksideDecrease = L0_25
  L0_25 = nil
  TL_Gremlin_Nova_Increase = L0_25
  L0_25 = nil
  TL_ZoneTLMH_SaveCheckpoint = L0_25
  L0_25 = nil
  TL_TV4Decrease = L0_25
  L0_25 = nil
  TL_PowerCheck = L0_25
  L0_25 = nil
  TeleOutApollo = L0_25
  L0_25 = nil
  TL_ZoneTLMH_RocketSaveCheckpoint = L0_25
  L0_25 = nil
  TL_GotoMeanStreets = L0_25
  L0_25 = nil
  TL_CamLevelStartRelease = L0_25
  L0_25 = nil
  TL_Gremlin_Apollo_Increase = L0_25
  L0_25 = nil
  SetupBaseCamTLMH = L0_25
  L0_25 = nil
  StreamInInterior = L0_25
  L0_25 = nil
  TL_ToonSignDecrease = L0_25
  L0_25 = nil
  TL_SpawnSpatterGroup3 = L0_25
  L0_25 = nil
  TL_KillSpatters1 = L0_25
  L0_25 = nil
  TL_CamLevelStart = L0_25
  L0_25 = nil
  TL_ZoneTLMH_GoofyopenChest = L0_25
  L0_25 = nil
  StreamOutInterior = L0_25
  L0_25 = nil
  TL_TV2Increase = L0_25
  L0_25 = nil
  TL_ZoneTLMH_RocketSave = L0_25
  L0_25 = nil
  TL_ElectricTrackB = L0_25
  L0_25 = nil
  SpacemountainDoorOpen = L0_25
  L0_25 = nil
  TL_ElectricTrackC = L0_25
  L0_25 = nil
  TL_Gremlin_Starr_Increase = L0_25
  L0_25 = nil
  TL_TV1Increase = L0_25
  L0_25 = nil
  TL_ZoneTLMH_PowerQuestSave = L0_25
  L0_25 = nil
  TL_GoofyPartIncrease = L0_25
  L0_25 = nil
  TL_ElectricTrackA = L0_25
  L0_25 = nil
  TL_Eletric_Cam = L0_25
  L0_25 = nil
  TL_ElectricTrackD = L0_25
  L0_25 = nil
  TL_TV3Decrease = L0_25
  L0_25 = nil
  TL_ToonBacksideDecrease = L0_25
  L0_25 = nil
  TL_clearCameraHints = L0_25
  L0_25 = nil
  TL_TV1Decrease = L0_25
  L0_25 = nil
  TL_freegremlin3 = L0_25
  L0_25 = nil
  TL_Visit2Setup = L0_25
  L0_25 = nil
  TL_PumpsFilled = L0_25
  L0_25 = nil
  PeopleMoverStop = L0_25
  L0_25 = nil
  TL_ToonSignCheck = L0_25
  L0_25 = nil
  NovaPeopleMoverPowerDown = L0_25
  L0_25 = nil
  TL_CloudPathBranch = L0_25
  L0_25 = nil
  TramPoweredCamCut = L0_25
  L0_25 = nil
  TL_PowerActivated = L0_25
  L0_25 = nil
  TL_ZoneTLMH_GoofySave = L0_25
  L0_25 = nil
  TL_TV3Increase = L0_25
  L0_25 = nil
  TL_ToonSignIncrease = L0_25
  L0_25 = nil
  TL_GremlinNova = L0_25
  L0_25 = nil
  TL_CloudUp = L0_25
  L0_25 = nil
  TL_RocketManagerCheck = L0_25
  L0_25 = nil
  TL_freegremlin1 = L0_25
  L0_25 = nil
  TL_Gremlin_Sparks_Increase = L0_25
  L0_25 = nil
  Cleanup_TL_Minihub = L0_25
end
Cleanup_TL_Minihub = L0_0
