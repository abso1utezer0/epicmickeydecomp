CameraBehavior = 0
CurrentPaint = 0
CurrentThinner = 0
PaintThreshold = 11
ThinnerThreshold = 11
ArmorLevel = 3
TowerLevel = 1
TowersDown = false
Phase = 1
ReflectiveShieldsOn = false
VALVE_REACTION_TIMER = 0.25
PLAY_VALVE_LOOP = true
InValveReaction = false
ValveFilled = false
OnPaintPath = false
OnThinnerPath = false
InitialPathStep = true
WatchingTV = false
TronBlack = vector4(0, 0, 0, 0)
TronGreen = vector4(0.0196, 0.851, 0.2863, 0)
TronRed = vector4(0.8275, 0.09412, 0.2314, 0)
TronBlue = vector4(0.0353, 0.4549, 0.9647, 0)
TronPurple = vector4(0.6863, 0.2706, 0.9765, 0)
TronOrange = vector4(1, 0.4, 0.102, 0)
TronWhite = vector4(1, 1, 1, 0)
TronWhiteAlpha = vector4(1, 1, 1, 1)
TronColor = TronGreen
NewTronColorIntensity = 0
CurrentTronColorIntensity = 0
FightStarted = 0
HeroicMickey = false
FightEnded = false
TronPete = "sm_tl_zoned.TronPete 01"
CenterPlatform = "sm_tl_zoned.StaticScriptableProp 05"
ActiveGameplayCamera = "sm_tl_zoned.Marker(CameraOverride) 04 GameplayLOW"
InLookDownCamera = false
SHIELD_ONE = "MCPReflectiveShield_One"
SHIELD_TWO = "MCPReflectiveShield_Two"
SHIELD_THREE = "MCPReflectiveShield_Three"
SHIELD_FOUR = "MCPReflectiveShield_Four"
SHIELD_FIVE = "MCPReflectiveShield_Five"
SHIELD_SIX = "MCPReflectiveShield_Six"
SHIELD_SEVEN = "MCPReflectiveShield_Seven"
SHIELD_EIGHT = "MCPReflectiveShield_Eight"
TowerPickupList = {
  {
    {
      "none",
      "none",
      "none",
      "none"
    },
    {
      "none",
      "none",
      "none",
      "none"
    },
    {
      "none",
      "none",
      "none",
      "none"
    }
  },
  {
    {
      "sm_tl_zoned.Ammo_PaintThinner 02_01",
      "sm_tl_zoned_gameplay.HealthSmall_Parentable 03",
      "sm_tl_zoned_gameplay.Ammo_Thinner 03",
      "sm_tl_zoned_gameplay.HealthSmall_Parentable 04"
    },
    {
      "sm_tl_zoned_gameplay.HealthSmall_Parentable 06",
      "sm_tl_zoned_gameplay.ETicket_E_Parentable 04",
      "sm_tl_zoned_gameplay.HealthSmall_Parentable 05",
      "sm_tl_zoned_gameplay.ETicket_E_Parentable 03"
    },
    {
      "sm_tl_zoned_gameplay.ETicket_E_Parentable 05",
      "sm_tl_zoned_gameplay.ETicket_E_Parentable 07",
      "sm_tl_zoned_gameplay.ETicket_E_Parentable 06",
      "sm_tl_zoned_gameplay.HealthLarge 01"
    }
  },
  {
    {
      "sm_tl_zoned_gameplay.Ammo_Paint 06",
      "sm_tl_zoned_gameplay.HealthSmall_Parentable 08",
      "sm_tl_zoned_gameplay.Ammo_Thinner 04",
      "sm_tl_zoned_gameplay.HealthSmall_Parentable 07"
    },
    {
      "sm_tl_zoned_gameplay.HealthSmall_Parentable 09",
      "sm_tl_zoned_gameplay.ETicket_E_Parentable 08",
      "sm_tl_zoned_gameplay.HealthSmall_Parentable 10",
      "sm_tl_zoned_gameplay.ETicket_E_Parentable 09"
    },
    {
      "sm_tl_zoned_gameplay.ETicket_E_Parentable 11",
      "sm_tl_zoned_gameplay.HealthLarge 03",
      "sm_tl_zoned_gameplay.ETicket_E_Parentable 10",
      "sm_tl_zoned_gameplay.HealthLarge 02"
    }
  }
}
TowerPickupEffects = {
  "sm_tl_zoned.Particle Pickup 4",
  "sm_tl_zoned.Particle Pickup 3",
  "sm_tl_zoned.Particle Pickup 2",
  "sm_tl_zoned.Particle Pickup 1"
}
CollectedPickups = {
  0,
  0,
  0,
  0
}
function TL_SM_ZoneD_SaveCheckpoint()
  SaveCheckpoint(GetPlayer(), "TL_SM_ZoneD_CheckpointLoad2", "SpaceMountainMickeyStart")
end
function TL_SM_ZoneD_SaveCheckpointStartFight()
  SaveCheckpoint(GetPlayer(), "TL_SM_ZoneD_CheckpointLoad", "SpaceMountainMickeyFightStart")
end
function TL_SM_ZoneD_SaveCheckpointEndFightPaint()
  SaveCheckpoint(GetPlayer(), "TL_SM_ZoneD_CheckpointLoadPaint", "SpaceMountainMickeyFightStart")
end
function TL_SM_ZoneD_SaveCheckpointEndFightThinner()
  SaveCheckpoint(GetPlayer(), "TL_SM_ZoneD_CheckpointLoadThinner", "SpaceMountainMickeyFightStart")
end
function TL_SM_ZoneD_CheckpointLoadPaint()
  FightEnded = true
  HeroicMickey = true
  EnableGuardianSystem()
  StartTrackingCurrentLevelForScoring("Tron_Fight")
  SetMap(nil, "MAP_TL_PETEBOSSROOF", "GAME")
  Hide("sm_tl_zoned.StaticProp 09")
  Unhide("sm_tl_zoned.StaticScriptableProp 05")
  ForEachEntityInGroup(Hide, "Runway")
  Enable("sm_tl_zoned_gameplay.Spawner 01")
  SetHealth(GetPlayer(), 5)
  TL_SM_ZoneD_EnableHitWall(nil, 0)
  ForEachEntityInGroup(Disable, "TronPlaneTriggers")
  Hide("sm_tl_zoned.TronPete 01")
  Enable("sm_tl_zoned.Trigger 10")
  SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride) 06 GameplayHIGH")
  AudioPostEventOn(GetPlayer(), "Play_music_tomorrowland")
  AudioSetState(GetPlayer(), "Music_State", "Exploration")
  AudioSetState(GetPlayer(), "Music_Exploration", "neutral")
  Enable("sm_tl_zoned.TriggerDamageVolume 01")
end
function TL_SM_ZoneD_CheckpointLoadThinner()
  HeroicMickey = false
  EnableGuardianSystem()
  StartTrackingCurrentLevelForScoring("Tron_Fight")
  SetMap(nil, "MAP_TL_PETEBOSSROOF", "GAME")
  Hide("sm_tl_zoned.StaticProp 09")
  Unhide("sm_tl_zoned.StaticScriptableProp 05")
  TL_SM_ZoneD_EnableHitWall(nil, 0)
  ForEachEntityInGroup(Hide, "Runway")
  Enable("sm_tl_zoned_gameplay.Spawner 01")
  SetHealth(GetPlayer(), 5)
  TL_SM_ZoneD_EndofFight()
  Hide("sm_tl_zoned.TronPete 01")
  Enable("sm_tl_zoned.Trigger 10")
  AudioPostEventOn(GetPlayer(), "Play_music_tomorrowland")
  AudioSetState(GetPlayer(), "Music_State", "Exploration")
  AudioSetState(GetPlayer(), "Music_Exploration", "neutral")
  Enable("sm_tl_zoned.TriggerDamageVolume 01")
end
function TL_SM_ZoneD_CheckpointLoad2()
  SetHealth(GetPlayer(), 5)
  EnableGuardianSystem()
  StartTrackingCurrentLevelForScoring("Tron_Fight")
end
function TL_SM_ZoneD_CheckpointLoad()
  if GetGlobal("TL_SM_ZoneD_SayHello_Played") == 0 then
    ForceSequence("sm_tl_zoned_gameplay.Marker(Conversation) Gus", "DefeatTronPete")
    SetHealth(GetPlayer(), 5)
    Hide("TronDisc_Pickup")
    Hide("sm_tl_zoned.DynamicScriptableProp 08")
    Hide("sm_tl_zoned.DynamicScriptableProp 07")
    Disable("sm_tl_zoned.Trigger 01")
    Disable("sm_tl_zoned.Trigger 06")
    Hide("sm_tl_zoned.DynamicScriptableProp 06")
    Hide("sm_tl_zoned.DynamicScriptableProp 05")
    Hide("sm_tl_zoned.Trigger 03")
    Hide("sm_tl_zoned.DynamicScriptableProp 01")
    Disable("sm_tl_zoned.Trigger 04")
    Disable("sm_tl_zoned.Trigger 05")
    Hide("sm_tl_zoned.DynamicScriptableProp 02")
    Disable("sm_tl_zoned.Trigger 07")
    Hide("sm_tl_zoned.DynamicScriptableProp 03")
    Disable("sm_tl_zoned.Trigger 08")
    Hide("sm_tl_zoned.DynamicScriptableProp 04")
    Disable("sm_tl_zoned_gameplay.PlaneTrigger 01")
    Disable("sm_tl_zoned_gameplay.PlaneTrigger 02")
    Disable("sm_tl_zoned_gameplay.PlaneTrigger 03")
    Enable("sm_tl_zoned.DynamicRotatorSplineFollower 02")
    Enable("sm_tl_zoned.DynamicRotatorSplineFollower 03")
    Enable("sm_tl_zoned.DynamicRotatorSplineFollower 04")
    Enable("sm_tl_zoned.DynamicRotatorSplineFollower 05")
    Enable("sm_tl_zoned_gameplay.Spawner 01")
    Hide(CenterPlatform)
    AnimEvent(TronPete, "EVENT_Idle_turnAround_startLoop")
    Unhide(TronPete)
    TL_SM_ZoneD_SetArmorLevel(TronPete, 0)
    TL_SM_ZoneD_ColorTron(TronPete)
    ForEachEntityInGroup(Enable, "TargettingTriggers")
    AnimEvent(TronPete, "EVENT_turnAround")
    AnimEvent(TronPete, "EVENT_GoToSleep")
    Enable("sm_tl_zoned.TriggerDamageVolume 01")
    SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride) 07 GameplayMID")
  else
    EnableGuardianSystem()
    StartTrackingCurrentLevelForScoring("Tron_Fight")
    TL_SM_ZoneD_EnableHitWall(nil, 1)
    SetHealth(GetPlayer(), 5)
    Hide("TronDisc_Pickup")
    Hide("sm_tl_zoned.DynamicScriptableProp 08")
    Hide("sm_tl_zoned.DynamicScriptableProp 07")
    Disable("sm_tl_zoned.Trigger 01")
    Disable("sm_tl_zoned.Trigger 06")
    Hide("sm_tl_zoned.DynamicScriptableProp 06")
    Hide("sm_tl_zoned.DynamicScriptableProp 05")
    Hide("sm_tl_zoned.Trigger 03")
    Hide("sm_tl_zoned.DynamicScriptableProp 01")
    Disable("sm_tl_zoned.Trigger 04")
    Disable("sm_tl_zoned.Trigger 05")
    Hide("sm_tl_zoned.DynamicScriptableProp 02")
    Disable("sm_tl_zoned.Trigger 07")
    Hide("sm_tl_zoned.DynamicScriptableProp 03")
    Disable("sm_tl_zoned.Trigger 08")
    Hide("sm_tl_zoned.DynamicScriptableProp 04")
    Disable("sm_tl_zoned_gameplay.PlaneTrigger 01")
    Disable("sm_tl_zoned_gameplay.PlaneTrigger 02")
    Disable("sm_tl_zoned_gameplay.PlaneTrigger 03")
    Enable("sm_tl_zoned.DynamicRotatorSplineFollower 02")
    Enable("sm_tl_zoned.DynamicRotatorSplineFollower 03")
    Enable("sm_tl_zoned.DynamicRotatorSplineFollower 04")
    Enable("sm_tl_zoned.DynamicRotatorSplineFollower 05")
    Enable("sm_tl_zoned_gameplay.Spawner 01")
    Hide(CenterPlatform)
    AnimEvent(TronPete, "EVENT_Idle_turnAround_startLoop")
    Unhide(TronPete)
    TL_SM_ZoneD_SetArmorLevel(TronPete, 0)
    TL_SM_ZoneD_ColorTron(TronPete)
    ForEachEntityInGroup(Enable, "TargettingTriggers")
    Enable("sm_tl_zoned.TriggerDamageVolume 01")
    ForEachEntityInGroup(Enable, "CamTriggers")
    AnimEvent(TronPete, "EVENT_WakeUp")
    AudioPostEventOn(GetPlayer(), "Play_music_tomorrowland_boss")
    AudioSetState(GetPlayer(), "Music_State", "Boss")
  end
