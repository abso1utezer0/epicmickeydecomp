local L0_0, L1_1
L0_0 = false
MJM_SkipIntro = L0_0
function L0_0()
  if MJM_SkipIntro == false then
    MJM_SkipIntro = true
    MJM_Setup_Launcher("MJM_EEnter")
    Hide("mjm_zonee.TV_Screen 01")
    Hide("mjm_zonee.TV_Screen 02")
    Hide("mjm_zonee.TV_Screen 03")
    GuardianPrefab_PopulateGuardians("MJM_Slopes_GuardianSpawner")
    StartTrackingCurrentLevelForScoring("MJM_Slopes")
    ForEachEntityInGroup(SetAppCulled, "MJM_Slopes_Hidden")
    SetAppCulled("mjm_collector.CollectorsHouse 01")
    Hide("mjm_collector.pickup_worlditem 01.Item")
  end
end
MJM_ZoneE_AlwaysSetup_Launcher = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("MJM_Slopes")
end
MJM_ZoneE_LeavingSlopes = L0_0
function L0_0()
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
end
MJM_Slopes_CamDefault = L0_0
function L0_0()
  SetMap(nil, "MAP_MJ_ZONEE", "GAME")
  StreamInterior(nil, "stream_collector")
  ForceSequence("Jack Trade", "MJM_Jack_Hello")
end
MJM_Slopes_SaveCheckpoint0 = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "MJM_SlopesLoadCheckpoint", "MJM_ERestart")
end
MJM_Slopes_SaveCheckpoint1 = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "MJM_SlopesLoadCheckpoint", "MJM_ERestart")
end
MJM_Slopes_SaveCheckpoint2 = L0_0
function L0_0()
  SetMap(nil, "MAP_MJ_ZONEE", "GAME")
  MJM_Slopes_CamDefault()
  MJM_SkipIntro = true
  ForEachEntityInGroup(AnimGBSetIdle, "mjm_zonee.2DAreaGears", true)
  StartTrackingCurrentLevelForScoring("MJM_Slopes")
  Hide("mjm_collector.pickup_worlditem 01.Item")
  if GetGlobal("MJM_SlopesProgress") == 0 then
    Hide("mjm_zonee.TV_Screen 01")
    Hide("mjm_zonee.TV_Screen 02")
    FireThread(GuardianPrefab_PopulateGuardians, "MJM_Slopes_GuardianSpawner")
  elseif GetGlobal("MJM_SlopesProgress") == 1 then
    AnimGBSequence("mjm_zonee.MJ_ZoneE_Door 01", "RestOpen")
    Hide("mjm_zonee.TV_Screen 01")
    Hide("mjm_zonee.TV_Screen 02")
    ForEachEntityInGroup(DestroyEntity, "EnemiesToEliminateForQuest")
    ForEachEntityInGroup(DestroyEntity, "GuardianHints")
    FireThread(GuardianPrefab_PopulateGuardians, "MJM_Slopes_GuardianSpawner2")
    FireThread(MJM_ZoneE_SetBigDoorIdle)
  elseif GetGlobal("MJM_SlopesProgress") == 2 then
    AnimGBSequence("mjm_zonee.MJ_ZoneE_Door 01", "RestOpen")
    ForcePainted("mjm_zonee.TV_Stationary 01")
    ForcePainted("mjm_zonee.TV_Stationary 02")
    ForEachEntityInGroup(DestroyEntity, "GuardianHints")
    FireThread(GuardianPrefab_PopulateGuardians, "MJM_Slopes_GuardianSpawner2")
    FireThread(MJM_ZoneE_SetBigDoorIdle)
  end
  if GetGlobal("MS_pickaxe") == 1 then
    Enable("mjm_zonee.MJ_ZoneE_Dynamic10 01")
    MJM_Slopes_HutDoorRaised = 1
    MJM_Slopes_HutVisitCount = 1
  end
  Hide("mjm_zonee.TV_Screen 03")
