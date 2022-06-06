local L0_0, L1_1
function L0_0()
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
  SetMap(nil, "MAP_GV_ZONEC", "GAME")
end
GV_ZoneC_MiscSetup = L0_0
function L0_0()
  SetGlobal("GV_ZoneC_LastCP_Reached", 1)
  Wait(0.1)
  SaveCheckpoint(GetPlayer(), "GV_ZoneC_LastCheckpointReset", "gv_zonec.MickeyEndPosMarker")
  StreamZones(GetPlayer(), "stream_3_sndb")
end
GV_ZoneC_LastCheckpoint = L0_0
function L0_0()
  SetGlobal("GV_ZoneC_BackRoomCPGlobal", 1)
  SaveCheckpoint(GetPlayer(), "GV_ZoneC_LastCheckpointReset", "gv_zonec.PositionMarker 03")
end
GV_ZoneC_BackRoomLowerCheckPoint = L0_0
function L0_0()
  SetGlobal("GV_ZoneC_BackRoomCPGlobal", 1)
  SaveCheckpoint(GetPlayer(), "GV_ZoneC_LastCheckpointReset", "gv_zonec.PositionMarker 02")
end
GV_ZoneC_BackRoomUpperCheckPoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "GV_ZoneC_LastCheckpointReset", "gv_zonec.SecondCheckPointMarker")
end
GV_ZoneC_FirstChestCheckPoint = L0_0
function L0_0()
  SetGlobal("GV_ZoneC_BackRoomCPGlobal", 2)
  SaveCheckpoint(GetPlayer(), "GV_ZoneC_LastCheckpointReset", "gv_zonec.PositionMarker 07")
end
GV_ZoneC_ConceptCPSave = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "GV_ZoneC_LastCheckpointReset", "gv_zonec.MickeyEndPosMarker")
end
GV_ZoneC_SecondChestCheckPoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "GV_ZoneC_LastCheckpointReset", "gv_zonec.MickeyEndPosMarker")
end
GV_ZoneC_ExitDoorOpenCP = L0_0
function L0_0()
  local L0_2, L1_3, L2_4, L3_5, L4_6
  function L0_2(A0_7)
    Hide(A0_7)
    SetNPCState(A0_7, 0)
    AnimVarInt(A0_7, VAR_Mood_Type, MOOD_Positive)
    SetPropertyFloat(A0_7, "NegativeThreshold", 4)
    SetPropertyFloat(A0_7, "PositiveThreshold", 4)
  end
  L1_3()
  L1_3(L2_4)
  L1_3(L2_4)
  L1_3(L2_4)
  L1_3(L2_4, L3_5)
  L1_3(L2_4)
  L1_3(L2_4, L3_5)
  L1_3(L2_4, L3_5)
  L1_3(L2_4, L3_5)
  L1_3(L2_4, L3_5)
  if L1_3 > 0 then
    L1_3(L2_4)
    L1_3(L2_4)
  end
  if L1_3 == 2 then
    if L1_3 == 0 then
      L4_6 = L3_5()
      L1_3(L2_4, L3_5, L4_6, L3_5())
    end
  end
  L1_3(L2_4)
  L1_3(L2_4)
  L1_3(L2_4, L3_5)
  if L1_3 < 2 then
    L1_3(L2_4)
    L1_3(L2_4)
    L1_3(L2_4, L3_5)
  end
  if L1_3 == 1 then
    L1_3(L2_4)
    L1_3(L2_4)
  end
  if L1_3 == 1 then
    L1_3(L2_4)
    L1_3(L2_4)
  end
  if L1_3 == 1 then
    L1_3(L2_4)
    L1_3(L2_4)
  end
  if L1_3 == 1 then
    L1_3(L2_4)
    L1_3(L2_4)
  end
  if L1_3 == 1 then
    L1_3(L2_4)
  end
  if L1_3 == 1 then
    L1_3(L2_4)
  end
  if L1_3 == 2 then
    L1_3(L2_4)
    L1_3(L2_4)
    L4_6 = 1
    L1_3(L2_4, L3_5, L4_6)
    L1_3(L2_4)
    L1_3(L2_4, L3_5)
    L1_3(L2_4, L3_5)
    L1_3(L2_4, L3_5)
    L1_3(L2_4, L3_5)
    L1_3(L2_4, L3_5)
    L1_3(L2_4, L3_5)
    L1_3(L2_4, L3_5)
  end
  L1_3(L2_4, L3_5)
  if L1_3 == 1 then
    L1_3(L2_4, L3_5)
    L1_3(L2_4)
    L1_3(L2_4, L3_5)
    L1_3(L2_4, L3_5)
  end
  if L1_3 >= 1 then
    if L1_3 == 1 then
      L4_6 = false
      L1_3(L2_4, L3_5, L4_6, 0, 2)
      L1_3(L2_4)
    end
  end
  if L1_3 >= 2 then
    if L1_3 == 1 then
      L4_6 = false
      L1_3(L2_4, L3_5, L4_6, 0, 2)
      L1_3(L2_4)
    end
  end
  if L1_3 >= 3 then
    if L1_3 == 1 then
      L4_6 = false
      L1_3(L2_4, L3_5, L4_6, 0, 2)
      L1_3(L2_4)
    end
  end
  if L1_3 == 4 then
    if L1_3 == 1 then
      L1_3(L2_4)
      for L4_6 = 1, 4 do
        SetPropertyBool("gv_zonec.GV_ZoneF_Valve_Inert01 0" .. L4_6, "ForceInvulnerable", true)
        DisableGlint("gv_zonec.GV_ZoneF_Valve_Inert01 0" .. L4_6)
        _G["GV_ZoneC_Valve0" .. L4_6 .. "Audio"] = 1
      end
      if L1_3 ~= 0 then
        if L1_3 ~= 0 then
          if L1_3 ~= 0 then
          end
        end
      elseif L1_3 == 0 then
        L4_6 = false
        L1_3(L2_4, L3_5, L4_6, 0, 2)
      end
    end
  end
  if L1_3 == 1 then
    if L1_3 == 1 then
      L1_3(L2_4, L3_5)
    end
  elseif L1_3 == 2 then
    if L1_3 == 1 then
      L1_3(L2_4, L3_5)
    end
  elseif L1_3 == 3 then
    if L1_3 == 1 then
      L1_3(L2_4, L3_5)
    end
  end
  if L1_3 == 4 then
    if L1_3 == 1 then
      L1_3(L2_4, L3_5)
      L1_3(L2_4)
      L1_3(L2_4)
    end
  end
end
GV_ZoneC_LastCheckpointReset = L0_0
function L0_0()
  SetSplineFollowerInitialSpeed("gv_zonec.GV_ZoneE_CogStand2 03", 1)
  SetRotatorMaxSpeed("gv_zonec.GV_ZoneE_Gear04_Toon 03", 30)
end
GV_ZoneC_LowerPillar = L0_0
function L0_0()
  FireSequence("gv_zonec.GusConversationTrigger", "GV_ZoneC_GetOff")
end
GV_ZoneC_LowerPillarWarning = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "GV_ZoneC_LastCheckpointReset", "gv_zonec.MickeyStartPositionZoneC")
end
GV_ZoneC_FirstCheckpoint = L0_0
function L0_0()
  local L0_8, L1_9
end
GV_ZoneC_ChatIntro = L0_0
function L0_0()
  SetGlobal("GV_ZoneB_PausingBoat", 1)
end
GV_ZoneC_PauseBoatTrigger = L0_0
function L0_0()
  SetSplineFollowerInitialSpeed("gv_zonec.GV_ZoneE_CogStand2 01", 1)
  SetRotatorMaxSpeed("gv_zonec.GV_ZoneE_Gear04_Toon 01", 30)
end
GV_ZoneB_ClosetLiftPainted = L0_0
function L0_0()
  SetSplineFollowerInitialSpeed("gv_zonec.GV_ZoneE_CogStand2 01", 0)
  SetRotatorMaxSpeed("gv_zonec.GV_ZoneE_Gear04_Toon 01", 0)
end
GV_ZoneB_ClosetLiftThinned = L0_0
function L0_0()
  SetSplineFollowerInitialSpeed("gv_zonec.GV_ZoneE_CogStand2 02", 1)
  SetRotatorMaxSpeed("gv_zonec.GV_ZoneE_Gear04_Toon 02", 30)
end
GV_ZoneB_ClosetLift02Painted = L0_0
function L0_0()
  SetSplineFollowerInitialSpeed("gv_zonec.GV_ZoneE_CogStand2 02", 0)
  SetRotatorMaxSpeed("gv_zonec.GV_ZoneE_Gear04_Toon 02", 0)
end
GV_ZoneB_ClosetLift02Thinned = L0_0
function L0_0()
  FireSequence("gv_zonec.GusConversationTrigger", "GV_ZoneC_SeeGremlin")
end
GV_ZoneC_GremlinSighting = L0_0
function L0_0()
  FireUser1("GV_ZoneC_DoorCam")
  wait(0.8)
  DoStinger("IGC", 35)
  MoveToEntity(GetPlayer(), "gv_zonec.MickeyStartPositionZoneC")
  AnimGBSequence("gv_zonec.GV_ZoneC_RideBoat_Whirlpool 01", "Loop")
  AnimGBSequence("gv_zonec.GV_ZoneC_RideBoat_Whirlpool 02", "Loop1")
  AnimGBSequence("gv_zonec.GV_ZoneC_RideDoorA 01", "Rest")
