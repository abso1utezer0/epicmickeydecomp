local L0_0, L1_1
function L0_0()
  Print("**************TTv2 Setup  " .. tostring(TT_V2_SkipIntro))
  if TT_V2_SkipIntro == false then
    TT_V2_SkipIntro = true
    TT_V2_SaveInitialCheckpoint = true
    SetGlobal("HUB_startposition", 2)
    if GetGlobal("MS_MeanStreetProgress") == 1 then
      SetGlobal("MS_MeanStreetProgress", 2)
    end
    SetGlobal("TT_ToonTownProgress", 2)
    SetGlobal("TT_visitnum", 2)
    TT_Setup_Launcher("TTMJMarker")
  end
end
TTV2_AlwaysSetup_Launcher = L0_0
L0_0 = false
TT_V2_SkipIntro = L0_0
L0_0 = false
TT_V2_SaveInitialCheckpoint = L0_0
function L0_0()
  TT_V2_SaveInitialCheckpoint = true
  TTV2_AlwaysSetup()
end
TT_Projector_SetupV2 = L0_0
function L0_0()
  Print("Setting up Os Town visit 2")
  TT_StreamInterior()
  RestrictCutSceneInput()
  StartTrackingCurrentLevelForScoring("TT_ToonTown")
  TT_V2_SkipIntro = true
  SetGlobal("TT_ToonTownProgress", 2)
  SetGlobal("TT_visitnum", 2)
  Prefab_Projector_ChangeState("hub_toontown.ProjectorTTMickeyJunk.ProjectorPortal_Stand", "Deactivate")
  if GetGlobal("TT_housepainted") == 1 then
    ForcePainted("TTMoodyHouse")
  elseif GetGlobal("TT_housepainted") == 0 then
    ForceSketched("TTMoodyHouse")
  end
  if GetGlobal("TT_PlankThinned") == 0 then
    ForcePainted("hub_toontown_static.TT_Minihub_Toon8 01")
  else
    ForceSketched("hub_toontown_static.TT_Minihub_Toon8 01")
  end
  Disable("CarHintTrigger")
  if GetGlobal("TT_DonaldBoatTicketCollected") == 1 or GetGlobal("TT_PrescottDonaldBoat_Played") == 0 then
    Hide("hub_toontown_v2.ETicket_E_Parentable 01")
  end
  if GetGlobal("TT_Phoneboxes") == 4 then
    ForEachEntityInGroup(ForcePainted, "FuseBoxes")
  else
    ForEachEntityInGroup(DestroyEntity, "FuseBoxes")
  end
  if GetGlobal("MS_MeanStreetProgress") == 1 then
    Print("Setting ms progress to 2")
    SetGlobal("MS_MeanStreetProgress", 2)
  end
  if GetGlobal("MS_MeanStreetProgress") == 2 then
    GuardianPrefab_PopulateGuardians("MSGuardianSpawner")
  end
  if GetGlobal("MS_MeanStreetProgress") == 5 and GetGlobal("TT_V2_Oswald_GearUp_Played") == 1 then
    Prefab_Projector_ChangeState("hub_toontown.ProjectorTTMickeyJunk.ProjectorPortal_Stand", "Activate")
    GuardianPrefab_PopulateGuardians("MJMGuardianSpawner")
  end
  if GetGlobal("TT_badrescue") == 1 then
    DestroyEntity("hub_toontown_v2.Moody")
  end
  if GetGlobal("TT_movedin") == 1 then
    TeleportToEntity("hub_toontown_v2.Prescott", "hub_toontown.Marker(Parentable) 02")
  end
  if GetGlobal("TT_boatfixed") == 1 then
    AnimGBSequence("V2DonaldBoat", "Loop")
  else
    AnimGBSequence("V2DonaldBoat", "Rest")
  end
  AnimGBSetIdle("V2DonaldBoat", false)
  if GetGlobal("TT_locket") == 1 then
    ForEachEntityInGroup(DestroyEntity, "hub_toontown_v2.Locket")
  end
  if 2 > GetGlobal("MS_FindPirateQuest") then
    DestroyEntity("hub_toontown_v2.MoodyCousin")
  end
  if GetGlobal("MS_V3_DetectiveQuestInProgress") == 1 then
    ForEachEntityInGroup(Unhide, "V3FootprintAssett")
  else
    ForEachEntityInGroup(Hide, "V3FootprintAssett")
  end
  if GetGlobal("TT_MoodyCrushed") == 1 then
    DestroyEntity("hub_toontown_v1.Moody")
    AnimGBSequence("hub_toontown.TT_SafeA1_Inert 02", "RestOpened")
    AnimGBSetIdle("hub_toontown.TT_SafeA1_Inert 02", false)
  elseif GetGlobal("TT_MoodyCrushed") == 0 then
    if GetGlobal("TT_SafeAnimationState") == 1 then
      AnimGBSequence("hub_toontown.TT_SafeA1_Inert 02", "OpenUp")
      AnimGBSetIdle("hub_toontown.TT_SafeA1_Inert 02", false)
    elseif GetGlobal("TT_SafeAnimationState") == 2 then
      AnimGBSequence("hub_toontown.TT_SafeA1_Inert 02", "RestOpened")
      AnimGBSetIdle("hub_toontown.TT_SafeA1_Inert 02", false)
    end
  end
  TT_destroyflowers()
  TT_SetDefaultCamera()
  TT_SetupMap()
  FireThread(TT_UnhideQuestFlowers)
  if GetGlobal("HUB_StartPosition") == 1 then
    Enable("hub_toontown.Trigger_CameraOverride 07")
    SetCameraAttributes("hub_toontown.Trigger_CameraOverride 07")
  elseif GetGlobal("HUB_StartPosition") == 2 then
    Enable("hub_toontown.Trigger_CameraOverride 04")
    SetCameraAttributes("hub_toontown.Trigger_CameraOverride 04")
  end
  if GetGlobal("TT_goofyconstructed") == 1 then
    WaitForLevelLoad()
    ForceSpawn("hub_toontown_v2.GoofySpawner", 1)
    DestroyEntity("hub_toontown_v2.GoofyHead")
    PickGoofyMood()
  end
  if TT_V2_SaveInitialCheckpoint == true then
    TT_V2_SaveInitialCheckpoint = false
    TT_CheckpointSave()
  end
  UnrestrictCutSceneInput()