end
function TL_SM_ZoneD_SmashMickey(A0_0)
  if math.abs((GetPosition(GetPlayer()) - GetPosition(TronPete)).x) > math.abs((GetPosition(GetPlayer()) - GetPosition(TronPete)).z) then
    if (GetPosition(GetPlayer()) - GetPosition(TronPete)).x > 0 then
      StimulusEntityWithAliasInEntityDirectionInRadius(TronPete, ST_KNOCKBACK, 1000, 0, GetPlayer(), "SmashTargetPositiveX", "")
    else
      StimulusEntityWithAliasInEntityDirectionInRadius(TronPete, ST_KNOCKBACK, 1000, 0, GetPlayer(), "SmashTargetNegativeX", "")
    end
  elseif (GetPosition(GetPlayer()) - GetPosition(TronPete)).z > 0 then
    StimulusEntityWithAliasInEntityDirectionInRadius(TronPete, ST_KNOCKBACK, 1000, 0, GetPlayer(), "SmashTargetPositiveZ", "")
  else
    StimulusEntityWithAliasInEntityDirectionInRadius(TronPete, ST_KNOCKBACK, 1000, 0, GetPlayer(), "SmashTargetNegativeZ", "")
  end
  Disable(A0_0)
end
function TL_SM_ZoneD_WakeUpTronPete(A0_1)
  AnimEvent(TronPete, "EVENT_WakeUp")
end
function TL_SM_ZoneD_TurnOnTV(A0_2)
  WatchingTV = true
end
function TL_SM_ZoneD_TurnOffTV(A0_3)
  WatchingTV = false
end
function TL_SM_ZoneD_DeRes(A0_4, A1_5)
  local L2_6, L3_7, L4_8, L5_9
  L2_6 = Unhide
  L3_7 = A0_4
  L2_6(L3_7)
  L2_6 = vector4
  L3_7 = 1
  L4_8 = 1
  L5_9 = 1
  L2_6 = L2_6(L3_7, L4_8, L5_9, 1)
  L3_7 = vector4
  L4_8 = 0.129
  L5_9 = 0.438
  L3_7 = L3_7(L4_8, L5_9, 0.637, 1)
  L4_8 = 0
  L5_9 = 0.0333
  SetR3MTColorReg(A0_4, 1, L3_7)
  while L4_8 < 1 do
    L2_6 = vector4(1, 1, 1, L4_8)
    SetR3MTConstReg(A0_4, 1, L2_6)
    wait(L5_9)
    L4_8 = L4_8 + A1_5 * 4
  end
  L2_6 = vector4(1, 1, 1, 1)
  SetR3MTConstReg(A0_4, 1, L2_6)
  L4_8 = 1
  while L4_8 > 0 do
    L3_7 = vector4(0.129, 0.438, 0.637, L4_8)
    SetR3MTColorReg(A0_4, 1, L3_7)
    wait(L5_9)
    L4_8 = L4_8 - A1_5
  end
  Hide(A0_4)
end
function TL_SM_ZoneD_ResIn(A0_10, A1_11)
  local L2_12, L3_13, L4_14, L5_15
  L2_12 = vector4
  L3_13 = 1
  L4_14 = 1
  L5_15 = 1
  L2_12 = L2_12(L3_13, L4_14, L5_15, 1)
  L3_13 = vector4
  L4_14 = 0.129
  L5_15 = 0.438
  L3_13 = L3_13(L4_14, L5_15, 0.637, 1)
  L4_14 = 0
  L5_15 = 0.0333
  Unhide(A0_10)
  SetR3MTConstReg(A0_10, 1, L2_12)
  while L4_14 < 1 do
    L3_13 = vector4(0.129, 0.438, 0.637, L4_14)
    SetR3MTColorReg(A0_10, 1, L3_13)
    wait(L5_15)
    L4_14 = L4_14 + A1_11
  end
  L3_13 = vector4(0.129, 0.438, 0.637, 1)
  SetR3MTColorReg(A0_10, 1, L3_13)
  L4_14 = 1
  while L4_14 > 0 do
    L2_12 = vector4(1, 1, 1, L4_14)
    SetR3MTConstReg(A0_10, 1, L2_12)
    wait(L5_15)
    L4_14 = L4_14 - A1_11 * 4
  end
  L2_12 = vector4(1, 1, 1, 0)
  SetR3MTConstReg(A0_10, 1, L2_12)
end
function TL_SM_ZoneD_OpenValve()
  local L0_16
  L0_16 = GetChildEntityByName
  L0_16 = L0_16(TronPete, "TronPete_BackValve")
  AnimGBReset(L0_16)
  AnimGBSequence(L0_16, "open_valve")
  wait(0.85)
  StartEmitters("sm_tl_zoned.ParticleScriptableWithParent 05")
  AnimGBSequence(L0_16, "open_rest")
end
function TL_SM_ZoneD_CloseValve()
  local L0_17
  L0_17 = GetChildEntityByName
  L0_17 = L0_17(TronPete, "TronPete_BackValve")
  AnimGBReset(L0_17)
  AnimGBSequence(L0_17, "close_valve")
  StopEmitters("sm_tl_zoned.ParticleScriptableWithParent 05")
  wait(0.45)
  AnimGBSequence(L0_17, "close_rest")
