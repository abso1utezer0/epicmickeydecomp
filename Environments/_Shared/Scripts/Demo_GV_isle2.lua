-- Fully reworked

function demo_gv_isle3_oswaldportal2()
  RestrictCutSceneInput()
  GrabCamera("demo_gv_isle3.OswaldCameraControlPoint 01", "demo_gv_isle3.OswaldMarker1 02", CAMERA_LERP_TRANSITION, 0.25)
  Bark(GetPlayer(), "There he is again. Seems like he really wants you to follow him.", 4, "Gus", "Gus:")
  DisableMotion("demo_gv_isle3.AI_Oswald 01")
  AnimVarInt("demo_gv_isle3.AI_Oswald 01", VAR_Cutscene, 6)
  AnimEvent("demo_gv_isle3.AI_Oswald 01", EVENT_Start_Cutscene)
  EnterCutscene("demo_gv_isle3.AI_Oswald 01")
  demo_gv_isle2_EnableSpawners("demo_gv_isle3.Demo_GV_SpatterSpawner 07", "demo_gv_isle3.Spawner 07")
  demo_gv_isle2_EnableSpawners("demo_gv_isle3.Demo_GV_SpatterSpawner 01", "demo_gv_isle3.Spawner 01")
  wait(4)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
  Bark(GetPlayer(), "He's headed to that portal, let's find a way up there and try to follow him.", 3, "Gus", "Gus:")
  wait(0.5)
  Enable("demo_gv_isle3.Island1_Platform01")
  Enable("demo_gv_isle3.Island1_Platform02")
  Enable("demo_gv_isle3.Island1_Platform03")
  AnimVarInt("demo_gv_isle3.Gremlin_1 01", VAR_AI_Misc, 1)
  AnimEvent("demo_gv_isle3.Gremlin_1 01", EVENT_AI_Misc)
  AudioPostEventOn("demo_gv_isle3.Gremlin_1 01", "Play_vocal_gremlin_distress")
  wait(0.5)
  PauseMenuObjectives(GetPlayer(), [[
 Goal: 
 Follow Oswald Into the Projector Screen]])
  UnrestrictCutSceneInput()
  DestroyEntity("demo_gv_isle3.AI_Oswald 01")
end

function demo_gv_isle2_EnableSpawners(param1, param2)
  AnimGBReset(param1)
  AnimGBSequence(param1, "Appear")
  Enable(param2)
end

function demo_gv_isle3_IGC_BunnyEatSpatter()
  RestrictCutSceneInput()
  SetTransformation("demo_gv_isle3.OswaldCameraControlPoint 01", vector4(90.9, 18.5, -13), vector4(0, 0, 0))
  GrabCamera("demo_gv_isle3.OswaldCameraControlPoint 01", "demo_gv_isle3.CameraHut02", CAMERA_LERP_TRANSITION, 0.25)
  SetPropertyBool(GetPlayer(), "Invisible", true)
  ForcePainted("demo_gv_isle2.IGCBunnySpawner")
  Enable("demo_gv_isle2.IGCBunnySpawner")
  wait(0.1)
  SetPropertyBool(GetPlayer(), "Invisible", true)
  GoToEntity("demo_gv_isle3.IGC_BunnyChild", "demo_gv_isle3.IGC_Eat_BC")
  MoveToEntity("demo_gv_isle3.IGC_Spatter", "demo_gv_isle3.IGC_Eat_BC")
  wait(0.1)
  GoToEntity("demo_gv_isle3.IGC_Spatter", "demo_gv_isle3.IGC_Eat_Spatter")
  wait(0.65)
  SetPropertyBool(GetPlayer(), "Invisible", true)
  GrabCamera("demo_gv_isle3.OswaldCameraControlPoint 01", "demo_gv_isle3.IGC_BunnyChild", CAMERA_LERP_TRANSITION, 0.25)
  Bark(GetPlayer(), "Well would you look at that.  Awwww, that cute Bunny child found some playmates.", 4, "Gus", "Gus:")
  wait(4.5)
  SetPropertyBool(GetPlayer(), "Invisible", true)
  Bark(GetPlayer(), "HOLY TOLEDO.  Didya see that, Mickey?!!  We better make sure to keep those two away from each other or else there might be trouble for us.", 5, "Gus", "Gus:")
  wait(2.25)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
  UnrestrictCutSceneInput()
  SetPropertyBool(GetPlayer(), "Invisible", false)
