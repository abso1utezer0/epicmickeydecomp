local L0_0
L0_0 = "Environments/Dungeons/Zones/DUN_Master.gsa"
Demo_Lab = L0_0
L0_0 = "Environments/Dungeons/Zones/DUN_ZoneA_Skybox.gsa"
Demo_Lab_Skybox = L0_0
L0_0 = "Environments/Tutorial/TUT_Islands.gsa"
Demo_Tutorial = L0_0
L0_0 = "Environments/HauntedMansion/GSA/HauntedMansion_ZoneE.gsa"
Demo_Library = L0_0
L0_0 = {
  {Demo_Lab, Demo_Lab_Skybox},
  {
    Demo_Lab,
    Demo_Lab_Skybox,
    Demo_Tutorial
  },
  {
    Demo_Lab,
    Demo_Lab_Skybox,
    Demo_Library,
    Demo_Tutorial
  },
  {Demo_Library, Demo_Tutorial}
}
Demo_streamGroups = L0_0
function L0_0(A0_1, A1_2)
  local L2_3, L3_4
  L2_3 = Demo_streamGroups
  L3_4 = tonumber
  L3_4 = L3_4(A1_2)
  L2_3 = L2_3[L3_4]
  L3_4 = ""
  for _FORV_7_ = 1, #L2_3 do
    L3_4 = L3_4 .. L2_3[_FORV_7_] .. ","
  end
  StreamZones(A0_1, L3_4)
end
Demo_StreamZones = L0_0
function L0_0()
  local L0_5, L1_6
end
Demo_ThinnerFall = L0_0
function L0_0(A0_7)
  if GetGlobal("Demo_PlayerInTunnel") == 0 then
    GrabCamera(A0_7, nil, CAMERA_LERP_TRANSITION, 0.7)
  end
end
Demo_EnterGeefTunnelLeft = L0_0
function L0_0(A0_8)
  if GetGlobal("Demo_PlayerInTunnel") == 0 then
    GrabCamera(A0_8, nil, CAMERA_LERP_TRANSITION, 1)
    wait(0.7)
    ReleaseCamera(CAMERA_LERP_TRANSITION, 1)
  end
end
Demo_EnterGeefTunnelRight = L0_0
function L0_0(A0_9)
  if GetGlobal("Demo_PlayerInTunnel") == 1 then
    GrabCamera(A0_9, nil, CAMERA_LERP_TRANSITION, 1)
  end
end
Demo_ExitGeefTunnelLeft = L0_0
function L0_0(A0_10, A1_11)
  GrabCamera(A0_10, A1_11, CAMERA_LERP_TRANSITION, 1.5)
end
Demo_OnBalcony = L0_0
function L0_0(A0_12, A1_13)
  GrabCamera(A0_12, A1_13, CAMERA_LERP_TRANSITION, 0)
end
Demo_InstantCam = L0_0
function L0_0(A0_14, A1_15)
  GrabCamera(A0_14, nil, CAMERA_LERP_TRANSITION, A1_15)
end
Demo_GrabCam = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
end
Demo_OffBalcony = L0_0
function L0_0()
  GrabCamera("dun_zonea_scripting_ai.WestCamera 01", nil, CAMERA_LERP_TRANSITION, 0.7)
end
Demo_WestCameraOn = L0_0
function L0_0()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.7)
end
Demo_ReleaseCam = L0_0
L0_0 = 0
DemoLabBooksCaught = L0_0
function L0_0(A0_16)
  DemoLabBooksCaught = DemoLabBooksCaught + 1
  if DemoLabBooksCaught == 2 then
    DialogBox(GetPlayer(), "The Scrapper is aligned with the destructive force of Thinner. He is powerful and dangerous- a product of directness and the pursuit of bettering himself at all turns.  He realizes that his needs are paramount and as such accumulates power quickly. His mastery of Thinner and thus destruction is unparalleled.")
  elseif DemoLabBooksCaught == 1 then
    DialogBox(GetPlayer(), "The Hero is influenced by the creative force of Paint. He is a builder and restorer and as such he draws allies to him that aid in his journey.  In his striving to improve and uplift the world around him he also uplifts himself through acts of nobility and sacrifice.")
  end
  DestroyEntity(A0_16)
