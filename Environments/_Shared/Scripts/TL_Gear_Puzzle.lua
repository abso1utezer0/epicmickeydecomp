local L0_0, L1_1
function L0_0(A0_2)
  Print("**********************TL_Stretch_StretchMasterGear")
  if GetGlobal("TL_StretchKeyEnabled") == 0 then
    Print("**********************TL_Stretch_StretchMasterGear: GetGlobal('TL_StretchKeyEnabled') == 0")
  elseif GetPropertyBool("TL_gearpuzzletemp.NOS_HM_StretchGearsA3 02", "Is Painted") == true and GetPropertyBool("TL_gearpuzzletemp.NOS_HM_StretchGearsA2 02", "Is Painted") == true then
    Print("**********************TL_Stretch_StretchMasterGear: GetGlobal('TL_StretchKeyEnabled') == 1 and GetGlobal('RocketVerticalCount') == 0")
    AudioPostEventOn("TL_gearpuzzletemp.NOS_HM_StretchGearsA1 02", "Play_sfx_TC_TCS_Obj_GearSpin")
    Enable(A0_2)
    SetGlobal("TL_StretchMasterRotate", GetGlobal("TL_StretchMasterRotate") + 90)
    FireUser1("TL_zonef.NOS_HM_StretchGearsA1 02")
    wait(1)
    ForEachEntityInGroup(Unhide, "GearSteam1")
    wait(2)
    ForEachEntityInGroup(Hide, "GearSteam1")
    wait(1)
    wait(2)
    wait(4)
  end
end
TL_Stretch_StretchMasterGear = L0_0
function L0_0()
  if GetGlobal("TL_StretchPlatPos") == 1 then
  elseif GetGlobal("TL_StretchPlatPos") == 2 then
    TL_StretchPlatMove02()
    DisableGlint("tl_gearpuzzletemp.NOS_HM_StretchGearsA1 02")
    TL_SkyTramStart()
  elseif GetGlobal("TL_StretchPlatPos") == 3 then
  end
end
TL_StretchPlatMaster = L0_0
function L0_0()
  if GetGlobal("TL_StretchGear01") == 1 and GetGlobal("TL_StretchGear02") == 1 then
    SetGlobal("TL_StretchKeyEnabled", 0)
    SetGlobal("TL_StretchMid", 1)
    SetGlobal("TL_StretchTop", 0)
    AnimGBSequence("TL_gearpuzzletemp.NOS_HM_StretchGearsA3 02", "Middle_Top")
    AnimGBSequence("TL_gearpuzzletemp.NOS_HM_StretchGearsA2 02", "Middle_Top")
    AnimGBSequence("TL_gearpuzzletemp.NOS_HM_StretchGearsA1 02", "Middle_Top")
    if GetGlobal("TL_StretchPlatReverse") == 1 then
      Enable("TL_zonef.NOS_HM_ZoneF_Inert01 01")
    else
      Reverse("TL_zonef.NOS_HM_ZoneF_Inert01 01")
      SetGlobal("TL_StretchPlatReverse", 1)
      Wait(0.25)
      Enable("TL_zonef.NOS_HM_ZoneF_Inert01 01")
    end
  elseif GetGlobal("TL_StretchGear01") == 1 or GetGlobal("TL_StretchGear02") == 1 then
    FireSequence("tl_minihub_story.ConversationalTrigger 01", "TLMH_Gus_InPosition")
  else
    SetGlobal("TL_StretchKeyEnabled", 0)
    SetGlobal("TL_StretchMid", 1)
    SetGlobal("TL_StretchBottom", 0)
    AnimGBSequence("TL_gearpuzzletemp.NOS_HM_StretchGearsA3 02", "Middle_Bottom")
    AnimGBSequence("TL_gearpuzzletemp.NOS_HM_StretchGearsA2 02", "Middle_Bottom")
    AnimGBSequence("TL_gearpuzzletemp.NOS_HM_StretchGearsA1 02", "Middle_Bottom")
    if GetGlobal("TL_StretchPlatReverse") == 1 then
      SetGlobal("TL_StretchPlatReverse", 0)
      Reverse("TL_zonef.NOS_HM_ZoneF_Inert01 01")
      Wait(0.25)
      Enable("TL_zonef.NOS_HM_ZoneF_Inert01 01")
    else
      Wait(0.25)
      Enable("TL_zonef.NOS_HM_ZoneF_Inert01 01")
    end
  end
end
TL_StretchPlatMove02 = L0_0
function L0_0()
  SetGlobal("TL_StretchGear01", 1)
  SetGlobal("TL_StretchPlatPos", GetGlobal("TL_StretchPlatPos") + 1)