end
GV_ZoneC_Intro1 = L0_0
function L0_0()
  GuardianPrefab_PopulateGuardians("GV_ZoneC_ExitGuardianHead")
  SetSplineFollowerInitialSpeed("gv_zonec.GV_BrokenPlant_Inert 01", 2)
  Wait(0.1)
  StartEmitters("gv_zonec.fx_thinner_splash_LG 10")
  Wait(0.1)
  StartEmitters("gv_zonec.fx_thinner_splash_LG 11")
  Wait(0.2)
  StartEmitters("gv_zonec.fx_thinner_splash_LG 12")
  Wait(2)
  StartTrackingCurrentLevelForScoring("GV_Jungle")
  AnimGBSequence("gv_boattransfer01.GV_ZoneC_RideBoat 01", "Sink")
  Wait(0.7)
  AnimGBSequence("gv_boattransfer01.GV_ZoneC_TikiDoor_Inert_RightDoor1 01", "Close")
  AudioPostEventOn(GetPlayer(), "Play_sfx_GV_JBR_AirlockDoor_Shut")
  StopEmitters("gv_zonec.fx_thinner_splash_LG 12")
  StopEmitters("gv_zonec.fx_thinner_splash_LG 11")
  StopEmitters("gv_zonec.fx_thinner_splash_LG 10")
  StopEmitters("gv_zonec.fx_thinner_splash_LG 13")
  StartEmitters("gv_zonec.fx_thinner_splash_LG 14")
  StartEmitters("gv_zonec.fx_thinner_splash_LG 17")
end
GV_ZoneC_Intro1b = L0_0
function L0_0()
  SetGlobal("GV_ZoneC_FirstSweeperDead", 2)
end
GV_ZoneC_FirstSweeperAlive = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_FirstSweeperDead") == 1 then
    Unhide("gv_zonec.SpatterRanged 01")
    EnableMotion("gv_zonec.SpatterRanged 01")
    SetNextPatrolNode("gv_zonec.SpatterRanged 01", "gv_zonec.PatrolNode 09")
  end
end
GV_ZoneC_FirstSweeperCheck = L0_0
function L0_0()
  ForEachEntityInGroup(Enable, "GV_ZoneC_HintMarkerGrp")
  Unhide("gv_zonec.SpatterRanged 01")
  EnableMotion("gv_zonec.SpatterRanged 01")
  Unhide("gv_zonec.GV_ZoneC_TikiDoorStatic 01")
  SetNextPatrolNode("gv_zonec.SpatterRanged 01", "gv_zonec.PatrolNode 09")
  SetGlobal("GV_ZoneC_FirstSweeperDead", 1)
  StreamInterior(nil, "stream_gv_empty")
  GV_ZoneC_MiscSetup()
  wait(2)
  Cleanup_GV_BoatTransfer01()
end
GV_ZoneC_Intro2 = L0_0
function L0_0()
  FireSequence("gv_zonec.GusConversationTrigger", "GV_ZoneC_BoatSlowing")
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "GV_BoatTransfer.GV_RideBoats", 1.5)
end
GV_ZoneC_BoatsSlowing = L0_0
function L0_0()
  FireSequence("gv_zonec.GusConversationTrigger", "GV_ZoneC_GetOffBoat1")
  Wait(7)
  FireSequence("gv_zonec.GusConversationTrigger", "GV_ZoneC_GetOffBoat2")
  ForEachEntityInGroup(SetSplineFollowerInitialSpeed, "GV_BoatTransfer.GV_RideBoats", 3)
  SetGlobal("GV_ZoneB_PausingBoat", 0)
end
GV_ZoneC_StartingBoatsUp = L0_0
function L0_0()
  SetGlobal("GV_ZoneB_PausingBoat", 1)
end
GV_ZoneC_PauseBoatTrigger = L0_0
function L0_0()
  SetGlobal("GV_ZoneB_DwightFreed", 1)
end
GV_ZoneB_DwightCageOpened = L0_0
function L0_0()
  FireSequence("gv_zonec.GusConversationTrigger", "GV_ZoneC_PoolPanic")
end
GV_ZoneC_PoolPanic = L0_0
function L0_0()
  Unhide("gv_zonec_dynamic.SteamJet_Blast_01_parentable 02")
  Disable("gv_zonec_dynamic.TriggerDamageVolumeRotatable 02")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_HippoA1 02", "Open")
  SplineFollower_StopAtPosition("gv_zonec_dynamic.GV_HippoSpitterA2_Inert 03", "gv_zonec_dynamic.HippoSK 05", "gv_zonec_dynamic.HippoSK 06", 0)
  SplineFollower_StopAtPosition("gv_zonec_dynamic.GV_HippoSpitterA2_Inert 04", "gv_zonec_dynamic.HippoSK 07", "gv_zonec_dynamic.HippoSK 08", 0)
end
GV_ZoneC_HippoArea3Start = L0_0
function L0_0()
  Hide("gv_zonec_dynamic.SteamJet_Blast_01_parentable 02")
  Enable("gv_zonec_dynamic.TriggerDamageVolumeRotatable 02")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_HippoA1 02", "Loop")
  SplineFollower_StopAtPosition("gv_zonec_dynamic.GV_HippoSpitterA2_Inert 03", "gv_zonec_dynamic.HippoSK 05", "gv_zonec_dynamic.HippoSK 06", 1)
  SplineFollower_StopAtPosition("gv_zonec_dynamic.GV_HippoSpitterA2_Inert 04", "gv_zonec_dynamic.HippoSK 07", "gv_zonec_dynamic.HippoSK 08", 1)
end
GV_ZoneC_HippoArea3Stop = L0_0
function L0_0()
  Unhide("gv_zonec_dynamic.SteamJet_Blast_01_parentable 05")
  Disable("gv_zonec_dynamic.TriggerDamageVolumeRotatable 05")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_HippoA1 03", "Open")
  SplineFollower_StopAtPosition("gv_zonec_dynamic.GV_HippoSpitterA2_Inert 06", "gv_zonec_dynamic.HippoSK 11", "gv_zonec_dynamic.HippoSK 12", 0)
  SplineFollower_StopAtPosition("gv_zonec_dynamic.GV_HippoSpitterA2_Inert 07", "gv_zonec_dynamic.HippoSK 13", "gv_zonec_dynamic.HippoSK 14", 0)
  SplineFollower_StopAtPosition("gv_zonec_dynamic.GV_HippoSpitterA2_Inert 08", "gv_zonec_dynamic.HippoSK 15", "gv_zonec_dynamic.HippoSK 16", 0)
  SplineFollower_StopAtPosition("gv_zonec_dynamic.GV_HippoSpitterA2_Inert 09", "gv_zonec_dynamic.HippoSK 17", "gv_zonec_dynamic.HippoSK 18", 0)
end
GV_ZoneC_HippoArea5Start = L0_0
function L0_0()
  Hide("gv_zonec_dynamic.SteamJet_Blast_01_parentable 05")
  Enable("gv_zonec_dynamic.TriggerDamageVolumeRotatable 05")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_HippoA1 03", "Loop")
  SplineFollower_StopAtPosition("gv_zonec_dynamic.GV_HippoSpitterA2_Inert 06", "gv_zonec_dynamic.HippoSK 11", "gv_zonec_dynamic.HippoSK 12", 1)
  SplineFollower_StopAtPosition("gv_zonec_dynamic.GV_HippoSpitterA2_Inert 07", "gv_zonec_dynamic.HippoSK 13", "gv_zonec_dynamic.HippoSK 14", 1)
  SplineFollower_StopAtPosition("gv_zonec_dynamic.GV_HippoSpitterA2_Inert 08", "gv_zonec_dynamic.HippoSK 15", "gv_zonec_dynamic.HippoSK 16", 1)
  SplineFollower_StopAtPosition("gv_zonec_dynamic.GV_HippoSpitterA2_Inert 09", "gv_zonec_dynamic.HippoSK 17", "gv_zonec_dynamic.HippoSK 18", 1)
end
GV_ZoneC_HippoArea5Stop = L0_0
function L0_0()
  SetGlobal("GV_ZoneC_GremlinsFreed", GetGlobal("GV_ZoneC_GremlinsFreed") + 1)
end
GV_ZoneC_FreeGremlin = L0_0
L0_0 = 0
GV_ZoneC_Valve01Corrected = L0_0
L0_0 = 0
GV_ZoneC_Valve02Corrected = L0_0
L0_0 = 0
GV_ZoneC_Valve03Corrected = L0_0
L0_0 = 0
GV_ZoneC_Valve04Corrected = L0_0
function L0_0()
  FireUser3("GV_ZoneC_PuzzleIntro2")
  GV_ZoneC_LastCheckpoint()
end
GV_ZoneC_Intro2CameraFlip = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_GremlinPinza_Played") == 1 then
    FireSequence("GV_ZoneB_GremlinPinza", "GV_ZoneC_PinzaFixing")
    SetGlobal("GV_ZoneC_GremlinPinza_Played", 2)
  elseif GetGlobal("GV_ZoneC_GremHyperion_Played") == 1 then
    FireSequence("GV_ZoneB_GremlinHyperion", "GV_ZoneC_HyperionFixing")
    SetGlobal("GV_ZoneC_GremHyperion_Played", 2)
  elseif GetGlobal("GV_ZoneC_GremBlenheim_Played") == 1 then
    FireSequence("GV_ZoneB_GremlinBlenheim", "GV_ZoneC_BlenheimFixing")
    SetGlobal("GV_ZoneC_GremBlenheim_Played", 2)
  elseif GetGlobal("GV_ZoneC_GremlinTrigo_Played") == 1 then
    FireSequence("GV_ZoneB_GremlinTrigo", "GV_ZoneC_TrigoFixing")
    SetGlobal("GV_ZoneC_GremlinTrigo_Played", 2)
  end
end
GV_ZoneA_SweeperPit_GremlinDialogue = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_GremlinBrainCounter") >= 1 and GV_ZoneC_Valve01Corrected == 0 then
    GV_ZoneC_Valve01Corrected = 1
    FireUser1("GV_ZoneC_Valve01Cam")
    Wait(3)
    GV_ZoneA_SweeperPit_GremlinDialogue()
    Wait(5)
  end
  if GetGlobal("GV_ZoneC_GremlinBrainCounter") == 1 then
    Print("######################################### Firing Valve 01 Release")
    FireUser3("GV_ZoneC_Valve01Cam")
    GV_ZoneC_LastCheckpoint()
  elseif GetGlobal("GV_ZoneC_GremlinBrainCounter") ~= 1 then
    GV_ZoneA_SweeperPitCamera02()
  end