end
DemoLab_CatchBook = L0_0
function L0_0()
  GrabCamera("dun_zonea_scripting_ai.ColumnCamera 01", nil, CAMERA_LERP_TRANSITION, 0)
  wait(0.7)
  GrabCamera("dun_zonea_scripting_ai.ColumnCamera 02", nil, CAMERA_LERP_TRANSITION, 1)
  RestrictCutSceneInput()
  if GusSaved == 1 then
    Bark(GetPlayer(), "Oh, my!  Well, just wreck the place, why don't ya?!", 3, "Gus", "Gus:")
  elseif GusSaved == 0 then
    Bark(GetPlayer(), "Ba-booooom!", 3, "Mickey")
  end
  wait(2.1)
  AddScrapperPoints(GetPlayer(), 25)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.7)
  UnrestrictCutSceneInput()
end
DemoLab_ColumnFall = L0_0
L0_0 = 0
Demo_Gremlin = L0_0
function L0_0()
  PauseMenuObjectives(GetPlayer(), [[
Mad Doctor's lab: 
 Rescue Gremlin Gus and escape the lab.]])
  AudioStopPlayingOn("dun_zonea_scripting_ai.Gremlin_Ghengis 01")
  wait(0.1)
  RestrictCutSceneInput()
  AudioSetState("dun_zonea_audio.DungeonLabAmbient SoundMarker 01", "Music_State", "Exploration")
  AnimVarInt("dun_zonea_scripting_ai.Gremlin_Gus 01", VAR_AI_Misc, 1)
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 01", EVENT_AI_Misc)
  GrabCameraNif("dun_zonea_scripting_ai.StartupIntroCam_IGC 01", nil, 0, 0)
  AnimGBReset("dun_zonea_scripting_ai.StartupIntroCam_IGC 01")
  AnimGBSequence("dun_zonea_scripting_ai.StartupIntroCam_IGC 01", "demoStartCam")
  AnimVarInt("dun_zonea_scripting_ai.Gremlin_Ted 01", VAR_AI_Misc, 1)
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Ted 01", EVENT_AI_Misc)
  wait(9)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1)
  UnrestrictCutSceneInput()
end
Demo_GremlinKickoff = L0_0
function L0_0()
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 01", EVENT_AI_Misc)
  RestrictCutSceneInput()
  EnterCutscene("dun_zonea_scripting_ai.Gremlin_Gus 01")
  Bark(GetPlayer(), "Hey! Hallooo down there! Up here!", 3, "Gus", "Gus:")
  GrabCamera("dun_zonea_scripting_ai.GusIntroCamera 04", nil, CAMERA_LERP_TRANSITION, 1.1)
  wait(1)
  GrabCamera("dun_zonea_scripting_ai.GusIntroCamera 00", nil, CAMERA_LERP_TRANSITION, 3.1)
  wait(3)
  GrabCamera("dun_zonea_scripting_ai.GusIntroCamera 01", nil, CAMERA_LERP_TRANSITION, 0.8)
  wait(0.9)
  Bark(GetPlayer(), "You have to help me get out! Quick, jump and spin-attack this cage! (Shake the remote.)", 6, "Gus", "Gus:")
  wait(6.5)
  GrabCamera("dun_zonea_scripting_ai.GusIntroCamera 00", nil, CAMERA_LERP_TRANSITION, 0)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
  UnrestrictCutSceneInput()
  ExitCutscene("dun_zonea_scripting_ai.Gremlin_Gus 01")
  Bark(GetPlayer(), "Don't leave me here!", 3, "Gus")
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 01", EVENT_Finished_Sequence)
  ObjectiveNew(GetPlayer(), "gremlin", 3)
