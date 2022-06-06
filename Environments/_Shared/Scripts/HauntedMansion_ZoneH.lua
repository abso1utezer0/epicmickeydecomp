HM_BooksFound = 0
HM_BooksPainted = 0
HM_BooksHelp = 0
HM_BooksThinned = 0
HM_TalkedToLeota = 0
HM_SkullsFixed = 0
AudioPostEventOn(GetPlayer(), "Play_sfx_Amb_HM_Haunted")
HM_SpattersFriend = 0
HM_SpattersKilled = 0
HM_Sweeper01 = 0
HM_Sweeper02 = 0
HM_Sweeper03 = 0
HM_Sweeper04 = 0
HM_SpattersLeft = 0
HM_BooksObjStart = 0
HM_Library_LeotaSave = 0
function HM_ZoneH_SaveCheckpoint()
  SaveCheckpoint(GetPlayer(), "HM_LibraryLoadCheckpoint", "hauntedmansion_zoneh.LibraryTeleportMarker 01")
end
function HM_IntoLibraryPortal()
  SetMap(GetPlayer(), "MAP_HM_ZONEH", "GAME")
  HM_Library_CamDefault()
  HM_ZoneH_SaveCheckpoint()
  StartTrackingCurrentLevelForScoring("HM_Library")
end
function HM_Library_Exit()
  EndTrackingCurrentLevelForScoring("HM_Library")
  PauseAllAI(GetPlayer())
end
function HM_Library_CamDefault()
  SetDefaultCameraValues(5, 5, 0)
  SetTravelCameraValues(7.5, 25, -20)
end
function HM_LeonaSaveTrigger()
  local L1_0
  L1_0 = 1
  HM_Library_LeotaSave = L1_0
end
function HM_LeotaSave()
  if HM_Library_LeotaSave == 1 then
    SaveCheckpoint(GetPlayer(), "HM_LibraryLoadCheckpoint", "hauntedmansion_zoneh.LibraryTeleportMarker 01")
    HM_Library_LeotaSave = 0
  end
end
function HM_LibraryLoadCheckpoint()
  HM_Library_CamDefault()
  StartTrackingCurrentLevelForScoring("HM_Library")
  if GetGlobal("HM_Library_TalkToLeona") == 0 then
    ForEachEntityInGroup(Disable, "LeonaIntroTriggers")
  elseif GetGlobal("HM_Library_TalkToLeona") == 1 then
    HM_TalkedToLeota = 1
  end
  if GetGlobal("HM_Library_TalkToLeona") == 1 and GetGlobal("HM_Library_SkullsQuest") == 0 then
    EnableGuardianHint("hauntedmansion_zoneh_dynamic.PlayerHintMarkersSkull01")
    EnableGuardianHint("hauntedmansion_zoneh_dynamic.PlayerHintMarkersSkull03")
    EnableGuardianHint("hauntedmansion_zoneh_dynamic.PlayerHintMarkersBehindTheScenes")
  end
  if 0 < GetGlobal("HM_Library_SkullsQuest") then
    HM_SkullsFixed = 3
    ForEachEntityInGroup(DestroyEntity, "hauntedmansion_zoneh.NOS_HM_Skull01")
    ForEachEntityInGroup(DestroyEntity, "hauntedmansion_zoneh.NOS_HM_Skull02_A1")
    ForEachEntityInGroup(DestroyEntity, "hauntedmansion_zoneh.NOS_HM_Skull03_A1")
    HM_StopLower = 1
    ForEachEntityInGroup(DestroyEntity, "LowerBookcaseCameraTriggers")
    HM_PushStop = 1
    TimerDisable("hauntedmansion_zoneh.PushLogicTimer 01")
    Unhide("hauntedmansion_zoneh.RotatingDoorTrigger 01")
    Unhide("hauntedmansion_zoneh.RotatingDoorTrigger 02")
    Disable("hauntedmansion_zoneh.CameraTrigger 03")
    ForEachEntityInGroup(DestroyEntity, "RightSideCameras")
    HM_Skull03_Fixed = 1
    ForEachEntityInGroup(Hide, "WaveCam_01")
    AnimGBSequence("hauntedmansion_zoneh.NOS_HM_ZoneH_Bookcase02_Extras 01", "FormStairs1")
  end
  if GetGlobal("HM_Library_BookQuestComplete") == 0 then
    SetGlobal("HM_Library_HowManyBooks", 0, true)
  elseif 0 < GetGlobal("HM_Library_BookQuestComplete") then
    ForEachEntityInGroup(DestroyEntity, "LibraryBook")
  end
  if GetGlobal("HM_ZoneH_PaintingPuzzleComplete") == 1 then
    Enable("hauntedmansion_zoneh.NOS_HM_ZoneH_Painting01_Inert")
    StartRotateToPosition("hauntedmansion_zoneh.NOS_HM_ZoneH_Painting01_Inert", -90)
    Enable("hauntedmansion_zoneh.NOS_HM_ZoneH_Painting03_Inert")
    StartRotateToPosition("hauntedmansion_zoneh.NOS_HM_ZoneH_Painting03_Inert", -135)
    HM_Painting03Lock = 1
    DisableGlint("hauntedmansion_zoneh.NOS_HM_ZoneH_Painting03_Gear")
    HM_Painting01Lock = 1
    DisableGlint("hauntedmansion_zoneh.NOS_HM_ZoneH_Painting01_Gear")
    ForcePainted("hauntedmansion_zoneh_static.NOS_HM_ZoneH_Painting02_Toon")
    ForcePainted("hauntedmansion_zoneh_static.NOS_HM_ZoneH_Painting04_Toon")
    ForcePainted("hauntedmansion_zoneh_static.NOS_HM_ZoneH_Painting03_Toon")
    ForcePainted("hauntedmansion_zoneh_static.NOS_HM_ZoneH_Painting01_Toon")
  elseif GetGlobal("HM_ZoneH_PaintingPuzzleComplete") == 0 then
    SetGlobal("HM_Library_PaintingCount", 0, true)
    SetGlobal("HM_Gear01Rotate", 0)
    SetGlobal("HM_Paint01Rotate", 0)
    SetGlobal("HM_Paint01Set", 0)
    SetGlobal("HM_Gear03Rotate", 0)
    SetGlobal("HM_Paint03Rotate", 0)
    SetGlobal("HM_Paint03Set", 0)
  end
  if GetGlobal("HM_LibrarySolved") == 1 then
    SetSplineFollowerInitialSpeed("hauntedmansion_zoneh.NOS_HM_ZoneH_Escher_Door", 1)
    AudioPostEventOn("hauntedmansion_zoneh.NOS_HM_ZoneH_Escher_Door", "Play_sfx_HM_Exit_Door")
    if GetGlobal("HM_Library_SlobberState") == 1 then
      ForceSpawn("hauntedmansion_zoneh.BlobSpawner 01", 1)
    end
  end
  HM_LeonaQuestsDone()
  if GetGlobal("MarbleBustKilled_03") == 1 then
    DestroyEntity("MarbleBust03")
  end
  if GetGlobal("MarbleBustKilled_04") == 1 then
    DestroyEntity("MarbleBust04")
  end
  if GetGlobal("MarbleBustKilled_05") == 1 then
    DestroyEntity("MarbleBust05")
  end
