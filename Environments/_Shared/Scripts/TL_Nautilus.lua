local L0_0, L1_1
function L0_0()
  if GetGlobal("TL_NautilusGears") == 1 then
    return 55
  end
  return GetGlobal("TL_Tower1") - 50 + (GetGlobal("TL_Tower2") - 50)
end
TL_NautilusGears = L0_0
function L0_0()
  SetGlobal("TL_ALTGears", GetGlobal("TL_ALTGears") + 1)
  if GetGlobal("TL_ALTGears") == 1 then
    AudioPostEventOn("tl_minihub_zoneb_audio.Sound_Marker_Machine", "Play_sfx_TC_NR_Machine_Idle")
  end
  if GetGlobal("TL_ALTGears") == 2 then
    AudioPostEventOn("tl_minihub_zoneb_audio.Sound_Marker_Machine", "Play_sfx_TC_NR_Machine_Low")
  end
  if GetGlobal("TL_ALTGears") == 3 then
    AudioPostEventOn("tl_minihub_zoneb_audio.Sound_Marker_Machine", "Play_sfx_TC_NR_Machine_Med")
  end
  if GetGlobal("TL_ALTGears") == 4 then
    AudioPostEventOn("tl_minihub_zoneb_audio.Sound_Marker_Machine", "Play_sfx_TC_NR_Machine_High")
    wait(1.5)
    AnimGBSequence("tl_minihub_zoneb.TL_Minihub_ZoneB_DoorLeft 01", "Open")
    FireUser1("tl_minihub_zoneb_igc.grabcamerafancy_templeDoor.FancyCameraLookAt 01")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_NR_Evnt_Cutaway")
  end
end
TL_ALTGearsPaint = L0_0
function L0_0()
  if GetGlobal("TLB_Gus_CraneIntro_Played") == 0 then
    StartTrackingCurrentLevelForScoring("Notilus Room")
    FireUser1("tl_minihub_zoneb_igc.grabcamerafancy_introShot1.FancyCameraLookAt 01")
    Stream2dMechanical1()
    wait(2)
    Prefab_ProjectorMickeyMove()
    SetMap(nil, "MAP_TL_MINIHUB_ZONEB", "GAME")
    WaitForLevelLoad()
    TL_ZoneB_SaveCheckpoint()
  end
end
NautIntro = L0_0
function L0_0()
  SetGlobal("TL_Goofy_PartCheck", 1)
end
GoofyMovie_Increase = L0_0
function L0_0()
  SetGlobal("TL_Goofy_PartCheck", 0)
  TL_ALTGearsPaint()
end
GoofyMovie_Decrease = L0_0
function L0_0()
  if GetGlobal("TL_ALTGears") == 1 then
    AudioPostEventOn("tl_minihub_zoneb_audio.Sound_Marker_Machine", "Play_sfx_TC_NR_Machine_Idle")
  end
  if GetGlobal("TL_ALTGears") == 2 then
    AudioPostEventOn("tl_minihub_zoneb_audio.Sound_Marker_Machine", "Play_sfx_TC_NR_Machine_Low")
  end
  if GetGlobal("TL_ALTGears") == 3 then
    AudioPostEventOn("tl_minihub_zoneb_audio.Sound_Marker_Machine", "Play_sfx_TC_NR_Machine_Med")
  end
  if GetGlobal("TL_ALTGears") == 4 then
    AudioPostEventOn("tl_minihub_zoneb_audio.Sound_Marker_Machine", "Play_sfx_TC_NR_Machine_High")
  end
  SetGlobal("TL_ALTGears", GetGlobal("TL_ALTGears") - 1)
  FireSequence("tl_minihub_zoneb_igc.ConversationalTrigger 01", "TLB_Gus_MysteryGear_WindsDown")
end
TL_ALTGearsThinner = L0_0
function L0_0()
  wait(0.5)
  wait(2.2)
  FireThread(TL_ALTGearsPaint)
