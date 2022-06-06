local L0_0, L1_1
function L0_0()
  SetupPosition("HMTEntrance")
  AudioPostEventOn(GetPlayer(), "Play_sfx_potw_amb_start")
  AudioPostEventOn(GetPlayer(), "play_music_piratesofthewasteland")
end
PotW_HangmanCheckpoint = L0_0
function L0_0()
  SetCameraAttributes("potw_zonef.Marker(CameraOverride) 01")
  StreamZones(GetPlayer(), "stream_clear")
  StreamInterior(GetPlayer(), "stream_5")
  SaveCheckpoint(GetPlayer(), "PotW_HangmanCheckpoint", "HMTEntrance")
end
HMT_Start = L0_0