end
function TL_SM_ZoneD_ColorTron(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, L13_31, L14_32, L15_33, L16_34
  L1_19 = Phase
  if L1_19 == 1 then
    L1_19 = TronOrange
    TronColor = L1_19
  else
    L1_19 = Phase
    if L1_19 > 1 then
      L1_19 = OnThinnerPath
      if L1_19 then
        L1_19 = TronGreen
        TronColor = L1_19
      else
        L1_19 = OnPaintPath
        if L1_19 then
          L1_19 = TronBlue
          TronColor = L1_19
        end
      end
    end
  end
  L1_19 = GetChildEntityByName
  L2_20 = A0_18
  L3_21 = "TronPete_LeftShoulderA"
  L1_19 = L1_19(L2_20, L3_21)
  L2_20 = GetChildEntityByName
  L3_21 = A0_18
  L4_22 = "TronPete_LeftShoulderB"
  L2_20 = L2_20(L3_21, L4_22)
  L3_21 = GetChildEntityByName
  L4_22 = A0_18
  L5_23 = "TronPete_RightShoulderA"
  L3_21 = L3_21(L4_22, L5_23)
  L4_22 = GetChildEntityByName
  L5_23 = A0_18
  L6_24 = "TronPete_RightShoulderB"
  L4_22 = L4_22(L5_23, L6_24)
  L5_23 = GetChildEntityByName
  L6_24 = A0_18
  L7_25 = "TronPete_UpperBody"
  L5_23 = L5_23(L6_24, L7_25)
  L6_24 = GetChildEntityByName
  L7_25 = A0_18
  L8_26 = "TronPete_Belly"
  L6_24 = L6_24(L7_25, L8_26)
  L7_25 = GetChildEntityByName
  L8_26 = A0_18
  L9_27 = "TronPete_LeftLegPad"
  L7_25 = L7_25(L8_26, L9_27)
  L8_26 = GetChildEntityByName
  L9_27 = A0_18
  L10_28 = "TronPete_RightLegPad"
  L8_26 = L8_26(L9_27, L10_28)
  L9_27 = GetChildEntityByName
  L10_28 = A0_18
  L11_29 = "TronPete_LowerBack"
  L9_27 = L9_27(L10_28, L11_29)
  L10_28 = GetChildEntityByName
  L11_29 = A0_18
  L12_30 = "TronPete_Peg"
  L10_28 = L10_28(L11_29, L12_30)
  L11_29 = GetChildEntityByName
  L12_30 = A0_18
  L13_31 = "TronPete_ChinPad"
  L11_29 = L11_29(L12_30, L13_31)
  L12_30 = GetChildEntityByName
  L13_31 = A0_18
  L14_32 = "TronPete_Helmet"
  L12_30 = L12_30(L13_31, L14_32)
  L13_31 = GetChildEntityByName
  L14_32 = A0_18
  L15_33 = "TronPete_LeftGlove"
  L13_31 = L13_31(L14_32, L15_33)
  L14_32 = GetChildEntityByName
  L15_33 = A0_18
  L16_34 = "TronPete_LeftGloveB"
  L14_32 = L14_32(L15_33, L16_34)
  L15_33 = GetChildEntityByName
  L16_34 = A0_18
  L15_33 = L15_33(L16_34, "TronPete_RightGloveA")
  L16_34 = GetChildEntityByName
  L16_34 = L16_34(A0_18, "TronPete_RightGloveB")
  if Phase == 1 then
    CurrentTronColorIntensity = 0
    NewTronColorIntensity = 1
  elseif Phase == 2 then
    CurrentTronColorIntensity = 0
    NewTronColorIntensity = 0.333
  elseif Phase == 3 then
    CurrentTronColorIntensity = 0.333
    NewTronColorIntensity = 0.667
  elseif Phase == 4 then
    CurrentTronColorIntensity = 0.667
    NewTronColorIntensity = 1
  end
  if CurrentTronColorIntensity >= NewTronColorIntensity then
    SetR3MTColorReg(A0_18, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L1_19, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L2_20, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L3_21, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L4_22, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L5_23, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L6_24, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L7_25, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L8_26, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L9_27, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L10_28, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L11_29, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L12_30, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L13_31, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L14_32, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L15_33, 1, TronColor * CurrentTronColorIntensity)
    SetR3MTColorReg(L16_34, 1, TronColor * CurrentTronColorIntensity)
  else
    while CurrentTronColorIntensity < NewTronColorIntensity do
      CurrentTronColorIntensity = CurrentTronColorIntensity + 0.01
      SetR3MTColorReg(A0_18, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L1_19, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L2_20, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L3_21, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L4_22, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L5_23, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L6_24, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L7_25, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L8_26, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L9_27, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L10_28, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L11_29, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L12_30, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L13_31, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L14_32, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L15_33, 1, TronColor * CurrentTronColorIntensity)
      SetR3MTColorReg(L16_34, 1, TronColor * CurrentTronColorIntensity)
      wait(0.0333)
    end
  end
  SetR3MTConstReg(A0_18, 2, TronBlack * 1)
  SetR3MTConstReg(L1_19, 1, TronBlack * 1)
  SetR3MTConstReg(L2_20, 1, TronBlack * 1)
  SetR3MTConstReg(L3_21, 1, TronBlack * 1)
  SetR3MTConstReg(L4_22, 1, TronBlack * 1)
  SetR3MTConstReg(L5_23, 1, TronBlack * 1)
  SetR3MTConstReg(L6_24, 1, TronBlack * 1)
  SetR3MTConstReg(L7_25, 1, TronBlack * 1)
  SetR3MTConstReg(L8_26, 1, TronBlack * 1)
  SetR3MTConstReg(L9_27, 1, TronBlack * 1)
  SetR3MTConstReg(L10_28, 1, TronBlack * 1)
  SetR3MTConstReg(L11_29, 1, TronBlack * 1)
  SetR3MTConstReg(L12_30, 1, TronBlack * 1)
  SetR3MTConstReg(L13_31, 1, TronBlack * 1)
  SetR3MTConstReg(L14_32, 1, TronBlack * 1)
  SetR3MTConstReg(L15_33, 1, TronBlack * 1)
  SetR3MTConstReg(L16_34, 1, TronBlack * 1)
end
function TL_SM_ZoneD_TronDamageFlash(A0_35)
  local L1_36, L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L12_47, L13_48, L14_49, L15_50, L16_51
  L1_36 = GetChildEntityByName
  L2_37 = A0_35
  L3_38 = "TronPete_LeftShoulderA"
  L1_36 = L1_36(L2_37, L3_38)
  L2_37 = GetChildEntityByName
  L3_38 = A0_35
  L4_39 = "TronPete_LeftShoulderB"
  L2_37 = L2_37(L3_38, L4_39)
  L3_38 = GetChildEntityByName
  L4_39 = A0_35
  L5_40 = "TronPete_RightShoulderA"
  L3_38 = L3_38(L4_39, L5_40)
  L4_39 = GetChildEntityByName
  L5_40 = A0_35
  L6_41 = "TronPete_RightShoulderB"
  L4_39 = L4_39(L5_40, L6_41)
  L5_40 = GetChildEntityByName
  L6_41 = A0_35
  L7_42 = "TronPete_UpperBody"
  L5_40 = L5_40(L6_41, L7_42)
  L6_41 = GetChildEntityByName
  L7_42 = A0_35
  L8_43 = "TronPete_Belly"
  L6_41 = L6_41(L7_42, L8_43)
  L7_42 = GetChildEntityByName
  L8_43 = A0_35
  L9_44 = "TronPete_LeftLegPad"
  L7_42 = L7_42(L8_43, L9_44)
  L8_43 = GetChildEntityByName
  L9_44 = A0_35
  L10_45 = "TronPete_RightLegPad"
  L8_43 = L8_43(L9_44, L10_45)
  L9_44 = GetChildEntityByName
  L10_45 = A0_35
  L11_46 = "TronPete_LowerBack"
  L9_44 = L9_44(L10_45, L11_46)
  L10_45 = GetChildEntityByName
  L11_46 = A0_35
  L12_47 = "TronPete_Peg"
  L10_45 = L10_45(L11_46, L12_47)
  L11_46 = GetChildEntityByName
  L12_47 = A0_35
  L13_48 = "TronPete_ChinPad"
  L11_46 = L11_46(L12_47, L13_48)
  L12_47 = GetChildEntityByName
  L13_48 = A0_35
  L14_49 = "TronPete_Helmet"
  L12_47 = L12_47(L13_48, L14_49)
  L13_48 = GetChildEntityByName
  L14_49 = A0_35
  L15_50 = "TronPete_LeftGlove"
  L13_48 = L13_48(L14_49, L15_50)
  L14_49 = GetChildEntityByName
  L15_50 = A0_35
  L16_51 = "TronPete_LeftGloveB"
  L14_49 = L14_49(L15_50, L16_51)
  L15_50 = GetChildEntityByName
  L16_51 = A0_35
  L15_50 = L15_50(L16_51, "TronPete_RightGloveA")
  L16_51 = GetChildEntityByName
  L16_51 = L16_51(A0_35, "TronPete_RightGloveB")
  CurrentTronColorIntensity = 0
  while CurrentTronColorIntensity < 1 do
    CurrentTronColorIntensity = CurrentTronColorIntensity + 0.2
    SetR3MTColorReg(A0_35, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L1_36, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L2_37, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L3_38, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L4_39, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L5_40, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L6_41, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L7_42, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L8_43, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L9_44, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L10_45, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L11_46, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L12_47, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L13_48, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L14_49, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L15_50, 1, TronRed * CurrentTronColorIntensity)
    SetR3MTColorReg(L16_51, 1, TronRed * CurrentTronColorIntensity)
    wait(0.01)
  end
  SetR3MTColorReg(A0_35, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L1_36, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L2_37, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L3_38, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L4_39, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L5_40, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L6_41, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L7_42, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L8_43, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L9_44, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L10_45, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(armor31, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L11_46, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L12_47, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L13_48, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L14_49, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L15_50, 1, TronColor * NewTronColorIntensity)
  SetR3MTColorReg(L16_51, 1, TronColor * NewTronColorIntensity)
end
function TL_SM_ZoneD_MCPShieldsOn(A0_52)
  if GetHealth(A0_52) == 1 then
    Unhide(A0_52)
  end
end
function TL_SM_ZoneD_WhoHitMe(A0_53, A1_54)
  local L2_55, L3_56, L4_57
  L2_55 = StimulusEvent_Instigator
  L3_56 = A1_54
  L2_55 = L2_55(L3_56)
  L3_56 = GetName
  L4_57 = L2_55
  L3_56 = L3_56(L4_57)
  L4_57 = StimulusEvent_Source
  L4_57 = L4_57(A1_54)
end
function TL_SM_ZoneD_WhereAmI(A0_58)
  local L1_59
end
function TL_SM_ZoneD_FlyingDisc(A0_60)
  local L1_61
  L1_61 = Phase
  if L1_61 > 1 then
    L1_61 = TowerLevel
    if L1_61 > 1 then
      L1_61 = GetDistanceBetweenEntities
      L1_61 = L1_61(A0_60, TronPete)
      while L1_61 < 8.8 do
        wait(0.0333)
        L1_61 = GetDistanceBetweenEntities(A0_60, TronPete)
      end
      TL_SM_ZoneD_MCPReflectiveShieldsOn(nil)
    end
  end
end
function TL_SM_ZoneD_MCPReflectiveShieldsOn(A0_62)
  local L1_63
  L1_63 = 0
  if Phase == 2 then
    L1_63 = 100
  elseif Phase == 3 then
    L1_63 = 100
  end
  ReflectiveShieldsOn = true
  if GetHealth(SHIELD_ONE) == 1 then
    Unhide(SHIELD_ONE)
  end
  if GetHealth(SHIELD_TWO) == 1 then
    Unhide(SHIELD_TWO)
  end
  if GetHealth(SHIELD_THREE) == 1 then
    Unhide(SHIELD_THREE)
  end
  if GetHealth(SHIELD_FOUR) == 1 then
    Unhide(SHIELD_FOUR)
  end
  if GetHealth(SHIELD_FIVE) == 1 then
    Unhide(SHIELD_FIVE)
  end
  if GetHealth(SHIELD_SIX) == 1 then
    Unhide(SHIELD_SIX)
  end
  if GetHealth(SHIELD_SEVEN) == 1 then
    Unhide(SHIELD_SEVEN)
  end
  if GetHealth(SHIELD_EIGHT) == 1 then
    Unhide(SHIELD_EIGHT)
  end
  while ReflectiveShieldsOn do
    ForEachEntityInGroup(SetRotatorMaxSpeed, "MCPReflectiveShields", L1_63)
    wait(4)
    L1_63 = L1_63 * -1
  end
end
function TL_SM_ZoneD_MCPReflectiveShieldsHit(A0_64, A1_65, A2_66)
  if BaseEvent_Type(A1_65) == OnStimulus and StimulusEvent_HasStimulusType(A1_65, ST_KNOCKBACK) then
    Damage(A0_64, 1)
    wait(0.2)
    StartEmitters(A2_66)
    wait(3)
    StopEmitters(A2_66)
  end
end
function TL_SM_ZoneD_MCPReflectiveShieldsOff(A0_67)
  ReflectiveShieldsOn = false
  ForEachEntityInGroup(SetRotatorMaxSpeed, "MCPReflectiveShields", 0)
  ForEachEntityInGroup(Hide, "MCPReflectiveShields")
end
function TL_SM_ZoneD_MCPReflectiveShieldsRegenerate(A0_68)
  ForEachEntityInGroup(SetHealth, "MCPReflectiveShields", 1)
end
function TL_SM_ZoneD_PhaseShift(A0_69)
  local L1_70, L2_71, L3_72
  TowerLevel = L1_70
  for _FORV_4_ = 1, 4 do
    CollectedPickups[_FORV_4_] = 0
  end
end
function TL_SM_ZoneD_HideTowerPickups(A0_73)
  local L1_74, L2_75, L3_76, L5_77, L6_78, L7_79, L9_80, L10_81, L11_82
  for L5_77 = 1, 3 do
    for L10_81 = 1, 3 do
      for _FORV_12_ = 1, 4 do
        Hide(TowerPickupList[L5_77][L10_81][_FORV_12_])
      end
    end
  end
end
function TL_SM_ZoneD_TowerPickups(A0_83, A1_84, A2_85)
  if A1_84 == 0 then
    TL_SM_ZoneD_HideTowerPickups(nil)
  else
    for _FORV_6_ = 1, 4 do
      if CollectedPickups[_FORV_6_] == 0 and Exists(TowerPickupList[A1_84][A2_85][_FORV_6_]) then
        Unhide(TowerPickupEffects[_FORV_6_])
        StartEmitters(TowerPickupEffects[_FORV_6_])
      end
    end
    wait(2)
    for _FORV_6_ = 1, 4 do
      if Exists(TowerPickupList[A1_84][A2_85][_FORV_6_]) then
        Unhide(TowerPickupList[A1_84][A2_85][_FORV_6_])
      end
    end
    wait(2.5)
    for _FORV_6_ = 1, 4 do
      if CollectedPickups[_FORV_6_] == 0 and Exists(TowerPickupList[A1_84][A2_85][_FORV_6_]) then
        Hide(TowerPickupEffects[_FORV_6_])
        StopEmitters(TowerPickupEffects[_FORV_6_])
      end
    end
  end
end
function TL_SM_ZoneD_TowerPickupPickedUp(A0_86, A1_87)
  CollectedPickups[tonumber(A1_87)] = 1
end
function TL_SM_ZoneD_RaiseTowers(A0_88)
  if Phase == 1 then
    if TowerLevel == 1 then
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 02"), GetEntity("sm_tl_zoned.SplineKnot 19"), GetEntity("sm_tl_zoned.SplineKnot 20"), 0.2)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 03"), GetEntity("sm_tl_zoned.SplineKnot 17"), GetEntity("sm_tl_zoned.SplineKnot 18"), 0.2)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 04"), GetEntity("sm_tl_zoned.SplineKnot 15"), GetEntity("sm_tl_zoned.SplineKnot 16"), 0.2)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 05"), GetEntity("sm_tl_zoned.SplineKnot 13"), GetEntity("sm_tl_zoned.SplineKnot 14"), 0.2)
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 02", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 03", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 04", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 05", "Play_sfx_platforms_move")
      TowersDown = false
    elseif TowerLevel == 2 then
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 02"), GetEntity("sm_tl_zoned.SplineKnot 19"), GetEntity("sm_tl_zoned.SplineKnot 20"), 0.2)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 03"), GetEntity("sm_tl_zoned.SplineKnot 17"), GetEntity("sm_tl_zoned.SplineKnot 18"), 0.333)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 04"), GetEntity("sm_tl_zoned.SplineKnot 15"), GetEntity("sm_tl_zoned.SplineKnot 16"), 0.2)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 05"), GetEntity("sm_tl_zoned.SplineKnot 13"), GetEntity("sm_tl_zoned.SplineKnot 14"), 0.333)
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 02", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 03", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 04", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 05", "Play_sfx_platforms_move")
      TowersDown = false
    elseif TowerLevel == 3 then
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 02"), GetEntity("sm_tl_zoned.SplineKnot 19"), GetEntity("sm_tl_zoned.SplineKnot 20"), 0.333)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 03"), GetEntity("sm_tl_zoned.SplineKnot 17"), GetEntity("sm_tl_zoned.SplineKnot 18"), 0.333)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 04"), GetEntity("sm_tl_zoned.SplineKnot 15"), GetEntity("sm_tl_zoned.SplineKnot 16"), 0.333)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 05"), GetEntity("sm_tl_zoned.SplineKnot 13"), GetEntity("sm_tl_zoned.SplineKnot 14"), 0.333)
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 02", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 03", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 04", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 05", "Play_sfx_platforms_move")
      TowersDown = false
    end
  elseif Phase == 2 then
    if TowerLevel == 1 then
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 02"), GetEntity("sm_tl_zoned.SplineKnot 19"), GetEntity("sm_tl_zoned.SplineKnot 20"), 0.333)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 03"), GetEntity("sm_tl_zoned.SplineKnot 17"), GetEntity("sm_tl_zoned.SplineKnot 18"), 0.5)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 04"), GetEntity("sm_tl_zoned.SplineKnot 15"), GetEntity("sm_tl_zoned.SplineKnot 16"), 0.333)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 05"), GetEntity("sm_tl_zoned.SplineKnot 13"), GetEntity("sm_tl_zoned.SplineKnot 14"), 0.5)
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 02", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 03", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 04", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 05", "Play_sfx_platforms_move")
      TowersDown = false
    elseif TowerLevel == 2 then
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 02"), GetEntity("sm_tl_zoned.SplineKnot 19"), GetEntity("sm_tl_zoned.SplineKnot 20"), 0.5)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 03"), GetEntity("sm_tl_zoned.SplineKnot 17"), GetEntity("sm_tl_zoned.SplineKnot 18"), 0.5)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 04"), GetEntity("sm_tl_zoned.SplineKnot 15"), GetEntity("sm_tl_zoned.SplineKnot 16"), 0.5)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 05"), GetEntity("sm_tl_zoned.SplineKnot 13"), GetEntity("sm_tl_zoned.SplineKnot 14"), 0.5)
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 02", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 03", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 04", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 05", "Play_sfx_platforms_move")
      TowersDown = false
    elseif TowerLevel == 3 then
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 02"), GetEntity("sm_tl_zoned.SplineKnot 19"), GetEntity("sm_tl_zoned.SplineKnot 20"), 0.5)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 03"), GetEntity("sm_tl_zoned.SplineKnot 17"), GetEntity("sm_tl_zoned.SplineKnot 18"), 0.5)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 04"), GetEntity("sm_tl_zoned.SplineKnot 15"), GetEntity("sm_tl_zoned.SplineKnot 16"), 0.666)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 05"), GetEntity("sm_tl_zoned.SplineKnot 13"), GetEntity("sm_tl_zoned.SplineKnot 14"), 0.666)
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 02", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 03", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 04", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 05", "Play_sfx_platforms_move")
      TowersDown = false
    end
  elseif Phase == 3 then
    if TowerLevel == 1 then
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 02"), GetEntity("sm_tl_zoned.SplineKnot 19"), GetEntity("sm_tl_zoned.SplineKnot 20"), 0.333)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 03"), GetEntity("sm_tl_zoned.SplineKnot 17"), GetEntity("sm_tl_zoned.SplineKnot 18"), 0.5)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 04"), GetEntity("sm_tl_zoned.SplineKnot 15"), GetEntity("sm_tl_zoned.SplineKnot 16"), 0.333)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 05"), GetEntity("sm_tl_zoned.SplineKnot 13"), GetEntity("sm_tl_zoned.SplineKnot 14"), 0.5)
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 02", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 03", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 04", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 05", "Play_sfx_platforms_move")
      TowersDown = false
    elseif TowerLevel == 2 then
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 02"), GetEntity("sm_tl_zoned.SplineKnot 19"), GetEntity("sm_tl_zoned.SplineKnot 20"), 0.666)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 03"), GetEntity("sm_tl_zoned.SplineKnot 17"), GetEntity("sm_tl_zoned.SplineKnot 18"), 0.666)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 04"), GetEntity("sm_tl_zoned.SplineKnot 15"), GetEntity("sm_tl_zoned.SplineKnot 16"), 0.666)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 05"), GetEntity("sm_tl_zoned.SplineKnot 13"), GetEntity("sm_tl_zoned.SplineKnot 14"), 0.666)
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 02", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 03", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 04", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 05", "Play_sfx_platforms_move")
      TowersDown = false
    elseif TowerLevel == 3 then
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 02"), GetEntity("sm_tl_zoned.SplineKnot 19"), GetEntity("sm_tl_zoned.SplineKnot 20"), 0.666)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 03"), GetEntity("sm_tl_zoned.SplineKnot 17"), GetEntity("sm_tl_zoned.SplineKnot 18"), 0.666)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 04"), GetEntity("sm_tl_zoned.SplineKnot 15"), GetEntity("sm_tl_zoned.SplineKnot 16"), 0.666)
      SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 05"), GetEntity("sm_tl_zoned.SplineKnot 13"), GetEntity("sm_tl_zoned.SplineKnot 14"), 0.666)
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 02", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 03", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 04", "Play_sfx_platforms_move")
      AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 05", "Play_sfx_platforms_move")
      TowersDown = false
    end
  end
  if TowersDown == true then
    TL_SM_ZoneD_TowerPickups(nil, Phase, TowerLevel)
  end
