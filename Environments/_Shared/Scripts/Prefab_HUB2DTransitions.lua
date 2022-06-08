-- Fully reworked

function SetTomorrowlandProgress()
  SetGlobal("MS_MeanStreetProgress", 2)
end

function ToMSPosition1()
  SetGlobal("HUB_startposition", 1)
  LoadMeanStreet()
end

function ToMSPosition2()
  SetGlobal("HUB_startposition", 2)
  LoadMeanStreet()
end

function ToMSPosition3()
  SetGlobal("HUB_startposition", 3)
  LoadMeanStreet()
end

function ToMSPosition4()
  SetGlobal("HUB_startposition", 4)
  LoadMeanStreet()
end

function LoadMeanStreet()
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

function LoadVentureland()
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

function LoadNewOrleansSquare()
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

function LoadToonTown()
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

function LoadTomorrowland()
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

function LoadMickeyjunk()
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

function LoadLonesomeManor()
  UnrestrictCutSceneInput()
  EnableGuardianSystem()
  if GetGlobal("NO_NewOrleansProgress") == 1 then
    LoadLevel(GetPlayer(), "Levels/HM_Start.Level")
  end
  if GetGlobal("NO_NewOrleansProgress") == 2 then
    LoadLevel(GetPlayer(), "Levels/HMv2_Start.Level")
  end
end

function GV_SBW_Load()
  if GetConfigVariableBool("DemoLevelCheck") == true then
    GetPrefabData("GV_SBW").TeleportToMarker = "EnterScalpRock"
    GetPrefabData("GV_SBW").EnterFunction = "HardLoadToSR"
    StreamZones(GetPlayer(), "E3_SBW")
  else
    GetPrefabData("GV_SBW").TeleportToMarker = "gremlinvillage_zonef.MickeyStartPositionZoneF"
    StreamZones(GetPlayer(), "stream_7")
  end
end

function HardLoadToSR()
  LoadLevel(GetPlayer(), "Levels/E3Demo_SR.level")
end