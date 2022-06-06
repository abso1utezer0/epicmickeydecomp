local L0_0, L1_1
function L0_0()
  UnpauseAllAI(GetPlayer())
  Wait(1)
  StreamZones(nil, "stream_11")
  ForceSequence("nos_hm_2dhallwayb_dynamic.LeonaQuestMarker(Conversation) 01", "HM_Leona_ExpireQuests")
end
HM_LibrarySlobberEscaped = L0_0
function L0_0()
  ForceSequence("nos_hm_2dhallwayc_dynamic.PipeOrganQuestMarker", "Ballroom_PipEOrgan_FailQuest")
end
HM_BallroomEscapedCheck = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "Levels/HM_StartH.Level")
end
HM_IntoLibraryHardLoad = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "Levels/HM_StartM.Level")
end
HM_AtticHardLoad = L0_0
