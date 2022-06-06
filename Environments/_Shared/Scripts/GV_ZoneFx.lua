local L0_0, L1_1
function L0_0()
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
  SetMap(nil, "MAP_GV_ZONEF", "GAME")
  Hide("RedChest_GusHouse")
  StartTrackingCurrentLevelForScoring("GV_ZoneF")
  ForEachEntityInGroup(DisableGlint, "BigBen_Gears")
  FireThread(GuardianPrefab_PopulateGuardians, "WOG_GuardianSpawner")
end
GV_ZoneF_MiscSetup = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("GV_ZoneF")
  FireSequence("GV_ZoneF_Gus", "GV_ZoneF_QuestCleanup")
end
GV_ZoneF_EndTracking = L0_0
L0_0 = false
GV_ZoneF_NoIntro = L0_0
function L0_0()
  Print("************************** GV_ZoneF_Start_Launcher")
  if GV_ZoneF_NoIntro == false then
    GetPrefabData("GV_ZoneF_Start").MapLoad_SetupPosition = "True"
  end
  GV_ZoneF_NoIntro = true
  OnMapLoad_ProjectorSetup("GV_ZoneF_Start")
end
GV_ZoneF_Start_Launcher = L0_0
function L0_0(A0_2)
  Print("************************** GV_ZoneF_SaveCheckpoint")
  SaveCheckpoint(GetPlayer(), "GV_ZoneF_LoadCheckpoint", A0_2)
  wait(3)
  SetGlobal("GV_ZoneF_Atop_BigBen", 0)
end
GV_ZoneF_SaveCheckpoint = L0_0
function L0_0()
  GV_ZoneF_SaveCheckpoint("Position_CP_Closer")
end
GV_ZoneF_CheckpointSave_Chests = L0_0
function L0_0()
  FireUser1("gremlinvillage_zonef_audio.Trigger_startLVL")
  GV_ZoneF_MiscSetup()
  if GetGlobal("DBC_1st_FreeCalvin") == 1 then
    SetParentEntity("Spawner_Calvin", ForceSpawn("gremlinvillage_zonef.Spawner_Gremlin_Calvin", 1)[1])
  end
  EnableGuardianHint("PlayerHint_Valve")
  Disable("gremlinvillage_zonef.Trigger_GusHouse")
  GV_ZoneF_SaveCheckpoint("GV_ZoneF_Start")
  Cleanup_GV_ZoneD()
end
GV_ZoneF_ProjectorExit = L0_0
function L0_0()
  GV_ZoneF_SaveCheckpoint("Position_CP_Closer")
  GV_ZoneF_CrusherAmbientShutoff()