end
function TL_SM_ZoneD_LowerTowers(A0_89)
  if Phase ~= 4 then
    TL_SM_RecognizerShake()
    Enable("SmashTrigger")
    ForEachEntityInGroup(Enable, "TowerSmashTriggers")
    wait(0.01)
    Disable("SmashTrigger")
    ForEachEntityInGroup(Disable, "TowerSmashTriggers")
    wait(0.2)
    ForEachEntityInGroup(StartEmitters, "TronPeteTowerDust")
    SplineFollower_TeleportToKnot(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 02"), GetEntity("sm_tl_zoned.SplineKnot 19"))
    SplineFollower_TeleportToKnot(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 03"), GetEntity("sm_tl_zoned.SplineKnot 17"))
    SplineFollower_TeleportToKnot(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 04"), GetEntity("sm_tl_zoned.SplineKnot 15"))
    SplineFollower_TeleportToKnot(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 05"), GetEntity("sm_tl_zoned.SplineKnot 13"))
    SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 02"), GetEntity("sm_tl_zoned.SplineKnot 19"), GetEntity("sm_tl_zoned.SplineKnot 20"), 0)
    SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 03"), GetEntity("sm_tl_zoned.SplineKnot 17"), GetEntity("sm_tl_zoned.SplineKnot 18"), 0)
    SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 04"), GetEntity("sm_tl_zoned.SplineKnot 15"), GetEntity("sm_tl_zoned.SplineKnot 16"), 0)
    SplineFollower_StopAtPosition(GetEntity("sm_tl_zoned.DynamicRotatorSplineFollower 05"), GetEntity("sm_tl_zoned.SplineKnot 13"), GetEntity("sm_tl_zoned.SplineKnot 14"), 0)
    AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 02", "Play_sfx_platforms_smash")
    AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 03", "Play_sfx_platforms_smash")
    AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 04", "Play_sfx_platforms_smash")
    AudioPostEventOn("sm_tl_zoned.DynamicRotatorSplineFollower 05", "Play_sfx_platforms_smash")
    TowersDown = true
    wait(0.52)
    ForEachEntityInGroup(StopEmitters, "TronPeteTowerDust")
    wait(0.1)
    TL_SM_ZoneD_TowerPickups(nil, 0, 0)
  end
end
function TL_SM_ZoneD_TronLeash(A0_90, A1_91)
  local L2_92, L3_93
  L2_92 = GetPosition
  L3_93 = A1_91
  L2_92 = L2_92(L3_93)
  L3_93 = GetFacing
  L3_93 = L3_93(A0_90)
  SetTransformation(A0_90, L2_92, L3_93)
end
function TL_SM_ZoneD_HitTronPete(A0_94, A1_95)
  if not WatchingTV and BaseEvent_Type(A1_95) == OnStimulus then
    if StimulusEvent_HasStimulusType(A1_95, ST_KNOCKBACK) then
      TL_SM_ZoneD_MCPReflectiveShieldsRegenerate(nil)
      if Phase == 4 and OnThinnerPath then
        Damage(A0_94, 1)
      end
      if Phase == TowerLevel then
        AnimEvent(A0_94, "EVENT_Daze")
        TowerLevel = 1
        if Phase == 1 then
          TL_SM_ZoneD_ValveFocusCameraGo(nil)
        else
          wait(1)
          TL_SM_ZoneD_OpenValve()
        end
      else
        StimulusEvent_Direction(A1_95).y = 0
        GetFacing(A0_94).y = 0
        StimulusEvent_Direction(A1_95):normalize3()
        GetFacing(A0_94):normalize3()
        if GetFacing(A0_94).z * StimulusEvent_Direction(A1_95).x - GetFacing(A0_94).x * StimulusEvent_Direction(A1_95).z == 0 then
          AnimEvent(A0_94, "EVENT_HitCenter")
        elseif 0 > GetFacing(A0_94).z * StimulusEvent_Direction(A1_95).x - GetFacing(A0_94).x * StimulusEvent_Direction(A1_95).z then
          AnimEvent(A0_94, "EVENT_HitLeft")
        else
          AnimEvent(A0_94, "EVENT_HitRight")
        end
        TL_SM_ZoneD_TronDamageFlash(A0_94)
      end
    elseif StimulusEvent_HasStimulusType(A1_95, ST_PAINT) then
      AnimEvent(A0_94, "EVENT_PaintingClothes")
    elseif StimulusEvent_HasStimulusType(A1_95, ST_THINNER) then
      AnimEvent(A0_94, "EVENT_ThinningClothes")
    end
  end
end
function TL_SM_ZoneD_ValveReactCountdown()
  while VALVE_REACTION_TIMER > 0 do
    VALVE_REACTION_TIMER = VALVE_REACTION_TIMER - 0.0333
    wait(0.0333)
  end
  if PLAY_VALVE_LOOP then
    InValveReaction = false
    AnimEvent(TronPete, "EVENT_ReactValveLoop")
  end
end
function TL_SM_ZoneD_ReceiveValveStim(A0_96, A1_97)
  local L2_98
  L2_98 = false
  if BaseEvent_Type(A1_97) == OnStimulus then
    if StimulusEvent_SourceStimulusAlias(A1_97) == "Guardian" then
      L2_98 = true
    end
    if StimulusEvent_HasStimulusType(A1_97, ST_PAINT) then
      TL_SM_ZoneD_FillValve(A0_96, 1, L2_98)
    elseif StimulusEvent_HasStimulusType(A1_97, ST_THINNER) then
      TL_SM_ZoneD_FillValve(A0_96, 0, L2_98)
    end
  end
end
function TL_SM_ZoneD_FillValve(A0_99, A1_100, A2_101)
  local L3_102, L4_103, L5_104, L6_105
  L3_102 = tonumber
  L4_103 = A1_100
  L3_102 = L3_102(L4_103)
  if L3_102 == 1 then
    if A2_101 then
      L3_102 = PaintThreshold
      L3_102 = L3_102 + 1
      CurrentPaint = L3_102
    else
      L3_102 = CurrentPaint
      L3_102 = L3_102 + 1
      CurrentPaint = L3_102
    end
  elseif A2_101 then
    L3_102 = ThinnerThreshold
    L3_102 = L3_102 + 1
    CurrentThinner = L3_102
  else
    L3_102 = CurrentThinner
    L3_102 = L3_102 + 1
    CurrentThinner = L3_102
  end
  L3_102 = GetChildEntityByName
  L4_103 = A0_99
  L5_104 = "TronPete_ThinnerTank"
  L3_102 = L3_102(L4_103, L5_104)
  L4_103 = Phase
  L5_104 = ValveFilled
  if L5_104 == false then
    L5_104 = CurrentPaint
    L6_105 = PaintThreshold
    if L5_104 > L6_105 then
      L5_104 = false
      PLAY_VALVE_LOOP = L5_104
      L5_104 = true
      ValveFilled = L5_104
      L5_104 = TL_SM_ZoneD_ToggleValve
      L6_105 = nil
      L5_104(L6_105, A0_99, 1)
      L5_104 = AnimEvent
      L6_105 = A0_99
      L5_104(L6_105, EVENT_PaintTron)
      L5_104 = GetChildEntityByName
      L6_105 = A0_99
      L5_104 = L5_104(L6_105, "TronPete_PaintTank")
      L6_105 = GetChildEntityByName
      L6_105 = L6_105(A0_99, "TronPete_ThinnerTank")
      AnimGBReset(L5_104)
      AnimGBReset(L6_105)
      if InitialPathStep or OnPaintPath then
        TL_SM_ZoneD_SetArmorLevel(A0_99, 1)
        if Phase == 1 then
          AnimGBSequence(L5_104, "paint_stage1")
        elseif Phase == 2 then
          AnimGBSequence(L5_104, "paint_stage2")
        elseif Phase == 3 then
          AnimGBSequence(L5_104, "paint_stage3")
        end
        Phase = Phase + 1
        InitialPathStep = false
        OnPaintPath = true
      else
        if Phase == 2 then
          AnimGBSequence(L6_105, "thinner_emptyStage1")
        elseif Phase == 3 then
          AnimGBSequence(L6_105, "thinner_emptyStage2")
        end
        AnimGBSequence(L5_104, "paint_stage1")
        InitialPathStep = false
        OnThinnerPath = false
        OnPaintPath = true
        TL_SM_ZoneD_SetArmorLevel(A0_99, 1)
        Phase = 2
      end
      TL_SM_ZoneD_CloseValve()
      TL_SM_ZoneD_PhaseTransitionCamera(nil, 1)
    else
      L5_104 = CurrentThinner
      L6_105 = ThinnerThreshold
      if L5_104 > L6_105 then
        L5_104 = false
        PLAY_VALVE_LOOP = L5_104
        L5_104 = true
        ValveFilled = L5_104
        L5_104 = TL_SM_ZoneD_ToggleValve
        L6_105 = nil
        L5_104(L6_105, A0_99, 1)
        L5_104 = AnimEvent
        L6_105 = A0_99
        L5_104(L6_105, EVENT_ThinTron)
        L5_104 = GetChildEntityByName
        L6_105 = A0_99
        L5_104 = L5_104(L6_105, "TronPete_PaintTank")
        L6_105 = GetChildEntityByName
        L6_105 = L6_105(A0_99, "TronPete_ThinnerTank")
        AnimGBReset(L5_104)
        AnimGBReset(L6_105)
        if InitialPathStep or OnThinnerPath then
          if Phase == 1 then
            AnimGBSequence(L6_105, "thinner_stage1")
          elseif Phase == 2 then
            AnimGBSequence(L6_105, "thinner_stage2")
          elseif Phase == 3 then
            AnimGBSequence(L6_105, "thinner_stage3")
          end
          Phase = Phase + 1
          InitialPathStep = false
          OnThinnerPath = true
        else
          if Phase == 2 then
            AnimGBSequence(L5_104, "paint_emptyStage1")
          elseif Phase == 3 then
            AnimGBSequence(L5_104, "paint_emptyStage2")
          end
          AnimGBSequence(L6_105, "thinner_stage1")
          Phase = 2
          InitialPathStep = false
          OnPaintPath = false
          OnThinnerPath = true
        end
        TL_SM_ZoneD_SetArmorLevel(A0_99, 0)
        TL_SM_ZoneD_CloseValve()
        TL_SM_ZoneD_PhaseTransitionCamera(nil, 1)
      end
    end
  end
  L5_104 = 0.25
  VALVE_REACTION_TIMER = L5_104
  L5_104 = InValveReaction
  if not L5_104 then
    L5_104 = ValveFilled
    if not L5_104 then
      L5_104 = true
      PLAY_VALVE_LOOP = L5_104
      L5_104 = true
      InValveReaction = L5_104
      L5_104 = AnimEvent
      L6_105 = A0_99
      L5_104(L6_105, "EVENT_ReactFillValve")
      L5_104 = FireThread
      L6_105 = TL_SM_ZoneD_ValveReactCountdown
      L5_104(L6_105)
    end
  end
end
function TL_SM_ZoneD_ResetValve(A0_106)
  TL_SM_ZoneD_CloseValve()
  wait(3)
  CurrentPaint = 0
  CurrentThinner = 0
  ValveFilled = false
  InValveReaction = false
  PLAY_VALVE_LOOP = true
end
function TL_SM_ZoneD_SetArmorLevel(A0_107, A1_108)
  if tonumber(A1_108) == 1 then
    ArmorLevel = ArmorLevel + 1
  else
    ArmorLevel = 0
  end
  if ArmorLevel > 3 then
    ArmorLevel = 0
  end
  if ArmorLevel == 0 then
    TL_SM_ZoneD_UnhideArmor(nil, A0_107)
  end
end
function TL_SM_ZoneD_ToggleValve(A0_109, A1_110, A2_111)
  local L3_112, L4_113
  L3_112 = GetChildEntityByName
  L4_113 = A1_110
  L3_112 = L3_112(L4_113, "TronPete_BackValveCollision")
  L4_113 = GetChildEntityByName
  L4_113 = L4_113(A1_110, "TronPete_CollisionMesh")
  if tonumber(A2_111) == 1 then
    PLAY_VALVE_LOOP = false
    Hide(L3_112)
    Unhide(L4_113)
  elseif tonumber(A2_111) == 0 then
    Unhide(L3_112)
    Hide(L4_113)
  end
end
function TL_SM_ZoneD_HidePete(A0_114)
  if GetGlobal("TL_SM_ZoneD_SayHello_Played") == 0 then
    Hide(TronPete)
  end
end
function TL_SM_ZoneD_HideArmorPieces(A0_115, A1_116)
  local L2_117, L3_118, L4_119, L5_120, L6_121, L7_122, L8_123, L9_124, L10_125, L11_126, L12_127, L13_128, L14_129, L15_130, L16_131, L17_132, L18_133, L19_134, L20_135, L21_136, L22_137, L23_138, L24_139
  L2_117 = wait
  L3_118 = 1.25
  L2_117(L3_118)
  L2_117 = AudioPostEventOn
  L3_118 = CenterPlatform
  L4_119 = "Play_sfx_TroPete_armor_resOut"
  L2_117(L3_118, L4_119)
  L2_117 = GetChildEntityByName
  L3_118 = A1_116
  L4_119 = "TronPete_LeftShoulderA"
  L2_117 = L2_117(L3_118, L4_119)
  L3_118 = GetChildEntityByName
  L4_119 = A1_116
  L5_120 = "TronPete_LeftShoulderB"
  L3_118 = L3_118(L4_119, L5_120)
  L4_119 = GetChildEntityByName
  L5_120 = A1_116
  L6_121 = "TronPete_RightShoulderA"
  L4_119 = L4_119(L5_120, L6_121)
  L5_120 = GetChildEntityByName
  L6_121 = A1_116
  L7_122 = "TronPete_RightShoulderB"
  L5_120 = L5_120(L6_121, L7_122)
  L6_121 = GetChildEntityByName
  L7_122 = A1_116
  L8_123 = "TronPete_UpperBody"
  L6_121 = L6_121(L7_122, L8_123)
  L7_122 = GetChildEntityByName
  L8_123 = A1_116
  L9_124 = "TronPete_Belly"
  L7_122 = L7_122(L8_123, L9_124)
  L8_123 = GetChildEntityByName
  L9_124 = A1_116
  L10_125 = "TronPete_LeftLegPad"
  L8_123 = L8_123(L9_124, L10_125)
  L9_124 = GetChildEntityByName
  L10_125 = A1_116
  L11_126 = "TronPete_RightLegPad"
  L9_124 = L9_124(L10_125, L11_126)
  L10_125 = GetChildEntityByName
  L11_126 = A1_116
  L12_127 = "TronPete_LowerBack"
  L10_125 = L10_125(L11_126, L12_127)
  L11_126 = GetChildEntityByName
  L12_127 = A1_116
  L13_128 = "TronPete_Peg"
  L11_126 = L11_126(L12_127, L13_128)
  L12_127 = GetChildEntityByName
  L13_128 = A1_116
  L14_129 = "TronPete_BackValve"
  L12_127 = L12_127(L13_128, L14_129)
  L13_128 = GetChildEntityByName
  L14_129 = A1_116
  L15_130 = "TronPete_ChinPad"
  L13_128 = L13_128(L14_129, L15_130)
  L14_129 = GetChildEntityByName
  L15_130 = A1_116
  L16_131 = "TronPete_Helmet"
  L14_129 = L14_129(L15_130, L16_131)
  L15_130 = GetChildEntityByName
  L16_131 = A1_116
  L17_132 = "TronPete_LeftGlove"
  L15_130 = L15_130(L16_131, L17_132)
  L16_131 = GetChildEntityByName
  L17_132 = A1_116
  L18_133 = "TronPete_LeftGloveB"
  L16_131 = L16_131(L17_132, L18_133)
  L17_132 = GetChildEntityByName
  L18_133 = A1_116
  L19_134 = "TronPete_RightGloveA"
  L17_132 = L17_132(L18_133, L19_134)
  L18_133 = GetChildEntityByName
  L19_134 = A1_116
  L20_135 = "TronPete_RightGloveB"
  L18_133 = L18_133(L19_134, L20_135)
  L19_134 = GetChildEntityByName
  L20_135 = A1_116
  L21_136 = "TronPete_PaintTank"
  L19_134 = L19_134(L20_135, L21_136)
  L20_135 = GetChildEntityByName
  L21_136 = A1_116
  L22_137 = "TronPete_ThinnerTank"
  L20_135 = L20_135(L21_136, L22_137)
  L21_136 = vector4
  L22_137 = 0.0196
  L23_138 = 0.851
  L24_139 = 0.2863
  L21_136 = L21_136(L22_137, L23_138, L24_139, 0)
  L22_137 = vector4
  L23_138 = 0.0196
  L24_139 = 0.851
  L22_137 = L22_137(L23_138, L24_139, 0.2863, 0)
  L23_138 = 0
  L24_139 = 0.0333
  if ArmorLevel == 1 then
    SetR3MTColorReg(L2_117, 1, L22_137)
    SetR3MTColorReg(L3_118, 1, L22_137)
    SetR3MTColorReg(L4_119, 1, L22_137)
    SetR3MTColorReg(L5_120, 1, L22_137)
    SetR3MTColorReg(L6_121, 1, L22_137)
    while L23_138 < 1 do
      L21_136 = vector4(0.0196, 0.851, 0.2863, L23_138)
      SetR3MTConstReg(L2_117, 2, L21_136)
      SetR3MTConstReg(L3_118, 2, L21_136)
      SetR3MTConstReg(L4_119, 2, L21_136)
      SetR3MTConstReg(L5_120, 2, L21_136)
      SetR3MTConstReg(L6_121, 2, L21_136)
      wait(L24_139)
      L23_138 = L23_138 + 0.015
    end
    Hide(L2_117)
    Hide(L3_118)
    Hide(L4_119)
    Hide(L5_120)
    Hide(L6_121)
  end
  if ArmorLevel == 2 then
    SetR3MTColorReg(L7_122, 1, L22_137)
    SetR3MTColorReg(L8_123, 1, L22_137)
    SetR3MTColorReg(L9_124, 1, L22_137)
    SetR3MTColorReg(L10_125, 1, L22_137)
    SetR3MTColorReg(L11_126, 1, L22_137)
    while L23_138 < 1 do
      L21_136 = vector4(0.0196, 0.851, 0.2863, L23_138)
      SetR3MTConstReg(L7_122, 2, L21_136)
      SetR3MTConstReg(L8_123, 2, L21_136)
      SetR3MTConstReg(L9_124, 2, L21_136)
      SetR3MTConstReg(L10_125, 2, L21_136)
      SetR3MTConstReg(L11_126, 2, L21_136)
      wait(L24_139)
      L23_138 = L23_138 + 0.015
    end
    Hide(L7_122)
    Hide(L8_123)
    Hide(L9_124)
    Hide(L10_125)
    Hide(L11_126)
  end
  if ArmorLevel == 3 then
    SetR3MTColorReg(L12_127, 1, L22_137)
    SetR3MTColorReg(L13_128, 1, L22_137)
    SetR3MTColorReg(L14_129, 1, L22_137)
    SetR3MTColorReg(L15_130, 1, L22_137)
    SetR3MTColorReg(L16_131, 1, L22_137)
    SetR3MTConstReg(L17_132, 2, L22_137)
    SetR3MTConstReg(L18_133, 2, L22_137)
    SetR3MTConstReg(L19_134, 2, L22_137)
    SetR3MTConstReg(L20_135, 2, L22_137)
    while L23_138 < 1 do
      L21_136 = vector4(0.0196, 0.851, 0.2863, L23_138)
      SetR3MTConstReg(L12_127, 2, L21_136)
      SetR3MTConstReg(L13_128, 2, L21_136)
      SetR3MTConstReg(L14_129, 2, L21_136)
      SetR3MTConstReg(L15_130, 2, L21_136)
      SetR3MTConstReg(L16_131, 2, L21_136)
      SetR3MTConstReg(L17_132, 2, L21_136)
      SetR3MTConstReg(L18_133, 2, L21_136)
      SetR3MTConstReg(L19_134, 2, L21_136)
      SetR3MTConstReg(L20_135, 2, L21_136)
      wait(L24_139)
      L23_138 = L23_138 + 0.015
    end
    Hide(L12_127)
    Hide(L13_128)
    Hide(L14_129)
    Hide(L15_130)
    Hide(L16_131)
    Hide(L17_132)
    Hide(L18_133)
    Hide(L19_134)
    Hide(L20_135)
  end
end
function TL_SM_ZoneD_HideArmor(A0_140, A1_141)
  local L2_142, L3_143, L4_144, L5_145, L6_146, L7_147, L8_148, L9_149, L10_150, L11_151, L12_152, L13_153, L14_154, L15_155, L16_156, L17_157, L18_158, L19_159, L20_160
  L2_142 = GetGlobal
  L3_143 = "TL_SM_ZoneD_SayHello_Played"
  L2_142 = L2_142(L3_143)
  if L2_142 == 0 then
    L2_142 = GetChildEntityByName
    L3_143 = A1_141
    L4_144 = "TronPete_LeftShoulderA"
    L2_142 = L2_142(L3_143, L4_144)
    L3_143 = GetChildEntityByName
    L4_144 = A1_141
    L5_145 = "TronPete_LeftShoulderB"
    L3_143 = L3_143(L4_144, L5_145)
    L4_144 = GetChildEntityByName
    L5_145 = A1_141
    L6_146 = "TronPete_RightShoulderA"
    L4_144 = L4_144(L5_145, L6_146)
    L5_145 = GetChildEntityByName
    L6_146 = A1_141
    L7_147 = "TronPete_RightShoulderB"
    L5_145 = L5_145(L6_146, L7_147)
    L6_146 = GetChildEntityByName
    L7_147 = A1_141
    L8_148 = "TronPete_UpperBody"
    L6_146 = L6_146(L7_147, L8_148)
    L7_147 = GetChildEntityByName
    L8_148 = A1_141
    L9_149 = "TronPete_Belly"
    L7_147 = L7_147(L8_148, L9_149)
    L8_148 = GetChildEntityByName
    L9_149 = A1_141
    L10_150 = "TronPete_LeftLegPad"
    L8_148 = L8_148(L9_149, L10_150)
    L9_149 = GetChildEntityByName
    L10_150 = A1_141
    L11_151 = "TronPete_RightLegPad"
    L9_149 = L9_149(L10_150, L11_151)
    L10_150 = GetChildEntityByName
    L11_151 = A1_141
    L12_152 = "TronPete_LowerBack"
    L10_150 = L10_150(L11_151, L12_152)
    L11_151 = GetChildEntityByName
    L12_152 = A1_141
    L13_153 = "TronPete_Peg"
    L11_151 = L11_151(L12_152, L13_153)
    L12_152 = GetChildEntityByName
    L13_153 = A1_141
    L14_154 = "TronPete_BackValve"
    L12_152 = L12_152(L13_153, L14_154)
    L13_153 = GetChildEntityByName
    L14_154 = A1_141
    L15_155 = "TronPete_ChinPad"
    L13_153 = L13_153(L14_154, L15_155)
    L14_154 = GetChildEntityByName
    L15_155 = A1_141
    L16_156 = "TronPete_Helmet"
    L14_154 = L14_154(L15_155, L16_156)
    L15_155 = GetChildEntityByName
    L16_156 = A1_141
    L17_157 = "TronPete_LeftGlove"
    L15_155 = L15_155(L16_156, L17_157)
    L16_156 = GetChildEntityByName
    L17_157 = A1_141
    L18_158 = "TronPete_LeftGloveB"
    L16_156 = L16_156(L17_157, L18_158)
    L17_157 = GetChildEntityByName
    L18_158 = A1_141
    L19_159 = "TronPete_RightGloveA"
    L17_157 = L17_157(L18_158, L19_159)
    L18_158 = GetChildEntityByName
    L19_159 = A1_141
    L20_160 = "TronPete_RightGloveB"
    L18_158 = L18_158(L19_159, L20_160)
    L19_159 = GetChildEntityByName
    L20_160 = A1_141
    L19_159 = L19_159(L20_160, "TronPete_PaintTank")
    L20_160 = GetChildEntityByName
    L20_160 = L20_160(A1_141, "TronPete_ThinnerTank")
    Hide(L2_142)
    Hide(L3_143)
    Hide(L4_144)
    Hide(L5_145)
    Hide(L6_146)
    Hide(L7_147)
    Hide(L8_148)
    Hide(L9_149)
    Hide(L10_150)
    Hide(L11_151)
    Hide(L12_152)
    Hide(L13_153)
    Hide(L14_154)
    Hide(L15_155)
    Hide(L16_156)
    Hide(L17_157)
    Hide(L18_158)
    Hide(L19_159)
    Hide(L20_160)
  end
end
function TL_SM_ZoneD_UnhideArmor(A0_161, A1_162)
  local L2_163, L3_164, L4_165, L5_166, L6_167, L7_168, L8_169, L9_170, L10_171, L11_172, L12_173, L13_174, L14_175, L15_176, L16_177, L17_178, L18_179, L19_180, L20_181
  L2_163 = GetChildEntityByName
  L3_164 = A1_162
  L4_165 = "TronPete_LeftShoulderA"
  L2_163 = L2_163(L3_164, L4_165)
  L3_164 = GetChildEntityByName
  L4_165 = A1_162
  L5_166 = "TronPete_LeftShoulderB"
  L3_164 = L3_164(L4_165, L5_166)
  L4_165 = GetChildEntityByName
  L5_166 = A1_162
  L6_167 = "TronPete_RightShoulderA"
  L4_165 = L4_165(L5_166, L6_167)
  L5_166 = GetChildEntityByName
  L6_167 = A1_162
  L7_168 = "TronPete_RightShoulderB"
  L5_166 = L5_166(L6_167, L7_168)
  L6_167 = GetChildEntityByName
  L7_168 = A1_162
  L8_169 = "TronPete_UpperBody"
  L6_167 = L6_167(L7_168, L8_169)
  L7_168 = GetChildEntityByName
  L8_169 = A1_162
  L9_170 = "TronPete_Belly"
  L7_168 = L7_168(L8_169, L9_170)
  L8_169 = GetChildEntityByName
  L9_170 = A1_162
  L10_171 = "TronPete_LeftLegPad"
  L8_169 = L8_169(L9_170, L10_171)
  L9_170 = GetChildEntityByName
  L10_171 = A1_162
  L11_172 = "TronPete_RightLegPad"
  L9_170 = L9_170(L10_171, L11_172)
  L10_171 = GetChildEntityByName
  L11_172 = A1_162
  L12_173 = "TronPete_LowerBack"
  L10_171 = L10_171(L11_172, L12_173)
  L11_172 = GetChildEntityByName
  L12_173 = A1_162
  L13_174 = "TronPete_Peg"
  L11_172 = L11_172(L12_173, L13_174)
  L12_173 = GetChildEntityByName
  L13_174 = A1_162
  L14_175 = "TronPete_BackValve"
  L12_173 = L12_173(L13_174, L14_175)
  L13_174 = GetChildEntityByName
  L14_175 = A1_162
  L15_176 = "TronPete_ChinPad"
  L13_174 = L13_174(L14_175, L15_176)
  L14_175 = GetChildEntityByName
  L15_176 = A1_162
  L16_177 = "TronPete_Helmet"
  L14_175 = L14_175(L15_176, L16_177)
  L15_176 = GetChildEntityByName
  L16_177 = A1_162
  L17_178 = "TronPete_LeftGlove"
  L15_176 = L15_176(L16_177, L17_178)
  L16_177 = GetChildEntityByName
  L17_178 = A1_162
  L18_179 = "TronPete_LeftGloveB"
  L16_177 = L16_177(L17_178, L18_179)
  L17_178 = GetChildEntityByName
  L18_179 = A1_162
  L19_180 = "TronPete_RightGloveA"
  L17_178 = L17_178(L18_179, L19_180)
  L18_179 = GetChildEntityByName
  L19_180 = A1_162
  L20_181 = "TronPete_RightGloveB"
  L18_179 = L18_179(L19_180, L20_181)
  L19_180 = GetChildEntityByName
  L20_181 = A1_162
  L19_180 = L19_180(L20_181, "TronPete_PaintTank")
  L20_181 = GetChildEntityByName
  L20_181 = L20_181(A1_162, "TronPete_ThinnerTank")
  Unhide(L2_163)
  Unhide(L3_164)
  Unhide(L4_165)
  Unhide(L5_166)
  Unhide(L6_167)
  Unhide(L7_168)
  Unhide(L8_169)
  Unhide(L9_170)
  Unhide(L10_171)
  Unhide(L11_172)
  Unhide(L12_173)
  Unhide(L13_174)
  Unhide(L14_175)
  Unhide(L15_176)
  Unhide(L16_177)
  Unhide(L17_178)
  Unhide(L18_179)
  Unhide(L19_180)
  Unhide(L20_181)
end
function TL_SM_ZoneD_EndofFight(A0_182)
  FightEnded = true
  TL_SM_ZoneD_EnableHitWall(nil, 0)
  ForEachEntityInGroup(Disable, "TronPlaneTriggers")
  SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride) 06 GameplayHIGH")
  AudioSetState(GetPlayer(), "Music_State", "Boss_Win")
end
function TL_SM_ZoneD_HidePlatform(A0_183)
  if not FightEnded then
    wait(5)
    FireThread(TL_SM_ZoneD_DeRes, "sm_tl_zoned.DynamicScriptableProp Center Res", 0.007)
    AudioPostEventOn(CenterPlatform, "Play_sfx_floor_deres")
    wait(0.52)
    Hide(CenterPlatform)
    wait(5)
    Unhide("sm_tl_zoned.StaticProp 09")
  end
end
function TL_SM_ZoneD_UnhidePlatform(A0_184)
  if not FightEnded then
    Hide("sm_tl_zoned.StaticProp 09")
    Hide("sm_tl_zoned.DynamicScriptableProp Center Res")
    TL_SM_ZoneD_ResIn("sm_tl_zoned.DynamicScriptableProp Center Res", 0.015)
    Unhide(CenterPlatform)
    Hide("sm_tl_zoned.DynamicScriptableProp Center Res")
  end
end
function TL_SM_ZoneD_MoralityCheck(A0_185)
  local L1_186, L2_187
  L1_186 = RestrictCutSceneInput
  L1_186()
  L1_186 = ForEachEntityInGroup
  L2_187 = Disable
  L1_186(L2_187, "TronPlaneTriggers")
  L1_186 = true
  HeroicMickey = L1_186
  L1_186 = Unhide
  L2_187 = "sm_tl_zoned.StaticScriptableProp 05"
  L1_186(L2_187)
  L1_186 = ForEachEntityInGroup
  L2_187 = ForcePainted
  L1_186(L2_187, "FloorPanels")
  L1_186 = TL_SM_ZoneD_EndofFight
  L1_186()
  L1_186 = wait
  L2_187 = 8
  L1_186(L2_187)
  L1_186 = AudioPostEventOn
  L2_187 = GetPlayer
  L2_187 = L2_187()
  L1_186(L2_187, "Stop_music_Tomorrowland_boss")
  L1_186 = AnimEvent
  L2_187 = TronPete
  L1_186(L2_187, "EVENT_GoToSleep")
  L1_186 = wait
  L2_187 = 0.1
  L1_186(L2_187)
  L1_186 = ForceSequence
  L2_187 = "sm_tl_zoned_gameplay.Marker(Conversation) TronPete"
  L1_186(L2_187, "Befriended")
  L1_186 = AnimEvent
  L2_187 = TronPete
  L1_186(L2_187, "EVENT_TalkDisc")
  L1_186 = wait
  L2_187 = 1.5
  L1_186(L2_187)
  L1_186 = AudioPostEventOn
  L2_187 = GetPlayer
  L2_187 = L2_187()
  L1_186(L2_187, "Play_music_tomorrowland")
  L1_186 = AudioSetState
  L2_187 = GetPlayer
  L2_187 = L2_187()
  L1_186(L2_187, "Music_State", "Exploration")
  L1_186 = AudioSetState
  L2_187 = GetPlayer
  L2_187 = L2_187()
  L1_186(L2_187, "Music_Exploration", "neutral")
  L1_186 = wait
  L2_187 = 7
  L1_186(L2_187)
  L1_186 = AnimEvent
  L2_187 = TronPete
  L1_186(L2_187, "EVENT_talkDiscEnd")
  L1_186 = Unhide
  L2_187 = "sm_tl_zoned_gameplay.ParticleScriptable PeteBeamOut"
  L1_186(L2_187)
  L1_186 = GetPosition
  L2_187 = TronPete
  L1_186 = L1_186(L2_187)
  L2_187 = GetFacing
  L2_187 = L2_187(TronPete)
  SetTransformation("sm_tl_zoned_gameplay.ParticleScriptable PeteBeamOut", L1_186, L2_187)
  StartEmitters("sm_tl_zoned_gameplay.ParticleScriptable PeteBeamOut")
  wait(0.4)
  AudioPostEventOn(CenterPlatform, "Play_sfx_TroPete_armor_resOut")
  Hide("sm_tl_zoned.TronPete 01")
  wait(3)
  StopEmitters("sm_tl_zoned_gameplay.ParticleScriptable PeteBeamOut")
  Hide("sm_tl_zoned_gameplay.ParticleScriptable PeteBeamOut")
  wait(1)
  ForceSequence("sm_tl_zoned_gameplay.Marker(Conversation) Gus", "Gus_JudgesMickey_Good")
  StopEmitters("sm_tl_zoned_gameplay.ParticleScriptable PeteBeamOut")
  wait(2)
  TL_SM_ZoneD_DiscPickup()
end
function TL_SM_ZoneD_MoralityCheck1(A0_188)
  wait(1)
  TL_SM_ZoneD_AmmoPaint()
  AddHeroPoints(GetPlayer(), 10)
  Hide("sm_tl_zoned.StaticProp 09")
  UnrestrictCutSceneInput()
end
function TL_SM_ZoneD_MoralityCheck2(A0_189)
  local L1_190, L2_191
  L1_190 = RestrictCutSceneInput
  L1_190()
  L1_190 = ForEachEntityInGroup
  L2_191 = Disable
  L1_190(L2_191, "TronPlaneTriggers")
  L1_190 = false
  HeroicMickey = L1_190
  L1_190 = SetCameraAttributes
  L2_191 = "sm_tl_zoned.Marker(CameraOverride) ShowDeRez"
  L1_190(L2_191)
  L1_190 = wait
  L2_191 = 1
  L1_190(L2_191)
  L1_190 = Hide
  L2_191 = "sm_tl_zoned.StaticProp 09"
  L1_190(L2_191)
  L1_190 = Unhide
  L2_191 = "sm_tl_zoned.StaticScriptableProp 05"
  L1_190(L2_191)
  L1_190 = ForEachEntityInGroup
  L2_191 = ForcePainted
  L1_190(L2_191, "FloorPanels")
  L1_190 = Hide
  L2_191 = "sm_tl_zoned.DynamicScriptableProp Center Res"
  L1_190(L2_191)
  L1_190 = AnimEvent
  L2_191 = TronPete
  L1_190(L2_191, EVENT_RezOut)
  L1_190 = wait
  L2_191 = 0.9
  L1_190(L2_191)
  L1_190 = GetPosition
  L2_191 = TronPete
  L1_190 = L1_190(L2_191)
  L2_191 = GetFacing
  L2_191 = L2_191(TronPete)
  SetTransformation("sm_tl_zoned_gameplay.ParticleScriptable 08", L1_190, L2_191)
  StartEmitters("sm_tl_zoned_gameplay.ParticleScriptable 08")
  wait(0.1)
  AudioPostEventOn(CenterPlatform, "Play_sfx_TroPete_armor_resOut")
  Hide("sm_tl_zoned.TronPete 01")
  ForceSequence("sm_tl_zoned_gameplay.Marker(Conversation) TronPete", "Destroyed")
  wait(0.4)
  TimerDisable("sm_tl_zoned.LogicTimerMarker 02")
  TL_SM_ZoneD_EndofFight()
  wait(8)
  AudioPostEventOn(GetPlayer(), "Stop_music_Tomorrowland_boss")
  wait(1)
  AudioPostEventOn(GetPlayer(), "Play_music_tomorrowland")
  AudioSetState(GetPlayer(), "Music_State", "Exploration")
  AudioSetState(GetPlayer(), "Music_Exploration", "neutral")
  StopEmitters("sm_tl_zoned_gameplay.ParticleScriptable 08")
  Hide("sm_tl_zoned_gameplay.ParticleScriptable 08")
  TL_SM_ZoneD_DiscPickup()
  wait(0.5)
  SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride) 06 GameplayHIGH")
  Hide("sm_tl_zoned.DynamicScriptableProp Center Res")
  Unhide(CenterPlatform)
  wait(1.3)
  ForceSequence("sm_tl_zoned_gameplay.Marker(Conversation) Gus", "Gus_JudgesMickey_Bad")
  wait(2)
end
function TL_SM_ZoneD_MoralityCheck2a(A0_192)
  wait(1)
  TL_SM_ZoneD_AmmoThinner()
  AddScrapperPoints(GetPlayer(), 10)
  Hide("sm_tl_zoned.StaticProp 09")
  UnrestrictCutSceneInput()
end
function TL_SM_ZoneD_AmmoPaint()
  Enable("sm_tl_zoned.TriggerDamageVolume 01")
  StartFadeOut(0.5)
  ToggleLetterbox()
  wait(1)
  Unhide("sm_tl_zoned.Gremlin_Gus 01")
  TeleportToEntity(GetPlayer(), "sm_tl_zoned.Marker(Usable) 01")
  SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride) 02")
  wait(1)
  StartFadeIn(1)
  wait(1.5)
  Mickey_Receive_Item_NPC("sm_tl_zoned.seq_getitemfromnpc 01.Spawner", "PaintUpgrade")
  wait(1.5)
  ShowHud()
  GiveCollectible("CapIncrease_Paint")
  DoStinger("Stinger_Success", 7)
  IncreaseMaxPaintAmmo()
  Mickey_GetItem_ClearItem("sm_tl_zoned.seq_getitemfromnpc 01.Spawner", "PaintUpgrade")
  wait(3)
  SetUnlockedExtra("ConceptArt_44_Throne_Room")
  TeleportGremlinOut("sm_tl_zoned.Gremlin_Gus 01")
  wait(4)
  ToggleLetterbox()
  SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride) 06 GameplayHIGH")
  TL_SM_ZoneD_SaveCheckpointEndFightPaint()