end

demo_gv_isle2_IGC_Tower = 0

function demo_gv_isle3_IGC_TowerObj()
  demo_gv_isle2_IGC_Tower = 1
  SetPropertyBool(GetPlayer(), "Invisible", true)
  RestrictCutSceneInput()
  SetTransformation("demo_gv_isle3.OswaldCameraControlPoint 01", vector4(32.7, 38.6, -30.9), vector4(0, 0, 0))
  wait(0.1)
  GrabCamera("demo_gv_isle3.OswaldCameraControlPoint 01", "demo_gv_isle3.IGC_TowerLook", CAMERA_LERP_TRANSITION, 3)
  Bark(GetPlayer(), "Hmm, part of that tower is missing.  The other half must be on the other side of the island.", 2.75, "Gus", "Gus:")
  wait(3)
  Bark(GetPlayer(), "I imagine we can fix it and make our way across to the next island.", 2.75, "Gus", "Gus:")
  wait(3)
  Bark(GetPlayer(), "Well, we better try to find a way we can get beneath it.  Maybe there is a portal nearby?", 3, "Gus", "Gus:")
  wait(1.5)
  wait(0.75)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
  UnrestrictCutSceneInput()
  SetPropertyBool(GetPlayer(), "Invisible", false)
end

function demo_gv_isle3_RemindObj(param1, param2)
  if param2 == "1" then
    Bark(GetPlayer(), "Phew, we're almost there.", 3, "Gus", "Gus:")
  elseif param2 == "2" then
  else
    if param2 == "rand" then
      if GetGlobal("demo_gv_isle3_mickeycheck2") == 1 then
        Bark(GetPlayer(), "Let's hurry to the other island, Mickey!", 2, "Gus", "Gus:")
      elseif GetGlobal("demo_gv_isle3_mickeycheck") == 1 then
      elseif demo_gv_isle2_IGC_Tower == 0 then
        Bark(GetPlayer(), "Looks like Oswald headed into that portal, let's hurry up and try to catch him.", 4, "Gus", "Gus:")
      end
    else
    end
  end
end

function demo_gv_isle3_bunnydoor(param1, param2, param3)
  if GetGlobal(param2) == 0 then
    ForEachEntityInGroup(AI_SetDisabled, "demo_gv_isle1.SpatterGroup", true)
    SetGlobal(param2, 1)
    AnimGBSequence(param1, "DoorsClose")
    GrabCamera(param3, GetPlayer(), CAMERA_LERP_TRANSITION, 1)
    wait(1)
    AnimGBSequence(param1, "Zap")
    ShakeCamera_Default("camera")
    Rumble(GetPlayer(), 1.25)
    wait(2)
    AnimGBSequence(param1, "DoorsOpen")
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
    wait(2)
    AnimGBSequence(param1, "Rest")
    ForEachEntityInGroup(AI_SetDisabled, "demo_gv_isle1.SpatterGroup", false)
  end
end

function demo_gv_isle3_KillBunny(param1)
  SetGlobal("demo_gv_isle3_totalbunnychildren", GetGlobal("demo_gv_isle3_totalbunnychildren") + 1)
  Bark(GetPlayer(), "That'll rid you of the bunnies. I wonder where those tubes come out?", 3, "Gus", "GUS:")
  AnimGBSequence("demo_gv_isle3.Demo_GV_BunnyBoxA1_Inert 02", "DoorsClose")
  GrabCamera("demo_gv_isle3.BunnyTubeCameraControlPoint 01", GetPlayer(), CAMERA_LERP_TRANSITION, 1)
  wait(1)
  AnimGBSequence("demo_gv_isle3.Demo_GV_BunnyBoxA1_Inert 02", "Zap")
  DestroyEntity(param1)
  ShakeCamera_Default("camera")
  Rumble(GetPlayer(), 1.25)
  wait(2)
  AnimGBSequence("demo_gv_isle3.Demo_GV_BunnyBoxA1_Inert 02", "DoorsOpen")
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
  wait(2)
  AnimGBSequence("demo_gv_isle3.Demo_GV_BunnyBoxA1_Inert 02", "Rest")
end

function demo_gv_isle3_bunnycheck()
  SetGlobal("demo_gv_isle3_bunnyhut", 0)
