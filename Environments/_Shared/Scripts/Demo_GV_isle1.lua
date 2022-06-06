MickeyInHut = 0
HutLocMarker = ""
demo_gv_isle1_Spatterspawner1 = 1
demo_gv_isle1_Spatterspawner2 = 0
demo_gv_isle1_Spatterspawner3 = 0
demo_gv_isle1_Spatterspawner4 = 0
demo_gv_isle1_Spatterspawner5 = 0
demopath = "Environments/Demo/GSA/Demo_GV_"
isle1 = demopath .. "Isle1.gsa"
isle1u = demopath .. "Isle1_U.gsa"
isle2 = demopath .. "Isle2.gsa"
isle2u = demopath .. "Isle2_U.gsa"
isle3 = demopath .. "Isle3.gsa"
isle3u = demopath .. "Isle3_U.gsa"
isle4 = demopath .. "Isle4.gsa"
isle4u = demopath .. "Isle4_U.gsa"
zoo = demopath .. "Zoo.gsa"
gear1 = demopath .. "Gear_Transition_Area2.gsa"
demo_gv_streamGroups = {
  {
    isle1u,
    isle3,
    isle4
  },
  {isle3, isle4},
  {
    isle3,
    gear1,
    isle4
  },
  {gear1, isle3u}
}
function Demo_GV_StreamZones(A0_0, A1_1)
  local L2_2, L3_3
  L2_2 = demo_gv_streamGroups
  L3_3 = tonumber
  L3_3 = L3_3(A1_1)
  L2_2 = L2_2[L3_3]
  L3_3 = ""
  for _FORV_7_ = 1, #L2_2 do
    L3_3 = L3_3 .. L2_2[_FORV_7_] .. ","
  end
  Print(L3_3)
  StreamZones(A0_0, L3_3)
end
function demo_gv_isle1_destroyspawner(A0_4)
  DestroyEntity(A0_4)
end
function demo_gv_isle1_raiseplatform(A0_5, A1_6)
  SetSplineFollowerInitialSpeed(A1_6, 1)
end
function demo_gv_isle3_raiseplatform(A0_7, A1_8)
  SetSplineFollowerInitialSpeed(A1_8, 4)
end
function demo_gv_isle1_Enterportal(A0_9, A1_10)
  RestrictCutSceneInput()
  if GetGlobal("Gremlinfreed") == 0 then
    Bark(GetPlayer(), "Are you going to enter the portal and just leave Cicero caged like that?", 5, "Gus", "GUS:")
    wait(5)
  elseif GetGlobal("Gremlinfreed") == 1 and GetGlobal("demo_gv_isle1_donaldarm") == 0 then
    Bark(GetPlayer(), "Are you sure you want to leave that part of Donald behind when you enter the Portal?", 5, "Gus", "GUS:")
    wait(5)
  elseif GetGlobal("Gremlinfreed") == 1 and GetGlobal("demo_gv_isle1_donaldarm") == 1 then
    Bark(GetPlayer(), "Are you ready to revisit Clock Cleaners? Just go through the portal.", 5, "Gus", "GUS:")
    wait(5)
  end
  DialogBoxAdvanced("Enter the Portal?", "Yes", "No")
  wait(0.25)
  if GetDialogResponse() == "No" then
    Bark(GetPlayer(), "O.K. Come back when you are ready.", 3, "Gus", "Gus:")
    wait(1)
    UnrestrictCutSceneInput()
  elseif GetDialogResponse() == "Yes" then
    StreamZones(A0_9, "isle1u")
    WaitForLevelLoad()
    MoveToEntity(GetPlayer(), A0_9)
    SetConfigVariableString(GetPlayer(), "CameraFieldOfView", 60)
    SetConfigVariableString(GetPlayer(), "FreeCamera_2DMode_Active", false)
    SetConfigVariableString(GetPlayer(), "FreeCamera_LedgeCheck_Active", true)
    SetGlobal("Gremlinfreed", 2)
    UnrestrictCutSceneInput()
  end
end
function Isle4_enable_spawners()
  ForEachEntityInGroup(Enable, "demo_gv_isle4.Spawner 01")
end
function demo_gv_isle1_Enterportal2(A0_11)
  DialogBoxAdvanced("Enter the Portal?", "Yes", "No")
  wait(0.25)
  if GetDialogResponse() == "No" then
    Bark(GetPlayer(), "O.K. Come back when you are ready.", 3, "Gus", "Gus:")
    wait(1)
  elseif GetDialogResponse() == "Yes" then
    StreamZones(A0_11, "isle1u-2")
    WaitForLevelLoad()
    MoveToEntity(GetPlayer(), A0_11)
  end
end
function demo_gv_isle1_Enterportal3(A0_12)
  DialogBoxAdvanced("Enter the Portal?", "Yes", "No")
  wait(0.25)
  if GetDialogResponse() == "No" then
    Bark(GetPlayer(), "O.K. Come back when you are ready.")
    wait(1)
  elseif GetDialogResponse() == "Yes" then
    LoadLevel(GetPlayer(), "Environments/Demo/GSA/Demo_GV_Start3.level")
    SetGlobal("demo_gv_isle3_mickeycheck", 1)
  end
end
function demo_gv_isle3_mickeymove(A0_13)
  if GetGlobal("demo_gv_isle3_mickeycheck") == 1 then
    MoveToEntity(A0_13, "demo_gv_isle3.Marker(Rotatable) 01")
  end
