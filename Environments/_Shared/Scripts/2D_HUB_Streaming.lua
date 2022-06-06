-- Fully Reworked & explained
local L0_0, L1_1

-- Leave to Mean Street
function LeavingToMeanStreet()
  SetGlobal("2dDirection", 0)
  SetGlobal("HUB_To_Stream", 1)
end

-- Leave to Ostown and load the Thru the Mirror transition level
function LeavingToOsTown()
  SetGlobal("2dDirection", 1)
  SetGlobal("HUB_To_Stream", 2)
  UnrestrictCutSceneInput()
  EndTrackingCurrentLevelForScoring("MS_PlaystyleToon")
  LoadLevel(GetPlayer(), "Levels/2D_ThruTheMirror.level")
end

-- Leave to Bog Easy and load the Lonesome Ghost transition level
function LeavingToNewOrleans()
  SetGlobal("2dDirection", 1)
  SetGlobal("HUB_To_Stream", 3)
  UnrestrictCutSceneInput()
  EndTrackingCurrentLevelForScoring("MS_PlaystyleToon")
  LoadLevel(GetPlayer(), "Levels/2D_LonesomeGhost01.level")
end

-- Leave to Ventureland and load the Jungle Rhythm transition level
function LeavingToVentureland()
  SetGlobal("2dDirection", 1)
  SetGlobal("HUB_To_Stream", 4)
  UnrestrictCutSceneInput()
  EndTrackingCurrentLevelForScoring("MS_PlaystyleToon")
  LoadLevel(GetPlayer(), "Levels/2D_JungleRhythm01.level")
end

-- Setup for leaving to an action level
function LeavingToActionLevel()
  SetGlobal("2dDirection", 1)
  EndTrackingCurrentLevelForScoring("MS_PlaystyleToon")
end

-- Setup for leaving to a Lonesome Manor action level
function LeavingToActionLevelLM()
  FireSequence("hub_nosquare.GusConvos", "NO_LeavingToLMQuestExpire")
end

-- Setup for leaving to a Tomorrow City action level
function LeavingToActionLevelTC()
  if GetGlobal("MS_MeanStreetProgress") == 6 then
    FireSequence("hub_meanstreet.GusMeanStreet", "MSS_ExpireLeavingToTCVisit2")
  else
    FireSequence("hub_meanstreet.GusMeanStreet", "MSS_ExpireLeavingToTCVisit1")
  end
end

-- Setup for leaving to a Ventureland action level
function LeavingToActionLevelPirates()
  FireSequence("hub_adventureland_dynamic.GusConvo", "VL_ExpireQuestsLeavingToPirates")
end

-- Load and setup the Plutopia transition level
function LeavingToPlutopia()
  SetGlobal("2dDirection", 1)
  UnrestrictCutSceneInput()
  EndTrackingCurrentLevelForScoring("MS_PlaystyleToon")
  LoadLevel(GetPlayer(), "Levels/2D_Plutopia01.level")
end

-- Setup for leaving to a Ventureland action level
function LeavingToActionLevel_Venture()
  SetGlobal("2dDirection", 1)
  UnrestrictCutSceneInput()
end

-- Choose a certain stream of a hub level
function PickHUBLoad(hubLoadChoice)
  Print(hubLoadChoice)
  SetGlobal("HUB_From2D", 1)
  if GetGlobal("HUB_To_Stream") == 1 then
    PickMeanStreetStream(hubLoadChoice)
  end
  if GetGlobal("HUB_To_Stream") == 2 then
    PickOsTownStream(hubLoadChoice)
  end
  if GetGlobal("HUB_To_Stream") == 3 then
    PickNewOrleansStream(hubLoadChoice)
  end
  if GetGlobal("HUB_To_Stream") == 4 then
    PickVenturelandStream(hubLoadChoice)
  end
end

-- Choose a Mean Street stream
function PickMeanStreetStream(MS_StreamPick)
  StreamZones(GetPlayer(), "empty")
  wait(0.01)
  SaveCheckpointSelf(MS_StreamPick, "Projector_2D_LoadCheckpoint")
end