end
TTV2_AlwaysSetup = L0_0
function L0_0()
  if GetGlobal("MSS_BackFromMJQuest_Played") == 0 and GetGlobal("MS_MeanStreetProgress") == 2 then
    FireSequence("hub_toontown_v2.Gus ConvoV2", "MSS_BackFromMJQuest")
    SetGlobal("MSS_BackFromMJQuest_Played", 1)
  end
end
V2PlayerDirection = L0_0
function L0_0()
  wait(4)
  if GetGlobal("TT_ClaraGatherFlowers_Played") == 1 and GetGlobal("TT_FlowersforHenrietta_Played") == 0 then
    ForEachEntityInGroup(Unhide, "Claraflower")
  end
end
TT_UnhideQuestFlowers = L0_0
function L0_0()
  if GetGlobal("TT_Flower1") == 1 then
    Print("Destroying Flower 1")
    DestroyEntity("Flower1")
  end
  if GetGlobal("TT_Flower2") == 1 then
    Print("Destroying Flower 2")
    DestroyEntity("Flower2")
  end
  if GetGlobal("TT_Flower3") == 1 then
    Print("Destroying Flower 3")
    DestroyEntity("Flower3")
  end
end
TT_destroyflowers = L0_0
function L0_0()
  FireSequence("hub_toontown_v2.Gus ConvoV2", "TT_OrtLocketFound")
end
TT_PickupLocket = L0_0
function L0_0()
  local L0_2, L1_3
