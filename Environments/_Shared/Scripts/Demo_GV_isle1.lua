-- Fully reworked

-- this file is pure unfiltered hell

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

function Demo_GV_StreamZones(var1, var2)
  local invar1, invar2
  invar2 = tonumber(var2)
  invar1 = demo_gv_streamGroups[invar2]
  invar2 = ""
  for _FORV_7_ = 1, #invar1 do
    invar2 = invar2 .. invar1[_FORV_7_] .. ","
  end
  Print(invar2)
  StreamZones(var1, invar2)
end

function demo_gv_isle1_destroyspawner(var1)
  DestroyEntity(var1)
end

function demo_gv_isle1_raiseplatform(var1, var2)
  SetSplineFollowerInitialSpeed(var2, 1)
end

function demo_gv_isle3_raiseplatform(var1, var2)
  SetSplineFollowerInitialSpeed(var2, 4)
end

function demo_gv_isle1_Enterportal(var1, var2)
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
    StreamZones(var1, "isle1u")
    WaitForLevelLoad()
    MoveToEntity(GetPlayer(), var1)
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

function demo_gv_isle1_Enterportal2(var1)
  DialogBoxAdvanced("Enter the Portal?", "Yes", "No")
  wait(0.25)
  if GetDialogResponse() == "No" then
    Bark(GetPlayer(), "O.K. Come back when you are ready.", 3, "Gus", "Gus:")
    wait(1)
  elseif GetDialogResponse() == "Yes" then
    StreamZones(var1, "isle1u-2")
    WaitForLevelLoad()
    MoveToEntity(GetPlayer(), var1)
  end
end

function demo_gv_isle1_Enterportal3(var1)
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

function demo_gv_isle3_mickeymove(var1)
  if GetGlobal("demo_gv_isle3_mickeycheck") == 1 then
    MoveToEntity(var1, "demo_gv_isle3.Marker(Rotatable) 01")
  end
end

function demo_gv_isle3_mickeymove2(var1)
  if GetGlobal("demo_gv_isle3_mickeycheck2") == 1 then
    MoveToEntity(var1, "demo_gv_gear_transition_area2.Isle3UPortalExit 01")
    SetPropertyFloat("demo_gv_2DTrans2.BottomPortal", "UsableRadius", 0)
  else
    SetPropertyFloat("demo_gv_2DTrans2.TopPortal", "UsableRadius", 0)
  end
end

function demo_gv_setglobal(var1, var2, var3)
  SetGlobal(var2, var3)
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

function demo_gv_isle1_breakplatform(var1, var2)
  ForEachEntityInGroup(ClearParent, var2)
  AddPaladinPoints(GetPlayer(), 5)
end

function demo_gv_isle1_breakplatformpiece(var1, var2)
  ClearParent(var1)
  AudioPostEventOn(var2, "Play_sfx_inertcolumn_fracture")
end

function demo_gv_isle1_bunnyspawn(var1, var2)
  wait(0.2)
  if CSG_GetCompletionFraction(var1) == 1 then
    Enable(var2)
    AddPaladinPoints(GetPlayer(), 10)
  end
end

function demo_gv_isle1_moveplatforms(var1)
  wait(0.2)
  SetSplineFollowerInitialSpeed(var1, CSG_GetCompletionFraction(var1) * 3)
end

function demo_gv_isle1_freegremlin(var1)
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

function demo_gv_isle3_gearcheck(var1, var2)
  if GetGlobal(var2) == 1 then
    ForceSketched(var1)
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
  Unhide("demo_gv_isle4.OswaldTicket")
end

function demo_gv_isle3_OswaldTicketDecrease()
  local invar1
  invar1 = "demo_gv_isle4.OswaldTicket"
  ForceSpawn(invar1, 1)
  Hide(invar1)
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

function demo_gv_donaldparts(var1)
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
    DestroyEntity(var1)
    ObjectiveIncrement(GetPlayer(), "donald", 1)
    SetGlobal("demo_gv_SetSugPart", 1)
  elseif GetGlobal("demo_gv_isle3_donalparts") == 5 then
    ObjectiveComplete(GetPlayer(), "donald")
    DestroyEntity(var1)
  end
end

function demo_gv_donaldhead(var1)
  if GetGlobal("demo_gv_isle3_donalparts") < 5 then
    DestroyEntity(var1)
    ObjectiveIncrement(GetPlayer(), "donald", 1)
  elseif GetGlobal("demo_gv_isle3_donalparts") == 5 then
    ObjectiveComplete(GetPlayer(), "donald")
    DestroyEntity(var1)
  end
end

function demo_gv_isle1_gremlinHousethinned(var1)
  if GetGlobal("demo_gv_isle1_Housethinned") == 1 then
    Bark(GetPlayer(), "HEY! WHAT HAVE YOU DONE TO MY HOUSE!?", 3, "GremlinPurple", "Cicero:")
    AddScrapperPoints(GetPlayer(), 10)
  elseif GetGlobal("demo_gv_isle1_Housethinned") == 2 then
    Bark(GetPlayer(), "Now Mickey, thats not very nice", 3, "Gus", "Gus:")
    AddScrapperPoints(GetPlayer(), 10)
  end
