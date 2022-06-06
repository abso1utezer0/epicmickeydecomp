local L0_0, L1_1
function L0_0()
  EndTrackingCurrentLevelForScoring("Lagoon")
  SetDefaultCameraValues(6.25, 5, 0)
  SetMap(nil, "MAP_TL_MINIHUB_ZONED2", "GAME")
  ForEachEntityInGroup(Disable, "Trigger_PPTV_Volume")
  ForEachEntityInGroup(Hide, "tl_minihub_zoned2.pressureplate_tv 01.Trigger_PPTV")
end
TL_ZoneD2_Setup = L0_0
function L0_0()
  SaveCheckpoint(GetPlayer(), "TL_ZoneD2_LoadCheckpoint", "tl_minihub_zoned2.Marker(Parentable) 02")
end
TL_ZoneD2_SaveCheckpoint = L0_0
function L0_0()
  SetDefaultCameraValues(6.25, 5, 0)
  SetMap(nil, "MAP_TL_MINIHUB_ZONED2", "GAME")
  ForEachEntityInGroup(Hide, "tl_minihub_zoned2.pressureplate_tv 01.Trigger_PPTV")
  ForEachEntityInGroup(Disable, "Trigger_PPTV_Volume")
  AnimGBSequence("tl_minihub_zoned2.HavokGBAnimation 02", "Raise")
  Disable("tl_minihub_zoned2.Trigger 01")
  if GetGlobal("TL_GBT_BLOB_Defeated") == 1 or GetGlobal("TL_GBT_BLOB_Defeated") == 2 then
    DestroyEntity("tl_minihub_zoned2.TheBlob 01")
    Disable("tl_minihub_zoned2.Trigger 02")
    ForEachEntityInGroup(Enable, "Trigger_PPTV_Volume")
    ForEachEntityInGroup(Unhide, "tl_minihub_zoned2.pressureplate_tv 01.Trigger_PPTV")
    SplineFollower_TeleportToKnot("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", "tl_minihub_zoned2.SplineKnot 03")
    SetGlobal("TLMH_ZD2_CarouselPowered", 1)
    if GetGlobal("TL_GBT_BLOB_Defeated") == 1 then
      InstantRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", -102)
      InstantRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 02", -102)
    elseif GetGlobal("TL_GBT_BLOB_Defeated") == 2 then
      InstantRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", 130)
      InstantRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 02", 130)
    end
  end
  FireThread(TL_ZoneD2_CloseTheFrontDoor)
end
TL_ZoneD2_LoadCheckpoint = L0_0
function L0_0()
  Wait(0.5)
  AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Gate01 02", "closed")
  ExitCutscene("tl_minihub_zoned2.TheBlob 01")
end
TL_ZoneD2_CloseTheFrontDoor = L0_0
function L0_0()
  if GetGlobal("TL_GBT_BLOB_Defeated") == 0 or GetGlobal("TL_GBT_BLOB_Defeated") == 1 then
    Hide("tl_minihub_zoned2.PedestrianMaleDog 02")
  end
  if GetGlobal("TL_GBT_BLOB_Defeated") == 0 or GetGlobal("TL_GBT_BLOB_Defeated") == 2 then
    Hide("tl_minihub_zoned2.PedestrianMaleDog 03")
  end
end
TL_ZoneD2_HideDog = L0_0
function L0_0()
  Kill("tl_minihub_zoned2.TheBlob 01")
end
DestroySlobber = L0_0
function L0_0()
  if GetGlobal("D2_Gus_Intro_played") == 0 then
    FireUser1("tl_minihub_zoned2_igc.grabcamerafancy 01.FancyCameraLookAt 01")
    AudioPostEventOn(GetPlayer(), "Play_sfx_TC_GBT_CurtainRise_Start")
    AnimGBSequence("tl_minihub_zoned2.HavokGBAnimation 02", "Raise")
    AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Gate01 02", "closed")
    FireThread(Cleanup_TL_MiniHub_ZoneD1)
  end
end
TL_CarouselTurn1 = L0_0
function L0_0()
  AnimGBSequence("tl_minihub_zoned1.TL_MiniHub_Gate01 02", "opening")
end
InteriorStream = L0_0
function L0_0()
  wait(0)
  DestroyEntity("RoverTVSketch")
  StartFadeOut(0.8)
  PlayAndUnlockMovie("TL_visit1_Training_TV.bik", "TL_visit1_Training_TV")
  FireUser1("LookAtTVPressurePlate")
  Unhide("tl_minihub_zoned2.pressureplate_tv 01.Trigger_PPTV")
  ForEachEntityInGroup(Enable, "Trigger_PPTV_Volume")