end
GV_ZoneF_ConceptSave = L0_0
function L0_0()
  Print("************************************** GV_ZoneF_LoadCheckpoint")
  GV_ZoneF_NoIntro = true
  GV_ZoneF_MiscSetup()
  if GetGlobal("GVGUS_PipesRepaired_Played") == 1 then
    DestroyEntity("GV_ZoneF_CentralValve")
    ForEachEntityInGroup(FireUser1, "GV_ZoneF_Crushers")
  end
  if GetGlobal("GremVil_Intro_Played") == 1 then
    DestroyEntity("gremlinvillage_zonef.Trigger_Intro")
  end
  if GetGlobal("GV_TCG_GremChat01_Played") == 0 then
    Enable("Spawner_Windmill_Spatter")
  elseif GetGlobal("GV_TCG_GremChat01_Played") == 1 then
    Prefab_Projector_ChangeState("WindmillProjector", "Activate")
    FireUser1("Gremlin_Ditto")
  end
  if GetGlobal("GV_ZoneF_GusHelped") == 1 then
    ForcePainted("GusHouse")
    GV_GusHouse_State = 1
    Enable("gremlinvillage_zonef.Trigger_GusHouse")
  else
    if 0 < GetGlobal("GV_ZoneF_RidesRepaired") then
      EnableGuardianHint("PlayerHint_GusHouse")
    end
    Disable("gremlinvillage_zonef.Trigger_GusHouse")
  end
  if 0 < GetGlobal("GV_ZoneF_RidesRepaired") then
    GV_ZoneF_PipeHint = 1
    Print("************************************** GV_ZoneF_LoadCheckpoint - GetGlobal('GV_ZoneF_RidesRepaired') > 0")
    Disable("gremlinvillage_zonef_dynamic.Thinner_Spray_Spawner")
    Disable("gremlinvillage_zonef.Thinner_Spout")
    Disable("gremlinvillage_zonef_scripting.GusHouseDamage")
    Disable("ThinnerDamage_GusHouse")
    FireUser2("gremlinvillage_zonef_audio.Sound_ThinnerGusher")
    GV_PipesHealed = 1
    GV_GusHouseValve = 1
    ForEachEntityInGroup(ForcePainted, "GV_ZoneF_CentralPipes")
    SetInitialValue("gremlinvillage_zonef_scripting.CentralPipeFlowCounter", 9)
    SetRotatorMaxSpeed("gremlinvillage_zonef_dynamic.PlazaGear", 25)
    AudioPostEventOn("gremlinvillage_zonef_dynamic.PlazaGear", "Play_sfx_GV_WOC_GearFloor")
    AnimGBReset("gremlinvillage_zonef.Carpet_Ride_Arms")
    AnimGBSequence("gremlinvillage_zonef.Carpet_Ride_Arms", "Loop")
    AudioPostEventOn("gremlinvillage_zonef.Carpet_Ride_Arms", "Play_sfx_GV_WOC_CarpetRide_Start")
    SetRotatorMaxSpeed("LargeGearNearCarpet", 22)
    AudioPostEventOn("LargeGearNearCarpet", "Play_sfx_GV_WOC_GearBig_Start")
    ForEachEntityInGroup(ForcePainted, "CarpetToon")
    AnimGBSequence("gremlinvillage_zonef.Airplane_Ride_Arms", "Rotate")
    ForEachEntityInGroup(SetRotatorMaxSpeed, "GearsNearAirplaneRide", 15)
    AudioPostEventOn("gremlinvillage_zonef_audio.Sound_Marker_GearMedium 01", "Play_sfx_GV_WOC_Gear_Medium_Start")
    AudioPostEventOn("gremlinvillage_zonef_audio.Sound_Marker_GearLarge 01", "Play_sfx_GV_WOC_Gear_Large_Start")
    ForcePainted("AirplaneToon1")
  else
    EnableGuardianHint("PlayerHint_Valve")
  end
  if 0 < GetGlobal("GV_ZoneF_BigBenComp") then
    Print("************************************** GV_ZoneF_LoadCheckpoint - GetGlobal('GV_ZoneF_BigBenComp') == 1")
    ForEachEntityInGroup(SetRotatorMaxSpeed, "BigBen_Gears", 30)
    GetPrefabData("EnterBigBenProjector").StartsInactive = "True"
    SetSplineFollowerInitialSpeed("gremlinvillage_zonef.GV_ZoneF_DoorLock02", 1)
    AnimGBSequence("gremlinvillage_zonef.BigBen_Face_Left", "Open", false, 0, 1)
    AnimGBSequence("gremlinvillage_zonef.BigBen_Face_Center", "Open", false, 0, 1)
    AnimGBSequence("gremlinvillage_zonef.BigBen_Face_Right", "Open", false, 0, 1)
    AnimGBSequence("gremlinvillage_zonef_dynamic.BigBen_Platform", "Rest03")
    if GetGlobal("GV_ZoneF_BigBenComp") == 1 then
      AnimGBSequence("gremlinvillage_zonef.GV_ZoneF_Door01", "Open")
    else
      AnimGBSequence("gremlinvillage_zonef.GV_ZoneF_Door01", "Broken")
    end
  else
    EnableGuardianHint("PlayerHint_BigBen")
  end
  if GetGlobal("GV_ZoneF_Atop_BigBen") == 1 then
    AnimGBSequence("gremlinvillage_zonef.BigBen_Face_Center", "Open", false, 0, 1)
    AnimGBSequence("gremlinvillage_zonef.BigBen_Face_Left", "Open", false, 0, 1)
    FireThread(Prefab_Projector_SetOnlySideCamera, "GV_ZoneF_BigBenExitMarker")
    TeleportToEntity(GetPlayer(), "GV_ZoneF_BigBenExitMarker")
    FireUser1("gremlinvillage_zonef_audio.Trigger_Portal_FromClockCleaners")
  else
    FireUser1("gremlinvillage_zonef_audio.Trigger_startLVL")
  end
  if GetGlobal("GV_ZoneF_WindmillComp") == 1 then
    Print("************************************** GV_ZoneF_LoadCheckpoint - GetGlobal('GV_ZoneF_WindmillComp') == 1")
    ForEachEntityInGroup(SetRotatorMaxSpeed, "Windmill_Gears", 30)
    AudioPostEventOn("gremlinvillage_zonef_audio.Sound_Marker_Gear_Small 01", "Play_sfx_GV_WOC_Gear_Small_Start")
    AnimGBSequence("gremlinvillage_zonef.GV_Windmill_Blades", "Loop")
    AudioPostEventOn("gremlinvillage_zonef.GV_Windmill_Blades", "Play_sfx_GV_WOC_Windmill_Turn_LP")
    MultiPosSoundStart("gremlinvillage_zonef_dynamic.Sound_Marker_Windmill_Controller")
    SetSplineFollowerInitialSpeed("gremlinvillage_zonef.GV_ZoneF_DoorLock01", 1)
  end
  if GetGlobal("GV_ZoneF_PeteChestOpened") == 1 then
    if GetGlobal("GV_PeteStuff") == 0 then
      GV_PinTraderState = 2
    elseif GetGlobal("GV_PeteStuff") == 1 then
      GV_PinTraderState = 1
    end
    AnimGBSequence("gremlinvillage_zonef.SteamboatDoor", "Open")
    SetPropertyBool("GV_ZoneF_Steamboat_Valve", "ForceInvulnerable", true)
    DisableGlint("GV_ZoneF_Steamboat_Valve")
  else
    EnableGuardianHint("PlayerHint_PeteBoat")
  end
  if GetGlobal("DBC_1st_FreeCalvin") == 1 then
    SetParentEntity("Spawner_Calvin", ForceSpawn("gremlinvillage_zonef.Spawner_Gremlin_Calvin", 1)[1])
  end
end
GV_ZoneF_LoadCheckpoint = L0_0
function L0_0()
  FireUser1("GV_ZoneF_Intro1")
end
GV_ZoneF_GusZoneIntro = L0_0
function L0_0()
  FireUser3("GV_ZoneF_Intro2")
  FireSequence("GV_ZoneF_Gus", "GV_ZoneF_GusHouseQuest")
  wait(2)
  GV_ZoneF_SaveCheckpoint("Position_CP_Closer")
  EnableGuardianHint("PlayerHint_GusHouse")
end
GV_ZoneF_GusZoneIntro_Cleanup = L0_0
function L0_0()
  FireSequence("GV_ZoneF_Gus", "GV_ZoneF_GusHousePanic")
end
GV_ZoneF_GusHouseIntro = L0_0
L0_0 = 0
Gus_ThinnerWarning = L0_0
function L0_0()
  if GetGlobal("GV_ZoneF_BigBenComp") == 0 then
    Gus_ThinnerWarning = Gus_ThinnerWarning + 1
    if Gus_ThinnerWarning == 2 then
      FireSequence("GV_ZoneF_Gus", "GV_Pump_ThinnerReaction")
    end
  end
end
GV_ZoneF_ThinnerWarning = L0_0
L0_0 = 0
GV_HouseForReturn = L0_0
function L0_0(A0_3, A1_4)
  GV_HouseToEnter = tonumber(A1_4)
  FireSequence("GV_ZoneF_Gus", "GV_EnterGremlinHouse")
end
GV_EnterGremlinHouse = L0_0
function L0_0()
  Disable("GremHouse" .. GV_HouseToEnter .. "_Trigger")
  Disable("GremHouseExitTriggerUse")
  StreamInterior(nil, "stream_7_defaultinterior")
  StartFadeOut(0.8)
  AudioPostEventOn(GetPlayer(), "SetMix_EnterGremlinHouse")
  wait(1)
  WaitForLevelLoad()
  TeleportToEntity(GetPlayer(), "gremlinvillage_zonef.GremHouseMarker")
  wait(0.1)
  CameraReset()
  wait(0.2)
  SetCameraAttributes("gremlinvillage_zonef_scripting.GremHouse_CamOverride")
  GV_ZoneF_ChooseGremlinHouseGoodie()
  wait(0.1)
  StartFadeIn(0.8)
  wait(1)
  Enable("GremHouseExitTriggerUse")