end

function demo_gv_isle1_HouseSet(var1)
  SetPropertyBool(var1, "Inert", true)
end

function demo_gv_isle1_HouseSet2(var1)
  SetPropertyBool(var1, "Inert", false)
end

function demo_gv_isle1_Platform1InertSet(var1)
  SetPropertyBool(var1, "Inert", true)
end

function demo_gv_isle1_Platform1InertSet(var1)
  SetPropertyBool(var1, "Inert", false)
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

function HutSpatterTracker(var1, var2)
  if GetGlobal(var2) == 1 then
    wait(0.5)
    ForceSketched(var1)
  end
end

function Hut1SpatterTracker(var1)
  if demo_gv_isle1_Spatterspawner1 == 1 then
    wait(0.3)
    ForceSketched(var1)
  end
end

function Hut2SpatterTracker(var1)
  if demo_gv_isle1_Spatterspawner2 == 1 then
    wait(0.3)
    ForceSketched(var1)
  end
end

function Hut3SpatterTracker(var1)
  if demo_gv_isle1_Spatterspawner3 == 1 then
    wait(0.3)
    ForceSketched(var1)
  end
end

function Hut2SpatterReveal()
  demo_gv_isle1_Spatterspawner2 = 1
end

function Hut3SpatterReveal()
  demo_gv_isle1_Spatterspawner3 = 1
end

function HutSpatterReveal(var1, var2)
end

function HutSpatterDestroyed(var1, var2)
end

function Hut1SpatterDestroyed()
  demo_gv_isle1_Spatterspawner1 = 2
end

function Hut2SpatterDestroyed()
  demo_gv_isle1_Spatterspawner2 = 2
end

function Hut3SpatterDestroyed()
  demo_gv_isle1_Spatterspawner3 = 2
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

function demo_gv_isle1_KillBunny(var1)
  SetGlobal("demo_gv_isle1_totalbunnychildren", GetGlobal("demo_gv_isle1_totalbunnychildren") + 1)
  SetGlobal("TempBunnySet", GetGlobal("TempBunnySet") + 1)
  demo_gv_isle1_KillBunnyCam()
  if GetGlobal("TempBunnySet") == 0 then
    wait(1)
    DestroyEntity(var1)
    wait(2)
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
    wait(2)
    SetGlobal("TempBunnySet", 0)
  elseif GetGlobal("TempBunnySet") == 1 then
    wait(0.5)
    DestroyEntity(var1)
  elseif 1 < GetGlobal("TempBunnySet") then
    wait(0.3)
    DestroyEntity(var1)
  end
end

function demo_gv_isle1_KillBunnyCam(var1)
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

function demo_gv_isle1_MickeyInHutTeleport(var1, var2, var3)
  if MickeyInHut == 1 then
    HutLocMarker = var3
    RestrictCutSceneInput()
    GrabCamera(var2, var1, CAMERA_LERP_TRANSITION, 1.5)
    wait(2.3)
    MoveToEntity(GetPlayer(), "demo_gv_shared.Marker(Rotatable) 01")
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
    UnrestrictCutSceneInput()
  end
end

function demo_gv_isle1_MickeyReturnTele(var1)
  MoveToEntity(var1, HutLocMarker)
end

function demo_gv_isle1_MickeyInHut()
  MickeyInHut = 1
end

function demo_gv_isle1_MickeyOutOfHut()
  MickeyInHut = 0
end

function demo_gv_GremlinDistress(var1)
  AudioPostEventOn(var1, "Play_vocal_gremlin_distress")
end

function demo_gv_GremlinDistressStop(var1)
  AudioPostEventOn(var1, "Stop_vocal_gremlin_distress")
end

function demo_gv_GremlinPlayInfo(var1)
  AudioPostEventOn(var1, "Play_vocal_gremlin_general_info")
end

function demo_gv_GremlinStopInfo(var1)
  AudioPostEventOn(var1, "Stop_vocal_gremlin_general_info")
end

function demo_gv_ProjectorStart(var1)
  AudioPostEventOn(var1, "Play_sfx_projector_portal")
end

function demo_gv_ProjectorStop(var1)
  AudioPostEventOn(var1, "Stop_sfx_projector_portal")
end

function demo_gv_isle1_DestroyCage(var1)
  ForEachEntityInGroup(DestroyEntity, "gremlin_cage_2")
end

function demo_gv_isle1_DonaldPartRecovered()
  Bark(GetPlayer(), "You have one of Donald's missing parts!", 3, "Gus", "Gus:")
  wait(3)
end

function demo_gv_donaldarm()
  SetGlobal("demo_gv_isle1_donaldarm", GetGlobal("demo_gv_isle1_donaldarm") + 1)