end
TT_LocketEvent = L0_0
function L0_0()
  SetGlobal("TT_goofyconstructed", 1)
  StartFadeOut(1)
  wait(1)
  SetPropertyFloat("hub_toontown_igc.Trigger_CameraOverride 03", "HintPitchSpeed", 0)
  SetPropertyFloat("hub_toontown_igc.Trigger_CameraOverride 03", "HintDistanceSpeed", 0)
  SetCameraAttributes("hub_toontown_igc.Trigger_CameraOverride 03")
  HideHud()
  PlayAndUnlockMovie("TT_visit2_Restoration of Goofy.bik", "TT_visit2_Restoration_of_Goofy")
  DestroyEntity("hub_toontown_v2.GoofyHead")
  ForceSpawn("hub_toontown_v2.GoofySpawner", 1)
  wait(0.1)
  SetCharacterInConversation(GetPlayer(), 0)
  wait(0.5)
  StartFadeIn(1)
  SetPropertyFloat("hub_toontown_igc.Trigger_CameraOverride 03", "HintPitchSpeed", 0.005)
  SetPropertyFloat("hub_toontown_igc.Trigger_CameraOverride 03", "HintDistanceSpeed", 0.005)
  UnrestrictCutSceneInput()
  ShowHud()
  PickGoofyMood()
  TT_CheckpointSave()
end
TT_constructgoofy = L0_0
function L0_0()
  if GetGlobal("TT_LocketSold") == 1 then
    Print("Set Goofy to negative")
    AnimVarInt("hub_toontown_v2.AnimatronicGoofy 01", VAR_Mood_Type, 0)
  else
    Print("Set Goofy to positive")
    AnimVarInt("hub_toontown_v2.AnimatronicGoofy 01", VAR_Mood_Type, 1)
  end
end
PickGoofyMood = L0_0
function L0_0()
  Print("Set Goofy to positive")
  if GetGlobal("TT_LocketSold") == 0 then
    AnimVarInt("hub_toontown_v2.AnimatronicGoofy 01", VAR_Mood_Type, 1)
  end
end
GoofyHappy = L0_0
function L0_0()
  Print("Set Goofy to negative")
  AnimVarInt("hub_toontown_v2.AnimatronicGoofy 01", VAR_Mood_Type, 0)
end
GoofySad = L0_0
function L0_0()
  AnimGBSequence("V2DonaldBoat", "Rise")
  wait(2.8)
  AnimGBSequence("V2DonaldBoat", "Loop")
  AnimGBSetIdle("V2DonaldBoat", false)
end
TT_fixboat = L0_0
function L0_0()
  rotatespeed = rotatespeed + 0.3
  SetSplineFollowerInitialSpeed("Wheel01Platforms1", rotatespeed)
  SetSplineFollowerInitialSpeed("Wheel01Platforms2", rotatespeed)
  SetSplineFollowerInitialSpeed("Wheel01Platforms3", rotatespeed)
  SetSplineFollowerInitialSpeed("Wheel01Platforms4", rotatespeed)
end
TT_speedgears = L0_0
function L0_0()
  rotatespeed = 2
  SetSplineFollowerInitialSpeed("Wheel01Platforms1", 2)
  SetSplineFollowerInitialSpeed("Wheel01Platforms2", 2)
  SetSplineFollowerInitialSpeed("Wheel01Platforms3", 2)
  SetSplineFollowerInitialSpeed("Wheel01Platforms4", 2)
end
TT_resetrotator = L0_0
function L0_0()
  if GetGlobal("TT_SafeAnimationState") == 1 then
    FireUser1("OpenSafeFallMarker")
    wait(0.8)
    TeleportToEntity(GetPlayer(), "hub_toontown_v1.basicconvoshortnew_prescottConvo.basicconvoshortnew.PlayerMarker")
    wait(0.5)
    AnimGBSetIdle("hub_toontown.TT_SafeA1_Inert 02", true)
    AnimGBReset("hub_toontown.TT_SafeA1_Inert 02")
    AudioPostEventOn(GetPlayer(), "Play_sfx_OsTown_SafeFall")
    AnimGBSequence("hub_toontown.TT_SafeA1_Inert 02", "OpenFall")
    wait(0.5)
    AudioPostEventOn(GetPlayer(), "Play_sfx_OsTown_SafeFall_Impact_Safe")
    AnimGBSetIdle("hub_toontown.TT_SafeA1_Inert 02", false)
    SetGlobal("TT_SafeAnimationState", 2)
    TT_CheckpointSave()
  end
end
TT_safefall = L0_0