end

function demo_gv_isle2_freegremlin(param1)
  local var1, var2, var3
  var1 = ""
  var2 = ""
  var3 = ""
  RestrictCutSceneInput()
  ForEachEntityInGroup(AI_SetDisabled, "demo_gv.SpatterGroup", true)
  if GetGlobal("demo_gv_isle3U_TowerPosition") == 0 then
    var2 = "You honor me with your kindness. Allow me to stop that nearby fan!"
    var1 = "demo_gv_isle3.OswaldCameraControlPoint 01"
    SetTransformation(var1, vector4(96.6, 18.9, -36.3), vector4(0, 54.03763, 0))
    var3 = "Hyperion"
  else
    var2 = "Ten thousand thanks! There's a gramophone up top of this cliff that is driving me bonkers!"
    var1 = "demo_gv_isle3.CameraFreeGremlin"
    var3 = "Ivor"
  end
  GrabCamera(var1, param1, CAMERA_LERP_TRANSITION, 0)
  SetPropertyBool(GetPlayer(), "Invisible", true)
  wait(2)
  AudioPostEventOn(param1, "Play_sfx_gremlin_hover")
  EnterCutscene(param1)
  AnimEvent(param1, EVENT_Start_Talk)
  Bark(GetPlayer(), var2, 3, "GremlinBlue", var3)
  wait(1)
  if GetGlobal("demo_gv_isle3U_TowerPosition") == 0 then
    wait(1.25)
    GrabCamera(var1, "demo_gv_isle3.Demo_GV_FanA1_Inert 01", CAMERA_LERP_TRANSITION, 1)
    wait(1.25)
    ForEachEntityInGroup(SetRotatorMaxSpeed, "demo_gv_isle3.Demo_GV_FanA1_Inert 01", 0)
    FireUser1("demo_gv_isle3.Demo_GV_FanA1_Inert 01")
    Disable("demo_gv_isle3.WindTrigger_InertFan")
    DestroyEntity("demo_gv_isle3.WindTrigger_InertFan")
  else
  end
  wait(2)
  DestroyEntity(param1)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
  UnrestrictCutSceneInput()
  SetPropertyBool(GetPlayer(), "Invisible", false)
  ForEachEntityInGroup(AI_SetDisabled, "demo_gv.SpatterGroup", false)
end

function demo_gv_isle3_towerfixed(param1, param2)
  if GetGlobal("demo_gv_isle3U_TowerPosition") == 0 then
    SetGlobal("demo_gv_isle3U_TowerPosition", 1)
    wait(0.1)
  end
  Disable("demo_gv_shared.Demo_GV_SteamboatA1_Inert 01")
  SplineFollower_TeleportToKnot("demo_gv_shared.Demo_GV_SteamboatA1_Inert 01", "demo_gv_shared.SK_IGC_Zep1")
  PauseMenuObjectives(GetPlayer(), [[
 Goal: 
 Use the Tower to Cross the Gap to the Next Island ]])
  AnimVarInt("demo_gv_isle3b.Gremlin_1", VAR_AI_Misc, 1)
  AnimEvent("demo_gv_isle3b.Gremlin_1", EVENT_AI_Misc)
  AudioPostEventOn("demo_gv_isle3b.Gremlin_1", "Play_vocal_gremlin_distress")
  demo_gv_isle2_EnableSpawners("demo_gv_isle3.Demo_GV_SpatterSpawner 05", "demo_gv_isle3.Spawner 05")
  demo_gv_isle2_EnableSpawners("demo_gv_isle3.Demo_GV_SpatterSpawner 06", "demo_gv_isle3.Spawner 06")
  GoToEntity("demo_gv_isle3.Spatters_Island2", "demo_gv_isle3.Marker_Hut04")
  if 1 == 1 then
    Enable(param1)
    wait(1)
    Bark(GetPlayer(), "Good job Mickey, now we can reach the Cannon up top of the tower.", 3, "Gus", "GUS:")
  elseif 1 == 2 then
    DestroyEntity(param1)
    ForEachEntityInGroup(DestroyEntity, "demo_gv_isle3.PagodaCSGBottom")
    ForEachEntityInGroup(ForceSketched, "demo_gv_isle3.PagodaCSG_Bridge")
    AnimGBReset(param2)
    AnimGBSequence(param2, "RestDown")
    ForEachEntityInGroup(Disable, "demo_gv_isle2.TowerCams")
    DestroyEntity("demo_gv_isle3.CannonFromTower")
    Unhide("demo_gv_isle2.FallenBridgeGear")
    wait(1)
    Bark(GetPlayer(), "I still can't believe you wrecked that tower, but let's just cross that bridge, Mickey.", 3, "Gus", "GUS:")
  end
