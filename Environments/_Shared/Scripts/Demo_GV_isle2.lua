local L0_0, L1_1
function L0_0()
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
demo_gv_isle3_oswaldportal2 = L0_0
function L0_0(A0_2, A1_3)
  AnimGBReset(A0_2)
  AnimGBSequence(A0_2, "Appear")
  Enable(A1_3)
end
demo_gv_isle2_EnableSpawners = L0_0
function L0_0()
  local L0_4
  L0_4 = "demo_gv_isle3.OswaldCameraControlPoint 01"
  RestrictCutSceneInput()
  SetTransformation(L0_4, vector4(90.9, 18.5, -13), vector4(0, 0, 0))
  GrabCamera(L0_4, "demo_gv_isle3.CameraHut02", CAMERA_LERP_TRANSITION, 0.25)
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
  GrabCamera(L0_4, "demo_gv_isle3.IGC_BunnyChild", CAMERA_LERP_TRANSITION, 0.25)
  Bark(GetPlayer(), "Well would you look at that.  Awwww, that cute Bunny child found some playmates.", 4, "Gus", "Gus:")
  wait(4.5)
  SetPropertyBool(GetPlayer(), "Invisible", true)
  Bark(GetPlayer(), "HOLY TOLEDO.  Didya see that, Mickey?!!  We better make sure to keep those two away from each other or else there might be trouble for us.", 5, "Gus", "Gus:")
  wait(2.25)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
  UnrestrictCutSceneInput()
  SetPropertyBool(GetPlayer(), "Invisible", false)
end
demo_gv_isle3_IGC_BunnyEatSpatter = L0_0
L0_0 = 0
demo_gv_isle2_IGC_Tower = L0_0
function L0_0()
  local L0_5
  L0_5 = 1
  demo_gv_isle2_IGC_Tower = L0_5
  L0_5 = "demo_gv_isle3.OswaldCameraControlPoint 01"
  SetPropertyBool(GetPlayer(), "Invisible", true)
  RestrictCutSceneInput()
  SetTransformation(L0_5, vector4(32.7, 38.6, -30.9), vector4(0, 0, 0))
  wait(0.1)
  GrabCamera(L0_5, "demo_gv_isle3.IGC_TowerLook", CAMERA_LERP_TRANSITION, 3)
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
demo_gv_isle3_IGC_TowerObj = L0_0
function L0_0(A0_6, A1_7)
  if A1_7 == "1" then
    Bark(GetPlayer(), "Phew, we're almost there.", 3, "Gus", "Gus:")
  elseif A1_7 == "2" then
  else
    if A1_7 == "rand" then
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
demo_gv_isle3_RemindObj = L0_0
function L0_0(A0_8, A1_9, A2_10)
  if GetGlobal(A1_9) == 0 then
    ForEachEntityInGroup(AI_SetDisabled, "demo_gv_isle1.SpatterGroup", true)
    SetGlobal(A1_9, 1)
    AnimGBSequence(A0_8, "DoorsClose")
    GrabCamera(A2_10, GetPlayer(), CAMERA_LERP_TRANSITION, 1)
    wait(1)
    AnimGBSequence(A0_8, "Zap")
    ShakeCamera_Default("camera")
    Rumble(GetPlayer(), 1.25)
    wait(2)
    AnimGBSequence(A0_8, "DoorsOpen")
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
    wait(2)
    AnimGBSequence(A0_8, "Rest")
    ForEachEntityInGroup(AI_SetDisabled, "demo_gv_isle1.SpatterGroup", false)
  end
end
demo_gv_isle3_bunnydoor = L0_0
function L0_0(A0_11)
  SetGlobal("demo_gv_isle3_totalbunnychildren", GetGlobal("demo_gv_isle3_totalbunnychildren") + 1)
  Bark(GetPlayer(), "That'll rid you of the bunnies. I wonder where those tubes come out?", 3, "Gus", "GUS:")
  AnimGBSequence("demo_gv_isle3.Demo_GV_BunnyBoxA1_Inert 02", "DoorsClose")
  GrabCamera("demo_gv_isle3.BunnyTubeCameraControlPoint 01", GetPlayer(), CAMERA_LERP_TRANSITION, 1)
  wait(1)
  AnimGBSequence("demo_gv_isle3.Demo_GV_BunnyBoxA1_Inert 02", "Zap")
  DestroyEntity(A0_11)
  ShakeCamera_Default("camera")
  Rumble(GetPlayer(), 1.25)
  wait(2)
  AnimGBSequence("demo_gv_isle3.Demo_GV_BunnyBoxA1_Inert 02", "DoorsOpen")
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
  wait(2)
  AnimGBSequence("demo_gv_isle3.Demo_GV_BunnyBoxA1_Inert 02", "Rest")
