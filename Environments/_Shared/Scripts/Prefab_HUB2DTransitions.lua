local L0_0, L1_1
function L0_0()
  SetGlobal("MS_MeanStreetProgress", 2)
end
SetTomorrowlandProgress = L0_0
function L0_0()
  SetGlobal("HUB_startposition", 1)
  LoadMeanStreet()
end
ToMSPosition1 = L0_0
function L0_0()
  SetGlobal("HUB_startposition", 2)
  LoadMeanStreet()
end
ToMSPosition2 = L0_0
function L0_0()
  SetGlobal("HUB_startposition", 3)
  LoadMeanStreet()
end
ToMSPosition3 = L0_0
function L0_0()
  SetGlobal("HUB_startposition", 4)
  LoadMeanStreet()
end
ToMSPosition4 = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  if GetGlobal("MS_MeanStreetProgress") == 1 then
    LoadLevel(GetPlayer(), "Levels/MeanStreet_V1.Level")
  end
  if GetGlobal("MS_MeanStreetProgress") == 2 then
    LoadLevel(GetPlayer(), "Levels/MeanStreet_V2.Level")
  end
  if GetGlobal("MS_MeanStreetProgress") == 3 then
    LoadLevel(GetPlayer(), "Levels/MeanStreet_V3.Level")
  end
  if GetGlobal("MS_MeanStreetProgress") == 4 then
    LoadLevel(GetPlayer(), "Levels/MeanStreet_V4.Level")
  end
  if GetGlobal("MS_MeanStreetProgress") == 5 then
    LoadLevel(GetPlayer(), "Levels/MeanStreet_V5.Level")
  end
  if GetGlobal("MS_MeanStreetProgress") == 6 then
    if GetGlobal("MS_InvasionRepelled") == 0 then
      LoadLevel(GetPlayer(), "Levels/MeanStreet_V6.Level")
    else
      LoadLevel(GetPlayer(), "Levels/MeanStreet_V6_NoEnemies.level")
    end
  end
end
LoadMeanStreet = L0_0
function L0_0()
  if GetGlobal("AL_AdventurelandProgress") == 1 then
    LoadLevel(GetPlayer(), "Levels/Adventureland_v1.Level")
  end
  if GetGlobal("AL_AdventurelandProgress") == 2 then
    LoadLevel(GetPlayer(), "Levels/Adventureland_v2_NoPirates.level")
  end
  if GetGlobal("AL_AdventurelandProgress") == 3 then
    LoadLevel(GetPlayer(), "Levels/Adventureland_v2_Pirates.level")
  end
  if GetGlobal("AL_AdventurelandProgress") == 4 then
    LoadLevel(GetPlayer(), "Levels/Adventureland_v3.level")
  end
end
LoadVentureland = L0_0
function L0_0()
  if GetGlobal("NO_NewOrleansProgress") == 1 then
    LoadLevel(GetPlayer(), "Levels/NewOrleans_V1.level")
  end
  if GetGlobal("NO_NewOrleansProgress") == 2 then
    LoadLevel(GetPlayer(), "Levels/NewOrleans_V2.level")
  end
  if GetGlobal("NO_NewOrleansProgress") == 3 then
    LoadLevel(GetPlayer(), "Levels/NewOrleans_V3.level")
  end
end
LoadNewOrleansSquare = L0_0
function L0_0()
  if GetGlobal("TT_ToonTownProgress") == 1 then
    LoadLevel(GetPlayer(), "Levels/ToonTown_V1.level")
  end
  if GetGlobal("TT_ToonTownProgress") == 2 then
    LoadLevel(GetPlayer(), "Levels/ToonTown_V2.level")
  end
  if GetGlobal("TT_ToonTownProgress") == 3 then
    LoadLevel(GetPlayer(), "Levels/ToonTown_V3.level")
  end
end
LoadToonTown = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  EnableGuardianSystem()
  if GetGlobal("MS_MeanStreetProgress") == 2 then
    LoadLevel(GetPlayer(), "Levels/TL_Start.Level")
    TeleportToEntity(GetPlayer(), "tl_minihub_zoneb.Start")
  end
  if GetGlobal("MS_MeanStreetProgress") == 6 then
    LoadLevel(GetPlayer(), "Levels/TL_Visit2_Start.Level")
  end
end
LoadTomorrowland = L0_0
function L0_0()
  Print("Loading Mickeyjunk")
  UnrestrictCutSceneInput()
  EnableGuardianSystem()
  if GetGlobal("TT_ToonTownProgress") == 1 then
    LoadLevel(GetPlayer(), "Levels/MJM_ZoneA.Level")
  end
  if GetGlobal("TT_ToonTownProgress") == 2 then
    LoadLevel(GetPlayer(), "Levels/MJM_ZoneF2.Level")
  end
end
LoadMickeyjunk = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  EnableGuardianSystem()
  if GetGlobal("NO_NewOrleansProgress") == 1 then
    LoadLevel(GetPlayer(), "Levels/HM_Start.Level")
  end
  if GetGlobal("NO_NewOrleansProgress") == 2 then
    LoadLevel(GetPlayer(), "Levels/HMv2_Start.Level")
  end
end
LoadLonesomeManor = L0_0
function L0_0()
  if GetConfigVariableBool("DemoLevelCheck") == true then
    GetPrefabData("GV_SBW").TeleportToMarker = "EnterScalpRock"
    GetPrefabData("GV_SBW").EnterFunction = "HardLoadToSR"
    StreamZones(GetPlayer(), "E3_SBW")
  else
    GetPrefabData("GV_SBW").TeleportToMarker = "gremlinvillage_zonef.MickeyStartPositionZoneF"
    StreamZones(GetPlayer(), "stream_7")
  end
end
GV_SBW_Load = L0_0
function L0_0()
  LoadLevel(GetPlayer(), "Levels/E3Demo_SR.level")
end
HardLoadToSR = L0_0