end
GV_GremlinHouse_Enter = L0_0
L0_0 = 0
GV_HouseToEnter = L0_0
L0_0 = false
GV_House6Entered = L0_0
function L0_0()
  local L0_5
  L0_5 = Print
  L0_5("************************************** GV_ZoneF_ChooseGremlinHouseGoodie - GV_HouseToEnter: " .. GV_HouseToEnter)
  L0_5 = Prefab_GetItemSpawnerName
  L0_5 = L0_5()
  if GV_HouseToEnter == 1 then
    SetPropertyInt(L0_5, "Index To Spawn", 8, 0)
  elseif GV_HouseToEnter == 2 then
    if GV_House6Entered == false then
      GV_House6Entered = true
      SetPropertyInt(L0_5, "Index To Spawn", 7, 0)
    else
      SetPropertyInt(L0_5, "Index To Spawn", 8, 0)
    end
  elseif GV_HouseToEnter == 3 then
    Unhide("RedChest_GusHouse")
  elseif GV_HouseToEnter == 4 then
    SetPropertyInt(L0_5, "Index To Spawn", 8, 0)
  elseif GV_HouseToEnter == 5 then
    SetPropertyInt(L0_5, "Index To Spawn", 3, 0)
  elseif GV_HouseToEnter == 6 then
    if GV_House6Entered == false then
      GV_House6Entered = true
      SetPropertyInt(L0_5, "Index To Spawn", 7, 0)
    else
      SetPropertyInt(L0_5, "Index To Spawn", 8, 0)
    end
  elseif GV_HouseToEnter == 7 then
    SetPropertyInt(L0_5, "Index To Spawn", 8, 0)
  elseif GV_HouseToEnter == 8 then
    SetPropertyInt(L0_5, "Index To Spawn", 10, 0)
  elseif GV_HouseToEnter == 9 then
    SetPropertyInt(L0_5, "Index To Spawn", 4, 0)
  end
  TeleportToEntity(L0_5, "gremlinvillage_zonef_Marker_HouseGoodie")
  Print("************************************** GV_ZoneF_ChooseGremlinHouseGoodie - 'Index To Spawn' of PickupSpawner = " .. GetPropertyInt(L0_5, "Index To Spawn", 0))
  if GV_HouseToEnter == 3 then
  else
    SetPropertyString(L0_5, "Spawn Group", "GremlinGoodie", 0)
    Enable(L0_5)
  end
  Print("************************************** GV_ZoneF_ChooseGremlinHouseGoodie - GV_HouseToEnter: END")
end
GV_ZoneF_ChooseGremlinHouseGoodie = L0_0
function L0_0()
  FireSequence("GV_ZoneF_Gus", "GV_ExitGremlinHouse")
end
GV_GremlinHouse_Exit_Ask = L0_0
function L0_0()
  Disable("GremHouseExitTriggerUse")
  StartFadeOut(0.8)
  AudioPostEventOn(GetPlayer(), "SetMix_ExitGremlinHouse")
  wait(1)
  ClearAllCameraAttributes()
  FireUser1("GremHouseExitMarker" .. GV_HouseToEnter)
  Hide("RedChest_GusHouse")
  StreamInterior(nil, "stream_7_ai")
  WaitForLevelLoad()
  wait(0.1)
  StartFadeIn(0.8)
  SetPropertyString(PickupSpawner, "Spawn Group", "None", 0)
  ForEachEntityInGroup(DestroyEntity, "GremlinGoodie")
  wait(1)
  ShowHud()
  Enable("GremHouse" .. GV_HouseToEnter .. "_Trigger")
end
GV_GremlinHouse_Exit = L0_0
function L0_0(A0_6)
  if GV_GusHouse_State == 1 then
    GV_HouseToEnter = 3
    FireSequence("GV_ZoneF_Gus", "GV_EnterGusHouse")
  end
end
GV_EnterGusHouse = L0_0
function L0_0()
  local L0_7, L1_8
  L0_7 = GV_GusHouseValve
  if L0_7 == 1 then
    L0_7 = GV_GusHouse_State
    if L0_7 == 0 then
      L0_7 = SetGlobal
      L1_8 = "GV_ZoneF_GusHelped"
      L0_7(L1_8, 1)
      L0_7 = GetGlobal
      L1_8 = "GVGus_House_Fixed_Played"
      L0_7 = L0_7(L1_8)
      if L0_7 == 0 then
        L0_7 = FireUser1
        L1_8 = "GV_ZoneF_Start_WindMill"
        L0_7(L1_8)
        L0_7 = wait
        L1_8 = 0.8
        L0_7(L1_8)
        L0_7 = DisableGuardianHint
        L1_8 = "PlayerHint_GusHouse"
        L0_7(L1_8)
        L0_7 = ForceSpawn
        L1_8 = "gremlinvillage_zonef.Spawner_Gremlin_Gus"
        L0_7(L1_8, 1)
        L0_7 = FireSequence
        L1_8 = "GV_ZoneF_Gus"
        L0_7(L1_8, "GVGus_House_Fixed")
        L0_7 = AudioPostEventOn
        L1_8 = "gremlinvillage_zonef_audio.Sound_MachineLoop"
        L0_7(L1_8, "Play_sfx_amb_broken_WOC_Working")
        L0_7 = AudioPostEventOn
        L1_8 = "gremlinvillage_zonef_audio.Sound_ThinnerGusher"
        L0_7(L1_8, "Stop_sfx_GV_WOG_Thinner_Gusher_LP")
        L0_7 = "Gremlin_Gus"
        L1_8 = GetChildEntityByName
        L1_8 = L1_8(L0_7, "GremlinWrench")
        Unhide(L1_8)
        AnimVarInt(L0_7, VAR_NPC_State, 0)
        SetPropertyFloat(L0_7, "UsableRadius", 0)
        TeleportGremlinOut(L0_7)
        FireThread(TeleportGremlinIn, L0_7, "Marker_TCRide_Gremlin", true, false)
        wait(0.3)
        DisableMotion(L0_7)
        wait(0.4)
        EnterCutscene(L0_7, 1)
        wait(1)
        Rumble(GetPlayer(), 0.4)
        ShakeCamera(1.5, 3, 0.05, 4, 0.02, 0.045)
        AudioPostEventOn(GetPlayer(), "Play_sfx_GV_Gus_Fix")
        ForEachEntityInGroup(StopEmitters, "gremlinvillage_zonef_dynamic.TCRide_Sparks_01")
        wait(0.65)
        ShakeCamera(1, 5, 0.05, 4, 0.02, 0.045)
        Rumble(GetPlayer(), 0.6)
        AudioPostEventOn(GetPlayer(), "Play_sfx_GV_Gus_Fix")
        wait(0.4)
        ShakeCamera(1.5, 5, 0.05, 4, 0.02, 0.045)
        Rumble(GetPlayer(), 0.6)
        Wait(0.75)
        FireThread(TeleportGremlinOut, L0_7)
        wait(0.75)
        FireUser1("IGC_Windmill_Startup")
        Print("********************************Windmill Activated")
        ForEachEntityInGroup(SetRotatorMaxSpeed, "Windmill_Gears", 30)
        AudioPostEventOn("gremlinvillage_zonef_audio.Sound_Marker_Gear_Small 01", "Play_sfx_GV_WOC_Gear_Small_Start")
        SetGlobal("GV_ZoneF_WindmillComp", 1)
        AnimGBSequence("gremlinvillage_zonef.GV_Windmill_Blades", "Loop")
        AudioPostEventOn("gremlinvillage_zonef.GV_Windmill_Blades", "Play_sfx_GV_WOC_Windmill_Turn_LP")
        MultiPosSoundStart("gremlinvillage_zonef_dynamic.Sound_Marker_Windmill_Controller")
        wait(5)
        DestroyEntity(L0_7)
      end
      L0_7 = 1
      GV_GusHouse_State = L0_7
    end
  end
  L0_7 = GV_GusHouse_State
  if L0_7 > 0 then
    L0_7 = Enable
    L1_8 = "gremlinvillage_zonef.Trigger_GusHouse"
    L0_7(L1_8)
    L0_7 = SetGlobal
    L1_8 = "GV_ZoneF_GusHelped"
    L0_7(L1_8, 1)
    L0_7 = GV_GusHouse_State
    if L0_7 == 2 then
      L0_7 = 1
      GV_GusHouse_State = L0_7
    end
  end
