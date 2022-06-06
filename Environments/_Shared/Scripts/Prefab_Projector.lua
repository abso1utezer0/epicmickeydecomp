local L0_0, L1_1
function L0_0(A0_2)
  if GetPrefabData(A0_2).Film_Position == "Left" and GetGlobal("2dDirection") == 1 or GetPrefabData(A0_2).Film_Position == "Right" and GetGlobal("2dDirection") == 0 then
    Hide(GetRelativePrefabEntity(A0_2, ".ExitProjectorStand"))
  end
  if true == false then
    if GetPrefabData(A0_2).ActiveSequence == "None" or GetPrefabData(A0_2).StartsInactive == "True" then
      Prefab_Projector_ChangeState(A0_2, "Deactivate")
    elseif GetPrefabData(A0_2).StartsInactive == "False" then
      Prefab_Projector_ChangeState(A0_2, "Activate")
    elseif GetPrefabData(A0_2).StartsInactive == "TrueHidden" then
      Prefab_Projector_ChangeState(A0_2, "Deactive_Hidden")
    end
  end
  if Projector_2D_Checkpoint_Loaded == true then
    if GetPrefabData(A0_2).Film_Position == "Left" and GetGlobal("2dDirection") == 1 then
    else
    end
    if GetPrefabData(A0_2).ZoneCamOverrideName == "None" then
    elseif true == true then
      GetPrefabData(A0_2).MapLoad_SetupPosition = "True"
      OnMapLoad_ProjectorSetup(A0_2)
    end
  end
end
SetupProjector = L0_0
function L0_0(A0_3, A1_4)
  local L2_5, L3_6, L4_7
  L2_5 = GetPrefabData
  L3_6 = A0_3
  L2_5 = L2_5(L3_6)
  L3_6 = GetRelativePrefabEntity
  L4_7 = A0_3
  L3_6 = L3_6(L4_7, ".ExitProjectorStand")
  L4_7 = GetRelativePrefabEntity
  L4_7 = L4_7(A0_3, ".SpawnerPortalWarpFX")
  Print("************************************* - Prefab_Projector_ChangeState:  " .. L2_5.ActiveSequence .. "_" .. A1_4)
  if A1_4 == "Activate" then
    if L2_5.StartsInactive == "TrueHidden" then
      Unhide(L3_6)
    end
    L2_5.StartsInactive = "False"
    SetPropertyFloat(L3_6, "UsableRadius", 3.5)
    AudioPostEventOn(GetRelativePrefabEntity(A0_3, ".ExitProjectorScreen_Active"), "Play_sfx_projector_portal")
    DestroyEntity(L2_5.ActiveSequence .. "_Deactive")
    SetPropertyString(L4_7, "Spawn Group", L2_5.ActiveSequence .. "_Active", 0)
    SetPropertyInt(L4_7, "Index To Spawn", 1, 0)
  elseif A1_4 == "Deactivate" or A1_4 == "Deactive_Hidden" then
    if A1_4 == "Deactivate" then
      L2_5.StartsInactive = "True"
      SetPropertyString(L4_7, "Spawn Group", L2_5.ActiveSequence .. "_Deactive", 0)
      SetPropertyInt(L4_7, "Index To Spawn", 2, 0)
    elseif A1_4 == "Deactive_Hidden" then
      Hide(L3_6)
    end
    SetPropertyFloat(L3_6, "UsableRadius", 0)
    AudioPostEventOn(GetRelativePrefabEntity(A0_3, ".ExitProjectorScreen_Active"), "Stop_sfx_projector_portal")
    DestroyEntity(L2_5.ActiveSequence .. "_Active")
  end
  if A1_4 == "Deactive_Hidden" then
  else
    Enable(L4_7)
  end
  Print("************************************* - Prefab_Projector_ChangeState:  " .. L2_5.ActiveSequence .. "_" .. A1_4 .. " END")
