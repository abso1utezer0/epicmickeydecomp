local L0_0, L1_1
function L0_0()
  SetMap(GetPlayer(), "MAP_2D_WHALERS", "2D")
  StreamInterior(GetPlayer(), "stream_5_2")
  if GetGlobal("potw_Jungle_Cleared") == 0 then
    StreamZones(nil, "stream_6_noaudio")
  elseif GetGlobal("potw_Jungle_Cleared") == 1 then
    StreamZones(nil, "stream_6_2_noaudio")
  end
  SaveCheckpoint(nil, "Projector_2D_LoadCheckpoint", "potw_ZoneG_Start")
end
PotW_ZoneB_Load2 = L0_0
function L0_0()
  Print("#################### Running Activate Zone B AI.")
  if GetGlobal("potw_Jungle_Cleared") == 0 then
    StreamInterior(GetPlayer(), "stream_clear")
    WaitForLevelLoad()
    StreamZones(nil, "stream_6")
    ActivateScene("Environments/ThePark/AdventureLand/Pirates/GSA/PoTW_ZoneB_AI_2.gsa")
    WaitForLevelLoad()
  elseif GetGlobal("potw_Jungle_Cleared") == 1 then
    StreamInterior(GetPlayer(), "stream_clear")
    WaitForLevelLoad()
    StreamZones(nil, "stream_6_2")
    ActivateScene("Environments/ThePark/AdventureLand/Pirates/GSA/PoTW_ZoneB_AI_3.gsa")
    WaitForLevelLoad()
  end
end
PoTW_ActivateZoneB_AI = L0_0
function L0_0()
  AudioPostEventOn("potw_zoneg_audio.Sound_Marker", "Stop_music_transition2d_junglerhythm")
  StreamZones(GetPlayer(), "stream_3")
end
PotW_2DReturnToTortuga_Teleport = L0_0
function L0_0()
  local L0_2, L1_3
  L0_2 = SetGlobal
  L1_3 = "UI_FilmReels"
  L0_2(L1_3, GetGlobal("UI_FilmReels" + 1))
end
IncrementFilmReel = L0_0