end

-- this function takes up 200 lines of code for like 20 dialog lines.
--
-- whoever wrote this yandev level else if statement should not be allowed to program ever again.

function demo_gv_SugQuest(var1, var2)

  local invar1, invar2
  invar2 = "demo_gv_SetSugPart"
  invar1 = GetGlobal(invar2)

  if invar1 == 1 then

    Unhide(var1)
    GrabCamera(var2, var1, CAMERA_LERP_TRANSITION, 1.5)
    RestrictCutSceneInput()
    AudioPostEventOn(var1, "Play_vocal_gremlin_general_info")

    if GetGlobal("SugGifts") == 0 then

      invar1 = GetGlobal("SugSnubs")

      if invar1 == 0 then

        Bark(GetPlayer(), "Say there ole' chap! If you were to give me that Donald piece I would gladly imbue you with a permanent health bonus of TWO... what say you?", 6, "Sug", "Sug:")
        wait(6)

      end

    else

      if GetGlobal("SugGifts") == 1 then
        if GetGlobal("SugSnubs") == 0 then
          Bark(GetPlayer(), "That extra health working for ya? For that Donald part I'll give you some more.", 6, "Sug", "Sug:")
          wait(6)
        end

      else

        if GetGlobal("SugGifts") == 2 then

          if GetGlobal("SugSnubs") == 0 then
            Bark(GetPlayer(), "We've done great business so far. Care to extend you vitality another point? Just gimme that Donald part.", 6, "Sug", "Sug:")
            wait(6)
          end

        else

          if GetGlobal("SugGifts") == 0 then

            if GetGlobal("SugSnubs") == 1 then
              Bark(GetPlayer(), "Here's another chance to trade that Donald bit you just found for a permanent health bonus of one.", 6, "Sug", "Sug:")
              wait(6)
            end

          else

            if GetGlobal("SugGifts") == 0 then

              if GetGlobal("SugSnubs") == 2 then
                Bark(GetPlayer(), "This is my last offer. Gimme that Donald bit and I'll boost your health by 1", 6, "Sug", "Sug:")
                wait(6)
              end

            else

              if GetGlobal("SugGifts") == 1 then

                if GetGlobal("SugSnubs") == 1 then
                  Bark(GetPlayer(), "Let's keep a good thing going. Gimme that Donald bit and I'll boost your health by 1!", 6, "Sug", "Sug:")
                  wait(6)
                end

              else

                if GetGlobal("SugGifts") == 1 then

                  if GetGlobal("SugSnubs") == 2 then
                    Bark(GetPlayer(), "We've done great business so far. Care to extend you vitality another point? Just gimme that Donald part.", 6, "Sug", "Sug:")
                    wait(6)
                  end

                else

                  if GetGlobal("SugGifts") == 2 then

                    if GetGlobal("SugSnubs") == 1 then
                      Bark(GetPlayer(), "That extra health working for ya? For that Donald part I'll give you some more.", 6, "Sug", "Sug:")
                      wait(6)
                    end

                  end

                end

              end

            end

          end
          
        end

      end

    end

    DialogBoxAdvanced("Keep the Donald piece?", "Keep", "Give", "", "", "Choice", true)
    wait(0.25)
    if GetDialogResponse() == "Yes" then

      SetGlobal("SugSnubs", GetGlobal("SugSnubs") + 1)

      if GetGlobal("SugSnubs") == 1 then

        Bark(GetPlayer(), "Have it your way mate, best of luck out there", 3, "Sug", "Sug:")
        wait(3)
        Bark(GetPlayer(), "I knew Oswald was wrong about you.", 3, "Gus", "Gus:")

      else

        if GetGlobal("SugSnubs") == 2 then

          Bark(GetPlayer(), "I don\146t get it. It's a win-win for us both.", 3, "Sug", "Sug:")
          wait(3)
          Bark(GetPlayer(), "You are wise, Mickey.", 3, "Gus", "Gus:")

        else

          if GetGlobal("SugSnubs") == 3 then

            Bark(GetPlayer(), "I guess you are as straight laced as they say.", 3, "Sug", "Sug:")
            wait(3)
            Bark(GetPlayer(), "Maybe Sug is learning that you are a Hero.", 3, "Gus", "Gus:")

          end

        end

      end

    elseif GetDialogResponse() == "No" then

      SetGlobal("SugGifts", GetGlobal("SugGifts") + 1)
      invar2 = GetPropertyInt(GetPlayer(), "MaxHealth")
      invar2 = invar2 + 1
      SetPropertyInt(GetPlayer(), "MaxHealth", invar2)
      SetPropertyInt(GetPlayer(), "Health", invar2)
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

    SetGlobal("demo_gv_SetSugPart", GetGlobal("demo_gv_SetSugPart") - 1)
    Hide(var1)
    AudioPostEventOn(var1, "Stop_vocal_gremlin_general_info")
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
    UnrestrictCutSceneInput()

  end

end