end
MJM_SlopesLoadCheckpoint = L0_0
function L0_0()
  Wait(0.4)
  AnimGBSetIdle("mjm_zonee.MJ_ZoneE_Door 01", true)
end
MJM_ZoneE_SetBigDoorIdle = L0_0
function L0_0(A0_2, A1_3)
  if GetGlobal("MJM_SlopesProgress") == 0 then
    if A1_3 == "1" then
      SetGlobal("mjm_Slopes_EnemiesEliminated", GetGlobal("mjm_Slopes_EnemiesEliminated") - 1)
      Print("************************* mjm_Slopes_EnemiesEliminated -1")
    elseif A1_3 == "2" then
      if GetCurrentTeam(A0_2) == 2 then
        Print("************************** MJM_Slopes_Enemies:   GetCurrentTeam = 2")
        SetGlobal("mjm_Slopes_EnemiesEliminated", GetGlobal("mjm_Slopes_EnemiesEliminated") + 1)
      else
        Print("************************** MJM_Slopes_Enemies:   GetCurrentTeam != 2")
        SetGlobal("mjm_Slopes_EnemiesEliminated", GetGlobal("mjm_Slopes_EnemiesEliminated") - 1)
      end
    end
    if GetGlobal("mjm_Slopes_EnemiesEliminated") == 0 then
      AudioSetState(GetPlayer(), "Music_State", "Ambience")
      FireSequence("mjm_zonee.PlayingCard 01", "MJM_Jack_Proceed")
      ForEachEntityInGroup(DestroyEntity, "GuardianHints")
      wait(8)
      AudioSetState(GetPlayer(), "Music_State", "Auto")
    end
  end
end
MJM_Slopes_Enemies = L0_0
L0_0 = 0
MJM_SpatterStarterCount = L0_0
function L0_0()
  FireUser1("mjm_zonee.grabcamerafancy 03.FancyCameraLookAt 01")
  FireUser1("mjm_zonee.spatterpipespawner 02.Pipe_Straight_2m_Spawner 01")
end
MJM_SpatterFodderWave1 = L0_0
function L0_0()
  FireUser1("mjm_zonee_igc.grabcamerafancy 05.FancyCameraLookAt 01")
  Enable("mjm_zonee.TriggerDamageVolumeRotatable 06")
  wait(10)
  Disable("mjm_zonee.TriggerDamageVolumeRotatable 06")
end
MJM_KamikazeBlowUpGate = L0_0
function L0_0()
  DeactivateWatchSketch(GetPlayer(), "1")
  PauseAllAI()
  FireUser1("AnvilCam1")
  wait(0.9)
  TeleportToEntity(GetPlayer(), "mjm_zonee_igc.AnvilMickeyMark1")
  wait(2)
  FireUser1("mjm_zonee.grabcamerafancy 01.FancyCameraLookAt 01")
  wait(0.9)
  TeleportToEntity(GetPlayer(), "mjm_zonee_igc.AnvilMickeyMark2")
  wait(6)
  UnpauseAllAI()
end
MJM_ZoneECamera2 = L0_0
function L0_0()
  Enable("mjm_zonee.MJ_ZoneE_Thinner 01")
end
MJM_ZoneEThinnerDrop1 = L0_0
function L0_0()
  Enable("mjm_zonee.Spawner 01")
  wait(0.5)
  Disable("mjm_zonee.Spawner 01")
end
MJM_ZoneEWatch1 = L0_0
function L0_0()
  if GetGlobal("MJM_SlopesProgress") == 0 then
    if GetPropertyBool("mjm_zonee.TV_Stationary 01", "Is Painted") or GetPropertyBool("mjm_zonee.TV_Stationary 02", "Is Painted") then
      SetGlobal("MJM_TVsPainted", GetGlobal("MJM_TVsPainted") - 1)
    else
      SetGlobal("MJM_TVsPainted", GetGlobal("MJM_TVsPainted") + 1)
    end
    if GetGlobal("MJM_TVsPainted") == 1 then
      FireSequence("Gus", "GenericLine24")
    elseif GetGlobal("MJM_TVsPainted") == 0 then
      AudioSetState(GetPlayer(), "Music_State", "Ambience")
      FireSequence("Gus", "MJM_Gus_GateOpening")
      ForEachEntityInGroup(DestroyEntity, "GuardianHints")
      wait(8)
      AudioSetState(GetPlayer(), "Music_State", "Auto")
    end
  end
