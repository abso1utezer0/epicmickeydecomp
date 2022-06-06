local L0_0, L1_1
function L0_0()
  if MS_V4_SkipIntro == false then
    MS_V4_SkipIntro = true
    MS_V4_SaveInitialCheckpoint = true
    SetGlobal("MS_MeanStreetProgress", 4)
    SetGlobal("MS_visitnum", 4)
    SetGlobal("MS_toontownopen", 1)
    SetGlobal("MS_adventurelandopen", 1)
    SetGlobal("MS_adventurelandfinished", 1)
    SetGlobal("TT_ToonTownProgress", 2)
    SetGlobal("NO_NewOrleansProgress", 1)
    if GetGlobal("AL_AdventurelandProgress") == 1 then
      SetGlobal("AL_AdventurelandProgress", 2)
    end
    MS_PickProjectorExit()
  end
end
MS_V4_AlwaysSetup_Launcher = L0_0
L0_0 = false
MS_V4_SkipIntro = L0_0
L0_0 = false
MS_V4_SaveInitialCheckpoint = L0_0
function L0_0()
  MS_V4_SaveInitialCheckpoint = true
  MSV4_AlwaysSetup()
end
Projector_SetupV4 = L0_0
function L0_0()
  Print("Setting up Mean Street visit 4")
  Enable("MSAllVisitsBut6AudioTrigger")
  MS_V4_SkipIntro = true
  FireThread(GuardianPrefab_PopulateGuardians, "GuardianBogEasy")
  FireThread(MS_SetProjectorCam)
  SetGlobal("MS_MeanStreetProgress", 4)
  SetGlobal("MS_visitnum", 4)
  SetGlobal("MS_toontownopen", 1)
  SetGlobal("MS_adventurelandopen", 1)
  SetGlobal("MS_adventurelandfinished", 1)
  SetGlobal("TT_ToonTownProgress", 2)
  SetGlobal("NO_NewOrleansProgress", 1)
  MS_MeanStreetPersist()
  StartEmitters("PortalFX1")
  StartEmitters("PortalFX2")
  StartEmitters("PortalFX3")
  if GetGlobal("MS_neworleansopen") == 1 then
    StartEmitters("PortalFX4")
  end
  if GetGlobal("PowerSparks") == 0 then
    SetGlobal("PowerSparks", 10)
  end
  MS_SpawnBunnies()
  ForEachEntityInGroup(Hide, "HideandSeekActor")
  MS_SetDefaultCameraValues()
  MS_SetupMap()
  if GetGlobal("MSS_BunnyThiefIntro_Played") == 0 then
  else
    MS_Telebunnies()
  end
  if MS_V4_SaveInitialCheckpoint == true then
    MS_V4_SaveInitialCheckpoint = false
    MS_CheckpointSave()
  end
end
MSV4_AlwaysSetup = L0_0
function L0_0(A0_2, A1_3)
  if GetGlobal(A1_3) == 1 then
    DestroyEntity(A0_2)
  end
end
BunnyDestroyCheck = L0_0
function L0_0()
  Print("**********Check for bunny thief intro. CHKTHFINTRO")
  if GetGlobal("MSS_BunnyThiefIntro_Played") == 0 then
    SetGlobal("AL_V2_MSUpdate", 1)
    ForceSequence("hub_meanstreet_v4.GusConvoV4", "AL_V1_ToMSUSAZoneM")
    Print("**********Bunny thief intro. THFINTRO")
    TeleportToEntity("Bunnythief1", "ThiefInititalPosition1")
    TeleportToEntity("Bunnythief2", "ThiefInititalPosition2")
    TeleportToEntity("Bunnythief3", "ThiefInititalPosition3")
    SetPropertyEntity("hub_meanstreet_v4.MechanicGremlinV4", "Look At Entity", "Bunnythief2")
    FireSequence("hub_meanstreet_v4.MarkusProxyConversation", "MSS_BunnyThiefIntro")
  end
end
BunnyThiefIntro = L0_0
function L0_0()
  TeleportToEntity("Bunnythief1", "hub_meanstreet_v4.TelebunnyMarker1")
  FireUser2("Bunnythief1")
  TeleportToEntity("Bunnythief2", "hub_meanstreet_v4.TelebunnyMarker2")
  FireUser2("Bunnythief2")
  TeleportToEntity("Bunnythief3", "hub_meanstreet_v4.TelebunnyMarker3")
  FireUser2("Bunnythief3")
