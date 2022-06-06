local L0_0, L1_1
function L0_0()
  SetMap(GetPlayer(), "MAP_2D_SHANGHAIED", "2D")
  wait(1)
  StreamZones(nil, "stream_10")
end
PotW_ZoneL_Load = L0_0
function L0_0()
  DisableGlint("al_p_2dshanghaied.Chair_Object")
end
potw_zonek_disableGlint = L0_0
function L0_0()
  StreamZones(nil, "stream_10b")
  StreamInterior(nil, "stream_10c")
  ActivateScene("environments/thepark/adventureland/pirates/gsa/potw_zonel_bwx.gsa")
end
potw_zonek_streamskullrock = L0_0
