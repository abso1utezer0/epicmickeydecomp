local L0_0, L1_1
function L0_0()
  if GetGlobal("demo_gv_isle3U_FirstVisit") == 0 then
    RestrictCutSceneInput()
    SetConfigVariableString(GetPlayer(), "CameraUpsidedown", "true")
    wait(2)
    Bark(GetPlayer(), "Well, this isn't going to work. I'll fix it. Just a second...", 3, "Gus", "Gus:")
    wait(1)
    GrabCamera("demo_gv_isle3_u.UpsideDownCameraControlPoint 01", GetPlayer(), CAMERA_LERP_TRANSITION, 3)
    wait(3)
    SetConfigVariableString(GetPlayer(), "CameraUpsidedown", "false")
    Bark(GetPlayer(), "Ahhh. Much better", 4, "Gus", "Gus:")
    wait(1)
    demo_gv_isle3U_GoalReveal()
  end
end
demo_gv_isle3u_upsidedowncamera = L0_0
function L0_0()
  local L0_2
  L0_2 = GetGlobal
  L0_2 = L0_2("demo_gv_isle3U_FirstVisit")
  if L0_2 == 0 then
    L0_2 = SetGlobal
    L0_2("demo_gv_isle3U_FirstVisit", 1)
    L0_2 = RestrictCutSceneInput
    L0_2()
    L0_2 = "demo_gv_isle3_u.UndersideGoalRevealCameraControlPoint 01"
    GrabCamera(L0_2, "demo_gv_isle3_u.Demo_GV_BigBenA2_Inert 02", CAMERA_LERP_TRANSITION, 1.5)
    wait(3)
    Bark(GetPlayer(), "Tsk...shoddy work on those tower supports.  They are just barely holding that tower in place. Better leave them alone or face the consequences!", 7, "Gus", "Gus:")
    GrabCamera("demo_gv_isle3_u.UndersideGoalRevealCameraControlPoint 07", "demo_gv_isle3_u.GVD_GearA2_Toon 04", CAMERA_LERP_TRANSITION, 0)
    wait(7)
    GrabCamera("demo_gv_isle3_u.UndersideGoalRevealCameraControlPoint 02", nil, CAMERA_LERP_TRANSITION, 1)
    wait(0.75)
    Bark(GetPlayer(), "A gremlin! He must have been the one to keep that tower in top form.  If we free him, maybe he will help us.", 5, "Gus", "Gus:")
    wait(5)
    GrabCamera("demo_gv_isle3_u.UpsideDownCameraControlPoint 01", GetPlayer(), CAMERA_LERP_TRANSITION, 0)
    ReleaseCamera(CAMERA_LERP_TRANSITION, 1)
    UnrestrictCutSceneInput()
  end
end
demo_gv_isle3U_GoalReveal = L0_0
function L0_0(A0_3)
  if GetGlobal("demo_gv_isle3U_TowerPosition") == 0 then
    AnimVarInt("demo_gv_isle3_u.Gremlin_Base 01", VAR_AI_Misc, 1)
    AnimEvent("demo_gv_isle3_u.Gremlin_Base 01", EVENT_AI_Misc)
    EnterCutscene("demo_gv_isle3_u.Gremlin_Base 01")
    wait(1)
    DisableMotion("demo_gv_isle3_u.Gremlin_Base 01")
  else
    DestroyEntity(A0_3)
    DestroyEntity("demo_gv_isle3_u.Gremlin_CageBottom")
    SetRotatorMaxSpeed("demo_gv_isle3_u.Demo_GV_BigBenA2_Inert 02", 400)
    Enable("demo_gv_isle3_u.Demo_GV_BigBenA2_Inert 02")
  end