end
Prefab_Projector_ChangeState = L0_0
L0_0 = false
Projector_2D_Checkpoint_Loaded = L0_0
function L0_0(A0_8)
  if GetGlobal("PlayerFirstTimeInZone") == 1 then
    Print("SetupPosition_MapLoad - Start *** called from ActiveSequence: " .. GetPrefabData(A0_8).ActiveSequence)
    if GetPrefabData(A0_8).MapLoad_SetupPosition == "True" then
      Print("SetupPosition_MapLoad - RestrictCutSceneInput *** called from ActiveSequence: " .. GetPrefabData(A0_8).ActiveSequence)
      SetGlobal("PlayerFirstTimeInZone", 0)
      GetPrefabData(A0_8).MapLoad_SetupPosition = "False"
      StartFadeOut(0)
      RestrictCutSceneInput()
      Wait(0)
      Wait(0)
      if GetPrefabData(A0_8).Film_Position == "None" then
        if Projector_2D_Checkpoint_Loaded == false then
          TeleportToEntity(GetPlayer(), GetRelativePrefabEntity(A0_8, ".ExitProjectorMarker"))
        end
      else
        Enable2DSetup()
        if GetPrefabData(A0_8).ZoneCamOverrideName == "None" then
          SetPropertyEntity(GetRelativePrefabEntity(A0_8, ".CameraSettings"), "ControlPointEntity", nil)
          SetPropertyInt(GetRelativePrefabEntity(A0_8, ".CameraSettings"), "SideScrollActive", 0)
        else
          SetCameraAttributes(GetPrefabData(A0_8).ZoneCamOverrideName)
        end
        if GetPrefabData(A0_8).Film_Position == "Left" and GetGlobal("2dDirection") == 1 then
          TeleportToEntity(GetPlayer(), GetRelativePrefabEntity(A0_8, ".StartPositionLeft"))
        elseif GetPrefabData(A0_8).Film_Position == "Right" and GetGlobal("2dDirection") == 0 then
          TeleportToEntity(GetPlayer(), GetRelativePrefabEntity(A0_8, ".StartPositionRight"))
        end
      end
      DisableGuardianSystem()
      FireUser1(GetRelativePrefabEntity(A0_8, ".ExitProjectorMarker"))
    end
  end
end
OnMapLoad_ProjectorSetup = L0_0
function L0_0(A0_9)
  if GetPrefabData(A0_9).ActiveSequence == "None" or GetPrefabData(A0_9).StartsInactive == "True" then
    Print("data.ActiveSequence == None or data.StartsInactive == True")
  elseif GetPrefabData(A0_9).StartsInactive == "False" then
    Print("data.StartsInactive == False")
    FireSequence(GetRelativePrefabEntity(A0_9, ".ConversationMarker"), GetPrefabData(A0_9).ActiveSequence)
  end
