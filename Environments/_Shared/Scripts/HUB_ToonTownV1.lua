local L0_0, L1_1
function L0_0()
  if TT_V1_SkipIntro == false then
    TT_V1_SkipIntro = true
    TT_V1_SaveInitialCheckpoint = true
    SetGlobal("HUB_startposition", 1)
    SetGlobal("TT_visitnum", 1)
    SetGlobal("TT_ToonTownProgress", 1)
    SetGlobal("MS_fromtoontown", 1)
    SetGlobal("MS_toontownopen", 1)
    TT_Setup_Launcher("TTMSMarker")
  end
end
TTV1_AlwaysSetup_Launcher = L0_0
L0_0 = false
TT_V1_SkipIntro = L0_0
L0_0 = false
TT_V1_SaveInitialCheckpoint = L0_0
function L0_0()
  TT_V1_SaveInitialCheckpoint = true
  TTV1_AlwaysSetup()
end
TT_Projector_SetupV1 = L0_0
function L0_0()
  local L0_2
  L0_2 = Print
  L0_2("Setting up Os Town visit 1")
  L0_2 = Hide
  L0_2("hub_toontown_v2.ETicket_E_Parentable 01")
  L0_2 = TT_GuardianActivationSystem
  L0_2(GetGlobal("TT_GuardianQuestMarkerTracker"))
  L0_2 = RestrictCutSceneInput
  L0_2()
  L0_2 = TT_StreamInterior
  L0_2()
  L0_2 = GuardianPrefab_PopulateGuardians
  L0_2("MJMGuardianSpawner")
  L0_2 = StartTrackingCurrentLevelForScoring
  L0_2("TT_ToonTown")
  L0_2 = true
  TT_V1_SkipIntro = L0_2
  L0_2 = SetGlobal
  L0_2("TT_visitnum", 1)
  L0_2 = SetGlobal
  L0_2("TT_ToonTownProgress", 1)
  L0_2 = SetGlobal
  L0_2("MS_fromtoontown", 1)
  L0_2 = SetGlobal
  L0_2("MS_toontownopen", 1)
  L0_2 = GetGlobal
  L0_2 = L0_2("TT_clarabik")
  if L0_2 == 0 then
    L0_2 = GetPrefabData
    L0_2 = L0_2("TTMSMarker")
    L0_2.ToFlyThrough = "True"
    L0_2 = GetGlobal
    L0_2 = L0_2("TT_Gus_OsTownFlythrough_Played")
    if L0_2 == 1 then
      L0_2 = GetPrefabData
      L0_2 = L0_2("TTMSMarker")
      L0_2.ToFlyThrough = "False"
    end
    L0_2 = Enable
    L0_2("hub_toontown.Trigger_CameraOverride 07")
    L0_2 = SetCameraAttributes
    L0_2("hub_toontown.Trigger_CameraOverride 07")
    L0_2 = FireSequence
    L0_2("hub_toontown.GusConvo", "TT_Gus_OsTownFlythrough")
  else
    L0_2 = GetGlobal
    L0_2 = L0_2("TT_clarabik")
    if L0_2 == 1 then
      L0_2 = GetGlobal
      L0_2 = L0_2("TT_housepainted")
      if L0_2 == 1 then
        L0_2 = ForcePainted
        L0_2("TTMoodyHouse")
      else
        L0_2 = GetGlobal
        L0_2 = L0_2("TT_housepainted")
        if L0_2 == 0 then
          L0_2 = ForceSketched
          L0_2("TTMoodyHouse")
        end
      end
      L0_2 = Enable
      L0_2("hub_toontown.Trigger_CameraOverride 07")
      L0_2 = SetCameraAttributes
      L0_2("hub_toontown.Trigger_CameraOverride 07")
    end
  end
  L0_2 = GetGlobal
  L0_2 = L0_2("TT_PlankThinned")
  if L0_2 == 0 then
    L0_2 = ForcePainted
    L0_2("hub_toontown_static.TT_Minihub_Toon8 01")
  else
    L0_2 = ForceSketched
    L0_2("hub_toontown_static.TT_Minihub_Toon8 01")
  end
  L0_2 = GetGlobal
  L0_2 = L0_2("TT_SafeRescueGood")
  if L0_2 == 1 then
    L0_2 = TeleportToEntity
    L0_2("hub_toontown_v1.Moody", "hub_toontown_v1.MoodyHouseMarker")
  end
  L0_2 = GetGlobal
  L0_2 = L0_2("TT_MoodyCrushed")
  if L0_2 == 1 then
    L0_2 = DestroyEntity
    L0_2("hub_toontown_v1.Moody")
    L0_2 = AnimGBSequence
    L0_2("hub_toontown.TT_SafeA1_Inert 02", "RestOpened")
    L0_2 = wait
    L0_2(0.5)
    L0_2 = AnimGBSetIdle
    L0_2("hub_toontown.TT_SafeA1_Inert 02", false)
  else
    L0_2 = GetGlobal
    L0_2 = L0_2("TT_MoodyCrushed")
    if L0_2 == 0 then
      L0_2 = GetGlobal
      L0_2 = L0_2("TT_SafeAnimationState")
      if L0_2 == 0 then
        L0_2 = AnimGBSequence
        L0_2("hub_toontown.TT_SafeA1_Inert 02", "SafeSway_Loop")
      else
        L0_2 = GetGlobal
        L0_2 = L0_2("TT_SafeAnimationState")
        if L0_2 == 1 then
          L0_2 = AnimGBSequence
          L0_2("hub_toontown.TT_SafeA1_Inert 02", "OpenUp")
        else
          L0_2 = GetGlobal
          L0_2 = L0_2("TT_SafeAnimationState")
          if L0_2 == 2 then
            L0_2 = AnimGBSequence
            L0_2("hub_toontown.TT_SafeA1_Inert 02", "RestOpened")
          end
        end
      end
    end
  end
  L0_2 = GetGlobal
  L0_2 = L0_2("TT_rescue")
  if not (L0_2 > 3) then
    L0_2 = GetGlobal
    L0_2 = L0_2("TT_SafeRescueGood")
  else
    if L0_2 == 1 then
      L0_2 = GetGlobal
      L0_2 = L0_2("TT_PrescottPhoneOffer_Played")
      if L0_2 == 0 then
        L0_2 = ForceSpawn
        L0_2("hub_toontown_v1.PrescottSpawner", 1)
        L0_2 = TeleportToEntity
        L0_2("hub_toontown_v1.Prescott", "hub_toontown_v1.basicconvoshortnew_prescottConvo.basicconvoshortnew.OwnerMarker")
        L0_2 = AnimVarInt
        L0_2("hub_toontown_v1.Prescott", "VAR_NPC_State", 6)
        L0_2 = Unhide
        L0_2("hub_toontown_v1.Prescott")
      end
  end
  else
    L0_2 = GetGlobal
    L0_2 = L0_2("TT_PrescottPhoneOffer_Played")
    if L0_2 == 1 then
      L0_2 = GetGlobal
      L0_2 = L0_2("TT_wrench")
      if L0_2 == 0 then
        L0_2 = ForceSpawn
        L0_2("hub_toontown_v1.PrescottSpawner", 1)
        L0_2 = TeleportToEntity
        L0_2("hub_toontown_v1.Prescott", "hub_toontown_v1.PrescottPhoneMarker")
        L0_2 = AnimVarInt
        L0_2("hub_toontown_v1.Prescott", "VAR_NPC_State", 6)
        L0_2 = Unhide
        L0_2("hub_toontown_v1.Prescott")
      end
    else
      L0_2 = GetGlobal
      L0_2 = L0_2("TT_PrescottPhoneOffer_Played")
      if L0_2 == 1 then
        L0_2 = GetGlobal
        L0_2 = L0_2("TT_wrench")
        if L0_2 == 1 then
          L0_2 = ForceSpawn
          L0_2("hub_toontown_v1.PrescottSpawner", 1)
          L0_2 = TeleportToEntity
          L0_2("hub_toontown_v1.Prescott", "hub_toontown_v1.Marker(Parentable) 07")
          L0_2 = AnimVarInt
          L0_2("hub_toontown_v1.Prescott", "VAR_NPC_State", 6)
          L0_2 = Unhide
          L0_2("hub_toontown_v1.Prescott")
        end
      end
    end
  end
  L0_2 = GetGlobal
  L0_2 = L0_2("TT_rescue")
  if L0_2 > 5 then
    L0_2 = AnimGBSequence
    L0_2("hub_toontown_v1.TT_Minihub_BridgeA1_Inert 01", "Open")
  end
  L0_2 = GetGlobal
  L0_2 = L0_2("TT_PhoneBoxes")
  if GetGlobal("TT_PhoneWrenchPower_Played") == 1 and GetGlobal("TT_PhoneBoxesComplete_Played") == 0 and GetGlobal("TT_wrench") == 0 then
    SetGlobal("TT_PhoneWrenchPower_Played", 0)
  end
  if GetGlobal("TT_Phonebox1Painted") == 1 then
    ForcePainted("FuseBox1")
  else
    ForceSketched("FuseBox1")
  end
  if GetGlobal("TT_Phonebox2Painted") == 1 then
    ForcePainted("FuseBox2")
  else
    ForceSketched("FuseBox2")
  end
  if GetGlobal("TT_Phonebox3Painted") == 1 then
    ForcePainted("FuseBox3")
  else
    ForceSketched("FuseBox3")
  end
  if GetGlobal("TT_Phonebox4Painted") == 1 then
    ForcePainted("FuseBox4")
  else
    ForceSketched("FuseBox4")
  end
  SetGlobal("TT_PhoneBoxes", L0_2, true)
  if 1 == 1 then
    SetGlobal("TT_PhoneWrenchPower_Played", 1)
  end
  TT_SetDefaultCamera()
  TT_SetupMap()
  UnrestrictCutSceneInput()
  if GetGlobal("TT_Gus_OsTownFlythrough_Played") == 1 and TT_V1_SaveInitialCheckpoint == true then
    TT_V1_SaveInitialCheckpoint = false
    TT_CheckpointSave()
  end