end
DemoLab_GusGreet = L0_0
L0_0 = 0
GusSaved = L0_0
L0_0 = 0
TedSaved = L0_0
L0_0 = 0
GngSaved = L0_0
function L0_0()
  local L0_17
  L0_17 = AnimEvent
  L0_17("dun_zonea_scripting_ai.Gremlin_Gus 01", EVENT_Finished_Sequence)
  L0_17 = AnimVarInt
  L0_17("dun_zonea_scripting_ai.Gremlin_Gus 01", VAR_AI_Misc, 0)
  L0_17 = 1
  GusSaved = L0_17
  L0_17 = Demo_Gremlin
  L0_17 = L0_17 + 1
  Demo_Gremlin = L0_17
  L0_17 = GrabCamera
  L0_17("dun_zonea_scripting_ai.GusIntroCamera 05", "dun_zonea_scripting_ai.Gremlin_Gus 01", CAMERA_LERP_TRANSITION, 0)
  L0_17 = MoveToEntity
  L0_17(GetPlayer(), "dun_zonea_scripting_ai.GusConvoMarker 01")
  L0_17 = wait
  L0_17(0.7)
  L0_17 = RestrictCutSceneInput
  L0_17()
  L0_17 = wait
  L0_17(0.5)
  L0_17 = GrabCamera
  L0_17("dun_zonea_scripting_ai.GusIntroCamera 03", nil, CAMERA_LERP_TRANSITION, 1.5)
  L0_17 = wait
  L0_17(1.9)
  L0_17 = EnterCutscene
  L0_17("dun_zonea_scripting_ai.Gremlin_Gus 01")
  L0_17 = AnimEvent
  L0_17("dun_zonea_scripting_ai.Gremlin_Gus 01", EVENT_Finished_Sequence)
  L0_17 = AnimEvent
  L0_17("dun_zonea_scripting_ai.Gremlin_Gus 01", EVENT_Start_Talk)
  L0_17 = Bark
  L0_17(GetPlayer(), "Thank you! I'm Gus Gremlin. The Mad Doctor captured me like he almost got you!", 4, "Gus", "Gus:")
  L0_17 = GrabCamera
  L0_17("dun_zonea_scripting_ai.GusIntroCamera 02", nil, CAMERA_LERP_TRANSITION, 22.5)
  L0_17 = wait
  L0_17(4.1)
  L0_17 = 0
  if TedSaved == 0 and GngSaved == 0 then
    L0_17 = "Two other gremlins are caged in this lab."
  elseif TedSaved == 1 and GngSaved == 1 then
    L0_17 = "Thanks for saving them!"
  elseif TedSaved == 1 or GngSaved == 1 then
    L0_17 = "Looks like you've found one of them already."
  end
  Bark(GetPlayer(), "My squad was trying to sabotage the Doctor's experiment. " .. L0_17, 6, "Gus", "Gus:")
  wait(6.1)
  FaceEntity("dun_zonea_scripting_ai.Gremlin_Gus 01", GetPlayer())
  if TedSaved == 0 and GngSaved == 0 then
    Bark(GetPlayer(), "Look around, would you? Barry and Jamface have to be here somewhere!", 5, "Gus", "Gus:")
    wait(5.1)
    Bark(GetPlayer(), "Try using Thinner to dissolve some walls. You can erase any wall that looks brightly colored, or you can paint blue sparkly stuff, but choose wisely...", 5, "Gus", "Gus:")
    wait(5.1)
    Demo_GusThankEnd()
  elseif TedSaved == 1 and GngSaved == 1 then
    Demo_GusThankEnd()
  elseif TedSaved == 1 or GngSaved == 1 then
    Bark(GetPlayer(), "The other is bound to be here somewhere! Look around, would you?", 3, "Gus", "Gus:")
    wait(3.1)
    Bark(GetPlayer(), "Try using Thinner to dissolve some walls. You can erase any wall that looks brightly colored, or you can paint blue sparkly stuff, but choose wisely...", 5, "Gus", "Gus:")
    wait(5.1)
    Demo_GusThankEnd()
  end