end
function HM_Leona_GiveQuests()
  ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_Leona_GiveQuests")
  if HM_Skull01_Fixed == 0 then
    EnableGuardianHint("hauntedmansion_zoneh_dynamic.PlayerHintMarkersSkull01")
  end
  EnableGuardianHint("hauntedmansion_zoneh_dynamic.PlayerHintMarkersSkull03")
  EnableGuardianHint("hauntedmansion_zoneh_dynamic.PlayerHintMarkersBehindTheScenes")
end
function HM_Leona_GusFirstHint()
  if GetGlobal("HM_Library_TalkToLeona") == 0 then
    ForceSequence("hauntedmansion_zoneh.ConvoMarkerGus", "Library_Intro")
    ForEachEntityInGroup(Disable, "LeonaIntroTriggers")
  end
end
function HM_LeonaCamsActivate()
  ForEachEntityInGroup(Enable, "LeonaIntroTriggers")
end
function HM_BookPainted()
  AudioPostEventOn(GetPlayer(), "Play_sfx_Pickup_Book")
  if HM_BooksHelp == 0 then
    HM_BooksHelp = 1
    ForceSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_BookPainted_Gus")
  end
end
function HM_TreasureMurderWeapon()
  SetGlobal("MS_murderweaponfound", 1)
  if GetGlobal("HM_HatchetQuestFromHorace") == 1 then
    FireSequence("hauntedmansion_zoneh.MurderWeaponMarker", "GP_MurderWeapon")
  else
    FireSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_Library_HatchetQuestion")
  end
end
function HM_MurderWeaponFollowup()
  FireSequence("hauntedmansion_zoneh.MurderWeaponMarker", "GP_MurderWeapon")
end
function HM_PickupBook(A0_1, A1_2)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Pickup_MiniQuestItem")
  SetGlobal("HM_Library_HowManyBooks", GetGlobal("HM_Library_HowManyBooks") + 1)
  DestroyEntity(A0_1)
  HM_BooksFound = HM_BooksFound + 1
  HM_BooksPainted = HM_BooksPainted + 1
  if HM_BooksPainted == 6 then
    if A1_2 == "0" then
      ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_BookPaintedAll")
    elseif A1_2 == "1" then
      SetGlobal("HM_Library_BookQuestComplete", 1)
    end
  elseif HM_BooksFound == 6 then
    if A1_2 == "0" then
      ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_Books_AllFound")
    elseif A1_2 == "1" then
      ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_Leona_ExpireBook")
    end
  elseif HM_BooksPainted == 1 and A1_2 == "0" then
    ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_BookPainted01")
  end