end

function demo_gv_isle3_launchcutscene()
  RestrictCutSceneInput()
  Disable("demo_gv_isle3.Trigger_BridgeCollapse")
  MoveToEntity(GetPlayer(), "demo_gv_isle3.Isle4Marker")
  SetAutoSave("demo_gv_isle3.Isle4Marker 01")
  GrabCameraNif("demo_gv_isle3.CannonFromTowerCamera", nil, 0, 0)
  SetPropertyBool(GetPlayer(), "Invisible", true)
  AnimGBReset("demo_gv_isle3.CannonFromTowerCamera")
  AnimGBSequence("demo_gv_isle3.CannonFromTowerCamera", "CannonFromTower")
  AnimGBReset("demo_gv_isle3.CannonFromTower")
  AnimGBSequence("demo_gv_isle3.CannonFromTower", "CannonMickey")
  Bark(GetPlayer(), "Let's get you to the other side with a bang!", 3, "Gus", "GUS:")
  Rumble(GetPlayer(), 1)
  ForEachEntityInGroup(FireUser1, "demo_gv_isle2.Island2")
  wait(1.5)
  ForEachEntityInGroup(Unhide, "demo_gv_isle3.ShamsForIsland3")
  wait(0.35)
  demo_gv_isle3_oswaldPeteIGC()
end

function demo_gv_isle2_bridgecollapse(param1)
  SetAutoSave("demo_gv_isle3.Isle4Marker 01")
  demo_gv_isle3_oswaldPeteIGC()
end

function demo_gv_isle2_bridgedrop()
  SetSplineFollowerInitialSpeed("demo_gv_isle2.Demo_GV_FallingBridgeA1_Inert 01", 30)
end

function demo_gv_isle2_bridgedrop2(param1)
  wait(0.9)
  ClearParent(param1)
end

function demo_gv_isle2b_KillCliffSpatters()
  if demo_gv_isl2_PlayerOnCliff == true then
    demo_gv_isl2_PlayerOnCliff = false
    ForEachEntityInGroup(DestroyEntity, "demo_gv_isle2b.SpattersCliff")
  end
end

demo_gv_isl2_PlayerOnCliff = false
function demo_gv_isle2b_PlayerOnCliff()
  if demo_gv_isl2_PlayerOnCliff == false then
    demo_gv_isle2_EnableSpawners("demo_gv_isle3.Demo_GV_SpatterSpawner 03", "demo_gv_isle3.Spawner 03")
    demo_gv_isl2_PlayerOnCliff = true
  end
end

function demo_gv_isle3_Underportal()
  if GetGlobal("demo_gv_isle3U_TowerPosition") == 0 then
    DialogBoxAdvanced("Enter Portal?", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "O.K. Come back when you are ready.", 3, "Gus", "Gus:")
      wait(1)
    elseif GetDialogResponse() == "Yes" then
      LoadLevel(GetPlayer(), "Levels/Demo_GV_Start6.level")
      SetConfigVariableString(GetPlayer(), "CameraFieldOfView", 60)
      SetConfigVariableString(GetPlayer(), "FreeCamera_2DMode_Active", false)
      SetConfigVariableString(GetPlayer(), "FreeCamera_LedgeCheck_Active", true)
      SetGlobal("Gremlinfreed", 2)
    end
  else
    SetGlobal("demo_gv_isle3_mickeycheck", 1)
    DialogBoxAdvanced("Enter Portal", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "O.K. Come back when you are ready.", 3, "Gus", "Gus:")
      wait(1)
    elseif GetDialogResponse() == "Yes" then
      LoadLevel(GetPlayer(), "Levels/Demo_GV_Start6.level")
      SetConfigVariableString(GetPlayer(), "CameraFieldOfView", 60)
      SetConfigVariableString(GetPlayer(), "FreeCamera_2DMode_Active", false)
      SetConfigVariableString(GetPlayer(), "FreeCamera_LedgeCheck_Active", true)
      SetGlobal("Gremlinfreed", 2)
    end
  end