end
DemoLab_GusThank = L0_0
function L0_0()
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 01", EVENT_Start_EmoteHappy)
  wait(1.8)
  AudioStopPlayingOn("dun_zonea_scripting_ai.Gremlin_Gus 01")
  GrabCameraNif("dun_zonea_scripting_ai.GusFly_Camera_IGC 01", nil, 0, 0)
  AnimGBReset("dun_zonea_scripting_ai.GusFly_Camera_IGC 01")
  AnimGBSequence("dun_zonea_scripting_ai.GusFly_Camera_IGC 01", "gremlin_IGC_flyToBalcony")
  Bark(GetPlayer(), "Anyhow, you need to get out of this place! I'll be waiting for you here at the exit. Good luck!", 5, "Gus", "Gus:")
  SetVisualScale("dun_zonea_scripting_ai.Gremlin_Gus 01", 0.1)
  TeleportToEntity("dun_zonea_scripting_ai.Gremlin_Gus 01", "dun_zonea_scripting_ai.robotArm")
  DisableMotion("dun_zonea_scripting_ai.Gremlin_Gus 01")
  AnimVarInt("dun_zonea_scripting_ai.Gremlin_Gus 01", VAR_Cutscene, 14)
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 01", EVENT_Start_Cutscene)
  wait(5.2)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 2.5)
  UnrestrictCutSceneInput()
  AddPaladinPoints(GetPlayer(), 25)
  ObjectiveIncrement(GetPlayer(), "gremlin", 1)
  if Demo_Gremlin == 3 then
    ObjectiveComplete(GetPlayer(), "gremlin")
  end
  wait(2)
  DestroyEntity("dun_zonea_scripting_ai.Gremlin_Gus 01")
  Enable("dun_zonea_scripting_ai.ExitLabTrigger 01")
  Unhide("dun_zonea_scripting_ai.Gremlin_Gus 02")
  AudioPostEventOn("dun_zonea_scripting_ai.Gremlin_Gus 02", "Play_sfx_gremlin_hover")
  Demo_GusHint()
end
Demo_GusThankEnd = L0_0
function L0_0()
  wait(300)
  if Demo_ExitTried == 0 then
    Hide("dun_zonea_scripting_ai.Gremlin_Gus 02")
    Unhide("dun_zonea_scripting_ai.Gremlin_Gus 03")
    AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 03", EVENT_ChangeIdle)
    EnterCutscene("dun_zonea_scripting_ai.Gremlin_Gus 03")
    AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 03", EVENT_Start_Talk)
    Bark(GetPlayer(), "Hey! What are you doing down there?", 5, "Gus", "Gus:")
    wait(3)
    RestrictCutSceneInput()
    wait(1)
    GrabCamera("dun_zonea_scripting_ai.ExitLabCamera 05", nil, CAMERA_LERP_TRANSITION, 0)
    wait(1)
    Bark(GetPlayer(), "Make your way up here, so we can skeedaddle!", 5, "Gus", "Gus:")
    wait(5)
    ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
    wait(1)
    UnrestrictCutSceneInput()
    ExitCutscene("dun_zonea_scripting_ai.Gremlin_Gus 03")
    AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 03", EVENT_Finished_Sequence)
    Hide("dun_zonea_scripting_ai.Gremlin_Gus 03")
    Unhide("dun_zonea_scripting_ai.Gremlin_Gus 02")
    Demo_GusHintLite()
  end
end
Demo_GusHint = L0_0
function L0_0()
  wait(300)
  if Demo_ExitTried == 0 then
    Bark(GetPlayer(), "Quit messing around!", 5, "Gus", "Gus:")
    Demo_GusHintLite()
  end