end
GV_ZoneA_SweeperPitCamera01 = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_GremlinBrainCounter") >= 2 and GV_ZoneC_Valve02Corrected == 0 then
    GV_ZoneC_Valve02Corrected = 1
    FireUser1("GV_ZoneC_Valve02Cam")
    Wait(3)
    GV_ZoneA_SweeperPit_GremlinDialogue()
    Wait(5.5)
  end
  if GetGlobal("GV_ZoneC_GremlinBrainCounter") == 2 then
    Print("######################################### Firing Valve 02 Release")
    FireUser3("GV_ZoneC_Valve02Cam")
    GV_ZoneC_LastCheckpoint()
  elseif GetGlobal("GV_ZoneC_GremlinBrainCounter") ~= 2 then
    GV_ZoneA_SweeperPitCamera03()
  end
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 01")
end
GV_ZoneA_SweeperPitCamera02 = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_GremlinBrainCounter") >= 3 and GV_ZoneC_Valve03Corrected == 0 then
    GV_ZoneC_Valve03Corrected = 1
    FireUser1("GV_ZoneC_Valve03Cam")
    Wait(3)
    GV_ZoneA_SweeperPit_GremlinDialogue()
    Wait(5)
  end
  if GetGlobal("GV_ZoneC_GremlinBrainCounter") == 3 then
    FireUser3("GV_ZoneC_Valve03Cam")
    GV_ZoneC_LastCheckpoint()
  elseif GetGlobal("GV_ZoneC_GremlinBrainCounter") ~= 3 then
    GV_ZoneA_SweeperPitCamera04()
  end
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 06")
end
GV_ZoneA_SweeperPitCamera03 = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_GremlinBrainCounter") == 4 and GV_ZoneC_Valve04Corrected == 0 then
    GV_ZoneC_Valve04Corrected = 1
    FireUser1("GV_ZoneC_Valve04Cam")
    Wait(3)
    GV_ZoneA_SweeperPit_GremlinDialogue()
    Wait(8)
  end
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 04")
end
GV_ZoneA_SweeperPitCamera04 = L0_0
function L0_0()
  local L0_10, L1_11, L2_12
  L0_10 = MoveToEntity
  L1_11 = "gv_zonec_dynamic.SpatterRanged 04"
  L2_12 = "gv_zonec_dynamic.PositionMarker 02"
  L0_10(L1_11, L2_12)
  L0_10 = DisableMotion
  L1_11 = "gv_zonec_dynamic.SpatterRanged 04"
  L0_10(L1_11)
  L0_10 = "gv_zonec.Gremlin_StuntDouble"
  L1_11 = FireThread
  L2_12 = TeleportGremlinIn
  L1_11(L2_12, L0_10, "gv_zonec_dynamic.Gremlinmarker 04", true, false)
  L1_11 = wait
  L2_12 = 0.3
  L1_11(L2_12)
  L1_11 = DisableMotion
  L2_12 = L0_10
  L1_11(L2_12)
  L1_11 = wait
  L2_12 = 0.4
  L1_11(L2_12)
  L1_11 = EnterCutscene
  L2_12 = L0_10
  L1_11(L2_12, 1)
  L1_11 = GetChildEntityByName
  L2_12 = L0_10
  L1_11 = L1_11(L2_12, "GremlinWrench")
  L2_12 = Unhide
  L2_12(L1_11)
  L2_12 = AudioPostEventOn
  L2_12(GetPlayer(), "Play_sfx_GV_Faucet_Turn")
  L2_12 = "gv_zonec.GV_ZoneF_Valve_Inert01 02"
  SetRotatorMaxSpeed(L2_12, 300)
  Wait(1)
  Enable("gv_zonec.TriggerDamageVolumeRotatable 02")
  Enable("gv_zonec.TriggerDamageVolumeRotatable 03")
  Enable("gv_zonec.TriggerDamageVolumeRotatable 11")
  Enable("gv_zonec.TriggerDamageVolumeRotatable 12")
  DestroyEntity("gv_zonec.PlayerHintMarkers 04")
  AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapB1 01")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapB1 01", "Fall")
  Wait(1.25)
  EnableMotion("gv_zonec_dynamic.SpatterRanged 04")
  Hide(L1_11)
  ExitCutscene("gv_zonec.Gremlin_StuntDouble")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Lock1")
  SetRotatorMaxSpeed(L2_12, 0)
  SetPropertyBool(L2_12, "ForceInvulnerable", true)
  DisableGlint(L2_12)
  GV_ZoneC_Valve02Audio = 1
  FireThread(TeleportGremlinOut, "gv_zonec.Gremlin_StuntDouble")
  Wait(2)
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 02")
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 03")
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 11")
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 12")
  if GetGlobal("GV_ZoneC_GremlinBrainCounter") == 1 then
    FireSequence("gv_zonec.GusConversationTrigger", "Genric Line 26")
  end
end
GV_ZoneC_Valve01Setup = L0_0
function L0_0()
  local L0_13, L1_14, L2_15
  L0_13 = MoveToEntity
  L1_14 = "gv_zonec_ai.SpatterRanged 07"
  L2_15 = "gv_zonec_dynamic.PositionMarker 01"
  L0_13(L1_14, L2_15)
  L0_13 = DisableMotion
  L1_14 = "gv_zonec_ai.SpatterRanged 07"
  L0_13(L1_14)
  L0_13 = "gv_zonec.Gremlin_StuntDouble"
  L1_14 = FireThread
  L2_15 = TeleportGremlinIn
  L1_14(L2_15, L0_13, "gv_zonec_dynamic.Gremlinmarker 03", true, false)
  L1_14 = wait
  L2_15 = 0.3
  L1_14(L2_15)
  L1_14 = DisableMotion
  L2_15 = L0_13
  L1_14(L2_15)
  L1_14 = wait
  L2_15 = 0.4
  L1_14(L2_15)
  L1_14 = EnterCutscene
  L2_15 = L0_13
  L1_14(L2_15, 1)
  L1_14 = GetChildEntityByName
  L2_15 = L0_13
  L1_14 = L1_14(L2_15, "GremlinWrench")
  L2_15 = Unhide
  L2_15(L1_14)
  L2_15 = AudioPostEventOn
  L2_15(GetPlayer(), "Play_sfx_GV_Faucet_Turn")
  L2_15 = "gv_zonec.GV_ZoneF_Valve_Inert01 03"
  SetRotatorMaxSpeed(L2_15, 300)
  Wait(1.5)
  Enable("gv_zonec.TriggerDamageVolumeRotatable 01")
  Enable("gv_zonec.TriggerDamageVolumeRotatable 03")
  DestroyEntity("gv_zonec.PlayerHintMarkers 03")
  AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapA1 01")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapA1 01", "Fall")
  Wait(0.75)
  EnableMotion("gv_zonec_ai.SpatterRanged 07")
  Hide(L1_14)
  ExitCutscene("gv_zonec.Gremlin_StuntDouble")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Lock2")
  SetRotatorMaxSpeed(L2_15, 0)
  SetPropertyBool(L2_15, "ForceInvulnerable", true)
  DisableGlint(L2_15)
  GV_ZoneC_Valve03Audio = 1
  FireThread(TeleportGremlinOut, "gv_zonec.Gremlin_StuntDouble")
  if GetGlobal("GV_ZoneC_GremlinBrainCounter") == 2 then
    FireSequence("gv_zonec.GusConversationTrigger", "Genric Line 25")
  end
end
GV_ZoneC_Valve02Setup = L0_0
function L0_0()
  local L0_16, L1_17, L2_18
  L0_16 = MoveToEntity
  L1_17 = "gv_zonec_dynamic.SpatterRanged 07"
  L2_18 = "gv_zonec_dynamic.PositionMarker 04"
  L0_16(L1_17, L2_18)
  L0_16 = DisableMotion
  L1_17 = "gv_zonec_dynamic.SpatterRanged 07"
  L0_16(L1_17)
  L0_16 = "gv_zonec.Gremlin_StuntDouble"
  L1_17 = FireThread
  L2_18 = TeleportGremlinIn
  L1_17(L2_18, L0_16, "gv_zonec_dynamic.Gremlinmarker 01", true, false)
  L1_17 = wait
  L2_18 = 0.3
  L1_17(L2_18)
  L1_17 = DisableMotion
  L2_18 = L0_16
  L1_17(L2_18)
  L1_17 = wait
  L2_18 = 0.4
  L1_17(L2_18)
  L1_17 = EnterCutscene
  L2_18 = L0_16
  L1_17(L2_18, 1)
  L1_17 = GetChildEntityByName
  L2_18 = L0_16
  L1_17 = L1_17(L2_18, "GremlinWrench")
  L2_18 = Unhide
  L2_18(L1_17)
  L2_18 = AudioPostEventOn
  L2_18(GetPlayer(), "Play_sfx_GV_Faucet_Turn")
  L2_18 = "gv_zonec.GV_ZoneF_Valve_Inert01 01"
  SetRotatorMaxSpeed(L2_18, 300)
  Wait(1)
  Enable("gv_zonec.TriggerDamageVolumeRotatable 06")
  DestroyEntity("gv_zonec.PlayerHintMarkers 05")
  AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapD1 01")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapD1 01", "Fall")
  Wait(1.25)
  EnableMotion("gv_zonec_dynamic.SpatterRanged 07")
  Hide(L1_17)
  ExitCutscene("gv_zonec.Gremlin_StuntDouble")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Lock3")
  SetRotatorMaxSpeed(L2_18, 0)
  SetPropertyBool(L2_18, "ForceInvulnerable", true)
  DisableGlint(L2_18)
  GV_ZoneC_Valve01Audio = 1
  FireThread(TeleportGremlinOut, "gv_zonec.Gremlin_StuntDouble")
  if GetGlobal("GV_ZoneC_GremlinBrainCounter") == 3 then
    FireSequence("gv_zonec.GusConversationTrigger", "Genric Line 24")
  end