end
function demo_gv_isle3_mickeymove2(A0_14)
  if GetGlobal("demo_gv_isle3_mickeycheck2") == 1 then
    MoveToEntity(A0_14, "demo_gv_gear_transition_area2.Isle3UPortalExit 01")
    SetPropertyFloat("demo_gv_2DTrans2.BottomPortal", "UsableRadius", 0)
  else
    SetPropertyFloat("demo_gv_2DTrans2.TopPortal", "UsableRadius", 0)
  end
end
function demo_gv_setglobal(A0_15, A1_16, A2_17)
  SetGlobal(A1_16, A2_17)
end
function demo_gv_isle3_Enterportal()
  DialogBoxAdvanced("Enter the Portal?", "Yes", "No")
  wait(0.25)
  if GetDialogResponse() == "No" then
    Bark(GetPlayer(), "O.K. Come back when you are ready.")
    wait(1)
  elseif GetDialogResponse() == "Yes" then
    if GetGlobal("demo_gv_isle3_portalpos") == 0 then
      MoveToEntity("demo_gv_gear_transition_area2.Demo_GV_PortalA1_Inert", "demo_gv_shared.Isle3PortalExit")
      MoveToEntity(GetPlayer(), "demo_gv_isle3_u.Marker(Rotatable) 02")
      SetGlobal("demo_gv_isle3_portalpos", 1)
    elseif GetGlobal("demo_gv_isle3_portalpos") == 1 then
      MoveToEntity("demo_gv_gear_transition_area2.Demo_GV_PortalA1_Inert", "demo_gv_shared.Isle3UPortalExit")
      LoadLevel(GetPlayer(), "Environments/Demo/GSA/Demo_GV_Start2.level")
      SetGlobal("demo_gv_isle3_portalpos", 0)
    end
  end
end
function demo_gv_transition2stream()
  if GetGlobal("demo_gv_isle3_portalpos") == 0 then
    Demo_GV_StreamZones(GetPlayer(), 4)
  elseif GetGlobal("demo_gv_isle3_portalpos") == 1 then
    Demo_GV_StreamZones(GetPlayer(), 3)
  end
end
function demo_gv_isle1_breakplatform(A0_18, A1_19)
  ForEachEntityInGroup(ClearParent, A1_19)
  AddPaladinPoints(GetPlayer(), 5)
end
function demo_gv_isle1_breakplatformpiece(A0_20, A1_21)
  ClearParent(A0_20)
  AudioPostEventOn(A1_21, "Play_sfx_inertcolumn_fracture")
end
function demo_gv_isle1_bunnyspawn(A0_22, A1_23)
  wait(0.2)
  if CSG_GetCompletionFraction(A0_22) == 1 then
    Enable(A1_23)
    AddPaladinPoints(GetPlayer(), 10)
  end
end
function demo_gv_isle1_moveplatforms(A0_24)
  wait(0.2)
  SetSplineFollowerInitialSpeed(A0_24, CSG_GetCompletionFraction(A0_24) * 3)
end
function demo_gv_isle1_freegremlin(A0_25)
  RestrictCutSceneInput()
  Bark(GetPlayer(), "Thank you so much! And now I'm off to make trouble for that ruffian Pete!", 3, "GremlinPurple", "Cicero:")
  Enable("demo_gv_isle1.Demo_GV_PopUpBuilding01_BSP 01")
  wait(1)
  GrabCamera("demo_gv_isle1.BunnyTubeCameraControlPoint 01", "demo_gv_isle1.DonaldArm 01", CAMERA_LERP_TRANSITION, 1)
  wait(1)
  DestroyEntity("demo_gv_isle1.Gremlin_Base 01")
  Bark(GetPlayer(), "Here, let me give you a hand. Hah, hah! Amusing, no?", 3, "GremlinPurple", "Cicero:")
  wait(2)
  Bark(GetPlayer(), "Must wander off now, yet I do hope we'll meet again!", 4, "GremlinPurple", "Cicero:")
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
  UnrestrictCutSceneInput()
  AddPaladinPoints(GetPlayer(), 50)
  SetGlobal("Gremlinfreed", 1)
end
function demo_gv_isle1_loadarena()
  LoadLevel(GetPlayer(), "Levels/Demo_GV_Coliseum_Start.level")
end
function demo_gv_isle3_gearcheck(A0_26, A1_27)
  if GetGlobal(A1_27) == 1 then
    ForceSketched(A0_26)
  end
end
function demo_gv_isle3_gusbark1()
  RestrictCutSceneInput()
  GrabCamera("demo_gv_isle1.IntroCameraControlPoint 02", "demo_gv_isle1.Demo_GV_SpatterSpawner 03", CAMERA_LERP_TRANSITION, 1.5)
  wait(4)
  GrabCamera("demo_gv_isle1.IntroCameraControlPoint 01", "demo_gv_isle1gremlin.Marker(Parentable) 01", CAMERA_LERP_TRANSITION, 1.5)
  Bark(GetPlayer(), "This was part of 'It's a Small World.' Gone a bit strange since the Thinner Disaster", 3, "Gus", "Gus:")
  wait(1)
  ShakeCamera_Default("camera")
  Rumble(GetPlayer(), 1.25)
  wait(4)
  GrabCamera("demo_gv_isle1.IntroCameraControlPoint 01", "demo_gv_isle1.Gremlin_Base 01", CAMERA_LERP_TRANSITION, 1.5)
  Bark(GetPlayer(), "We used to keep this ride in perfect order. But then Pete got loose!", 3, "Gus", "Gus:")
  wait(3)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
  UnrestrictCutSceneInput()
  wait(2)
  Enable("demo_gv_isle1.Spawner 03")
  PauseMenuObjectives(GetPlayer(), [[
Goal: 
 Follow Oswald Into the Projector Screen]])