end
Demo_GusHintLite = L0_0
function L0_0()
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Ted 01", EVENT_AI_Misc)
  AudioPostEventOn("dun_zonea_scripting_ai.GremlinDistress Sound_Marker 02", "Stop_vocal_gremlin_distress")
  Bark(GetPlayer(), "Gloryosky! I thought I'd never see anyone again! Help a poor gremlin!", 5, "GremlinGreen", "Jamface:")
  GrabCamera("dun_zonea_scripting_ai.TedIntroCamera 07", "dun_zonea_scripting_ai.GremlinTedFaceMarker 01", CAMERA_LERP_TRANSITION, 0.8)
  RestrictCutSceneInput()
  wait(0.7)
  GrabCamera("dun_zonea_scripting_ai.TedIntroCamera 01", "dun_zonea_scripting_ai.GremlinTedFaceMarker 01", CAMERA_LERP_TRANSITION, 5)
  wait(5.4)
  Bark(GetPlayer(), "Help me out of here! Quick, jump and spin-attack this cage! (Shake the remote.)", 4, "GremlinGreen", "Jamface:")
  wait(4)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.7)
  UnrestrictCutSceneInput()
  AudioPostEventOn("dun_zonea_scripting_ai.GremlinDistress Sound_Marker 02", "Play_vocal_gremlin_distress")
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Ted 01", EVENT_Finished_Sequence)
end
DemoLab_TedGreet = L0_0
L0_0 = 0
Demo_HaveWrench = L0_0
function L0_0()
  TedSaved = 1
  Demo_ExitTried = 0
  GrabCamera("dun_zonea_scripting_ai.TedIntroCamera 00", "dun_zonea_scripting_ai.Gremlin_Ted 01", CAMERA_LERP_TRANSITION, 0)
  Demo_Gremlin = Demo_Gremlin + 1
  AnimVarInt("dun_zonea_scripting_ai.Gremlin_Ted 01", VAR_AI_Misc, 0)
  MoveToEntity(GetPlayer(), "dun_zonea_scripting_ai.TedConvoMarker 01")
  wait(0.7)
  RestrictCutSceneInput()
  wait(1)
  GrabCamera("dun_zonea_scripting_ai.TedIntroCamera 03", "dun_zonea_scripting_ai.Gremlin_Ted 01", CAMERA_LERP_TRANSITION, 0.7)
  wait(0.7)
  GrabCamera("dun_zonea_scripting_ai.TedIntroCamera 04", nil, CAMERA_LERP_TRANSITION, 0.5)
  wait(0.7)
  EnterCutscene("dun_zonea_scripting_ai.Gremlin_Ted 01")
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Ted 01", EVENT_Start_Talk)
  Bark(GetPlayer(), "Thank you. I'm Jamface! I'm a gremlin! I wish I could repay your kindness.", 5, "GremlinGreen", "Jamface:")
  wait(5.1)
  if Demo_HaveWrench == 1 then
    Bark(GetPlayer(), "Wait, did you find my wrench?! You DID! Give it here, then watch me fly!", 5, "GremlinGreen", "Jamface:")
    Demo_TedFixesRobotArm()
  elseif Demo_HaveWrench == 0 then
    Bark(GetPlayer(), "I know! My wrench is around here somewhere. If you find it, I can fix that mechanical arm!", 5, "GremlinGreen", "Jamface:")
    wait(5.5)
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
    UnrestrictCutSceneInput()
    AnimEvent("dun_zonea_scripting_ai.Gremlin_Ted 01", EVENT_Finished_Sequence)
    ExitCutscene("dun_zonea_scripting_ai.Gremlin_Ted 01")
  end
  ObjectiveIncrement(GetPlayer(), "gremlin", 1)
  if Demo_Gremlin == 3 then
    ObjectiveComplete(GetPlayer(), "gremlin")
  end
end
DemoLab_TedThank = L0_0
function L0_0()
  if TedSaved == 1 then
    EnterCutscene("dun_zonea_scripting_ai.Gremlin_Ted 01")
    AnimEvent("dun_zonea_scripting_ai.Gremlin_Ted 01", EVENT_Start_Talk)
    if Demo_HaveWrench == 0 then
      Bark(GetPlayer(), "You might need to Paint in some Thinned parts of the lab, like stairs. They look blue and sparkly.", 5, "GremlinGreen", "Jamface:")
      wait(5.1)
      Bark(GetPlayer(), "You can Paint a target by pressing the B button, just like you would use Thinner.", 5, "GremlinGreen", "Jamface:")
    elseif Demo_HaveWrench == 1 then
      Bark(GetPlayer(), "Ah, you found my wrench! Now I can fix that mechanical arm for you!", 5, "GremlinGreen", "Jamface:")
      wait(2)
      Demo_TedFixesRobotArm()
    end
  end