end
demo_gv_isle3U_SetupGremlin = L0_0
function L0_0()
  local L0_4
  L0_4 = "demo_gv_isle3_u.Gremlin_Base 01"
  GrabCamera("demo_gv_isle3_u.TowerRestoreCameraControlPoint 01", nil, CAMERA_LERP_TRANSITION, 0)
  MoveToEntity(GetPlayer(), "demo_gv_isle3_u.MickeyAtGremlin")
  wait(0.25)
  RestrictCutSceneInput()
  AnimEvent(L0_4, EVENT_Start_Talk)
  if GetGlobal("demo_gv_isle3U_TowerPosition") == 0 then
    SetGlobal("demo_gv_isle3U_TowerPosition", 1)
    wait(0.5)
    Bark(GetPlayer(), "Thanks for freeing me, old chap. You trying to get to that island over there, ya?", 4, "GremlinBlue", "Durbar:")
    wait(4.25)
    Bark(GetPlayer(), "Well, if I remember correctly there is a cannon on the top. Just hang tight.", 4, "GremlinBlue", "Durbar:")
    AnimEvent("demo_gv_isle3_u.Gremlin_Base 01", EVENT_Start_EmoteHappy)
    wait(2.5)
    GrabCamera("demo_gv_isle3_u.TowerRestoreCameraControlPoint 01", "demo_gv_isle3_u.Demo_GV_BigBenA2_Inert 02", CAMERA_LERP_TRANSITION, 0.75)
    SetVisualScale(L0_4, 0.3)
    AnimVarInt(L0_4, VAR_Cutscene, 1)
    AnimEvent(L0_4, EVENT_Start_Cutscene)
    SetTransformation(L0_4, vector4(-39.2, 181.4, -63.1), vector4(0, -80, 0))
    wait(0.75)
    SetTransformation(L0_4, vector4(-39.5, 191.6, -59.8), vector4(-180, -50, -180))
    wait(0.75)
    SetTransformation(L0_4, vector4(-37.1, 190.3, -64.3), vector4(0, -50, 0))
    wait(1)
    SetTransformation(L0_4, vector4(-39.3, 196, -61.7), vector4(0, -90, 0))
    Bark(GetPlayer(), "How helpful! He's fixing the tower so we can reach the cannon at the top. Wow! See that detail? Did some of it myself!", 5, "Gus", "Gus:")
    wait(0.75)
    SetTransformation(L0_4, vector4(-39.7, 185.4, -60.4), vector4(0, -80, 0))
    wait(0.75)
    SetTransformation(L0_4, vector4(-39, 191.4, -58.6), vector4(-180, -40, -180))
    wait(0.75)
    SetTransformation(L0_4, vector4(-39.5, 191.6, -59.8), vector4(-180, -50, -180))
    wait(0.75)
    SetTransformation(L0_4, vector4(-37.1, 190.3, -64.3), vector4(0, -50, 0))
    wait(0.75)
    SetTransformation(L0_4, vector4(-39.2, 181.4, -63.1), vector4(0, -80, 0))
    wait(0.75)
    SetTransformation(L0_4, vector4(0, 0, 0), vector4(0, -50, 0))
    Enable("demo_gv_isle3_u.Demo_GV_BigBenA2_Inert 02")
    SetRotatorMaxSpeed("demo_gv_isle3_u.Demo_GV_BigBenA2_Inert 02", 40)
    ForEachEntityInGroup(Enable, "GearCovers")
    ForEachEntityInGroup(SetRotatorMaxSpeed, "GearCovers", 40)
    wait(0.5)
    wait(4.5)
    ShakeCamera(2, 2, 0.05, 3, 0.2, 0.05)
    wait(1)
    SetGlobal("demo_gv_isle3U_Gremlinsaved", 1)
    GrabCamera("demo_gv_isle3_u.TowerRestoreCameraControlPoint 01", "demo_gv_isle3_u.beetleworxaim", CAMERA_LERP_TRANSITION, 1)
    Bark(GetPlayer(), "All fixed! Let me stop these contraptions for you as well.", 5, "GremlinBlue", "Durbar:")
    ForEachEntityInGroup(Unhide, "GearCovers2")
    ForEachEntityInGroup(Hide, "GearCovers")
    ForEachEntityInGroup(Unhide, "demo_gv_isle1.Demo_GV_PortalA1_Inert 01")
    SetPropertyBool("demo_gv_isle3_u.GVD_GearA2_Toon 04", "AIHintEnabled", false)
    SetPropertyBool("demo_gv_isle3_u.GVD_GearA2_Toon 05", "AIHintEnabled", false)
    wait(4)
    GrabCamera("demo_gv_isle3_u.UndersideGoalRevealCameraControlPoint 05", "demo_gv_isle1.Demo_GV_PortalA1_Inert 01", CAMERA_LERP_TRANSITION, 5)
    wait(4)
    Bark(GetPlayer(), "A new filmstrip! Let's head through it, and check out that cannon!", 5, "Gus", "Gus:")
    SetPropertyFloat("demo_gv_isle1.Demo_GV_PortalA1_Inert 01", "UsableRadius", 2)
    wait(3.5)
    AddPaladinPoints(GetPlayer(), 40)
    AudioPostEventOn("demo_gv_isle1.Demo_GV_PortalA1_Inert 01", "Play_sfx_projector_portal")
    ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
  elseif GetGlobal("demo_gv_isle3U_TowerPosition") == 2 then
    Bark(GetPlayer(), "What the heck did you do? You destroyed the tower!", 4, "GremlinBlue", "Durbar:")
    wait(3)
    Bark(GetPlayer(), "You gotta clean this up yourself. Later!", 4, "GremlinBlue", "Durbar:")
    wait(3)
    DestroyEntity("demo_gv_isle3_u.Gremlin_Base 01")
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
  end
  UnrestrictCutSceneInput()