-- Choose an Ostown stream
function PickOsTownStream(TT_StreamPick)
  if GetGlobal("TT_ToonTownProgress") == 1 then
    StreamZones(GetPlayer(), "ttvisit1")
  elseif GetGlobal("TT_ToonTownProgress") == 2 then
    StreamZones(GetPlayer(), "ttvisit2")
  elseif GetGlobal("TT_ToonTownProgress") == 3 then
    if GetGlobal("MS_rocketfmv") == 1 or GetGlobal("TT_tent1destroyed") == 1 and GetGlobal("TT_V3_EnemyState") == 1 then
      StreamZones(GetPlayer(), "ttvisit3npc")
    else
      StreamZones(GetPlayer(), "ttvisit3")
    end
  end
  wait(0.1)
  SaveCheckpointSelf(TT_StreamPick, "Projector_2D_LoadCheckpoint")
end

-- Choose an Ostown stream (with sound(?))
function PickOsTownStream_wsound()
  SetGlobal("HUB_startposition", 1)
  if GetGlobal("TT_ToonTownProgress") == 1 then
    StreamZones(GetPlayer(), "ttvisit1_wsound")
  elseif GetGlobal("TT_ToonTownProgress") == 2 then
    StreamZones(GetPlayer(), "ttvisit2_wsound")
  elseif GetGlobal("TT_ToonTownProgress") == 3 then
    if GetGlobal("MS_rocketfmv") == 1 or GetGlobal("TT_tent1destroyed") == 1 and GetGlobal("TT_V3_EnemyState") == 1 then
      StreamZones(GetPlayer(), "ttvisit3npc_wsound")
    else
      StreamZones(GetPlayer(), "ttvisit3_wsound")
    end
  end
end

-- Choose a Bog Easy stream
function PickNewOrleansStream(NO_StreamPick)
  if GetGlobal("NO_NewOrleansProgress") == 1 then
    StreamZones(GetPlayer(), "novisit1")
  elseif GetGlobal("NO_NewOrleansProgress") == 2 then
    StreamZones(GetPlayer(), "novisit2")
  elseif GetGlobal("NO_NewOrleansProgress") == 3 and GetGlobal("NO_tentdestroy") == 0 then
    StreamZones(GetPlayer(), "novisit3")
  elseif GetGlobal("NO_NewOrleansProgress") == 3 and GetGlobal("NO_tentdestroy") == 1 then
    StreamZones(GetPlayer(), "novisit3npc")
  end
  wait(0.1)
  Print("********************************Saving Checkpoint")
  SaveCheckpointSelf(NO_StreamPick, "Projector_2D_LoadCheckpoint")
end

-- Choose a Bog Easy stream (with sound(?))
function PickNewOrleansStream_wsound()
  SetGlobal("HUB_startposition", 1)
  if GetGlobal("NO_NewOrleansProgress") == 1 then
    StreamZones(GetPlayer(), "novisit1_wsound")
  elseif GetGlobal("NO_NewOrleansProgress") == 2 then
    StreamZones(GetPlayer(), "novisit2_wsound")
  elseif GetGlobal("NO_NewOrleansProgress") == 3 and GetGlobal("NO_tentdestroy") == 0 then
    StreamZones(GetPlayer(), "novisit3_wsound")
  elseif GetGlobal("NO_NewOrleansProgress") == 3 and GetGlobal("NO_tentdestroy") == 1 then
    StreamZones(GetPlayer(), "novisit3npc_wsound")
  end
end

-- Choose a Ventureland stream
function PickVenturelandStream(AL_StreamPick)
  if GetGlobal("AL_AdventurelandProgress") == 1 then
    StreamZones(GetPlayer(), "alvisit1")
  elseif GetGlobal("AL_AdventurelandProgress") == 2 then
    StreamZones(GetPlayer(), "alvisit2_NoPirates")
  elseif GetGlobal("AL_AdventurelandProgress") == 3 then
    StreamZones(GetPlayer(), "alvisit2_Pirates")
  elseif GetGlobal("AL_AdventurelandProgress") == 4 and 2 > GetGlobal("AL_BlotInvasionInProgress") then
    StreamZones(GetPlayer(), "alvisit3")
  elseif GetGlobal("AL_AdventurelandProgress") == 4 and GetGlobal("AL_BlotInvasionInProgress") == 2 then
    StreamZones(GetPlayer(), "alvisit3npc")
  end
  wait(0.1)
  SaveCheckpointSelf(AL_StreamPick, "Projector_2D_LoadCheckpoint")
end

