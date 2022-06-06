local L0_0, L1_1
function L0_0(A0_2, A1_3)
  local L2_4
  L2_4 = "stream_"
  L2_4 = L2_4 .. A1_3
  StreamZones(A0_2, L2_4)
end
DBC_StreamZones = L0_0
function L0_0()
  SetMap(nil, "MAP_2D_FANTASIA1", "2D")
end
DBC_ZoneW_MapSetup = L0_0
function L0_0()
  SetMap(nil, "MAP_2D_FANTASIA2", "2D")
end
DBC_ZoneX_MapSetup = L0_0
function L0_0()
  SetMap(nil, "MAP_2D_FANTASIA3", "2D")
end
DBC_ZoneY_MapSetup = L0_0
function L0_0()
  SetMap(nil, "MAP_2D_FANTASIA4", "2D")
end
DBC_ZoneZ_MapSetup = L0_0
function L0_0()
  SetMap(nil, "MAP_2D_SLEEPINGBEAUTY", "2D")
end
DBC_ZoneC_MapSetup = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "Levels/DBC_Start_ZoneM.level")
end
DBC_Fantasia4ToLossTower = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "Levels/DBC_Start_ZoneH.level")
end
DBC_FantasiaToThroneRoom = L0_0
function L0_0()
  wait(1)
  StreamZones(GetPlayer(), "stream_throneroom")
end
DBC_SleepingBeautyToThroneRoom = L0_0
function L0_0()
  wait(1)
  StreamZones(GetPlayer(), "stream_grieftower")
end
DBC_Fantasia3ToGriefTower = L0_0