end
function HM_Jumbo_CamReturn()
  StartFadeOut(0.8)
  wait(0.7)
  ReleaseCamera(CAMERA_LERP_TRANSITION, 0)
  wait(0.1)
  StartFadeIn(0)
end
function HM_GremlinGetBooks()
  SetGlobal("HM_Library_JumboSaved", 1)
  SetGlobal("HM_Library_HowManyBooks", 6)
  HM_BooksPainted = HM_BooksPainted + (6 - HM_BooksFound)
  SetGlobal("HM_Library_GremlinConvoExit", HM_BooksPainted)
  HM_BooksFound = 6
  ForEachEntityInGroup(DestroyEntity, "LibraryBook")
  ForEachEntityInGroup(DestroyEntity, "NOS_HM_BookBird_Pickup")
end
function HM_GremlinCleanupWrench(A0_3)
  local L1_4
  L1_4 = TeleportGremlinOut
  L1_4(A0_3)
  L1_4 = GetChildEntityByName
  L1_4 = L1_4(A0_3, "GremlinWrench")
  Hide(L1_4)
end
function HM_FlyingBook_Killed(A0_5)
  AudioPostEventOn(GetPlayer(), "Play_sfx_Pickup_Book")
  IncrementCollectibleCount("Book")
  SetGlobal("HM_Library_HowManyBooks", GetGlobal("HM_Library_HowManyBooks") + 1)
  HM_BooksFound = HM_BooksFound + 1
  HM_BooksThinned = HM_BooksThinned + 1
  if HM_BooksThinned == 1 then
    ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_BookThinned01")
  elseif HM_BooksFound == 6 then
    ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_Books_AllFound")
  elseif HM_BooksThinned == 6 then
    ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_BookThinnedAll")
  end
  DestroyEntity(A0_5)
end
function HM_FireWaitBarkSkulls()
  FireThread(HM_WaitBarkSkulls)
end
function HM_WaitBarkSkulls()
  wait(2)
  HM_BarkSkulls()
end
function HM_BarkSkulls()
  if HM_SkullsFixed == 1 then
    ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_Leota_Skulls02")
  elseif HM_SkullsFixed == 2 then
    ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_Leota_Skulls03")
  elseif HM_SkullsFixed == 3 then
    ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_Leota_AllSkulls")
  end
end
HM_Skull01_Fixed = 0
function HM_UseSkull_01()
  if GetGlobal("HM_Library_SkullsQuest") == 0 then
    AnimGBSequence("hauntedmansion_zoneh_dynamic.LM_Skull_LightRays 01", "on")
    HM_SkullsFixed = HM_SkullsFixed + 1
    HM_Skull01_Fixed = 1
    DisableGuardianHint("hauntedmansion_zoneh_dynamic.PlayerHintMarkersSkull01")
    if HM_SkullsFixed == 3 then
      AudioPostEventOn("hauntedmansion_zoneh.NOS_HM_Skull01_A1", "Play_sfx_HM_Paint_Skull_Final")
      AudioPostEventOn(GetPlayer(), "Play_sfx_Amb_HM_UnHaunted")
      SetGlobal("HM_Library_SkullsQuest", 1)
    else
      AudioPostEventOn("hauntedmansion_zoneh.NOS_HM_Skull01_A1", "Play_sfx_HM_Paint_Skull")
    end
    ForceSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_Library_FixSkull01")
    wait(1.2)
    ForEachEntityInGroup(SetPropertyBool, "LowerBookcasesCameraToggle", "Allow Look Through", false, 0)
  end
end
function HM_LibraryHitBrakesLower()
  local L1_6
  L1_6 = 1
  HM_StopLower = L1_6
end
function HM_DisableLowerCameras()
  ForEachEntityInGroup(Disable, "LowerBookcaseCameraTriggers")
  ClearAllCameraAttributesTimed(1.5)
  wait(1.5)
  ForEachEntityInGroup(DestroyEntity, "LowerBookcaseCameraTriggers")
end
function HM_Skull01Check()
  HM_ReleaseCamRestricted()
  if GetGlobal("HM_Library_TalkToLeona") == 1 then
    ShowHud()
    FireThread(HM_DisableLowerCameras)
    HM_BarkSkulls()
  elseif GetGlobal("HM_Library_TalkToLeona") == 0 then
    FireThread(HM_DisableLowerCameras)
    ForceSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_Library_FixSkull01_NoLeota")
  end