end
GV_GusHouse_Painted = L0_0
function L0_0()
  while GV_GusHouse_State == 0 do
    wait(0.25)
  end
  FireUser3("IGC_Windmill_Startup")
  wait(1)
  GV_ZoneF_SaveCheckpoint("Position_CP_Closer")
end
GV_ZoneF_WindmillEnded = L0_0
function L0_0()
  if GV_GusHouse_State == 1 then
    GV_GusHouse_State = 2
  end
  if GV_GusHouseValve ~= 0 or GV_GusHouse_State == 2 then
  else
    GV_GusHouse_State = 0
  end
  Disable("gremlinvillage_zonef.Trigger_GusHouse")
end
GV_GusHouse_Thinned = L0_0
function L0_0()
  if GetPropertyBool("GusHouse", "Is Painted") then
  elseif GV_PipesHealed == 0 then
    FireSequence("GV_ZoneF_Gus", "GV_HousePanic")
  end
end
GV_GusSpeak = L0_0
function L0_0(A0_9)
  local L1_10
  L1_10 = _self
  Print("********************************GV_GremlinRideOp: " .. A0_9)
  wait(0.2)
  if GetGlobal("GV_ZoneF_RidesRepaired") == 0 then
    ForceSequence(L1_10, "GV_" .. A0_9 .. "G_GremChat01")
    Print("********************************GV_GremlinRideOp:  GetGlobal('GV_ZoneF_RidesRepaired') == 0")
  elseif GetGlobal("GV_ZoneF_BigBenComp") == 0 then
    ForceSequence(L1_10, "GV_" .. A0_9 .. "G_GremChat02")
    Print("********************************GV_GremlinRideOp:  GetGlobal('GV_ZoneF_BigBenComp') == 0")
  else
    ForceSequence(L1_10, "GV_" .. A0_9 .. "G_GremChat03")
    Print("********************************GV_GremlinRideOp:  else")
  end
end
GV_GremlinRideOp = L0_0
function L0_0(A0_11, A1_12)
  if DamageEvent_HasStimulusType(A1_12, ST_SPIN) then
    SetRotatorMaxSpeed(A0_11, 300)
    if GetGlobal("GV_PeteStuff") == 0 then
      wait(0.25)
      FireUser1("IGC_OpenZepDoor")
      SetDrawSilhouettes(false)
      SetPropertyFloat("SteamboatChest", "UsableRadius", 2)
      wait(2)
      AnimGBSequence("gremlinvillage_zonef.SteamboatDoor", "Open")
      AudioPostEventOn(GetPlayer(), "Play_sfx_GV_WOG_ShipDoor_Open")
      SetPropertyBool(A0_11, "ForceInvulnerable", true)
      DisableGlint(A0_11)
      wait(0.75)
      DoStinger("Stinger_Success", 7)
      wait(2.25)
      SetDrawSilhouettes(true)
    end
    Wait(1)
    SetRotatorMaxSpeed(A0_11, 0)
  end
end
GV_ZoneF_OpenSteamBoatDoor = L0_0
L0_0 = "none"
GV_ZoneF_Stream_Area = L0_0
function L0_0(A0_13, A1_14)
  if A1_14 == GV_ZoneF_Stream_Area then
  elseif A1_14 == "BigBen" then
    GV_ZoneF_Stream_Area = "BigBen"
    StreamInterior(nil, "stream_7b")
  elseif A1_14 == "Windmill" then
    GV_ZoneF_Stream_Area = "Windmill"
    StreamInterior(nil, "stream_7c")
  end
end
GV_ZoneF_Streaming = L0_0
function L0_0()
  StreamInterior(nil, "stream_7d")
end
GV_ZoneF_Stream_SteamB = L0_0
function L0_0()
  StreamZones(nil, "stream_8")
  SaveCheckpoint(GetPlayer(), nil, "MickeyStartPositionSteamB")
end
GV_SteamB_LoadZoneI = L0_0
function L0_0()
  SetSplineFollowerInitialSpeed("gremlinvillage_zonef.GV_ZoneE_CogStand2 01", 2)
  SetRotatorMaxSpeed("gremlinvillage_zonef.GV_ZoneE_Gear04_Toon 01", 30)
end
GV_ZoneF_LiftPainted = L0_0
function L0_0()
  SetSplineFollowerInitialSpeed("gremlinvillage_zonef.GV_ZoneE_CogStand2 01", 0)
  SetRotatorMaxSpeed("gremlinvillage_zonef.GV_ZoneE_Gear04_Toon 01", 0)
