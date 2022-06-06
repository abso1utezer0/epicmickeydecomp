local L0_0, L1_1
function L0_0(A0_2)
  GetPrefabData(A0_2).MapLoad_SetupPosition = "True"
  OnMapLoad_ProjectorSetup(A0_2)
end
TT_Setup_Launcher = L0_0
function L0_0()
  local L0_3, L1_4
  L0_3 = "TTV1_AlwaysSetup"
  L1_4 = "TTMSMarker"
  if GetGlobal("TT_ToonTownProgress") == 2 then
    L0_3 = "TTV2_AlwaysSetup"
  elseif GetGlobal("TT_ToonTownProgress") == 3 then
    L0_3 = "TTV3_AlwaysSetup"
  end
  if GetGlobal("HUB_startposition") == 2 then
    L1_4 = "TTMJMarker"
  end
  SaveCheckpoint(GetPlayer(), L0_3, L1_4)
  Print("Os Town Checkpoint saved with parameters:" .. L0_3 .. " , " .. L1_4)
end
TT_CheckpointSave = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.8)
  SetCharacterInConversation(GetPlayer(), 0)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  wait(0.1)
  SetCameraAttributes("SidescrollOverrideMarker")
  wait(0.4)
  UnrestrictCutSceneInput()
  StartFadeInNoHUD(0.6)
end
TT_GenericConvoRelease = L0_0
function L0_0()
  Print("Setting spawn location variable to MickeyJunk projector")
  SetGlobal("HUB_startposition", 2)
end
TT_MickeyJunkProjectorSpawn = L0_0
function L0_0()
  Print("Setting up the map")
  SetMap(nil, "MAP_TT_MINIHUB", "HUB")
end
TT_SetupMap = L0_0
function L0_0()
  SetDefaultCameraValues(4.25, 10, -5)
end
TT_SetDefaultCamera = L0_0
function L0_0()
  Print("Picking Setup Script")
  if GetGlobal("TT_ToonTownProgress") == 1 then
    StreamInterior(nil, "ttv1_defaultinterior")
    TT_Projector_SetupV1()
  elseif GetGlobal("TT_ToonTownProgress") == 2 then
    StreamInterior(nil, "ttv2_defaultinterior")
    TT_Projector_SetupV2()
  elseif GetGlobal("TT_ToonTownProgress") == 3 then
    if GetGlobal("TT_tent1destroyed" == 1) then
      StreamInterior(nil, "ttv3_defaultinterior")
    end
    TT_Projector_SetupV3()
  end
end
TT_PickSetupScript = L0_0
function L0_0()
  FireSequence("hub_toontown.GusConvo", "TT_gusmickeyjunk")
end
TT_loadmickeyjunk = L0_0
function L0_0()
  SetGlobal("2dDirection", 1)
  UnrestrictCutSceneInput()
  wait(0.1)
  LoadLevel(GetPlayer(), "Levels/2D_AlpineClimbers01.level")
end
TT_projectormickeyjunk = L0_0
function L0_0()
  FireSequence("hub_toontown.GusConvo", "TT_gusmeanstreet")
end
TT_loadmeanstreet = L0_0
function L0_0()
  SetGlobal("2dDirection", 0)
  UnrestrictCutSceneInput()
  wait(0.1)
  LoadLevel(GetPlayer(), "2D_MickeySteamroller01.level")
