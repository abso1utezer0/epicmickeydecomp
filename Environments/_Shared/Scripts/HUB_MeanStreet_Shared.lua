local L0_0, L1_1

function MS_Setup_Launcher(var1)
  GetPrefabData(var1).MapLoad_SetupPosition = "True"
  OnMapLoad_ProjectorSetup(var1)
end

function MS_CheckpointSave()
  local L0_3, L1_4
  L0_3 = "MSV1_AlwaysSetup"
  L1_4 = "ToonTownStartMarker"
  if GetGlobal("MS_MeanStreetProgress") == 2 then
    L0_3 = "MSV2_AlwaysSetup"
  elseif GetGlobal("MS_MeanStreetProgress") == 3 then
    L0_3 = "MSV3_AlwaysSetup"
  elseif GetGlobal("MS_MeanStreetProgress") == 4 then
    L0_3 = "MSV4_AlwaysSetup"
  elseif GetGlobal("MS_MeanStreetProgress") == 5 then
    L0_3 = "MSV5_AlwaysSetup"
  elseif GetGlobal("MS_MeanStreetProgress") == 6 then
    L0_3 = "MSV6_AlwaysSetup"
  end
  if GetGlobal("HUB_startposition") == 0 then
    L1_4 = "hub_meanstreet.TrainStationSpawnLocation"
  elseif GetGlobal("HUB_startposition") == 2 then
    L1_4 = "MSNewOrleansStart"
  elseif GetGlobal("HUB_startposition") == 3 then
    L1_4 = "MSTomorrowCityMarker"
  elseif GetGlobal("HUB_startposition") == 4 then
    L1_4 = "MSVenturelandMarker"
  end
  SaveCheckpoint(GetPlayer(), L0_3, L1_4)
  Print("Mean Street checkpoint saved with parameters:" .. L0_3 .. " , " .. L1_4)
end

function L0_0()
  Print("Picking Projector Exit, Position: " .. GetGlobal("HUB_startposition"))
  if GetGlobal("HUB_startposition") == 1 then
    MS_Setup_Launcher("ToonTownStartMarker")
  elseif GetGlobal("HUB_startposition") == 2 then
    MS_Setup_Launcher("MSNewOrleansStart")
  elseif GetGlobal("HUB_startposition") == 3 then
    MS_Setup_Launcher("MSTomorrowCityMarker")
  elseif GetGlobal("HUB_startposition") == 4 then
    MS_Setup_Launcher("MSVenturelandMarker")
  end
end
MS_PickProjectorExit = L0_0
function L0_0()
  Print("Mean Street Persist")
  StartTrackingCurrentLevelForScoring("MS_PlaystyleToon")
  SetGlobal("MS_InTrainDoor1", 0)
  if GetGlobal("MS_toontownopen") == 1 then
  else
    Prefab_Projector_ChangeState("ToonTownStartMarker", "Deactivate")
  end
  if GetGlobal("MS_neworleansopen") == 1 then
  else
    Prefab_Projector_ChangeState("MSNewOrleansStart", "Deactivate")
  end
  if GetGlobal("MS_tomorrowlandopen") == 1 and GetGlobal("MS_MeanStreetProgress") == 2 or GetGlobal("MS_MeanStreetProgress") == 6 then
  else
    Prefab_Projector_ChangeState("MSTomorrowCityMarker", "Deactivate")
  end
  if GetGlobal("MS_adventurelandopen") == 1 then
  else
    Prefab_Projector_ChangeState("MSVenturelandMarker", "Deactivate")
  end
  if GetGlobal("VL_Scrapbook") == 1 then
    ForEachEntityInGroup(DestroyEntity, "hub_meanstreet.AlbumDaisy")
  end
  if GetGlobal("MS_TrainDoor1Open") == 1 then
    MS_traindooropen("hub_meanstreet_dynamic.MSUSA_GATES02")
  end
  if GetGlobal("VL_MSRiddleStarted") == 0 then
    ForEachEntityInGroup(DestroyEntity, "hub_meanstreet.RiddleCandle")
  end
  if GetGlobal("MS_MeanStreetProgress") == 3 then
    if GetGlobal("TT_Flower1") == 1 or GetGlobal("TT_ClaraGatherFlowers_Played") == 0 then
      ForEachEntityInGroup(DestroyEntity, "MS_TTFlower1")
    end
    if GetGlobal("TT_Flower2") == 1 or GetGlobal("TT_ClaraGatherFlowers_Played") == 0 then
      ForEachEntityInGroup(DestroyEntity, "MS_TTFlower2")
    end
    if GetGlobal("TT_Flower3") == 1 or GetGlobal("TT_ClaraGatherFlowers_Played") == 0 then
      ForEachEntityInGroup(DestroyEntity, "MS_TTFlower3")
    end
  end
  if GetGlobal("HUB_startposition") == 3 then
    TeleportToEntity(GetPlayer(), "StartMickeyTCPortal")
  end
  if GetGlobal("HUB_startposition") == 4 then
    TeleportToEntity(GetPlayer(), "StartMickeyVLPortal")
  end
  SetGlobal("MS_V2BunnyCounterDisplay", 3 - GetGlobal("MS_V2_BunniesCaptured"), true)
  SetGlobal("MS_V3BunnyCounterDisplay", 5 - GetGlobal("MS_V3_BunniesCaptured"), true)
  SetGlobal("MS_V4BunnyCounterDisplay", 6 - GetGlobal("MS_V4_BunniesCaptured"), true)
  SetGlobal("MS_V5BunnyCounterDisplay", 8 - GetGlobal("MS_V5_BunniesCaptured"), true)
  if GetGlobal("HUB_startposition") == 0 then
    ForEachEntityInGroup(ClearAppCulled, "cull_b_front")
    ForEachEntityInGroup(SetAppCulled, "cull_a_back")
  else
    ForEachEntityInGroup(ClearAppCulled, "cull_a_back")
    ForEachEntityInGroup(SetAppCulled, "cull_b_front")
  end
  MS_PickCharacterInterior()
  wait(0.1)
  WaitForLevelLoad()