end
GV_ZoneF_LiftThinned = L0_0
L0_0 = 2
GV_ZoneF_PipeHint = L0_0
function L0_0(A0_15, A1_16)
  if DamageEvent_HasStimulusType(A1_16, ST_SPIN) then
    if GV_PipesHealed == 0 then
      FireSequence("GV_ZoneF_Gus", "GVGUS_PipesStillBroke")
    elseif GV_PipesHealed == 1 then
      DisableGuardianHint("PlayerHint_Valve")
      if GV_ZoneF_PipeHint == 2 then
        FireSequence("GV_ZoneF_Gus", "GVGUS_PipesRepaired")
        GV_ZoneF_PipeHint = 0
      end
      GV_ZoneF_PipeHint = GV_ZoneF_PipeHint + 1
      if GV_GusHouseValve == 0 then
        GV_GusHouseValve = 1
        Disable("gremlinvillage_zonef.Thinner_Spout")
        DestroyEntity("gremlinvillage_zonef_dynamic.Thinner_SprayParticle")
        Disable("gremlinvillage_zonef_scripting.GusHouseDamage")
        Disable("ThinnerDamage_GusHouse")
        FireUser2("gremlinvillage_zonef_audio.Sound_ThinnerGusher")
        SetRotatorMaxSpeed(A0_15, 300)
        AudioPostEventOn(A0_15, "Play_sfx_GV_Faucet_Turn")
        wait(0.5)
        SetRotatorMaxSpeed("gremlinvillage_zonef_dynamic.PlazaGear", 25)
        AudioPostEventOn("gremlinvillage_zonef_dynamic.PlazaGear", "Play_sfx_GV_WOC_GearFloor")
        ForEachEntityInGroup(StartEmitters, "GV_ZoneF_SparkAmbientGroup01")
        Wait(2)
        SetRotatorMaxSpeed(A0_15, 0)
      end
    end
  end
end
GV_ZoneF_ToonPipesCheck = L0_0
L0_0 = 0
GV_ZoneF_AmbientSteamSetting = L0_0
function L0_0(A0_17, A1_18)
  if GetGlobal("GV_ZoneF_ConceptArt") == 0 then
    AnimGBSequence(A0_17, "Down")
    AudioPostEventOn(A0_17, "Play_sfx_GV_WOC_Crusher_Down")
    wait(0.15)
    AudioPostEventOn(A0_17, "Play_sfx_GV_WOC_Crusher_Impact")
    wait(1.35)
    AnimGBSequence(A0_17, "Up", true)
    AudioPostEventOn(A0_17, "Play_sfx_GV_WOC_Crusher_Up")
  end
  if GV_ZoneF_AmbientSteamSetting == 0 then
    GV_ZoneF_AmbientSteamSetting = 1
    ForEachEntityInGroup(StartEmitters, "GV_ZoneF_SteamAmbientGroup01")
    ForEachEntityInGroup(StopEmitters, "GV_ZoneF_SteamAmbientGroup02")
  elseif GV_ZoneF_AmbientSteamSetting == 1 then
    GV_ZoneF_AmbientSteamSetting = 0
    ForEachEntityInGroup(StopEmitters, "GV_ZoneF_SteamAmbientGroup01")
    ForEachEntityInGroup(StartEmitters, "GV_ZoneF_SteamAmbientGroup02")
  end
end
GV_ZoneF_Crusher = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "GV_ZoneF_SteamAmbientGroup01")
  ForEachEntityInGroup(DestroyEntity, "GV_ZoneF_SteamAmbientGroup02")
end
GV_ZoneF_CrusherAmbientShutoff = L0_0
function L0_0()
  FireUser1("GV_ZoneF_Start_Rides")
  SetGlobal("GV_ZoneF_RidesRepaired", 1)
  Enable("Audio_Ride_Triggers")
  Enable("Audio_Ride_Trigger_CarpetRide")
  wait(0.5)
  MoveToEntity(GetPlayer(), "GV_ZoneF_MarkerMickeyFixedPipes")
  AnimGBReset("gremlinvillage_zonef.Carpet_Ride_Arms")
  AnimGBSequence("gremlinvillage_zonef.Carpet_Ride_Arms", "Start", true)
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_WOG_Fix_MagicCarpet")
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_WOG_Fix_Rides")
  Wait(1)
  FireThread(TeleportGremlinOut, "Gremlin_Sunstar")
  wait(3.5)
  AnimGBReset("gremlinvillage_zonef.Airplane_Ride_Arms")
  AnimGBSequence("gremlinvillage_zonef.Airplane_Ride_Arms", "ArmsOut", true)
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_WOG_Fix_Airplane")
  SetPropertyFloat("gremlinvillage_zonef_dynamic.PlayerHint_BigBen", "HintPriority", "100")
  GV_ZoneF_PositiveGremlins()
end
GV_ZoneF_IGC_StartRides = L0_0
function L0_0()
  local L0_19
  L0_19 = "Gremlin_Sunstar"
  wait(0.5)
  TeleportToEntity(L0_19, "GV_ZoneF_MarkerSunstarGreet", false, false)
  FireSequence(L0_19, "GV_APG_GremChat02")
  wait(1)
  TeleportGremlinIn(L0_19, "GV_ZoneF_MarkerSunstarGreet", false)
end
GV_ZoneF_IGC_StartRides_Cleanup = L0_0
function L0_0()
  AnimGBSequence("gremlinvillage_zonef.Carpet_Ride_Arms", "Loop")
  AnimGBSequence("gremlinvillage_zonef.Airplane_Ride_Arms", "Rotate")
end
GV_ZoneF_RidesSetToRotate = L0_0
function L0_0()
  local L0_20
  L0_20 = "Gremlin_Sunstar"
  FireUser1("GV_ZoneF_SunstarGreetCam02")
  SetGlobal("GV_ZoneF_SunstarGreeted", 1)
  TeleportGremlinToEntity(L0_20, "GV_ZoneF_MarkerSunstarReturn")
end
GV_ZoneF_SunStarTeleportHome = L0_0
function L0_0()
  FireUser3("GV_ZoneF_SunstarGreetCam02")
  FireSequence("GV_ZoneF_Gus", "GV_ZoneF_BigBenQuest")
  EnableGuardianHint("PlayerHint_BigBen")
  EnableGuardianHint("PlayerHint_PeteBoat")
  wait(1.5)
  GV_ZoneF_SaveCheckpoint("Position_CP_Closer")
  UnrestrictCutSceneInput()
  EnableMotion(Gremlin_Sunstar)