end
function TL_SM_ZoneD_AmmoThinner()
  Enable("sm_tl_zoned.TriggerDamageVolume 01")
  StartFadeOut(0.5)
  ToggleLetterbox()
  wait(1)
  Unhide("sm_tl_zoned.Gremlin_Gus 01")
  TeleportToEntity(GetPlayer(), "sm_tl_zoned.Marker(Usable) 01")
  SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride) 02")
  wait(1)
  StartFadeIn(1)
  wait(1.5)
  Mickey_Receive_Item_NPC("sm_tl_zoned.seq_getitemfromnpc 01.Spawner", "ThinnerUpgrade")
  ShowHud()
  GiveCollectible("CapIncrease_Thinner")
  DoStinger("Stinger_Success", 7)
  IncreaseMaxThinnerAmmo()
  wait(1.5)
  Mickey_GetItem_ClearItem("sm_tl_zoned.seq_getitemfromnpc 01.Spawner", "ThinnerUpgrade")
  wait(3)
  SetUnlockedExtra("ConceptArt_44_Throne_Room")
  TeleportGremlinOut("sm_tl_zoned.Gremlin_Gus 01")
  wait(4)
  ToggleLetterbox()
  SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride) 06 GameplayHIGH")
  TL_SM_ZoneD_SaveCheckpointEndFightThinner()
