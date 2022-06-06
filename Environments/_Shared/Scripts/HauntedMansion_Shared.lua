local L0_0, L1_1
function L0_0()
  AudioSetState("hauntedmansion_shared.MusicSound_Marker 01", "Music_State", "Exploration")
end
HM_StartMusic = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.8)
  UnpauseAllAI()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  wait(0.1)
  StartFadeIn(0.5)
end
HM_ReleaseCam = L0_0
function L0_0()
  StartFadeOut(0.8)
  wait(0.8)
  UnpauseAllAI()
  UnrestrictCutSceneInput()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  wait(0.1)
  StartFadeIn(0.5)
end
HM_ReleaseCamRestricted = L0_0
function L0_0(A0_2, A1_3)
  SetGlobal("HM_MarbleBustsKilled", GetGlobal("HM_MarbleBustsKilled") + 1)
  if A1_3 == "1" then
    SetGlobal("MarbleBustKilled_01", 1)
  elseif A1_3 == "2" then
    SetGlobal("MarbleBustKilled_02", 1)
  elseif A1_3 == "3" then
    SetGlobal("MarbleBustKilled_03", 1)
  elseif A1_3 == "4" then
    SetGlobal("MarbleBustKilled_04", 1)
  elseif A1_3 == "5" then
    SetGlobal("MarbleBustKilled_05", 1)
  elseif A1_3 == "6" then
    SetGlobal("MarbleBustKilled_06", 1)
  elseif A1_3 == "7" then
    SetGlobal("MarbleBustKilled_07", 1)
  end
end
HM_KillMarbleBust = L0_0