end
GV_ZoneC_Valve03Setup = L0_0
function L0_0()
  local L0_19, L1_20, L2_21
  L0_19 = MoveToEntity
  L1_20 = "gv_zonec_dynamic.SpatterRanged 05"
  L2_21 = "gv_zonec_dynamic.PositionMarker 03"
  L0_19(L1_20, L2_21)
  L0_19 = DisableMotion
  L1_20 = "gv_zonec_dynamic.SpatterRanged 05"
  L0_19(L1_20)
  L0_19 = "gv_zonec.Gremlin_StuntDouble"
  L1_20 = FireThread
  L2_21 = TeleportGremlinIn
  L1_20(L2_21, L0_19, "gv_zonec_dynamic.Gremlinmarker 02", true, false)
  L1_20 = wait
  L2_21 = 0.3
  L1_20(L2_21)
  L1_20 = DisableMotion
  L2_21 = L0_19
  L1_20(L2_21)
  L1_20 = wait
  L2_21 = 0.4
  L1_20(L2_21)
  L1_20 = EnterCutscene
  L2_21 = L0_19
  L1_20(L2_21, 1)
  L1_20 = GetChildEntityByName
  L2_21 = L0_19
  L1_20 = L1_20(L2_21, "GremlinWrench")
  L2_21 = Unhide
  L2_21(L1_20)
  L2_21 = AudioPostEventOn
  L2_21(GetPlayer(), "Play_sfx_GV_Faucet_Turn")
  L2_21 = "gv_zonec.GV_ZoneF_Valve_Inert01 04"
  SetRotatorMaxSpeed(L2_21, 300)
  Wait(1)
  Enable("gv_zonec.TriggerDamageVolumeRotatable 04")
  Enable("gv_zonec.TriggerDamageVolumeRotatable 05")
  Enable("gv_zonec.TriggerDamageVolumeRotatable 12")
  DestroyEntity("gv_zonec.PlayerHintMarkers 06")
  AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapC1 01")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapC1 01", "Fall")
  Wait(1.25)
  EnableMotion("gv_zonec_dynamic.SpatterRanged 05")
  Hide(L1_20)
  GV_ZoneC_FlipSwitch02()
  ExitCutscene("gv_zonec.Gremlin_StuntDouble")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Lock4")
  SetRotatorMaxSpeed(L2_21, 0)
  SetPropertyBool(L2_21, "ForceInvulnerable", true)
  DisableGlint(L2_21)
  GV_ZoneC_Valve04Audio = 1
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 05")
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 12")
  FireThread(TeleportGremlinOut, "gv_zonec.Gremlin_StuntDouble")
  Wait(3)
  GV_ZoneC_PinCutScene()
end
GV_ZoneC_Valve04Setup = L0_0
function L0_0(A0_22)
  SetRotatorMaxSpeed(A0_22, 300)
  if GetGlobal("GV_ZoneC_GremlinBrainCounter") == 0 then
    FireUser1("GV_ZoneC_AlphaCam")
  elseif GetGlobal("GV_ZoneC_GremlinBrainCounter") == 1 then
    FireUser1("GV_ZoneC_BetaCam")
  elseif GetGlobal("GV_ZoneC_GremlinBrainCounter") == 2 then
    FireUser1("GV_ZoneC_DeltaCam")
  elseif GetGlobal("GV_ZoneC_GremlinBrainCounter") == 3 then
    FireUser1("GV_ZoneC_GammaCam")
  end
  SetPropertyBool(A0_22, "ForceInvulnerable", true)
  DisableGlint(A0_22)
  wait(3)
  SetRotatorMaxSpeed(A0_22, 0)
end
GV_ZoneC_ExitValveMaster = L0_0
function L0_0()
  MoveToEntity("gv_zonec_dynamic.SpatterRanged 04", "gv_zonec_dynamic.PositionMarker 02")
  DisableMotion("gv_zonec_dynamic.SpatterRanged 04")
  Wait(0.1)
  Enable("gv_zonec.TriggerDamageVolumeRotatable 02")
  Enable("gv_zonec.TriggerDamageVolumeRotatable 03")
  Enable("gv_zonec.TriggerDamageVolumeRotatable 11")
  Enable("gv_zonec.TriggerDamageVolumeRotatable 12")
  SetPropertyInt("gv_zonec_dynamic.SpatterRanged 04", "WanderRadius", 0.1)
  AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapB1 01")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapB1 01", "Fall")
  Wait(1.25)
  EnableMotion("gv_zonec_dynamic.SpatterRanged 04")
  SetGlobal("GV_ZoneC_GremlinBrainCounter", GetGlobal("GV_ZoneC_GremlinBrainCounter") + 1)
  Wait(3)
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Lock1")
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 02")
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 03")
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 11")
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 12")
  FireUser3("GV_ZoneC_AlphaCam")
  Wait(2)
  FireSequence("gv_zonec.GusConversationTrigger", "Genric Line 26")
end
GV_ZoneC_PlatformAlpha = L0_0
function L0_0()
  MoveToEntity("gv_zonec_ai.SpatterRanged 07", "gv_zonec_dynamic.PositionMarker 01")
  DisableMotion("gv_zonec_ai.SpatterRanged 07")
  Wait(0.1)
  Enable("gv_zonec.TriggerDamageVolumeRotatable 01")
  Enable("gv_zonec.TriggerDamageVolumeRotatable 03")
  SetPropertyInt("gv_zonec_ai.SpatterRanged 07", "WanderRadius", 0.1)
  AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapA1 01")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapA1 01", "Fall")
  Wait(1.25)
  EnableMotion("gv_zonec_ai.SpatterRanged 07")
  SetGlobal("GV_ZoneC_GremlinBrainCounter", GetGlobal("GV_ZoneC_GremlinBrainCounter") + 1)
  Wait(3)
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Lock2")
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 01")
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 03")
  FireUser3("GV_ZoneC_BetaCam")
  Wait(2)
  FireSequence("gv_zonec.GusConversationTrigger", "Genric Line 25")
end
GV_ZoneC_PlatformBeta = L0_0
function L0_0()
  MoveToEntity("gv_zonec_dynamic.SpatterRanged 07", "gv_zonec_dynamic.PositionMarker 04")
  DisableMotion("gv_zonec_dynamic.SpatterRanged 07")
  Wait(0.1)
  Enable("gv_zonec.TriggerDamageVolumeRotatable 06")
  SetPropertyInt("gv_zonec_dynamic.SpatterRanged 07", "WanderRadius", 0.1)
  MoveToEntity("gv_zonec_dynamic.SpatterRanged 07", "gv_zonec_dynamic.PositionMarker 04")
  AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapD1 01")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapD1 01", "Fall")
  Wait(1.25)
  EnableMotion("gv_zonec_dynamic.SpatterRanged 07")
  SetGlobal("GV_ZoneC_GremlinBrainCounter", GetGlobal("GV_ZoneC_GremlinBrainCounter") + 1)
  Wait(3)
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Lock3")
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 06")
  FireUser3("GV_ZoneC_DeltaCam")
  Wait(2)
  FireSequence("gv_zonec.GusConversationTrigger", "Genric Line 24")
end
GV_ZoneC_PlatformDelta = L0_0
function L0_0()
  MoveToEntity("gv_zonec_dynamic.SpatterRanged 05", "gv_zonec_dynamic.PositionMarker 03")
  DisableMotion("gv_zonec_dynamic.SpatterRanged 05")
  Wait(0.1)
  Enable("gv_zonec.TriggerDamageVolumeRotatable 04")
  Enable("gv_zonec.TriggerDamageVolumeRotatable 05")
  Enable("gv_zonec.TriggerDamageVolumeRotatable 12")
  SetPropertyInt("gv_zonec_dynamic.SpatterRanged 05", "WanderRadius", 0.1)
  AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapC1 01")
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapC1 01", "Fall")
  Wait(1.25)
  EnableMotion("gv_zonec_dynamic.SpatterRanged 05")
  SetGlobal("GV_ZoneC_GremlinBrainCounter", GetGlobal("GV_ZoneC_GremlinBrainCounter") + 1)
  Wait(3)
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Lock4")
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 04")
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 05")
  DestroyEntity("gv_zonec.TriggerDamageVolumeRotatable 12")
  FireUser1("cameraExitDoorOpen")
  Wait(2)
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Open")
  GuardianPrefab_KillGuardians("GV_ZoneC_ExitGuardianHead")
  GV_ZoneC_ExitDoorOpenCP()
end
GV_ZoneC_PlatformGamma = L0_0
L0_0 = 0
GV_ZoneC_Valve01Audio = L0_0
L0_0 = 0
GV_ZoneC_Valve02Audio = L0_0
L0_0 = 0
GV_ZoneC_Valve03Audio = L0_0
L0_0 = 0
GV_ZoneC_Valve04Audio = L0_0
function L0_0()
  if GV_ZoneC_Valve01Audio == 0 then
    AudioPostEventOn(GetPlayer(), "Play_sfx_GV_Faucet_Turn")
    GV_ZoneC_Valve01Audio = 1
  elseif GV_ZoneC_Valve01Audio == 1 then
    AudioPostEventOn(GetPlayer(), "Play_sfx_GV_Faucet_Stuck")
  end
end
GV_ZoneC_ValveSound01 = L0_0
function L0_0()
  if GV_ZoneC_Valve02Audio == 0 then
    AudioPostEventOn(GetPlayer(), "Play_sfx_GV_Faucet_Turn")
    GV_ZoneC_Valve02Audio = 1
  elseif GV_ZoneC_Valve02Audio == 1 then
    AudioPostEventOn(GetPlayer(), "Play_sfx_GV_Faucet_Stuck")
  end
end
GV_ZoneC_ValveSound02 = L0_0
function L0_0()
  if GV_ZoneC_Valve03Audio == 0 then
    AudioPostEventOn(GetPlayer(), "Play_sfx_GV_Faucet_Turn")
    GV_ZoneC_Valve03Audio = 1
  elseif GV_ZoneC_Valve03Audio == 1 then
    AudioPostEventOn(GetPlayer(), "Play_sfx_GV_Faucet_Stuck")
  end