end
function TL_SM_ZoneD_DiscPickup(A0_193)
  Unhide("TronDisc_Pickup")
  Enable("TronDisc_Pickup")
end
function TL_SM_ZoneD_ScreenReveal(A0_194)
  ForceSequence("sm_tl_zoned_gameplay.Marker(Conversation) Gus", "Gus_PeteDiskRecovered")
  wait(3.5)
  Unhide("sm_tl_zoned.ParticleScriptable 04")
  StartEmitters("sm_tl_zoned.ParticleScriptable 04")
  AudioPostEventOn("sm_tl_zoned.ParticleScriptable 04", "Play_sfx_TronPete_warp_in")
  wait(0.4)
  Unhide("TronPete_Screen")
  Prefab_Projector_ChangeState("TronPete_Screen", "Activate")
  wait(2)
  StopEmitters("sm_tl_zoned.ParticleScriptable 04")
  Hide("sm_tl_zoned.ParticleScriptable 04")
end
function TL_SM_ZoneD_EndLevel()
  if HeroicMickey then
    SetGlobal("MS_petetronicresolution", 1)
  else
    SetGlobal("MS_petetronicresolution", 0)
  end
  wait(3)
  SetGlobal("HUB_startposition", 3)
  SetGlobal("MS_MeanStreetProgress", 3)
  LoadLevel(GetPlayer(), "MeanStreet_FromTL.level")