end
GV_ZoneF_SunstarCleanUp = L0_0
L0_0 = 0
GV_GusHouse_State = L0_0
L0_0 = 0
GV_TeacupsRide = L0_0
L0_0 = 0
GV_AirplaneRide = L0_0
L0_0 = 0
GV_CarpetRide = L0_0
L0_0 = 0
GV_PipesHealed = L0_0
L0_0 = 0
GV_GusHouseValve = L0_0
function L0_0()
  SetPropertyBool("gremlinvillage_zonef.GV_ZoneE_Wheel01_Inert 01", "ForceInvulnerable", true)
  if GV_PipesHealed == 0 then
    if GetGlobal("GV_ZoneF_GusCentralPipes_Played") == 0 then
      FireUser1("IGC_PipeControl_Off")
      wait(0.7)
      ForEachEntityInGroup(FireUser1, "GV_ZoneF_Crushers")
      Enable("TDV_CrusherJigsaw")
      wait(0.8)
      Disable("TDV_CrusherJigsaw")
    end
    FireSequence("GV_ZoneF_Gus", "GV_ZoneF_GusCentralPipes")
  end
  GV_PipesHealed = 1
  SetPropertyBool("gremlinvillage_zonef.GV_ZoneE_Wheel01_Inert 01", "ForceInvulnerable", false)
end
GV_HealPipes01 = L0_0
function L0_0()
  if GV_GusHouseValve == 1 then
    Enable("gremlinvillage_zonef_dynamic.Thinner_Spray_Spawner")
    FireUser1("gremlinvillage_zonef_audio.Sound_ThinnerGusher")
  end
  GV_PipesHealed = 0
  GV_GusHouseValve = 0
  GV_ZoneF_PipeHint = 2
  SetGlobal("GV_ZoneF_GusHelped", 0)
  Enable("ThinnerDamage_GusHouse")
  Enable("gremlinvillage_zonef.Thinner_Spout")
  Enable("gremlinvillage_zonef_scripting.GusHouseDamage")
  SetRotatorMaxSpeed("gremlinvillage_zonef_dynamic.PlazaGear", 0)
  AudioPostEventOn("gremlinvillage_zonef_dynamic.PlazaGear", "Stop_sfx_GV_WOC_GearFloor")
  ForEachEntityInGroup(AnimVarInt, "GV_ZoneF_Gremlins", VAR_Mood_Type, MOOD_Negative)
end
GV_BreakPipes01 = L0_0
function L0_0()
  ForEachEntityInGroup(AnimVarInt, "GV_ZoneF_Gremlins", VAR_Mood_Type, MOOD_Positive)
end
GV_ZoneF_PositiveGremlins = L0_0
L0_0 = 0
GV_GusFreeRide = L0_0
L0_0 = 0
GV_ZoneF_GusCarpetTutor = L0_0
L0_0 = 0
GV_ZoneF_GusTeacupTutor = L0_0
L0_0 = 0
GV_ZoneF_GusAirplaneTutor = L0_0
function L0_0(A0_21, A1_22)
  if _G["GV_ZoneF_Gus" .. A1_22 .. "Tutor"] == 0 then
    FireSequence("GV_ZoneF_Gus", "GV_ZoneF_GusSaysFixFirst")
  end
end
GV_ZoneF_RideChecker = L0_0
function L0_0(A0_23, A1_24)
  if A1_24 == "Carpet" then
    if GetPropertyBool("CarpetToon1", "Is Painted") and GetPropertyBool("CarpetToon2", "Is Painted") then
      SetRotatorMaxSpeed("LargeGearNearCarpet", 22)
      Disable("Steam_CarpetGear_Spawner")
      DestroyEntity("Steam_CarpetGear")
      StartEmitters("GV_ZoneF_BigWheelSparks")
      AudioPostEventOn("LargeGearNearCarpet", "Play_sfx_GV_WOC_GearBig_Start")
    end
  elseif A1_24 == "Airplane" and GetPropertyBool("AirplaneToon1", "Is Painted") then
    ForEachEntityInGroup(SetRotatorMaxSpeed, "GearsNearAirplaneRide", 15)
    StartEmitters("GV_ZoneF_BiggerWheelSparks")
    AudioPostEventOn("gremlinvillage_zonef_audio.Sound_Marker_GearMedium 01", "Play_sfx_GV_WOC_Gear_Medium_Start")
    AudioPostEventOn("gremlinvillage_zonef_audio.Sound_Marker_GearLarge 01", "Play_sfx_GV_WOC_Gear_Large_Start")
  end
end
GV_ZoneF_MachineCheck = L0_0
function L0_0()
  FireUser1("IGC_EnableWindmillProjector")
  wait(1.5)
  Prefab_Projector_ChangeState("WindmillProjector", "Activate")
  wait(4.5)
  GV_ZoneF_SaveCheckpoint("Position_CP_Closer")
end
GV_ZoneF_EnableWindmillProjector = L0_0
function L0_0()
  SetRotatorMaxSpeed("LargeGearNearCarpet", 0)
  AudioPostEventOn("LargeGearNearCarpet", "Stop_sfx_GV_WOC_GearBig")
end
GV_ZoneF_LargeCarpetGearOff = L0_0
L0_0 = 0
GV_BigBen_Intro = L0_0
function L0_0()
  StreamInterior(nil, "stream_7_ai")
  SetMap(nil, "MAP_GV_ZONEF", "GAME")
  FireUser1("gremlinvillage_zonef_audio.Trigger_Portal_FromClockCleaners")
  Disable("gremlinvillage_zonef_audio.Trigger_Portal_Respawn")
  if GV_BigBen_Intro == 0 then
    GV_BigBen_Intro = 1
    FireUser1("IGC_BigBenIntro")
    SetDrawSilhouettes(false)
    wait(1.5)
    AnimGBSequence("gremlinvillage_zonef.BigBen_Face_Center", "Open")
    AudioPostEventOn("gremlinvillage_zonef_audio.Sound_ClockFace_A", "Play_sfx_GV_WOC_Clocktower_Face_Open")
    wait(1.5)
    AnimGBSequence("gremlinvillage_zonef.BigBen_Face_Left", "Open")
    AudioPostEventOn("gremlinvillage_zonef_audio.Sound_ClockFace_B", "Play_sfx_GV_WOG_ClockPlatform_Down_2")
    GetPrefabData("GV_ZoneF_BigBenExitMarker").ToFlyThrough = "False"
    wait(2)
    SetDrawSilhouettes(true)
  end
  if GV_ZoneF_NoIntro == false then
    GV_ZoneF_LoadCheckpoint()
  end
  if GV_PipesHealed == 1 then
    AudioPostEventOn("gremlinvillage_zonef_dynamic.PlazaGear", "Play_sfx_GV_WOC_GearFloor")
  end
  if 0 < GV_GusHouse_State then
    AudioPostEventOn("gremlinvillage_zonef_audio.Sound_MachineLoop", "Play_sfx_amb_broken_WOC")
    wait(0.5)
    AudioPostEventOn("gremlinvillage_zonef_audio.Sound_MachineLoop", "Play_sfx_amb_broken_WOC_Working")
  end
  SetGlobal("GV_ZoneF_Atop_BigBen", 1)
  Wait(1)
  GV_ZoneF_SaveCheckpoint("GV_ZoneF_BigBenExitMarker")