end
DemoLab_TedSpeak = L0_0
function L0_0()
  local L0_18
  L0_18 = RestrictCutSceneInput
  L0_18()
  L0_18 = SplineFollower_SetDisabled
  L0_18("dun_zonea_scripting_ai.Gremlin_Ted 01", true)
  L0_18 = GrabCameraNif
  L0_18("dun_zonea_scripting_ai.RobotArmGremlin_Camera_IGC 01", nil, 0, 0)
  L0_18 = AnimGBReset
  L0_18("dun_zonea_scripting_ai.RobotArmGremlin_Camera_IGC 01")
  L0_18 = AnimGBSequence
  L0_18("dun_zonea_scripting_ai.RobotArmGremlin_Camera_IGC 01", "gremlin_IGC_robotarm")
  L0_18 = SetVisualScale
  L0_18("dun_zonea_scripting_ai.Gremlin_Ted 01", 0.1)
  L0_18 = TeleportToEntity
  L0_18("dun_zonea_scripting_ai.Gremlin_Ted 01", "dun_zonea_scripting_ai.robotArm")
  L0_18 = DisableMotion
  L0_18("dun_zonea_scripting_ai.Gremlin_Ted 01")
  L0_18 = SetFacing
  L0_18("dun_zonea_scripting_ai.Gremlin_Ted 01", vector4(0, 0, 0, 0))
  L0_18 = AnimVarInt
  L0_18("dun_zonea_scripting_ai.Gremlin_Ted 01", VAR_Cutscene, 2)
  L0_18 = AnimEvent
  L0_18("dun_zonea_scripting_ai.Gremlin_Ted 01", EVENT_Start_Cutscene)
  L0_18 = RelayTrigger
  L0_18("dun_zonea_scripting_ai.RobotArmLogicRelayMarker 01")
  L0_18 = wait
  L0_18(5)
  L0_18 = GetChildEntityByName
  L0_18 = L0_18("dun_zonea_scripting_ai.Gremlin_Ted 01", "GremlinWrench")
  Unhide(L0_18)
  wait(4)
  wait(4.7)
  Bark(GetPlayer(), "Now you can cross this arm to get to the ledge! Gotta fly - there's a battle shaping up! Goodbye!", 5, "GremlinGreen", "Jamface:")
  wait(5)
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Ted 01", EVENT_Finished_Sequence)
  ExitCutscene("dun_zonea_scripting_ai.Gremlin_Ted 01")
  Unhide("dun_zonea_scripting_ai.Gremlin_Ted 02")
  AudioPostEventOn("dun_zonea_scripting_ai.Gremlin_Ted 02", "Play_sfx_gremlin_hover")
  wait(3)
  Kill("dun_zonea_scripting_ai.Gremlin_Ted 01")
  DestroyEntity("dun_zonea_scripting_ai.GremlinVanishFX 01")
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  UnrestrictCutSceneInput()
end
Demo_TedFixesRobotArm = L0_0
function L0_0()
  AnimVarInt("dun_zonea_scripting_ai.Gremlin_Ghengis 01", VAR_AI_Misc, 1)
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Ghengis 01", EVENT_AI_Misc)
end
Demo_GhengisIntro = L0_0
function L0_0()
  GngSaved = 1
  Demo_ExitTried = 0
  Demo_Gremlin = Demo_Gremlin + 1
  MoveToEntity(GetPlayer(), "dun_zonea_scripting_ai.GhengisMarker 01")
  GrabCamera("dun_zonea_scripting_ai.GhengisCamera 01", nil, CAMERA_LERP_TRANSITION, 0)
  wait(0.7)
  RestrictCutSceneInput()
  wait(1.9)
  EnterCutscene("dun_zonea_scripting_ai.Gremlin_Ghengis 01")
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Ghengis 01", EVENT_Start_Talk)
  Bark(GetPlayer(), "Thank'ee kindly, sir! A caged gremlin is a sad critter.", 4, "GremlinBlue", "Barry:")
  wait(4)
  Bark(GetPlayer(), "Don't suppose you're missing a wrench? Saw one behind the generator over there.  It's the one with the big spinning wheel!", 4, "GremlinBlue", "Barry:")
  wait(4)
  Bark(GetPlayer(), "And if you haven't rescued my buddy Jamface, please look around for him!", 4, "GremlinBlue", "Barry:")
  wait(4)
  ExitCutscene("dun_zonea_scripting_ai.Gremlin_Ghengis 01")
  wait(0.1)
  SetSplineFollowerInitialSpeed("dun_zonea_scripting_ai.Gremlin_Ghengis 01", 4)
  wait(1.5)
  Hide("dun_zonea_scripting_ai.Gremlin_Ghengis 01")
  AudioPostEventOn(GetPlayer(), "Play_sfx_gremlin_pop_out")
  DestroyEntity("dun_zonea_scripting_ai.Gremlin_Ghengis 01")
  Unhide("dun_zonea_scripting_ai.Gremlin_Ghengis 02")
  AudioPostEventOn("dun_zonea_scripting_ai.Gremlin_Ghengis 02", "Play_sfx_gremlin_hover")
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  UnrestrictCutSceneInput()
  ObjectiveIncrement(GetPlayer(), "gremlin", 1)
  if Demo_Gremlin == 3 then
    ObjectiveComplete(GetPlayer(), "gremlin")
  end