end
function demo_gv_isle3_oswaldportal1()
  RestrictCutSceneInput()
  EnterCutscene("demo_gv_isle1.AI_Oswald 01")
  TeleportToEntity("demo_gv_isle1.AI_Oswald 01", "demo_gv_isle1.OswaldMarker1")
  DisableMotion("demo_gv_isle1.AI_Oswald 01")
  AnimVarInt("demo_gv_isle1.AI_Oswald 01", VAR_Cutscene, 5)
  AnimEvent("demo_gv_isle1.AI_Oswald 01", EVENT_Start_Cutscene)
  GrabCameraNif("demo_gv_isle1.oswald_IGC_GV_Island01 01", nil, 0, 0)
  AnimGBReset("demo_gv_isle1.oswald_IGC_GV_Island01 01")
  AnimGBSequence("demo_gv_isle1.oswald_IGC_GV_Island01 01", "oswald_IGC_Island01")
  Bark(GetPlayer(), "Wow! If that's who I think it is, you two could do great things together. Follow him!", 4, "Gus", "Gus:")
  wait(4)
  wait(0.3)
  wait(15)
  DestroyEntity("demo_gv_isle1.AI_Oswald 01")
  demo_gv_isle3_gusbark1()
end
function demo_gv_isle3_PeteAnim(A0_28, A1_29)
  wait(0.1)
  DisableMotion(A0_28)
  AnimVarInt(A0_28, VAR_Cutscene, A1_29)
  AnimEvent(A0_28, EVENT_Start_Cutscene)
end
function demo_gv_isle3_OswaldTicketIncrease()
  local L0_30
  L0_30 = "demo_gv_isle4.OswaldTicket"
  Unhide(L0_30)
end
function demo_gv_isle3_OswaldTicketDecrease()
  local L0_31
  L0_31 = "demo_gv_isle4.OswaldTicket"
  ForceSpawn(L0_31, 1)
  Hide(L0_31)
end
function demo_gv_isle3_oswaldPeteIGC()
  Enable("demo_gv_isle4.SpawnerPete")
  Enable("demo_gv_isle4.SpawnerOswald")
  wait(0.1)
  Bark(GetPlayer(), "Testing", 3)
  RestrictCutSceneInput()
  AudioPostEventOn("demo_gv_isle4.OutroMarker", "play_igc21_intro_island3")
  GrabCameraNif("demo_gv_isle4.Oswald_GV_Island03_camera 01", nil, 0, 0)
  AnimGBReset("demo_gv_isle4.Oswald_GV_Island03_camera 01")
  AnimGBSequence("demo_gv_isle4.Oswald_GV_Island03_camera 01", "Oswald_GV_Island_03_camera")
  wait(0.66)
  wait(10)
  Bark(GetPlayer(), "He's hiring Pete! I'm starting to think that rabbit's no friend of yours.", 4, "Gus", "Gus:")
  wait(1)
  wait(2)
  wait(6.1)
  wait(6)
  Enable("demo_gv_shared.Demo_GV_SteamboatA1_Inert 01")
  wait(4)
  SplineFollower_TeleportToKnot("demo_gv_shared.Demo_GV_SteamboatA1_Inert 01", "demo_gv_shared.BalloonSplineKnot 06")
  DestroyEntity("demo_gv_isle4.IGC_Pete")
  DestroyEntity("demo_gv_isle4.IGC_Oswald")
  ForEachEntityInGroup(Enable, "demo_gv_isle4.Spawner 01")
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
  UnrestrictCutSceneInput()
  wait(3)
  Bark(GetPlayer(), "Watch out! The Mad Doctor's Beetleworx machines have been out of control for some time now.", 5, "Gus", "Gus:")
end
function demo_gv_isle1_bunnycheck()
  SetGlobal("demo_gv_isle1_bunnyhut", 0)
end
function demo_gv_isle3_gusgremlin1()
  Bark(GetPlayer(), "That's Cicero! A real talker, but he kept this place running.", 3, "Gus", "GUS:")
end
function demo_gv_isle3_trappedgremlin1()
  Bark(GetPlayer(), "I'm most pleased to make your acquaintance, Mickey!", 3, "GremlinPurple", "Cicero:")
end
function demo_gv_isle3_gusleavelevel()
  Bark(GetPlayer(), "Home is just across here.", 3, "GremlinPurple", "Cicero:")
end
function demo_gv_isle1_Setup()
  ObjectiveNew(GetPlayer(), "donald", 5)
  demo_gv_donaldhead()