end
TL_StretchGear01Painted = L0_0
function L0_0()
  SetGlobal("TL_StretchGear01", 0)
  SetGlobal("TL_StretchPlatPos", GetGlobal("TL_StretchPlatPos") - 1)
end
TL_StretchGear01Thinned = L0_0
function L0_0()
  SetGlobal("TL_StretchGear02", 1)
  SetGlobal("TL_StretchPlatPos", GetGlobal("TL_StretchPlatPos") + 1)
end
TL_StretchGear02Painted = L0_0
function L0_0()
  SetGlobal("TL_StretchGear02", 0)
  SetGlobal("TL_StretchPlatPos", GetGlobal("TL_StretchPlatPos") - 1)
end
TL_StretchGear02Thinned = L0_0
function L0_0(A0_3)
  if GetGlobal("TL_StretchKeyEnabled_2") == 0 then
  elseif GetGlobal("TL_StretchKeyEnabled_2") == 1 then
    Enable(A0_3)
    SetGlobal("TL_StretchMasterRotate_2", GetGlobal("TL_StretchMasterRotate_2") + 90)
    TL_StretchPlatMaster_2()
  end
end
TL_Stretch_StretchMasterGear_2 = L0_0
function L0_0()
  if GetGlobal("TL_StretchPlatPos_2") == 1 then
  elseif GetPropertyBool("TL_gearpuzzletemp.NOS_HM_StretchGearsA3 02_2", "Is Painted") == true and GetPropertyBool("TL_gearpuzzletemp.NOS_HM_StretchGearsA2 02_2", "Is Painted") == true and GetGlobal("RocketVerticalCount") == 0 then
    ForEachEntityInGroup(Enable, "TL_Rocket_Vertical_Gears")
    AudioPostEventOn("tl_minihub_audio.Sound_Marker_FutureGear 01", "Play_sfx_TC_TCS_Env_FutureGearWall")
    Unhide("PlatSteam25")
    FireUser1("tl_minihub_igc.grabcamerafancy 05.FancyCameraLookAt 01")
    wait(2)
    SetGlobal("RocketVerticalCount", 1)
    FireSequence("tl_minihub_story.ConversationalTrigger 01", "TLMH_Gus_PartOfRocket")
    TL_RocketManagerCheck()
    Enable("tl_minihub.SplineFollower 01")
    wait(4)
  elseif GetGlobal("TL_StretchPlatPos_2") == 3 then
  end
end
TL_StretchPlatMaster_2 = L0_0
function L0_0()
  SetGlobal("TL_StretchGear01_2", 1)
  SetGlobal("TL_StretchPlatPos_2", GetGlobal("TL_StretchPlatPos_2") + 1)
end
TL_StretchGear01Painted_2 = L0_0
function L0_0()
  SetGlobal("TL_StretchGear01_2", 0)
  SetGlobal("TL_StretchPlatPos_2", GetGlobal("TL_StretchPlatPos_2") - 1)
end
TL_StretchGear01Thinned_2 = L0_0
function L0_0()
  SetGlobal("TL_StretchGear02_2", 1)
  SetGlobal("TL_StretchPlatPos_2", GetGlobal("TL_StretchPlatPos_2") + 1)
end
TL_StretchGear02Painted_2 = L0_0
function L0_0()
  SetGlobal("TL_StretchGear02_2", 0)
  SetGlobal("TL_StretchPlatPos_2", GetGlobal("TL_StretchPlatPos_2") - 1)
end
TL_StretchGear02Thinned_2 = L0_0
function L0_0()
  local L0_4, L1_5
  TL_StretchGear01Painted = L0_4
  L0_4 = nil
  TL_StretchGear02Painted = L0_4
  L0_4 = nil
  TL_StretchGear02Thinned = L0_4
  L0_4 = nil
  TL_StretchGear02Thinned_2 = L0_4
  L0_4 = nil
  TL_Stretch_StretchMasterGear_2 = L0_4
  L0_4 = nil
  TL_StretchGear01Thinned = L0_4
  L0_4 = nil
  TL_StretchPlatMove02 = L0_4
  L0_4 = nil
  TL_StretchGear02Painted_2 = L0_4
  L0_4 = nil
  TL_Stretch_StretchMasterGear = L0_4
  L0_4 = nil
  TL_StretchPlatMaster_2 = L0_4
  L0_4 = nil
  TL_StretchGear01Thinned_2 = L0_4
  L0_4 = nil
  TL_StretchPlatMaster = L0_4
  L0_4 = nil
  TL_StretchGear01Painted_2 = L0_4
  L0_4 = nil
  Cleanup_TL_Gear_Puzzle = L0_4
end
Cleanup_TL_Gear_Puzzle = L0_0