end
TL_CarouselTurn3 = L0_0
L0_0 = 0
RoverIntroCount = L0_0
L0_0 = 0
MickeyTeleport = L0_0
function L0_0()
  local L0_2
  L0_2 = GetScrapperPercent
  L0_2 = L0_2(GetPlayer())
  RoverIntroCount = 1
  if GetGlobal("TL_GBT_BLOB_Defeated") == 1 then
    SetGlobal("TL_CarouselWL", 1)
    FireUser1("thinnerCam")
    SplineFollower_SetDisabled("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", false)
    ForEachEntityInGroup(Unhide, "WallSparks")
    ForEachEntityInGroup(StartEmitters, "WallSparks")
    ShakeCamera(4.5, 6, 0, 0.5, 0.002, 0.002)
    wait(4)
    ForEachEntityInGroup(StopEmitters, "WallSparks")
    wait(0.5)
    ForEachEntityInGroup(Hide, "WallSparks")
    wait(0.5)
    ForEachEntityInGroup(Unhide, "RotateSparks")
    ForEachEntityInGroup(StartEmitters, "RotateSparks")
    MultiPosSoundStart("tl_minihub_zoned2_audio.Sound_Marker_Steam_Controller")
    Unhide("tl_minihub_zoned2.PedestrianMaleDog 03")
    SetRotatorMaxSpeed("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", 30)
    SetRotatorMaxSpeed("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 02", 30)
    StartRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", -102)
    StartRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 02", -102)
    AudioPostEventOn("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", "Play_sfx_TC_GBT_Carousel_Rotate")
    wait(0.5)
    ShakeCamera(4.5, 6, 0, 0.5, 0.002, 0.002)
    wait(5)
    ForEachEntityInGroup(StopEmitters, "RotateSparks")
    MultiPosSoundStop("tl_minihub_zoned2_audio.Sound_Marker_Steam_Controller")
    wait(0.5)
    ForEachEntityInGroup(Hide, "RotateSparks")
  elseif GetGlobal("TL_GBT_BLOB_Defeated") == 2 then
    SetGlobal("TL_CarouselLeader", 1)
    FireUser1("painterCam")
    SplineFollower_SetDisabled("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", false)
    ForEachEntityInGroup(Unhide, "WallSparks")
    ForEachEntityInGroup(StartEmitters, "WallSparks")
    wait(0.5)
    ShakeCamera(4.5, 6, 0, 0.5, 0.002, 0.002)
    wait(4)
    ForEachEntityInGroup(StopEmitters, "WallSparks")
    wait(0.5)
    ForEachEntityInGroup(Hide, "WallSparks")
    ForEachEntityInGroup(Unhide, "RotateSparks")
    ForEachEntityInGroup(StartEmitters, "RotateSparks")
    MultiPosSoundStart("tl_minihub_zoned2_audio.Sound_Marker_Steam_Controller")
    Unhide("tl_minihub_zoned2.PedestrianMaleDog 02")
    SetRotatorMaxSpeed("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", 30)
    SetRotatorMaxSpeed("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 02", 30)
    StartRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", 130)
    StartRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 02", 130)
    AudioPostEventOn("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", "Play_sfx_TC_GBT_Carousel_Rotate")
    wait(0.5)
    ShakeCamera(4.5, 6, 0, 0.5, 0.002, 0.002)
    wait(5)
    ForEachEntityInGroup(StopEmitters, "RotateSparks")
    wait(0.5)
    ForEachEntityInGroup(Hide, "RotateSparks")
    MultiPosSoundStop("tl_minihub_zoned2_audio.Sound_Marker_Steam_Controller")
  end
  Unhide("tl_minihub_zoned2.Ability_TVSketchPaint 01")
end
TL_CarouselTurn4 = L0_0
function L0_0()
  if RoverIntroCount == 1 then
    if GetGlobal("TL_GBT_BLOB_Defeated") == 1 then
      FireUser1("RoverIntroCam")
      wait(1)
      FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 01", "D2_Rover_IntroWastelander")
      RoverIntroCount = 55
    elseif GetGlobal("TL_GBT_BLOB_Defeated") == 2 then
      FireUser1("RoverIntroCam")
      wait(1)
      FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 01", "D2_Rover_IntroHero")
      RoverIntroCount = 55
    end
  end
  if MickeyTeleport == 1 then
    MoveToEntity(GetPlayer(), "tl_minihub_zoned2.Marker(ParentRotator) 02")
    MickeyTeleport = 55
  end