end
GV_BigBen_IntroStart = L0_0
L0_0 = false
BigBen_Platform_Lowered = L0_0
L0_0 = false
BigBen_Platform_PlayerInTrigger = L0_0
function L0_0(A0_25)
  BigBen_Platform_PlayerInTrigger = true
  SetCameraAttributes("gremlinvillage_zonef.BigBen_Platform_Exit")
  wait(1)
  if BigBen_Platform_PlayerInTrigger == true then
    Disable("gremlinvillage_zonef.BigBen_Platform_Trigger")
    AnimGBSequence(A0_25, "Lower")
  end
  wait(2.6)
  BigBen_Platform_Lowered = true
  if BigBen_Platform_PlayerInTrigger == false and BigBen_Platform_Lowered == true then
    GV_ZoneF_BigBen_Platform_Raise(A0_25, true)
  end
end
GV_ZoneF_LowerBigBen_Platform = L0_0
function L0_0(A0_26, A1_27)
  BigBen_Platform_PlayerInTrigger = false
  if A1_27 == nil then
    ClearAllCameraAttributes()
  end
  if BigBen_Platform_Lowered == true then
    BigBen_Platform_Lowered = false
    AnimGBSequence(A0_26, "Up")
    Enable("gremlinvillage_zonef.BigBen_Platform_Trigger")
  end
end
GV_ZoneF_BigBen_Platform_Raise = L0_0
function L0_0(A0_28, A1_29)
  if A1_29 == "In" then
    GV_ZoneF_BigBen_Platform_Raise(A0_28, true)
  elseif A1_29 == "Out" then
    BigBen_Platform_PlayerInTrigger = true
  end
end
GV_ZoneF_BigBen_PlayerCubbyCheck = L0_0
function L0_0(A0_30, A1_31)
  ForEachEntityInGroup(SetRotatorMaxSpeed, "BigBen_Gears", 30)
  Prefab_Projector_ChangeState("EnterBigBenProjector", "Deactivate")
  if A1_31 == "Paint" then
    SetGlobal("GV_ZoneF_BigBenComp", 1)
  else
    SetGlobal("GV_ZoneF_BigBenComp", 2)
  end
  FireUser1("GV_ZoneF_ExitShot")
  wait(1.5)
  DisableGuardianHint("PlayerHint_BigBen")
  FireSequence("GV_ZoneF_Gus", "GV_ZoneF_GusExitOpened")
  if A1_31 == "Paint" then
    AnimGBSequence("gremlinvillage_zonef.GV_ZoneF_Door01", "Open")
    AudioPostEventOn(GetPlayer(), "Play_sfx_GV_WOC_Door_Open")
  else
    AnimGBSequence("gremlinvillage_zonef.GV_ZoneF_Door01", "Broken")
  end
  wait(6)
  FireUser1("BigBenDoorCamera")
  wait(1)
  AnimGBSequence("gremlinvillage_zonef_dynamic.BigBen_Platform", "Unfold")
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_WOC_Clocktower_Lift_Open")
  Enable("gremlinvillage_zonef.BigBen_Platform_Trigger")
  if A1_31 == "Paint" then
    wait(1.5)
    AnimGBSequence("gremlinvillage_zonef.BigBen_Face_Right", "Open")
    AudioPostEventOn(GetPlayer(), "Play_sfx_GV_WOG_ClockPlatform_Down_2")
    Enable("gremlinvillage_zonef.BigBen_Platform_Trigger")
    wait(1)
  end
  GV_ZoneF_SaveCheckpoint("Position_CP_Closer")
end
GV_PumpCompare = L0_0
function L0_0(A0_32)
  if GetGlobal("GV_ZoneF_BigBenComp") == 1 then
    ForceSequence(A0_32, "GVGK_Exit_Good")
  elseif GetGlobal("GV_ZoneF_BigBenComp") == 2 then
    ForceSequence(A0_32, "GVGK_Exit_Chatter")
  elseif GetGlobal("GV_ZoneF_BigBenComp") == 0 then
    ForceSequence(A0_32, "GVGK_Exit_Closed")
  end
end
GV_GateKeeperGrem = L0_0
L0_0 = 0
GV_PinTraderState = L0_0
function L0_0()
  if GetGlobal("GV_ZoneF_BennetShownProof_Played") == true then
    FireSequence("Gremlin_Shaky_Convo", "PinGrem_Bennet")
  elseif GV_PinTraderState == 0 then
    FireSequence("Gremlin_Shaky_Convo", "PinGrem_Greet")
  elseif GV_PinTraderState == 1 then
    FireSequence("Gremlin_Shaky_Convo", "PinGrem_Buy")
  elseif GV_PinTraderState == 2 then
    FireSequence("Gremlin_Shaky_Convo", "PinGrem_Thank")
  end
end
GV_PinTraderSpeak = L0_0
function L0_0()
  SetGlobal("GV_PeteStuff", 1)
  SetGlobal("GV_ZoneF_PeteShipLog", 1)
  RestrictCutSceneInput()
  DisableGuardianHint("PlayerHint_PeteBoat")
  wait(1.75)
  FireSequence("GV_ZoneF_Gus", "GVGus_PeteTreasure")
  UnrestrictCutSceneInput()
end
GV_FoundPeteTreasure = L0_0
function L0_0()
  if HasCollectible("Friend_of_Gremlins") then
    Mickey_Receive_Item_NPC("Shaky_Spawner", "Gray_Pin")
  else
    Mickey_Receive_Item_NPC("Shaky_Spawner", "Friend_of_Gremlins")
  end
  SetGlobal("GV_ZoneF_PeteShipLog", 0)
  SetGlobal("GV_PeteStuff", 2)
