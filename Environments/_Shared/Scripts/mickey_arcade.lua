local L0_0, L1_1
function L0_0()
  GrabCamera("arcade_title.StartCamera 01", nil, CAMERA_LERP_TRANSITION, 0)
end
MA_Title_Start = L0_0
function L0_0()
  MA_BreakTitleM()
  wait(1.1)
  DestroyEntity("arcade_title.DynmicINT_3x3_A 01")
  GrabCamera("arcade_title.StartCamera 02", nil, CAMERA_LERP_TRANSITION, 2.1)
  wait(2)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 2)
end
MA_Title_Exit = L0_0
L0_0 = 0
MA_Points = L0_0
function L0_0(A0_2, A1_3)
  MA_Points = MA_Points + A1_3
  Display(GetPlayer(), " " .. MA_Points .. " pts.", 1.5)
end
MA_ScorePoints = L0_0
function L0_0()
  ClearParent("arcade_title.DynmicINT_1x1_A 02")
  ClearParent("arcade_title.DynmicINT_1x1_A 16")
  ClearParent("arcade_title.DynmicINT_1x1_A 03")
  ClearParent("arcade_title.DynmicINT_1x1_A 04")
  ClearParent("arcade_title.DynmicINT_1x1_A 15")
  ClearParent("arcade_title.DynmicINT_1x1_A 14")
  ClearParent("arcade_title.DynmicINT_1x1_A 05")
  ClearParent("arcade_title.DynmicINT_1x1_A 13")
  ClearParent("arcade_title.DynmicINT_1x1_A 06")
  ClearParent("arcade_title.DynmicINT_1x1_A 12")
  ClearParent("arcade_title.DynmicINT_1x1_A 11")
  ClearParent("arcade_title.DynmicINT_1x1_A 07")
  ClearParent("arcade_title.DynmicINT_1x1_A 08")
  ClearParent("arcade_title.DynmicINT_1x1_A 10")
  ClearParent("arcade_title.DynmicINT_1x1_A 09")
  EnableMotion("arcade_title.DynmicINT_1x1_A 02")
  wait(0.1)
  EnableMotion("arcade_title.DynmicINT_1x1_A 16")
  wait(0.1)
  EnableMotion("arcade_title.DynmicINT_1x1_A 03")
  wait(0.1)
  EnableMotion("arcade_title.DynmicINT_1x1_A 04")
  wait(0.1)
  EnableMotion("arcade_title.DynmicINT_1x1_A 15")
  wait(0.1)
  EnableMotion("arcade_title.DynmicINT_1x1_A 14")
  wait(0.1)
  EnableMotion("arcade_title.DynmicINT_1x1_A 05")
  wait(0.1)
  EnableMotion("arcade_title.DynmicINT_1x1_A 13")
  wait(0.1)
  EnableMotion("arcade_title.DynmicINT_1x1_A 06")
  wait(0.1)
  EnableMotion("arcade_title.DynmicINT_1x1_A 12")
  wait(0.1)
  EnableMotion("arcade_title.DynmicINT_1x1_A 11")
  wait(0.1)
  EnableMotion("arcade_title.DynmicINT_1x1_A 07")
  wait(0.1)
  EnableMotion("arcade_title.DynmicINT_1x1_A 08")
  wait(0.1)
  EnableMotion("arcade_title.DynmicINT_1x1_A 10")
  wait(0.1)
  EnableMotion("arcade_title.DynmicINT_1x1_A 09")
end
MA_BreakTitleM = L0_0
function L0_0()
  RestrictCutSceneInput()
  wait(0.5)
  GrabCamera("mickey_arcade_01_a.WallTransformCamera 01", nil, CAMERA_LERP_TRANSITION, 2.1)
  RelayTrigger("mickey_arcade_01_a.BUTTON01_Relay 01")
  wait(6)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 2)
  UnrestrictCutSceneInput()
end
MA_Button01 = L0_0
function L0_0(A0_4, A1_5)
  GrabCamera(A0_4, nil, CAMERA_LERP_TRANSITION, A1_5)
end
MA_GrabCam = L0_0
L0_0 = 1
MA_CrusherField01On = L0_0
function L0_0(A0_6, A1_7)
  if GetGlobal(A1_7) == 1 then
    SetGlobal(A1_7, 0)
  elseif GetGlobal(A1_7) == 0 then
    SetGlobal(A1_7, 1)
  end
end
MA_SetCrusherField = L0_0
function L0_0()
  if MA_CrusherField01On == 1 then
    if GetGlobal("MA_CrusherStation01") == 0 then
      ForceSpawn("mickey_arcade_01_a.CrusherSpawner 01", 1)
      wait(0.7)
    end
    if GetGlobal("MA_CrusherStation02") == 0 then
      ForceSpawn("mickey_arcade_01_a.CrusherSpawner 02", 1)
      wait(0.7)
    end
    if GetGlobal("MA_CrusherStation03") == 0 then
      ForceSpawn("mickey_arcade_01_a.CrusherSpawner 03", 1)
      wait(0.7)
    end
    if GetGlobal("MA_CrusherStation04") == 0 then
      ForceSpawn("mickey_arcade_01_a.CrusherSpawner 04", 1)
      wait(0.7)
    end
    if GetGlobal("MA_CrusherStation05") == 0 then
      ForceSpawn("mickey_arcade_01_a.CrusherSpawner 05", 1)
      wait(0.7)
    end
    if GetGlobal("MA_CrusherStation06") == 0 then
      ForceSpawn("mickey_arcade_01_a.CrusherSpawner 06", 1)
      wait(0.7)
    end
    wait(0.7)
    RelayTrigger("mickey_arcade_01_a.CrusherFieldRelay 01")
  end
end
MA_CrusherField01 = L0_0