end
TTV1_AlwaysSetup = L0_0
function L0_0(A0_3)
  if GetGlobal("TT_cakevar") == 0 then
    FireSequence(A0_3, "TT_cooking")
  end
end
TT_cake = L0_0
function L0_0()
  if GetGlobal("TT_wrench") == 0 then
    FireSequence("hub_toontown_v1.ConversationalTrigger 01", "TT_wrenchget")
  end
end
TT_wrenchget = L0_0
function L0_0()
  if GetGlobal("TT_gus_MickeysHouse_Played") == 0 then
    FireSequence("hub_toontown_v1.GusConvoV1", "TT_gus_MickeysHouse")
  end
end
TT_GusMickeyhouse = L0_0
function L0_0()
  if GetGlobal("TT_GusSafeWarningBark") == 0 and GetGlobal("TT_SafeAnimationState") == 0 then
    SetGlobal("TT_GusSafeWarningBark", 1)
    ForceSequence("hub_toontown_v1.GusConvoV1", "TT_ThinBeamWarning")
  end
end
TT_GusSafeWarningBark = L0_0
function L0_0()
  if GetGlobal("TT_moodyintro_Played") == 1 and GetGlobal("TT_SafeCodeReceived") == 0 then
    FireSequence("hub_toontown_v1.GusConvoV1", "TT_MoodyHousePainted")
  end
  SetGlobal("TT_housepainted", 1)