end
function TL_SM_ZoneD_CutCam(A0_195, A1_196, A2_197, A3_198, A4_199, A5_200, A6_201)
  ReleaseSecondaryCameraTarget(nil)
  RestrictCutSceneInput()
  GrabCamera(A1_196, A2_197, CAMERA_LERP_TRANSITION, A3_198)
  wait(A4_199)
  ReleaseCamera(CAMERA_LERP_TRANSITION, A5_200)
  SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride) 04")
  UnrestrictCutSceneInput()
  wait(0.25)
end
function TL_SM_ZoneD_LookDownCamera(A0_202)
  if InLookDownCamera == false then
    SetCameraAttributes(A0_202)
    InLookDownCamera = true
  end
end
function TL_SM_ZoneD_LeaveLookDownCamera(A0_203)
  if InLookDownCamera == true then
    InLookDownCamera = false
    TL_SM_ZoneD_ReturnToGameplayCamera(nil)
  end
end
function TL_SM_ZoneD_DiscRevealCamera(A0_204)
  if GetGlobal("TL_SM_ZoneD_SayHello_Played") == 0 then
    AudioPostEventOn(GetPlayer(), "Play_music_tomorrowland_boss")
    AudioSetState(GetPlayer(), "Music_State", "Boss_Intro")
    SetMap(nil, "MAP_TL_PETEBOSSROOF", "GAME")
    ToggleLetterbox()
    SetPropertyBool("sm_tl_zoned.StaticScriptableProp 05", "Is Real", true)
    ForEachEntityInGroup(ForcePainted, "FloorPanels")
    ForEachEntityInGroup(SetPropertyBool, "FloorPanels", "Is Real", true)
    RestrictCutSceneInput()
    wait(0.1)
    StartFadeIn(0.5)
    SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride) 09 DiscRevealCameraOverride")
    wait(2)
    ForceSequence("sm_tl_zoned_gameplay.Marker(Conversation) Gus", "DiscSpotted")
    wait(1)
    EnterCutscene(GetPlayer(), 23)
    SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollower Disc Intro", 9)
    EnableGuardianSystem()
    StartTrackingCurrentLevelForScoring("Tron_Fight")
    TL_SM_ZoneD_SaveCheckpoint()
    ToggleLetterbox()
  else
    SetMap(nil, "MAP_TL_PETEBOSSROOF", "GAME")
    TL_SM_ZoneD_CameraLoad()
  end
end
function TL_SM_ZoneD_DiscRevealCameraPause(A0_205)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollower 02 DiscRevealCamera", 0.25)
  wait(0.5)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollower 02 DiscRevealCamera", 5)
end
function TL_SM_ZoneD_DiscRevealCameraEnd(A0_206)
  UnrestrictCutSceneInput()
  SplineFollower_TeleportToKnot("sm_tl_zoned.CameraControlPointSplineFollower 02 DiscRevealCamera", "sm_tl_zoned.SplineKnot 41 DiscCamStart")
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollower 02 DiscRevealCamera", 0)
end
function TL_SM_ZoneD_Intro(A0_207)
  ToggleLetterbox()
  RestrictCutSceneInput()
  HideHud()
  SetMap(nil, "MAP_TL_PETEBOSSROOF", "GAME")
  SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride) Intro")
  Enable("sm_tl_zoned_gameplay.Spawner 01")
  Unhide("sm_tl_zoned_gameplay.ParticleScriptableREZTEST")
  wait(1)
  StartEmitters("sm_tl_zoned_gameplay.ParticleScriptableREZTEST")
  Unhide("sm_tl_zoned_gameplay.ParticleScriptable PeteBeamIn")
  StartEmitters("sm_tl_zoned_gameplay.ParticleScriptable PeteBeamIn")
  AudioPostEventOn("sm_tl_zoned_gameplay.ParticleScriptable PeteBeamIn", "Play_sfx_TronPete_warp_in")
  wait(1)
  Hide("TronDisc_Pickup")
  wait(1)
  StopEmitters("sm_tl_zoned_gameplay.ParticleScriptableREZTEST")
  Hide("sm_tl_zoned_gameplay.ParticleScriptableREZTEST")
  AnimEvent(TronPete, "EVENT_Idle_turnAround_startLoop")
  wait(1)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerIntro", 0.8)
  TL_SM_ZoneD_OpenValve()
  wait(0.3)
  Unhide(TronPete)
  StopEmitters("sm_tl_zoned.ParticleScriptableWithParent 05")
  TL_SM_ZoneD_ToggleValve(nil, TronPete, 1)
  TL_SM_ZoneD_SetArmorLevel(TronPete, 0)
  wait(0.3)
  wait(0.5)
  StopEmitters("sm_tl_zoned_gameplay.ParticleScriptable PeteBeamIn")
  Hide("sm_tl_zoned_gameplay.ParticleScriptable PeteBeamIn")
  wait(0.75)
  TL_SM_ZoneD_CloseValve()
  wait(0.75)
  AnimEvent(TronPete, "EVENT_turnAround")
  wait(1.5)
  AnimEvent(TronPete, "EVENT_TauntLaugh")
  TL_SM_ZoneD_Intro1()
end
function TL_SM_ZoneD_Intro1(A0_208)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerIntro", 0)
  ForceSequence("sm_tl_zoned_gameplay.Marker(Conversation) TronPete", "TL_SM_ZoneD_Intro")
end
function TL_SM_ZoneD_Intro2(A0_209)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerIntro", 0)
  ForceSequence("sm_tl_zoned_gameplay.Marker(Conversation) TronPete", "TL_SM_ZoneD_SayHello")
end
function TL_SM_ZoneD_Intro3(A0_210)
  TL_SM_ZoneD_EnableHitWall(nil, 1)
  Hide(CenterPlatform)
  AudioPostEventOn(CenterPlatform, "Play_sfx_floor_deres")
  TL_SM_ZoneD_DeRes("sm_tl_zoned.DynamicScriptableProp Center Res", 0.014)
  Enable("sm_tl_zoned.TriggerDamageVolume 01")
  ToggleLetterbox()
  UnrestrictCutSceneInput()
  ForceSequence("sm_tl_zoned_gameplay.Marker(Conversation) Gus", "DefeatTronPete")
  ForEachEntityInGroup(SetPropertyBool, "FloorPanels", "Is Real", false)
  TL_SM_ZoneD_SetGameplayCamera("sm_tl_zoned.Marker(CameraOverride) 07 GameplayMID", 1)
  TL_SM_ZoneD_SaveCheckpointStartFight()
end
function TL_SM_ZoneD_IntroCameraPassKnot2(A0_211)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerIntro", 0)
  wait(1.2)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerIntro", 10)
end
function TL_SM_ZoneD_IntroCameraPassKnot3(A0_212)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerIntro", 0)
  wait(2)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerIntro", 1)
  wait(3)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerIntro", 2)
  wait(0.5)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerIntro", 3)
  wait(0.5)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerIntro", 4)
  wait(0.5)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerIntro", 5)
  wait(0.5)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerIntro", 6)
end
function TL_SM_ZoneD_SetGameplayCamera(A0_213, A1_214)
  ActiveGameplayCamera = A0_213
  if tonumber(A1_214) == 1 then
    SetCameraAttributes(ActiveGameplayCamera)
  end