end
demo_gv_isle3_KillBunny = L0_0
function L0_0()
  SetGlobal("demo_gv_isle3_bunnyhut", 0)
end
demo_gv_isle3_bunnycheck = L0_0
function L0_0(A0_12)
  local L1_13, L2_14, L3_15, L4_16
  L1_13 = GetGlobal
  L2_14 = "demo_gv_isle3U_TowerPosition"
  L1_13 = L1_13(L2_14)
  L2_14 = ""
  L3_15 = ""
  L4_16 = ""
  RestrictCutSceneInput()
  ForEachEntityInGroup(AI_SetDisabled, "demo_gv.SpatterGroup", true)
  if L1_13 == 0 then
    L3_15 = "You honor me with your kindness. Allow me to stop that nearby fan!"
    L2_14 = "demo_gv_isle3.OswaldCameraControlPoint 01"
    SetTransformation(L2_14, vector4(96.6, 18.9, -36.3), vector4(0, 54.03763, 0))
    L4_16 = "Hyperion"
  else
    L3_15 = "Ten thousand thanks! There's a gramophone up top of this cliff that is driving me bonkers!"
    L2_14 = "demo_gv_isle3.CameraFreeGremlin"
    L4_16 = "Ivor"
  end
  GrabCamera(L2_14, A0_12, CAMERA_LERP_TRANSITION, 0)
  SetPropertyBool(GetPlayer(), "Invisible", true)
  wait(2)
  AudioPostEventOn(A0_12, "Play_sfx_gremlin_hover")
  EnterCutscene(A0_12)
  AnimEvent(A0_12, EVENT_Start_Talk)
  Bark(GetPlayer(), L3_15, 3, "GremlinBlue", L4_16)
  wait(1)
  if L1_13 == 0 then
    wait(1.25)
    GrabCamera(L2_14, "demo_gv_isle3.Demo_GV_FanA1_Inert 01", CAMERA_LERP_TRANSITION, 1)
    wait(1.25)
    ForEachEntityInGroup(SetRotatorMaxSpeed, "demo_gv_isle3.Demo_GV_FanA1_Inert 01", 0)
    FireUser1("demo_gv_isle3.Demo_GV_FanA1_Inert 01")
    Disable("demo_gv_isle3.WindTrigger_InertFan")
    DestroyEntity("demo_gv_isle3.WindTrigger_InertFan")
  else
  end
  wait(2)
  DestroyEntity(A0_12)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
  UnrestrictCutSceneInput()
  SetPropertyBool(GetPlayer(), "Invisible", false)
  ForEachEntityInGroup(AI_SetDisabled, "demo_gv.SpatterGroup", false)
end
demo_gv_isle2_freegremlin = L0_0
function L0_0(A0_17, A1_18)
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
    Enable(A0_17)
    wait(1)
    Bark(GetPlayer(), "Good job Mickey, now we can reach the Cannon up top of the tower.", 3, "Gus", "GUS:")
  elseif 1 == 2 then
    DestroyEntity(A0_17)
    ForEachEntityInGroup(DestroyEntity, "demo_gv_isle3.PagodaCSGBottom")
    ForEachEntityInGroup(ForceSketched, "demo_gv_isle3.PagodaCSG_Bridge")
    AnimGBReset(A1_18)
    AnimGBSequence(A1_18, "RestDown")
    ForEachEntityInGroup(Disable, "demo_gv_isle2.TowerCams")
    DestroyEntity("demo_gv_isle3.CannonFromTower")
    Unhide("demo_gv_isle2.FallenBridgeGear")
    wait(1)
    Bark(GetPlayer(), "I still can't believe you wrecked that tower, but let's just cross that bridge, Mickey.", 3, "Gus", "GUS:")
  end