end
demo_gv_isle3U_GremlinFreed = L0_0
function L0_0(A0_5, A1_6)
  if GetGlobal(A1_6) == 0 then
    SetGlobal(A1_6, 1)
  elseif GetGlobal(A1_6) == 1 then
    SetGlobal(A1_6, 0)
  end
  if GetGlobal("demo_gv_isle3U_Gear2Thinnedglobal") == 1 and GetGlobal("demo_gv_isle3U_Gear1Thinnedglobal") == 1 and GetGlobal("demo_gv_isle3U_TowerPosition") == 0 then
    SetPropertyBool(GetPlayer(), "Invisible", true)
    SetGlobal("demo_gv_isle3U_TowerPosition", 2)
    RestrictCutSceneInput()
    MoveToEntity(GetPlayer(), "demo_gv_isle2u.IGC_ScrapperPlayerPos")
    GrabCamera("demo_gv_isle3_u.UndersideGoalRevealCameraControlPoint 03", "demo_gv_isle3_u.Demo_GV_BigBenA2_Inert 02", CAMERA_LERP_TRANSITION, 1)
    wait(0.5)
    SetSplineFollowerInitialSpeed("demo_gv_isle3_u.Demo_GV_BigBenA2_Inert 02", 35)
    wait(0.5)
    Bark(GetPlayer(), "Mickey! I... How... How could you?! We spent years constructing that!", 4, "Gus", "Gus:")
    wait(3)
    ForEachEntityInGroup(Unhide, "demo_gv_isle3_u.Demo_GV_BigBenA5_BSP12 01")
    GrabCamera("demo_gv_isle3_u.UndersideGoalRevealCameraControlPoint 04", "ScrapperFallingTower", CAMERA_LERP_TRANSITION, 0)
    Bark(GetPlayer(), "Well at least some good came out of this, look the other half made a path for us to get across!", 5, "Gus", "Gus:")
    AnimGBReset("ScrapperFallingTower")
    AnimGBSequence("ScrapperFallingTower", "FallDown")
    ShakeCamera(2, 2, 0.05, 3, 0.2, 0.05)
    ForEachEntityInGroup(Enable, "GearCovers")
    ForEachEntityInGroup(SetRotatorMaxSpeed, "GearCovers", 40)
    ForEachEntityInGroup(Unhide, "demo_gv_isle1.Demo_GV_PortalA1_Inert 01")
    wait(3.8)
    ShakeCamera(2, 2, 0.05, 3, 0.2, 0.05)
    ForEachEntityInGroup(Enable, "demo_gv_isle3_u.Spawner 06")
    wait(2)
    ForEachEntityInGroup(Unhide, "GearCovers2")
    ForEachEntityInGroup(Hide, "GearCovers")
    SetPropertyBool("demo_gv_isle3_u.GVD_GearA2_Toon 04", "AIHintEnabled", false)
    SetPropertyBool("demo_gv_isle3_u.GVD_GearA2_Toon 05", "AIHintEnabled", false)
    Bark(GetPlayer(), "Let's go through that new filmstrip and use this cross to the next island.  Hopefully it won't all fall down.", 5, "Gus", "Gus:")
    SetPropertyFloat("demo_gv_isle1.Demo_GV_PortalA1_Inert 01", "UsableRadius", 2)
    AnimGBReset("ScrapperFallingTower")
    AnimGBSequence("ScrapperFallingTower", "RestDown")
    GrabCamera("demo_gv_isle3_u.UpsideDownCameraControlPoint 02", "demo_gv_isle1.Demo_GV_PortalA1_Inert 01", CAMERA_LERP_TRANSITION, 1)
    wait(4)
    SetPropertyBool(GetPlayer(), "Invisible", false)
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0.5)
    UnrestrictCutSceneInput()
    SetRotatorMaxSpeed("demo_gv_isle3_u.Demo_GV_BigBenA1_Inert 02", 40)
    AddScrapperPoints(GetPlayer(), 30)
    AudioPostEventOn("demo_gv_isle1.Demo_GV_PortalA1_Inert 01", "Play_sfx_projector_portal")
  end