end
TT_painthouse = L0_0
function L0_0()
  SetGlobal("TT_housepainted", 0)
end
TT_thinhouse = L0_0
function L0_0()
  Print("**************************Safe Fall")
  if GetGlobal("TT_rescue") < 4 and GetGlobal("TT_MoodyCrushed") == 0 then
    SetGlobal("TT_MoodyCrushed", 1)
    Print("Safe Fall Restrict")
    RestrictCutSceneInput()
    ForceSpawn("hub_toontown_v1.PrescottSpawner", 1)
    GrabCamera("hub_toontown_v1.CameraControlPoint 01", "hub_toontown_v1.Marker(Parentable) 02", CAMERA_LERP_TRANSITION, 0)
    wait(1)
    DisableMotion("hub_toontown_v1.Prescott")
    AnimVarInt("hub_toontown_v1.Prescott", "VAR_NPC_State", 6)
    AnimVarInt("hub_toontown_v1.Prescott", "VAR_Mood_Type", MOOD_Positive)
    AnimGBSetIdle("hub_toontown.TT_SafeA1_Inert 02", true)
    AnimGBReset("hub_toontown.TT_SafeA1_Inert 02")
    AudioPostEventOn(GetPlayer(), "Play_sfx_OsTown_SafeFall")
    AnimGBSequence("hub_toontown.TT_SafeA1_Inert 02", "SafeFall")
    wait(1)
    AudioPostEventOn(GetPlayer(), "Play_sfx_OsTown_SafeFall_Impact")
    DestroyEntity("hub_toontown_v1.Moody")
    Disable("hub_toontown_v1.Sound_Gremlin_Noise")
    wait(1)
    GrabCamera("hub_toontown_v1.CameraControlPoint_safeCloseup", nil, CAMERA_LERP_TRANSITION, 0)
    ForceSequence("hub_toontown_v1.GusConvoV1", "TT_Gus_SafeCrushedMoody")
    wait(0.2)
    AnimGBReset("hub_toontown.TT_SafeA1_Inert 02")
    AnimGBSequence("hub_toontown.TT_SafeA1_Inert 02", "SafeOpen")
    TeleportToEntity("hub_toontown_v1.Prescott", "hub_toontown_v1.PrescottInSafeMarker", false)
    wait(1)
    MoveToEntity(GetPlayer(), "hub_toontown_v1.Marker(Parentable) 01")
    UnrestrictCutSceneInput()
    ForceSequence("hub_toontown_v1.Prescott", "TT_prescottrescue")
    AnimGBReset("hub_toontown .TT_SafeA1_Inert 02")
    AudioPostEventOn(GetPlayer(), "Play_sfx_OsTown_Safe_Open")
    AnimGBSequence("hub_toontown.TT_SafeA1_Inert 02", "RestOpened")
    AnimGBSetIdle("hub_toontown.TT_SafeA1_Inert 02", false)
    AddScrapperPoints(GetPlayer(), 20)
    SetGlobal("TT_SafeAnimationState", 2)
  elseif GetGlobal("TT_SafeAnimationState") == 1 then
    FireUser1("OpenSafeFallMarker")
    wait(0.8)
    TeleportToEntity(GetPlayer(), "hub_toontown_v1.basicconvoshortnew_prescottConvo.basicconvoshortnew.PlayerMarker")
    wait(2)
    AnimGBSetIdle("hub_toontown.TT_SafeA1_Inert 02", true)
    AnimGBReset("hub_toontown.TT_SafeA1_Inert 02")
    AudioPostEventOn(GetPlayer(), "Play_sfx_OsTown_SafeFall")
    AnimGBSequence("hub_toontown.TT_SafeA1_Inert 02", "OpenFall")
    wait(2)
    AudioPostEventOn(GetPlayer(), "Play_sfx_OsTown_SafeFall_Impact_Safe")
    AnimGBSetIdle("hub_toontown.TT_SafeA1_Inert 02", false)
    SetGlobal("TT_SafeAnimationState", 2)
    TT_CheckpointSave()
  end
