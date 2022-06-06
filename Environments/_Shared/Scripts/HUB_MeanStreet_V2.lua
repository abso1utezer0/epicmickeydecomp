local L0_0, L1_1
function L0_0()
  if MS_V2_SkipIntro == false then
    MS_V2_SkipIntro = true
    MS_V2_SaveInitialCheckpoint = true
    SetGlobal("MS_MeanStreetProgress", 2)
    SetGlobal("MS_visitnum", 2)
    SetGlobal("MS_toontownopen", 1)
    SetGlobal("TT_ToonTownProgress", 2)
    SetGlobal("NO_NewOrleansProgress", 1)
    MS_PickProjectorExit()
  end
end
MS_V2_AlwaysSetup_Launcher = L0_0
L0_0 = false
MS_V2_SkipIntro = L0_0
L0_0 = false
MS_V2_SaveInitialCheckpoint = L0_0
function L0_0()
  MS_V2_SaveInitialCheckpoint = true
  MSV2_AlwaysSetup()
end
Projector_SetupV2 = L0_0
function L0_0()
  Print("Setting up Mean Street visit 2")
  Enable("MSAllVisitsBut6AudioTrigger")
  MS_V2_SkipIntro = true
  FireThread(GuardianPrefab_PopulateGuardians, "GuardianTomorrowCity")
  FireThread(MS_SetProjectorCam)
  SetGlobal("MS_MeanStreetProgress", 2)
  SetGlobal("MS_visitnum", 2)
  SetGlobal("MS_toontownopen", 1)
  SetGlobal("TT_ToonTownProgress", 2)
  SetGlobal("NO_NewOrleansProgress", 1)
  MS_MeanStreetPersist()
  if GetGlobal("PowerSparks") == 0 then
    SetGlobal("PowerSparks", 1)
  end
  if GetGlobal("MS_V2_DetectiveQuestInProgress") == 1 then
    Print("Unhiding footprints")
    ForEachEntityInGroup(Unhide, "V2FootprintAssett")
  else
    Print("Hiding Footprints")
    ForEachEntityInGroup(Hide, "V2FootprintAssett")
  end
  if 0 < GetGlobal("MS_V2_DetectiveQuestInProgress") then
    ForEachEntityInGroup(Unhide, "V2FootprintAssett")
    Unhide("MS_V2_Shifty")
  else
    Hide("MS_V2_Shifty")
  end
  StartEmitters("PortalFX1")
  if GetGlobal("MS_tomorrowlandopen") == 1 then
    StartEmitters("PortalFX2")
  end
  MS2_SetHintMarkers()
  MS_SpawnBunnies()
  MS_SetDefaultCameraValues()
  MS_SetupMap()
  if MS_V2_SaveInitialCheckpoint == true then
    MS_V2_SaveInitialCheckpoint = false
    MS_CheckpointSave()
  end
end
MSV2_AlwaysSetup = L0_0
function L0_0()
  Print("************Setting Guardian Hint Markers HNTMRKR")
  if GetGlobal("MSS_MechanicNeedsTV_Played") == 0 then
    DisableGuardianHint("OsTownHint")
  else
    EnableGuardianHint("OsTownHint")
  end
  if GetGlobal("MSS_MechanicNeedsTV_Played") == 1 and GetGlobal("PowerSparks") < 5 then
    DisableGuardianHint("MarkusHint")
  end
  if GetGlobal("PowerSparks") > 4 then
    EnableGuardianHint("MarkusHint")
  end
end
MS2_SetHintMarkers = L0_0
function L0_0()
  if GetGlobal("MS_TLstart") == 0 then
    SetGlobal("MS_TLstart", 1)
    FireSequence("hub_meanstreet_v2.Oswald", "MSS_oswaldintro")
  end
end
MS_oswaldv2 = L0_0
function L0_0()
  SetGlobal("MS_powerswitches", GetGlobal("MS_powerswitches") + 1)
  if GetGlobal("MS_powerswitches") == 1 then
    FireSequence("hub_meanstreet_v2.MechanicGremlin", "MSS_PortalPowerComplete")
  end
end
MS_addpower = L0_0
function L0_0()
  SetGlobal("MS_powerswitches", GetGlobal("MS_powerswitches") - 1)
  if GetGlobal("MS_powerswitches") == 2 and GetGlobal("MS_toontownopen") == 0 then
    FireSequence("hub_meanstreet_v2.GusConvoV2", "MSS_guspowerdown")
  end
end
MS_subpower = L0_0
function L0_0()
  SetGlobal("MS_V2_DetectiveQuestInProgress", 1)
  ForEachEntityInGroup(Unhide, "V2FootprintAssett")
  Unhide("MS_V2_Shifty")
  MS_CheckpointSave()
end
MS_V2_BeginDetectiveQuest = L0_0
function L0_0()
  SetGlobal("MS_V2_DetectiveQuestInProgress", 3)
  ForEachEntityInGroup(Hide, "V2FootprintAssett")
  Hide("MS_V2_Shifty")
  MS_CheckpointSave()
end
MS_V2_EndDetectiveQuest = L0_0
function L0_0()
  IncrementGlobal("MS_V2_FootprintsPainted")
end
AddFootprint = L0_0
function L0_0()
  DecrementGlobal("MS_V2_FootprintsPainted")
end
SubtractFootprint = L0_0
function L0_0()
  TeleportGremlinOut("hub_meanstreet_v2.MechanicGremlin")
  wait(0.5)
  FireUser1("hub_meanstreet_v2.MachineMarker")
  Prefab_Projector_ChangeState("MSTomorrowCityMarker", "Activate")
  FireThread(TeleportGremlinIn, "hub_meanstreet_v2.MechanicGremlin", "hub_meanstreet_v2.MachineFixMarker 01", true, true)
  wait(1.56)
  EnterCutscene("hub_meanstreet_v2.MechanicGremlin", 1)
end
MS_V2_GremlinFixProjector = L0_0
function L0_0(A0_2)
  TeleportGremlinOut("hub_meanstreet_v2.MechanicGremlin")
  TeleportGremlinIn("hub_meanstreet_v2.MechanicGremlin", "hub_meanstreet_v2.MachineFixMarker 02", false, true)
  EnableMotion(A0_2)
end
MS_V2_GremlinResetToMarker = L0_0
function L0_0()
  SetGlobal("MS_V1_NotEnough", 1)
  ForceSequence("hub_meanstreet_v2.Jack Kelly 01", "TT_V2_Footprintsellstolen")
  SetGlobal("MS_V1_NotEnough", 0)
end
MS_JackKelly_NotEnough = L0_0
