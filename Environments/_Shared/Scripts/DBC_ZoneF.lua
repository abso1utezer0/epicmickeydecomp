local L0_0, L1_1
L0_0 = false
gar1Correct = L0_0
L0_0 = false
gar2Correct = L0_0
L0_0 = false
gar3Correct = L0_0
L0_0 = false
gar4Correct = L0_0
L0_0 = false
gar5Correct = L0_0
L0_0 = false
gar6Correct = L0_0
L0_0 = 0
DBC_ZoneF_LeftSidePaintings = L0_0
L0_0 = 0
DBC_ZoneF_RightSidePaintings = L0_0
L0_0 = 0
DBC_ZoneF_RightSideBase = L0_0
L0_0 = 0
DBC_ZoneF_LeftSideBase = L0_0
L0_0 = 0
DBC_ZoneF_WallMural = L0_0
L0_0 = 0
DBC_ZoneF_GarAngle1 = L0_0
L0_0 = 0
DBC_ZoneF_GarAngle2 = L0_0
L0_0 = 0
DBC_ZoneF_GarAngle3 = L0_0
L0_0 = 0
DBC_ZoneF_GarAngle4 = L0_0
L0_0 = 0
DBC_ZoneF_GarAngle5 = L0_0
L0_0 = 0
DBC_ZoneF_Gargoyle1 = L0_0
L0_0 = 0
DBC_ZoneF_Gargoyle2 = L0_0
L0_0 = 0
DBC_ZoneF_Gargoyle3 = L0_0
L0_0 = 0
DBC_ZoneF_Gargoyle4 = L0_0
L0_0 = 0
DBC_ZoneF_Gargoyle5 = L0_0
L0_0 = 0
DBC_ZoneF_GearAngle1 = L0_0
L0_0 = 0
DBC_ZoneF_GearAngle2 = L0_0
L0_0 = 0
DBC_ZoneF_GearAngle3 = L0_0
L0_0 = 0
DBC_ZoneF_GearAngle4 = L0_0
L0_0 = 0
DBC_ZoneF_Gem = L0_0
L0_0 = 0
DBC_ZoneF_TempDisable = L0_0
L0_0 = 0
DBC_ZoneF_DisableCheckpointSave = L0_0
L0_0 = 1
DBC_ZoneF_RightSideCheck1 = L0_0
L0_0 = 1
DBC_ZoneF_RightSideCheck2 = L0_0
L0_0 = 0
DBC_ZoneF_RightSideCheck3 = L0_0
L0_0 = 0
DBC_ZoneF_RightSideCheck4 = L0_0
L0_0 = 0
DBC_ZoneF_LeftSideCheck1 = L0_0
L0_0 = 0
DBC_ZoneF_LeftSideCheck2 = L0_0
L0_0 = 0
DBC_ZoneF_LeftSideCheck3 = L0_0
L0_0 = 0
DBC_ZoneF_LeftSideCheck4 = L0_0
L0_0 = 0
DBC_ZoneF_WindowSmall = L0_0
L0_0 = 0
DBC_ZoneF_WindowLarge = L0_0
L0_0 = 0
DBC_ZoneF_ToonChain1 = L0_0
L0_0 = 0
DBC_ZoneF_ToonChain2 = L0_0
L0_0 = 0
DBC_ZoneF_ToonChain3 = L0_0
L0_0 = 0
DBC_ZoneF_ToonChain4 = L0_0
L0_0 = 6
DBC_ZoneF_MuralCheck = L0_0
L0_0 = 0
DBC_ZoneF_SweeperFriends = L0_0
L0_0 = 0
DBC_ZoneF_RightGargTriggered1 = L0_0
L0_0 = 0
DBC_ZoneF_RightGargTriggered2 = L0_0
L0_0 = 0
DBC_ZoneF_LeftGargTriggered1 = L0_0
L0_0 = 0
DBC_ZoneF_LeftGargTriggered2 = L0_0
L0_0 = 0
DBC_ZoneF_MuralTriggered = L0_0
L0_0 = 0
DBC_ZoneF_DoorTriggered = L0_0
L0_0 = 0
DBC_ZoneF_DisableMuralCutscene = L0_0
function L0_0(A0_2)
  DBC_ZoneF_NoIntro = true
  DBC_ZoneF_TempDisable = 1
  FireThread(GuardianPrefab_PopulateGuardians, "DBC_ZoneF_MickeyHead1")
  FireThread(GuardianPrefab_PopulateGuardians, "DBC_ZoneF_MickeyHead2")
  SetCameraAttributes(GetRelativePrefabEntity("DBC_ZoneFStart", ".CameraSettings"))
  EndTrackingCurrentLevelForScoring("DBC_V2_ThroneRoom")
  StartTrackingCurrentLevelForScoring("DBC_V2_ThroneRoom")
  ForEachEntityInGroup(Hide, "dbc_zonef_dynamic.DBC_Lightbeams")
  ForEachEntityInGroup(DisableComponent, "PaintHintMarkerGroup", "Guardian Hint Component")
  ForEachEntityInGroup(DisableComponent, "ThinnerHintMarkerGroup", "Guardian Hint Component")
  if GetGlobal("DBC_ZoneF_ChainsCheck") == 0 and GetGlobal("DBC_ZoneF_DoorPuzzleCheck") == 0 then
    SetGlobal("DBC_ZoneF_Chains", 0)
    ForEachEntityInGroup(Enable, "dbc_zonef_audio.Trigger_WindCracks")
    ForEachEntityInGroup(SetPropertyBool, "ChandelierToon", "Is Real", true)
    if GetGlobal("DBC_ZoneF_SlobberDefeated") == 0 then
      ForEachEntityInGroup(Enable, "dbc_zonef_dynamic.SpatterSpawner 01")
    else
      ForEachEntityInGroup(EnableComponent, "PaintHintMarkerGroup", "Guardian Hint Component")
      ForEachEntityInGroup(EnableComponent, "ThinnerHintMarkerGroup", "Guardian Hint Component")
    end
  end
  if GetGlobal("DBC_ZoneF_ChainsCheck") == 1 then
    AnimGBSequence("dbc_zonef_dynamic.DBC_ZoneF_Chandelier_01 01", "Break")
    AnimGBSequence("dbc_zonef_dynamic.DBC_ZoneF_Throne 01", "Break")
    DestroyEntity("dbc_zonef_dynamic.BoulderTrigger 01")
    AnimGBSequence("RollingBoulder", "RestBroken")
    ForEachEntityInGroup(ForceSketched, "ChandelierToon")
    ForEachEntityInGroup(DestroyEntity, "ChandelierInert")
    DestroyEntity("dbc_zonef_dynamic.DBC_LightGemA1_Toon 01")
    Enable("dbc_zonef_dynamic.BrokenThroneCamTrigger 01")
    ToggleCameraOcclusion("dbc_zonef_dynamic.DBC_ZoneF_Chandelier_01 01", false)
    FireThread(DBC_ZoneF_LoadCheckpointRumble)
    ForEachEntityInGroup(Disable, "dbc_zonef_audio.Trigger_WindCracks")
    DestroyEntity("dbc_zonef_dynamic.PlaneTrigger 01")
    DestroyEntity("dbc_zonef_dynamic.SpatterRanged_Hard 03")
    if GetGlobal("DBC_ZoneF_DoorPuzzleCheck") == 0 then
      ForceSketched("dbc_zonef_static.DBC_ZoneF_Toon20 01")
      ForceSketched("dbc_zonef_static.DBC_ZoneF_Toon21 01")
      SetPropertyFloat("dbc_zonef_dynamic.PlaqueTrigger 05", "UsableRadius", 0)
      SetPropertyFloat("dbc_zonef_dynamic.PlaqueTrigger 06", "UsableRadius", 0)
      DBC_ZoneF_RightSideCheck1 = 0
      DBC_ZoneF_RightSideCheck2 = 0
    end
  end
  if GetGlobal("DBC_ZoneF_DoorPuzzleCheck") == 1 then
    SetGlobal("DBC_ZoneF_Chains", 0)
    DBC_ZoneF_WindowSmall = 1
    DBC_ZoneF_WindowLarge = 1
    ForEachEntityInGroup(Unhide, "DBC_ZoneF_Lightbeams")
    AnimGBSequence("dbc_zonef_dynamic.DBC_LightGemA1_Toon 01", "RestDown")
    DestroyEntity("dbc_zonef_dynamic.BoulderTrigger 01")
    AnimGBSequence("RollingBoulder", "RestBroken")
    ForEachEntityInGroup(SetRotatorMaxSpeed, "DBC_ZoneF_Gargoyles", 360)
    StartRotateToPosition("dbc_zonef_dynamic.DBC_GargoyleA1_Inert 01", 90)
    DBC_ZoneF_GarAngle1 = 90
    StartRotateToPosition("dbc_zonef_dynamic.DBC_GargoyleA1_Inert 02", 270)
    DBC_ZoneF_GarAngle2 = 270
    StartRotateToPosition("dbc_zonef_dynamic.DBC_GargoyleA1_Inert 03", 90)
    DBC_ZoneF_GarAngle3 = 90
    StartRotateToPosition("dbc_zonef_dynamic.DBC_GargoyleA1_Inert 04", 90)
    DBC_ZoneF_GarAngle4 = 90
    StartRotateToPosition("dbc_zonef_dynamic.DBC_GargoyleA1_Inert 05", 270)
    DBC_ZoneF_GarAngle5 = 270
    StartRotateToPosition("dbc_zonef_dynamic.DBC_GargoyleA1_Inert 06", 180)
    StartRotateToPosition("dbc_zonef_dynamic.DBC_GargoyleA1_Inert 07", 180)
    DBC_ZoneF_RightSideBase = 1
    DBC_ZoneF_LeftSideBase = 1
    DBC_ZoneF_RightSidePaintings = 4
    DBC_ZoneF_LeftSidePaintings = 4
    DBC_ZoneF_Gargoyle1 = 1
    DBC_ZoneF_Gargoyle2 = 3
    DBC_ZoneF_Gargoyle3 = 1
    DBC_ZoneF_Gargoyle4 = 1
    DBC_ZoneF_Gargoyle5 = 3
    DBC_ZoneF_RightSideCheck1 = 1
    DBC_ZoneF_RightSideCheck2 = 1
    DBC_ZoneF_RightSideCheck3 = 1
    DBC_ZoneF_RightSideCheck4 = 1
    DBC_ZoneF_LeftSideCheck1 = 1
    DBC_ZoneF_LeftSideCheck2 = 1
    DBC_ZoneF_LeftSideCheck3 = 1
    DBC_ZoneF_LeftSideCheck4 = 1
    DBC_ZoneF_WallMural = 2
    DBC_ZoneF_MuralCheck = 17
    ForEachEntityInGroup(ForcePainted, "DBC_ZoneF_ThinMe")
    ForEachEntityInGroup(ForcePainted, "DBC_ZoneF_PaintMe")
    ForEachEntityInGroup(SetPropertyFloat, "PlaqueTriggers", "UsableRadius", 2)
    FireThread(DBC_ZoneF_EnableBeams)
    DBC_ZoneF_DisableCheckpointSave = 1
    AnimGBSequence("dbc_zonef_dynamic.DBC_MuralRays 01", "Expand", true)
    DestroyEntity("dbc_zonef_dynamic.PlaneTrigger 01")
    DestroyEntity("dbc_zonef_dynamic.SpatterRanged_Hard 03")
    if GetGlobal("DBC_ZoneF_ChainsCheck") == 0 then
      ForcePainted("dbc_zonef_dynamic.DBC_LightGemA1_Toon 01")
      Unhide("dbc_zonef_dynamic.DBC_Lightbeam 06")
      ForEachEntityInGroup(Enable, "dbc_zonef_audio.Trigger_WindCracks")
      ForEachEntityInGroup(SetPropertyBool, "ChandelierToon", "Is Real", true)
      SetRotatorMaxSpeed("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 360)
      StartRotateToPosition("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 270)
    end
  else
  end
  wait(1)
  DBC_ZoneF_TempDisable = 0
end
DBC_ZoneF_LoadCheckpoint = L0_0
L0_0 = false
DBC_ZoneF_NoIntro = L0_0
function L0_0()
  if DBC_ZoneF_NoIntro == false then
    GetPrefabData("DBC_ZoneFStart").MapLoad_SetupPosition = "True"
    OnMapLoad_ProjectorSetup("DBC_ZoneFStart")
  end
end
DBC_ZoneF_Intro_Launcher = L0_0
function L0_0()
  if DBC_ZoneF_NoIntro == false then
    GuardianPrefab_PopulateGuardians("DBC_ZoneF_MickeyHead1")
    GuardianPrefab_PopulateGuardians("DBC_ZoneF_MickeyHead2")
    SetGlobal("MS_MeanStreetProgress", 6)
    SetMap(nil, "MAP_DBC_ZONEF", "GAME")
    StartTrackingCurrentLevelForScoring("DBC_V2_ThroneRoom")
    TeleportToEntity("dbc_zonef_dynamic.SpatterRanged_Hard 03", "dbc_zonef_dynamic.SpatterRanged_PositionMarker 01")
    ForEachEntityInGroup(Hide, "dbc_zonef_dynamic.DBC_Lightbeams")
    ForEachEntityInGroup(Enable, "dbc_zonef_audio.Trigger_WindCracks")
    FireSequence("dbc_zonef_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneF_Hint1")
    ForEachEntityInGroup(DisableComponent, "PaintHintMarkerGroup", "Guardian Hint Component")
    ForEachEntityInGroup(DisableComponent, "ThinnerHintMarkerGroup", "Guardian Hint Component")
    Wait(1)
    wait(1)
    ForEachEntityInGroup(SetPropertyBool, "ChandelierToon", "Is Real", true)
  end
end
DBC_ZoneF_IntroCutscene = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "DBC_ZoneF_LoadCheckpoint", "DBC_ZoneFStart")
  ShowHud()
end
DBC_ZoneF_IntroCam = L0_0
function L0_0()
  local L0_3, L1_4
end
DBC_ZoneF_IntroCamRelease = L0_0
function L0_0()
  SetCameraAttributes("dbc_zonef_dynamic.DropHoleCameraOverride 01")
  wait(0.5)
  ClearAllCameraAttributesTimed(1)
end
DBC_ZoneF_QuickFade = L0_0
function L0_0()
  DBC_ZoneF_WallMural = DBC_ZoneF_WallMural + 1
  if DBC_ZoneF_WallMural == 2 and DBC_ZoneF_TempDisable == 0 then
    RestrictCutSceneInput()
    StartFadeOut(0.8)
    wait(0.8)
    GrabCamera("dbc_zonef_dynamic.DoorCameraControlPoint 02", nil, CAMERA_LERP_TRANSITION, 0)
    StartFadeInNoHUD()
    wait(0.3)
    AnimGBSequence("dbc_zonef_dynamic.DBC_LightGemA1_Toon 01", "Drop", true)
    if gar1Correct == true and gar2Correct == true and gar3Correct == true and gar4Correct == true and gar5Correct == true and gar6Correct == true then
      Unhide("dbc_zonef_dynamic.DBC_Lightbeam 06")
    end
    AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ThroneRoom_Crystal_Reveal")
    wait(3)
    StartFadeOut(0.8)
    wait(0.8)
    CameraReset()
    StartFadeIn()
    UnrestrictCutSceneInput()
    wait(1)
    DBC_ZoneF_Hidebeams()
    DBC_ZoneF_OpenSun()
  end
end
DBC_ZoneF_WallAdd = L0_0
function L0_0()
  if DBC_ZoneF_WallMural == 2 then
    RestrictCutSceneInput()
    StartFadeOut(0.8)
    wait(0.8)
    GrabCamera("dbc_zonef_dynamic.DoorCameraControlPoint 02", nil, CAMERA_LERP_TRANSITION, 0)
    StartFadeInNoHUD()
    wait(0.3)
    Hide("dbc_zonef_dynamic.DBC_Lightbeam 06")
    AnimGBSequence("dbc_zonef_dynamic.DBC_LightGemA1_Toon 01", "Raise")
    wait(3)
    StartFadeOut(0.8)
    wait(0.8)
    CameraReset()
    StartFadeIn()
    UnrestrictCutSceneInput()
    wait(1)
    DBC_ZoneF_WallMural = DBC_ZoneF_WallMural - 1
    DBC_ZoneF_OpenSun()
    DBC_ZoneF_Hidebeams()
  else
    DBC_ZoneF_WallMural = DBC_ZoneF_WallMural - 1
  end
end
DBC_ZoneF_WallSub = L0_0
function L0_0(A0_5, A1_6)
  local L2_7, L3_8
  L2_7 = 0
  L3_8 = 0
  L2_7, L3_8 = Jigsaw_GetPercentagePainted(A0_5)
  if DBC_ZoneF_TempDisable == 0 then
    if L3_8 == 1 then
      _G[A1_6] = 1
      DBC_ZoneF_WallMural = DBC_ZoneF_WallMural + 1
      if DBC_ZoneF_MuralCheck == 17 and DBC_ZoneF_WindowLarge == 1 then
        if GetGlobal("DBC_ZoneF_ChainsCheck") == 0 then
          if GetGlobal("DBC_2nd_ZoneF_Hint5_Played") == 0 then
            RestrictCutSceneInput()
            PauseAllAI()
            StartFadeOut(0.8)
            wait(0.8)
            SetLetterbox(1)
            GrabCamera("dbc_zonef_dynamic.DoorCameraControlPoint 02", nil, CAMERA_LERP_TRANSITION, 0)
            StartFadeInNoHUD()
            wait(0.3)
            AnimGBSequence("dbc_zonef_dynamic.DBC_MuralRays 01", "Expand", true)
            AnimGBSequence("dbc_zonef_dynamic.DBC_LightGemA1_Toon 01", "Drop", true)
            if gar1Correct == true and gar2Correct == true and gar3Correct == true and gar4Correct == true and gar5Correct == true and gar6Correct == true then
              Unhide("dbc_zonef_dynamic.DBC_Lightbeam 06")
            end
            AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ThroneRoom_Crystal_Reveal")
            FireSequence("dbc_zonef_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneF_Hint5")
          else
            wait(0.3)
            AnimGBSequence("dbc_zonef_dynamic.DBC_MuralRays 01", "Expand", true)
            AnimGBSequence("dbc_zonef_dynamic.DBC_LightGemA1_Toon 01", "Drop", true)
            if gar1Correct == true and gar2Correct == true and gar3Correct == true and gar4Correct == true and gar5Correct == true and gar6Correct == true then
              Unhide("dbc_zonef_dynamic.DBC_Lightbeam 06")
            end
            AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ThroneRoom_Crystal_Reveal")
            wait(1)
            wait(0.8)
            wait(1)
            DBC_ZoneF_OpenSun()
          end
        else
          DBC_ZoneF_OpenSun()
        end
      end
    elseif L3_8 < 1 then
      if L2_7 == 1 then
        DBC_ZoneF_WallMural = DBC_ZoneF_WallMural - 1
      end
      if DBC_ZoneF_MuralCheck == 17 and DBC_ZoneF_WindowLarge == 1 then
        if GetGlobal("DBC_ZoneF_ChainsCheck") == 0 then
          if DBC_ZoneF_MuralTriggered == 0 then
            RestrictCutSceneInput()
            StartFadeOut(0.8)
            wait(0.8)
            SetLetterbox(1)
            GrabCamera("dbc_zonef_dynamic.DoorCameraControlPoint 02", nil, CAMERA_LERP_TRANSITION, 0)
            StartFadeInNoHUD()
          end
          wait(0.3)
          AnimGBSequence("dbc_zonef_dynamic.DBC_MuralRays 01", "Descend")
          Hide("dbc_zonef_dynamic.DBC_Lightbeam 06")
          AnimGBSequence("dbc_zonef_dynamic.DBC_LightGemA1_Toon 01", "Raise")
          wait(1.5)
          if DBC_ZoneF_MuralTriggered == 0 then
            StartFadeOut(0.8)
            wait(0.8)
            SetLetterbox(0)
            CameraReset()
            StartFadeIn()
            UnrestrictCutSceneInput()
          end
          DBC_ZoneF_MuralTriggered = 1
          wait(1)
        else
          AnimGBSequence("dbc_zonef_dynamic.DBC_MuralRays 01", "Descend")
        end
        DBC_ZoneF_OpenSun()
        DBC_ZoneF_Hidebeams()
      end
      _G[A1_6] = 0
    end
  end
end
DBC_ZoneF_WindowChanged = L0_0
function L0_0(A0_9, A1_10)
  if _G[A1_10] == 0 then
    _G[A1_10] = 1
  elseif _G[A1_10] == 1 then
    _G[A1_10] = 0
  end
  if DBC_ZoneF_TempDisable == 0 then
    DBC_ZoneF_Hidebeams()
    DBC_ZoneF_OpenSun()
  end
end
DBC_ZoneF_StateChangeGem = L0_0
function L0_0(A0_11, A1_12)
  if GetGlobal("DBC_ZoneF_ChainsCheck") == 0 then
    Wait(0.2)
    AnimGBSequence(A1_12, "Break")
    Wait(0.6)
    if GetGlobal("DBC_ZoneF_Chains") == 0 then
      FireSequence("dbc_zonef_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneF_Hint2")
    elseif GetGlobal("DBC_ZoneF_Chains") == 1 then
      FireSequence("dbc_zonef_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneF_Hint2")
    elseif GetGlobal("DBC_ZoneF_Chains") == 2 then
      FireSequence("dbc_zonef_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneF_Hint2")
    end
    if GetGlobal("DBC_ZoneF_Chains") == 3 then
      Enable("dbc_zonef_dynamic.BrokenThroneCamTrigger 01")
      ForEachEntityInGroup(DestroyEntity, "PaintHintMarkerGroup")
      FireSequence("dbc_zonef_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneF_Hint2")
    end
  end
end
DBC_ZoneF_ChainsChange = L0_0
function L0_0()
  FireUser1("cameraBreakDoor1")
  Rumble(GetPlayer(), 0.7)
  wait(0.7)
  AnimGBReset("dbc_zonef_dynamic.DBC_ZoneF_Chandelier_01 01")
  AnimGBSequence("dbc_zonef_dynamic.DBC_ZoneF_Chandelier_01 01", "Break")
  DestroyEntity("dbc_zonef.TreasureChestLargehealth 04")
  wait(1.4)
  ShakeCamera(2.5, 7.5, 0, 2, 0.05, 0.025)
  Rumble(GetPlayer(), 1.5)
end
TEST_ChainsBreak = L0_0
function L0_0(A0_13, A1_14, A2_15)
  _G[A1_14] = _G[A1_14] + 1
  if DBC_ZoneF_TempDisable == 0 then
    DBC_ZoneF_OpenDoor(A0_13, A1_14, A2_15)
  end
end
DBC_ZoneF_SmallMuralAdd = L0_0
function L0_0(A0_16, A1_17, A2_18)
  _G[A1_17] = _G[A1_17] - 1
  if DBC_ZoneF_TempDisable == 0 then
    DBC_ZoneF_OpenDoor(A0_16, A1_17, A2_18)
  end
end
DBC_ZoneF_SmallMuralSub = L0_0
function L0_0(A0_19, A1_20, A2_21, A3_22, A4_23)
  if _G[A3_22] == 1 then
    _G[A3_22] = 0
    DBC_ZoneF_SmallMuralSub(A0_19, A1_20, A2_21)
  end
end
DBC_ZoneF_MuralChange = L0_0
function L0_0(A0_24, A1_25, A2_26, A3_27, A4_28, A5_29)
  local L6_30, L7_31
  L6_30 = 0
  L7_31 = 0
  L6_30, L7_31 = Jigsaw_GetPercentagePainted(A0_24)
  if DBC_ZoneF_TempDisable == 0 then
    if L7_31 == 1 and A2_26 == "happy" then
      _G[A1_25] = 1
      if GetGlobal("DBC_ZoneF_ChainsCheck") == 0 then
        DestroyEntity(A5_29)
      end
      DBC_ZoneF_OpenDoor(A0_24, A1_25, A2_26, A3_27, A4_28)
    elseif L7_31 < 1 and A2_26 == "happy" then
      _G[A1_25] = 0
      DBC_ZoneF_OpenDoor(A0_24, A1_25, A2_26, A3_27, A4_28)
    elseif L7_31 == 1 and A2_26 == "sad" then
      _G[A1_25] = 1
      if GetGlobal("DBC_ZoneF_ChainsCheck") == 0 then
        DestroyEntity(A5_29)
      end
      DBC_ZoneF_OpenDoor(A0_24, A1_25, A2_26, A3_27, A4_28)
    elseif L7_31 < 1 and A2_26 == "sad" then
      _G[A1_25] = 0
      DBC_ZoneF_OpenDoor(A0_24, A1_25, A2_26, A3_27, A4_28)
    end
  end
end
DBC_ZoneF_PaintingChanged = L0_0
function L0_0(A0_32, A1_33, A2_34, A3_35, A4_36)
  DBC_ZoneF_Hidebeams()
  if A3_35 == "DBC_ZoneF_RightSideBase" and DBC_ZoneF_RightSideCheck1 == 1 and DBC_ZoneF_LeftSideCheck2 == 1 and DBC_ZoneF_RightSideCheck3 == 1 and DBC_ZoneF_LeftSideCheck4 == 1 then
    if GetGlobal("DBC_ZoneF_ChainsCheck") == 0 then
    end
    if GetGlobal("DBC_2nd_ZoneF_Hint3_Played") == 0 then
      DBC_ZoneF_TempDisable = 1
      FireUser1("cameraGargoyleRight")
      wait(1)
      FireSequence("dbc_zonef_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneF_Hint3")
      Rumble(GetPlayer(), 1.25)
      SetRotatorMaxSpeed(A4_36, 60)
      StartRotateToPosition(A4_36, 180)
      AudioPostEventOn(A4_36, "Play_sfx_dbc_ThroneRoom_Platform_Rotate_Start")
      _G[A3_35] = 1
      DBC_ZoneF_RightSidePaintings = 4
      DBC_ZoneF_RightGargTriggered1 = 1
    elseif DBC_ZoneF_RightGargTriggered1 == 0 then
      DBC_ZoneF_TempDisable = 1
      PauseAllAI()
      FireUser1("cameraGargoyleRight")
      wait(1)
      Rumble(GetPlayer(), 1.25)
      SetRotatorMaxSpeed(A4_36, 60)
      StartRotateToPosition(A4_36, 180)
      AudioPostEventOn(A4_36, "Play_sfx_dbc_ThroneRoom_Platform_Rotate_Start")
      _G[A3_35] = 1
      DBC_ZoneF_RightSidePaintings = 4
      Wait(3.5)
      UnpauseAllAI()
      DBC_ZoneF_RightGargTriggered1 = 1
    else
      wait(1)
      Rumble(GetPlayer(), 1.25)
      SetRotatorMaxSpeed(A4_36, 60)
      StartRotateToPosition(A4_36, 180)
      AudioPostEventOn(A4_36, "Play_sfx_dbc_ThroneRoom_Platform_Rotate_Start")
      _G[A3_35] = 1
      DBC_ZoneF_RightSidePaintings = 4
      Wait(3.5)
      UnpauseAllAI()
      DBC_ZoneF_RightGargTriggered1 = 1
      DBC_ZoneF_OpenSun()
    end
  elseif A3_35 == "DBC_ZoneF_LeftSideBase" and DBC_ZoneF_LeftSideCheck1 == 1 and DBC_ZoneF_RightSideCheck2 == 1 and DBC_ZoneF_LeftSideCheck3 == 1 and DBC_ZoneF_RightSideCheck4 == 1 then
    if GetGlobal("DBC_ZoneF_ChainsCheck") == 0 then
    end
    if GetGlobal("DBC_2nd_ZoneF_Hint3_Played") == 0 then
      DBC_ZoneF_TempDisable = 1
      FireUser1("cameraGargoyleLeft")
      wait(1)
      FireSequence("dbc_zonef_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneF_Hint3")
      Rumble(GetPlayer(), 1.25)
      SetRotatorMaxSpeed(A4_36, 60)
      StartRotateToPosition(A4_36, 180)
      AudioPostEventOn(A4_36, "Play_sfx_dbc_ThroneRoom_Platform_Rotate_Start")
      _G[A3_35] = 1
      DBC_ZoneF_LeftSidePaintings = 4
      DBC_ZoneF_LeftGargTriggered1 = 1
    elseif DBC_ZoneF_LeftGargTriggered1 == 0 then
      DBC_ZoneF_TempDisable = 1
      PauseAllAI()
      FireUser1("cameraGargoyleLeft")
      wait(1)
      Rumble(GetPlayer(), 1.25)
      SetRotatorMaxSpeed(A4_36, 60)
      StartRotateToPosition(A4_36, 180)
      AudioPostEventOn(A4_36, "Play_sfx_dbc_ThroneRoom_Platform_Rotate_Start")
      _G[A3_35] = 1
      DBC_ZoneF_LeftSidePaintings = 4
      Wait(3.5)
      UnpauseAllAI()
      DBC_ZoneF_LeftGargTriggered1 = 1
    else
      wait(1)
      Rumble(GetPlayer(), 1.25)
      SetRotatorMaxSpeed(A4_36, 60)
      StartRotateToPosition(A4_36, 180)
      AudioPostEventOn(A4_36, "Play_sfx_dbc_ThroneRoom_Platform_Rotate_Start")
      _G[A3_35] = 1
      DBC_ZoneF_LeftSidePaintings = 4
      Wait(3.5)
      UnpauseAllAI()
      DBC_ZoneF_LeftGargTriggered1 = 1
      DBC_ZoneF_OpenSun()
    end
  elseif _G[A3_35] == 1 then
    if GetGlobal("DBC_ZoneF_ChainsCheck") == 0 then
    end
    if A3_35 == "DBC_ZoneF_LeftSideBase" then
      if DBC_ZoneF_LeftGargTriggered2 == 0 then
        FireUser1("cameraGargoyleLeft")
        DBC_ZoneF_LeftGargTriggered2 = 1
        DBC_ZoneF_LeftSidePaintings = 0
      else
        DBC_ZoneF_LeftGargTriggered2 = 1
        DBC_ZoneF_LeftSidePaintings = 0
        DBC_ZoneF_OpenSun()
      end
    elseif A3_35 == "DBC_ZoneF_RightSideBase" then
      if DBC_ZoneF_RightGargTriggered2 == 0 then
        FireUser1("cameraGargoyleRight")
        DBC_ZoneF_RightGargTriggered2 = 1
        DBC_ZoneF_RightSidePaintings = 0
      else
        DBC_ZoneF_RightGargTriggered2 = 1
        DBC_ZoneF_RightSidePaintings = 0
        DBC_ZoneF_OpenSun()
      end
    end
    wait(1)
    SetRotatorMaxSpeed(A4_36, 60)
    StartRotateToPosition(A4_36, 0)
    AudioPostEventOn(A4_36, "Play_sfx_dbc_ThroneRoom_Platform_Rotate_Start")
    SetRotatorMaxSpeed("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 100)
    StartRotateToPosition("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 0)
    Rumble(GetPlayer(), 1.25)
    _G[A3_35] = 0
  end
end
DBC_ZoneF_OpenDoor = L0_0
function L0_0(A0_37, A1_38, A2_39, A3_40, A4_41)
  _G[A2_39] = _G[A2_39] + 90
  SetRotatorMaxSpeed(A0_37, 360)
  StartRotateToPosition(A0_37, _G[A2_39])
  if tonumber(A3_40) == 0 then
    Print("Nothing should happen here.")
  else
    _G[A4_41] = _G[A4_41] + 110
    SetRotatorMaxSpeed(A3_40, 420)
    StartRotateToPosition(A3_40, _G[A4_41])
  end
  if _G[A1_38] == 0 then
    _G[A1_38] = 1
    AudioPostEventOn(A0_37, "Play_sfx_dbc_ThroneRoom_Gargoyle_Rotate_Start")
  elseif _G[A1_38] == 1 then
    _G[A1_38] = 2
    AudioPostEventOn(A0_37, "Play_sfx_dbc_ThroneRoom_Gargoyle_Rotate_Start")
  elseif _G[A1_38] == 2 then
    _G[A1_38] = 3
    AudioPostEventOn(A0_37, "Play_sfx_dbc_ThroneRoom_Gargoyle_Rotate_Start")
  else
    _G[A1_38] = 0
    AudioPostEventOn(A0_37, "Play_sfx_dbc_ThroneRoom_Gargoyle_Rotate_Start")
  end
  DBC_ZoneF_Hidebeams()
  wait(0.25)
  AudioPostEventOn(A0_37, "Play_sfx_dbc_ThroneRoom_Gargoyle_Rotate_Stop")
  wait(0.25)
  DBC_ZoneF_OpenSun()
end
DBC_ZoneF_SpinGargoyle = L0_0
function L0_0()
  local L0_42, L1_43
end
DBC_ZoneF_Hidebeams = L0_0
function L0_0()
  if DBC_ZoneF_Gargoyle1 == 1 and DBC_ZoneF_LeftSidePaintings == 4 then
    if gar1Correct == false then
      gar1Correct = true
    end
    if gar2Correct == false then
      gar2Correct = true
      FireSequence("dbc_zonef_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneF_Hint4")
      AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 01", "Play_sfx_dbc_laser_lp01")
      AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 01", "Play_sfx_dbc_ThroneRoom_Gargoyle_Connect")
    end
    Unhide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 01")
    AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 01", "toggle", true)
    if DBC_ZoneF_Gargoyle2 == 3 and DBC_ZoneF_RightSidePaintings == 4 then
      if gar3Correct == false then
        gar3Correct = true
        AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 02", "Play_sfx_dbc_laser_lp02")
        AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 01", "Play_sfx_dbc_ThroneRoom_Gargoyle_Connect")
      end
      Unhide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 02")
      AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 02", "toggle", true)
      if DBC_ZoneF_Gargoyle3 == 1 then
        if gar4Correct == false then
          gar4Correct = true
          AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 03", "Play_sfx_dbc_laser_lp03")
          AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 01", "Play_sfx_dbc_ThroneRoom_Gargoyle_Connect")
        end
        Unhide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 03")
        AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 03", "toggle", true)
        Unhide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 03")
        AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 03", "toggle", true)
        if DBC_ZoneF_Gargoyle4 == 1 then
          if gar5Correct == false then
            gar5Correct = true
            AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 04", "Play_sfx_dbc_laser_lp04")
            AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 01", "Play_sfx_dbc_ThroneRoom_Gargoyle_Connect")
          end
          Unhide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 04")
          AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 04", "toggle", true)
          Unhide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 04")
          AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 04", "toggle", true)
          if DBC_ZoneF_Gargoyle5 == 3 then
            if gar6Correct == false then
              gar6Correct = true
              AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 05", "Play_sfx_dbc_laser_lp05")
              AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 01", "Play_sfx_dbc_ThroneRoom_Gargoyle_Connect")
            end
            Unhide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 05")
            AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 05", "toggle", true)
            Unhide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 05")
            AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 05", "toggle", true)
            if GetGlobal("DBC_ZoneF_ChainsCheck") == 0 and DBC_ZoneF_WallMural == 2 then
              Wait(0.3)
              if DBC_ZoneF_DisableMuralCutscene == 0 then
                DBC_ZoneF_DisableMuralCutscene = 1
                if DBC_ZoneF_DoorTriggered == 0 then
                  PauseAllAI()
                  StartFadeOut(0.8)
                  Wait(0.8)
                  RestrictCutSceneInput()
                  SetLetterbox(1)
                  GrabCamera("dbc_zonef_dynamic.DoorCameraControlPoint 02", "dbc_zonef_dynamic.DBC_MuralA2_Toon 01", CAMERA_LERP_TRANSITION, 0)
                  StartFadeInNoHUD(0.8)
                end
                Wait(0.8)
                Unhide("dbc_zonef_dynamic.DBC_Lightbeam 06")
                ForEachEntityInGroup(Unhide, "dbc_zonef_dynamic.DBC_LightBeams")
                AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 06", "Play_sfx_dbc_laser_lp06")
                AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 01", "Play_sfx_dbc_ThroneRoom_Gargoyle_Connect")
                Wait(0.5)
                ForEachEntityInGroup(DestroyEntity, "ThinnerHintMarkerGroup")
                SetRotatorMaxSpeed("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 10)
                StartRotateToPosition("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 270)
                AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ThroneRoom_Open_SunDoor")
                ShakeCamera_Default("camera")
                Rumble(GetPlayer(), 2.25)
                wait(3.5)
                if DBC_ZoneF_DoorTriggered == 0 then
                  StartFadeOut(0.8)
                  Wait(0.8)
                  CameraReset()
                  StartFadeIn(0.8)
                  UnrestrictCutSceneInput()
                  UnpauseAllAI()
                end
                DBC_ZoneF_DisableMuralCutscene = 0
                DBC_ZoneF_DoorTriggered = 1
                SetGlobal("DBC_ZoneF_DoorPuzzleCheck", 1)
                if DBC_ZoneF_DisableCheckpointSave == 0 then
                  DBC_ZoneF_DisableCheckpointSave = 1
                  SaveCheckpoint(GetPlayer(), "DBC_ZoneF_LoadCheckpoint", "DBC_ZoneFStart")
                end
              end
            else
              SetRotatorMaxSpeed("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 100)
              StartRotateToPosition("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 0)
              AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 01", "Stop_sfx_dbc_laser_lp05")
              gar6Correct = false
              AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 06", "Stop_sfx_dbc_laser_lp06")
              Hide("dbc_zonef_dynamic.DBC_Lightbeam 06")
            end
          else
            SetRotatorMaxSpeed("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 100)
            StartRotateToPosition("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 0)
            AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 01", "Stop_sfx_dbc_laser_lp04")
            gar5Correct = false
            AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 05", "Stop_sfx_dbc_laser_lp05")
            gar6Correct = false
            AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 06", "Stop_sfx_dbc_laser_lp06")
            Hide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 05")
            AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 05", "off")
            Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 05")
            AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 05", "off")
            Hide("dbc_zonef_dynamic.DBC_Lightbeam 05")
            Hide("dbc_zonef_dynamic.DBC_Lightbeam 06")
          end
        else
          SetRotatorMaxSpeed("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 100)
          StartRotateToPosition("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 0)
          AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 01", "Stop_sfx_dbc_laser_lp03")
          gar4Correct = false
          AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 04", "Stop_sfx_dbc_laser_lp04")
          gar5Correct = false
          AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 05", "Stop_sfx_dbc_laser_lp05")
          gar6Correct = false
          AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 06", "Stop_sfx_dbc_laser_lp06")
          Hide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 04")
          AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 04", "off")
          Hide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 05")
          AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 05", "off")
          Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 04")
          Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 05")
          AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 04", "off")
          AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 05", "off")
          Hide("dbc_zonef_dynamic.DBC_Lightbeam 04")
          Hide("dbc_zonef_dynamic.DBC_Lightbeam 05")
          Hide("dbc_zonef_dynamic.DBC_Lightbeam 06")
        end
      else
        SetRotatorMaxSpeed("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 100)
        StartRotateToPosition("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 0)
        AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 01", "Stop_sfx_dbc_laser_lp02")
        gar3Correct = false
        AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 03", "Stop_sfx_dbc_laser_lp03")
        gar4Correct = false
        AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 04", "Stop_sfx_dbc_laser_lp04")
        gar5Correct = false
        AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 05", "Stop_sfx_dbc_laser_lp05")
        gar6Correct = false
        AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 06", "Stop_sfx_dbc_laser_lp06")
        Hide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 03")
        AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 03", "off")
        Hide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 04")
        AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 04", "off")
        Hide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 05")
        AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 05", "off")
        Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 03")
        Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 04")
        Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 05")
        AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 03", "off")
        AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 04", "off")
        AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 05", "off")
        Hide("dbc_zonef_dynamic.DBC_Lightbeam 03")
        Hide("dbc_zonef_dynamic.DBC_Lightbeam 04")
        Hide("dbc_zonef_dynamic.DBC_Lightbeam 05")
        Hide("dbc_zonef_dynamic.DBC_Lightbeam 06")
      end
    else
      SetRotatorMaxSpeed("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 100)
      StartRotateToPosition("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 0)
      AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 01", "Stop_sfx_dbc_laser_lp01")
      gar2Correct = false
      AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 02", "Stop_sfx_dbc_laser_lp02")
      gar3Correct = false
      AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 03", "Stop_sfx_dbc_laser_lp03")
      gar4Correct = false
      AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 04", "Stop_sfx_dbc_laser_lp04")
      gar5Correct = false
      AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 05", "Stop_sfx_dbc_laser_lp05")
      gar6Correct = false
      AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 06", "Stop_sfx_dbc_laser_lp06")
      Hide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 03")
      AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 03", "off")
      Hide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 04")
      AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 04", "off")
      Hide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 05")
      AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 05", "off")
      Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 02")
      Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 03")
      Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 04")
      Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 05")
      AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 02", "off")
      AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 03", "off")
      AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 04", "off")
      AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 05", "off")
      Hide("dbc_zonef_dynamic.DBC_Lightbeam 02")
      Hide("dbc_zonef_dynamic.DBC_Lightbeam 03")
      Hide("dbc_zonef_dynamic.DBC_Lightbeam 04")
      Hide("dbc_zonef_dynamic.DBC_Lightbeam 05")
      Hide("dbc_zonef_dynamic.DBC_Lightbeam 06")
    end
  else
    SetRotatorMaxSpeed("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 100)
    StartRotateToPosition("dbc_zonef_dynamic.DBC_ZoneF_Inert02 01", 0)
    gar1Correct = false
    AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 01", "Stop_sfx_dbc_laser_lp01")
    gar2Correct = false
    AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 02", "Stop_sfx_dbc_laser_lp02")
    gar3Correct = false
    AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 03", "Stop_sfx_dbc_laser_lp03")
    gar4Correct = false
    AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 04", "Stop_sfx_dbc_laser_lp04")
    gar5Correct = false
    AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 05", "Stop_sfx_dbc_laser_lp05")
    gar6Correct = false
    AudioPostEventOn("dbc_zonef_dynamic.DBC_Lightbeam 06", "Stop_sfx_dbc_laser_lp06")
    Hide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 03")
    AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 03", "off")
    Hide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 04")
    AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 04", "off")
    Hide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 05")
    AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 05", "off")
    Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 01")
    Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 02")
    Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 03")
    Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 04")
    Hide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 05")
    AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 01", "off")
    AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 02", "off")
    AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 03", "off")
    AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 04", "off")
    AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 05", "off")
    Hide("dbc_zonef_dynamic.DBC_Lightbeam 01")
    Hide("dbc_zonef_dynamic.DBC_Lightbeam 02")
    Hide("dbc_zonef_dynamic.DBC_Lightbeam 03")
    Hide("dbc_zonef_dynamic.DBC_Lightbeam 04")
    Hide("dbc_zonef_dynamic.DBC_Lightbeam 05")
    Hide("dbc_zonef_dynamic.DBC_Lightbeam 06")
  end
end
DBC_ZoneF_OpenSun = L0_0
function L0_0(A0_44, A1_45)
  if GetGlobal(A1_45) == 1 then
    DestroyEntity(A0_44)
  end
end
DBC_ZoneF_ItemCheck = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneF_ChainsCheck") == 0 and GetGlobal("DBC_ZoneF_DoorPuzzleCheck") == 0 then
    ForEachEntityInGroup(Enable, "dbc_zonef_dynamic.SpatterSpawner 02")
  end
end
DBC_ZoneF_SpawnSpatters = L0_0
function L0_0(A0_46, A1_47)
  local L2_48, L3_49
  L2_48 = 0
  L3_49 = 0
  L2_48, L3_49 = Jigsaw_GetPercentagePainted(A0_46)
  if L2_48 == 1 then
    SetPropertyFloat(A1_47, "UsableRadius", 0)
  end
end
DBC_ZoneF_TextDeactivate = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("DBC_V2_ThroneRoom")
end
DBC_ZoneF_StopTracking = L0_0
function L0_0()
  if DBC_ZoneF_TempDisable == 0 then
    DBC_ZoneF_MuralCheck = DBC_ZoneF_MuralCheck + 1
    if DBC_ZoneF_MuralCheck == 17 then
      DBC_ZoneF_WallMural = DBC_ZoneF_WallMural + 1
      if DBC_ZoneF_WindowLarge == 1 then
        if GetGlobal("DBC_ZoneF_ChainsCheck") == 0 then
          if GetGlobal("DBC_2nd_ZoneF_Hint5_Played") == 0 then
            RestrictCutSceneInput()
            PauseAllAI()
            StartFadeOut(0.8)
            wait(0.8)
            SetLetterbox(1)
            GrabCamera("dbc_zonef_dynamic.DoorCameraControlPoint 02", nil, CAMERA_LERP_TRANSITION, 0)
            StartFadeInNoHUD()
            wait(0.3)
            AnimGBSequence("dbc_zonef_dynamic.DBC_MuralRays 01", "Expand", true)
            AnimGBSequence("dbc_zonef_dynamic.DBC_LightGemA1_Toon 01", "Drop", true)
            if gar1Correct == true and gar2Correct == true and gar3Correct == true and gar4Correct == true and gar5Correct == true and gar6Correct == true then
              Unhide("dbc_zonef_dynamic.DBC_Lightbeam 06")
            end
            AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ThroneRoom_Crystal_Reveal")
            FireSequence("dbc_zonef_dynamic.GusHintMarker(Conversation) 01", "DBC_2nd_ZoneF_Hint5")
          else
            wait(0.3)
            AnimGBSequence("dbc_zonef_dynamic.DBC_MuralRays 01", "Expand", true)
            AnimGBSequence("dbc_zonef_dynamic.DBC_LightGemA1_Toon 01", "Drop", true)
            if gar1Correct == true and gar2Correct == true and gar3Correct == true and gar4Correct == true and gar5Correct == true and gar6Correct == true then
              Unhide("dbc_zonef_dynamic.DBC_Lightbeam 06")
            end
            AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ThroneRoom_Crystal_Reveal")
            wait(1)
            wait(0.8)
            wait(1)
            DBC_ZoneF_OpenSun()
          end
        else
          DBC_ZoneF_OpenSun()
        end
      end
    end
  end
end
DBC_ZoneF_PaintMural = L0_0
function L0_0()
  if DBC_ZoneF_TempDisable == 0 then
    DBC_ZoneF_MuralCheck = DBC_ZoneF_MuralCheck - 1
    if DBC_ZoneF_MuralCheck == 16 then
      DBC_ZoneF_WallMural = DBC_ZoneF_WallMural - 1
      if DBC_ZoneF_WindowLarge == 1 then
        if GetGlobal("DBC_ZoneF_ChainsCheck") == 0 then
          if DBC_ZoneF_MuralTriggered == 0 then
            RestrictCutSceneInput()
            StartFadeOut(0.8)
            wait(0.8)
            SetLetterbox(1)
            GrabCamera("dbc_zonef_dynamic.DoorCameraControlPoint 02", nil, CAMERA_LERP_TRANSITION, 0)
            StartFadeInNoHUD()
          end
          wait(0.3)
          AnimGBSequence("dbc_zonef_dynamic.DBC_MuralRays 01", "Descend")
          Hide("dbc_zonef_dynamic.DBC_Lightbeam 06")
          AnimGBSequence("dbc_zonef_dynamic.DBC_LightGemA1_Toon 01", "Raise")
          wait(1.5)
          if DBC_ZoneF_MuralTriggered == 0 then
            StartFadeOut(0.8)
            wait(0.8)
            SetLetterbox(0)
            CameraReset()
            StartFadeIn()
            UnrestrictCutSceneInput()
          end
          DBC_ZoneF_MuralTriggered = 1
          wait(1)
        else
          AnimGBSequence("dbc_zonef_dynamic.DBC_MuralRays 01", "Descend")
        end
        DBC_ZoneF_OpenSun()
        DBC_ZoneF_Hidebeams()
      end
    end
  end
end
DBC_ZoneF_ThinMural = L0_0
function L0_0()
  Wait(1.4)
  SaveCheckpoint(GetPlayer(), "DBC_ZoneF_LoadCheckpoint", "DBC_ZoneFStart")
end
DBC_ZoneF_PinCollect = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneF_Chains") == 0 then
    AnimGBReset("dbc_zonef_dynamic.DBC_ZoneF_Chandelier_01 01")
    AnimGBSequence("dbc_zonef_dynamic.DBC_ZoneF_Chandelier_01 01", "Fall")
    wait(1.25)
  else
    AudioPostEventOn(GetPlayer(), "Play_sfx_dbc_ThroneRoom_Chandelier_Fall")
  end
  ShakeCamera(2.5, 7.5, 0, 2, 0.05, 0.025)
  Rumble(GetPlayer(), 0.5)
  StartEmitters("Dust3")
  Wait(0.2)
  StartEmitters("Dust2")
  Wait(0.3)
  ForEachEntityInGroup(StopEmitters, "AllDust")
end
DBC_ZoneF_BreakChain = L0_0
function L0_0()
  Rumble(GetPlayer(), 0.7)
  Hide("dbc_zonef_dynamic.DBC_Lightbeam 06")
  wait(0.7)
  AnimGBSequence("dbc_zonef_dynamic.DBC_ZoneF_Chandelier_01 01", "Break")
  AnimGBSequence("dbc_zonef_dynamic.DBC_ZoneF_Throne 01", "Break")
  DestroyEntity("dbc_zonef.TreasureChestLargehealth 04")
  wait(0.3)
  SetGlobal("DBC_ZoneF_ChainsCheck", 1)
  wait(1.1)
  DestroyEntity("dbc_zonef_dynamic.DBC_LightGemA1_Toon 01")
  ShakeCamera(2.5, 7.5, 0, 2, 0.05, 0.025)
  Rumble(GetPlayer(), 1.5)
end
DBC_ZoneF_BreakChandelier = L0_0
function L0_0(A0_50)
  if GetGlobal(DBC_ZoneF_ChainsCheck) == 0 then
    Hide(A0_50)
  end
end
DBC_ZoneF_SketchChain = L0_0
function L0_0(A0_51, A1_52)
  AudioPostEventOn(A0_51, "Play_sfx_dbc_ThroneRoom_Gargoyle_Rotate_Start")
  _G[A1_52] = _G[A1_52] + 110
  SetRotatorMaxSpeed(A0_51, 420)
  StartRotateToPosition(A0_51, _G[A1_52])
  Wait(0.25)
  AudioPostEventOn(A0_51, "Play_sfx_dbc_ThroneRoom_Gargoyle_Rotate_Stop")
end
DBC_ZoneF_SpinGear = L0_0
function L0_0()
  RestrictCutSceneInput()
  StartFadeOut(0.4)
  Wait(0.6)
  SetLetterbox(1)
  StartFadeInNoHUD(0.4)
  GrabCamera("dbc_zonef_dynamic.BoulderCameraControlPoint 01", nil, CAMERA_LERP_TRANSITION, 0.75)
  Wait(1)
  AnimGBSequence("RollingBoulder", "Ballroll", true, 10)
  StartEmitters("Dust1")
  Rumble(nil, 1)
  ShakeCamera(6, 10, 0, 20, 0.025, 0.025)
  Wait(0.3)
  StopEmitters("Dust1")
  Wait(0.8)
  StartFadeOut(0.4)
  Wait(0.4)
  SetLetterbox(0)
  StartFadeIn(0.4)
  ShowHud()
  UnrestrictCutSceneInput()
  SetCameraAttributes("dbc_zonef_dynamic.SplineCameraMarker 03")
  Wait(2)
  Rumble(nil, 1)
  ShakeCamera(6, 10, 0, 20, 0.025, 0.025)
end
DBC_ZoneF_BoulderRoll = L0_0
function L0_0()
  Wait(2)
  SaveCheckpoint(GetPlayer(), "DBC_ZoneF_LoadCheckpoint", "DBC_ZoneFStart")
end
DBC_ZoneF_ConceptArtSave = L0_0
function L0_0()
  ForEachEntityInGroup(SetPropertyBool, "DBC_ZoneF_MuralPieces", "Is Real", true)
end
DBC_ZoneF_EnablePaintExit = L0_0
function L0_0()
  ForEachEntityInGroup(SetPropertyBool, "DBC_ZoneF_MuralPieces", "Is Real", false)
end
DBC_ZoneF_DisablePaintExit = L0_0
function L0_0(A0_53, A1_54)
  DestroyEntity(A1_54)
end
DBC_ZoneF_DisableThinnerGuardian = L0_0
function L0_0()
  if DBC_ZoneF_MuralCheck == 17 and DBC_ZoneF_WindowLarge == 1 then
    Print("The gem should be down.")
  else
    DestroyEntity("dbc_zonef_dynamic.DBC_LightGemA1_Toon 01")
  end
end
DBC_ZoneF_DestroyCrystalCheck = L0_0
function L0_0()
  GrabCamera("dbc_zonef_dynamic.BrokenThrone_CameraControlPoint 01", nil, CAMERA_LERP_TRANSITION, 1.6)
end
DBC_ZoneF_GrabThroneCam = L0_0
function L0_0(A0_55, A1_56, A2_57)
  AnimGBSequence(A1_56, "on")
  Unhide(A2_57)
end
DBC_ZoneF_BeamChargeUp = L0_0
function L0_0(A0_58, A1_59)
  AnimGBSequence(A1_59, "on")
end
DBC_ZoneF_MouthChargeUp = L0_0
function L0_0()
  wait(1)
  ShakeCamera(2.5, 7.5, 0, 2, 0.05, 0.025)
  Rumble(GetPlayer(), 2.25)
end
DBC_ZoneF_LoadCheckpointRumble = L0_0
function L0_0()
  ForEachEntityInGroup(EnableComponent, "PaintHintMarkerGroup", "Guardian Hint Component")
  ForEachEntityInGroup(EnableComponent, "ThinnerHintMarkerGroup", "Guardian Hint Component")
  DBC_ZoneF_DefeatSlobberSave()
end
DBC_ZoneF_EnableAllGuardiansDeath = L0_0
function L0_0(A0_60)
  if GetCurrentTeam(A0_60) == 2 then
    ForEachEntityInGroup(DisableComponent, "PaintHintMarkerGroup", "Guardian Hint Component")
    ForEachEntityInGroup(DisableComponent, "ThinnerHintMarkerGroup", "Guardian Hint Component")
  elseif GetCurrentTeam(A0_60) == 3 then
    ForEachEntityInGroup(EnableComponent, "PaintHintMarkerGroup", "Guardian Hint Component")
    ForEachEntityInGroup(EnableComponent, "ThinnerHintMarkerGroup", "Guardian Hint Component")
    if GetGlobal("DBC_ZoneF_SlobberDefeated") == 0 then
      DBC_ZoneF_DefeatSlobberSave()
    end
  end
end
DBC_ZoneF_EnableAllGuardiansFriend = L0_0
function L0_0()
  SetGlobal("DBC_ZoneF_SlobberDefeated", 1)
  SaveCheckpoint(GetPlayer(), "DBC_ZoneF_LoadCheckpoint", "DBC_ZoneFStart")
end
DBC_ZoneF_DefeatSlobberSave = L0_0
function L0_0(A0_61, A1_62)
  if GetCurrentTeam(A0_61) == 2 then
    if DBC_ZoneF_SweeperFriends == 2 then
      SetGlobal("DBC_ZoneF_FriendlySweepers", 0)
    end
    _G[A1_62] = _G[A1_62] - 1
  elseif GetCurrentTeam(A0_61) == 3 then
    _G[A1_62] = _G[A1_62] + 1
    if DBC_ZoneF_SweeperFriends == 2 then
      SetGlobal("DBC_ZoneF_FriendlySweepers", 1)
    end
  end
end
DBC_ZoneF_SweeperTeamChange = L0_0
function L0_0()
  Wait(0.2)
  Unhide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 01")
  Unhide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 02")
  Unhide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 03")
  Unhide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 04")
  Unhide("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 05")
  Unhide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 03")
  Unhide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 04")
  Unhide("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 05")
  AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 03", "toggle", true)
  AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 04", "toggle", true)
  AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC2_Inert1_GloMouth 05", "toggle", true)
  AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 01", "toggle", true)
  AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 02", "toggle", true)
  AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 03", "toggle", true)
  AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 04", "toggle", true)
  AnimGBSequence("dbc_zonef_dynamic.DBC_GargoyleC1_Toon_GloEyes 05", "toggle", true)
end
DBC_ZoneF_EnableBeams = L0_0
function L0_0()
  if DBC_ZoneF_LeftSideCheck1 == 1 and DBC_ZoneF_RightSideCheck2 == 1 and DBC_ZoneF_LeftSideCheck3 == 1 and DBC_ZoneF_RightSideCheck4 == 1 then
    ForEachEntityInGroup(ForcePainted, "DBC_ZoneF_SadPaintings")
    DBC_ZoneF_TempDisable = 0
  end
  DBC_ZoneF_OpenSun()
end
DBC_ZoneF_ReleaseGargoyleCamLeft = L0_0
function L0_0()
  if DBC_ZoneF_RightSideCheck1 == 1 and DBC_ZoneF_LeftSideCheck2 == 1 and DBC_ZoneF_RightSideCheck3 == 1 and DBC_ZoneF_LeftSideCheck4 == 1 then
    ForEachEntityInGroup(ForcePainted, "DBC_ZoneF_HappyPaintings")
    DBC_ZoneF_TempDisable = 0
  end
  DBC_ZoneF_OpenSun()
end
DBC_ZoneF_ReleaseGargoyleCamRight = L0_0