end
GV_TreasureForPin = L0_0
function L0_0()
  if HasCollectible("Friend_of_Gremlins") then
    Mickey_GetItem_ClearItem("Shaky_Spawner", "Gray_Pin")
  else
    Mickey_GetItem_ClearItem("Shaky_Spawner", "Friend_of_Gremlins")
    GiveCollectible("Friend_of_Gremlins")
    wait(4)
  end
  FireSequence("GV_ZoneF_Gus", "GV_ZoneD_PeteLogQuestEnd")
end
GV_TreasureForPin_CleanUp = L0_0
function L0_0()
  if GetGlobal("GV_ZoneB_GusPumpIntroduction_Played") == 0 then
    FireSequence("GV_ZoneF_Gus", "GV_ZoneB_GusPumpIntroduction")
  end
end
GV_ZoneF_BigBenExplain = L0_0
function L0_0()
  wait(0.25)
  FireUser3("GV_ZoneB_PaintMachineTutorCam01")
end
GV_ZoneB_MachineCam02 = L0_0
function L0_0()
  if GetGlobal("GV_TCG_GremChat01_Played") == 0 then
    Enable("Spawner_Windmill_Spatter")
  end
end
GV_ZoneF_SpawnSpatter = L0_0
function L0_0()
  Wait(0.8)
  MoveToEntity(GetPlayer(), "gremlinvillage_zonef_scripting.Marker_MickeyTalks2Bennet")
  MoveToEntity("gremlinvillage_zonef.Gremlin_Bennet", "gremlinvillage_zonef_scripting.Marker_BennetSpeech")
end
GV_ZoneF_BennetConvoMove = L0_0
function L0_0()
  ForceSequence("GV_ZoneF_Gus", "PaintReaction04")
end
GV_ZoneF_GusPraises = L0_0
function L0_0()
  AddPaladinPoints(GetPlayer(), 25)
end
GV_ZoneF_GusPraisesPart2 = L0_0
function L0_0()
  local L0_33, L1_34
  GV_ZoneF_CrusherAmbientShutoff = L0_33
  L0_33 = nil
  GV_ZoneF_LiftPainted = L0_33
  L0_33 = nil
  GV_ZoneF_OpenSteamBoatDoor = L0_33
  L0_33 = nil
  GV_ZoneF_RideChecker = L0_33
  L0_33 = nil
  GV_EnterGusHouse = L0_33
  L0_33 = nil
  GV_ZoneF_SpawnSpatter = L0_33
  L0_33 = nil
  GV_GusSpeak = L0_33
  L0_33 = nil
  GV_ZoneF_BigBenExplain = L0_33
  L0_33 = nil
  GV_HealPipes01 = L0_33
  L0_33 = nil
  GV_ZoneF_EnableWindmillProjector = L0_33
  L0_33 = nil
  GV_ZoneF_CheckpointSave_Chests = L0_33
  L0_33 = nil
  GV_ZoneF_SunstarCleanUp = L0_33
  L0_33 = nil
  GV_ZoneF_GusZoneIntro_Cleanup = L0_33
  L0_33 = nil
  GV_TreasureForPin = L0_33
  L0_33 = nil
  GV_ZoneF_IGC_StartRides = L0_33
  L0_33 = nil
  GV_ZoneF_BigBen_Platform_Raise = L0_33
  L0_33 = nil
  GV_BreakPipes01 = L0_33
  L0_33 = nil
  GV_ZoneF_MachineCheck = L0_33
  L0_33 = nil
  GV_ZoneF_Stream_SteamB = L0_33
  L0_33 = nil
  GV_ZoneF_ConceptSave = L0_33
  L0_33 = nil
  GV_GremlinHouse_Exit_Ask = L0_33
  L0_33 = nil
  GV_ZoneF_EndTracking = L0_33
  L0_33 = nil
  GV_GremlinHouse_Exit = L0_33
  L0_33 = nil
  GV_BigBen_IntroStart = L0_33
  L0_33 = nil
  GV_ZoneF_LiftThinned = L0_33
  L0_33 = nil
  GV_ZoneF_LowerBigBen_Platform = L0_33
  L0_33 = nil
  GV_ZoneF_ToonPipesCheck = L0_33
  L0_33 = nil
  GV_GremlinHouse_Enter = L0_33
  L0_33 = nil
  GV_ZoneF_ProjectorExit = L0_33
  L0_33 = nil
  GV_ZoneF_Start_Launcher = L0_33
  L0_33 = nil
  GV_ZoneF_Crusher = L0_33
  L0_33 = nil
  GV_ZoneF_BennetConvoMove = L0_33
  L0_33 = nil
  GV_ZoneF_GusHouseIntro = L0_33
  L0_33 = nil
  GV_PinTraderSpeak = L0_33
  L0_33 = nil
  GV_ZoneF_WindmillEnded = L0_33
  L0_33 = nil
  GV_GremlinRideOp = L0_33
  L0_33 = nil
  GV_ZoneF_IGC_StartRides_Cleanup = L0_33
  L0_33 = nil
  GV_ZoneF_GusZoneIntro = L0_33
  L0_33 = nil
  GV_PumpCompare = L0_33
  L0_33 = nil
  GV_ZoneF_ChooseGremlinHouseGoodie = L0_33
  L0_33 = nil
  GV_FoundPeteTreasure = L0_33
  L0_33 = nil
  GV_ZoneF_SaveCheckpoint = L0_33
  L0_33 = nil
  GV_GusHouse_Painted = L0_33
  L0_33 = nil
  GV_ZoneF_LoadCheckpoint = L0_33
  L0_33 = nil
  GV_ZoneF_Streaming = L0_33
  L0_33 = nil
  GV_EnterGremlinHouse = L0_33
  L0_33 = nil
  GV_ZoneF_PositiveGremlins = L0_33
  L0_33 = nil
  GV_ZoneF_SunStarTeleportHome = L0_33
  L0_33 = nil
  GV_ZoneF_MiscSetup = L0_33
  L0_33 = nil
  GV_SteamB_LoadZoneI = L0_33
  L0_33 = nil
  GV_ZoneF_ThinnerWarning = L0_33
  L0_33 = nil
  GV_ZoneF_LargeCarpetGearOff = L0_33
  L0_33 = nil
  GV_GusHouse_Thinned = L0_33
  L0_33 = nil
  GV_GateKeeperGrem = L0_33
  L0_33 = nil
  Cleanup_GV_ZoneFx = L0_33
end
Cleanup_GV_ZoneFx = L0_0