end
TT_projectormeanstreet = L0_0
L0_0 = 0
FactoryCheck = L0_0
L0_0 = 0
TowerCheck = L0_0
L0_0 = 0
PreviousPercentage = L0_0
L0_0 = 0
Percentage = L0_0
function L0_0(A0_5, A1_6)
  if GetGlobal("TT_ToonTownProgress") == 1 or GetGlobal("TT_ToonTownProgress") == 2 then
    if A1_6 == "0" then
      PreviousPercentage, Percentage = Jigsaw_GetPercentagePainted(A0_5)
      if Percentage > 0 then
        FactoryCheck = 0
      else
        FactoryCheck = 1
      end
    elseif A1_6 == "1" then
      PreviousPercentage, Percentage = Jigsaw_GetPercentagePainted(A0_5)
      if Percentage > 0 then
        TowerCheck = 0
      else
        TowerCheck = 1
      end
    end
    if FactoryCheck == 1 and TowerCheck == 1 then
      SetGlobal("TT_GagFactorySketched", 1)
    else
      SetGlobal("TT_GagFactorySketched", 0)
    end
    if A1_6 == "0" then
      Print("************GAG FACTORY QUEST UPDATE: FACTORY HIT -- PERCENTAGE PAINTED: " .. Percentage .. "************")
    elseif A1_6 == "1" then
      Print("************GAG FACTORY QUEST UPDATE: TOWER HIT -- PERCENTAGE PAINTED: " .. Percentage .. "************")
    end
    Print("Factory: " .. FactoryCheck .. " -- Tower" .. TowerCheck .. " -- Sketched?: " .. GetGlobal("TT_GagFactorySketched"))
    Print("************************")
  end
end
TT_GagFactoryPaintCheck = L0_0
function L0_0(A0_7, A1_8)
  local L2_9, L3_10
  L2_9 = GetGlobal
  L3_10 = "TT_ToonTownProgress"
  L2_9 = L2_9(L3_10)
  if L2_9 == 1 then
    L2_9 = Prefab_SpawnItem_Jigsaw
    L3_10 = A0_7
    L2_9(L3_10, A1_8)
    L2_9 = Jigsaw_GetPercentagePainted
    L3_10 = A0_7
    L3_10 = L2_9(L3_10)
    if L3_10 == 1 then
      TT_painthouse()
    else
      TT_thinhouse()
    end
    Print("*********************************" .. L3_10 .. " Var: " .. GetGlobal("TT_housepainted"))
  end
end
TT_MoodyHousePaintCheck = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "BasicAbilityPickup")
end
TT_DestroyAbilityPickups = L0_0
function L0_0(A0_11, A1_12)
  if (GetGlobal("TT_tent1destroyed") == 0 and GetGlobal("TT_ToonTownProgress") == 3) == false then
    if A1_12 == "Claradoor" and (GetGlobal("TT_ToonTownProgress") == 2 or GetGlobal("TT_ToonTownProgress") == 3) then
      AnimGBSequence(A1_12, "Open")
    elseif A1_12 == "Ortdoor" and GetGlobal("TT_OrtHouseUnlocked") == 1 and (GetGlobal("TT_ToonTownProgress") == 2 or GetGlobal("TT_ToonTownProgress") == 3) then
      AnimGBSequence(A1_12, "Open")
    elseif A1_12 == "Mickeydoor" then
      AnimGBSequence(A1_12, "Open")
    end
  end
end
OpenTTDoor = L0_0
function L0_0(A0_13, A1_14)
  if (GetGlobal("TT_tent1destroyed") == 0 and GetGlobal("TT_ToonTownProgress") == 3) == false then
    if A1_14 == "Claradoor" and (GetGlobal("TT_ToonTownProgress") == 2 or GetGlobal("TT_ToonTownProgress") == 3) then
      AnimGBSequence(A1_14, "Close")
    elseif A1_14 == "Ortdoor" and GetGlobal("TT_OrtHouseUnlocked") == 1 and (GetGlobal("TT_ToonTownProgress") == 2 or GetGlobal("TT_ToonTownProgress") == 3) then
      AnimGBSequence(A1_14, "Close")
    elseif A1_14 == "Mickeydoor" then
      AnimGBSequence(A1_14, "Close")
    end
  end
end
CloseTTDoor = L0_0
function L0_0(A0_15, A1_16)
  StreamInterior(nil, A1_16)