end
demo_gv_isle3U_Gear = L0_0
function L0_0()
  ForEachEntityInGroup(SetRotatorMaxSpeed, "demo_gv_isle3_u.PlatformGroup1", 150)
end
demo_gv_isle3u_startplatforms = L0_0
function L0_0()
  ForEachEntityInGroup(SetRotatorMaxSpeed, "demo_gv_isle3_u.PlatformGroup1", 0)
end
demo_gv_isle3u_endplatforms = L0_0
function L0_0()
  StreamInLevel(GetPlayer(), "Environments/Demo/GSA/Demo_GV_Isle4.gsa")
  Wait(0.5)
  StreamInLevel(GetPlayer(), "Environments/Demo/GSA/Demo_GV_Isle3.gsa")
  Wait(2)
  WaitForLevelLoad(GetPlayer(), "Environments/Demo/GSA/Demo_GV_Isle3.gsa")
  MoveToEntity(GetPlayer(), "demo_gv_gear_transition_area2.Marker(Rotatable) 04")
end
AreaLevelStreamCheck = L0_0
L0_0 = 0
gv_isle3u_roboticarmposition = L0_0
function L0_0()
  local L0_7, L1_8
  L0_7 = gv_isle3u_roboticarmposition
  L0_7 = L0_7 + 1
  gv_isle3u_roboticarmposition = L0_7
  L0_7 = gv_isle3u_roboticarmposition
  if L0_7 == 2 then
    L0_7 = 0
    gv_isle3u_roboticarmposition = L0_7
  end
end
demo_gv_isle3u_roboticarmpos = L0_0
function L0_0(A0_9)
  if GetGlobal("demo_gv_isle3U_Gremlinsaved") == 0 then
    AnimGBReset(A0_9)
    AnimGBSequence(A0_9, "Flip")
    FireUser1(A0_9)
    AudioStopPlayingOn(A0_9)
    AudioPostEventOn(A0_9, "Play_sfx_gv_arm_over")
  end
end
demo_gv_isle3_maxspeed = L0_0
function L0_0(A0_10)
  SetRotatorMaxSpeed(A0_10, 0)