end
HM_StopLower = 0
function HM_LowerCheck(A0_7, A1_8)
  if HM_StopLower == 1 then
    SetSplineFollowerInitialSpeed(A0_7, 0)
    if A1_8 == "1" then
      Unhide("hauntedmansion_zoneh_dynamic.LowerGhost01_Ribbon 01")
      SetSplineFollowerInitialSpeed("hauntedmansion_zoneh_dynamic.LowerGhost01_Ribbon 01", 9)
    elseif A1_8 == "2" then
      Unhide("hauntedmansion_zoneh_dynamic.LowerGhost02_Ribbon 01")
      SetSplineFollowerInitialSpeed("hauntedmansion_zoneh_dynamic.LowerGhost02_Ribbon 01", 9)
    elseif A1_8 == "3" then
      Unhide("hauntedmansion_zoneh_dynamic.LowerGhost03_Ribbon 01")
      SetSplineFollowerInitialSpeed("hauntedmansion_zoneh_dynamic.LowerGhost03_Ribbon 01", 9)
    elseif A1_8 == "4" then
      Unhide("hauntedmansion_zoneh_dynamic.LowerGhost04_Ribbon 01")
      SetSplineFollowerInitialSpeed("hauntedmansion_zoneh_dynamic.LowerGhost04_Ribbon 01", 9)
    elseif A1_8 == "5" then
      Unhide("hauntedmansion_zoneh_dynamic.LowerGhost05_Ribbon 01")
      SetSplineFollowerInitialSpeed("hauntedmansion_zoneh_dynamic.LowerGhost05_Ribbon 01", 9)
    elseif A1_8 == "6" then
      Unhide("hauntedmansion_zoneh_dynamic.LowerGhost06_Ribbon 01")
      SetSplineFollowerInitialSpeed("hauntedmansion_zoneh_dynamic.LowerGhost06_Ribbon 01", 9)
    end
  end
end
function HM_StartBookcase(A0_9)
  if HM_StopLower == 0 then
    SetSplineFollowerInitialSpeed(A0_9, 1)
  end
end
function HM_CrystalBallIntro()
  AudioPostEventOn(GetPlayer(), "Play_sfx_Amb_HM_Library_SpiritEnergy")
  AudioPostEventOn(GetPlayer(), "Play_sfx_Amb_HM_Library_SpiritRoom")
  HM_TalkedToLeota = 1
  AudioPostEventOn(GetPlayer(), "Play_sfx_Amb_HM_Library")
  AudioPostEventOn(GetPlayer(), "Play_sfx_Amb_HM_Library_MainRoom")
end
function HM_CrystalBall_Objectives()
  ObjectiveNew(GetPlayer(), "spatter", 4)
end
function HM_CrystalBallIntroGhost()
  if GetGlobal("NO_booktoghost") == 1 then
    ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_Leota_C01_Branch01")
  elseif GetGlobal("NO_booktoghost") == 0 then
    if GetGlobal("NO_bookget") == 1 then
      ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_Leota_C01_Branch02")
    elseif GetGlobal("NO_bookget") == 0 then
      ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_Leota_C01_Branch03")
    end
  end
end
function HM_LeotaBookQuest()
  if HM_BooksFound > 5 then
    ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_Leota_Chat06")
  elseif HM_BooksFound < 6 then
    ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_Leota_Chat04")
  end
end
function HM_OpenLibraryExit()
  ForceSequence("hauntedmansion_zoneh.MadameLeota 01", "HM_Leota_OpenExit")
end
function HM_SkullRevealIntro()
  HM_PushStop = 0
  wait(0.1)
  RelayTrigger("hauntedmansion_zoneh.PushStartupRelay 01")
  wait(1)
end
HM_PushStop = 1
function HM_SpinAttack_Painting01(A0_10, A1_11)
  if DamageEvent_HasStimulusType(A1_11, ST_SPIN) then
    FireSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_Library_FirstPaintingSpin")
  end
end
function HM_PushCheck(A0_12, A1_13)
  if HM_PushStop == 1 then
    SetSplineFollowerInitialSpeed(A0_12, 0)
    if A1_13 == "5" then
      Unhide("hauntedmansion_zoneh_dynamic.RightGhost05_Ribbon 01")
      SetSplineFollowerInitialSpeed("hauntedmansion_zoneh_dynamic.RightGhost05_Ribbon 01", 7)
    elseif A1_13 == "6" then
      Unhide("hauntedmansion_zoneh_dynamic.RightGhost06_Ribbon 01")
      SetSplineFollowerInitialSpeed("hauntedmansion_zoneh_dynamic.RightGhost06_Ribbon 01", 6)
    elseif A1_13 == "7" then
      Unhide("hauntedmansion_zoneh_dynamic.RightGhost07_Ribbon 01")
      SetSplineFollowerInitialSpeed("hauntedmansion_zoneh_dynamic.RightGhost07_Ribbon 01", 4)
    end
  end
