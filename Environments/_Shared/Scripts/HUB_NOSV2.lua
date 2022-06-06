local L0_0, L1_1
function L0_0()
  if NO_V2_SkipIntro == false then
    NO_V2_SkipIntro = true
    NO_V2_SaveInitialCheckpoint = true
    SetGlobal("HUB_startposition", 2)
    SetGlobal("NO_NewOrleansProgress", 2)
    NO_Setup_Launcher("NOSMansionStart")
    AnimGBSequence("hub_nosquare.MansionDoors", "RestOpen")
  end
end
NOV2_AlwaysSetup_Launcher = L0_0
L0_0 = false
NO_V2_SkipIntro = L0_0
L0_0 = false
NO_V2_SaveInitialCheckpoint = L0_0
function L0_0()
  NO_V2_SaveInitialCheckpoint = true
  NOV2_AlwaysSetup()
end
NO_Projector_SetupV2 = L0_0
function L0_0()
  StartTrackingCurrentLevelForScoring("NO_BE_JigSaw")
  Prefab_Projector_ChangeState("MansionProjectorStand", "Deactivate")
  NO_V2_SkipIntro = true
  SetPropertyInt("hub_nosquare.MansionDoors", "Collision Layer", 7)
  AnimGBSequence("hub_nosquare.MansionDoors", "RestOpen")
  AudioPostEventOn(GetPlayer(), "Play_sfx_NOS_Gate_Open")
  Print("V2 Always Setup")
  wait(0.1)
  SetGlobal("NO_NewOrleansProgress", 2)
  SetGlobal("NO_visitnum", 2)
  if GetGlobal("MS_MeanStreetProgress") == 1 then
    SetGlobal("MS_MeanStreetProgress", 5)
  end
  if 5 > GetGlobal("NO_GhostsSetFree") then
    SetGlobal("NO_GhostsSetFree", 0, true)
  end
  if GetGlobal("NO_signget") == 1 then
    Unhide("hub_nosquare_dynamic.BogStoreSign")
    ForEachEntityInGroup(DestroyEntity, "NOSign")
  end
  if GetGlobal("MS_V5_DetectiveQuestInProgress") == 1 then
    ForEachEntityInGroup(Unhide, "V5FootprintAssett")
  else
    ForEachEntityInGroup(Hide, "V5FootprintAssett")
  end
  if GetGlobal("NO_bellcompleted") == 1 then
    Unhide("TownSquareBell")
  else
    Hide("TownSquareBell")
  end
  if GetGlobal("NO_organfixed") == 1 and GetGlobal("NO_visit2intro") == 1 then
    Print("Organ was fixed")
    Hide("hub_nosquare_v2.GhostGilbert")
  end
  if GetGlobal("NO_organfixed") == 0 then
    Print("Organ was not fixed")
    ForEachEntityInGroup(Enable, "hub_nosquare_v2_Ghosts")
    if GetGlobal("NO_storeopened") == 0 then
      Enable("BertrandSpawner")
    end
    DestroyEntity("WavingPed")
    DestroyEntity("hub_nosquare_v2.PlaneTrigger 02")
    Print("Checking candles")
    for _FORV_3_ = 0, 4 do
      if _FORV_3_ < GetGlobal("NO_CandleGhostsFreed") then
        DestroyEntity("GhostCandle" .. _FORV_3_ + 1)
      end
    end
  elseif GetGlobal("NO_organfixed") == 1 then
    Print("Organ was fixed")
    ForEachEntityInGroup(DestroyEntity, "GhostBoatTicket")
    ForEachEntityInGroup(DestroyEntity, "CandleGhostSpawner")
    ForEachEntityInGroup(DestroyEntity, "GhostCandle")
    ForEachEntityInGroup(Enable, "hub_nosquare_v2_Spawners_NPCs")
    if GetGlobal("NO_storeopened") == 0 then
      Enable("BertrandSpawner")
    end
    DestroyEntity("hub_nosquare_v2.GhostGilbert")
    if GetGlobal("NO_GabeV2intro_Played") == 0 then
      TeleportToEntity("GabrielSpawner", "hub_nosquare_v2.PositionMarkerGabriel")
      Enable("GabrielSpawner")
      if GetGlobal("HM_LibraryBookToGhost") == 1 then
        TeleportToEntity("hub_nosquare_v2_Spawner_Ian", "hub_nosquare_v2.PositionMarkerIan")
        Enable("hub_nosquare_v2_Spawner_Ian")
      end
    end
  end
  if GetGlobal("NO_donaldconstructed") == 1 then
    DestroyEntity("hub_nosquare_v2.DonaldHead 01")
    Enable("hub_nosquare_v2.Spawner_NPC_Donald")
  end
  if GetGlobal("NO_boatreleased") == 1 then
    SplineFollower_TeleportToKnot("hub_nosquare_v2.FreedBoat", "hub_nosquare_v2.SplineKnot 01")
    SetSplineFollowerInitialSpeed("hub_nosquare_v2.FreedBoat", 1)
    Enable("hub_nosquare_v2.FreedBoat")
    wait(0.2)
    DisableMotion("hub_nosquare_v2.GhostGilbert")
    SetParentEntity("hub_nosquare_v2.GhostGilbert", "hub_nosquare_v2.FreedBoat")
    SetNPCState("hub_nosquare_v2.GhostGilbert", 1)
  end
  if GetGlobal("NO_storeopened") == 1 then
    Print("Bertrand in shop")
    Unhide("hub_nosquare_metairie_store.Bertrand")
  else
    Disable("hub_nosquare.BogShopDoorOpenTrig")
  end
  if GetGlobal("NO_fixbridges") == 2 then
    ForEachEntityInGroup(ForcePainted, "NOBridge")
  else
    ForEachEntityInGroup(ForceSketched, "NOBridge")
    SetGlobal("NO_bridges", 0, true)
  end
  if GetGlobal("NO_FirstVisit2Entrance") == 0 then
    Print("Thinning bridges")
    SetGlobal("NO_FirstVisit2Entrance", 1)
    ForEachEntityInGroup(ForceSketched, "NOBridge")
    SetGlobal("NO_bridges", 0, true)
  end
  if GetGlobal("HUB_startposition") == 1 then
    Enable("ZoneInMSCameraTriggerv2")
    SetCameraAttributes("ZoneInMSCameraTriggerv2")
  elseif GetGlobal("HUB_startposition") == 2 then
    Print("Setup Gate Camera")
    Enable("hub_nosquare_v2.Trigger_CameraOverride 01")
    SetCameraAttributes("hub_nosquare_v2.Trigger_CameraOverride 01")
  end
  if GetGlobal("NO_voodooblotfmvplayed") == 1 and GetGlobal("NO_voodoodollget") == 0 then
    Enable("hub_nosquare_v2.SpawnerVoodooSpatter")
  end
  Enable("hub_nosquare_v2.Spawner_NPC_Metairie")
  SetupPlants()
  NO_SetDefaultCamera()
  NO_SetupMap()
  ForEachEntityInGroup(ForcePainted, "BogPlantV1")
  SetGlobal("VL_PlantsLeftBE", 20 - GetGlobal("NO_PlantsPainted"), true)
  wait(0.1)
  SetPropertyInt("hub_nosquare.MansionDoors", "Collision Layer", 4)
  if NO_V2_SaveInitialCheckpoint == true then
    NO_V2_SaveInitialCheckpoint = false
    NO_CheckpointSave()
  end