end
GV_ZoneC_ValveSound03 = L0_0
function L0_0()
  if GV_ZoneC_Valve04Audio == 0 then
    AudioPostEventOn(GetPlayer(), "Play_sfx_GV_Faucet_Turn")
    GV_ZoneC_Valve04Audio = 1
  elseif GV_ZoneC_Valve04Audio == 1 then
    AudioPostEventOn(GetPlayer(), "Play_sfx_GV_Faucet_Stuck")
  end
end
GV_ZoneC_ValveSound04 = L0_0
L0_0 = 0
GV_ZoneC_PinGremlinCounter = L0_0
function L0_0()
  local L0_23
  L0_23 = GetGlobal
  L0_23 = L0_23("GV_ZoneC_GremlinPinza_Played")
  if L0_23 == 1 then
    L0_23 = Unhide
    L0_23("GV_ZoneB_GremlinPinza")
    L0_23 = 1
    GV_ZoneC_ExitValveAlpha = L0_23
    L0_23 = GV_ZoneC_PinGremlinCounter
    L0_23 = L0_23 + 1
    GV_ZoneC_PinGremlinCounter = L0_23
    L0_23 = FireUser1
    L0_23("cameraPinzaFixing")
    L0_23 = MoveToEntity
    L0_23("gv_zonec_dynamic.SpatterRanged 04", "gv_zonec_dynamic.PositionMarker 02")
    L0_23 = MoveToEntity
    L0_23(GetPlayer(), "gv_zonec.MickeyEndPosMarker")
    L0_23 = MoveToEntity
    L0_23("GV_ZoneB_GremlinPinza", "gv_zonec_dynamic.Gremlinmarker 01")
    L0_23 = EnterCutscene
    L0_23("GV_ZoneB_GremlinPinza")
    L0_23 = AnimVarInt
    L0_23("GV_ZoneB_GremlinPinza", VAR_Cutscene, 1)
    L0_23 = AnimEvent
    L0_23("GV_ZoneB_GremlinPinza", EVENT_Start_Cutscene)
    L0_23 = GetChildEntityByName
    L0_23 = L0_23("GV_ZoneB_GremlinPinza", "GremlinWrench")
    Unhide(L0_23)
    SetRotatorMaxSpeed("gv_zonec.GV_ZoneF_Valve_Inert01 01", 300)
    Enable("gv_zonec.TriggerDamageVolumeRotatable 02")
    Enable("gv_zonec.TriggerDamageVolumeRotatable 03")
    Wait(2)
    DestroyEntity("gv_zonec.PlayerHintMarkers 05")
    AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapB1 01")
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapB1 01", "Fall")
    Wait(3)
    Hide(L0_23)
    GV_ZoneC_FlipSwitch02()
    ExitCutscene("GV_ZoneB_GremlinPinza")
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Lock1")
    TeleportGremlinOut("GV_ZoneB_GremlinPinza")
    Wait(4)
    DestroyEntity("gv_zonec.GV_ZoneF_Valve_Inert01 01")
  else
    L0_23 = GV_ZoneC_HyperionHelp
    L0_23()
  end
end
GV_ZoneC_PinzaHelp = L0_0
function L0_0()
  Unhide("GV_ZoneB_GremlinHyperion")
end
GV_GremlinProblem = L0_0
function L0_0()
  local L0_24
  L0_24 = GetGlobal
  L0_24 = L0_24("GV_ZoneC_GremHyperion_Played")
  if L0_24 == 1 then
    L0_24 = Unhide
    L0_24("GV_ZoneB_GremlinHyperion")
    L0_24 = 1
    GV_ZoneC_ExitValveDelta = L0_24
    L0_24 = GV_ZoneC_PinGremlinCounter
    L0_24 = L0_24 + 1
    GV_ZoneC_PinGremlinCounter = L0_24
    L0_24 = FireUser1
    L0_24("cameraHyperionFixing")
    L0_24 = MoveToEntity
    L0_24("gv_zonec_dynamic.SpatterRanged 07", "gv_zonec_dynamic.PositionMarker 04")
    L0_24 = MoveToEntity
    L0_24(GetPlayer(), "gv_zonec.MickeyEndPosMarker")
    L0_24 = MoveToEntity
    L0_24("GV_ZoneB_GremlinHyperion", "gv_zonec_dynamic.Gremlinmarker 02")
    L0_24 = EnterCutscene
    L0_24("GV_ZoneB_GremlinHyperion")
    L0_24 = AnimVarInt
    L0_24("GV_ZoneB_GremlinHyperion", VAR_Cutscene, 1)
    L0_24 = AnimEvent
    L0_24("GV_ZoneB_GremlinHyperion", EVENT_Start_Cutscene)
    L0_24 = GetChildEntityByName
    L0_24 = L0_24("GV_ZoneB_GremlinHyperion", "GremlinWrench")
    Unhide(L0_24)
    SetRotatorMaxSpeed("gv_zonec.GV_ZoneF_Valve_Inert01 04", 300)
    Enable("gv_zonec.TriggerDamageVolumeRotatable 06")
    Wait(2)
    DestroyEntity("gv_zonec.PlayerHintMarkers 06")
    AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapD1 01")
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapD1 01", "Fall")
    Wait(3)
    Hide(L0_24)
    GV_ZoneC_FlipSwitch02()
    ExitCutscene("GV_ZoneB_GremlinHyperion")
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Lock4")
    TeleportGremlinOut("GV_ZoneB_GremlinHyperion")
    Wait(2)
    DestroyEntity("gv_zonec.GV_ZoneF_Valve_Inert01 04")
  else
    L0_24 = GV_ZoneC_BlenheimHelp
    L0_24()
  end
end
GV_ZoneC_HyperionHelp = L0_0
function L0_0()
  local L0_25
  L0_25 = GetGlobal
  L0_25 = L0_25("GV_ZoneC_GremBlenheim_Played")
  if L0_25 == 1 then
    L0_25 = Unhide
    L0_25("GV_ZoneB_GremlinBlenheim")
    L0_25 = 1
    GV_ZoneC_ExitValveBeta = L0_25
    L0_25 = GV_ZoneC_PinGremlinCounter
    L0_25 = L0_25 + 1
    GV_ZoneC_PinGremlinCounter = L0_25
    L0_25 = FireUser1
    L0_25("cameraBlenheimFixing")
    L0_25 = MoveToEntity
    L0_25("gv_zonec_dynamic.SpatterRanged 05", "gv_zonec_dynamic.PositionMarker 03")
    L0_25 = MoveToEntity
    L0_25(GetPlayer(), "gv_zonec.MickeyEndPosMarker")
    L0_25 = MoveToEntity
    L0_25("GV_ZoneB_GremlinBlenheim", "gv_zonec_dynamic.Gremlinmarker 03")
    L0_25 = EnterCutscene
    L0_25("GV_ZoneB_GremlinBlenheim")
    L0_25 = AnimVarInt
    L0_25("GV_ZoneB_GremlinBlenheim", VAR_Cutscene, 1)
    L0_25 = AnimEvent
    L0_25("GV_ZoneB_GremlinBlenheim", EVENT_Start_Cutscene)
    L0_25 = GetChildEntityByName
    L0_25 = L0_25("GV_ZoneB_GremlinBlenheim", "GremlinWrench")
    Unhide(L0_25)
    SetRotatorMaxSpeed("gv_zonec.GV_ZoneF_Valve_Inert01 03", 300)
    Enable("gv_zonec.TriggerDamageVolumeRotatable 04")
    Enable("gv_zonec.TriggerDamageVolumeRotatable 05")
    Wait(2)
    DestroyEntity("gv_zonec.PlayerHintMarkers 03")
    AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapC1 01")
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapC1 01", "Fall")
    Wait(3)
    Hide(L0_25)
    GV_ZoneC_FlipSwitch02()
    ExitCutscene("GV_ZoneB_GremlinBlenheim")
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Lock3")
    TeleportGremlinOut("GV_ZoneB_GremlinBlenheim")
    Wait(2)
    DestroyEntity("gv_zonec.GV_ZoneF_Valve_Inert01 03")
  else
    L0_25 = GV_ZoneC_TrigoHelp
    L0_25()
  end
end
GV_ZoneC_BlenheimHelp = L0_0
function L0_0()
  local L0_26
  L0_26 = GetGlobal
  L0_26 = L0_26("GV_ZoneC_GremlinTrigo_Played")
  if L0_26 == 1 then
    L0_26 = Unhide
    L0_26("GV_ZoneB_GremlinTrigo")
    L0_26 = 1
    GV_ZoneC_ExitValveGamma = L0_26
    L0_26 = GV_ZoneC_PinGremlinCounter
    L0_26 = L0_26 + 1
    GV_ZoneC_PinGremlinCounter = L0_26
    L0_26 = FireUser1
    L0_26("cameraTrigoFixing")
    L0_26 = MoveToEntity
    L0_26("gv_zonec_ai.SpatterRanged 07", "gv_zonec_dynamic.PositionMarker 01")
    L0_26 = MoveToEntity
    L0_26(GetPlayer(), "gv_zonec.MickeyEndPosMarker")
    L0_26 = MoveToEntity
    L0_26("GV_ZoneB_GremlinTrigo", "gv_zonec_dynamic.Gremlinmarker 04")
    L0_26 = EnterCutscene
    L0_26("GV_ZoneB_GremlinTrigo")
    L0_26 = AnimVarInt
    L0_26("GV_ZoneB_GremlinTrigo", VAR_Cutscene, 1)
    L0_26 = AnimEvent
    L0_26("GV_ZoneB_GremlinTrigo", EVENT_Start_Cutscene)
    L0_26 = GetChildEntityByName
    L0_26 = L0_26("GV_ZoneB_GremlinTrigo", "GremlinWrench")
    Unhide(L0_26)
    SetRotatorMaxSpeed("gv_zonec.GV_ZoneF_Valve_Inert01 02", 300)
    Enable("gv_zonec.TriggerDamageVolumeRotatable 01")
    Wait(2)
    DestroyEntity("gv_zonec.PlayerHintMarkers 04")
    AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapA1 01")
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapA1 01", "Fall")
    Wait(1)
    Hide(L0_26)
    ExitCutscene("GV_ZoneB_GremlinTrigo")
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Lock2")
    TeleportGremlinOut("GV_ZoneB_GremlinTrigo")
    Wait(2)
    DestroyEntity("gv_zonec.GV_ZoneF_Valve_Inert01 02")
  else
    L0_26 = GV_ZoneC_PinCutScene
    L0_26()
  end