end
function HM_UseSkull_02()
  if GetGlobal("HM_Library_SkullsQuest") == 0 then
    AnimGBSequence("hauntedmansion_zoneh_dynamic.LM_Skull_LightRays 02", "on")
    HM_SkullsFixed = HM_SkullsFixed + 1
    DisableGuardianHint("hauntedmansion_zoneh_dynamic.PlayerHintMarkersSkull02")
    ForceSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_Library_FixSkull02")
    if HM_SkullsFixed == 3 then
      AudioPostEventOn("hauntedmansion_zoneh.NOS_HM_Skull02_A1", "Play_sfx_HM_Paint_Skull_Final")
      AudioPostEventOn(GetPlayer(), "Play_sfx_Amb_HM_UnHaunted")
      SetGlobal("HM_Library_SkullsQuest", 1)
    else
      AudioPostEventOn("hauntedmansion_zoneh.NOS_HM_Skull02_A1", "Play_sfx_HM_Paint_Skull")
    end
    TimerDisable("hauntedmansion_zoneh.PushLogicTimer 01")
    Unhide("hauntedmansion_zoneh.RotatingDoorTrigger 01")
    Unhide("hauntedmansion_zoneh.RotatingDoorTrigger 02")
    Disable("hauntedmansion_zoneh.CameraTrigger 03")
    ForEachEntityInGroup(DestroyEntity, "RightSideCameras")
    wait(2)
    HM_PushStop = 1
  end
end
HM_RotatingDoorFlip = 0
function HM_Skull02_Action()
  SetParentEntity("hauntedmansion_zoneh.NOS_HM_ZoneH_BookcaseParent 01", "hauntedmansion_zoneh.NOS_HM_ZoneH_RevolvingDoor 01")
  AnimGBSequence("hauntedmansion_zoneh.NOS_HM_ZoneH_RevolvingDoor 01", "Turn")
  Hide("hauntedmansion_zoneh.NOS_HM_ZoneH_BookcasePush 01")
end
function HM_RotateDoorLeft()
  RestrictCutSceneInput()
  wait(0.5)
  SetCameraAttributes("hauntedmansion_zoneh.RotatingDoorCameraMarker 01")
  if HM_RotatingDoorFlip == 0 then
    HM_RotatingDoorFlip = 1
    AnimGBSequence("hauntedmansion_zoneh.NOS_HM_ZoneH_RevolvingDoor 01", "TurnBack")
  elseif HM_RotatingDoorFlip == 1 then
    HM_RotatingDoorFlip = 0
    AnimGBSequence("hauntedmansion_zoneh.NOS_HM_ZoneH_RevolvingDoor 01", "Turn")
  end
  wait(1.5)
  SetCameraAttributes("hauntedmansion_zoneh.RotatingDoorCameraMarker 02")
  wait(1.5)
  ClearAllCameraAttributesTimedSD(GetPlayer(), 2)
  UnrestrictCutSceneInput()
end
function HM_RotateDoorRght()
  RestrictCutSceneInput()
  wait(0.5)
  SetCameraAttributes("hauntedmansion_zoneh.RotatingDoorCameraMarker 02")
  if HM_RotatingDoorFlip == 0 then
    HM_RotatingDoorFlip = 1
    AnimGBSequence("hauntedmansion_zoneh.NOS_HM_ZoneH_RevolvingDoor 01", "TurnBack")
  elseif HM_RotatingDoorFlip == 1 then
    HM_RotatingDoorFlip = 0
    AnimGBSequence("hauntedmansion_zoneh.NOS_HM_ZoneH_RevolvingDoor 01", "Turn")
  end
  wait(1.5)
  SetCameraAttributes("hauntedmansion_zoneh.RotatingDoorCameraMarker 01")
  wait(1.5)
  ClearAllCameraAttributesTimedSD(GetPlayer(), 2)
  UnrestrictCutSceneInput()
end
HM_StopWave = 0
function HM_WaveCheck(A0_14)
  if HM_StopWave == 1 then
    SetSplineFollowerInitialSpeed(A0_14, 0)
  end
end
function HM_ShutdownBookWave()
  GrabCamera("hauntedmansion_zoneh.WaveStepCamera 02", nil, CAMERA_LERP_TRANSITION, 8)
  HM_StopWave = 1