end
TT_StreamBuilding = L0_0
function L0_0()
  RestrictCutSceneInput()
  AudioPostEventOn(GetPlayer(), "Play_sfx_Hub_Door_Trans_enter")
  StartFadeOut(1.2)
  Enable2DSetup()
  AudioPostEventOn(GetPlayer(), "Set_Volume_Enter_Interior")
  wait(1.2)
  WaitForLevelLoad()
  SetConfigVariableString(GetPlayer(), "CameraFieldOfView", 0)
  wait(1)
  StartFadeInNoHUD()
  wait(0.5)
  UnrestrictCutSceneInput()
end
TT_EnterBuildings = L0_0
function L0_0()
  local L0_17, L1_18, L2_19, L3_20
  L0_17()
  L0_17(L1_18, L2_19)
  L0_17(L1_18)
  L0_17()
  L0_17(L1_18, L2_19)
  L0_17(L1_18)
  for L3_20 = 1, 3 do
    if GetGlobal("TT_ToonTownProgress") == L3_20 then
      Print("Streaming Toontown: v:" .. L3_20)
      StreamInterior(nil, "ttv" .. L3_20 .. "_defaultinterior")
    end
  end
  L0_17()
  L0_17(L1_18)
  L0_17(L1_18)
  L0_17()
end
TT_ExitBuildings = L0_0
function L0_0()
  StreamInterior(nil, "clarabelle_house")
  FireThread(TT_EnterBuildings)
  wait(1.3)
  wait(0.25)
  TeleportToEntity(GetPlayer(), "hub_toontown_clarabellehouse.buildinginterior 01.buildinginterior.EnterMarker")
  wait(0.01)
  CameraReset()
  wait(0.01)
  SetCameraAttributes("SidescrollOverrideMarker")
end
TT_EnterClarabelleHouse = L0_0
function L0_0()
  Enable("hub_toontown.Trigger_CameraOverride 03")
  FireThread(TT_ExitBuildings)
  wait(1)
  TeleportToEntity(GetPlayer(), "hub_toontown_clarabellehouse.buildinginterior 01.buildinginterior.ExitMarker")
  wait(0.01)
  CameraReset()
  SetCameraAttributes("hub_toontown.Trigger_CameraOverride 03")
  if HasCollectible("Mickey_Mum") and HasCollectible("Sparkle_Daisy") and HasCollectible("Swamp_Iris") and GetGlobal("TT_ClarabellePinsCheckpointFired") == 0 then
    SetGlobal("TT_ClarabellePinsCheckpointFired", 1)
    TT_CheckpointSave()
  end
end
TT_ExitClarabelleHouse = L0_0
function L0_0()
  StreamInterior(nil, "mickey_house")
  FireThread(TT_EnterBuildings)
  wait(1.3)
  wait(0.25)
  TeleportToEntity(GetPlayer(), "hub_toontown_mickeyhouse.Marker(Parentable) 04")
  wait(0.01)
  CameraReset()
  wait(0.01)
  SetCameraAttributes("SidescrollOverrideMarker")
end
TT_EnterMickeyHouse = L0_0
function L0_0()
  if GetGlobal("TT_ToonTownProgress") == 1 and GetGlobal("TT_wrench") == 1 then
    TeleportToEntity("hub_toontown_v1.Prescott", "hub_toontown_v1.Marker(Parentable) 07")
  end
  if GetGlobal("TT_prescottrescue_Played") == 1 and GetGlobal("TT_PhoneWrenchPower_Played") == 1 and GetGlobal("TT_wrench") == 0 then
    TeleportToEntity("hub_toontown_v1.Prescott", "hub_toontown_v1.PrescottPhoneMarker")
  end
  Enable("hub_toontown.Trigger_CameraOverride 02")
  FireThread(TT_ExitBuildings)
  wait(1)
  TeleportToEntity(GetPlayer(), "hub_toontown_mickeyhouse.Marker(Parentable) 07")
  wait(0.01)
  CameraReset()
  SetCameraAttributes("hub_toontown.Trigger_CameraOverride 02")
  if GetGlobal("TT_ToonTownProgress") == 1 and GetGlobal("TT_wrench") == 0 and GetGlobal("TT_PhoneWrenchPower_Played") == 1 and GetGlobal("TT_PrescottPhoneOffer_Played") == 0 then
    ForceSequence("hub_toontown_v1.Prescott", "TT_PrescottPhoneOffer")
  end