end
GV_ZoneC_TrigoHelp = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_GremlinTrigo_Played") == 2 and GetGlobal("GV_ZoneC_GremBlenheim_Played") == 2 and GetGlobal("GV_ZoneC_GremHyperion_Played") == 2 and GetGlobal("GV_ZoneC_GremlinPinza_Played") == 2 then
    FireUser1("GV_ZoneC_4GremlinsHelp")
    Wait(0.8)
    Unhide("GV_ZoneB_GremlinPinza")
    Unhide("GV_ZoneB_GremlinTrigo")
    Unhide("GV_ZoneB_GremlinBlenheim")
    Unhide("GV_ZoneB_GremlinHyperion")
    SetPropertyBool("GV_ZoneB_GremlinPinza", "Is Mover", true)
    DisableMotion("GV_ZoneB_GremlinPinza")
    MoveToEntity("GV_ZoneB_GremlinPinza", "gv_zonec.PinMarker03")
    Wait(0.1)
    SetPropertyBool("GV_ZoneB_GremlinTrigo", "Is Mover", true)
    DisableMotion("GV_ZoneB_GremlinTrigo")
    MoveToEntity("GV_ZoneB_GremlinTrigo", "gv_zonec.PinMarker01")
    Wait(0.1)
    SetPropertyBool("GV_ZoneB_GremlinBlenheim", "Is Mover", true)
    DisableMotion("GV_ZoneB_GremlinBlenheim")
    MoveToEntity("GV_ZoneB_GremlinBlenheim", "gv_zonec.PinMarker02")
    Wait(0.1)
    SetPropertyBool("GV_ZoneB_GremlinHyperion", "Is Mover", true)
    DisableMotion("GV_ZoneB_GremlinHyperion")
    MoveToEntity("GV_ZoneB_GremlinHyperion", "gv_zonec.PinMarker04")
    Wait(1)
    EnterCutscene("GV_ZoneB_GremlinTrigo")
    AnimVarInt("GV_ZoneB_GremlinTrigo", VAR_Cutscene, 1)
    AnimEvent("GV_ZoneB_GremlinTrigo", EVENT_Start_Cutscene)
    EnterCutscene("GV_ZoneB_GremlinHyperion")
    AnimVarInt("GV_ZoneB_GremlinHyperion", VAR_Cutscene, 1)
    AnimEvent("GV_ZoneB_GremlinHyperion", EVENT_Start_Cutscene)
    EnterCutscene("GV_ZoneB_GremlinBlenheim")
    AnimVarInt("GV_ZoneB_GremlinBlenheim", VAR_Cutscene, 1)
    AnimEvent("GV_ZoneB_GremlinBlenheim", EVENT_Start_Cutscene)
    EnterCutscene("GV_ZoneB_GremlinPinza")
    AnimVarInt("GV_ZoneB_GremlinPinza", VAR_Cutscene, 1)
    AnimEvent("GV_ZoneB_GremlinPinza", EVENT_Start_Cutscene)
    Wait(2.5)
    ExitCutscene("GV_ZoneB_GremlinTrigo")
    FireThread(TeleportGremlinOut, "GV_ZoneB_GremlinTrigo")
    Wait(0.3)
    ExitCutscene("GV_ZoneB_GremlinBlenheim")
    FireThread(TeleportGremlinOut, "GV_ZoneB_GremlinBlenheim")
    Wait(0.2)
    ExitCutscene("GV_ZoneB_GremlinHyperion")
    FireThread(TeleportGremlinOut, "GV_ZoneB_GremlinHyperion")
    Wait(0.3)
    ExitCutscene("GV_ZoneB_GremlinPinza")
    FireThread(TeleportGremlinOut, "GV_ZoneB_GremlinPinza")
    Wait(1.5)
    AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapC1 01")
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapC1 01", "Out")
    Wait(3)
    DestroyEntity("GV_ZoneB_GremlinPinza")
    DestroyEntity("GV_ZoneB_GremlinTrigo")
    DestroyEntity("GV_ZoneB_GremlinBlenheim")
    DestroyEntity("GV_ZoneB_GremlinHyperion")
    GV_ZoneC_LastCheckpoint()
  end
end
GV_ZoneC_PinCutScene = L0_0
L0_0 = 0
GV_ZoneC_DoorSwitch = L0_0
function L0_0(A0_27, A1_28, A2_29)
  if GetGlobal(A1_28) == 0 then
    SetSecondaryCameraTarget(A2_29)
    AnimGBSequence(A0_27, "Fall")
    GV_ZoneC_DoorSwitch = GV_ZoneC_DoorSwitch + 1
    if GV_ZoneC_DoorSwitch == 4 then
      wait(1)
      FireUser1("cameraExitDoorOpen")
      wait(1)
      AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Open")
      Unhide("gv_jungletoasiaairlock.ZoneC_ExitDoor 01")
    end
    SetGlobal(A1_28, 1)
    wait(1.5)
    ReleaseSecondaryCameraTarget(nil)
  end
  if GetGlobal(A1_28) == 1 then
    ForceSequence("gv_zonec_dynamic.Marker(Conversation) 01", "GV_ZoneC_SwitchUsed")
  end
end
GV_ZoneC_FlipSwitch = L0_0
L0_0 = 0
GV_ZoneC_ExitValveAlpha = L0_0
L0_0 = 0
GV_ZoneC_ExitValveBeta = L0_0
L0_0 = 0
GV_ZoneC_ExitValveGamma = L0_0
L0_0 = 0
GV_ZoneC_ExitValveDelta = L0_0
function L0_0()
  AudioPostEventOn("gv_zonec.GV_ZoneF_Valve_Inert01 01", "Play_sfx_GV_Faucet_Stuck")
  if GV_ZoneC_ExitValveAlpha == 0 then
    SetGlobal("GV_ZoneC_TotalSwitch", GetGlobal("GV_ZoneC_TotalSwitch") + 1)
    FireUser1("GV_ZoneC_AlphaCam")
    SetRotatorMaxSpeed("gv_zonec.GV_ZoneF_Valve_Inert01 01", 220)
    AudioPostEventOn("gv_zonec.GV_ZoneF_Valve_Inert01 01", "Play_sfx_GV_Faucet_Turn")
    Wait(0.8)
    MoveToEntity("gv_zonec_dynamic.SpatterRanged 04", "gv_zonec_dynamic.PositionMarker 02")
    SetPropertyInt("gv_zonec_dynamic.SpatterRanged 04", "WanderRadius", 0)
    Enable("gv_zonec.TriggerDamageVolumeRotatable 02")
    Enable("gv_zonec.TriggerDamageVolumeRotatable 03")
    Wait(1)
    AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapB1 01")
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapB1 01", "Fall")
    Wait(2)
    SetRotatorMaxSpeed("gv_zonec.GV_ZoneF_Valve_Inert01 01", 0)
    GV_ZoneC_ExitValveAlpha = 1
  elseif GV_ZoneC_ExitValveAlpha == 1 then
  end
end
GV_ZoneC_ExitValve01 = L0_0
function L0_0()
  AudioPostEventOn("gv_zonec.GV_ZoneF_Valve_Inert01 03", "Play_sfx_GV_Faucet_Stuck")
  if GV_ZoneC_ExitValveBeta == 0 then
    SetGlobal("GV_ZoneC_TotalSwitch", GetGlobal("GV_ZoneC_TotalSwitch") + 1)
    FireUser1("GV_ZoneC_BetaCam")
    SetRotatorMaxSpeed("gv_zonec.GV_ZoneF_Valve_Inert01 03", 220)
    AudioPostEventOn("gv_zonec.GV_ZoneF_Valve_Inert01 03", "Play_sfx_GV_Faucet_Turn")
    MoveToEntity("gv_zonec_dynamic.SpatterRanged 05", "gv_zonec_dynamic.PositionMarker 03")
    SetPropertyInt("gv_zonec_dynamic.SpatterRanged 05", "WanderRadius", 0)
    Enable("gv_zonec.TriggerDamageVolumeRotatable 04")
    Enable("gv_zonec.TriggerDamageVolumeRotatable 05")
    Wait(3)
    AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapC1 01")
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapC1 01", "Fall")
    Wait(2)
    SetRotatorMaxSpeed("gv_zonec.GV_ZoneF_Valve_Inert01 03", 0)
    GV_ZoneC_ExitValveBeta = 1
  elseif GV_ZoneC_ExitValveBeta == 1 then
  end
end
GV_ZoneC_ExitValve02 = L0_0
L0_0 = 0
spunonce = L0_0
function L0_0()
  if GV_ZoneC_ExitValveGamma == 0 then
    Enable("gv_zonec.TriggerDamageVolumeRotatable 01")
    SetGlobal("GV_ZoneC_TotalSwitch", GetGlobal("GV_ZoneC_TotalSwitch") + 1)
    FireUser1("GV_ZoneC_GammaCam")
    SetRotatorMaxSpeed("gv_zonec.GV_ZoneF_Valve_Inert01 02", 220)
    if spunonce == 0 then
      AudioPostEventOn("gv_zonec.GV_ZoneF_Valve_Inert01 02", "Play_sfx_GV_Faucet_Turn")
      spunonce = 1
    end
    MoveToEntity("gv_zonec_ai.SpatterRanged 07", "gv_zonec_dynamic.PositionMarker 01")
    DisableMotion("gv_zonec_ai.SpatterRanged 07")
    SetPropertyInt("gv_zonec_ai.SpatterRanged 07", "WanderRadius", 0)
    Wait(3)
    AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapA1 01")
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapA1 01", "Fall")
    Wait(0.7)
    EnableMotion("gv_zonec_ai.SpatterRanged 07")
    Wait(2)
    SetRotatorMaxSpeed("gv_zonec.GV_ZoneF_Valve_Inert01 02", 0)
    GV_ZoneC_ExitValveGamma = 1
  elseif GV_ZoneC_ExitValveGamma == 1 then
    AudioPostEventOn("gv_zonec.GV_ZoneF_Valve_Inert01 02", "Play_sfx_GV_Faucet_Stuck")
  end