end
ProjectorInactiveCheck = L0_0
L0_0 = false
Activate_Scene_Because_Of_Audio = L0_0
L0_0 = false
Load_Audio_Interior = L0_0
L0_0 = false
Mickey_Projector_Enter_Activated = L0_0
L0_0 = false
Mickey_Projector_Enter_Activated_2 = L0_0
L0_0 = ""
TeleportToMarker_Data_Temp = L0_0
L0_0 = ""
ActiveSequence_Data_Temp = L0_0
function L0_0()
  local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15
  L0_10 = _self
  L0_10 = L0_10()
  L1_11 = GetPrefabData
  L2_12 = L0_10
  L1_11 = L1_11(L2_12)
  L2_12 = L1_11.TeleportToMarker
  TeleportToMarker_Data_Temp = L2_12
  L2_12 = L1_11.ActiveSequence
  ActiveSequence_Data_Temp = L2_12
  L2_12 = Print
  L3_13 = "Mickey_Projector_Enter - Start *** called from ActiveSequence: "
  L4_14 = L1_11.ActiveSequence
  L3_13 = L3_13 .. L4_14
  L2_12(L3_13)
  L2_12 = GetRelativePrefabEntity
  L3_13 = L0_10
  L4_14 = ".EnterProjectorCamera"
  L2_12 = L2_12(L3_13, L4_14)
  L3_13 = GetRelativePrefabEntity
  L4_14 = L0_10
  L5_15 = ".EnterProjectorMarker"
  L3_13 = L3_13(L4_14, L5_15)
  L4_14 = GetRelativePrefabEntity
  L5_15 = L0_10
  L4_14 = L4_14(L5_15, ".ExitProjectorStand")
  L5_15 = GetRelativePrefabEntity
  L5_15 = L5_15(L0_10, ".SpawnerPortalWarpFX")
  Mickey_Projector_Enter_Activated = true
  Mickey_Projector_Enter_Activated_2 = true
  if L1_11.Interior_Stream == "None" then
  elseif L1_11.Interior_Stream ~= "None" and (L1_11.Film_Position == "Left" or L1_11.Film_Position == "Right") then
    Load_Audio_Interior = L1_11.Interior_Stream
    Activate_Scene_Because_Of_Audio = L1_11.SceneToActivate
  else
    Print("Begin 2D Transition Load *** called from ActiveSequence: " .. L1_11.ActiveSequence)
    StreamInterior(nil, L1_11.Interior_Stream)
  end
  PauseAllAI()
  SetPropertyFloat(L4_14, "UsableRadius", 0)
  AnimGBSetIdle(L2_12, false)
  RestrictCutSceneInput()
  StartFadeOut(1)
  wait(0)
  wait(1)
  DisableGuardianSystem()
  TeleportToEntity(GetPlayer(), L3_13)
  GrabCameraNif(L2_12, nil, CAMERA_LERP_TRANSITION, 0)
  AnimGBReset(L2_12)
  AnimGBSequence(L2_12, "mickey_idle_paint_acquireItem_chest_cam")
  StartFadeInNoHUD()
  wait(0.01)
  SetDrawSilhouettes(false)
  AnimEvent(GetPlayer(), EVENT_Special_0)
  SetPropertyInt(L5_15, "Index To Spawn", 0, 0)
  wait(3)
  AudioPostEventOn(GetPlayer(), "Stop_All_Sounds")
  ForceSpawn(L5_15, 1)
  StartFadeOut(1)
  wait(1.25)
  AudioPostEventOn(GetRelativePrefabEntity(L0_10, ".ExitProjectorScreen_Active"), "Stop_sfx_projector_portal")
  DisableMotion_Player(GetPlayer())
  if Load_Audio_Interior ~= false then
    Print("Begin 3D Transition Load - Loading Audio Banks *** called from ActiveSequence: " .. L1_11.ActiveSequence)
    StreamInterior(nil, Load_Audio_Interior)
    Load_Audio_Interior = false
    WaitForLevelLoad()
  end
  SetGlobal("PlayerFirstTimeInZone", 1)
  if L1_11.EnterFunction == "None" then
  else
    FireThread(_G[L1_11.EnterFunction])
  end
  if L1_11.SceneToActivate == "None" then
  elseif L1_11.SceneToActivate == "ActivateMS" then
    ActivateScene(PickMeanStreetActivate())
  elseif L1_11.SceneToActivate == "ActivateOT" then
    ActivateScene(PickOsTownActivate())
  elseif L1_11.SceneToActivate == "ActivateBE" then
    ActivateScene(PickNewOrleansActivate())
  elseif L1_11.SceneToActivate == "ActivateVL" then
    ActivateScene(PickVenturelandActivate())
  else
    ActivateScene(L1_11.SceneToActivate)
  end
  WaitForLevelLoad()
  UnpauseAllAI()
  wait(0.5)
  Mickey_Projector_Enter_Activated = false
  SetupPosition(L0_10)
  SetPropertyFloat(L4_14, "UsableRadius", 3.5)
  AudioPostEventOn(GetRelativePrefabEntity(L0_10, ".ExitProjectorScreen_Active"), "Play_sfx_projector_portal")
  AnimGBSetIdle(L2_12, true)
  Print("Mickey_Projector_Enter - Finish *** called from ActiveSequence: " .. L1_11.ActiveSequence)