end
MS_Telebunnies = L0_0
function L0_0(A0_4, A1_5)
  SetGlobal("MS_BunnyGears", GetGlobal("MS_BunnyGears") + 1)
  FireSequence("hub_meanstreet_v4.GusConvoV4", "MSS_FoundBunnyGear")
end
CountBunnyGears = L0_0
function L0_0(A0_6, A1_7)
  SetGlobal("MS_BunnyThiefSparks", GetGlobal("MS_BunnyThiefSparks") + 1)
  SetGlobal("PowerSparks", GetGlobal("PowerSparks") + 1)
  SetGlobal(A1_7, 1)
end
SetGearGlobal = L0_0
function L0_0(A0_8, A1_9)
  local L2_10
  L2_10 = GetPosition
  L2_10 = L2_10(A0_8)
  SetTransformation("hub_meanstreet_v4.BunnyGearSpawnMarker", L2_10, vector4(0, 0, 0))
  SetPropertyInt("hub_meanstreet_v4.BunnySparkSpawner", "Index To Spawn", 3)
  ForceSpawn("hub_meanstreet_v4.BunnySparkSpawner", 1)
  SetPropertyInt("hub_meanstreet_v4.BunnySparkSpawner", "Index To Spawn", A1_9)
  ForceSpawn("hub_meanstreet_v4.BunnySparkSpawner", 1)
end
BunnyThiefSpawnSpark = L0_0
L0_0 = ""
BunnyItemAnimationEntity = L0_0
L0_0 = false
BunnyItemAnimationEntity_Got = L0_0
function L0_0(A0_11)
  BunnyItemAnimationEntity = A0_11
  BunnyItemAnimationEntity_Got = true
end
Bunny_Find_ItemAnimationEntity = L0_0
function L0_0(A0_12)
  while BunnyItemAnimationEntity_Got == false do
    wait(0.001)
  end
  SetParentEntity(A0_12, BunnyItemAnimationEntity)
  SetPropertyString(A0_12, "Bone Attach Name", "VFX_01", 0)
  BunnyItemAnimationEntity_Got = false
end
Bunny_Attach_Item_To_Animation = L0_0
function L0_0()
  MS_PedStopAlt("hub_meanstreet_v4.Porter")
end
MS_StopPorter = L0_0
function L0_0()
  MS_PedStopAlt("hub_meanstreet_v4.Rufus Test")
end
MS_StopRufus = L0_0
function L0_0()
  SetGlobal("MS_V4_DetectiveQuestInProgress", 1)
  ForEachEntityInGroup(Unhide, "V4FootprintAssett")
  MS_CheckpointSave()
end
MS_V4_BeginDetectiveQuest = L0_0
function L0_0()
  SetGlobal("MS_V4_DetectiveQuestInProgress", 3)
  ForEachEntityInGroup(Hide, "V4FootprintAssett")
  MS_CheckpointSave()
end
MS_V4_EndDetectiveQuest = L0_0
function L0_0()
  TeleportGremlinOut("hub_meanstreet_v4.MechanicGremlinV4")
  wait(0.5)
  FireUser1("hub_meanstreet_v4.MachineMarker")
  Prefab_Projector_ChangeState("MSNewOrleansStart", "Activate")
  TeleportGremlinIn("hub_meanstreet_v4.MechanicGremlinV4", "hub_meanstreet_v4.MachineFixMarker 01", true, true)
  EnterCutscene("hub_meanstreet_v4.MechanicGremlinV4", 1)
end
MS_V4_GremlinFixProjector = L0_0
function L0_0(A0_13)
  TeleportGremlinOut("hub_meanstreet_v4.MechanicGremlinV4")
  TeleportGremlinIn("hub_meanstreet_v4.MechanicGremlinV4", "hub_meanstreet_v4.MachineFixMarker 02", false, true)
  EnableMotion(A0_13)
end
MS_V4_GremlinResetToMarker = L0_0
function L0_0()
  SetGlobal("MS_V1_NotEnough", 1)
  ForceSequence("hub_meanstreet_v4.Jack Kelly 01", "TT_V2_Footprintsellstolen")
  SetGlobal("MS_V1_NotEnough", 0)
end
MS_JackKelly_NotEnough = L0_0
