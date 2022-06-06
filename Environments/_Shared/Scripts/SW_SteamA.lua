-- Fully reworked

function SW_SteamA_ToGVZoneF()
  local invar1, invar2
end

function Setup_SBW_ForE3(var1)
  if GetConfigVariableBool("DemoLevelCheck") == true then
    GetPrefabData(var1).MapLoad_SetupPosition = "True"
    SetupProjector(var1)
  end
end

function GV_WoG_HardLoad()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "GV_ZoneF_Start.level")
end
