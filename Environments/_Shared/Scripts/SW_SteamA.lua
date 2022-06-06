local L0_0, L1_1
function L0_0()
  local L0_2, L1_3
end
SW_SteamA_ToGVZoneF = L0_0
function L0_0(A0_4)
  if GetConfigVariableBool("DemoLevelCheck") == true then
    GetPrefabData(A0_4).MapLoad_SetupPosition = "True"
    SetupProjector(A0_4)
  end
end
Setup_SBW_ForE3 = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "GV_ZoneF_Start.level")
end
GV_WoG_HardLoad = L0_0