end
TT_safefall = L0_0
function L0_0()
  if GetGlobal("TT_badrescue") == 0 and GetGlobal("TT_rescue") == 3 and GetGlobal("TT_SafeRescueGood") == 0 then
    StartFadeOut(1)
    wait(0.1)
    RestrictCutSceneInput()
    AudioPostEventOn(GetPlayer(), "Mute_Mickey")
    wait(1)
    ForceSpawn("hub_toontown_v1.PrescottSpawner", 1)
    wait(0.1)
    SetGlobal("TT_SafeRescueGood", 1)
    TeleportToEntity("hub_toontown_v1.Moody", "hub_toontown_v1.MoodyHouseMarker")
    TeleportToEntity(GetPlayer(), "hub_toontown_v1.basicconvoshortnew_prescottConvo.basicconvoshortnew.PlayerMarker", false, true)
    TeleportToEntity("hub_toontown_v1.Prescott", "hub_toontown_v1.basicconvoshortnew_prescottConvo.basicconvoshortnew.OwnerMarker")
    Unhide("hub_toontown_v1.Prescott")
    Disable("hub_toontown_v1.Sound_Gremlin_Noise")
    PlayAndUnlockMovie("TT_visit1_Free_Prescott.bik", "TT_visit1_Free_Prescott")
    AnimGBSequence("hub_toontown.TT_SafeA1_Inert 02", "OpenUp")
    AnimGBSetIdle("hub_toontown.TT_SafeA1_Inert 02", false)
    wait(0.1)
    UnrestrictCutSceneInput()
    AudioPostEventOn(GetPlayer(), "Unmute_Mickey")
    AnimVarInt("hub_toontown_v1.Prescott", "VAR_NPC_State", 6)
    ForceSequence("hub_toontown_v1.Prescott", "TT_prescottrescue")
    SetGlobal("TT_SafeAnimationState", 1)
  end
