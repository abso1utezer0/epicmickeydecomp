local L0_0, L1_1
L0_0 = 0
DBC_ZoneB_Door1Open = L0_0
L0_0 = 0
DBC_ZoneB_Door2Open = L0_0
L0_0 = 0
DBC_ZoneB_Door3Open = L0_0
L0_0 = 0
DBC_1st_ZoneB_Door2_bark = L0_0
function L0_0()
  StartTrackingCurrentLevelForScoring("DBC_1st_ZoneB")
end
DBC_1st_ZoneB_StartLevelTracking = L0_0
function L0_0()
  DisableGuardianSystem()
  SetGlobal("MS_MeanStreetProgress", 0)
  if GetGlobal("DBC_1st_ZoneA_TimMachine") == 1 and GetGlobal("DBC_1st_ZoneA_MortMachine") == 1 and GetGlobal("DBC_1st_ZoneB_IntroPlayed") == 0 then
    SetGlobal("DBC_1st_ZoneB_IntroPlayed", 1)
    StartFadeOut(0.8)
    wait(0.8)
    StreamZones(nil, "stream_2")
    Disable("dbc_1st_zoneb_audio.Trigger 01")
    MoveToEntity(GetPlayer(), "dbc_1st_zoneb_dynamic.Marker(Rotatable) 01")
    SetGlobal("DBC_1st_GiveAbilitiesCutscene", 1)
    PlayAndUnlockMovie("DBC_visit1_Brush_PowerUp.bik", "DBC_1st_GiveAbilitiesCutscene")
    wait(0.8)
    PlayerSetDripsVisible(GetPlayer(), true)
    StartFadeIn(0.8)
    SetLetterbox(0)
    AnimGBSequence("dbc_1st_zoneb_dynamic.DBC_ZoneE_LabDoor01 01", "Closed")
    DestroyEntity("dbc_1st_gus_tut.ExitDoorTrigger 01")
    SetMap(nil, "MAP_DBC_ZONEE", "MAP")
    ShowReticleOnly()
    wait(0.5)
    FireSequence("dbc_1st_zoneb_dynamic.GusHallConversationMarker", "DBC_1st_hall1_magicbrush")
  end
end
DBC_1st_ZoneB_GiveBasicAbilites = L0_0
function L0_0()
  DisableGuardianSystem()
end
DBC_1st_ZoneB_CheckpointReload = L0_0
function L0_0()
  FireSequence("dbc_1st_zoneb_dynamic.ConversationalTrigger 02", "DBC_1st_ReticuleHint")
  AudioPostEventOn(GetPlayer(), "Play_sfx_UI_DBC_ZoneB_PopUp_Text")
end
DBC_1st_ZoneB_Door1Hint = L0_0
function L0_0()
  FireSequence("dbc_1st_zoneb_dynamic.ConversationalTrigger 02", "DBC_1st_hall1_thinout")
  AudioPostEventOn(GetPlayer(), "Play_sfx_UI_DBC_ZoneB_PopUp_Text")
end
DBC_1st_ZoneB_Door2Hint = L0_0
function L0_0(A0_2)
  local L1_3, L2_4
  L1_3 = 0
  L2_4 = 0
  L1_3, L2_4 = Jigsaw_GetPercentagePainted(A0_2)
  if DBC_1st_ZoneB_Door2Fell == 0 and DBC_1st_ZoneB_Door2_bark == 0 and L2_4 > 0.6 then
    DBC_1st_ZoneB_Door2_bark = 1
    print("this is working")
    FireSequence("dbc_1st_zoneb_dynamic.ConversationalTrigger 02", "DBC_1st_hall1_paintblast")
    AudioPostEventOn(GetPlayer(), "Play_sfx_UI_DBC_ZoneB_PopUp_Text")
  end
end
DBC_1st_ZoneB_Door2Hint2 = L0_0
function L0_0(A0_5)
  Print("****************holdmickey" .. A0_5 .. " + " .. _G[A0_5])
  if _G[A0_5] == 0 then
    DisableMovementInput(GetPlayer())
  end
end
DBC_1st_ZoneB_HoldMickey = L0_0
function L0_0(A0_6, A1_7)
  if _G[A1_7] == 0 then
    _G[A1_7] = 1
    Print("****************clearhold" .. A1_7 .. " + " .. _G[A1_7])
    EnableMovementInput(GetPlayer())
  end
  WaitForLevelLoad()
end
DBC_1st_ZoneB_ClearMickeyHold = L0_0
function L0_0()
  FireSequence("dbc_1st_zoneb_dynamic.ConversationalTrigger 02", "DBC_1st_hall1_thinnerpool")
  AudioPostEventOn(GetPlayer(), "Play_sfx_UI_DBC_ZoneB_PopUp_Text")
end
DBC_1st_ZoneB_Door2Hint3 = L0_0
L0_0 = 0
DBC_1st_ZoneB_Door2Fell = L0_0
function L0_0()
  local L1_8
  L1_8 = 1
  DBC_1st_ZoneB_Door2Fell = L1_8
end
DBC_1st_ZoneB_DoorFalls = L0_0
function L0_0()
  FireSequence("dbc_1st_zoneb_dynamic.ConversationalTrigger 02", "DBC_1st_ZoneC_ToonInert")
  AudioPostEventOn(GetPlayer(), "Play_sfx_UI_DBC_ZoneB_PopUp_Text")
end
DBC_1st_ZoneB_Door3Hint = L0_0
function L0_0()
  FireSequence("dbc_1st_zoneb_dynamic.ConversationalTrigger 02", "DBC_1st_ZoneC_ToonInert2")
  AudioPostEventOn(GetPlayer(), "Play_sfx_UI_DBC_ZoneB_PopUp_Text")
end
DBC_1st_ZoneB_Door3Hint2 = L0_0