end
Mickey_Projector_Enter = L0_0
function L0_0(A0_16)
  local L1_17, L2_18
  L1_17 = ""
  L2_18 = ""
  if Mickey_Projector_Enter_Activated_2 == true then
    L2_18 = GetPrefabData(GetEntity(TeleportToMarker_Data_Temp))
  else
    L1_17 = GetPrefabData(A0_16)
    L2_18 = GetPrefabData(GetEntity(L1_17.TeleportToMarker))
    TeleportToMarker_Data_Temp = L1_17.TeleportToMarker
    ActiveSequence_Data_Temp = L1_17.ActiveSequence
  end
  Print("SetupPosition - Start *** called from ActiveSequence: " .. ActiveSequence_Data_Temp)
  Mickey_Projector_Enter_Activated_2 = false
  TeleportToEntity(GetPlayer(), TeleportToMarker_Data_Temp)
  wait(0.01)
  CameraReset()
  wait(0.01)
  EnableMotion_Player(GetPlayer())
  WaitForLevelLoad()
  if L2_18.Film_Position == "None" then
    Print("Clear Camera Attributes: " .. ActiveSequence_Data_Temp)
    ClearAllCameraAttributes()
    Disable2DSetup()
  else
    Print("Set Camera Attributes - SetupPosition: " .. ActiveSequence_Data_Temp)
    Enable2DSetup()
    if L2_18.ZoneCamOverrideName == "None" then
      SetPropertyEntity(GetRelativePrefabEntity(TeleportToMarker_Data_Temp, ".CameraSettings"), "ControlPointEntity", nil)
      SetPropertyInt(GetRelativePrefabEntity(TeleportToMarker_Data_Temp, ".CameraSettings"), "SideScrollActive", 0)
    else
      SetCameraAttributes(L2_18.ZoneCamOverrideName)
    end
  end
  if L2_18.FlythoughCheckGlobal == "None" then
  elseif GetGlobal(L2_18.FlythoughCheckGlobal) == 1 then
    L2_18.ToFlyThrough = "False"
    Print("SetupPosition - Disabling Flythrough on " .. ActiveSequence_Data_Temp .. "'s Exit Projector since " .. L2_18.FlythoughCheckGlobal .. " == 1")
  end
  FireUser1(TeleportToMarker_Data_Temp)
  Print("SetupPosition - Finish *** called from ActiveSequence: " .. ActiveSequence_Data_Temp)