end
TT_saferescue = L0_0
function L0_0()
  if GetGlobal("TT_rescue") == 6 then
    TeleportGremlinOut("hub_toontown_v1.Prescott")
    wait(0.5)
    FireUser1("FixBridgeCam1")
    wait(1)
    TeleportGremlinIn("hub_toontown_v1.Prescott", "PrescottFixBridge1", true)
    EnterCutscene("hub_toontown_v1.Prescott", 1)
    wait(7)
    TeleportGremlinOut("hub_toontown_v1.Prescott")
    FireUser1("FixBridgeCam3")
    wait(1)
    AnimGBSequence("hub_toontown_v1.TT_Minihub_BridgeA1_Inert 01", "Open")
    AudioPostEventOn(GetPlayer(), "Play_sfx_OsTownV1_Bridge_Extend")
    TeleportGremlinIn("hub_toontown_v1.Prescott", "hub_toontown_v1.Marker(Parentable) 07", false)
    wait(5)
    AnimGBSetIdle("hub_toontown_v1.TT_Minihub_BridgeA1_Inert 01", true)
  end
end
TT_bridgefix = L0_0
function L0_0()
  if GetGlobal("TT_PrescottPhoneOffer_Played") == 0 then
    FireSequence("hub_toontown_v1.GusConvoV1", "TT_PrescottPhoneOffer")
    SetGlobal("TT_PrescottPhoneOffer_Played", 1)
  end
end
TT_PrescottPhoneEvent = L0_0
function L0_0(A0_4, A1_5)
  Print("--------------------------------")
  Print("------ADDPHONEBOX CALLED--------")
  if GetGlobal("TT_PhoneWrenchPower_Played") == 1 and GetGlobal("TT_PhoneBoxesComplete_Played") == 0 and GetGlobal("TT_wrench") == 0 then
    Print("-----Quest is active-----")
    SetGlobal("TT_PhoneBoxes", GetGlobal("TT_PhoneBoxes") + 1)
    if A1_5 == "1" then
      SetGlobal("TT_Phonebox1Painted", 1)
      Disable("hub_toontown_v1.HintMarkerPhoneBox1Paint")
    elseif A1_5 == "2" then
      SetGlobal("TT_Phonebox2Painted", 1)
      Disable("hub_toontown_v1.HintMarkerPhoneBox2Paint")
    elseif A1_5 == "3" then
      SetGlobal("TT_Phonebox3Painted", 1)
      Disable("hub_toontown_v1.HintMarkerPhoneBox3Paint")
    elseif A1_5 == "4" then
      SetGlobal("TT_Phonebox4Painted", 1)
    end
    if GetGlobal("TT_PhoneBoxes") == 1 then
      FireSequence("hub_toontown_v1.GusConvoV1", "Genric Line 26")
    elseif GetGlobal("TT_PhoneBoxes") == 2 then
      FireSequence("hub_toontown_v1.GusConvoV1", "Genric Line 25")
    elseif GetGlobal("TT_PhoneBoxes") == 3 then
      FireSequence("hub_toontown_v1.GusConvoV1", "GenericLine24")
    elseif GetGlobal("TT_PhoneBoxes") == 4 then
      FireSequence("hub_toontown_v1.GusConvoV1", "TT_GusPhoneBoxesDone")
    end
  else
    Print("-----Quest is inactive-----")
    if GetGlobal("TT_PhoneBoxesComplete_Played") == 0 and GetGlobal("TT_PhoneWrenchPower_Played") == 0 and GetGlobal("TT_wrench") == 0 then
      SetGlobal("TT_PhoneBoxes", GetGlobal("TT_PhoneBoxes") + 1, true)
    end
    if A1_5 == "1" then
      Disable("hub_toontown_v1.HintMarkerPhoneBox1Paint")
      SetGlobal("TT_Phonebox1Painted", 1)
    elseif A1_5 == "2" then
      Disable("hub_toontown_v1.HintMarkerPhoneBox2Paint")
      SetGlobal("TT_Phonebox2Painted", 1)
    elseif A1_5 == "3" then
      Disable("hub_toontown_v1.HintMarkerPhoneBox3Paint")
      SetGlobal("TT_Phonebox3Painted", 1)
    elseif A1_5 == "4" then
      SetGlobal("TT_Phonebox4Painted", 1)
    end
  end