end
function TL_SM_ZoneD_ReturnToGameplayCamera(A0_215)
  SetCameraAttributes(ActiveGameplayCamera)
end
function TL_SM_ZoneD_ValveFocusCameraGo(A0_216)
  RestrictCutSceneInput()
  StartFadeOut(0)
  SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride)ValveFocus")
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerValveFocus", 7)
  StartFadeIn(0.5)
  wait(1.3)
  TL_SM_ZoneD_OpenValve()
  wait(1)
  TL_SM_ZoneD_ReturnToGameplayCamera(nil)
  wait(0.1)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerValveFocus", 0)
  SplineFollower_TeleportToKnot("sm_tl_zoned.CameraControlPointSplineFollowerValveFocus", "sm_tl_zoned.SplineKnot(Parentable)ValveFocusStart")
  UnrestrictCutSceneInput()
end
function TL_SM_ZoneD_PhaseTransitionCamera(A0_217, A1_218)
  if A1_218 == 1 then
    RestrictCutSceneInput()
    SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride)PetePhaseTran1")
    SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerPetePhaseTran1", 0.25)
    wait(1.5)
    SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerPetePhaseTran1", 20)
  elseif A1_218 == 2 then
    RestrictCutSceneInput()
    SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride)PetePhaseTran2")
    SplineFollower_TeleportToKnot("sm_tl_zoned.CameraControlPointSplineFollowerPetePhaseTran2", "sm_tl_zoned.SplineKnot(Parentable)TronPhaseTran2-01")
    SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerPetePhaseTran2", 8)
  end
  ForEachEntityInGroup(ForcePainted, "FloorPanels")
end
function TL_SM_ZoneD_Phase1TransitionPause(A0_219)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerPetePhaseTran1", 0)
  wait(1)
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerPetePhaseTran1", 13)
  wait(0.5)
  UnrestrictCutSceneInput()
end
function TL_SM_ZoneD_Phase1TransitionEnd(A0_220)
  TL_SM_ZoneD_ReturnToGameplayCamera(nil)
  SplineFollower_TeleportToKnot("sm_tl_zoned.CameraControlPointSplineFollowerPetePhaseTran1", "sm_tl_zoned.SplineKnot(Parentable)PetePhaseTran1-01")
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerPetePhaseTran1", 0)
end
function TL_SM_ZoneD_Phase2TransitionEnd(A0_221)
  UnrestrictCutSceneInput()
  TL_SM_ZoneD_ReturnToGameplayCamera(nil)
  SplineFollower_TeleportToKnot("sm_tl_zoned.CameraControlPointSplineFollowerPetePhaseTran2", "sm_tl_zoned.SplineKnot(Parentable)TronPhaseTran2-01")
  SetSplineFollowerInitialSpeed("sm_tl_zoned.CameraControlPointSplineFollowerPetePhaseTran2", 0)
end
function TL_DEBUGPeteBeatPortalMagic()
  SetGlobal("2dDirection", 0)
  DialogBoxAdvanced("Defeat pete, calm pete down", "Calm down", "Defeat")
  wait(0.3)
  if GetDialogResponse() == "No" then
    SetGlobal("MS_petetronicresolution", 0)
    SetGlobal("MS_MeanStreetProgress", 3)
    LoadLevel(GetPlayer(), "Levels/2D_Plutopia01.level")
  elseif GetDialogResponse() == "Yes" then
    SetGlobal("MS_petetronicresolution", 1)
    SetGlobal("MS_MeanStreetProgress", 3)
    LoadLevel(GetPlayer(), "Levels/2D_Plutopia01.level")
  end
end
function TL_SM_ZoneD_PickupManager(A0_222, A1_223)
  if tonumber(A1_223) == 1 then
    wait(0.5)
    Unhide(GetEntity("sm_tl_zoned.Ammo_Paint 01"))
    wait(0.1)
    Unhide(GetEntity("sm_tl_zoned.Ammo_Paint 02"))
    wait(0.1)
    Unhide(GetEntity("sm_tl_zoned.Ammo_Paint 03"))
    wait(0.1)
    Unhide(GetEntity("sm_tl_zoned.Ammo_Paint 04"))
    wait(0.1)
    Unhide(GetEntity("sm_tl_zoned.Ammo_PaintThinner 01"))
    wait(0.1)
    Unhide(GetEntity("sm_tl_zoned.Ammo_Thinner 01"))
    wait(0.1)
    Unhide(GetEntity("sm_tl_zoned.Ammo_Thinner 02"))
    wait(0.1)
    Unhide(GetEntity("sm_tl_zoned.ETicket_A 01"))
    wait(0.1)
    Unhide(GetEntity("sm_tl_zoned.ETicket_C 01"))
    wait(0.1)
    Unhide(GetEntity("sm_tl_zoned.ETicket_C 02"))
    wait(10.6)
    Hide(GetEntity("sm_tl_zoned.Ammo_Paint 01"))
    Hide(GetEntity("sm_tl_zoned.Ammo_Paint 02"))
    Hide(GetEntity("sm_tl_zoned.Ammo_Paint 03"))
    Hide(GetEntity("sm_tl_zoned.Ammo_Paint 04"))
    Hide(GetEntity("sm_tl_zoned.Ammo_PaintThinner 01"))
    Hide(GetEntity("sm_tl_zoned.Ammo_Thinner 01"))
    Hide(GetEntity("sm_tl_zoned.Ammo_Thinner 02"))
    Hide(GetEntity("sm_tl_zoned.ETicket_A 01"))
    Hide(GetEntity("sm_tl_zoned.ETicket_C 01"))
    Hide(GetEntity("sm_tl_zoned.ETicket_C 02"))
  elseif tonumber(A1_223) == 0 then
    Hide(GetEntity("sm_tl_zoned.Ammo_Paint 01"))
    Hide(GetEntity("sm_tl_zoned.Ammo_Paint 02"))
    Hide(GetEntity("sm_tl_zoned.Ammo_Paint 03"))
    Hide(GetEntity("sm_tl_zoned.Ammo_Paint 04"))
    Hide(GetEntity("sm_tl_zoned.Ammo_PaintThinner 01"))
    Hide(GetEntity("sm_tl_zoned.Ammo_Thinner 01"))
    Hide(GetEntity("sm_tl_zoned.Ammo_Thinner 02"))
    Hide(GetEntity("sm_tl_zoned.ETicket_A 01"))
    Hide(GetEntity("sm_tl_zoned.ETicket_C 01"))
    Hide(GetEntity("sm_tl_zoned.ETicket_C 02"))
  end
end
function TL_SM_ZoneD_RecognizerStomp(A0_224)
  SetSpeed(A0_224, 0)
  AnimEvent(A0_224, EVENT_StartCollapse)
  wait(2)
  SetSpeed(A0_224, 100)
  if GetDistanceBetweenEntities(GetPlayer(), A0_224) < 10 then
    TL_SM_RecognizerShake()
  end
end
function TL_SM_RecognizerShake()
  local L0_225, L1_226, L2_227, L3_228, L4_229, L5_230
  L0_225 = 1.1
  L1_226 = 10
  L2_227 = 0.05
  L3_228 = 1
  L4_229 = 0.1
  L5_230 = 0.001
  ShakeCamera(L0_225, L1_226, L2_227, L3_228, L4_229, L5_230)
end
function TL_SM_ZoneD_TurnOffWallPushing(A0_231)
  SetWallPushingEnabled(GetPlayer(), false)
end
function TL_SM_ZoneD_EnableHitWall(A0_232, A1_233)
  if tonumber(A1_233) == 1 then
    ForEachEntityInGroup(Unhide, "PeteWallDamageTriggers")
    Unhide("sm_tl_zoned_gameplay.ParticleScriptableWallIdle")
    StartEmitters("sm_tl_zoned_gameplay.ParticleScriptableWallIdle")
  elseif tonumber(A1_233) == 0 then
    ForEachEntityInGroup(Hide, "PeteWallDamageTriggers")
    StopEmitters("sm_tl_zoned_gameplay.ParticleScriptableWallIdle")
    Hide("sm_tl_zoned_gameplay.ParticleScriptableWallIdle")
  end
end
function TL_SM_ZoneD_MickeyHitWall(A0_234)
  local L1_235, L2_236, L3_237
  L1_235 = Unhide
  L2_236 = "sm_tl_zoned_gameplay.ParticleScriptableWallFull"
  L1_235(L2_236)
  L1_235 = StartEmitters
  L2_236 = "sm_tl_zoned_gameplay.ParticleScriptableWallFull"
  L1_235(L2_236)
  L1_235 = GetPosition
  L2_236 = GetPlayer
  L3_237 = L2_236()
  L1_235 = L1_235(L2_236, L3_237, L2_236())
  L2_236 = GetFacing
  L3_237 = GetPlayer
  L3_237 = L3_237()
  L2_236 = L2_236(L3_237, L3_237())
  L3_237 = GetHeading
  L3_237 = L3_237(GetPlayer())
  L1_235.y = L1_235.y + 0.5
  L3_237 = L3_237 + 90
  SetTransformation("sm_tl_zoned.ParticleScriptableWithParentMickeyHitWallImpact", L1_235, L2_236)
  SetHeading("sm_tl_zoned.ParticleScriptableWithParentMickeyHitWallImpact", L3_237)
  Unhide("sm_tl_zoned.ParticleScriptableWithParentMickeyHitWallImpact")
  StartEmitters("sm_tl_zoned.ParticleScriptableWithParentMickeyHitWallImpact")
  wait(1)
  StopEmitters("sm_tl_zoned.ParticleScriptableWithParentMickeyHitWallImpact")
  Hide("sm_tl_zoned.ParticleScriptableWithParentMickeyHitWallImpact")
  StopEmitters("sm_tl_zoned_gameplay.ParticleScriptableWallFull")
  Hide("sm_tl_zoned_gameplay.ParticleScriptableWallFull")
end
function TL_SM_ZoneD_TriggerToggle(A0_238)
  Disable("sm_tl_zoned.Trigger 02")
  Disable("sm_tl_zoned.Trigger 03")
  Disable("sm_tl_zoned.Trigger 04")
  Disable("sm_tl_zoned.Trigger 05")
  Disable("sm_tl_zoned.Trigger 06")
  Disable("sm_tl_zoned.Trigger 07")
  Disable("sm_tl_zoned.Trigger 08")
end
function TL_SM_ZoneD_MoveRez(A0_239)
  local L1_240, L2_241
  L1_240 = TeleportToEntity
  L2_241 = "sm_tl_zoned.DynamicScriptableProp 08"
  L1_240(L2_241, GetPosition(A0_239))
end
function TL_SM_ZoneD_DiskHitWall(A0_242)
  local L1_243, L2_244
  L1_243 = GetPosition
  L2_244 = A0_242
  L1_243 = L1_243(L2_244)
  L2_244 = GetFacing
  L2_244 = L2_244(A0_242)
  SetTransformation("sm_tl_zoned.ParticleScriptable 02", L1_243, L2_244)
  Unhide("sm_tl_zoned.ParticleScriptable 02")
  StartEmitters("sm_tl_zoned.ParticleScriptable 02")
  wait(1)
  StopEmitters("sm_tl_zoned.ParticleScriptable 02")
  Hide("sm_tl_zoned.ParticleScriptable 02")
end
function TL_SM_ZoneD_DiskHitShield()
  local L0_245, L1_246
  L0_245 = GetPosition
  L1_246 = "TronPeteDisc"
  L0_245 = L0_245(L1_246)
  L1_246 = GetFacing
  L1_246 = L1_246("TronPeteDisc")
  SetTransformation("sm_tl_zoned.ParticleScriptable 03", L0_245, L1_246)
  Unhide("sm_tl_zoned.ParticleScriptable 03")
  StartEmitters("sm_tl_zoned.ParticleScriptable 03")
  wait(1)
  StopEmitters("sm_tl_zoned.ParticleScriptable 03")
  Hide("sm_tl_zoned.ParticleScriptable 03")
end
function TL_SM_ZoneD_CameraLoad()
  DisableMovementInput(GetPlayer())
  wait(4)
  EnableMovementInput(GetPlayer())
  if GetGlobal("TL_SM_ZoneD_SayHello_Played") == 0 then
    SetCameraAttributes("sm_tl_zoned.Marker(CameraOverride) 02 GameplayStartCamera")
  else
    TL_SM_ZoneD_SetGameplayCamera("sm_tl_zoned.Marker(CameraOverride) 07 GameplayMID", 1)
  end
end
function TL_SM_ZoneD_SetMap()
  SetMap(nil, "MAP_TL_PETEBOSSROOF", "GAME")
end
function TM_SM_ZoneD_KillThisTV(A0_247)
  local L1_248
  L1_248 = GetName
  L1_248 = L1_248(A0_247)
  if string.find(L1_248, "painttv") then
    ForceSketched(A0_247)
  end
end