end
DemoLab_GhengisThank = L0_0
function L0_0()
  Unhide("dun_zonea_scripting_ai.GremlinWrench 01")
  GrabCamera("dun_zonea_scripting_ai.WrenchCamera 02", nil, CAMERA_LERP_TRANSITION, 0)
  wait(0.1)
  GrabCamera("dun_zonea_scripting_ai.WrenchCamera 01", nil, CAMERA_LERP_TRANSITION, 1.5)
  MoveToEntity(GetPlayer(), "dun_zonea_scripting_ai.WrenchMarker 01")
  wait(0.7)
  RestrictCutSceneInput()
  Bark(GetPlayer(), "Hmm... a tiny wrench, fit for tiny hands.", 3, "Mickey")
  wait(6)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  UnrestrictCutSceneInput()
  Hide("dun_zonea_scripting_ai.GremlinWrench 01")
  Demo_HaveWrench = 1
end
Demo_GetWrench = L0_0
L0_0 = 0
Demo_ExitTried = L0_0
function L0_0()
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 02", EVENT_ChangeIdle)
  EnterCutscene("dun_zonea_scripting_ai.Gremlin_Gus 02")
  RestrictCutSceneInput()
  Demo_GusExitOutro()
end
Demo_GusExitTalk = L0_0
function L0_0()
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 02", EVENT_ChangeIdle)
  EnterCutscene("dun_zonea_scripting_ai.Gremlin_Gus 02")
  RestrictCutSceneInput()
  GrabCamera("dun_zonea_scripting_ai.ExitLabCamera 03", nil, CAMERA_LERP_TRANSITION, 1.2)
  Bark(GetPlayer(), "Whoa! That way leads out of this lab. You won't be able to return here.", 3, "Gus", "Gus:")
  wait(2.2)
  GrabCamera("dun_zonea_scripting_ai.ExitLabCamera 04", nil, CAMERA_LERP_TRANSITION, 1)
  wait(0.7)
  Demo_GusExitOutro()
end
DemoLab_MirrorRoom = L0_0
function L0_0()
  GrabCamera("dun_zonea_scripting_ai.ExitLabCamera 01", nil, CAMERA_LERP_TRANSITION, 1)
  wait(0.7)
  MoveToEntity(GetPlayer(), "dun_zonea_scripting_ai.ExitLabMarker 01")
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 02", EVENT_Start_Talk)
  if Demo_ExitTried == 0 then
    Demo_ExitTried = 1
    if TedSaved == 0 and GngSaved == 0 then
      Bark(GetPlayer(), "You sure you want to leave without freeing my two gremlin friends?", 3, "Gus", "Gus:")
      wait(3)
    elseif TedSaved == 1 and GngSaved == 1 then
      Bark(GetPlayer(), "You've freed both my gremlin friends, so I guess there's no reason to stay. Ready to go?", 3, "Gus", "Gus:")
      wait(3)
    elseif TedSaved == 1 or GngSaved == 1 then
      Bark(GetPlayer(), "You've only freed one of my two gremlin buddies. Are you sure you want to leave?", 3, "Gus", "Gus:")
      wait(3)
    end
  elseif Demo_ExitTried == 1 then
    Bark(GetPlayer(), "Are you sure you want to leave?", 3, "Gus", "Gus:")
    wait(3)
  end
  DialogBoxAdvanced("Leave the Mad Doctor's Lab?", "Yes", "No")
  wait(0.25)
  if GetDialogResponse() == "Yes" then
    if TedSaved == 0 and GngSaved == 0 then
      AddScrapperPoints(GetPlayer(), 25)
    elseif TedSaved == 1 and GngSaved == 1 then
      AddPaladinPoints(GetPlayer(), 25)
    end
    wait(0.5)
    EndTrackingLevelScore(GetPlayer())
    Bark(GetPlayer(), "Well, all right then. Let's get out of here!", 3, "Gus", "Gus:")
    GrabCamera("dun_zonea_scripting_ai.MirrorCamera Exit", nil, CAMERA_LERP_TRANSITION, 1.5)
    wait(1.5)
    GrabCamera("dun_zonea_scripting_ai.MirrorCamera Exit 01", nil, CAMERA_LERP_TRANSITION, 1.5)
    wait(1.4)
    UnrestrictCutSceneInput()
    wait(0.1)
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
    PlayMovie(GetPlayer(), "fmv_outro_laboratory.bik")
    LoadLevel(GetPlayer(), "Levels/Demo_GV_Start.level")
  elseif GetDialogResponse() == "No" then
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
    UnrestrictCutSceneInput()
  end
  ExitCutscene("dun_zonea_scripting_ai.Gremlin_Gus 02")
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 02", EVENT_Finished_Sequence)
end
Demo_GusExitOutro = L0_0
function L0_0()
  RestrictCutSceneInput()
  GrabCamera("dun_zonea_scripting_ai.ExitLabCamera 02", nil, CAMERA_LERP_TRANSITION, 2.1)
  wait(2)
  GrabCamera("dun_zonea_scripting_ai.ExitLabCamera 05", nil, CAMERA_LERP_TRANSITION, 3.2)
  wait(3.1)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  UnrestrictCutSceneInput()