end
function demo_gv_donaldparts(A0_32)
  SetGlobal("demo_gv_isle3_donalparts", GetGlobal("demo_gv_isle3_donalparts") + 1)
  if GetGlobal("SugGifts") == 0 and GetGlobal("SugSnubs") == 0 then
    Bark(GetPlayer(), "You found part of Donald Duck!", 6, "Gus", "Gus:")
  elseif GetGlobal("SugGifts") == 1 and GetGlobal("SugSnubs") == 0 then
    Bark(GetPlayer(), "I can't believe you gave a part of Donald to Sug. Will you keep this one, at least?", 6, "Gus", "Gus:")
  elseif GetGlobal("SugGifts") == 2 and GetGlobal("SugSnubs") == 0 then
    Bark(GetPlayer(), "Another Donald part. I guess you'll be giving it to Sug now?", 6, "Gus", "Gus:")
  elseif GetGlobal("SugGifts") == 0 and GetGlobal("SugSnubs") == 1 then
    Bark(GetPlayer(), "Nice work Mickey! At this rate you'll have Donald back together in no time.", 6, "Gus", "Gus:")
  elseif GetGlobal("SugGifts") == 0 and GetGlobal("SugSnubs") == 2 then
    Bark(GetPlayer(), "Only one part left to find and you can reassemble your old pal", 6, "Gus", "Gus:")
  elseif GetGlobal("SugGifts") == 1 and GetGlobal("SugSnubs") == 1 then
    Bark(GetPlayer(), "You got another part! Donald may never be complete now but at least you have most of him", 6, "Gus", "Gus:")
  end
  if GetGlobal("demo_gv_isle3_donalparts") < 5 then
    DestroyEntity(A0_32)
    ObjectiveIncrement(GetPlayer(), "donald", 1)
    SetGlobal("demo_gv_SetSugPart", 1)
  elseif GetGlobal("demo_gv_isle3_donalparts") == 5 then
    ObjectiveComplete(GetPlayer(), "donald")
    DestroyEntity(A0_32)
  end
end
function demo_gv_donaldhead(A0_33)
  if GetGlobal("demo_gv_isle3_donalparts") < 5 then
    DestroyEntity(A0_33)
    ObjectiveIncrement(GetPlayer(), "donald", 1)
  elseif GetGlobal("demo_gv_isle3_donalparts") == 5 then
    ObjectiveComplete(GetPlayer(), "donald")
    DestroyEntity(A0_33)
  end
end
function demo_gv_isle1_gremlinHousethinned(A0_34)
  if GetGlobal("demo_gv_isle1_Housethinned") == 1 then
    Bark(GetPlayer(), "HEY! WHAT HAVE YOU DONE TO MY HOUSE!?", 3, "GremlinPurple", "Cicero:")
    AddScrapperPoints(GetPlayer(), 10)
  elseif GetGlobal("demo_gv_isle1_Housethinned") == 2 then
    Bark(GetPlayer(), "Now Mickey, thats not very nice", 3, "Gus", "Gus:")
    AddScrapperPoints(GetPlayer(), 10)
  end
end
function demo_gv_isle1_HouseSet(A0_35)
  SetPropertyBool(A0_35, "Inert", true)
end
function demo_gv_isle1_HouseSet2(A0_36)
  SetPropertyBool(A0_36, "Inert", false)
end
function demo_gv_isle1_Platform1InertSet(A0_37)
  SetPropertyBool(A0_37, "Inert", true)
end
function demo_gv_isle1_Platform1InertSet(A0_38)
  SetPropertyBool(A0_38, "Inert", false)
end
function demo_gv_isle1_PaladinPathBoost()
  SetGlobal("demo_gv_isle1_PaladinPath", GetGlobal("demo_gv_isle1_PaladinPath") + 1)
  demo_gv_isle1_PaladinPathCheck()
end
function demo_gv_isle1_ScrapperPathBoost()
  SetGlobal("demo_gv_isle1_PaladinPath", GetGlobal("demo_gv_isle1_PaladinPath") - 1)
  demo_gv_isle1_PaladinPathCheck()
end
function demo_gv_isle1_PaladinPathCheck()
  demo_gv_isle1_PaladinPathDialogCheck()
  if GetGlobal("demo_gv_isle1_PaladinPath") == 1 then
    Unhide("demo_gv_isle1.GVD_DecorationE1_Toon 01_2 01")
    Hide("demo_gv_isle1.GVD_DecorationE1_Toon 01_2 02")
  elseif GetGlobal("demo_gv_isle1_PaladinPath") == 2 then
    Unhide("demo_gv_isle1.GVD_DecorationE1_Toon 01_2 02")
    Hide("demo_gv_isle1.GVD_Firecrackers02_Toon 03_2 03")
  elseif GetGlobal("demo_gv_isle1_PaladinPath") == 3 then
    Unhide("demo_gv_isle1.GVD_Firecrackers02_Toon 03_2 03")
    Hide("demo_gv_isle1.GVD_Firecrackers02_Toon 03_2 02")
  elseif GetGlobal("demo_gv_isle1_PaladinPath") == 4 then
    Unhide("demo_gv_isle1.GVD_Firecrackers02_Toon 03_2 02")
    Hide("demo_gv_isle1.GVD_Firecrackers02_Toon 03_2 01")
  elseif GetGlobal("demo_gv_isle1_PaladinPath") == 5 then
    Unhide("demo_gv_isle1.GVD_Firecrackers02_Toon 03_2 01")
    Hide("demo_gv_isle1.GVD_CloudA1_Toon 02_2 01")
  elseif GetGlobal("demo_gv_isle1_PaladinPath") == 6 then
    Unhide("demo_gv_isle1.GVD_CloudA1_Toon 02_2 01")
    Hide("demo_gv_isle1.GVD_CloudA1_Toon 01_2 01")
  elseif GetGlobal("demo_gv_isle1_PaladinPath") == 7 then
    Unhide("demo_gv_isle1.GVD_CloudA1_Toon 01_2 01")
    Hide("demo_gv_isle1.GVD_CloudA1_Toon 03_2 01")
  elseif GetGlobal("demo_gv_isle1_PaladinPath") == 8 then
    Unhide("demo_gv_isle1.GVD_CloudA1_Toon 03_2 01")
  elseif GetGlobal("demo_gv_isle1_PaladinPath") == 0 then
    Hide("demo_gv_isle1.GVD_DecorationE1_Toon 01_2 01")
  end