end
MisterRoverIntro = L0_0
function L0_0()
  local L1_3
  L1_3 = 1
  MickeyTeleport = L1_3
end
MickeyTeleportSetup = L0_0
function L0_0()
  FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 02", "D2_Gus_FarewellWastelander")
  SetGlobal("TL_CarouselWL", 1)
  FireUser1("thinnerCam")
  SplineFollower_SetDisabled("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", false)
  ForEachEntityInGroup(Unhide, "WallSparks")
  wait(3)
  ForEachEntityInGroup(Hide, "WallSparks")
  Unhide("tl_minihub_zoned2.PedestrianMaleDog 03")
  ForEachEntityInGroup(Unhide, "RotateSparks")
  MultiPosSoundStart("tl_minihub_zoned2_audio.Sound_Marker_Steam_Controller")
  StartRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", -102)
  StartRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 02", -102)
  AudioPostEventOn("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", "Play_sfx_TC_GBT_Carousel_Rotate")
  wait(0.5)
  ShakeCamera(4.5, 6, 0, 0.5, 0.002, 0.002)
  wait(5.5)
  ForEachEntityInGroup(Hide, "RotateSparks")
  MultiPosSoundStop("tl_minihub_zoned2_audio.Sound_Marker_Steam_Controller")
  wait(2)
  FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 01", "D2_Rover_IntroWastelander")
  wait(13)
end
Wastelander = L0_0
function L0_0()
  FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 02", "D2_Gus_FarewellLeader")
  FireUser1("painterCam")
  ForEachEntityInGroup(Unhide, "WallSparks")
  SplineFollower_SetDisabled("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", false)
  wait(3)
  ForEachEntityInGroup(Hide, "WallSparks")
  Unhide("tl_minihub_zoned2.PedestrianMaleDog 02")
  ForEachEntityInGroup(Unhide, "RotateSparks")
  MultiPosSoundStart("tl_minihub_zoned2_audio.Sound_Marker_Steam_Controller")
  StartRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", 130)
  StartRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 02", 130)
  ForEachEntityInGroup(Unhide, "RotateSparks")
  MultiPosSoundStart("tl_minihub_zoned2_audio.Sound_Marker_Steam_Controller")
  AudioPostEventOn("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", "Play_sfx_TC_GBT_Carousel_Rotate")
  wait(0.5)
  ShakeCamera(4.5, 6, 0, 0.5, 0.002, 0.002)
  wait(5.5)
  ForEachEntityInGroup(Hide, "RotateSparks")
  MultiPosSoundStop("tl_minihub_zoned2_audio.Sound_Marker_Steam_Controller")
  wait(2)
  FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 01", "D2_Rover_IntroHero")
  wait(13)
end
Leader = L0_0
function L0_0()
  SetGlobal("TLMH_ZD2_CarouselPowered", GetGlobal("TLMH_ZD2_CarouselPowered") + 1)
  FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 02", "D2_Gus_TalktoImagineer")