end
GV_ZoneC_ExitValve03 = L0_0
function L0_0()
  AudioPostEventOn("gv_zonec.GV_ZoneF_Valve_Inert01 04", "Play_sfx_GV_Faucet_Stuck")
  if GV_ZoneC_ExitValveDelta == 0 then
    SetGlobal("GV_ZoneC_TotalSwitch", GetGlobal("GV_ZoneC_TotalSwitch") + 1)
    FireUser1("GV_ZoneC_DeltaCam")
    SetRotatorMaxSpeed("gv_zonec.GV_ZoneF_Valve_Inert01 04", 220)
    AudioPostEventOn("gv_zonec.GV_ZoneF_Valve_Inert01 04", "Play_sfx_GV_Faucet_Turn")
    MoveToEntity("gv_zonec_dynamic.SpatterRanged 07", "gv_zonec_dynamic.PositionMarker 04")
    SetPropertyInt("gv_zonec_dynamic.SpatterRanged 07", "WanderRadius", 0)
    Wait(3)
    AnimGBReset("gv_zonec_dynamic.GV_ZoneC_PlatformTrapD1 01")
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_PlatformTrapD1 01", "Fall")
    Enable("gv_zonec.TriggerDamageVolumeRotatable 06")
    Wait(2)
    SetRotatorMaxSpeed("gv_zonec.GV_ZoneF_Valve_Inert01 04", 0)
    GV_ZoneC_ExitValveDelta = 1
  elseif GV_ZoneC_ExitValveDelta == 1 then
  end
end
GV_ZoneC_ExitValve04 = L0_0
function L0_0()
  FireUser1("cameraExitDoorOpen")
  wait(1)
  AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Open")
  AudioPostEventOn("gv_zonec_audio.Sound_ExitDoor_Marker", "Play_sfx_GV_JR_ExitDoor_Open")
  Unhide("gv_jungletoasiaairlock.ZoneC_ExitDoor 01")
end
GV_ZoneC_ExitDoorSequence = L0_0
function L0_0()
  if GV_ZoneC_ExitValveDelta == 1 and GV_ZoneC_ExitValveGamma == 1 and GV_ZoneC_ExitValveAlpha == 1 and GV_ZoneC_ExitValveBeta == 1 then
    FireUser1("cameraExitDoorOpen")
    wait(1)
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Open")
    Unhide("gv_jungletoasiaairlock.ZoneC_ExitDoor 01")
  end
end
GV_ZoneC_ExitDoorSequence02 = L0_0
function L0_0()
  SetGlobal("GV_ZoneC_TotalSwitch", GetGlobal("GV_ZoneC_TotalSwitch") + 1)
  if GetGlobal("GV_ZoneC_TotalSwitch") == 4 then
    FireUser1("cameraExitDoorOpen")
    wait(1)
    AnimGBSequence("gv_zonec_dynamic.GV_ZoneC_ExitDoorA1 01", "Open")
  end
end
GV_ZoneC_FlipSwitch02 = L0_0
L0_0 = 0
GV_ZoneC_BackRoomToon01 = L0_0
L0_0 = 1
GV_ZoneC_BackRoomToon02 = L0_0
L0_0 = 0
GV_ZoneC_BackRoomToon03 = L0_0
L0_0 = 1
GV_ZoneC_BackRoomToon04 = L0_0
function L0_0()
  if GetGlobal("GV_ZoneB_ThinGearStops_Played") == 0 then
    FireSequence("gv_zonec.GusConversationTrigger", "GV_ZoneB_ThinGearStops")
  end
end
GV_ZoneC_GusSaysCanBeThinned = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_FirstChest") == 2 then
  else
    GV_ZoneC_BackRoomToon01 = 1
    GV_ZoneC_SecretRoomTreasure()
  end
end
GV_ZoneC_BackRoomToon01Painted = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_FirstChest") == 2 then
  else
    GV_ZoneC_BackRoomToon01 = 0
    GV_ZoneC_SecretRoomTreasure()
  end
end
GV_ZoneC_BackRoomToon01Thinned = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_FirstChest") == 2 then
  else
    GV_ZoneC_BackRoomToon02 = 1
    GV_ZoneC_SecretRoomTreasure()
  end
end
GV_ZoneC_BackRoomToon02Painted = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_FirstChest") == 2 then
  else
    GV_ZoneC_BackRoomToon02 = 0
    GV_ZoneC_SecretRoomTreasure()
  end
end
GV_ZoneC_BackRoomToon02Thinned = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_FirstChest") == 2 then
  else
    GV_ZoneC_BackRoomToon03 = 1
    GV_ZoneC_SecretRoomTreasure()
  end
end
GV_ZoneC_BackRoomToon03Painted = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_FirstChest") == 2 then
  else
    GV_ZoneC_BackRoomToon03 = 0
    GV_ZoneC_SecretRoomTreasure()
  end
end
GV_ZoneC_BackRoomToon03Thinned = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_FirstChest") == 2 then
  else
    GV_ZoneC_BackRoomToon04 = 1
    GV_ZoneC_SecretRoomTreasure()
  end
end
GV_ZoneC_BackRoomToon04Painted = L0_0
function L0_0()
  if GetGlobal("GV_ZoneC_FirstChest") == 2 then
  else
    GV_ZoneC_BackRoomToon04 = 0
    GV_ZoneC_SecretRoomTreasure()
  end
end
GV_ZoneC_BackRoomToon04Thinned = L0_0
L0_0 = 0
GV_ZoneC_SecretRoomTreasureGiven = L0_0
function L0_0()
  if GV_ZoneC_BackRoomToon04 + GV_ZoneC_BackRoomToon03 + GV_ZoneC_BackRoomToon02 + GV_ZoneC_BackRoomToon01 == 4 and GV_ZoneC_SecretRoomTreasureGiven == 0 then
    GV_ZoneC_SecretRoomTreasureGiven = 1
    Disable("gv_zonec.Trigger 04")
    Disable("gv_zonec.TriggerRotate 05")
    wait(0.1)
    FireUser1("GV_ZoneC_TreasCam")
    Wait(0.8)
    Enable("Trigger_ChestLoweringCatcher")
    ForEachEntityInGroup(StartEmitters, "GV_ZoneC_SecretStairsEmitters")
    SplineFollower_ClearStopPosition("gv_zonec.GV_ZoneC_BackRoomTreasure")
    ForEachEntityInGroup(StartEmitters, "GV_ZoneC_SecretStairsEmitters")
    SetSplineFollowerInitialSpeed("gv_zonec.GV_ZoneC_BackRoomTreasure", 1)
    SetSplineFollowerInitialSpeed("gv_zonec.GV_ZoneC_BackRoomTreasure02", 1)
    SetRotatorMaxSpeed("gv_zonec.GV_ZoneE_Gear04_Toon 05", 30)
    SetRotatorMaxSpeed("gv_zonec.GV_ZoneE_Gear04_Toon 04", 30)
    Wait(4.5)
    Disable("Trigger_ChestLoweringCatcher")
    Unhide("GV_ZoneC_SafetyNetRock")
    GV_ZoneC_FirstRedChest()
  end
end
GV_ZoneC_SecretRoomTreasure = L0_0
function L0_0()
  SetSplineFollowerInitialSpeed("gv_zonec.GV_ZoneE_CogStand2 07", 1)
  SetRotatorMaxSpeed("gv_zonec.GV_ZoneE_Gear04_Toon 07", 30)
  Wait(0.5)
  ForEachEntityInGroup(StartEmitters, "GV_ZoneC_SecretStairsEmitters02")
end
GV_ZoneC_FirstRedChest = L0_0
function L0_0()
  FireUser3("GV_ZoneC_TreasCam")
  wait(0.8)
  Enable("gv_zonec.TriggerRotate 05")
  Enable("gv_zonec.Trigger 04")
end
GV_ZoneC_FixTrigger = L0_0
function L0_0()
  SetRotatorMaxSpeed("gv_zonec.GV_ZoneE_Gear04_Toon 07", 0)
end
GV_ZoneC_TreasureGearStop = L0_0
function L0_0()
  SetPropertyFloat(" gv_zonec.SplineKnot 10", "BranchPathChance", 1)
  SplineFollower_ClearStopPosition("gv_zonec.GV_ZoneC_BackRoomTreasure")
  SetSplineFollowerInitialSpeed("gv_zonec.GV_ZoneC_BackRoomTreasure", 1)
  SetSplineFollowerInitialSpeed("gv_zonec.GV_ZoneC_BackRoomTreasure02", 1)
end
GV_ZoneC_MaintenanceRoomChest = L0_0
function L0_0()
  SetGlobal("GV_ZoneC_GremlinBrainCounter", GetGlobal("GV_ZoneC_GremlinBrainCounter") + 1)
  TeleportGremlinOut("GV_ZoneB_GremlinPinza")
  Wait(2)
  DisableMotion("GV_ZoneB_GremlinPinza")
end
GV_ZoneC_PinzaGoesInHiding = L0_0
function L0_0()
  SetGlobal("GV_ZoneC_GremlinBrainCounter", GetGlobal("GV_ZoneC_GremlinBrainCounter") + 1)
  TeleportGremlinOut("GV_ZoneB_GremlinBlenheim")
  DisableMotion("GV_ZoneB_GremlinBlenheim")
  SetCameraAttributes("gv_zonec.Marker(CameraOverride) 07")