end
function demo_gv_isle1_PaladinPathDialogCheck()
  if GetGlobal("demo_gv_isle1_PaladinPath") == 2 and GetGlobal("demo_gv_isle1_PaladinPathDialog") == 0 then
    Bark(GetPlayer(), "Wow, you're really cleaning this place up", 3, "Gus", "GUS:")
    SetGlobal("demo_gv_isle1_PaladinPathDialog", GetGlobal("demo_gv_isle1_PaladinPathDialog") + 1)
  elseif GetGlobal("demo_gv_isle1_PaladinPath") == 8 and GetGlobal("demo_gv_isle1_PaladinPathDialog") == 1 then
    Bark(GetPlayer(), "FANTASTIC! this is looking more like what I remember", 3, "Gus", "GUS:")
    SetGlobal("demo_gv_isle1_PaladinPathDialog", GetGlobal("demo_gv_isle1_PaladinPathDialog") + 1)
  elseif GetGlobal("demo_gv_isle1_PaladinPath") == 16 and GetGlobal("demo_gv_isle1_PaladinPathDialog") == 2 then
    Bark(GetPlayer(), "You really are the hero mickey", 3, "Gus", "GUS:")
    SetGlobal("demo_gv_isle1_PaladinPathDialog", GetGlobal("demo_gv_isle1_PaladinPathDialog") + 1)
  elseif GetGlobal("demo_gv_isle1_PaladinPath") == -2 and GetGlobal("demo_gv_isle1_ScrapperPathDialog") == 0 then
    Bark(GetPlayer(), "Now Mickey, that's not very nice", 3, "Gus", "GUS:")
    SetGlobal("demo_gv_isle1_ScrapperPathDialog", GetGlobal("demo_gv_isle1_ScrapperPathDialog") + 1)
  elseif GetGlobal("demo_gv_isle1_PaladinPath") == -8 and GetGlobal("demo_gv_isle1_ScrapperPathDialog") == 1 then
    Bark(GetPlayer(), "Remember when I said this place was looking strange, you're not helping", 3, "Gus", "GUS:")
    SetGlobal("demo_gv_isle1_ScrapperPathDialog", GetGlobal("demo_gv_isle1_ScrapperPathDialog") + 1)
  elseif GetGlobal("demo_gv_isle1_PaladinPath") == -16 and GetGlobal("demo_gv_isle1_ScrapperPathDialog") == 2 then
    Bark(GetPlayer(), "I didn't think this place could get any worse, you sure showed me!", 3, "Gus", "GUS:")
    SetGlobal("demo_gv_isle1_ScrapperPathDialog", GetGlobal("demo_gv_isle1_ScrapperPathDialog") + 1)
  end
end
function HutSpatterTracker(A0_39, A1_40)
  if GetGlobal(A1_40) == 1 then
    wait(0.5)
    ForceSketched(A0_39)
  end
end
function Hut1SpatterTracker(A0_41)
  if demo_gv_isle1_Spatterspawner1 == 1 then
    wait(0.3)
    ForceSketched(A0_41)
  end
end
function Hut2SpatterTracker(A0_42)
  if demo_gv_isle1_Spatterspawner2 == 1 then
    wait(0.3)
    ForceSketched(A0_42)
  end
end
function Hut3SpatterTracker(A0_43)
  if demo_gv_isle1_Spatterspawner3 == 1 then
    wait(0.3)
    ForceSketched(A0_43)
  end
end
function Hut2SpatterReveal()
  local L1_44
  L1_44 = 1
  demo_gv_isle1_Spatterspawner2 = L1_44
end
function Hut3SpatterReveal()
  local L1_45
  L1_45 = 1
  demo_gv_isle1_Spatterspawner3 = L1_45
end
function HutSpatterReveal(A0_46, A1_47)
end
function HutSpatterDestroyed(A0_48, A1_49)
end
function Hut1SpatterDestroyed()
  local L1_50
  L1_50 = 2
  demo_gv_isle1_Spatterspawner1 = L1_50
end
function Hut2SpatterDestroyed()
  local L1_51
  L1_51 = 2
  demo_gv_isle1_Spatterspawner2 = L1_51
end
function Hut3SpatterDestroyed()
  local L1_52
  L1_52 = 2
  demo_gv_isle1_Spatterspawner3 = L1_52
end
function demo_gv_isle1_MusicMagic()
  AudioPostEventOn("demo_gv_shared.Sound_Marker 01", "Play_music_gremlinvillage")
  wait(0.1)
  AudioSetState("demo_gv_shared.Sound_Marker 01", "Music_State", "GVArena")
