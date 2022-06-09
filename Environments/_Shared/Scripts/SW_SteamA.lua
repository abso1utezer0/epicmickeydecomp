-- Fully reworked

function SW_SteamA_ToGVZoneF()
  local var1, var2
end

function Setup_SBW_ForE3(param1)
  if GetConfigVariableBool("DemoLevelCheck") == true then
    GetPrefabData(param1).MapLoad_SetupPosition = "True"
    SetupProjector(param1)
  end
end

function GV_WoG_HardLoad()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "GV_ZoneF_Start.level")
end