end
HM_Skull03_Fixed = 0
function HM_UseSkull_03()
  if GetGlobal("HM_Library_SkullsQuest") == 0 then
    HM_Skull03_Fixed = 1
    TimerStop()
    AnimGBSequence("hauntedmansion_zoneh_dynamic.LM_Skull_LightRays 03", "on")
    ForceSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_Library_FixSkull03")
    HM_SkullsFixed = HM_SkullsFixed + 1
    DisableGuardianHint("hauntedmansion_zoneh_dynamic.PlayerHintMarkersSkull03")
    if HM_SkullsFixed == 3 then
      SetGlobal("HM_Library_SkullsQuest", 1)
      AudioPostEventOn("hauntedmansion_zoneh.NOS_HM_Skull03_A1", "Play_sfx_HM_Paint_Skull_Final")
      AudioPostEventOn(GetPlayer(), "Play_sfx_Amb_HM_UnHaunted")
    else
      AudioPostEventOn("hauntedmansion_zoneh.NOS_HM_Skull03_A1", "Play_sfx_HM_Paint_Skull")
    end
  end
end
function HM_LeftSkullGhosts()
  Unhide("hauntedmansion_zoneh_dynamic.LeftGhost03_Ribbon 01")
  SetSplineFollowerInitialSpeed("hauntedmansion_zoneh_dynamic.LeftGhost03_Ribbon 01", 6)
  wait(0.5)
  Unhide("hauntedmansion_zoneh_dynamic.LeftGhost02_Ribbon 01")
  SetSplineFollowerInitialSpeed("hauntedmansion_zoneh_dynamic.LeftGhost02_Ribbon 01", 6)
  Unhide("hauntedmansion_zoneh_dynamic.LeftGhost01_Ribbon 01")
  SetSplineFollowerInitialSpeed("hauntedmansion_zoneh_dynamic.LeftGhost01_Ribbon 01", 6)
end
function HM_ExposeSkull_03()
  StartRotateToPosition("hauntedmansion_zoneh.NOS_HM_ZoneH_RevolvingDoor 02", 180)
  SetRotatorMaxSpeed("hauntedmansion_zoneh.NOS_HM_ZoneH_RevolvingDoor 02", 60)
  AudioPostEventOn("hauntedmansion_zoneh_audio.Sound_Marker_RotateBookCase", "Play_sfx_HM_Rotating_BookCase")
  wait(1)
  GrabCamera("hauntedmansion_zoneh.WaveStepCamera 03", nil, CAMERA_LERP_TRANSITION, 0.5)
end
function HM_Skull03_IntroTimer()
  HM_Skull03_ButtonReset = 1
  TimerStart(10.9, 5, 2)
  wait(0.8)
  TimerPause()
end
HM_Skull03_ButtonIntro = 0
HM_Skull03_ButtonReset = 0
function HM_Skull03_ButtonOn()
  if HM_Skull03_Fixed == 0 then
    if HM_Skull03_ButtonIntro == 1 then
      if HM_Skull03_ButtonReset == 0 then
        StartRotateToPosition("hauntedmansion_zoneh.NOS_HM_ZoneH_RevolvingDoor 02", 180)
        SetRotatorMaxSpeed("hauntedmansion_zoneh.NOS_HM_ZoneH_RevolvingDoor 02", 60)
        AudioPostEventOn("hauntedmansion_zoneh_audio.Sound_Marker_RotateBookCase", "Play_sfx_HM_Rotating_BookCase")
        HM_Skull03_ButtonReset = 1
        TimerStart(10.9, 5, 2)
        wait(0.8)
        TimerPause()
      elseif HM_Skull03_ButtonReset == 1 then
        TimerSetTime(10.9)
        wait(0.8)
        TimerPause()
        HM_BreakTimer01 = 1
      end
    elseif HM_Skull03_ButtonIntro == 0 then
      HM_Skull03_ButtonIntro = 1
      ForceSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_Library_ShutdownBooks")
    end
  end
end
HM_BreakTimer01 = 0
function HM_Skull03_ButtonOff()
  local L0_15
  L0_15 = HM_Skull03_Fixed
  if L0_15 == 0 then
    L0_15 = TimerUnpause
    L0_15()
    L0_15 = 0
    HM_BreakTimer01 = L0_15
    L0_15 = "Ticking"
    while L0_15 == "Ticking" and HM_BreakTimer01 == 0 do
      wait(0.3)
      L0_15 = TimerGetState()
    end
    if HM_Skull03_Fixed == 0 and HM_BreakTimer01 == 0 then
      StartRotateToPosition("hauntedmansion_zoneh.NOS_HM_ZoneH_RevolvingDoor 02", 0)
      AudioPostEventOn("hauntedmansion_zoneh_audio.Sound_Marker_RotateBookCase", "Play_sfx_HM_Rotating_BookCase")
      FireThread(HM_GusBarkSkull03_Reset)
      HM_Skull03_ButtonReset = 0
    end
  end