end
TL_CarouselTurn2 = L0_0
function L0_0()
  if GetGlobal("TL_CarouselWL") == 1 then
    SetGlobal("TLMH_ZD2_CarouselPowered", GetGlobal("TLMH_ZD2_CarouselPowered") + 1)
    FireUser1("thinnerCam")
    TL_Stream13()
    SetRotatorMaxSpeed("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", 30)
    SetRotatorMaxSpeed("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 02", 30)
    StartRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", 10)
    StartRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 02", 10)
    ForEachEntityInGroup(Unhide, "RotateSparks")
    MultiPosSoundStart("tl_minihub_zoned2_audio.Sound_Marker_Steam_Controller")
    AudioPostEventOn("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", "Play_sfx_TC_GBT_Carousel_Rotate_Fast")
    FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 01", "D2_Rover_AwayWeGo")
    wait(0.5)
    ShakeCamera(4.5, 6, 0, 0.5, 0.002, 0.002)
    wait(5.5)
    ForEachEntityInGroup(Hide, "RotateSparks")
    MultiPosSoundStop("tl_minihub_zoned2_audio.Sound_Marker_Steam_Controller")
  elseif GetGlobal("TL_CarouselLeader") == 1 then
    SetGlobal("TLMH_ZD2_CarouselPowered", GetGlobal("TLMH_ZD2_CarouselPowered") + 1)
    FireUser1("painterCam")
    TL_Stream13()
    SetRotatorMaxSpeed("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", 30)
    SetRotatorMaxSpeed("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 02", 30)
    StartRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", 250)
    StartRotateToPosition("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 02", 250)
    ForEachEntityInGroup(Unhide, "RotateSparks")
    MultiPosSoundStart("tl_minihub_zoned2_audio.Sound_Marker_Steam_Controller")
    AudioPostEventOn("tl_minihub_zoned2.TL_MiniHub_ZoneD2_Carousel 01", "Play_sfx_TC_GBT_Carousel_Rotate_Fast")
    FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 01", "D2_Rover_AwayWeGo")
    wait(0.5)
    ShakeCamera(4.5, 6, 0, 0.5, 0.002, 0.002)
    wait(5.5)
    ForEachEntityInGroup(Hide, "RotateSparks")
    MultiPosSoundStop("tl_minihub_zoned2_audio.Sound_Marker_Steam_Controller")
  end
end
YesSplit = L0_0
function L0_0()
  FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 01", "D2_Rover_LetMeKnow")
end
NoStay = L0_0
function L0_0()
  if GetGlobal("TLMH_ZD2_CarouselPowered") == 0 then
  elseif GetGlobal("TLMH_ZD2_CarouselPowered") == 1 then
    if GetSketchCount(GetPlayer(), "Sketch_TV") == 0 then
      FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 01", "D2_Rover_TVSell")
      wait(0.3)
    elseif 0 < GetSketchCount(GetPlayer(), "Sketch_TV") then
      FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 01", "D2_Rover_IfYouEverRunOut")
    end
  elseif GetGlobal("TLMH_ZD2_CarouselPowered") == 2 then
    FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 01", "D2_Rover_SeenEnough")
  elseif GetGlobal("TLMH_ZD2_CarouselPowered") == 3 then
    EndingAdvice()
  end
end
TVacquire = L0_0
function L0_0()
  SetGlobal("TL_GBT_BLOB_Defeated", 1)
  DoStinger("Stinger_Success", 5)
end
BlobDefeated = L0_0
function L0_0()
  SetGlobal("TL_GBT_BLOB_Defeated", 2)
  DoStinger("Stinger_Success", 5)
end
BlobFriended = L0_0
function L0_0()
  if GetGlobal("D2_Rover_AwayWeGo_Played") == 1 then
    FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 01", "D2_Rover_RideComplete")
  end
end
EndingAdvice = L0_0
function L0_0()
  FireSequence("tl_minihub_zoned2_story.ConversationalTrigger 02", "GP_GoofyTorso")
end
GoofyPartDiag = L0_0
function L0_0()
  DestroyEntity("TL_MH_ZoneD2_TVHint")
end
TL_MiniHub_ZoneD2_DestroyTVHint = L0_0
function L0_0()
  local L0_4, L1_5
  TL_CarouselTurn2 = L0_4
  L0_4 = nil
  TL_CarouselTurn4 = L0_4
  L0_4 = nil
  MisterRoverIntro = L0_4
  L0_4 = nil
  Leader = L0_4
  L0_4 = nil
  NoStay = L0_4
  L0_4 = nil
  BlobDefeated = L0_4
  L0_4 = nil
  TL_ZoneD2_SaveCheckpoint = L0_4
  L0_4 = nil
  DestroySlobber = L0_4
  L0_4 = nil
  YesSplit = L0_4
  L0_4 = nil
  TL_CarouselTurn3 = L0_4
  L0_4 = nil
  MickeyTeleportSetup = L0_4
  L0_4 = nil
  EndingAdvice = L0_4
  L0_4 = nil
  BlobFriended = L0_4
  L0_4 = nil
  TVacquire = L0_4
  L0_4 = nil
  GoofyPartDiag = L0_4
  L0_4 = nil
  TL_CarouselTurn1 = L0_4
  L0_4 = nil
  InteriorStream = L0_4
  L0_4 = nil
  Wastelander = L0_4
  L0_4 = nil
  Cleanup_TL_MiniHub_ZoneD2 = L0_4
end
Cleanup_TL_MiniHub_ZoneD2 = L0_0
