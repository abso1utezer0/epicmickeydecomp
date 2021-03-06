-- Fully reworked

Demo_Lab = "Environments/Dungeons/Zones/DUN_Master.gsa"
Demo_Lab_Skybox = "Environments/Dungeons/Zones/DUN_ZoneA_Skybox.gsa"
Demo_Tutorial = "Environments/Tutorial/TUT_Islands.gsa"
Demo_Library = "Environments/HauntedMansion/GSA/HauntedMansion_ZoneE.gsa"

Demo_streamGroups = {
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

function Demo_StreamZones(param1, param2)
  local var1, var2
  var2 = tonumber(param2)
  var1 = Demo_streamGroups[var2]
  var2 = ""
  for _FORV_7_ = 1, #var1 do
    var2 = var2 .. var1[_FORV_7_] .. ","
  end
  StreamZones(param1, var2)
end

function Demo_ThinnerFall()
  local var1, var2
end

function Demo_EnterGeefTunnelLeft(param1)
  if GetGlobal("Demo_PlayerInTunnel") == 0 then
    GrabCamera(param1, nil, CAMERA_LERP_TRANSITION, 0.7)
  end
end

function Demo_EnterGeefTunnelRight(param1)
  if GetGlobal("Demo_PlayerInTunnel") == 0 then
    GrabCamera(param1, nil, CAMERA_LERP_TRANSITION, 1)
    wait(0.7)
    ReleaseCamera(CAMERA_LERP_TRANSITION, 1)
  end
end

function Demo_ExitGeefTunnelLeft(param1)
  if GetGlobal("Demo_PlayerInTunnel") == 1 then
    GrabCamera(param1, nil, CAMERA_LERP_TRANSITION, 1)
  end
end

function Demo_OnBalcony(param1, param2)
  GrabCamera(param1, param2, CAMERA_LERP_TRANSITION, 1.5)
end

function Demo_InstantCam(param1, param2)
  GrabCamera(param1, param2, CAMERA_LERP_TRANSITION, 0)
end

function Demo_GrabCam(param1, param2)
  GrabCamera(param1, nil, CAMERA_LERP_TRANSITION, param2)
end

function Demo_OffBalcony()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
end

function Demo_WestCameraOn()
  GrabCamera("dun_zonea_scripting_ai.WestCamera 01", nil, CAMERA_LERP_TRANSITION, 0.7)
end

function Demo_ReleaseCam()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0.7)
end

DemoLabBooksCaught = 0

function DemoLab_CatchBook(param1)
  DemoLabBooksCaught = DemoLabBooksCaught + 1
  if DemoLabBooksCaught == 2 then
    DialogBox(GetPlayer(), "The Scrapper is aligned with the destructive force of Thinner. He is powerful and dangerous- a product of directness and the pursuit of bettering himself at all turns.  He realizes that his needs are paramount and as such accumulates power quickly. His mastery of Thinner and thus destruction is unparalleled.")
  elseif DemoLabBooksCaught == 1 then
    DialogBox(GetPlayer(), "The Hero is influenced by the creative force of Paint. He is a builder and restorer and as such he draws allies to him that aid in his journey.  In his striving to improve and uplift the world around him he also uplifts himself through acts of nobility and sacrifice.")
  end
  DestroyEntity(param1)
end

function DemoLab_ColumnFall()
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

Demo_Gremlin = 0

function Demo_GremlinKickoff()
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

function DemoLab_GusGreet()
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

GusSaved = 0
TedSaved = 0
GngSaved = 0
Demo_Gremlin = 0

function DemoLab_GusThank()
  local L0_17
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 01", EVENT_Finished_Sequence)
  AnimVarInt("dun_zonea_scripting_ai.Gremlin_Gus 01", VAR_AI_Misc, 0)
  GusSaved = 1
  Demo_Gremlin = Demo_Gremlin + 1
  GrabCamera("dun_zonea_scripting_ai.GusIntroCamera 05", "dun_zonea_scripting_ai.Gremlin_Gus 01", CAMERA_LERP_TRANSITION, 0)
  MoveToEntity(GetPlayer(), "dun_zonea_scripting_ai.GusConvoMarker 01")
  wait(0.7)
  RestrictCutSceneInput()
  wait(0.5)
  GrabCamera("dun_zonea_scripting_ai.GusIntroCamera 03", nil, CAMERA_LERP_TRANSITION, 1.5)
  wait(1.9)
  EnterCutscene("dun_zonea_scripting_ai.Gremlin_Gus 01")
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 01", EVENT_Finished_Sequence)
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 01", EVENT_Start_Talk)
  Bark(GetPlayer(), "Thank you! I'm Gus Gremlin. The Mad Doctor captured me like he almost got you!", 4, "Gus", "Gus:")
  GrabCamera("dun_zonea_scripting_ai.GusIntroCamera 02", nil, CAMERA_LERP_TRANSITION, 22.5)
  wait(4.1)
  if TedSaved == 0 and GngSaved == 0 then
    GusSavedGremlinText = "Two other gremlins are caged in this lab."
  elseif TedSaved == 1 and GngSaved == 1 then
    GusSavedGremlinText = "Thanks for saving them!"
  elseif TedSaved == 1 or GngSaved == 1 then
    GusSavedGremlinText = "Looks like you've found one of them already."
  end
  Bark(GetPlayer(), "My squad was trying to sabotage the Doctor's experiment. " .. GusSavedGremlinText, 6, "Gus", "Gus:")
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

