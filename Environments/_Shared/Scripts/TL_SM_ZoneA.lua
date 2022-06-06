local L0_0, L1_1
L0_0 = 0
TL_SM_TramStoppedForToon = L0_0
function L0_0(A0_2)
  SetSpeed(A0_2, 0)
  TL_SM_TramStoppedForToon = 1
end
TL_SM_ZoneA_StopTramToon = L0_0
function L0_0(A0_3)
  if TL_SM_TramStoppedForToon == 1 and GetPropertyBool("sm_tl_zonea.P_ZoneB_Toon_03 09", "Is Painted") and GetPropertyBool("sm_tl_zonea.Dark 02", "Is Painted") then
    SetSpeed(A0_3, 3)
    TL_SM_TramStoppedForToon = 0
  end
end
TL_SM_ZoneA_CheckTrack = L0_0
function L0_0()
  StreamZones(GetPlayer(), "stream_7")
  WaitForLevelLoad()
  MoveToEntity(GetPlayer(), "SM_TL_ZoneB.SM_StartPoint")
end
TL_Stream_SM = L0_0
