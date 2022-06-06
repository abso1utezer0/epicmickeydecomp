local L0_0, L1_1
function L0_0()
  EndTrackingCurrentLevelForScoring("DBC_1st_ZoneB")
end
ETCLFS3 = L0_0
function L0_0()
  StartTrackingCurrentLevelForScoring("DBC_1st_ZoneC")
end
STCLFS4 = L0_0
L0_0 = 0
DBC_1st_zoneaplayerheight = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  AudioPostEventOn(GetPlayer(), "Unmute_Mickey")
end
StartMickey = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  wait(0)
  LoadLevel(GetPlayer(), "Levels/GV_ZoneA_Start.level")
end
DBC_1st_ZoneD_PortaltoGremlinVillage = L0_0
L0_0 = 0
DBC_1st_side = L0_0
function L0_0(A0_2, A1_3)
  DBC_1st_side = tonumber(A1_3)
end
DBC_1st_SetSide = L0_0
function L0_0()
  FireSequence("dbc_1st_zoneb_dynamic.ConversationalTrigger 02", "DBC_1st_hall1_magicbrush")
  AudioPostEventOn(GetPlayer(), "Play_sfx_UI_DBC_ZoneB_PopUp_Text")
end
Tutorial_Barks2A = L0_0
function L0_0()
  FireSequence("dbc_1st_zoneb_dynamic.ConversationalTrigger 02", "DBC_1st_PaintTheFloor")
  AudioPostEventOn(GetPlayer(), "Play_sfx_UI_DBC_ZoneB_PopUp_Text")
end
Paint_it_Back = L0_0
function L0_0()
  ForEachEntityInGroup(DestroyEntity, "killthisgremlin")
end
killthisgremlin = L0_0
function L0_0()
  SetMap(nil, "MAP_2D_BEANSTALK", "GAME")
  FireSequence("dbc_1st_zoned.QuestEndConvoMarker", "DBC_1st_Quest_EscapeDBC")
end
DBC_1st_ZoneD_FinishTheFight = L0_0