end
TT_ExitMickeyHouse = L0_0
function L0_0()
  StartFadeOut(1)
  wait(1)
  Enable("hub_toontown.Trigger_CameraOverride 02")
  TeleportToEntity(GetPlayer(), "hub_toontown_mickeyhouse.Marker(Parentable) 07")
  wait(0.01)
  SetCharacterInConversation(GetPlayer(), 0)
  SetCameraAttributes("hub_toontown.Trigger_CameraOverride 02")
  StartFadeIn(1)
  UnrestrictCutSceneInput()
end
TT_FixCameraAfterPrescottOffer = L0_0
function L0_0()
  if GetGlobal("TT_OrtHouseUnlocked") == 1 then
    StreamInterior(nil, "ortensia_house")
    FireThread(TT_EnterBuildings)
    wait(1.3)
    wait(0.25)
    if GetGlobal("TT_OrtLocketFound_Played") == 1 then
      ForEachEntityInGroup(DestroyEntity, "hub_toontown_v2.Locket")
    end
    TeleportToEntity(GetPlayer(), "hub_toontown_ortensiahouse.Marker(Parentable) 03")
    wait(0.01)
    CameraReset()
    wait(0.01)
    SetCameraAttributes("SidescrollOverrideMarker")
  end
end
TT_EnterOrtensiaHouse = L0_0
function L0_0()
  FireThread(TT_ExitBuildings)
  wait(1)
  Enable("hub_toontown.Trigger_CameraOverride 08")
  TeleportToEntity(GetPlayer(), "hub_toontown_ortensiahouse.Marker(Parentable) 06")
  wait(0.01)
  CameraReset()
  SetCameraAttributes("hub_toontown.Trigger_CameraOverride 08")
  if GetGlobal("TT_GoofyLocket_Played") == 0 and GetGlobal("TT_locket") == 1 then
    ForceSequence("hub_toontown_v2.AnimatronicGoofy 01", "TT_GoofyLocket")
  end
end
TT_ExitOrtensiaHouse = L0_0
function L0_0(A0_21)
  SetPropertyFloat("vendor", "UsableRadius", 0)
  StartFadeOut(0.8)
  wait(0.8)
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
TelephoneConvoRelease = L0_0
function L0_0()
  ForEachEntityInGroup(AnimVarInt, "sadBunny", "VAR_NPC_State", 1)
end
ForceSadBunny = L0_0
function L0_0()
  local L0_22, L1_23, L2_24, L3_25
  if L0_22 ~= 1 then
    if L0_22 == 1 then
    end
  elseif L0_22 == 1 then
    for L3_25 = 1, 3 do
      if GetGlobal("TT_visitnum") == L3_25 then
        StreamInterior(nil, "ttv" .. L3_25 .. "_defaultinterior")
      end
    end
    L0_22()
  end
end
TT_StreamInterior = L0_0
function L0_0()
  StartFadeOut(1)
  wait(1)
  Enable("hub_toontown.Trigger_CameraOverride 08")
  TeleportToEntity(GetPlayer(), "hub_toontown_ortensiahouse.Marker(Parentable) 06")
  wait(0.01)
  SetCameraAttributes("hub_toontown.Trigger_CameraOverride 08")
  StartFadeIn(1)
  UnrestrictCutSceneInput()
end
TT_FixCameraAfterLocketEvent = L0_0
function L0_0()
  Print("************Enabling Mean Street Projector************")
  Enable("MeanStreetProjector")
end
TT_EnableMSProjector = L0_0
function L0_0(A0_26, A1_27)
  FireSequence(A0_26, "ThinnerReaction" .. A1_27)