end
demo_gv_isle3_stopspeed = L0_0
function L0_0(A0_11)
  if GetGlobal("demo_gv_isle3U_Gremlinsaved") == 0 then
    AnimGBSequence(A0_11, "Throw")
  end
end
demo_gv_isle3_maxspeedTHROW = L0_0
function L0_0(A0_12)
  local L1_13
  L1_13 = Wait
  L1_13(0.12)
  L1_13 = CSG_GetCompletionFraction
  L1_13 = L1_13(A0_12)
  SplineFollower_StopAtPosition("BeetleworxArm1", "BeetleworxArm1StartKnot", "BeetleworxArm1EndKnot", L1_13)
  SplineFollower_StopAtPosition("BeetleworxArm1Weight", "BeetleworxArm1WeightStartKnot", "BeetleworxArm1WeightEndKnot", L1_13)
end
CSGBeetleworxArm1 = L0_0
function L0_0(A0_14)
  local L1_15
  L1_15 = Wait
  L1_15(0.12)
  L1_15 = CSG_GetCompletionFraction
  L1_15 = L1_15(A0_14)
  SplineFollower_StopAtPosition("BeetleworxArm2", "BeetleworxArm2StartKnot", "BeetleworxArm2EndKnot", L1_15)
  SplineFollower_StopAtPosition("BeetleworxArm2Weight", "BeetleworxArm2WeightStartKnot", "BeetleworxArm2WeightEndKnot", L1_15)
end
CSGBeetleworxArm2 = L0_0
function L0_0(A0_16)
  local L1_17
  L1_17 = Wait
  L1_17(0.12)
  L1_17 = CSG_GetCompletionFraction
  L1_17 = L1_17(A0_16)
  SplineFollower_StopAtPosition("BeetleworxArm3", "BeetleworxArm3StartKnot", "BeetleworxArm3EndKnot", L1_17)
  SplineFollower_StopAtPosition("BeetleworxArm3Weight", "BeetleworxArm3WeightStartKnot", "BeetleworxArm3WeightEndKnot", L1_17)
end
CSGBeetleworxArm3 = L0_0
function L0_0(A0_18)
  Bark(GetPlayer(), "Let's go back through the filmstrip, Mickey!", 5, "Gus", "Gus:")
end
demo_gv_isle3_cave = L0_0
function L0_0()
  local L0_19
  L0_19 = "demo_gv_isle3_u.UpsideDownCameraControlPoint 02"
  GrabCamera(L0_19, "demo_gv_isle1.Demo_GV_PortalA1_Inert 01", CAMERA_LERP_TRANSITION, 1.5)
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
    LoadLevel(GetPlayer(), "Levels/Demo_GV_Start4.level")
  end
  SetGlobal("demo_gv_isle3_mickeycheck2", 1)
end
demo_gv_isle2_CamFlipExit2 = L0_0
function L0_0()
  SetPropertyFloat("demo_gv_isle1.Demo_GV_PortalA1_Inert 01", "UsableRadius", 0)
end
demo_gv_isle2_PortalUsable0 = L0_0
function L0_0()
  PauseMenuObjectives(GetPlayer(), [[
Goal: 
 Fix or Topple the Tower to Open the 
 Passage to the Next Island]])
end
demo_gv_isle2_startupgoal = L0_0
function L0_0(A0_20)
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
    LoadLevel(GetPlayer(), "Levels/Demo_GV_Start4.level")
    SetConfigVariableString(GetPlayer(), "CameraFieldOfView", 60)
    SetConfigVariableString(GetPlayer(), "FreeCamera_2DMode_Active", true)
    SetConfigVariableString(GetPlayer(), "FreeCamera_LedgeCheck_Active", false)
    SetGlobal("Gremlinfreed", 2)
    UnrestrictCutSceneInput()
  end
end
demo_gv_isle3_EnterportalTop = L0_0