end
function HM_GusBarkSkull03_Reset()
  wait(2.5)
  if HM_Skull03_Fixed == 0 then
    ForceSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_Button01_Reset")
  end
end
function HM_Skull03_Hide()
  StartRotateToPosition("hauntedmansion_zoneh.NOS_HM_ZoneH_RevolvingDoor 02", 0)
  AudioPostEventOn("hauntedmansion_zoneh_audio.Sound_Marker_RotateBookCase", "Play_sfx_HM_Rotating_BookCase")
end
HM_StairTriggerOn = 0
function HM_StepButtonOn()
  SetCameraAttributes("hauntedmansion_zoneh.ButtonRoomCameraMarker(CameraOverride) 01")
  if HM_StairTriggerOn == 0 then
    RestrictCutSceneInput()
    wait(1.7)
    HM_StairTriggerOn = 1
    AnimGBSequence("hauntedmansion_zoneh.NOS_HM_ZoneH_Bookcase02_Extras 01", "FormStairs2")
    TimerStart(6.9, 4, 2)
    wait(0.8)
    TimerPause()
    wait(0.5)
    UnrestrictCutSceneInput()
  elseif HM_StairTriggerOn == 1 then
    TimerSetTime(6.9)
    wait(0.8)
    TimerPause()
  end
end
function HM_StepButton()
  local L0_16
  L0_16 = TimerUnpause
  L0_16()
  L0_16 = "Ticking"
  while L0_16 == "Ticking" do
    wait(0.3)
    L0_16 = TimerGetState()
  end
  AnimGBSequence("hauntedmansion_zoneh.NOS_HM_ZoneH_Bookcase02_Extras 01", "Stairs2ToStairs1")
  HM_StairTriggerOn = 0
end
HM_Painting03 = 1
function HM_Painting03_on()
  HM_Painting03 = 1
  if HM_Painting03Lock == 1 and GetGlobal("HM_ZoneH_PaintingPuzzleComplete") == 0 then
    HM_LibraryPaintingBarks()
  end
end
function HM_Painting03_off()
  HM_Painting03 = 0
  if HM_Painting03Lock == 1 and GetGlobal("HM_ZoneH_PaintingPuzzleComplete") == 0 then
    HM_LibraryPaintingThinned()
  end
end
HM_Painting03Lock = 0
function HM_SpinPainting03(A0_17)
  if HM_Painting03Lock == 0 and HM_Painting03 == 0 then
    SetGlobal("HM_Gear03Rotate", GetGlobal("HM_Gear03Rotate") + 45)
    SetGlobal("HM_Paint03Rotate", GetGlobal("HM_Paint03Rotate") - 45)
    Enable(A0_17)
    Enable("hauntedmansion_zoneh.NOS_HM_ZoneH_Painting03_Inert")
    StartRotateToPosition(A0_17, GetGlobal("HM_Gear03Rotate"))
    StartRotateToPosition("hauntedmansion_zoneh.NOS_HM_ZoneH_Painting03_Inert", GetGlobal("HM_Paint03Rotate"))
    if GetGlobal("HM_Paint03Set") < 7 then
      SetGlobal("HM_Paint03Set", GetGlobal("HM_Paint03Set") + 1)
      AudioPostEventOn("hauntedmansion_zoneh_audio.Sound_Gear_Hallway", "Play_sfx_HM_Gear_Start")
    else
      SetGlobal("HM_Paint03Set", 0)
    end
    if GetGlobal("HM_Paint03Set") == 3 or GetGlobal("HM_Paint03Set") == 7 then
      DisableGlint(A0_17)
      HM_Painting03Lock = 1
      AudioPostEventOn("hauntedmansion_zoneh_audio.Sound_Gear_Hallway", "Play_sfx_HM_Gear_Stop")
    end
  end
end
HM_Painting01 = 1
function HM_Painting01_on()
  HM_Painting01 = 1
  if HM_Painting01Lock == 1 and GetGlobal("HM_ZoneH_PaintingPuzzleComplete") == 0 then
    HM_LibraryPaintingBarks()
  end
end
function HM_Painting01_off()
  HM_Painting01 = 0
  if HM_Painting01Lock == 1 and GetGlobal("HM_ZoneH_PaintingPuzzleComplete") == 0 then
    HM_LibraryPaintingThinned()
  end