end
TL_NautToonRoofGear = L0_0
function L0_0()
  FireUser1("tl_minihub_zoneb_igc.grabcamerafancy_2pillars.FancyCameraLookAt 01")
  AnimGBSequence("tl_minihub_zoneb_art.animatedsequencecycle 04.AnimatedObject", "MoveUp")
  AnimGBSequence("tl_minihub_zoneb_art.animatedsequencecycle 03.AnimatedObject", "MoveUp")
end
TL_ALTGear3Pillars = L0_0
function L0_0()
  local L0_2, L1_3
  L0_2 = IsInCutscene
  L1_3 = "tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01"
  L0_2 = L0_2(L1_3)
  L1_3 = GetChildEntityByName
  L1_3 = L1_3("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", "GremlinWrench")
  Unhide(L1_3)
  DisableMotion("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
  TeleportGremlinOut("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
  wait(0.8)
  DisableMotion("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
  TeleportGremlinIn("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", "tl_minihub_zoneb_story.Marker(Rotatable) 01", L0_2, false, false)
  DisableMotion("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
  EnterCutscene("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
  AnimVarInt("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", VAR_Cutscene, 1)
  AnimEvent("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", EVENT_Start_Cutscene)
  wait(2)
  DisableMotion("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
  TeleportGremlinToEntity("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", "tl_minihub_zoneb_story.Marker(Rotatable) 03", false, false)
  EnterCutscene("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
  AnimVarInt("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", VAR_Cutscene, 1)
  AnimEvent("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", EVENT_Start_Cutscene)
  wait(2)
  DisableMotion("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
  TeleportGremlinToEntity("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01", "tl_minihub_zoneb_story.Marker(Rotatable) 06")
  wait(1.2)
  wait(3)
  DestroyEntity("tl_minihub_zoneb_story.dbc_gremlin_clean 01.dbc_gremlin_clean.Caged_Gremlin01")
end
TeleportStarr = L0_0
function L0_0()
  SetGlobal("TLB_Starr_freed", 1)
  ForEachEntityInGroup(DestroyEntity, "tl_minihub_zoneb_igc.TriggerRotate 04")
  if TL_NautilusGears() > 15 or "TL_Nautilus_PaidGremlin" == 1 then
    FireThread(TeleportStarr)
    wait(1)
    FireSequence("tl_minihub_zoneb_igc.ConversationalTrigger 02", "TLB_Starr_Thanks")
  else
    FireThread(TeleportStarr)
    wait(1)
    FireSequence("tl_minihub_zoneb_igc.ConversationalTrigger 02", "TLB_Starr_RepairGears")
    FireUser1("gremlinCamera")
    wait(0.8)
    MoveToEntity(GetPlayer(), "tl_minihub_zoneb.gremlintalk 01")
  end
end
TL_NautilusGremlin = L0_0
function L0_0()
  if GetGlobal("TL_Nautilus_TicketCheck") == 0 and GetGlobal("TL_Nautilus_PaidGremlin") == 1 then
    SetGlobal("TL_GearTowerDialog", 1)
    ForEachEntityInGroup(ForcePainted, "TL_ToonGears2")
    ForEachEntityInGroup(ForcePainted, "TL_ToonGears")
  end
end
Yes_RepairGears = L0_0
function L0_0()
  SetGlobal("TL_Nautilus_PaidGremlin", 1)
end
Gremlin_Paid = L0_0
function L0_0()
  SetGlobal("TL_Nautilus_TicketCheck", 1)
end
Movie_Increase = L0_0
function L0_0()
  SetGlobal("TL_Nautilus_TicketCheck", 0)
  Yes_RepairGears()
end
Movie_Decrease = L0_0
function L0_0()
  if GetGlobal("TL_GearTowerDialog") == 0 then
    SetGlobal("TL_GearTowerDialog", 1)
    FireSequence("tl_minihub_zoneb_igc.ConversationalTrigger 01", "TLB_Gus_NiceJobGear")
  end
end
NiceJobDialog = L0_0
function L0_0()
  if not suppressTowerIncrements then
    SetGlobal("TL_Tower1", GetGlobal("TL_Tower1") + 5)
    Print("**********************************")
    Print("Tower1")
    Tower1DialogCheck()
  end
end
Tower1DialogIncrease = L0_0
function L0_0()
  if not suppressTowerIncrements then
    SetGlobal("TL_Tower1", GetGlobal("TL_Tower1") - 5)
    Print("**********************************")
    Print("Tower1 MINUS")
    Tower1DialogCheck()
  end
end
Tower1DialogDecrease = L0_0
function L0_0()
  if GetGlobal("TL_Tower1") == 5 then
    SetGlobal("TL_Tower1", 55)
    if GetGlobal("TL_Tower2") < 6 then
      TL_ZoneB_Tower1SaveCheckpoint()
    end
  end
  NautilusGlobalCheck()
end
Tower1DialogCheck = L0_0
function L0_0()
  if not suppressTowerIncrements then
    SetGlobal("TL_Tower2", GetGlobal("TL_Tower2") + 6)
    Print("**********************************")
    Print("Tower2")
    Tower2DialogCheck()
  end
end
Tower2DialogIncrease = L0_0
function L0_0()
  if not suppressTowerIncrements then
    SetGlobal("TL_Tower2", GetGlobal("TL_Tower2") - 6)
    Print("**********************************")
    Print("Tower2 MINUS")
    Tower2DialogCheck()
  end
end
Tower2DialogDecrease = L0_0
function L0_0()
  if GetGlobal("TL_Tower2") == 6 then
    SetGlobal("TL_Tower2", 56)
    if GetGlobal("TL_Tower1") < 5 then
      TL_ZoneB_Tower2SaveCheckpoint()
    end
  end
  NautilusGlobalCheck()
end
Tower2DialogCheck = L0_0
function L0_0()
  if GetGlobal("TLB_Gus_SomewhereImportant_Played") == 0 then
    if TL_NautilusGears() == 11 then
      FireSequence("tl_minihub_zoneb_igc.ConversationalTrigger 01", "TLB_Gus_Crane2Done")
      AudioSetState(GetPlayer(), "Music_State", "Stinger_Success")
      AnimGBSequence("tl_minihub_zoneb_art.animatedsequencecycle 05.AnimatedObject", "Emerge")
      AnimGBSequence("tl_minihub_zoneb_art.animatedsequencecycle 06.AnimatedObject", "Emerge")
      ForEachEntityInGroup(DestroyEntity, "NotHintMarkers")
      Unhide("tl_minihub_zoneb.TriggerRotate 28")
      FireUser1("tl_minihub_zoneb_igc.grabcamerafancy 03.FancyCameraLookAt 01")
      wait(5)
      AudioSetState(GetPlayer(), "Music_State", "Auto")
      ForEachEntityInGroup(Unhide, "NautilusExitProjector")
      AudioPostEventOn("tl_minihub_zoneb.seq_projector 02.ProjectorPortal_Screen_Active", "Play_sfx_projector_portal")
      DisableComponent("tl_minihub_zoneb.seq_projector 02.ProjectorPortal_Stand", "Usable")
      SetGlobal("TL_NautilusGears", 1)
      TL_ZoneB_NOTILUSSaveCheckpoint()
    elseif TL_NautilusGears() == 1 and GetGlobal("TL_Nautilus_PaidGremlin") == 0 then
      FireSequence("tl_minihub_zoneb_igc.ConversationalTrigger 01", "TLB_Gus_PaintInAroundHere")
    elseif TL_NautilusGears() == 6 and GetGlobal("TL_Nautilus_PaidGremlin") == 0 then
      FireSequence("tl_minihub_zoneb_igc.ConversationalTrigger 01", "TLB_Gus_FixingMachineUp")
    elseif TL_NautilusGears() == 9 and GetGlobal("TL_Nautilus_PaidGremlin") == 0 then
      FireSequence("tl_minihub_zoneb_igc.ConversationalTrigger 01", "TLB_Gus_AlmostThere")
    elseif TL_NautilusGears() == -3 and GetGlobal("TL_Nautilus_PaidGremlin") == 0 then
      FireSequence("tl_minihub_zoneb_igc.ConversationalTrigger 01", "TLB_Gus_ProbablyOperational")
    end
  end
end
TL_NautilusRise = L0_0
function L0_0()
  TL_NautilusRise()
end
NautilusGlobalCheck = L0_0
function L0_0()
  local L0_4, L1_5
end
TL_NautilusFall = L0_0
function L0_0()
  Disable("tl_minihub_zoneb.TriggerRotate 03")
  Enable("tl_minihub_zoneb.TriggerRotate 03")
  FireUser1("tl_minihub_zoneb_igc.grabcamerafancy 02.FancyCameraLookAt 01")
  wait(1)
  ShakeCamera(2.5, 8, 0, 0.75, 0.005, 0.005)
end
TL_CaveinPlatforms = L0_0
function L0_0()
  FireUser1("tl_minihub_zoneb_igc.grabcamerafancy_3pillars.FancyCameraLookAt 01")
  wait(1)
  AnimGBSequence("tl_minihub_zoneb.animatedsequencecycle 01.AnimatedObject", "Emerge")
  AnimGBSequence("tl_minihub_zoneb.AnimatedObject", "Emerge")
  AnimGBSequence("tl_minihub_zoneb.AnimatedObject 01", "Emerge")
  wait(1)
  ShakeCamera(2, 7, 0, 0.74, 0.004, 0.006)
end
TL_CaveinPlatforms2 = L0_0
function L0_0()
  DialogBoxAdvanced("Do you want to ride in the Not-a-lus", "Yes", "No")
  wait(0.25)
  if GetDialogResponse() == "No" then
    Bark(GetPlayer(), "Alright, come back when you are ready", 5)
  elseif GetDialogResponse() == "Yes" then
    TeleportToEntity(GetPlayer(), "tl_2d_nautilus.Marker(Parentable) 01")
  end
end
TL_TeleporttoNautilus = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_2")
end
TL_TeleporttoZoneD1 = L0_0
function L0_0()
  SetDefaultCameraValues(6.25, 5, 0)
  SetMap(nil, "MAP_TL_MINIHUB_ZONEB", "GAME")
end
NautiluslevelSetup = L0_0
function L0_0()
  SetDefaultCameraValues(6.25, 8, -7)
end
PlatforminglevelSetup = L0_0
function L0_0()
  if GetPropertyBool("tl_minihub_zoneb.TL_Minihub_ZoneB_Toon05 01", "Is Painted") == false and GetPropertyBool("tl_minihub_zoneb.TL_Minihub_ZoneB_Pillar2_TOON 02", "Is Painted") == false and GetPropertyInt("tl_minihub_zoneb.TL_Minihub_ZoneB_Pillar2_INERT 02", "Active Sequence ID") == 0 then
    AnimGBSequence("tl_minihub_zoneb.TL_Minihub_ZoneB_Pillar2_INERT 02", "FallWhole")
    ShakeCamera(0.5, 8, 0, 0.75, 0.005, 0.005)
    wait(1)
    ShakeCamera(1, 8, 0, 0.75, 0.005, 0.005)
  elseif GetPropertyBool("tl_minihub_zoneb.TL_Minihub_ZoneB_Toon05 01", "Is Painted") == true and GetPropertyBool("tl_minihub_zoneb.TL_Minihub_ZoneB_Pillar2_TOON 02", "Is Painted") == false and GetPropertyInt("tl_minihub_zoneb.TL_Minihub_ZoneB_Pillar2_INERT 02", "Active Sequence ID") == 0 then
    AnimGBSequence("tl_minihub_zoneb.TL_Minihub_ZoneB_Pillar2_INERT 02", "FallFirst")
    ShakeCamera(1, 8, 0, 0.75, 0.005, 0.005)
  elseif GetPropertyBool("tl_minihub_zoneb.TL_Minihub_ZoneB_Toon05 01", "Is Painted") == false and GetPropertyInt("tl_minihub_zoneb.TL_Minihub_ZoneB_Pillar2_INERT 02", "Active Sequence ID") == 1 then
    AnimGBSequence("tl_minihub_zoneb.TL_Minihub_ZoneB_Pillar2_INERT 02", "FallLast")
    wait(0.5)
    ShakeCamera(1, 8, 0, 0.75, 0.005, 0.005)
  end
end
TL_NotilusPillar2 = L0_0
function L0_0()
  StreamInterior(nil, "stream2D_1.part")
end
Stream2dMechanical1 = L0_0
function L0_0()
  ShakeCamera(0.5, 8, 0, 0.75, 0.005, 0.005)
  wait(1)
  ShakeCamera(1, 8, 0, 0.75, 0.005, 0.005)
end
PillarShake1 = L0_0
function L0_0()
  ShakeCamera(1, 8, 0, 0.75, 0.005, 0.005)
end
PillarShake2 = L0_0
function L0_0()
  EnableComponent("tl_minihub_zoneb.seq_projector 02.ProjectorPortal_Stand", "Usable")
end
TL_PortalEnable = L0_0
function L0_0()
  DisableComponent("tl_minihub_zoneb.seq_projector 02.ProjectorPortal_Stand", "Usable")
end
TL_PortalDisable = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("Notilus Room")
end
EndTracking = L0_0
function L0_0(A0_6)
  if GetGlobal("TLB_Gus_Crane2Done_Played") == 1 then
  end
end
TL_screenhide = L0_0
L0_0 = false
suppressTowerIncrements = L0_0
function L0_0(A0_7)
  Print("**************************************************************************************************")
  FireThread(loadscreenfade)
  StartTrackingCurrentLevelForScoring("Notilus Room")
  DestroyEntity("tl_minihub_zoneb_igc.TriggerRotate 03")
  if GetGlobal("TLB_Gus_CraneIntro_Played") == 1 then
    DestroyEntity("IntroLaunch")
  end
  suppressTowerIncrements = true
  if TL_NautilusGears() < 11 and GetGlobal("TL_Tower2") > 10 then
    SetGlobal("TLB_Gus_NiceJobGear_Played", 1)
    SetGlobal("TLB_Gus_GearOnEnd1_Played", 1)
    SetGlobal("TLB_Gus_FixingMachineUp_Played", 1)
    SetGlobal("TLB_Gus_Crane1Done_Played", 1)
    ForEachEntityInGroup(ForcePainted, "TL_ToonGears")
    SetGlobal("TL_Tower2", 56)
    wait(0.3)
  end
  if TL_NautilusGears() < 11 and 10 < GetGlobal("TL_Tower1") then
    SetGlobal("TLB_Gus_NiceJobGear_Played", 1)
    SetGlobal("TLB_Gus_GearOnEnd1_Played", 1)
    SetGlobal("TLB_Gus_FixingMachineUp_Played", 1)
    SetGlobal("TLB_Gus_Crane1Done_Played", 1)
    ForEachEntityInGroup(ForcePainted, "TL_ToonGears2")
    SetGlobal("TL_Tower1", 55)
    wait(0.3)
  end
  if GetGlobal("TLB_Gus_Crane2Done_Played") == 1 then
    ClearAllCameraAttributes()
    AnimGBSequence("tl_minihub_zoneb_art.animatedsequencecycle 05.AnimatedObject", "RestUp")
    AnimGBSequence("tl_minihub_zoneb_art.animatedsequencecycle 06.AnimatedObject", "RestUp")
    ForEachEntityInGroup(DestroyEntity, "NotHintMarkers")
    ForEachEntityInGroup(ForcePainted, "TL_ToonGears2")
    ForEachEntityInGroup(ForcePainted, "TL_ToonGears")
    Unhide("tl_minihub_zoneb.TriggerRotate 28")
    SetGlobal("TL_Tower2", 56)
    SetGlobal("TL_Tower1", 55)
    SetGlobal("TL_GearTowerDialog", 1)
    WaitForLevelLoad()
    wait(0.24)
    ForEachEntityInGroup(Unhide, "NautilusExitProjector")
  end
  if GetGlobal("TLB_Starr_freed") == 1 then
    ForEachEntityInGroup(DestroyEntity, "GremlinDialog")
    AnimGBSequence("tl_minihub_zoneb_art.animatedsequencecycle 08.AnimatedObject", "Open")
  end
  suppressTowerIncrements = false
end
TL_ZoneB_LoadCheckpoint = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "TL_ZoneB_LoadCheckpoint", "tl_minihub_zoneb.Start")
end
TL_ZoneB_SaveCheckpoint = L0_0
function L0_0()
  SaveQuestGlobal("TLB_Gus_Crane2Done_Played")
  SaveQuestGlobal("TL_NautilusGears")
  SaveQuestGlobal("TL_Nautilus_PaidGremlin")
  SaveQuestGlobal("TL_Nautilus_TicketCheck")
  SaveQuestGlobal("TL_GearTowerDialog")
  SaveQuestGlobal("TLB_Gus_AlmostThere_Played")
  SaveQuestGlobal("TLB_Gus_Crane1Done_Played")
  SaveQuestGlobal("TLB_Gus_CraneIntro_Played")
  SaveQuestGlobal("TLB_Gus_CraneProgress_Played")
  SaveQuestGlobal("TLB_Gus_FixingMachineUp_Played")
  SaveQuestGlobal("TLB_Gus_GearOnEnd1_Played")
  SaveQuestGlobal("TLB_Gus_NiceJobGear_Played")
  SaveQuestGlobal("TLB_Gus_NotalusTransition_Played")
  SaveQuestGlobal("TLB_Gus_OpeningScene_Played")
  SaveQuestGlobal("TLB_Gus_RideNotalus_Played")
  SaveQuestGlobal("TLB_Starr_NotEnoughCash_Played")
  SaveQuestGlobal("TLB_Starr_RepairGears_Played")
  SaveQuestGlobal("TLB_Starr_Thanks_Played")
  SaveQuestGlobal("TL_Tower1")
  SaveQuestGlobal("TL_Tower2")
  TL_ZoneB_SaveCheckpoint()
end
TL_ZoneB_NOTILUSSaveCheckpoint = L0_0
function L0_0()
  SaveQuestGlobal("TLB_Gus_Crane1Done_Played")
  SaveQuestGlobal("TL_GearTowerDialog")
  SaveQuestGlobal("TLB_Gus_AlmostThere_Played")
  SaveQuestGlobal("TLB_Gus_Crane1Done_Played")
  SaveQuestGlobal("TLB_Gus_CraneIntro_Played")
  SaveQuestGlobal("TLB_Gus_CraneProgress_Played")
  SaveQuestGlobal("TLB_Gus_FixingMachineUp_Played")
  SaveQuestGlobal("TLB_Gus_GearOnEnd1_Played")
  SaveQuestGlobal("TLB_Gus_NiceJobGear_Played")
  SaveQuestGlobal("TLB_Gus_NotalusTransition_Played")
  SaveQuestGlobal("TLB_Gus_OpeningScene_Played")
  SaveQuestGlobal("TLB_Gus_RideNotalus_Played")
  SaveQuestGlobal("TL_Tower1")
  TL_ZoneB_SaveCheckpoint()
end
TL_ZoneB_Tower1SaveCheckpoint = L0_0
function L0_0()
  SaveQuestGlobal("TLB_Gus_Crane1Done_Played")
  SaveQuestGlobal("TL_GearTowerDialog")
  SaveQuestGlobal("TLB_Gus_AlmostThere_Played")
  SaveQuestGlobal("TLB_Gus_Crane1Done_Played")
  SaveQuestGlobal("TLB_Gus_CraneIntro_Played")
  SaveQuestGlobal("TLB_Gus_CraneProgress_Played")
  SaveQuestGlobal("TLB_Gus_FixingMachineUp_Played")
  SaveQuestGlobal("TLB_Gus_GearOnEnd1_Played")
  SaveQuestGlobal("TLB_Gus_NiceJobGear_Played")
  SaveQuestGlobal("TLB_Gus_NotalusTransition_Played")
  SaveQuestGlobal("TLB_Gus_OpeningScene_Played")
  SaveQuestGlobal("TLB_Gus_RideNotalus_Played")
  SaveQuestGlobal("TL_Tower2")
  TL_ZoneB_SaveCheckpoint()
end
TL_ZoneB_Tower2SaveCheckpoint = L0_0
function L0_0()
  SaveQuestGlobal("TL_Goofy_PartCheck")
  SaveQuestGlobal("TLB_Gus_RedChest_Played")
  SaveQuestGlobal("TLB_Gus_GoofyPart_Played")
  TL_ZoneB_SaveCheckpoint()
end
TL_ZoneB_REDCHESTSaveCheckpoint = L0_0
function L0_0()
  local L0_8, L1_9
  NautiluslevelSetup = L0_8
  L0_8 = nil
  PillarShake1 = L0_8
  L0_8 = nil
  GoofyMovie_Increase = L0_8
  L0_8 = nil
  TL_screenhide = L0_8
  L0_8 = nil
  Tower2DialogCheck = L0_8
  L0_8 = nil
  TL_ZoneB_LoadCheckpoint = L0_8
  L0_8 = nil
  TL_ZoneB_REDCHESTSaveCheckpoint = L0_8
  L0_8 = nil
  TL_NautilusGremlin = L0_8
  L0_8 = nil
  TL_ZoneB_Tower1SaveCheckpoint = L0_8
  L0_8 = nil
  Tower1DialogDecrease = L0_8
  L0_8 = nil
  TL_ZoneB_SaveCheckpoint = L0_8
  L0_8 = nil
  TL_ALTGearsPaint = L0_8
  L0_8 = nil
  TL_NotilusPillar2 = L0_8
  L0_8 = nil
  NautIntro = L0_8
  L0_8 = nil
  Tower1DialogCheck = L0_8
  L0_8 = nil
  TL_NautToonRoofGear = L0_8
  L0_8 = nil
  TL_NautilusFall = L0_8
  L0_8 = nil
  Yes_RepairGears = L0_8
  L0_8 = nil
  NiceJobDialog = L0_8
  L0_8 = nil
  TL_ALTGearsThinner = L0_8
  L0_8 = nil
  Stream2dMechanical1 = L0_8
  L0_8 = nil
  TL_NautilusRise = L0_8
  L0_8 = nil
  TL_CaveinPlatforms = L0_8
  L0_8 = nil
  Tower1DialogIncrease = L0_8
  L0_8 = nil
  TL_TeleporttoNautilus = L0_8
  L0_8 = nil
  TeleportStarr = L0_8
  L0_8 = nil
  Gremlin_Paid = L0_8
  L0_8 = nil
  TL_PortalDisable = L0_8
  L0_8 = nil
  Tower2DialogDecrease = L0_8
  L0_8 = nil
  Movie_Increase = L0_8
  L0_8 = nil
  TL_ZoneB_Tower2SaveCheckpoint = L0_8
  L0_8 = nil
  Tower2DialogIncrease = L0_8
  L0_8 = nil
  PillarShake2 = L0_8
  L0_8 = nil
  NautilusGlobalCheck = L0_8
  L0_8 = nil
  Movie_Decrease = L0_8
  L0_8 = nil
  TL_TeleporttoZoneD1 = L0_8
  L0_8 = nil
  TL_ALTGear3Pillars = L0_8
  L0_8 = nil
  TL_ZoneB_NOTILUSSaveCheckpoint = L0_8
  L0_8 = nil
  PlatforminglevelSetup = L0_8
  L0_8 = nil
  TL_CaveinPlatforms2 = L0_8
  L0_8 = nil
  GoofyMovie_Decrease = L0_8
  L0_8 = nil
  TL_PortalEnable = L0_8
  L0_8 = nil
  EndTracking = L0_8
  L0_8 = nil
  Cleanup_TL_Nautilus = L0_8
end
Cleanup_TL_Nautilus = L0_0