end
DemoLab_MirrorRoomIntro = L0_0
L0_0 = 0
DemoLab_EXIT = L0_0
L0_0 = 0
Demo_DnldSpk = L0_0
function L0_0()
  GrabCamera("dun_zonea_scripting_ai.DonaldCamera 02", nil, CAMERA_LERP_TRANSITION, 0)
  MoveToEntity(GetPlayer(), "dun_zonea_scripting_ai.DonaldMarker 01")
  wait(0.7)
  RestrictCutSceneInput()
  if Demo_DnldSpk == 0 then
    Demo_DnldSpk = 1
    Bark(GetPlayer(), "What in the...", 4, "Mickey")
    wait(4.1)
  end
  GrabCamera("dun_zonea_scripting_ai.DonaldCamera 01", nil, CAMERA_LERP_TRANSITION, 0.7)
  EnterCutscene("dun_zonea_scripting_ai.DonaldHead 01")
  AnimEvent("dun_zonea_scripting_ai.DonaldHead 01", EVENT_Start_Talk)
  Bark(GetPlayer(), "Thinking of escape, eh?  Well, those Gremlin fellows can fix things, maybe even a magic projector!", 6, "donald", "Donald:")
  RestrictCutSceneInput()
  wait(6.1)
  ExitCutscene("dun_zonea_scripting_ai.DonaldHead 01")
  AnimEvent("dun_zonea_scripting_ai.DonaldHead 01", EVENT_Finished_Sequence)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  UnrestrictCutSceneInput()
end
Demo_DonaldSpeak = L0_0
function L0_0()
  LongBark(GetPlayer(), "Thanks for rescuing me!", 6, "GremlinGreen", "Jamface:")
end
Demo_ExitJamfaceSpeak = L0_0
function L0_0()
  LongBark(GetPlayer(), "Good show!", 6, "GremlinBlue", "Barry:")
end
Demo_ExitBarrySpeak = L0_0
function L0_0()
  if GusSaved == 0 then
    Bark(GetPlayer(), "Hmm... it doesn't seem to be working.  Maybe that little fellow I saw earlier can help me out?", 6, "Mickey")
    RestrictCutSceneInput()
    wait(6.1)
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
    UnrestrictCutSceneInput()
  end
end
DemoLab_UseMirror = L0_0
function L0_0()
  local L0_19, L1_20
end
Demo_ClockJams = L0_0
function L0_0()
  PauseMenuObjectives(GetPlayer(), [[
Goal: 
 Navigate the Clockworks to the Next Screen]])
end
Demo_2DObject01 = L0_0
function L0_0()
  PauseMenuObjectives(GetPlayer(), [[
Goal: 
 Navigate the Clockworks to the Next Screen]])
end
Demo_2DObject02 = L0_0
function L0_0()
  PauseMenuObjectives(GetPlayer(), [[
Goal: 
 Navigate the Clockworks to the Next Screen]])
end
Demo_2DObject03 = L0_0