end
SetupPosition = L0_0
function L0_0(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24
  L1_20 = GetPrefabData
  L2_21 = A0_19
  L1_20 = L1_20(L2_21)
  L2_21 = Print
  L3_22 = "Mickey_Projector_Exit - Start *** called from ActiveSequence: "
  L4_23 = L1_20.ActiveSequence
  L3_22 = L3_22 .. L4_23
  L2_21(L3_22)
  L2_21 = GetRelativePrefabEntity
  L3_22 = A0_19
  L4_23 = ".ExitProjectorCamera"
  L2_21 = L2_21(L3_22, L4_23)
  L3_22 = GetRelativePrefabEntity
  L4_23 = A0_19
  L5_24 = ".ExitProjectorMarker"
  L3_22 = L3_22(L4_23, L5_24)
  L4_23 = GetRelativePrefabEntity
  L5_24 = A0_19
  L4_23 = L4_23(L5_24, ".SpawnerPortalWarpFX")
  L5_24 = GetRelativePrefabEntity
  L5_24 = L5_24(A0_19, ".ExitProjectorStand")
  PauseAllAI()
  SetPropertyFloat(L5_24, "UsableRadius", 0)
  AudioPostEventOn(GetRelativePrefabEntity(A0_19, ".ExitProjectorScreen_Active"), "Stop_sfx_projector_portal")
  if L1_20.Film_Position == "Left" or L1_20.Film_Position == "Right" then
    Print("Mickey_Projector_Exit - 2D *** called from ActiveSequence: " .. L1_20.ActiveSequence)
    SetLedgeGrabEnabled(GetPlayer(), false)
    if L1_20.Zone_UIMapName == "None" then
    else
      SetMap(nil, L1_20.Zone_UIMapName, "GAME")
    end
    if L1_20.Film_Position == "Left" then
      TeleportToEntity(GetPlayer(), GetRelativePrefabEntity(A0_19, ".StartPositionLeft"))
    elseif L1_20.Film_Position == "Right" then
      TeleportToEntity(GetPlayer(), GetRelativePrefabEntity(A0_19, ".StartPositionRight"))
    end
  else
    Print("Mickey_Projector_Exit - 3D *** called from ActiveSequence: " .. L1_20.ActiveSequence)
    SetDrawSilhouettes(false)
    AnimGBSetIdle(L2_21, false)
    Hide(GetPlayer())
    SetLedgeGrabEnabled(GetPlayer(), true)
    StartFadeOut(0)
    if L1_20.UnloadPrevious == "False" then
    elseif L1_20.UnloadPrevious == "Interior" then
      StreamInterior(nil, "empty")
    elseif L1_20.UnloadPrevious == "Exterior" then
      StreamZones(nil, "empty")
    end
    Wait(0)
    Unhide(GetPlayer())
    wait(0.1)
    TeleportToEntity(GetPlayer(), L3_22)
    GrabCameraNif(L2_21, nil, CAMERA_LERP_TRANSITION, 0)
    StartFadeInNoHUD(1)
    Wait(0)
    AnimGBReset(L2_21)
    AnimGBSequence(L2_21, "mickey_film_trans_idle_cam")
    AnimEvent(GetPlayer(), EVENT_Special_1)
    Wait(0)
    SetPropertyInt(L4_23, "Index To Spawn", 0, 0)
    ForceSpawn(L4_23, 1)
    wait(1.6)
    StartFadeOut(1)
    wait(1)
    FireThread(Prefab_ProjectorMickeyMove, A0_19)
    SetDrawSilhouettes(true)
    EnableGuardianSystem()
    if L1_20.ToFlyThrough == "False" then
      CameraReset()
    end
  end
  if L1_20.SceneToDeactivate == "None" then
  else
    DeactivateScene(L1_20.SceneToDeactivate)
  end
  if L1_20.Zone_Stream == "None" or L1_20.Zone_Stream == "Disabled" then
  else
    StreamZones(nil, L1_20.Zone_Stream)
    WaitForLevelLoad()
    if (L1_20.Film_Position == "Left" or L1_20.Film_Position == "Right") and string.sub(L1_20.Zone_Stream, -4, -1) == "_ext" then
      StreamInterior(nil, string.sub(L1_20.Zone_Stream, 1, -5) .. "_i")
      WaitForLevelLoad()
    end
  end
  if L1_20.Film_Position ~= "Left" and L1_20.Film_Position ~= "Right" or L1_20.Zone_Stream == "Disabled" then
  else
    Print("Mickey_Projector_Exit - Save Function, so Saving in 2D")
    FireThread(Projector_2D_CheckpointSave, A0_19)
  end
  ForEachEntityInGroup(FireUser1, "2D_TRANS_ENABLE_TRIGGERS")
  Print("FireUser1 on 2D Level Audio Triggers")
  AudioPostEventOn(GetPlayer(), "Set_Volume_Enter_2D")
  if L1_20.ExitFunction == "None" then
  else
    Print("Mickey_Projector_Exit - ExitFunction")
    FireThread(_G[L1_20.ExitFunction], A0_19)
  end
  wait(0.25)
  if L1_20.ToFlyThrough == "False" then
    if L1_20.Film_Position == "Left" or L1_20.Film_Position == "Right" then
    else
      SetCameraAttributes(GetRelativePrefabEntity(A0_19, ".CameraSettings"))
      ShowHud()
    end
    StartFadeIn(1)
    UnrestrictCutSceneInput()
  else
    FireThread(Prefab_FlythroughProjector, A0_19)
  end
  AnimGBSetIdle(L2_21, true)
  SetGlobal("PlayerFirstTimeInZone", 0)
  UnpauseAllAI()
  wait(5)
  Projector_2D_Checkpoint_Loaded = false
  if L1_20.StartsInactive == "False" then
    SetPropertyFloat(L5_24, "UsableRadius", 3.5)
    if true == true then
      AudioPostEventOn(GetRelativePrefabEntity(A0_19, ".ExitProjectorScreen_Active"), "Play_sfx_projector_portal")
    end
  end
  Print("Mickey_Projector_Exit - Finish *** called from ActiveSequence: " .. L1_20.ActiveSequence)
end
Mickey_Projector_Exit = L0_0
function L0_0(A0_25)
  local L1_26
  L1_26 = GetPosition
  L1_26 = L1_26(GetPlayer())
  Print("************************************* - Prefab_ProjectorMickeyMove - START")
  if A0_25 == nil then
    A0_25 = ""
    Print("************************************* - Prefab_ProjectorMickeyMove - The target is blank, assuming we just want to release the player")
  end
  while Prefab_ProjectorMickeyPosition(GetPosition(GetPlayer()), L1_26) < 0.1 and Mickey_Projector_Enter_Activated == false do
    wait(0.5)
    Print("************************************* - Prefab_ProjectorMickeyMove - wait 0.5")
  end
  if Mickey_Projector_Enter_Activated == false then
    if true == true then
      ClearAllCameraAttributesTimed(2)
      Prefab_FlythroughProjector_Reset()
      Print("************************************* - Prefab_ProjectorMickeyMove - ALL CLEAR - FROM JustReleaseTheCamera")
    elseif GetPrefabData(A0_25).SkipSideCameraRelease == "False" then
      ClearAllCameraAttributesTimed(2)
      Prefab_FlythroughProjector_Reset()
      Print("************************************* - Prefab_ProjectorMickeyMove - ALL CLEAR - FROM SkipSideCameraRelease == False")
    else
      Print("************************************* - Prefab_ProjectorMickeyMove - Skipping ClearAllCameraAttributesTimed!!!!! You will have to call Prefab_ProjectorMickeyMove() again!")
    end
  end
end
Prefab_ProjectorMickeyMove = L0_0
function L0_0(A0_27, A1_28)
  local L2_29
  L2_29 = A0_27 - A1_28
  return L2_29:length2()
end
Prefab_ProjectorMickeyPosition = L0_0
function L0_0(A0_30)
  SetCameraAttributes(GetRelativePrefabEntity(A0_30, ".CameraSettings"))
  Prefab_ProjectorMickeyMove()
end
Prefab_Projector_SetOnlySideCamera = L0_0
function L0_0(A0_31, A1_32)
  SaveCheckpointSelf(A0_31, "Projector_2D_LoadCheckpoint")
end
Projector_2D_CheckpointSave = L0_0
function L0_0()
  Print("************************** Projector_2D_LoadCheckpoint")
  StartFadeOut(0)
  SetGlobal("PlayerFirstTimeInZone", 1)
  Projector_2D_Checkpoint_Loaded = true
end
Projector_2D_LoadCheckpoint = L0_0
function L0_0()
  Print("*******************************Activating Mean Street")
  if GetGlobal("MS_MeanStreetProgress") == 1 then
    return "environments/meanstreets/levelwrappers/meanstreet_visit1_wrapper.gsa"
  elseif GetGlobal("MS_MeanStreetProgress") == 2 then
    return "environments/meanstreets/levelwrappers/meanstreet_visit2_wrapper.gsa"
  elseif GetGlobal("MS_MeanStreetProgress") == 3 then
    return "environments/meanstreets/levelwrappers/meanstreet_visit3_wrapper.gsa"
  elseif GetGlobal("MS_MeanStreetProgress") == 4 then
    return "environments/meanstreets/levelwrappers/meanstreet_visit4_wrapper.gsa"
  elseif GetGlobal("MS_MeanStreetProgress") == 5 then
    return "environments/meanstreets/levelwrappers/meanstreet_visit5_wrapper.gsa"
  elseif GetGlobal("MS_MeanStreetProgress") == 6 then
    return "environments/meanstreets/levelwrappers/meanstreet_visit6_wrapper.gsa"
  end
end
PickMeanStreetActivate = L0_0
function L0_0()
  Print("*******************************Activating Os Town")
  if GetGlobal("TT_ToonTownProgress") == 1 then
    return "environments/meanstreets/levelwrappers/ostown_visit1_wrapper.gsa"
  elseif GetGlobal("TT_ToonTownProgress") == 2 then
    return "environments/meanstreets/levelwrappers/ostown_visit2_wrapper.gsa"
  elseif GetGlobal("TT_ToonTownProgress") == 3 then
    return "environments/meanstreets/levelwrappers/ostown_visit3_wrapper.gsa"
  end
end
PickOsTownActivate = L0_0
function L0_0()
  Print("*******************************Activating Bog Easy")
  if GetGlobal("NO_NewOrleansProgress") == 1 then
    return "environments/meanstreets/levelwrappers/bogeasy_visit1_wrapper.gsa"
  elseif GetGlobal("NO_NewOrleansProgress") == 2 then
    return "environments/meanstreets/levelwrappers/bogeasy_visit2_wrapper.gsa"
  elseif GetGlobal("NO_NewOrleansProgress") == 3 then
    return "environments/meanstreets/levelwrappers/bogeasy_visit3_wrapper.gsa"
  end
end
PickNewOrleansActivate = L0_0
function L0_0()
  Print("*******************************Activating Ventureland")
  if GetGlobal("AL_AdventurelandProgress") == 1 then
    return "environments/meanstreets/levelwrappers/ventureland_visit1_wrapper.gsa"
  elseif GetGlobal("AL_AdventurelandProgress") == 2 then
    return "environments/meanstreets/levelwrappers/ventureland_visit2nopirates_wrapper.gsa"
  elseif GetGlobal("AL_AdventurelandProgress") == 3 then
    return "environments/meanstreets/levelwrappers/ventureland_visit2pirates_wrapper.gsa"
  elseif GetGlobal("AL_AdventurelandProgress") == 4 then
    return "environments/meanstreets/levelwrappers/ventureland_visit3_wrapper.gsa"
  end
end
PickVenturelandActivate = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  EnableGuardianSystem()
  LoadLevel(nil, "SW_ClockWorkBoss_static.Level")
end
Load2DClockTowerBossBattle = L0_0
function L0_0()
  Wait(1)
  StreamZones(nil, "stream_15")
end
HM_MadDoctor01_Stream = L0_0
function L0_0()
  Wait(1)
  StreamZones(nil, "stream_7")
end
GV_SteamboatA_Stream = L0_0
function L0_0()
  Wait(1)
  StreamZones(nil, "stream_7")
end
GV_ClockA_Stream = L0_0
function L0_0()
  Wait(1)
  StreamZones(nil, "stream_8")
end
GV_SteamboatB_Stream = L0_0
function L0_0()
  Wait(1)
  StreamZones(nil, "stream_5")
end
LM_HauntedHouse01_Stream = L0_0
function L0_0()
  Wait(1)
  StreamZones(nil, "stream_g1")
end
MJM_AlpineA_Stream = L0_0
function L0_0()
  Wait(1)
  StreamZones(nil, "stream_2")
end
TL_MechMan01_Stream = L0_0
function L0_0()
  Wait(1)
  StreamZones(nil, "stream_19")
end
TL_MechMan02_Stream = L0_0