end
GV_ZoneC_BlenGoesInHiding = L0_0
function L0_0()
  Wait(0.1)
  SetCameraAttributes("gv_zonec.Marker(CameraOverride) 07")
end
GV_ZoneC_HabelCameraFix = L0_0
function L0_0()
  SetGlobal("GV_ZoneC_GremlinBrainCounter", GetGlobal("GV_ZoneC_GremlinBrainCounter") + 1)
  TeleportGremlinOut("GV_ZoneB_GremlinHyperion")
  DisableMotion("GV_ZoneB_GremlinHyperion")
  SetCameraAttributes("gv_zonec.Marker(CameraOverride) 06")
end
GV_ZoneC_HyperionGoesInHiding = L0_0
function L0_0()
  Wait(0.6)
  SetCameraAttributes("gv_zonec.Marker(CameraOverride) 06")
end
GV_ZoneC_HyperionCameraFix = L0_0
function L0_0()
  SetGlobal("GV_ZoneC_GremlinBrainCounter", GetGlobal("GV_ZoneC_GremlinBrainCounter") + 1)
  TeleportGremlinOut("GV_ZoneB_GremlinTrigo")
  Wait(2)
  DisableMotion("GV_ZoneB_GremlinTrigo")
end
GV_ZoneC_TrigoGoesInHiding = L0_0
function L0_0()
  Enable("gv_zonec.TriggerRotate 01")
end
GV_ZoneC_HippoCam = L0_0
function L0_0()
  AnimGBSequence("gv_zonec.GV_ZoneC_RideBoat_Whirlpool 01", "Rest")
end
GV_Jungle_Omar1 = L0_0
function L0_0()
  AnimGBSequence("gv_zonec.GV_ZoneC_RideBoat_Whirlpool 01", "Loop")
end
GV_Jungle_Omar2 = L0_0
function L0_0()
  ActivateScene("Environments/thepark/fantasyLand/SmallWorld/GSA/GV_jungletoasiaairlock.gsa")
  StreamInterior(nil, "stream_asiaairlockinterior")
end
GV_ZoneC_StreamAsiaAirlock = L0_0
function L0_0()
  StreamInterior(nil, "stream_boatairlock")
end
GV_ZoneB_StreamTest = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("GV_Jungle")
end
GV_ZoneC_StopTrackingZoneC = L0_0
function L0_0()
  local L0_30, L1_31
  GV_ZoneB_DwightCageOpened = L0_30
  L0_30 = nil
  GV_ZoneC_BackRoomToon02Painted = L0_30
  L0_30 = nil
  GV_ZoneC_LastCheckpointReset = L0_30
  L0_30 = nil
  GV_ZoneB_ClosetLift02Painted = L0_30
  L0_30 = nil
  GV_ZoneC_SecondChestCheckPoint = L0_30
  L0_30 = nil
  GV_ZoneC_ExitValveMaster = L0_30
  L0_30 = nil
  GV_ZoneC_BlenheimHelp = L0_30
  L0_30 = nil
  GV_ZoneC_FlipSwitch = L0_30
  L0_30 = nil
  GV_ZoneC_Valve03Setup = L0_30
  L0_30 = nil
  GV_ZoneA_SweeperPitCamera03 = L0_30
  L0_30 = nil
  GV_ZoneB_ClosetLiftThinned = L0_30
  L0_30 = nil
  GV_ZoneC_ExitValve04 = L0_30
  L0_30 = nil
  GV_ZoneC_Intro1b = L0_30
  L0_30 = nil
  GV_ZoneC_PauseBoatTrigger = L0_30
  L0_30 = nil
  GV_ZoneC_PinzaHelp = L0_30
  L0_30 = nil
  GV_ZoneC_EmergencyLowerCheck = L0_30
  L0_30 = nil
  GV_ZoneC_BackRoomToon01Thinned = L0_30
  L0_30 = nil
  GV_ZoneC_Intro2 = L0_30
  L0_30 = nil
  GV_ZoneC_TreasureGearStop = L0_30
  L0_30 = nil
  GV_Jungle_Omar1 = L0_30
  L0_30 = nil
  GV_ZoneC_FirstChest_MickeyMove = L0_30
  L0_30 = nil
  GV_ZoneA_SweeperPitCamera01 = L0_30
  L0_30 = nil
  GV_ZoneC_BackRoomToon02Thinned = L0_30
  L0_30 = nil
  GV_ZoneC_FlipSwitch02 = L0_30
  L0_30 = nil
  GV_ZoneC_ExitDoorOpenCP = L0_30
  L0_30 = nil
  GV_ZoneC_BlenGoesInHiding = L0_30
  L0_30 = nil
  GV_ZoneC_PostSweeper = L0_30
  L0_30 = nil
  GV_ZoneC_HippoCam = L0_30
  L0_30 = nil
  GV_ZoneC_HippoArea3Stop = L0_30
  L0_30 = nil
  GV_ZoneC_SecretRoomTreasure = L0_30
  L0_30 = nil
  GV_ZoneC_Valve02Setup = L0_30
  L0_30 = nil
  GV_ZoneC_LowerPillar = L0_30
  L0_30 = nil
  GV_ZoneC_PlatformAlpha = L0_30
  L0_30 = nil
  GV_ZoneC_FirstSweeperCheck = L0_30
  L0_30 = nil
  GV_ZoneC_HyperionGoesInHiding = L0_30
  L0_30 = nil
  GV_ZoneC_HippoArea5Start = L0_30
  L0_30 = nil
  GV_ZoneC_ExitValve02 = L0_30
  L0_30 = nil
  GV_ZoneC_HyperionHelp = L0_30
  L0_30 = nil
  GV_ZoneC_FirstCheckpoint = L0_30
  L0_30 = nil
  GV_ZoneC_TrigoHelp = L0_30
  L0_30 = nil
  GV_ZoneC_ExitValve01 = L0_30
  L0_30 = nil
  GV_ZoneC_BackRoomToon01Painted = L0_30
  L0_30 = nil
  GV_ZoneC_FreeGremlin = L0_30
  L0_30 = nil
  GV_ZoneC_PlatformDelta = L0_30
  L0_30 = nil
  GV_ZoneC_LastCheckpoint = L0_30
  L0_30 = nil
  GV_ZoneC_GusSaysCanBeThinned = L0_30
  L0_30 = nil
  GV_ZoneA_SweeperPitCamera02 = L0_30
  L0_30 = nil
  GV_ZoneC_ExitValve03 = L0_30
  L0_30 = nil
  GV_Jungle_Omar2 = L0_30
  L0_30 = nil
  GV_ZoneC_Intro2CameraFlip = L0_30
  L0_30 = nil
  GV_ZoneC_ExitDoorSequence = L0_30
  L0_30 = nil
  GV_ZoneC_FirstChestCheckPoint = L0_30
  L0_30 = nil
  GV_ZoneC_ChatIntro = L0_30
  L0_30 = nil
  GV_ZoneC_ExitDoorSequence02 = L0_30
  L0_30 = nil
  GV_ZoneC_HippoArea5Stop = L0_30
  L0_30 = nil
  GV_ZoneC_BackRoomToon03Thinned = L0_30
  L0_30 = nil
  GV_ZoneC_BackRoomToon04Painted = L0_30
  L0_30 = nil
  GV_ZoneB_ClosetLiftPainted = L0_30
  L0_30 = nil
  GV_ZoneC_BackRoomLowerCheckPoint = L0_30
  L0_30 = nil
  GV_ZoneC_Valve01Setup = L0_30
  L0_30 = nil
  GV_ZoneC_LowerPillarWarning = L0_30
  L0_30 = nil
  GV_ZoneC_HabelCameraFix = L0_30
  L0_30 = nil
  GV_ZoneC_PinCutScene = L0_30
  L0_30 = nil
  GV_ZoneC_PinzaGoesInHiding = L0_30
  L0_30 = nil
  GV_GremlinProblem = L0_30
  L0_30 = nil
  GV_ZoneC_BackRoomToon03Painted = L0_30
  L0_30 = nil
  GV_ZoneC_BackRoomUpperCheckPoint = L0_30
  L0_30 = nil
  GV_ZoneC_StreamAsiaAirlock = L0_30
  L0_30 = nil
  GV_ZoneC_MiscSetup = L0_30
  L0_30 = nil
  GV_ZoneC_BoatsSlowing = L0_30
  L0_30 = nil
  GV_ZoneC_HyperionCameraFix = L0_30
  L0_30 = nil
  GV_ZoneB_ClosetLift02Thinned = L0_30
  L0_30 = nil
  GV_ZoneC_StopTrackingZoneC = L0_30
  L0_30 = nil
  GV_ZoneC_FirstSweeperAlive = L0_30
  L0_30 = nil
  GV_ZoneC_PoolPanic = L0_30
  L0_30 = nil
  GV_ZoneC_PlatformGamma = L0_30
  L0_30 = nil
  GV_ZoneC_MaintenanceRoomChest = L0_30
  L0_30 = nil
  GV_ZoneC_HippoArea3Start = L0_30
  L0_30 = nil
  GV_ZoneC_Intro1 = L0_30
  L0_30 = nil
  GV_ZoneC_PlatformBeta = L0_30
  L0_30 = nil
  GV_ZoneC_Valve04Setup = L0_30
  L0_30 = nil
  GV_ZoneC_BackRoomToon04Thinned = L0_30
  L0_30 = nil
  GV_ZoneB_StreamTest = L0_30
  L0_30 = nil
  GV_ZoneC_LowerElevator = L0_30
  L0_30 = nil
  GV_ZoneA_SweeperPitCamera04 = L0_30
  L0_30 = nil
  GV_ZoneC_GremlinSighting = L0_30
  L0_30 = nil
  GV_ZoneC_TrigoGoesInHiding = L0_30
  L0_30 = nil
  GV_ZoneC_StartingBoatsUp = L0_30
  L0_30 = nil
  GV_ZoneC_FirstRedChest = L0_30
  L0_30 = nil
  Cleanup_GV_ZoneC2 = L0_30
end
Cleanup_GV_ZoneC2 = L0_0