end
NOV2_AlwaysSetup = L0_0
function L0_0()
  if GetGlobal("NO_BackfromLMQuest") == 0 then
    SetGlobal("NO_BackfromLMQuest", 1)
    FireSequence("hub_nosquare_v2_Gus", "MSS_tomickeyjunk")
  end
end
NO_Visit2IntroGusHint = L0_0
function L0_0()
  if IsNPCPuddled("hub_nosquare_v2.GhostGabriel") == true then
    ForceUnpuddled("hub_nosquare_v2.GhostGabriel")
  end
  if GetGlobal("NO_visit2intro") == 0 then
    FireSequence("hub_nosquare_v2.GhostGabriel", "NO_GabeV2intro")
  end
end
NO_nosvisit2intro = L0_0
function L0_0()
  if GetGlobal("NO_donaldconstructed") == 0 and GetGlobal("NO_donaldarmget") == 1 and GetGlobal("NO_donaldlegget") == 1 and GetGlobal("NO_donaldwaistget") == 1 and GetGlobal("NO_donaldtorsoget") == 1 then
    SetGlobal("NO_donaldconstructed", 1)
    Hide("hub_nosquare_v2.DonaldHead 01")
    PlayAndUnlockMovie("NOS_visit2_Restoration_of_Donald.bik", "NOS_visit2_Restoration_of_Donald")
    Enable("hub_nosquare_v2.Spawner_NPC_Donald")
    AnimVarInt("hub_nosquare_v2.AI_AnimatronicDonald", "VAR_Mood_Type", 1)
    GiveCollectible("Animatronic_Donald")
    wait(0.1)
    NO_CheckpointSave()
  end
