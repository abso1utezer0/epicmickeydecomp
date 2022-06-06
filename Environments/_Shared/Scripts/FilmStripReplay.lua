-- Fully reworked

function SetupFilmStrip()
  wait(0.5)
  UnrestrictCutSceneInput()
  TeleportToEntity(GetPlayer(), GetRelativePrefabEntity(target, ".ReplayStartPositionLeft"))
end

function LoadMeanStreetReplay()
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
    LoadLevel(GetPlayer(), "Levels/MeanStreet_V6.Level")
  end
end