function Demo_GusThankEnd()
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

function Demo_GusHint()
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

function Demo_GusHintLite()
  wait(300)
  if Demo_ExitTried == 0 then
    Bark(GetPlayer(), "Quit messing around!", 5, "Gus", "Gus:")
    Demo_GusHintLite()
  end
end

function DemoLab_TedGreet()
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

Demo_HaveWrench = 0

function DemoLab_TedThank()
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

function DemoLab_TedSpeak()
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

function Demo_TedFixesRobotArm()
  local var1
  RestrictCutSceneInput()
  SplineFollower_SetDisabled("dun_zonea_scripting_ai.Gremlin_Ted 01", true)
  GrabCameraNif("dun_zonea_scripting_ai.RobotArmGremlin_Camera_IGC 01", nil, 0, 0)
  AnimGBReset("dun_zonea_scripting_ai.RobotArmGremlin_Camera_IGC 01")
  AnimGBSequence("dun_zonea_scripting_ai.RobotArmGremlin_Camera_IGC 01", "gremlin_IGC_robotarm")
  SetVisualScale("dun_zonea_scripting_ai.Gremlin_Ted 01", 0.1)
  TeleportToEntity("dun_zonea_scripting_ai.Gremlin_Ted 01", "dun_zonea_scripting_ai.robotArm")
  DisableMotion("dun_zonea_scripting_ai.Gremlin_Ted 01")
  SetFacing("dun_zonea_scripting_ai.Gremlin_Ted 01", vector4(0, 0, 0, 0))
  AnimVarInt("dun_zonea_scripting_ai.Gremlin_Ted 01", VAR_Cutscene, 2)
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Ted 01", EVENT_Start_Cutscene)
  RelayTrigger("dun_zonea_scripting_ai.RobotArmLogicRelayMarker 01")
  wait(5)
  var1 = GetChildEntityByName("dun_zonea_scripting_ai.Gremlin_Ted 01", "GremlinWrench")
  Unhide(var1)
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

function Demo_GhengisIntro()
  AnimVarInt("dun_zonea_scripting_ai.Gremlin_Ghengis 01", VAR_AI_Misc, 1)
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Ghengis 01", EVENT_AI_Misc)
end

function DemoLab_GhengisThank()
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

function Demo_GetWrench()
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

Demo_ExitTried = 0

function Demo_GusExitTalk()
  AnimEvent("dun_zonea_scripting_ai.Gremlin_Gus 02", EVENT_ChangeIdle)
  EnterCutscene("dun_zonea_scripting_ai.Gremlin_Gus 02")
  RestrictCutSceneInput()
  Demo_GusExitOutro()
end

function DemoLab_MirrorRoom()
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

function Demo_GusExitOutro()
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

function DemoLab_MirrorRoomIntro()
  RestrictCutSceneInput()
  GrabCamera("dun_zonea_scripting_ai.ExitLabCamera 02", nil, CAMERA_LERP_TRANSITION, 2.1)
  wait(2)
  GrabCamera("dun_zonea_scripting_ai.ExitLabCamera 05", nil, CAMERA_LERP_TRANSITION, 3.2)
  wait(3.1)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  UnrestrictCutSceneInput()
end

DemoLab_EXIT = 0
Demo_DnldSpk = 0

function Demo_DonaldSpeak()
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

function Demo_ExitJamfaceSpeak()
  LongBark(GetPlayer(), "Thanks for rescuing me!", 6, "GremlinGreen", "Jamface:")
end

function Demo_ExitBarrySpeak()
  LongBark(GetPlayer(), "Good show!", 6, "GremlinBlue", "Barry:")
end

function DemoLab_UseMirror()
  if GusSaved == 0 then
    Bark(GetPlayer(), "Hmm... it doesn't seem to be working.  Maybe that little fellow I saw earlier can help me out?", 6, "Mickey")
    RestrictCutSceneInput()
    wait(6.1)
    ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
    UnrestrictCutSceneInput()
  end
end

function Demo_ClockJams()
  local var1, var2
end

function Demo_2DObject01()
  PauseMenuObjectives(GetPlayer(), [[
Goal: 
 Navigate the Clockworks to the Next Screen]])
end

function Demo_2DObject02()
  PauseMenuObjectives(GetPlayer(), [[
Goal: 
 Navigate the Clockworks to the Next Screen]])
end

function Demo_2DObject03()
  PauseMenuObjectives(GetPlayer(), [[
Goal: 
 Navigate the Clockworks to the Next Screen]])
end