end
function demo_gv_isle2_MusicMagic()
  AudioPostEventOn("demo_gv_shared.Sound_Marker 01", "Play_music_gremlinvillage")
  wait(0.1)
  AudioSetState("demo_gv_shared.Sound_Marker 01", "Music_State", "GVArena")
end
function demo_gv_isle2U_MusicMagic()
  AudioPostEventOn("demo_gv_shared.Sound_Marker 01", "Play_music_gremlinvillage")
  wait(0.1)
  AudioSetState("demo_gv_shared.Sound_Marker 01", "Music_State", "GVIsland2Underside")
end
function demo_gv_isle3_MusicMagic()
  AudioPostEventOn("demo_gv_shared.Sound_Marker 01", "Play_music_gremlinvillage")
  wait(0.1)
  AudioSetState("demo_gv_shared.Sound_Marker 01", "Music_State", "GVArena")
end
function demo_gv_Arena_MusicMagic()
  AudioPostEventOn("demo_gv_shared.Sound_Marker 01", "Play_music_gremlinvillage")
  wait(0.1)
  AudioSetState("demo_gv_shared.Sound_Marker 01", "Music_State", "Boss")
end
function demo_gv_2D_MusicMagic()
  AudioPostEventOn("demo_gv_shared.Sound_Marker 01", "Play_music_gremlinvillage")
  wait(0.1)
  AudioSetState("demo_gv_shared.Sound_Marker 01", "Music_State", "MiniGame1Play")
end
function demo_gv_2DWIN_MusicMagic()
  AudioPostEventOn("demo_gv_shared.Sound_Marker 01", "Play_music_gremlinvillage")
  wait(0.1)
  AudioSetState("demo_gv_shared.Sound_Marker 01", "Music_State", "MiniGame1Win")
end
function demo_gv_MusicMagicOff()
  AudioSetState("demo_gv_shared.Sound_Marker 01", "Music_State", "Ambience")
end
function demo_gv_isle1_KillBunny(A0_53)
  SetGlobal("demo_gv_isle1_totalbunnychildren", GetGlobal("demo_gv_isle1_totalbunnychildren") + 1)
  SetGlobal("TempBunnySet", GetGlobal("TempBunnySet") + 1)
  demo_gv_isle1_KillBunnyCam()
  if GetGlobal("TempBunnySet") == 0 then
    wait(1)
    DestroyEntity(A0_53)
    wait(2)
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
    wait(2)
    SetGlobal("TempBunnySet", 0)
  elseif GetGlobal("TempBunnySet") == 1 then
    wait(0.5)
    DestroyEntity(A0_53)
  elseif 1 < GetGlobal("TempBunnySet") then
    wait(0.3)
    DestroyEntity(A0_53)
  end
end
function demo_gv_isle1_KillBunnyCam(A0_54)
  if GetGlobal("BunnyCamSet") == 0 then
    SetGlobal("BunnyCamSet", 1)
    ForEachEntityInGroup(AI_SetDisabled, "demo_gv_isle1.SpatterGroup", true)
    AnimGBSequence("demo_gv_isle1.Demo_GV_BunnyBoxA1_Inert 01", "DoorsClose")
    GrabCamera("demo_gv_isle1.BunnyTubeCameraControlPoint 01", GetPlayer(), CAMERA_LERP_TRANSITION, 1)
    wait(1)
    AnimGBSequence("demo_gv_isle1.Demo_GV_BunnyBoxA1_Inert 01", "Zap")
    ShakeCamera_Default("camera")
    Rumble(GetPlayer(), 1.25)
    Bark(GetPlayer(), "That should send those bunnies safely back home. They do get into mischief, don't they?", 3, "Gus", "GUS:")
    wait(2)
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
    AnimGBSequence("demo_gv_isle1.Demo_GV_BunnyBoxA1_Inert 01", "DoorsOpen")
    ForEachEntityInGroup(AI_SetDisabled, "demo_gv_isle1.SpatterGroup", false)
    wait(2)
    AnimGBSequence("demo_gv_isle1.Demo_GV_BunnyBoxA1_Inert 01", "Rest")
    SetGlobal("BunnyCamSet", 0)
  end
end
function demo_gv_isle1_MickeyInHutTeleport(A0_55, A1_56, A2_57)
  if MickeyInHut == 1 then
    HutLocMarker = A2_57
    RestrictCutSceneInput()
    GrabCamera(A1_56, A0_55, CAMERA_LERP_TRANSITION, 1.5)
    wait(2.3)
    MoveToEntity(GetPlayer(), "demo_gv_shared.Marker(Rotatable) 01")
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
    UnrestrictCutSceneInput()
  end
end
function demo_gv_isle1_MickeyReturnTele(A0_58)
  MoveToEntity(A0_58, HutLocMarker)
end
function demo_gv_isle1_MickeyInHut()
  local L1_59
  L1_59 = 1
  MickeyInHut = L1_59
end
function demo_gv_isle1_MickeyOutOfHut()
  local L1_60
  L1_60 = 0
  MickeyInHut = L1_60
end
function demo_gv_GremlinDistress(A0_61)
  AudioPostEventOn(A0_61, "Play_vocal_gremlin_distress")
end
function demo_gv_GremlinDistressStop(A0_62)
  AudioPostEventOn(A0_62, "Stop_vocal_gremlin_distress")
end
function demo_gv_GremlinPlayInfo(A0_63)
  AudioPostEventOn(A0_63, "Play_vocal_gremlin_general_info")