end
MS_MeanStreetPersist = L0_0
function L0_0()
  if GetGlobal("HUB_Startposition") == 1 then
    Prefab_Projector_SetOnlySideCamera("ToonTownStartMarker")
  elseif GetGlobal("HUB_Startposition") == 2 then
    Prefab_Projector_SetOnlySideCamera("MSNewOrleansStart")
  elseif GetGlobal("HUB_Startposition") == 3 then
    Prefab_Projector_SetOnlySideCamera("MSTomorrowCityMarker")
  elseif GetGlobal("HUB_Startposition") == 4 then
    Prefab_Projector_SetOnlySideCamera("MSVenturelandMarker")
  end
end
MS_SetProjectorCam = L0_0
function L0_0()
  Print("*****************Setting projector images")
  if GetGlobal("MS_toontownopen") == 1 then
  else
    Prefab_Projector_ChangeState("ToonTownStartMarker", "Deactivate")
  end
  if GetGlobal("MS_neworleansopen") == 1 then
  else
    Prefab_Projector_ChangeState("MSNewOrleansStart", "Deactivate")
  end
  if GetGlobal("MS_tomorrowlandopen") == 1 and GetGlobal("MS_MeanStreetProgress") == 2 or GetGlobal("MS_MeanStreetProgress") == 6 then
  else
    Prefab_Projector_ChangeState("MSTomorrowCityMarker", "Deactivate")
  end
  if GetGlobal("MS_adventurelandopen") == 1 then
  else
    Prefab_Projector_ChangeState("MSVenturelandMarker", "Deactivate")
  end
end
SetProjectorImages = L0_0
function L0_0()
  if GetGlobal("MS_wallet1") == 0 then
    SetGlobal("MS_wallet1", 1)
    IncreaseMaxTicket_L1()
  else
    SetGlobal("MS_wallet2", 1)
    IncreaseMaxTicket_L2()
  end
end
MS_PickWalletUpgrade = L0_0
function L0_0()
  local L0_5, L1_6, L2_7, L3_8
  L0_5(L1_6)
  if L0_5 == 3 then
    if L0_5 < 3 then
      L0_5(L1_6, L2_7)
    end
  elseif L0_5 == 6 then
    if L0_5 == 1 then
      L0_5()
    end
  else
    for L3_8 = 1, 5 do
      if GetGlobal("MS_MeanStreetProgress") == L3_8 then
        StreamInterior(nil, "v" .. L3_8 .. "_defaultinterior")
      end
    end
  end
  L0_5()
end
MS_PickCharacterInterior = L0_0
function L0_0()
  SetDefaultCameraValues(4.25, 10, -5)
end
MS_SetDefaultCameraValues = L0_0
function L0_0()
  Print("Setting up the pause screen map")
  SetMap(nil, "MAP_MSUSA_MINIHUB", "HUB")
end
MS_SetupMap = L0_0
function L0_0()
  SetGlobal("HUB_startposition", 0)
end
MS_NoneProjectorSpawn = L0_0
function L0_0()
  Print("Setting spawn location variable to Os Town projector")
  SetGlobal("HUB_startposition", 1)
end
MS_OsTownProjectorSpawn = L0_0
function L0_0()
  Print("Setting spawn location variable to Bog Easy projector")
  SetGlobal("HUB_startposition", 2)
end
MS_BogEasyProjectorSpawn = L0_0
function L0_0()
  Print("Setting spawn location variable to Tomorrow City projector")
  SetGlobal("HUB_startposition", 3)
end
MS_TomorrowCityProjectorSpawn = L0_0
function L0_0()
  Print("Setting spawn location variable to Ventureland projector")
  SetGlobal("HUB_startposition", 4)
end
MS_VenturelandProjectorSpawn = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "BasicAbilityPickup")
end
DestroyAbilityPickups = L0_0
function L0_0(A0_9)
  AnimGBSequence(A0_9, "Open")
end
MS_OpenDoor = L0_0
function L0_0(A0_10)
  AnimGBSequence(A0_10, "Close")
end
MS_CloseDoor = L0_0
function L0_0()
  Print("Picking Setup Script")
  if GetGlobal("MS_MeanStreetProgress") == 1 then
    Projector_SetupV1()
  elseif GetGlobal("MS_MeanStreetProgress") == 2 then
    Projector_SetupV2()
  elseif GetGlobal("MS_MeanStreetProgress") == 3 then
    Projector_SetupV3()
  elseif GetGlobal("MS_MeanStreetProgress") == 4 then
    Projector_SetupV4()
  elseif GetGlobal("MS_MeanStreetProgress") == 5 then
    Projector_SetupV5()
  elseif GetGlobal("MS_MeanStreetProgress") == 6 then
    Projector_SetupV6()
  end
end
MS_PickSetupScript = L0_0
function L0_0()
  wait(0.3)
end
SetCameraMS = L0_0
function L0_0()
  ForEachEntityInGroup(AnimGBSequence, "ShopFadeBackground", "On")
end
StartShopFade = L0_0
function L0_0()
  ForEachEntityInGroup(AnimGBSequence, "ShopFadeBackground", "Off")
