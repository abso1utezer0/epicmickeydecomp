local L0_0, L1_1
function L0_0()
  wait(0.5)
  UnrestrictCutSceneInput()
  TeleportToEntity(GetPlayer(), GetRelativePrefabEntity(target, ".ReplayStartPositionLeft"))
end
SetupFilmStrip = L0_0
function L0_0()
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
LoadMeanStreetReplay = L0_0