end
TT_AddPhoneBox = L0_0
function L0_0(A0_6, A1_7)
  Print("--------------------------------")
  Print("------SUBPHONEBOX CALLED--------")
  if GetGlobal("TT_PhoneWrenchPower_Played") == 1 and GetGlobal("TT_PhoneBoxesComplete_Played") == 0 and GetGlobal("TT_wrench") == 0 then
    Print("-----Quest is active-----")
    SetGlobal("TT_PhoneBoxes", GetGlobal("TT_PhoneBoxes") - 1)
    if A1_7 == "1" then
      SetGlobal("TT_Phonebox1Painted", 0)
      Enable("hub_toontown_v1.HintMarkerPhoneBox1Paint")
    elseif A1_7 == "2" then
      SetGlobal("TT_Phonebox2Painted", 0)
      Enable("hub_toontown_v1.HintMarkerPhoneBox2Paint")
    elseif A1_7 == "3" then
      SetGlobal("TT_Phonebox3Painted", 0)
      Enable("hub_toontown_v1.HintMarkerPhoneBox3Paint")
    elseif A1_7 == "4" then
      SetGlobal("TT_Phonebox4Painted", 0)
    end
  else
    Print("-----Quest is inactive-----")
    if GetGlobal("TT_PhoneBoxesComplete_Played") == 0 and GetGlobal("TT_PhoneWrenchPower_Played") == 0 and GetGlobal("TT_wrench") == 0 then
      SetGlobal("TT_PhoneBoxes", GetGlobal("TT_PhoneBoxes") - 1, true)
    end
    if A1_7 == "1" then
      if GetGlobal("TT_GuardianQuestMarkerTracker") == 6 then
        Print("-----Enabling paint guardian1, if we're not in the quest, this is bad!")
        Enable("hub_toontown_v1.HintMarkerPhoneBox1Paint")
      end
      SetGlobal("TT_Phonebox1Painted", 0)
    elseif A1_7 == "2" then
      if GetGlobal("TT_GuardianQuestMarkerTracker") == 6 then
        Print("-----Enabling paint guardian2, if we're not in the quest, this is bad!")
        Enable("hub_toontown_v1.HintMarkerPhoneBox2Paint")
      end
      SetGlobal("TT_Phonebox2Painted", 0)
    elseif A1_7 == "3" then
      if GetGlobal("TT_GuardianQuestMarkerTracker") == 6 then
        Print("-----Enabling paint guardian3, if we're not in the quest, this is bad!")
        Enable("hub_toontown_v1.HintMarkerPhoneBox3Paint")
      end
      SetGlobal("TT_Phonebox3Painted", 0)
    elseif A1_7 == "4" then
      SetGlobal("TT_Phonebox4Painted", 0)
    end
  end
end
TT_SubPhoneBox = L0_0
function L0_0()
  local L0_8, L1_9
end
TT_introflythrough = L0_0
function L0_0()
  if GetGlobal("TT_clarabik") == 0 then
    Disable("hub_toontown.Trigger_CameraOverride 01")
    SetGlobal("TT_clarabik", 1)
    StartFadeOut(1)
    wait(1)
    PlayAndUnlockMovie("TT_visit1_Intro_to_Clarabelle.bik", "TT_visit1_Intro_to_Clarabelle")
    wait(0.1)
    FireSequence("hub_toontown.ClarabelleCow 01", "TT_claraintro")
  end
end
TT_ClarabelleIntroFMV = L0_0
function L0_0()
  wait(0)
  StartFadeOut(1)
  wait(1)
  TeleportToEntity(GetPlayer(), "hub_toontown_igc.Marker(Rotatable) 01")
  Enable("hub_toontown.Trigger_CameraOverride 01")
  wait(0.1)
  SetCameraAttributes("hub_toontown.Trigger_CameraOverride 01")
  SetCharacterInConversation(GetPlayer(), 0)
  wait(0.5)
  UnrestrictCutSceneInput()
  StartFadeIn(1)
end
TT_FixCameraAfterIGC = L0_0
function L0_0()
  AudioPostEventOn(GetPlayer(), "Mute_Mickey")
  wait(0)
  StartFadeOut(1)
  wait(1)
  Enable("hub_toontown_igc.Trigger_CameraOverride 02")
  wait(0.1)
  SetCharacterInConversation(GetPlayer(), 0)
  SetCameraAttributes("hub_toontown_igc.Trigger_CameraOverride 02")
  wait(0.5)
  UnrestrictCutSceneInput()
  AudioPostEventOn(GetPlayer(), "Unmute_Mickey")
  StartFadeIn(1)