end
MJM_TVsPainted = L0_0
function L0_0()
  local L0_4, L1_5
end
SpatterDoor = L0_0
L0_0 = 0
MJM_Slopes_HutDoorRaised = L0_0
function L0_0()
  if MJM_Slopes_HutDoorRaised == 0 then
    DeactivateWatchSketch(GetPlayer(), "1")
    FireUser1("cameraSecretRoom")
    Wait(0.9)
    AnimGBSequence("mjm_zonee.MJ_ZoneE_GateArm 01", "Down")
    AnimGBSequence("mjm_zonee.MJ_ZoneE_Toon04 01", "Down")
    wait(1)
    Enable("mjm_zonee.MJ_ZoneE_Dynamic10 01")
    AudioPostEventOn("mjm_zonee_audio.Sound_Marker_IronDoorToInterior", "Play_sfx_MJM_Slopes_DoorToInt_raise")
    AudioPostEventOn("mjm_zonee_audio.Sound_Marker_IronDoorToInterior", "Play_sfx_MJM_Slopes_DoorToInt_stop")
    MJM_Slopes_HutDoorRaised = MJM_Slopes_HutDoorRaised + 1
  else
    AnimGBSequence("mjm_zonee.MJ_ZoneE_GateArm 01", "Down")
    AnimGBSequence("mjm_zonee.MJ_ZoneE_Toon04 01", "Down")
  end
end
ArmDown1 = L0_0
function L0_0()
  AnimGBSequence("mjm_zonee.MJ_ZoneE_GateArm 01", "Up")
  AnimGBSequence("mjm_zonee.MJ_ZoneE_Toon04 01", "Up")
end
ArmUp1 = L0_0
L0_0 = 0
MJM_Slopes_HutVisitCount = L0_0
function L0_0()
  if MJM_Slopes_HutVisitCount == 0 then
    FireSequence("Gus", "MJM_Gus_Axe_Explore")
  else
    FireSequence("Gus", "MJM_Gus_CollectorHutDoor_Out")
  end