end
NO_constructdonald = L0_0
function L0_0()
  ForceSequence("hub_nosquare_v2.AI_AnimatronicDonald", "NO_DonaldIdleChat")
end
DonaldBuiltChatter = L0_0
function L0_0()
  SetGlobal("NO_GhostsSetFree", GetGlobal("NO_GhostsSetFree") + 1)
end
TrackFreeGhosts = L0_0
function L0_0()
  if GetGlobal("NO_voodoofmvplayed") == 0 and GetGlobal("NO_donaldvoodooready") == 1 then
    SetGlobal("NO_voodoofmvplayed", 1)
    AnimVarInt("hub_nosquare_v2.AI_AnimatronicDonald", VAR_Mood_Type, 2)
    wait(0.2)
    PlayAndUnlockMovie("NOS_visit2_Donald_Tormented.bik", "NOS_visit2_Donald_Tormented")
    wait(0.1)
    NO_CheckpointSave()
  end
end
NO_voodoofmv = L0_0
function L0_0()
  if GetGlobal("NO_donaldconstructed") == 1 and GetGlobal("NO_donaldvoodooready") == 0 then
    SetGlobal("NO_donaldvoodooready", 1)
  end
end
NO_enabledonaldvoodoo = L0_0
function L0_0()
  if GetGlobal("NO_voodooblotfmvplayed") == 0 and GetGlobal("NO_voodoofmvplayed") == 1 then
    SetGlobal("NO_voodooblotfmvplayed", 1)
    SetGlobal("NO_voodoo", 2)
    TeleportToEntity(GetPlayer(), "hub_nosquare_v2.VoodooMarker")
    Enable("hub_nosquare_v2.SpawnerVoodooSpatter")
    wait(0.2)
    PlayAndUnlockMovie("NOS_visit2_Spatter_Voodoo_Doll.bik", "NOS_visit2_Spatter_Voodoo_Doll")
    wait(1)
    NO_CheckpointSave()
  end
end
NO_voodooblotfmv = L0_0
function L0_0()
  FireSequence("hub_nosquare_v2_Gus", "NO_getdoll")
end
NO_getvoodoodoll = L0_0
function L0_0(A0_2)
  TeleportToEntity("VoodooAnim", "hub_nosquare_v2.VoodooSpawnMarker")
end
SpawnVoodooDoll = L0_0
function L0_0()
  if GetGlobal("NO_signget") == 0 then
    Hide("hub_nosquare_v2.GenSign_Parade 01")
    FireSequence("hub_nosquare_v2_Gus", "NO_gussign")
  end
end
NO_signfind = L0_0
function L0_0()
  if GetGlobal("NO_bellqueststart") == 0 and GetGlobal("NO_bellbell") == 0 then
    FireSequence("hub_nosquare_v2_Gus", "NO_gusbellbellearly")
  end
  if GetGlobal("NO_bellqueststart") == 1 and GetGlobal("NO_bellbell") == 0 then
    FireSequence("hub_nosquare_v2_Gus", "NO_gusbellbell")
  end
end
NO_bellbellget = L0_0
function L0_0()
  Print("***************** NO_bellbaseget")
  if GetGlobal("NO_bellqueststart") == 0 and GetGlobal("NO_bellbase") == 0 then
    FireSequence("hub_nosquare_v2_Gus", "NO_gusbellbaseearly")
  end
  if GetGlobal("NO_bellqueststart") == 1 and GetGlobal("NO_bellbase") == 0 then
    FireSequence("hub_nosquare_v2_Gus", "NO_gusbellbase")
  end
end
NO_bellbaseget = L0_0
function L0_0()
  FireSequence("hub_nosquare_v2_Gus", "NO_gusboot")
end
NO_bootget = L0_0
function L0_0()
  SetGlobal("NO_hauntedobjdestroy", GetGlobal("NO_hauntedobjdestroy") + 1)
  wait(0.1)
  if GetGlobal("NO_hauntedobjdestroy") == 2 then
    SetGlobal("NO_storecleared", 1)
    FireSequence("hub_nosquare_v2_Gus", "NO_ghostcleared")
  end
end
NO_breakhauntedobj = L0_0
function L0_0()
  FireThread(NO_setupstorefade)
end
NO_setupstore = L0_0
function L0_0()
  Print("*!*!*!*!Hiding Bertrand!*!*!*!*")
  wait(0.7)
  Hide("hub_nosquare_v2.Bertrand")
  SetGlobal("NO_storeopened", 1)
  Enable("hub_nosquare.BogShopDoorOpenTrig")
  NO_CheckpointSave()
