local L0_0, L1_1
function L0_0()
  StreamZones(GetPlayer(), "stream_1")
end
TL_Stream1 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_2")
end
TL_Stream2 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_3")
end
TL_Stream3 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_4")
end
TL_Stream4 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_5")
end
TL_Stream5 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_6")
end
TL_Stream6 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_7")
end
TL_Stream7 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_8")
end
TL_Stream8 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_9")
end
TL_Stream9 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_10")
end
TL_Stream10 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_11")
end
TL_Stream11 = L0_0
function L0_0()
  StreamInterior(GetPlayer(), "stream2D_5b")
  WaitForLevelLoad()
  StreamZones(GetPlayer(), "stream_12")
end
TL_Stream12 = L0_0
function L0_0()
  StreamInterior(nil, "stream2D_2")
end
TL_Stream13 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_14")
end
TL_Stream14 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_15")
end
TL_Stream15 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_16")
end
TL_Stream16 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_17")
end
TL_Stream17 = L0_0
function L0_0()
  EndTrackingCurrentLevelForScoring("Tomorrow Square")
  StreamZones(GetPlayer(), "stream_18")
end
TL_Stream18 = L0_0
function L0_0()
  wait(1)
  StreamInterior(nil, "stream2D_VISIT2")
end
StreamInInteriorVisit2 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_19")
end
TL_Stream19 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_20")
end
TL_Stream20 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_23")
end
TL_Stream23 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_24")
end
TL_Stream24 = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_28")
end
TL_Stream28 = L0_0
function L0_0(A0_2)
  if GetGlobal("Global_QuickstartLocation") == 0 then
    SetGlobal("Global_QuickstartLocation", 1)
    MoveToEntity(GetPlayer(), A0_2)
  end
end
DEBUG_StartTeleport = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), nil, "tl_minihub_zonee.seq_projector 02.StartPositionLeft")
end
TL_GBTtoHUB_SaveCheckpoint = L0_0
function L0_0()
  TL_Stream19()
  wait(1)
  SaveCheckpoint(GetPlayer(), nil, "ToSpaceMountStartPositionLeft")
end
TL_HubToSV_SaveCheckpoint = L0_0
function L0_0()
  StreamInterior(nil, "empty")
end
TL_Empty = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_2")
  wait(1)
  SaveCheckpoint(GetPlayer(), nil, "tl_2d_nautilus.seq_projector 01.StartPositionLeft")
end
TL_NautToLagoon_SaveCheckpoint = L0_0
function L0_0()
  Print("During loadscreenfade1")
  StartFadeOut(0)
  wait(0.1)
  StartFadeIn(0.8)
  Print("During loadscreenfade2")
end
loadscreenfade = L0_0
function L0_0()
  LoadLevel(GetPlayer(), "Levels/TL_MiniHub.level")
end
HardloadTLSquare = L0_0
function L0_0()
  DoStinger("Stinger_Success", 7)
end
TL_StingerCall = L0_0