end
MJM_Slopes_FirstTimeToVisitHut = L0_0
function L0_0()
  ClearAppCulled("mjm_collector.CollectorsHouse 01")
  if GetGlobal("MS_pickaxe") == 0 then
    Unhide("mjm_collector.pickup_worlditem 01.Item")
  end
  StartFadeOut(1)
  Enable2DSetup()
  Wait(1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_MJM_Slopes_enter_interior")
  TeleportToEntity(GetPlayer(), "mjm_zonee.Marker(Parentable) 06")
  Wait(0.01)
  CameraReset()
  Wait(0.01)
  SetCameraAttributes("mjm_zonee.Marker(CameraOverride) 02")
  Wait(1)
  StartFadeInNoHUD()
  MJM_Slopes_HutVisitCount = MJM_Slopes_HutVisitCount + 1
end
TeleporttoHut = L0_0
function L0_0()
  StartFadeOut(1)
  Wait(1)
  AudioPostEventOn(GetPlayer(), "Play_sfx_MJM_Slopes_enter_interior")
  TeleportToEntity(GetPlayer(), "mjm_zonee.Marker(Parentable) 05")
  SetAppCulled("mjm_collector.CollectorsHouse 01")
  Hide("mjm_collector.pickup_worlditem 01.Item")
  Disable2DSetup()
  Wait(0.01)
  ClearAllCameraAttributes()
  Wait(0.01)
  CameraReset()
  Wait(1)
  StartFadeIn()
end
TeleportoutHut = L0_0
function L0_0()
  FireUser1("IntroToSlopesCameraMarker")
end
MJM_ZoneE_QuestSetup = L0_0
function L0_0()
  ForceSequence("Jack Trade", "MJM_Jack_Hello")
end
MJM_ZoneE_JackForce = L0_0
function L0_0()
  if GetGlobal("MJM_SlopesProgress") == 1 then
    FireSequence("Gus", "MJM_Gus_Enter2DTVArea")
  end
end
MJM_ZoneE_Enter2DTVArea = L0_0
function L0_0()
  DisableGuardianHint("mjm_zonee.PlayerHintMarkers 01")
  EnableGuardianHint("mjm_zonee.PlayerHintMarkers 02")
end
MJM_ZoneE_EnableGuardianHint2 = L0_0
function L0_0()
  DisableMotion_Player(GetPlayer())
  SetParentEntity(GetPlayer(), "mjm_zonee.Basketball_SplineFollower")
  Enable("mjm_zonee.Basketball_SplineFollower")
  Wait(1.1)
  ClearParent(GetPlayer())
  EnableMotion_Player(GetPlayer())
  Disable("mjm_zonee.Basketball_SplineFollower")
  SplineFollower_TeleportToKnot("mjm_zonee.Basketball_SplineFollower", "mjm_zonee.Basketball_SplineKnot 01")
end
MJM_ZoneE_MickeyDunk = L0_0
function L0_0()
  SetGlobal("MJM_Slopes_PlatformsAreActive", true)
  if GetGlobal("MJM_Slopes_PlatformsAreActive") == false then
    return
  end
  Print("Plat ONE")
  AnimGBReset("mjm_zonee.MJ_Rotate_Plat01_Inert 01")
  wait(1)
  if GetGlobal("MJM_Slopes_PlatformsAreActive") == false then
    return
  end
  Print("Plat TWO")
  AnimGBReset("mjm_zonee.MJ_Rotate_Plat01_Inert 02")
  wait(2)
  if GetGlobal("MJM_Slopes_PlatformsAreActive") == false then
    return
  end
  Print("Plat FOUR")
  AnimGBReset("mjm_zonee.MJ_Rotate_Plat01_Inert 04")
  wait(1)
  if GetGlobal("MJM_Slopes_PlatformsAreActive") == false then
    return
  end
  Print("Plat FIVE")
  AnimGBReset("mjm_zonee.MJ_Rotate_Plat01_Inert 05")
end
MJM_ZoneE_MakePlatformsActive = L0_0
function L0_0()
  SetGlobal("MJM_Slopes_PistonsAreActive", true)
  if GetGlobal("MJM_Slopes_PistonsAreActive") == false then
    return
  end
  Print("Piston ONE")
  AnimGBReset("mjm_zonee.MJ_Piston02_Anim 01")
  wait(1)
  if GetGlobal("MJM_Slopes_PistonsAreActive") == false then
    return
  end
  Print("Piston TWO")
  AnimGBReset("mjm_zonee.MJ_Piston02_Anim 02")
  wait(1)
  if GetGlobal("MJM_Slopes_PistonsAreActive") == false then
    return
  end
  Print("Piston THREE")
  AnimGBReset("mjm_zonee.MJ_Piston02_Anim 03")
  wait(1)
  if GetGlobal("MJM_Slopes_PistonsAreActive") == false then
    return
  end
  Print("Piston FOUR")
  AnimGBReset("mjm_zonee.MJ_Piston02_Anim 04")
end
MJM_ZoneE_MakePistonsActive = L0_0
function L0_0()
  Print("Deactive ALL")
  SetGlobal("MJM_Slopes_PlatformsAreActive", false)
  SetGlobal("MJM_Slopes_PistonsAreActive", false)
  ForEachEntityInGroup(AnimGBSetIdle, "mjm_zonee.2DAreaAnims", true)
end
MJM_ZoneE_MakePlatformsAndPistonsDeactive = L0_0