end
NO_setupstorefade = L0_0
function L0_0()
  StartFadeOut(0.5)
  wait(0.5)
  TeleportToEntity("hub_nosquare_v2.Louis", "hub_nosquare_v2.Marker(Parentable) 08")
  Unhide("TownSquareBell")
  CameraReset()
  wait(0.1)
  StartFadeIn(0.5)
  wait(0.5)
  UnrestrictCutSceneInput()
  NO_CheckpointSave()
end
NO_bellassemble = L0_0
function L0_0()
  RestrictCutSceneInput()
  GrabCamera("hub_nosquare_v2.CameraControlPoint 01", "hub_nosquare_v2.GhostDwight", CAMERA_LERP_TRANSITION, 0)
  TeleportToEntity("hub_nosquare_v2.GhostDwight", "hub_nosquare_v2.NOS_HM_CandlestickA1_Toon 01")
  wait(1.2)
  Hide("hub_nosquare_v2.NOS_HM_CandlestickA1_Toon 01")
  Unhide("hub_nosquare_v2.GhostDwight")
  wait(2)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  wait(0.1)
  FireSequence("hub_nosquare_v2.GhostDwight", "NO_dwightcandlefree")
end
NO_freecandleghost = L0_0
function L0_0()
  if GetGlobal("NO_boatreleased") == 0 and GetGlobal("NO_organfixed") == 0 then
    SetGlobal("NO_boatreleased", 1)
    StartFadeOut(0.8)
    wait(0.8)
    TeleportToEntity(GetPlayer(), "hub_nosquare_v2.Marker(Rotatable) 01")
    GrabCamera("hub_nosquare_v2.BoatReleaseCam", nil, CAMERA_LERP_TRANSITION, 1)
    DestroyEntity("hub_nosquare_static.Nos_Minihub_Breakable_Dock01 01")
    RestrictCutSceneInput()
    wait(2)
    ForceSequence("hub_nosquare_v2.GhostGilbert", "NO_GilbertBoatalreadyreleased")
  end
  if GetGlobal("NO_boatreleased") ~= 0 or GetGlobal("NO_organfixed") == 0 then
  end
end
NO_releaseboatev = L0_0
function L0_0()
  StartFadeOut(0.5)
  wait(0.5)
  Enable("hub_nosquare_v2.FreedBoat")
  SplineFollower_TeleportToKnot("hub_nosquare_v2.FreedBoat", "hub_nosquare_v2.SplineKnot 04")
  UnrestrictCutSceneInput()
  SetSplineFollowerInitialSpeed("hub_nosquare_v2.FreedBoat", 1)
  DisableMotion("hub_nosquare_v2.GhostGilbert")
  SetParentEntity("hub_nosquare_v2.GhostGilbert", "hub_nosquare_v2.FreedBoat")
  SetNPCState("hub_nosquare_v2.GhostGilbert", 1)
  NO_CheckpointSave()
end
GhostToBoat = L0_0
function L0_0()
  SetGlobal("NO_bridges", GetGlobal("NO_bridges") + 1)
  Print("DEBUG-NO_addBridgeCalled - values: Bridges: ", GetGlobal("NO_bridges"), " - START - ", GetGlobal("NO_MetairieBridgeStart_Played"), " - DONE - ", GetGlobal("NO_MetairieBridgeDone_Played"))
  if GetGlobal("NO_bridges") == 9 and GetGlobal("NO_MetairieBridgeStart_Played") == 1 and GetGlobal("NO_MetairieBridgeDone_Played") == 0 then
    ForceSequence("hub_nosquare_v2_Gus", "NO_BridgeDoneHint")
  end
end
NO_addbridge = L0_0
function L0_0()
  SetGlobal("NO_bridges", GetGlobal("NO_bridges") - 1)
  Print("DEBUG-NO_subBridgeCalled - values: Bridges: ", GetGlobal("NO_bridges"), " - START - ", GetGlobal("NO_MetairieBridgeStart_Played"), " - DONE - ", GetGlobal("NO_MetairieBridgeDone_Played"))
end
NO_subbridge = L0_0
function L0_0()
  wait(0.5)
  DestroyEntity("hub_nosquare_v2.Ian")
  NO_CheckpointSave()
end
DestroyIan = L0_0
function L0_0()
  SetPropertyFloat("hub_nosquare_v2.GhostGabriel", "UsableRadius", 0)
  wait(0.5)
  EnterCutscene("hub_nosquare_v2.GhostGabriel", 1)
  wait(4)
  ExitCutscene("hub_nosquare_v2.GhostGabriel")
  DestroyEntity("hub_nosquare_v2.GhostGabriel")
end
NO_GabeVanish = L0_0