end
demo_gv_isle3_towerfixed = L0_0
function L0_0()
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
demo_gv_isle3_launchcutscene = L0_0
function L0_0(A0_19)
  SetAutoSave("demo_gv_isle3.Isle4Marker 01")
  demo_gv_isle3_oswaldPeteIGC()
end
demo_gv_isle2_bridgecollapse = L0_0
function L0_0()
  SetSplineFollowerInitialSpeed("demo_gv_isle2.Demo_GV_FallingBridgeA1_Inert 01", 30)
end
demo_gv_isle2_bridgedrop = L0_0
function L0_0(A0_20)
  wait(0.9)
  ClearParent(A0_20)
end
demo_gv_isle2_bridgedrop2 = L0_0
function L0_0()
  if demo_gv_isl2_PlayerOnCliff == true then
    demo_gv_isl2_PlayerOnCliff = false
    ForEachEntityInGroup(DestroyEntity, "demo_gv_isle2b.SpattersCliff")
  end
end
demo_gv_isle2b_KillCliffSpatters = L0_0
L0_0 = false
demo_gv_isl2_PlayerOnCliff = L0_0
function L0_0()
  if demo_gv_isl2_PlayerOnCliff == false then
    demo_gv_isle2_EnableSpawners("demo_gv_isle3.Demo_GV_SpatterSpawner 03", "demo_gv_isle3.Spawner 03")
    demo_gv_isl2_PlayerOnCliff = true
  end
end
demo_gv_isle2b_PlayerOnCliff = L0_0
function L0_0()
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
demo_gv_isle3_Underportal = L0_0
function L0_0()
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
demo_gv_isle3_UnderportalBottom = L0_0
function L0_0()
  local L0_21
  L0_21 = "demo_gv_isle3_u.UpsideDownCameraControlPoint 01"
  SetTransformation(L0_21, vector4(-52.2, 184.6, -37.5), vector4(0, -4.999993, 0))
  GrabCamera(L0_21, "demo_gv_isle1.Demo_GV_PortalA1_Inert 01", CAMERA_LERP_TRANSITION, 1.5)
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
demo_gv_isle2_CamFlipExit = L0_0
function L0_0(A0_22, A1_23)
  if GetPropertyBool("demo_gv_isle3.GremlinHut0" .. A1_23, "Is Painted") then
  elseif GetPropertyBool(A0_22, "TSCStartDisabled") then
    AnimGBReset("demo_gv_isle3.Demo_GV_SpatterSpawner 0" .. A1_23)
    AnimGBSequence("demo_gv_isle3.Demo_GV_SpatterSpawner 0" .. A1_23, "Appear")
    wait(1)
    Enable(A0_22)
  end
end
demo_gv_isle2_hivecheck = L0_0
function L0_0(A0_24, A1_25)
  if A1_25 == "start" then
    SetGlobal("Ability_WatchEnabled", 1)
    ForEachEntityInGroup(FireUser1, "ItemsAffectedByWatch")
  else
    SetGlobal("Ability_WatchEnabled", 0)
    ForEachEntityInGroup(FireUser2, "ItemsAffectedByWatch")
  end
end
Player_SetWatchVar = L0_0
function L0_0(A0_26, A1_27, A2_28)
  wait(0.1)
  if A2_28 == "painted" then
    ForcePainted(A0_26)
    if GetGlobal("Ability_WatchEnabled") == 0 then
      Enable(A1_27)
    end
  elseif A2_28 == "sketched" then
    Disable(A1_27)
  elseif GetPropertyBool(A0_26, "Is Painted") then
    if GetGlobal("Ability_WatchEnabled") == 1 then
      Disable(A1_27)
    end
  else
    Enable(A1_27)
  end
end
demo_gv_isle2_CartoonFanCheck = L0_0
function L0_0()
  if GetPropertyBool("demo_gv_isle3.Spawner 07", "TSCStartDisabled") then
    Bark(GetPlayer(), "Hey Mickey, I imagine we could use the watch sketch to get past that fan.  Who knows?  Maybe there will be something useful inside.", 3, "Gus", "GUS:")
  end
end
demo_gv_isle2_inertfanbark = L0_0