-- Choose a Ventureland stream (with sound(?))
function PickVenturelandStream_wsound()
  SetGlobal("HUB_startposition", 1)
  StreamInterior(nil, "empty")
  if GetGlobal("AL_AdventurelandProgress") == 1 then
    StreamZones(GetPlayer(), "alvisit1_wsound")
  elseif GetGlobal("AL_AdventurelandProgress") == 2 then
    StreamZones(GetPlayer(), "alvisit2_NoPirates_wsound")
  elseif GetGlobal("AL_AdventurelandProgress") == 3 then
    StreamZones(GetPlayer(), "alvisit2_Pirates_wsound")
  elseif GetGlobal("AL_AdventurelandProgress") == 4 and 2 > GetGlobal("AL_BlotInvasionInProgress") then
    StreamZones(GetPlayer(), "alvisit3_wsound")
  elseif GetGlobal("AL_AdventurelandProgress") == 4 and GetGlobal("AL_BlotInvasionInProgress") == 2 then
    StreamZones(GetPlayer(), "alvisit3npc_wsound")
  end
end

-- i feel like there is a much more efficient way to do the following but i want to be true to the actual code

-- Set hub position to 1
function HUBPosition1()
  SetGlobal("HUB_startposition", 1)
end

-- Set hub position to 1
function HUBPosition2()
  SetGlobal("HUB_startposition", 2)
end

-- Set hub position to 1
function HUBPosition3()
  SetGlobal("HUB_startposition", 3)
end

-- Set hub position to 1
function HUBPosition4()
  SetGlobal("HUB_startposition", 4)
end

-- Save a transition checkpoint of a certain number
function SaveTransitionCheckpoint(CheckpointSaveNum)
  SaveCheckpoint(nil, nil, CheckpointSaveNum)
end

-- Save the first checkpoint in the Steamroller transition level
function Steamroller01Save()
  if GetGlobal("TT_ToonTownProgress") == 1 then
    DeactivateScene("Environments/MeanStreets/LevelWrappers/OsTown_Visit1_Wrapper.gsa")
  end
  if GetGlobal("TT_ToonTownProgress") == 2 then
    DeactivateScene("Environments/MeanStreets/LevelWrappers/OsTown_Visit2_Wrapper.gsa")
  end
  wait(0.1)
  SaveCheckpoint(nil, "Projector_2D_LoadCheckpoint", "SteamrollerLeftStart")
end

-- Save checkpoint in the Plutopia transition level
function PlutopiaSave()
  if GetGlobal("MS_MeanStreetProgress") == 2 then
    DeactivateScene("Environments/MeanStreets/LevelWrappers/MeanStreet_Visit2_Wrapper.gsa")
  end
  if GetGlobal("MS_MeanStreetProgress") == 6 then
    DeactivateScene("Environments/MeanStreets/LevelWrappers/MeanStreet_Visit6_Wrapper.gsa")
  end
  wait(0.1)
  SaveCheckpoint(nil, "Projector_2D_LoadCheckpoint", "PlutopiaLeftStart")
end

-- Save the second checkpoint in the Lonesome Ghost transition level
function LonesomeGhost02Save()
  DeactivateScene("Environments/MeanStreets/LevelWrappers/BogEasy_Visit1_Wrapper.gsa")
  wait(0.1)
  Print("Saving Lonseome Ghost02 Checkpoint")
  SaveCheckpoint(nil, "Projector_2D_LoadCheckpoint", "LonesomeGhost02LeftStart")
end

-- Save a checkpoint in the Castaway transition level
function CastawaySave()
  DeactivateScene("Environments/MeanStreets/LevelWrappers/Ventureland_Visit1_Wrapper.gsa")
  wait(0.1)
  SaveCheckpoint(nil, "Projector_2D_LoadCheckpoint", "CastawayLeftStart")
end

-- Hard load the POTW level
function HardLoadPirates()
  UnrestrictCutSceneInput()
  LoadLevel(GetPlayer(), "Levels/PotW_Start.Level")
end

-- Stream in an empty version for the Castaways transition level
function StreamInEmptyForCastaway01()
  wait(1)
  StreamZones(nil, "castaway01_ext")
end

-- Choose if Thru the Mirror should play the "teeter totter" sound
ThruMirrorTeeterTotterSoundPlaying = 0

-- Play the "teeter totter" sound in Thru the Mirror if the above variable is set to 1
function ThruMirrorPlayTetterTotterSound()
  if ThruMirrorTeeterTotterSoundPlaying == 0 then
    ThruMirrorTeeterTotterSoundPlaying = 1
    AudioPostEventOn(GetPlayer(), "Play_sfx_2D_TM_Board_LandOn")
    wait(3)
    ThruMirrorTeeterTotterSoundPlaying = 0
  end
end