end
TT_FixCameraAfterSafe = L0_0
function L0_0()
  StartFadeOut(1)
  wait(1)
  SetCameraAttributes("SidescrollOverrideMarker")
  wait(1)
  StartFadeIn(1)
  UnrestrictCutSceneInput()
end
TT_PrescottOneTimeRelease = L0_0
function L0_0(A0_10)
  SetGlobal("TT_GuardianQuestMarkerTracker", A0_10)
  if A0_10 == 0 then
    Print("0. Player has just zoned into the map, NEUTRAL = Clarabelle.")
    Enable("hub_toontown_v1.HintMarker.NoisySafeClarabelleNeutral")
  elseif A0_10 == 1 then
    Print("1. Player has started quest chain. PAINT = Moody, THINNER = Plank above moody.")
    Disable("hub_toontown_v1.HintMarker.NoisySafeClarabelleNeutral")
    Enable("hub_toontown_v1.HintMarker.NoisySafePaint")
    Enable("hub_toontown_v1.HintMarker.NoisySafeThinner")
  elseif A0_10 == 2 then
    Print("2. ONLY if player talked to Moody, PAINT = Moody's house, THINNER = Plank above moody.")
    Disable("hub_toontown_v1.HintMarker.NoisySafePaint")
    Enable("hub_toontown_v1.HintMarkerPaintMoodysHousePaint")
  elseif A0_10 == 3 then
    Print("3. ONLY if player talked to Moody, PAINT = Moody, THINNER = Plank above moody.")
    Disable("hub_toontown_v1.HintMarkerPaintMoodysHousePaint")
    Enable("hub_toontown_v1.HintMarker.NoisySafePaint")
  elseif A0_10 == 4 then
    Print("4. Player has safe combination, PAINT = Platform next to safe, THINNER = Plank.")
    Disable("hub_toontown_v1.HintMarker.NoisySafePaint")
    Enable("hub_toontown_v1.HintMarker.NoisySafePaint2")
  elseif A0_10 == 5 then
    Print("5. Player has gotten to freeing prescott one way or another - NEUTRAL = Mickey's house.")
    Disable("hub_toontown_v1.HintMarker.NoisySafePaint")
    Disable("hub_toontown_v1.HintMarker.NoisySafePaint2")
    Disable("hub_toontown_v1.HintMarker.NoisySafeThinner")
    Disable("hub_toontown_v1.HintMarkerPaintMoodysHousePaint")
    Enable("hub_toontown_v1.HintMarker.PrescottWrenchNeutral")
  elseif A0_10 == 6 then
    Print("6. Player talked to telephone, PAINT = Phone Boxes, THINNER = Prescott")
    Disable("hub_toontown_v1.HintMarker.PrescottWrenchNeutral")
    Enable("hub_toontown_v1.HintMarkerPhoneBox1Paint")
    Enable("hub_toontown_v1.HintMarkerPhoneBox2Paint")
    Enable("hub_toontown_v1.HintMarkerPhoneBox3Paint")
    Enable("hub_toontown_v1.HintMarkerPrescottForcePhone")
  elseif A0_10 == 7 then
    Print("7. Player talked to telephone a second time (or Prescott took wrench forcefully), NEUTRAL = Prescott")
    Disable("hub_toontown_v1.HintMarker.PrescottWrenchNeutral")
    Disable("hub_toontown_v1.HintMarkerPhoneBox1Paint")
    Disable("hub_toontown_v1.HintMarkerPhoneBox2Paint")
    Disable("hub_toontown_v1.HintMarkerPhoneBox3Paint")
    Disable("hub_toontown_v1.HintMarkerPrescottForcePhone")
    Enable("hub_toontown_v1.HintMarker.BridgeRepairNeutral")
  elseif A0_10 == 8 then
    Print("8. Player had Prescott repair the bridge, No remaining markers.")
    Disable("hub_toontown_v1.HintMarker.BridgeRepairNeutral")
  end
end
TT_GuardianActivationSystem = L0_0
function L0_0()
  if IsNPCPuddled("hub_toontown.ClarabelleCow 01") == false and GetGlobal("TT_claraintro_Played") == 1 then
    FireSequence("hub_toontown.ClarabelleCow 01", "TT_FlowersThinned")
  end
end
TT_ClarabelleGardenBark = L0_0