end
HM_Painting01Lock = 0
function HM_SpinPainting01(A0_18)
  Print("***************************PAINTING GEAR STRUCK")
  if HM_Painting01Lock == 0 and HM_Painting01 == 0 then
    SetGlobal("HM_Gear01Rotate", GetGlobal("HM_Gear01Rotate") + 45)
    SetGlobal("HM_Paint01Rotate", GetGlobal("HM_Paint01Rotate") - 45)
    Enable(A0_18)
    Enable("hauntedmansion_zoneh.NOS_HM_ZoneH_Painting01_Inert")
    StartRotateToPosition(A0_18, GetGlobal("HM_Gear01Rotate"))
    StartRotateToPosition("hauntedmansion_zoneh.NOS_HM_ZoneH_Painting01_Inert", GetGlobal("HM_Paint01Rotate"))
    if GetGlobal("HM_Paint01Set") < 7 then
      SetGlobal("HM_Paint01Set", GetGlobal("HM_Paint01Set") + 1)
    else
      SetGlobal("HM_Paint01Set", 0)
    end
    if GetGlobal("HM_Paint01Set") == 2 or GetGlobal("HM_Paint01Set") == 6 then
      DisableGlint(A0_18)
      HM_Painting01Lock = 1
    end
  end
end
HM_PaintingHints = 0
function HM_LibraryPaintingBarks()
  if GetGlobal("HM_ZoneH_PaintingPuzzleComplete") == 0 then
    HM_PaintingHints = HM_PaintingHints + 1
    SetGlobal("HM_Library_PaintingCount", HM_PaintingHints)
    if HM_TalkedToLeota == 0 then
      FireSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_Library_PaintingNoQuest")
    elseif HM_TalkedToLeota == 1 then
      if HM_PaintingHints == 1 then
        ForceSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_Library_Painting00")
      elseif HM_PaintingHints == 2 then
        ForceSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_Library_Painting01")
      elseif HM_PaintingHints == 3 then
        ForceSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_Library_Painting02")
      elseif HM_PaintingHints == 4 then
        ForceSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_Library_Painting03")
        SetGlobal("HM_ZoneH_PaintingPuzzleComplete", 1)
        HM_ZoneH_SaveCheckpoint()
      end
    end
  end
end
function HM_LibraryPaintingThinned()
  HM_PaintingHints = HM_PaintingHints - 1
  SetGlobal("HM_Library_PaintingCount", HM_PaintingHints)
  SetGlobal("HM_ZoneH_PaintingPuzzleComplete", 0)
  ForceSequence("hauntedmansion_zoneh.ConvoMarkerGus", "HM_Library_PainingThinned")
end
function HM_UpperRoomCamOn()
  GrabCamera("hauntedmansion_zoneh.UpperRoomCamera 01", nil, CAMERA_LERP_TRANSITION, 0)
end
function HM_UpperRoomCamOff()
  ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
end
function HM_RescueGremlinLibrary()
  if GetGlobal("HM_Library_GremlinRescued") == 1 then
    if HM_BooksFound < 6 then
      HM_BooksPainted = HM_BooksPainted + (6 - HM_BooksFound)
      HM_BooksFound = 6
      ForceSequence("LibraryGremlin", "HM_Grem_HelpThank")
      RelayTrigger("hauntedmansion_zoneh.GremlinCleanupRelay")
    elseif HM_BooksFound == 6 then
      ForceSequence("LibraryGremlin", "HM_Grem_HelpThank_02")
    end
  elseif GetGlobal("HM_Library_GremlinRescued") == 0 then
    ForceSequence("LibraryGremlin", "HM_Grem_AskForHelp")
  end
end
function HM_ReleaseLibraryGremlin()
  SetVulnerability("LibraryGremlin", ST_THINNER, 1)
  Disable("hauntedmansion_zoneh.GremlinHelpTrigger 03")
  SetGlobal("HM_Library_GremlinRescued", 1)
end
function HM_SlobberDestroyed()
  SetGlobal("HM_Library_SlobberState", 2)
end
function HM_PickupDonaldLeg()
  SetGlobal("NO_donaldlegget", 1)
  SetGlobal("NO_donaldparts", GetGlobal("NO_donaldparts") + 1)
  SaveCheckpoint(GetPlayer(), "HM_LibraryLoadCheckpoint", "hauntedmansion_zoneh.LibraryTeleportMarker 01")
end
function HM_LeonaQuestsDone()
  if GetGlobal("HM_ZoneH_PaintingPuzzleComplete") == 2 and GetGlobal("HM_Library_BookQuestComplete") == 4 and GetGlobal("HM_LibrarySolved") == 1 then
    DisableAutoQuestGiver("hauntedmansion_zoneh.MadameLeota 01", true)
    SetIsQuestGiver("hauntedmansion_zoneh.MadameLeota 01", false)
  end
end
function HM_DisableBehindScenesMarker()
  DisableGuardianHint("hauntedmansion_zoneh_dynamic.PlayerHintMarkersBehindTheScenes")
  EnableGuardianHint("hauntedmansion_zoneh_dynamic.PlayerHintMarkersSkull02")
end