end
EndShopFade = L0_0
function L0_0()
  GrabCamera("hub_meanstreet_camera.CameraControlPoint 01", GetPlayer(), CAMERA_LERP_TRANSITION, 1)
end
MS_projectorcam = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1)
end
MS_projectorcamend = L0_0
function L0_0()
  local L0_11, L1_12
end
MS_Swashbuckler = L0_0
function L0_0()
  if GetGlobal("MS_toontownopen") == 1 then
    FireSequence("hub_meanstreet.GusMeanStreet", "MSS_gustoontown")
  else
    FireSequence("hub_meanstreet.GusMeanStreet", "MSS_gusportalblocked")
  end
end
MS_loadtoontown = L0_0
function L0_0()
  local L0_13, L1_14
end
MS_GenericLockedDoor = L0_0
function L0_0()
  FireSequence("hub_meanstreet.GusMeanStreet", "MSS_AlbumGet")
end
MS_PickupAlbum = L0_0
function L0_0()
  FireSequence("hub_meanstreet.GusMeanStreet", "MSS_RiddleItemGet")
end
MS_PickupRiddle = L0_0
function L0_0()
  local L0_15
  L0_15 = 0
  if GetGlobal("MS_petetronicresolution") == 1 then
    L0_15 = L0_15 + 1
  end
  if GetGlobal("GV_PeteStuff") == 1 then
    L0_15 = L0_15 + 1
  end
  if GetGlobal("MS_petepanresolution") == 1 then
    L0_15 = L0_15 + 1
  end
  SetGlobal("MS_PeteQuestsComplete", L0_15)
end
MS_EvaluatePeteQuests = L0_0
function L0_0(A0_16)
  AnimVarInt(A0_16, VAR_NPC_State, 0)
  SetPropertyFloat(A0_16, "Wander Radius", 20, 0)
end
MS_PedStopAlt = L0_0
function L0_0(A0_17)
  AnimGBSequence(A0_17, "Open")
end
MS_traindooropen = L0_0
L0_0 = 0
insidetraindoor = L0_0
function L0_0(A0_18)
  if A0_18 == "hub_meanstreet_dynamic.MSUSA_GATES01" then
    if insidetraindoor == 0 then
      AnimGBSequence(A0_18, "Close")
    end
  else
    AnimGBSequence(A0_18, "Close")
  end
end
MS_traindoorclose = L0_0
function L0_0()
  Print("Inside train station door")
  insidetraindoor = 1
  AnimGBSequence("hub_meanstreet_dynamic.MSUSA_GATES01", "Open")
end
MS_InsideLeftTrainDoor = L0_0
function L0_0()
  Print("********************Attempting to close train door, is Mickey inside?: " .. GetGlobal("MS_InTrainDoor1"))
  if GetGlobal("MS_InTrainDoor1") == 0 then
    ForceSketched("hub_meanstreet_dynamic.ClockFace")
  end