end
TT_BarkGenericThinner = L0_0
function L0_0(A0_28, A1_29, A2_30)
  if A2_30 == "Clarabelle" then
    if A1_29 == "Start" then
      StartEmitters("ClarabelleChimneySmoke")
    elseif A1_29 == "Stop" then
      StopEmitters("ClarabelleChimneySmoke")
    end
  elseif A2_30 == "Ortensia" then
    if A1_29 == "Start" then
      StartEmitters("OrtensiaChimneySmoke")
    elseif A1_29 == "Stop" then
      StopEmitters("OrtensiaChimneySmoke")
    end
  end
end
TT_ChimneyEmitters = L0_0
function L0_0(A0_31, A1_32)
  if GetGlobal("MS_V1RaceActive") == 0 and GetGlobal("TT_goofyintroplayed") == 0 then
    SetGlobal("TT_goofyintroplayed", 1)
    RestrictCutSceneInput()
    StartFadeOut(1)
    wait(1.2)
    Disable("hub_toontown_igc.Trigger_CameraOverride 03")
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
    PlayAndUnlockMovie("TT_visit1_Intro_to_Goofy.bik", "TT_visit1_Intro_to_Goofy")
    UnrestrictCutSceneInput()
    if A1_32 == 1 then
      ForceSequence("AnimGoofyHead", "TT_goofygetparts")
    elseif A1_32 == 2 then
      ForceSequence("hub_toontown_v2.GoofyHead", "TT_goofygetparts")
    end
    SetGlobal("TT_goofygetparts_Played", 1)
    ShowHud()
    Enable("hub_toontown_igc.Trigger_CameraOverride 03")
  end
end
TT_goofyintrobik = L0_0
function L0_0(A0_33, A1_34)
  if A1_34 == "0" then
    SetGlobal("TT_PlankThinned", 0)
  elseif A1_34 == "1" then
    SetGlobal("TT_PlankThinned", 1)
  end
end
TrackPlank = L0_0
function L0_0()
  if GetGlobal("TT_ToonTownProgress") == 1 then
    SetPropertyFloat("AnimGoofyHead", "UsableRadius", 0)
  elseif GetGlobal("TT_ToonTownProgress") == 2 then
    SetPropertyFloat("hub_toontown_v2.GoofyHead", "UsableRadius", 0)
  end
  SetPropertyFloat("hub_toontown_igc.Trigger_CameraOverride 03", "HintPitchSpeed", 0)
  SetPropertyFloat("hub_toontown_igc.Trigger_CameraOverride 03", "HintDistanceSpeed", 0)
  StartFadeOut(0.8)
  wait(0.8)
  SetCameraAttributes("hub_toontown_igc.Trigger_CameraOverride 03")
  SetCharacterInConversation(GetPlayer(), 0)
  wait(1)
  UnrestrictCutSceneInput()
  StartFadeIn(0.6)
  if GetGlobal("TT_ToonTownProgress") == 1 then
    SetPropertyFloat("AnimGoofyHead", "UsableRadius", 3)
  elseif GetGlobal("TT_ToonTownProgress") == 2 then
    SetPropertyFloat("hub_toontown_v2.GoofyHead", "UsableRadius", 3)
  end
  SetPropertyFloat("hub_toontown_igc.Trigger_CameraOverride 03", "HintPitchSpeed", 0.005)
  SetPropertyFloat("hub_toontown_igc.Trigger_CameraOverride 03", "HintDistanceSpeed", 0.005)
end
TT_GoofyConvoRelease = L0_0
function L0_0(A0_35)
  if GetGlobal("TT_ToonTownProgress") == 2 and GetGlobal("TT_cakedeliver_Played") == 0 and GetGlobal("TT_cakemade") == 0 then
    SetNPCMood(A0_35, MOOD_Negative)
  else
    SetNPCMood(A0_35, MOOD_Positive)
  end
end
TT_SetClarabelleInHouseMood = L0_0
function L0_0()
  Print("Setting Donald's boat ticket as collected")
  SetGlobal("TT_DonaldBoatTicketCollected", 1)
end
TT_DonaldTicketCollected = L0_0