end

function demo_gv_isle3_UnderportalBottom()
  if GetGlobal("demo_gv_isle3U_TowerPosition") == 0 then
    DialogBoxAdvanced("Enter the Portal?", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "O.K. Come back when you are ready.", 3, "Gus", "Gus:")
      wait(1)
    elseif GetDialogResponse() == "Yes" then
      LoadLevel(GetPlayer(), "Levels/Demo_GV_Start5.level")
      SetConfigVariableString(GetPlayer(), "CameraFieldOfView", 60)
      SetConfigVariableString(GetPlayer(), "FreeCamera_2DMode_Active", false)
      SetConfigVariableString(GetPlayer(), "FreeCamera_LedgeCheck_Active", true)
      SetGlobal("Gremlinfreed", 2)
    end
  end
end

function demo_gv_isle2_CamFlipExit()
  SetTransformation("demo_gv_isle3_u.UpsideDownCameraControlPoint 01", vector4(-52.2, 184.6, -37.5), vector4(0, -4.999993, 0))
  GrabCamera("demo_gv_isle3_u.UpsideDownCameraControlPoint 01", "demo_gv_isle1.Demo_GV_PortalA1_Inert 01", CAMERA_LERP_TRANSITION, 1.5)
  RestrictCutSceneInput()
  wait(1.5)
  UnrestrictCutSceneInput()
  wait(0.1)
  DialogBoxAdvanced("Enter the Portal?", "Yes", "No")
  wait(0.1)
  if GetDialogResponse() == "No" then
    Bark(GetPlayer(), "O.K. Come back when you are ready.")
    RestrictCutSceneInput()
    ReleaseCamera(CAMERA_LERP_TRANSITION, 1)
    wait(1)
    UnrestrictCutSceneInput()
  elseif GetDialogResponse() == "Yes" then
    RestrictCutSceneInput()
    SetConfigVariableString(GetPlayer(), "CameraUpsidedown", "true")
    ReleaseCamera(CAMERA_LERP_TRANSITION, 2)
    wait(2)
    UnrestrictCutSceneInput()
    SetConfigVariableString(GetPlayer(), "CameraFieldOfView", 60)
    SetConfigVariableString(GetPlayer(), "CameraUpsidedown", "false")
    LoadLevel(GetPlayer(), "Environments/Demo/GSA/Demo_GV_Start4.level")
  end
  SetGlobal("demo_gv_isle3_mickeycheck2", 1)
end

function demo_gv_isle2_hivecheck(param1, param2)
  if GetPropertyBool("demo_gv_isle3.GremlinHut0" .. param2, "Is Painted") then
  elseif GetPropertyBool(param1, "TSCStartDisabled") then
    AnimGBReset("demo_gv_isle3.Demo_GV_SpatterSpawner 0" .. param2)
    AnimGBSequence("demo_gv_isle3.Demo_GV_SpatterSpawner 0" .. param2, "Appear")
    wait(1)
    Enable(param1)
  end
end

function Player_SetWatchVar(param1, param2)
  if param2 == "start" then
    SetGlobal("Ability_WatchEnabled", 1)
    ForEachEntityInGroup(FireUser1, "ItemsAffectedByWatch")
  else
    SetGlobal("Ability_WatchEnabled", 0)
    ForEachEntityInGroup(FireUser2, "ItemsAffectedByWatch")
  end
end

function demo_gv_isle2_CartoonFanCheck(param1, param2, param3)
  wait(0.1)
  if param3 == "painted" then
    ForcePainted(param1)
    if GetGlobal("Ability_WatchEnabled") == 0 then
      Enable(param2)
    end
  elseif param3 == "sketched" then
    Disable(param2)
  elseif GetPropertyBool(param1, "Is Painted") then
    if GetGlobal("Ability_WatchEnabled") == 1 then
      Disable(param2)
    end
  else
    Enable(param2)
  end
end

function demo_gv_isle2_inertfanbark()
  if GetPropertyBool("demo_gv_isle3.Spawner 07", "TSCStartDisabled") then
    Bark(GetPlayer(), "Hey Mickey, I imagine we could use the watch sketch to get past that fan.  Who knows?  Maybe there will be something useful inside.", 3, "Gus", "GUS:")
  end
end