end
function demo_gv_GremlinStopInfo(A0_64)
  AudioPostEventOn(A0_64, "Stop_vocal_gremlin_general_info")
end
function demo_gv_ProjectorStart(A0_65)
  AudioPostEventOn(A0_65, "Play_sfx_projector_portal")
end
function demo_gv_ProjectorStop(A0_66)
  AudioPostEventOn(A0_66, "Stop_sfx_projector_portal")
end
function demo_gv_isle1_DestroyCage(A0_67)
  ForEachEntityInGroup(DestroyEntity, "gremlin_cage_2")
end
function demo_gv_isle1_DonaldPartRecovered()
  Bark(GetPlayer(), "You have one of Donald's missing parts!", 3, "Gus", "Gus:")
  wait(3)
end
function demo_gv_donaldarm()
  SetGlobal("demo_gv_isle1_donaldarm", GetGlobal("demo_gv_isle1_donaldarm") + 1)
end
function demo_gv_SugQuest(A0_68, A1_69)
  local L2_70, L3_71
  L2_70 = GetGlobal
  L3_71 = "demo_gv_SetSugPart"
  L2_70 = L2_70(L3_71)
  if L2_70 == 1 then
    L2_70 = Unhide
    L3_71 = A0_68
    L2_70(L3_71)
    L2_70 = GrabCamera
    L3_71 = A1_69
    L2_70(L3_71, A0_68, CAMERA_LERP_TRANSITION, 1.5)
    L2_70 = RestrictCutSceneInput
    L2_70()
    L2_70 = AudioPostEventOn
    L3_71 = A0_68
    L2_70(L3_71, "Play_vocal_gremlin_general_info")
    L2_70 = GetGlobal
    L3_71 = "SugGifts"
    L2_70 = L2_70(L3_71)
    if L2_70 == 0 then
      L2_70 = GetGlobal
      L3_71 = "SugSnubs"
      L2_70 = L2_70(L3_71)
      if L2_70 == 0 then
        L2_70 = Bark
        L3_71 = GetPlayer
        L3_71 = L3_71()
        L2_70(L3_71, "Say there ole' chap! If you were to give me that Donald piece I would gladly imbue you with a permanent health bonus of TWO... what say you?", 6, "Sug", "Sug:")
        L2_70 = wait
        L3_71 = 6
        L2_70(L3_71)
      end
    else
      L2_70 = GetGlobal
      L3_71 = "SugGifts"
      L2_70 = L2_70(L3_71)
      if L2_70 == 1 then
        L2_70 = GetGlobal
        L3_71 = "SugSnubs"
        L2_70 = L2_70(L3_71)
        if L2_70 == 0 then
          L2_70 = Bark
          L3_71 = GetPlayer
          L3_71 = L3_71()
          L2_70(L3_71, "That extra health working for ya? For that Donald part I'll give you some more.", 6, "Sug", "Sug:")
          L2_70 = wait
          L3_71 = 6
          L2_70(L3_71)
        end
      else
        L2_70 = GetGlobal
        L3_71 = "SugGifts"
        L2_70 = L2_70(L3_71)
        if L2_70 == 2 then
          L2_70 = GetGlobal
          L3_71 = "SugSnubs"
          L2_70 = L2_70(L3_71)
          if L2_70 == 0 then
            L2_70 = Bark
            L3_71 = GetPlayer
            L3_71 = L3_71()
            L2_70(L3_71, "We've done great business so far. Care to extend you vitality another point? Just gimme that Donald part.", 6, "Sug", "Sug:")
            L2_70 = wait
            L3_71 = 6
            L2_70(L3_71)
          end
        else
          L2_70 = GetGlobal
          L3_71 = "SugGifts"
          L2_70 = L2_70(L3_71)
          if L2_70 == 0 then
            L2_70 = GetGlobal
            L3_71 = "SugSnubs"
            L2_70 = L2_70(L3_71)
            if L2_70 == 1 then
              L2_70 = Bark
              L3_71 = GetPlayer
              L3_71 = L3_71()
              L2_70(L3_71, "Here's another chance to trade that Donald bit you just found for a permanent health bonus of one.", 6, "Sug", "Sug:")
              L2_70 = wait
              L3_71 = 6
              L2_70(L3_71)
            end
          else
            L2_70 = GetGlobal
            L3_71 = "SugGifts"
            L2_70 = L2_70(L3_71)
            if L2_70 == 0 then
              L2_70 = GetGlobal
              L3_71 = "SugSnubs"
              L2_70 = L2_70(L3_71)
              if L2_70 == 2 then
                L2_70 = Bark
                L3_71 = GetPlayer
                L3_71 = L3_71()
                L2_70(L3_71, "This is my last offer. Gimme that Donald bit and I'll boost your health by 1", 6, "Sug", "Sug:")
                L2_70 = wait
                L3_71 = 6
                L2_70(L3_71)
              end
            else
              L2_70 = GetGlobal
              L3_71 = "SugGifts"
              L2_70 = L2_70(L3_71)
              if L2_70 == 1 then
                L2_70 = GetGlobal
                L3_71 = "SugSnubs"
                L2_70 = L2_70(L3_71)
                if L2_70 == 1 then
                  L2_70 = Bark
                  L3_71 = GetPlayer
                  L3_71 = L3_71()
                  L2_70(L3_71, "Let's keep a good thing going. Gimme that Donald bit and I'll boost your health by 1!", 6, "Sug", "Sug:")
                  L2_70 = wait
                  L3_71 = 6
                  L2_70(L3_71)
                end
              else
                L2_70 = GetGlobal
                L3_71 = "SugGifts"
                L2_70 = L2_70(L3_71)
                if L2_70 == 1 then
                  L2_70 = GetGlobal
                  L3_71 = "SugSnubs"
                  L2_70 = L2_70(L3_71)
                  if L2_70 == 2 then
                    L2_70 = Bark
                    L3_71 = GetPlayer
                    L3_71 = L3_71()
                    L2_70(L3_71, "We've done great business so far. Care to extend you vitality another point? Just gimme that Donald part.", 6, "Sug", "Sug:")
                    L2_70 = wait
                    L3_71 = 6
                    L2_70(L3_71)
                  end
                else
                  L2_70 = GetGlobal
                  L3_71 = "SugGifts"
                  L2_70 = L2_70(L3_71)
                  if L2_70 == 2 then
                    L2_70 = GetGlobal
                    L3_71 = "SugSnubs"
                    L2_70 = L2_70(L3_71)
                    if L2_70 == 1 then
                      L2_70 = Bark
                      L3_71 = GetPlayer
                      L3_71 = L3_71()
                      L2_70(L3_71, "That extra health working for ya? For that Donald part I'll give you some more.", 6, "Sug", "Sug:")
                      L2_70 = wait
                      L3_71 = 6
                      L2_70(L3_71)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    L2_70 = DialogBoxAdvanced
    L3_71 = "Keep the Donald piece?"
    L2_70(L3_71, "Keep", "Give", "", "", "Choice", true)
    L2_70 = wait
    L3_71 = 0.25
    L2_70(L3_71)
    L2_70 = GetDialogResponse
    L2_70 = L2_70()
    if L2_70 == "Yes" then
      L3_71 = SetGlobal
      L3_71("SugSnubs", GetGlobal("SugSnubs") + 1)
      L3_71 = GetGlobal
      L3_71 = L3_71("SugSnubs")
      if L3_71 == 1 then
        L3_71 = Bark
        L3_71(GetPlayer(), "Have it your way mate, best of luck out there", 3, "Sug", "Sug:")
        L3_71 = wait
        L3_71(3)
        L3_71 = Bark
        L3_71(GetPlayer(), "I knew Oswald was wrong about you.", 3, "Gus", "Gus:")
      else
        L3_71 = GetGlobal
        L3_71 = L3_71("SugSnubs")
        if L3_71 == 2 then
          L3_71 = Bark
          L3_71(GetPlayer(), "I don\146t get it. It's a win-win for us both.", 3, "Sug", "Sug:")
          L3_71 = wait
          L3_71(3)
          L3_71 = Bark
          L3_71(GetPlayer(), "You are wise, Mickey.", 3, "Gus", "Gus:")
        else
          L3_71 = GetGlobal
          L3_71 = L3_71("SugSnubs")
          if L3_71 == 3 then
            L3_71 = Bark
            L3_71(GetPlayer(), "I guess you are as straight laced as they say.", 3, "Sug", "Sug:")
            L3_71 = wait
            L3_71(3)
            L3_71 = Bark
            L3_71(GetPlayer(), "Maybe Sug is learning that you are a Hero.", 3, "Gus", "Gus:")
          end
        end
      end
    elseif L2_70 == "No" then
      L3_71 = SetGlobal
      L3_71("SugGifts", GetGlobal("SugGifts") + 1)
      L3_71 = GetPropertyInt
      L3_71 = L3_71(GetPlayer(), "MaxHealth")
      L3_71 = L3_71 + 1
      SetPropertyInt(GetPlayer(), "MaxHealth", L3_71)
      SetPropertyInt(GetPlayer(), "Health", L3_71)
      SetGlobal("demo_gv_isle3_donalparts", GetGlobal("demo_gv_isle3_donalparts") - 1)
      if GetGlobal("SugGifts") == 1 then
        Bark(GetPlayer(), "Here ya go ole' chap!", 3, "Sug", "Sug:")
        wait(3)
        Bark(GetPlayer(), "Wow Mickey. I'm quite surprised...", 3, "Gus", "Gus:")
      elseif GetGlobal("SugGifts") == 2 then
        Bark(GetPlayer(), "That\146s the spirit!", 3, "Sug", "Sug:")
        wait(3)
        Bark(GetPlayer(), "I know this isn't the 'real' Donald, but he deserves better.", 3, "Gus", "Gus:")
      elseif GetGlobal("SugGifts") == 3 then
        Bark(GetPlayer(), "You will be invincible!", 3, "Sug", "Sug:")
        wait(3)
        Bark(GetPlayer(), "Invincible. But at what cost?", 3, "Gus", "Gus:")
      end
    end
    L3_71 = SetGlobal
    L3_71("demo_gv_SetSugPart", GetGlobal("demo_gv_SetSugPart") - 1)
    L3_71 = Hide
    L3_71(A0_68)
    L3_71 = AudioPostEventOn
    L3_71(A0_68, "Stop_vocal_gremlin_general_info")
    L3_71 = ReleaseCamera
    L3_71(CAMERA_LERP_TRANSITION, 0)
    L3_71 = UnrestrictCutSceneInput
    L3_71()
  end
end
