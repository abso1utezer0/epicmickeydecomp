local L0_0, L1_1
function L0_0()
  if MS_V5_SkipIntro == false then
    MS_V5_SkipIntro = true
    MS_V5_SaveInitialCheckpoint = true
    SetGlobal("MS_MeanStreetProgress", 5)
    SetGlobal("MS_visitnum", 5)
    SetGlobal("MS_toontownopen", 1)
    SetGlobal("MS_neworleansopen", 1)
    SetGlobal("MS_adventurelandopen", 1)
    SetGlobal("TT_ToonTownProgress", 2)
    SetGlobal("NO_NewOrleansProgress", 2)
    if GetGlobal("AL_AdventurelandProgress") == 1 then
      SetGlobal("AL_AdventurelandProgress", 2)
    end
    MS_PickProjectorExit()
  end
end
MS_V5_AlwaysSetup_Launcher = L0_0
L0_0 = false
MS_V5_SkipIntro = L0_0
L0_0 = false
MS_V5_SaveInitialCheckpoint = L0_0
function L0_0()
  MS_V5_SaveInitialCheckpoint = true
  MSV5_AlwaysSetup()
end
Projector_SetupV5 = L0_0
function L0_0()
  Print("Setting up Mean Street visit 5")
  Enable("MSAllVisitsBut6AudioTrigger")
  MS_V5_SkipIntro = true
  FireThread(GuardianPrefab_PopulateGuardians, "GuardianOsTown")
  FireThread(MS_SetProjectorCam)
  SetGlobal("MS_MeanStreetProgress", 5)
  SetGlobal("MS_visitnum", 5)
  SetGlobal("MS_toontownopen", 1)
  SetGlobal("MS_neworleansopen", 1)
  SetGlobal("MS_adventurelandopen", 1)
  SetGlobal("TT_ToonTownProgress", 2)
  SetGlobal("NO_NewOrleansProgress", 2)
  StartEmitters("PortalFX1")
  StartEmitters("PortalFX2")
  StartEmitters("PortalFX3")
  StartEmitters("PortalFX4")
  if GetGlobal("PowerSparks") == 0 then
    SetGlobal("PowerSparks", 25)
  end
  MS_MeanStreetPersist()
  MS_SetupMap()
  MS_SpawnBunnies()
  MS_SetDefaultCameraValues()
  if MS_V5_SaveInitialCheckpoint == true then
    MS_V5_SaveInitialCheckpoint = false
    MS_CheckpointSave()
  end
end
MSV5_AlwaysSetup = L0_0
function L0_0()
  if GetGlobal("TT_V2_Oswald_GearUp_Played") == 0 then
    FireSequence("hub_meanstreet_v2.Oswald", "TT_V2_Oswald_GearUp")
  end
end
MS_guidetoMJ = L0_0
function L0_0()
  SetGlobal("MS_V5_DetectiveQuestInProgress", 1)
  ForEachEntityInGroup(Unhide, "V5FootprintAssett")
  MS_CheckpointSave()
end
MS_V5_BeginDetectiveQuest = L0_0
function L0_0()
  SetGlobal("MS_V5_DetectiveQuestInProgress", 3)
  ForEachEntityInGroup(Hide, "V5FootprintAssett")
  MS_CheckpointSave()
end
MS_V5_EndDetectiveQuest = L0_0
function L0_0()
  TeleportGremlinOut("hub_meanstreet_v5.MechanicGremlinV5")
  wait(0.5)
  FireUser1("hub_meanstreet_v5.MachineMarker")
  TeleportGremlinIn("hub_meanstreet_v5.MechanicGremlinV5", "hub_meanstreet_v5.MachineFixMarker 01", true, true)
  EnterCutscene("hub_meanstreet_v5.MechanicGremlinV5", 1)
end
MS_V5_GremlinFixProjector = L0_0
function L0_0(A0_2)
  TeleportGremlinOut("hub_meanstreet_v5.MechanicGremlinV5")
  TeleportGremlinIn("hub_meanstreet_v5.MechanicGremlinV5", "hub_meanstreet_v5.MachineFixMarker 02", false, true)
  EnableMotion(A0_2)
end
MS_V5_GremlinResetToMarker = L0_0
function L0_0()
  SetGlobal("MS_V1_NotEnough", 1)
  ForceSequence("hub_meanstreet_v5.Jack Kelly", "TT_V2_Footprintsellstolen")
  SetGlobal("MS_V1_NotEnough", 0)
end
MS_JackKelly_NotEnough = L0_0