end
MS_TrainDoor1TimerHigh = L0_0
function L0_0(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25
  L1_20 = Print
  L1_20(L2_21)
  L1_20 = GetElementCount
  L1_20 = L1_20(L2_21, L3_22)
  for L5_24 = 0, L1_20 do
    L6_25 = GetChildEntityByIndex
    L6_25 = L6_25(A0_19, L5_24)
    if IsCharacter(L6_25) then
      ClearParent(L6_25)
    end
  end
end
DetachBunnies = L0_0
function L0_0()
  local L0_26
  L0_26 = Print
  L0_26("********************Checking to see if bunnies should spawn")
  L0_26 = GetGlobal
  L0_26 = L0_26("MS_MeanStreetProgress")
  if L0_26 == 2 then
    L0_26 = GetGlobal
    L0_26 = L0_26("MSS_V2_BunnyRoundup_Played")
    if L0_26 == 1 then
      L0_26 = GetGlobal
      L0_26 = L0_26("MS_V2BunnyClear")
      if L0_26 == 0 then
        L0_26 = 5
        L0_26 = L0_26 - GetGlobal("MS_V2_BunniesCaptured")
        wait(0.1)
        ForceSpawn("BunniesSpawner", L0_26)
        Print("****************Spawned " .. L0_26 .. " bunnies")
      end
    end
  end
  L0_26 = GetGlobal
  L0_26 = L0_26("MS_MeanStreetProgress")
  if L0_26 == 3 then
    L0_26 = GetGlobal
    L0_26 = L0_26("MSS_V3_BunnyRoundup_Played")
    if L0_26 == 1 then
      L0_26 = GetGlobal
      L0_26 = L0_26("MS_V3BunnyClear")
      if L0_26 == 0 then
        L0_26 = 6
        L0_26 = L0_26 - GetGlobal("MS_V3_BunniesCaptured")
        wait(0.1)
        ForceSpawn("BunniesSpawner", L0_26)
        Print("****************Spawned " .. L0_26 .. " bunnies")
      end
    end
  end
  L0_26 = GetGlobal
  L0_26 = L0_26("MS_MeanStreetProgress")
  if L0_26 == 4 then
    L0_26 = GetGlobal
    L0_26 = L0_26("MSS_V4_BunnyRoundup_Played")
    if L0_26 == 1 then
      L0_26 = GetGlobal
      L0_26 = L0_26("MS_V4BunnyClear")
      if L0_26 == 0 then
        L0_26 = 6
        L0_26 = L0_26 - GetGlobal("MS_V4_BunniesCaptured")
        wait(0.1)
        ForceSpawn("BunniesSpawner", L0_26)
        Print("****************Spawned " .. L0_26 .. " bunnies")
      end
    end
  end
  L0_26 = GetGlobal
  L0_26 = L0_26("MS_MeanStreetProgress")
  if L0_26 == 5 then
    L0_26 = GetGlobal
    L0_26 = L0_26("MSS_V5_BunnyRoundup_Played")
    if L0_26 == 1 then
      L0_26 = GetGlobal
      L0_26 = L0_26("MS_V5BunnyClear")
      if L0_26 == 0 then
        L0_26 = 9
        L0_26 = L0_26 - GetGlobal("MS_V5_BunniesCaptured")
        wait(0.1)
        ForceSpawn("BunniesSpawner", L0_26)
        Print("****************Spawned " .. L0_26 .. " bunnies")
      end
    end
  end
end
MS_SpawnBunnies = L0_0
function L0_0(A0_27, A1_28)
  IncrementGlobal("MS_BunniesCaptured")
  if GetGlobal("MS_MeanStreetProgress") == 2 then
    SetGlobal("MS_V2_BunniesCaptured", GetGlobal("MS_V2_BunniesCaptured") + 1)
    if GetGlobal("MS_V2_BunniesCaptured") < 4 then
      SetGlobal("MS_V2BunnyCounterDisplay", GetGlobal("MS_V2BunnyCounterDisplay") - 1)
    end
  elseif GetGlobal("MS_MeanStreetProgress") == 3 then
    SetGlobal("MS_V3_BunniesCaptured", GetGlobal("MS_V3_BunniesCaptured") + 1)
    if GetGlobal("MS_V3_BunniesCaptured") < 6 then
      SetGlobal("MS_V3BunnyCounterDisplay", GetGlobal("MS_V3BunnyCounterDisplay") - 1)
    end
  elseif GetGlobal("MS_MeanStreetProgress") == 4 and GetGlobal("MS_V4_AllBunniesCaptured") == 0 then
    SetGlobal("MS_V4_BunniesCaptured", GetGlobal("MS_V4_BunniesCaptured") + 1)
    if GetGlobal("MSS_V4_BunnyRoundup_Played") == 1 then
      if GetGlobal("MS_V4_BunniesCaptured") < 7 then
        SetGlobal("MS_V4BunnyCounterDisplay", GetGlobal("MS_V4BunnyCounterDisplay") - 1)
      end
    else
      SetGlobal("MS_V4BunnyCounterDisplay", GetGlobal("MS_V4BunnyCounterDisplay") - 1, true)
    end
  elseif GetGlobal("MS_MeanStreetProgress") == 5 then
    SetGlobal("MS_V5_BunniesCaptured", GetGlobal("MS_V5_BunniesCaptured") + 1)
    if GetGlobal("MS_V5_BunniesCaptured") < 9 then
      SetGlobal("MS_V5BunnyCounterDisplay", GetGlobal("MS_V5BunnyCounterDisplay") - 1)
    end
  end
  if GetGlobal("MS_MeanStreetProgress") == 2 and GetGlobal("MS_V2_BunniesCaptured") == 3 then
    SetGlobal("MS_BunniesBeingCarried", 0)
    FireThread(MS_BunniesLeaveSuction)
    FireSequence("hub_meanstreet.GusMeanStreet", "MSS_Gus_AllTheBunnies")
  elseif GetGlobal("MS_MeanStreetProgress") == 3 and GetGlobal("MS_V3_BunniesCaptured") == 5 then
    SetGlobal("MS_BunniesBeingCarried", 0)
    FireThread(MS_BunniesLeaveSuction)
    FireSequence("hub_meanstreet.GusMeanStreet", "MSS_Gus_AllTheBunnies")
  elseif GetGlobal("MS_MeanStreetProgress") == 4 and GetGlobal("MS_V4_BunniesCaptured") == 6 and GetGlobal("MS_V4_AllBunniesCaptured") == 0 then
    SetGlobal("MS_V4_AllBunniesCaptured", 1)
    ForEachEntityInGroup(DestroyEntity, "BunnyBarrel")
    SetGlobal("MS_BunniesBeingCarried", 0)
    FireThread(MS_BunniesLeaveSuction)
    FireSequence("hub_meanstreet.GusMeanStreet", "MSS_Gus_AllTheBunnies")
  elseif GetGlobal("MS_MeanStreetProgress") == 5 and GetGlobal("MS_V5_BunniesCaptured") == 8 then
    SetGlobal("MS_BunniesBeingCarried", 0)
    FireThread(MS_BunniesLeaveSuction)
    FireSequence("hub_meanstreet.GusMeanStreet", "MSS_Gus_AllTheBunnies")
  end
end
MS_AddBunnies = L0_0
function L0_0()
  ForceSpawn("BunnyBurstDeathFXSpawner", 1)
end
BunnyBurstPipeFXSpawn = L0_0
function L0_0(A0_29)
  (vector4(-18.59, -2, 15.74) - GetPosition(A0_29)).y = 0
  ;(vector4(-18.59, -2, 15.74) - GetPosition(A0_29)):normalize3()
  SetExternalVelocity(A0_29, (vector4(-18.59, -2, 15.74) - GetPosition(A0_29)) * 7, 0.9)
end
MS_BunnyVacuum = L0_0
function L0_0(A0_30)
  SetExternalVelocity(A0_30, vector4(-2, 0, 2), 0.9)
end
MS_BunnyVacuumLeft = L0_0
function L0_0(A0_31)
  SetExternalVelocity(A0_31, vector4(-2, 0, -2), 0.9)
end
MS_BunnyVacuumRight = L0_0
function L0_0(A0_32)
  if GetGlobal("MS_MeanStreetProgress") == 4 then
    FireUser3(A0_32)
  end
  DestroyEntity(A0_32)
  MS_AddBunnies()
  MS_BunniesLeaveSuction()
end
MS_BunnyVacuumPipe = L0_0
function L0_0(A0_33)
  Print("Set bunny goto, enable FX")
  GoToEntity(A0_33, "hub_meanstreet.BunnyGoto")
  SetGlobal("MS_BunniesBeingCarried", GetGlobal("MS_BunniesBeingCarried") + 1)
  Enable("hub_meanstreet.VacuumFXSpawner")
  Print("Bunnies being carried = " .. GetGlobal("MS_BunniesBeingCarried"))
end
MS_BunniesInSuction = L0_0
function L0_0()
  SetPropertyFloat(GetPlayer(), "ETicket", GetPropertyFloat(GetPlayer(), "ETicket") + GetGlobal("MS_BunniesCaptured") * 5)
  SetGlobal("MS_BunniesCaptured", 0)
end
MS_TicketsForBunnies = L0_0
function L0_0()
  Print("Bunny Leaves Trigger")
  SetGlobal("MS_BunniesBeingCarried", GetGlobal("MS_BunniesBeingCarried") - 1)
  if GetGlobal("MS_BunniesBeingCarried") < 1 then
    SetGlobal("MS_BunniesBeingCarried", 0)
    Disable("hub_meanstreet.VacuumFXSpawner")
    ForEachEntityInGroup(DestroyEntity, "PipeVacuumFX")
    AudioPostEventOn("hub_meanstreet.Sound_BunnyVacWind", "Play_sfx_MS_BunnyVac_Stop")
  end
end
MS_BunniesLeaveSuction = L0_0
L0_0 = 0
trainhint = L0_0
function L0_0()
  if GetGlobal("MS_MeanStreetProgress") < 6 and GetGlobal("VL_MSRiddleStarted") == 1 and GetGlobal("MS_RiddleItemGet") == 0 and trainhint == 0 then
    trainhint = 1
    FireUser1("MS_TrainDoorHintCam")
    wait(2)
    MS_traindooropen("hub_meanstreet_dynamic.MSUSA_GATES01")
  else
    MS_traindooropen("hub_meanstreet_dynamic.MSUSA_GATES01")
  end
end
MS_ClockTowerTime = L0_0
function L0_0()
  MS_traindoorclose("hub_meanstreet_dynamic.MSUSA_GATES01")
end
CloseTrainDoor01 = L0_0
function L0_0()
  local L0_34, L1_35
end
InTrainTunnel = L0_0
function L0_0()
  Enable("hub_meanstreet.ClockTowerWatchSpawner")
end
MS_StartClockTowerWatch = L0_0
function L0_0()
  Unhide("hub_meanstreet_v3.Lightning_arc 01")
  Disable("hub_meanstreet.ClockTowerWatchSpawner")
  TimerDisable("hub_meanstreet.ClockTowerTimer")
  TimerReset("hub_meanstreet.ClockTowerTimer")
  wait(0.1)
  DestroyEntity("hub_meanstreet.ClockTowerWatch")
end
MS_StopClockTowerWatch = L0_0
function L0_0()
  ForceSequence("hub_meanstreet_v3.MechanicGremlinV3", "MSS_FindWatchComplete")
end
MS3_StopPowerFlow = L0_0
function L0_0()
  local L0_36
  L0_36 = GetGlobal
  L0_36 = L0_36("PowerSparks")
  ShowDropdownCounter("HUDElements/Icons/ui_icon_quest_energy_ball_tex.nif", L0_36)
end
ShowPowerSparkCounter = L0_0
function L0_0()
  HideDropdownCounter()
end
HidePowerSparkCounter = L0_0
function L0_0()
  SetGlobal("2dDirection", 1)
  wait(0.1)
  LoadLevel(GetPlayer(), "Levels/2D_MickeySteamroller01.level")
end
MS_entertoontown = L0_0
function L0_0()
  if GetGlobal("MS_tomorrowlandopen") == 1 then
    FireSequence("hub_meanstreet.GusMeanStreet", "MSS_gustomorrowland")
  else
    FireSequence("hub_meanstreet.GusMeanStreet", "MSS_gusportalblocked")
  end
end
MS_loadtomorrowland = L0_0
function L0_0()
  SetGlobal("2dDirection", 1)
  UnrestrictCutSceneInput()
  wait(0.1)
  LoadLevel(GetPlayer(), "Levels/2D_Plutopia01.level")
end
MS_entertomorrowland = L0_0
function L0_0()
  if GetGlobal("MS_adventurelandopen") == 1 then
    FireSequence("hub_meanstreet.GusMeanStreet", "MSS_gusadventureland")
  else
    FireSequence("hub_meanstreet.GusMeanStreet", "MSS_gusportalblocked")
  end
end
MS_loadadventureland = L0_0
function L0_0()
  SetGlobal("2dDirection", 1)
  UnrestrictCutSceneInput()
  wait(0.1)
  LoadLevel(GetPlayer(), "Levels/MSUSA_ZoneM.level")
end
MS_enteradventureland = L0_0
function L0_0()
  if GetGlobal("MS_neworleansopen") == 1 then
    FireSequence("hub_meanstreet.GusMeanStreet", "MSS_gusneworleans")
  elseif GetGlobal("MS_neworleansopen") == 0 then
    FireSequence("hub_meanstreet.GusMeanStreet", "MSS_gusportalblocked")
  end
end
MS_loadneworleans = L0_0
function L0_0()
  SetGlobal("2dDirection", 1)
  UnrestrictCutSceneInput()
  wait(0.1)
  LoadLevel(GetPlayer(), "Levels/2D_LonesomeGhost01.level")
end
MS_enterneworleans = L0_0
function L0_0()
  SaveCheckpoint()
  if GetGlobal("RFS_ReplayFilmStrip") == 1 then
    SetGlobal("RFS_ReplayFilmStrip", 0)
    LoadLevel(GetPlayer(), "Filmreel_Fantasia01.level")
  end
  if GetGlobal("RFS_ReplayFilmStrip") == 2 then
    SetGlobal("RFS_ReplayFilmStrip", 0)
    LoadLevel(GetPlayer(), "Filmreel_Fantasia02.level")
  end
  if GetGlobal("RFS_ReplayFilmStrip") == 3 then
    SetGlobal("RFS_ReplayFilmStrip", 0)
    LoadLevel(GetPlayer(), "Filmreel_Fantasia03.level")
  end
  if GetGlobal("RFS_ReplayFilmStrip") == 4 then
    SetGlobal("RFS_ReplayFilmStrip", 0)
    LoadLevel(GetPlayer(), "Filmreel_Fantasia04.level")
  end
  if GetGlobal("RFS_ReplayFilmStrip") == 5 then
    SetGlobal("RFS_ReplayFilmStrip", 0)
    LoadLevel(GetPlayer(), "Filmreel_SteamboatWillie02.level")
  end
  if GetGlobal("RFS_ReplayFilmStrip") == 6 then
    SetGlobal("RFS_ReplayFilmStrip", 0)
    LoadLevel(GetPlayer(), "Filmreel_SteamboatWillie03.level")
  end
end
ReplayFilmStripCheck = L0_0
function L0_0(A0_37, A1_38)
  StreamInterior(nil, A1_38)
end
MS_StreamBuilding = L0_0
function L0_0(A0_39)
  Print("Enter Mean Street Building")
  AudioPostEventOn(GetPlayer(), "Play_sfx_Hub_Door_Trans_enter")
  RestrictCutSceneInput()
  StartFadeOut(1.2)
  AudioPostEventOn(GetPlayer(), "Set_Volume_Enter_Interior")
  Enable2DSetup()
  wait(1.2)
  WaitForLevelLoad()
  wait(0.01)
  if A0_39 == nil then
  elseif A0_39 == "TownHall" then
    MS_SadCagedBunnies()
    wait(0.1)
    MS_ForceSadBunny()
  end
  SetConfigVariableString(GetPlayer(), "CameraFieldOfView", 0)
  wait(1)
  ForEachEntityInGroup(DestroyEntity, "BUNNYCHILD")
  Print("Start Fade In")
  StartFadeInNoHUD()
  wait(0.5)
  UnrestrictCutSceneInput()
end
MS_EnterBuildings = L0_0
function L0_0(A0_40, A1_41)
  local L2_42, L3_43, L4_44, L5_45
  L2_42()
  L2_42(L3_43, L4_44)
  L2_42(L3_43)
  L2_42()
  L2_42(L3_43, L4_44)
  L2_42(L3_43)
  L2_42(L3_43)
  L2_42(L3_43)
  if L2_42 == 3 then
    if L2_42 < 3 then
      L2_42(L3_43, L4_44)
    end
  else
    for L5_45 = 1, 6 do
      if GetGlobal("MS_MeanStreetProgress") == L5_45 then
        StreamInterior(nil, "v" .. L5_45 .. "_defaultinterior")
      end
    end
  end
  L2_42()
  L2_42(L3_43)
  L2_42()
  L2_42(L3_43)
  L2_42()
  if A1_41 == nil then
  elseif A1_41 == "detective" then
    if L2_42 == 1 then
      if L2_42 == 0 then
        L2_42(L3_43)
      end
    end
  end
  if L2_42 == 3 then
    L2_42()
  end
  if L2_42 == 3 then
    if L2_42 == 1 then
    end
  end
  if L2_42 == 1 then
    L2_42()
  end
  L2_42(L3_43)
  L2_42(L3_43)
  L2_42(L3_43)
  L2_42()
end
MS_ExitBuildings = L0_0
function L0_0()
  Print("Enter Emporium")
  StreamInterior(nil, "emporium")
  FireThread(MS_EnterBuildings)
  wait(1.3)
  AnimVarInt("hub_meanstreet_emporium.Casey", VAR_NPC_State, 0)
  Wait(0.25)
  TeleportToEntity(GetPlayer(), "hub_meanstreet_emporium.buildinginterior 01.EnterMarker")
  wait(0.01)
  EndShopFade()
  CameraReset()
  wait(0.01)
  SetCameraAttributes("SidescrollOverrideMarker")
end
MS_EnterEmporium = L0_0
function L0_0()
  FireThread(MS_ExitBuildings, "MSExitEmporiumCam")
  wait(1)
end
MS_ExitEmporium = L0_0
function L0_0()
  if GetGlobal("MS_NoStoreEntry") == 0 then
    StreamInterior(nil, "ice_cream_parlor")
    FireThread(MS_EnterBuildings)
    wait(1.3)
    Wait(0.25)
    TeleportToEntity(GetPlayer(), "hub_meanstreet_icecreamparlor.buildinginterior 01.EnterMarker")
    wait(0.01)
    EndShopFade()
    CameraReset()
    wait(0.01)
    SetCameraAttributes("SidescrollOverrideMarker")
  end
end
MS_EnterParlor = L0_0
function L0_0()
  FireThread(MS_ExitBuildings, "MSExitParlorCam")
  wait(1)
end
MS_ExitParlor = L0_0
function L0_0()
  StreamInterior(nil, "detective_agency")
  FireThread(MS_EnterBuildings)
  Wait(1.3)
  AnimVarInt("hub_meanstreet_detectiveagency.HoraceHorsecollar", VAR_NPC_State, 1)
  if GetGlobal("MS_horaceintro") == 0 and GetGlobal("MS_MeanStreetProgress") == 1 then
    TeleportToEntity(GetPlayer(), "mickeyReferenceMarker", true, false)
    wait(0.2)
    SetGlobal("MS_horaceintro", 1)
    SetCameraAttributes("DetectiveSideScroll")
    PlayAndUnlockMovie("MS_visit1_Intro_to_Horace.bik", "MS_visit1_Intro_to_Horace")
    wait(0)
    FireSequence("hub_meanstreet_detectiveagency.HoraceHorsecollar", "MSS_HoraceIntro")
  else
    TeleportToEntity(GetPlayer(), "hub_meanstreet_detectiveagency.buildinginterior 02.EnterMarker", true, false)
    wait(0)
    CameraReset()
    wait(0)
    SetCameraAttributes("SidescrollOverrideMarker")
  end
end
MS_EnterDetective = L0_0
function L0_0()
  FireThread(MS_ExitBuildings, "MS_ExitBuildingDetective", "detective")
  wait(1)
end
MS_ExitDetective = L0_0
function L0_0()
  StreamInterior(nil, "town_hall")
  FireThread(MS_EnterBuildings, "TownHall")
  wait(1.3)
  Wait(0.25)
  TeleportToEntity(GetPlayer(), "hub_meanstreet_townhall.buildinginterior 01.EnterMarker")
  wait(0.01)
  CameraReset()
  wait(0.01)
  SetCameraAttributes("SidescrollOverrideMarker")
end
MS_EnterTownHall = L0_0
function L0_0()
  FireThread(MS_ExitBuildings, "MSExitCityHallCam")
  wait(1)
end
MS_ExitTownhall = L0_0
function L0_0()
  StreamInterior(nil, "museum")
  FireThread(MS_EnterBuildings)
  wait(1.3)
  Wait(0.25)
  TeleportToEntity(GetPlayer(), "hub_meanstreet_museum.buildinginterior 01.EnterMarker")
  wait(0.01)
  CameraReset()
  wait(0.01)
  SetCameraAttributes("SidescrollOverrideMarker")
end
MS_EnterMuseum = L0_0
function L0_0()
  FireThread(MS_ExitBuildings, "MSExitMuseumCam")
  wait(1)
end
MS_ExitMuseum = L0_0
function L0_0()
  StreamInterior(nil, "walt_apartment")
  FireThread(MS_EnterBuildings)
  wait(1.3)
  Wait(0.25)
  TeleportToEntity(GetPlayer(), "hub_meanstreet_walt_apartment.buildinginterior 01.EnterMarker")
  wait(0.01)
  CameraReset()
  wait(0.01)
  SetCameraAttributes("SidescrollOverrideMarker")
end
MS_EnterApartment = L0_0
function L0_0()
  FireThread(MS_ExitBuildings, "MSExitWaltsCam")
  wait(1)
end
MS_ExitApartment = L0_0
function L0_0()
  local L0_46, L1_47, L2_48
  L0_46 = SetGlobal
  L1_47 = "percentScrapper"
  L2_48 = GetScrapperPercent
  L2_48 = L2_48(GetPlayer())
  L0_46(L1_47, L2_48, L2_48(GetPlayer()))
  L0_46 = SetGlobal
  L1_47 = "percentHero"
  L2_48 = GetHeroPercent
  L2_48 = L2_48(GetPlayer())
  L0_46(L1_47, L2_48, L2_48(GetPlayer()))
end
SetHeroandScrapper = L0_0
function L0_0(A0_49)
  local L1_50
  L1_50 = GetNormalizedNPCMood
  L1_50 = L1_50(A0_49)
  if L1_50 == 0 then
    SetGlobal("NPC_Attitude", 1)
  elseif L1_50 > 0 then
    SetGlobal("NPC_Attitude", 1)
  elseif L1_50 < 0 then
    SetGlobal("NPC_Attitude", -1)
  end
  Print("****************NPC Attitude = " .. GetGlobal("NPC_Attitude") .. " , " .. L1_50)
end
SetNPCAttitude = L0_0
function L0_0(A0_51)
  SetPropertyFloat("vendor", "UsableRadius", 0)
  StartFadeOut(0.8)
  wait(0.8)
  SetCharacterInConversation(GetPlayer(), 0)
  TeleportToEntity(GetPlayer(), "mickeyReferenceMarker", true, false)
  wait(0)
  SetCameraAttributes("SidescrollOverrideMarker")
  wait(0.4)
  UnrestrictCutSceneInput()
  SetLetterbox(0)
  StartFadeInNoHUD(0.6)
  SetPropertyFloat("vendor", "UsableRadius", 3)
end
PeteConvoRelease = L0_0
function L0_0(A0_52, A1_53)
  SetPropertyFloat("vendor", "UsableRadius", 0)
  StartFadeOut(0.8)
  wait(0.8)
  if A1_53 == nil then
  elseif A1_53 == "horace" then
    AnimVarInt("hub_meanstreet_detectiveagency.HoraceHorsecollar", VAR_NPC_State, 1)
  end
  SetCharacterInConversation(GetPlayer(), 0)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  TeleportToEntity(GetPlayer(), "mickeyReferenceMarker", true, false)
  wait(0)
  SetCameraAttributes("SidescrollOverrideMarker")
  wait(0.4)
  UnrestrictCutSceneInput()
  StartFadeInNoHUD(0.6)
  SetPropertyFloat("vendor", "UsableRadius", 3)
end
GenericConvoRelease = L0_0
function L0_0(A0_54)
  if A0_54 == 2 then
    Print("*********************************Unlock 2 rewarded!")
  end
  if A0_54 == 4 then
    Print("*********************************Unlock 4 rewarded!")
    IncrementCollectibleCount("Bronze_Pin")
    SetGlobal("MS_PinBronzeUsher", 1)
  end
  if A0_54 == 6 then
    Print("*********************************Unlock 6 rewarded!")
    SetUnlockedExtra("FILM_WhatAKnight")
  end
  if A0_54 == 8 then
    Print("*********************************Unlock 8 rewarded!")
  end
  if A0_54 == 10 then
    Print("*********************************Unlock 10 rewarded!")
    MS_PickWalletUpgrade()
  end
  if A0_54 == 12 then
    Print("*********************************Unlock 12 rewarded!")
    IncrementCollectibleCount("Silver_Pin")
    SetGlobal("MS_PinSilverUsher", 1)
  end
  if A0_54 == 14 then
    Print("*********************************Unlock 14 rewarded!")
    SetUnlockedExtra("FILM_MadDoctor")
  end
  if A0_54 == 16 then
    Print("*********************************Unlock 16 rewarded!")
    IncreaseMaxTVSketch()
    wait(0.01)
  end
  if A0_54 == 18 then
    Print("*********************************Unlock 18 rewarded!")
    IncrementCollectibleCount("Gold_Pin")
    SetGlobal("MS_PinGoldUsher", 1)
  end
  if A0_54 == 20 then
    Print("*********************************Unlock 20 rewarded!")
    IncreaseMaxWatchSketch()
    wait(0.01)
  end
  if A0_54 == 22 then
    Print("*********************************Unlock 22 rewarded!")
    IncreaseMaxAnvilSketch()
    wait(0.01)
  end
  if A0_54 == 24 then
    Print("*********************************Unlock 24 rewarded!")
    IncreaseMickeysMaxHealth()
  end
  if A0_54 == 26 then
    Print("*********************************Unlock 26 rewarded!")
  end
  if A0_54 == 28 then
    Print("*********************************Unlock 28 rewarded!")
    SetGlobal("MS_wallet1", 1)
    SetGlobal("MS_wallet2", 1)
    SetGlobal("GotWalletLarge", 1)
    IncreaseMaxTicket_L3()
  end
  if A0_54 == 30 then
    Print("*********************************Unlock 30 rewarded!")
    MegaSketchUnlock()
    wait(0.01)
    GiveCollectible("Cartoon_Buff")
  end
  MS_CheckpointSave()
end
MS_UsherReelUnlock = L0_0
function L0_0()
  local L0_55, L1_56
end
StoreSketchCounts = L0_0
function L0_0()
  local L0_57, L1_58
end
RestoreSketchCounts = L0_0
function L0_0()
  SetGlobal("PowerSparks", GetGlobal("PowerSparks") + 1)
end
MS_BuySpark = L0_0
function L0_0()
  local L0_59, L1_60, L2_61, L3_62
  L0_59 = GetGlobal
  L1_60 = "MS_V2_BunniesCaptured"
  L0_59 = L0_59(L1_60)
  L1_60 = GetGlobal
  L2_61 = "MS_V3_BunniesCaptured"
  L1_60 = L1_60(L2_61)
  L2_61 = GetGlobal
  L3_62 = "MS_V4_BunniesCaptured"
  L2_61 = L2_61(L3_62)
  L3_62 = GetGlobal
  L3_62 = L3_62("MS_V5_BunniesCaptured")
  if L0_59 > 5 then
    L0_59 = 5
  end
  if L1_60 > 5 then
    L1_60 = 5
  end
  if L2_61 > 5 then
    L2_61 = 5
  end
  if L3_62 > 5 then
    L3_62 = 5
  end
  SetPropertyInt("hub_meanstreet_townhall.Spawner_bunnyRoundup1", "Number To Spawn", L0_59, 0)
  SetPropertyInt("hub_meanstreet_townhall.Spawner_bunnyRoundup2", "Number To Spawn", L1_60, 0)
  SetPropertyInt("hub_meanstreet_townhall.Spawner_bunnyRoundup3", "Number To Spawn", L2_61, 0)
  SetPropertyInt("hub_meanstreet_townhall.Spawner_bunnyRoundup4", "Number To Spawn", L3_62, 0)
  Enable("hub_meanstreet_townhall.Spawner_bunnyRoundup1")
  Enable("hub_meanstreet_townhall.Spawner_bunnyRoundup2")
  Enable("hub_meanstreet_townhall.Spawner_bunnyRoundup3")
  Enable("hub_meanstreet_townhall.Spawner_bunnyRoundup4")
end
MS_SadCagedBunnies = L0_0
function L0_0()
  ForEachEntityInGroup(AnimVarInt, "hub_meanstreet_townhall.BunnyChild_spawned", "VAR_NPC_State", 1)
end
MS_ForceSadBunny = L0_0
function L0_0()
  SetGlobal("MS_V1_NotEnough", 1)
  ForceSequence("hub_meanstreet_v1.Jack Kelly", "TT_V2_Footprintsellstolen")
  SetGlobal("MS_V1_NotEnough", 0)
end
MS_JackKelly_NotEnough = L0_0
function L0_0()
  SetGlobal("TT_goofyparts", GetGlobal("TT_goofyparts") + 1)
end
MS_AddGoofyPart = L0_0
