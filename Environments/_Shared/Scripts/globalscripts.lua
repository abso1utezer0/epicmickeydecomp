wait = coroutine.yield

Wait = coroutine.yield

g_MusicState = "Auto"

NativeAudioSetState = AudioSetState

function AudioSetState(param1, param2, param3)
  if param2 == nil or param3 == nil then
    return
  end
  NativeAudioSetState(param1, param2, param3)
  if param2 == "Music_State" then
    g_MusicState = param3
  end
end

function DoStinger(param1, param2)
  if param2 == nil then
    param2 = 5
  end
  AudioSetState(GetPlayer(), "Music_State", param1)
  FireThread(EndStinger, param2, g_MusicState)
end

function EndStinger(param1, param2)
  Wait(param1)
  AudioSetState(GetPlayer(), "Music_State", param2)
end

function PrintTable(A0_8, A1_9)
  local L2_10, L3_11, L4_12, dashLine, L6_14
  dashLine = "----"
  L2_10(L3_11, L4_12, dashLine)
  for dashLine, L6_14 in L2_10(L3_11) do
    print("t[", dashLine, "]=", L6_14)
  end
  L2_10(L3_11)
end

function DoEndGame()
  SetGlobal("DBC_LastHeartBoss", 26)
  AnimGBSequence("dbc_zones.HeartTentacleA1End 01", "Pop")
  Wait(2.25)
  HideHud()
  SetEndgameVariables()
  wait(0.1)
  SetGlobal("DBC_EndGameCutscene", 1)
  SetUnlockedExtra("EndgameVar_Closing", false)
  StoreEndgameData()
  UpdatePins()
  Wait(0.1)
  SaveGameToMemory("", false, 0, false)
  Wait(0.1)
  ResetSaveGameSlot()
  wait(0.3)
  SetEndingGame(true)
  CleanLoadLevel("Levels/Main_Menu.level")
end

function SimulateEndGame()
  DoEndGame()
end

function TestLoadCallback()
  Print("Load callback executed!")
end

function PlayMovieAdvanced(A0_15)
  RestrictCutSceneInput()
  StartFadeOut(1)
  Wait(1)
  PlayMovie(GetPlayer(), A0_15)
  StartFadeInNoHUD(1)
  Wait(1)
  UnrestrictCutSceneInput()
end

function DisableGlint(A0_16)
  SetR3MTLockAnimation(A0_16, 0)
end

function EnableGlint(A0_17)
  SetR3MTUnlockAnimation(A0_17)
end

function SetAnimVariant(A0_18, A1_19)
  AnimVarInt(A0_18, VAR_AI_Variant, A1_19)
end

function WaitForDialog(A0_20)
  local L1_21
  repeat
    wait(0.1)
    L1_21 = GetDialogResponse()
  until L1_21 ~= "Waiting"
  if L1_21 == "Aborted" then
    L1_21 = nil
  end
  return L1_21
end

function AddGlobal(A0_22, A1_23)
  SetGlobal(A0_22, GetGlobal(A0_22) + A1_23)
end

function IncrementGlobal(A0_24)
  AddGlobal(A0_24, 1)
end

function DecrementGlobal(A0_25)
  AddGlobal(A0_25, -1)
end

function IncrementGlobalSD(A0_26, A1_27)
  AddGlobal(A1_27, 1)
end

function DecrementGlobalSD(A0_28, A1_29)
  AddGlobal(A1_29, -1)
end

testCharMood = 0

function CONV_HUB_Test_Func(param1, param2)
  AnimVarInt(param2, VAR_Mood_Type, testCharMood)
  AnimEvent(param2, EVENT_Start_Talk)
  DialogBoxNoPause(param2, "Talking with mood=" .. testCharMood)
  WaitForDialog(param2)
  wait(3)
  DialogBoxNoPause(param2, "Emote negative")
  WaitForDialog(param2)
  AnimEvent(param2, EVENT_Start_EmoteSad)
  wait(4)
  DialogBoxNoPause(param2, "Emote positive")
  WaitForDialog(param2)
  AnimEvent(param2, EVENT_Start_EmoteHappy)
  wait(4)
  DialogBoxNoPause(param2, "Emote extra positive")
  WaitForDialog(param2)
  AnimEvent(param2, EVENT_Start_EmoteVeryHappy)
  wait(4)
  testCharMood = testCharMood + 1
  if testCharMood == 3 then
    testCharMood = 0
  end
end

conversationEntered = false

function Conversation(A0_32, A1_33, A2_34)
  local L3_35, L4_36, L5_37, L6_38, L7_39, L8_40
  L3_35 = conversationEntered
  if L3_35 then
    return
  end
  L3_35 = true
  conversationEntered = L3_35
  L3_35 = EnterCutscene
  L4_36 = A1_33
  L3_35(L4_36)
  L3_35 = FaceEntity
  L4_36 = A1_33
  L5_37 = A2_34
  L3_35(L4_36, L5_37)
  L3_35 = AnimEvent
  L4_36 = A1_33
  L5_37 = EVENT_Start_Talk
  L3_35(L4_36, L5_37)
  L3_35 = RestrictCutSceneInput
  L3_35()
  L3_35 = DisableMotion_Player
  L3_35()
  L3_35 = rawget
  L4_36 = _G
  L5_37 = A0_32
  L6_38 = "_Func"
  L5_37 = L5_37 .. L6_38
  L3_35 = L3_35(L4_36, L5_37)
  if L3_35 ~= nil then
    L4_36 = L3_35
    L5_37 = A0_32
    L6_38 = A1_33
    L4_36(L5_37, L6_38)
  else
    L4_36 = 1
    repeat
      L5_37 = nil
      L6_38 = GetConfigVariableString
      L7_39 = A0_32
      L8_40 = "_Text"
      L7_39 = L7_39 .. L8_40 .. L4_36
      L6_38 = L6_38(L7_39)
      L5_37 = L6_38
      if L5_37 ~= "" then
        L6_38 = Print
        L7_39 = "EST"
        L8_40 = GetConfigVariableString
        L8_40 = L8_40(A0_32 .. "_Mood" .. L4_36)
        L6_38(L7_39, L8_40, L8_40(A0_32 .. "_Mood" .. L4_36))
        L6_38 = rawget
        L7_39 = _G
        L8_40 = GetConfigVariableString
        L8_40 = L8_40(A0_32 .. "_Mood" .. L4_36)
        L6_38 = L6_38(L7_39, L8_40, L8_40(A0_32 .. "_Mood" .. L4_36))
        if L6_38 ~= nil then
          L7_39 = AnimVarInt
          L8_40 = A1_33
          L7_39(L8_40, VAR_Mood_Type, L6_38)
        end
        L7_39 = rawget
        L8_40 = _G
        L7_39 = L7_39(L8_40, GetConfigVariableString(A0_32 .. "_Reaction" .. L4_36))
        if L7_39 ~= nil then
          L8_40 = AnimVarInt
          L8_40(A1_33, VAR_Reaction_Type, L7_39)
        end
        L8_40 = rawget
        L8_40 = L8_40(_G, GetConfigVariableString(A0_32 .. "_Anim" .. L4_36))
        if L8_40 ~= nil then
          AnimEvent(A1_33, L8_40)
        end
        DialogBoxNoPause(A1_33, L5_37)
        WaitForDialog(A1_33)
        L4_36 = L4_36 + 1
      end
    until L5_37 == ""
    if L4_36 == 1 then
      L5_37 = DialogBoxNoPause
      L6_38 = A1_33
      L7_39 = "No Text in conversation "
      L8_40 = A0_32
      L7_39 = L7_39 .. L8_40
      L5_37(L6_38, L7_39)
      L5_37 = WaitForDialog
      L6_38 = A1_33
      L5_37(L6_38)
    end
  end
  L4_36 = AnimEvent
  L5_37 = A1_33
  L6_38 = EVENT_Finished_Sequence
  L4_36(L5_37, L6_38)
  L4_36 = EnableMotion_Player
  L4_36()
  L4_36 = UnrestrictCutSceneInput
  L4_36()
  L4_36 = ExitCutscene
  L5_37 = A1_33
  L4_36(L5_37)
  L4_36 = false
  conversationEntered = L4_36
end

global_entity_data_table = {}

Openfile("./environments/_shared/scripts/strict.lua")
Openfile("./environments/_shared/scripts/autosave.lua")
Openfile("./environments/_shared/scripts/restore.lua")
Openfile("./environments/_shared/scripts/MagicWand.lua")
Openfile("./environments/_shared/scripts/CDC.lua")
Openfile("./environments/_shared/scripts/sketches.lua")

global_data = {
  test = {
    test2 = {}
  }
}

level_data = {
  test3 = {
    test4 = {}
  }
}

function TestEvent(param1)
  Print("Event fired." .. param1)
end

function LoadNIF(param1)
  LoadNIFImpl(param1)
end

function UnloadNIF(param1)
  UnloadNIFImpl(param1)
end

function LoadLevel(param1, param2)
  TransitionToLevel(tostring(param2))
end

function StreamZones(param1, param2) 
  StreamPart(tostring(param2))
end

function StreamInterior(param1, param2)
  StreamInteriorZone(tostring(param2))
end

function RestartLevel()
  RestartCurrentLevel()
end

function WaitForLevelLoad()
  WaitForLevelToLoad()
end

function SetPlayerSpawnTransformSelf(param1)
  SetPlayerSpawnTransformEntity(param1)
end

function SaveCheckpointNoPosition(param1, param2)
  local var1
  var1 = param2
  if var1 == nil then
    var1 = ""
  end
  SaveGameToMemory(var1, false)
end

function SaveCheckpoint(param1, param2, param3)
  local var1, var2
  var2 = param3
  if var1 == nil then
    var1 = ""
  end
  var2 = param2
  if var2 == nil then
    var2 = ""
  end
  SaveGameToMemory(var2, true, var1)
end

function SaveCheckpointSelf(A0_65, A1_66)
  local L2_67
  L2_67 = A1_66
  if L2_67 == nil then
    L2_67 = ""
  end
  SetPlayerSpawnTransformEntity(A0_65)
  SaveGameToMemory(L2_67, false)
end

function LoadCheckpoint(A0_68)
  LoadGameFromMemory()
end

function CreatePlayerMetric(A0_69, A1_70)
  local L2_71
  L2_71 = CreateMetric
  L2_71(tostring(A1_70))
end

function TeleportSelf(A0_72, A1_73)
  MoveToEntity(A0_72, A1_73)
end

function SaveGremlin()
  SetGlobal("GV_GremlinsSaved", GetGlobal("GV_GremlinsSaved") + 1)
end

function Enable2DSetup()
  Print("Enable 2D Setup")
  SetHudFor2D(GetPlayer(), false)
  PlayerHasSketchAbilities(false)
  PlayerHasPaintThinnerAbilities(false)
  DisableGuardianSystem()
end

function Disable2DSetup()
  Print("Disable 2D Setup")
  SetHudFor2D(GetPlayer(), true)
  PlayerHasSketchAbilities(true)
  PlayerHasPaintThinnerAbilities(true)
  EnableGuardianSystem()
end

function SetEndgameVariables()
  Print("Setting up endgame variables")
  if GetGlobal("GV_PeteStuff") == 1 then
    SetGlobal("Endgame_Var_Pos_SmallPete", 1)
  end
  if GetGlobal("CT_ClockTowerResolution") == 1 then
    SetGlobal("Endgame_Var_Pos_Clocktower", 1)
  end
  if GetGlobal("MS_petetronicresolution") == 1 then
    SetGlobal("Endgame_Var_Pos_Petetronic", 1)
  end
  if GetGlobal("PoTW_ZoneM_HookIsDead") == 0 then
    SetGlobal("Endgame_Var_Pos_Hook", 1)
  end
  if GetGlobal("TT_GoofyAssembleBik_Played") == 1 then
    SetGlobal("Endgame_Var_Pos_Goofy", 1)
  end
  if GetGlobal("NO_DonaldFMV_Played") == 1 then
    SetGlobal("Endgame_Var_Pos_Donald", 1)
  end
  if GetGlobal("AL_V2_ReAssemble_Played") == 1 then
    SetGlobal("Endgame_Var_Pos_Daisy", 1)
  end
  if 1 < 0 + 1 + 1 + 1 then
    SetGlobal("Endgame_Var_Pos_Horace", 1)
  end
  if 0 + 1 + 1 + 1 == 3 then
    SetGlobal("Endgame_Var_Pos_Pete", 1)
  end
  Print("Endgame_Var_Pos_Pete: " .. GetGlobal("Endgame_Var_Pos_Pete"))
  Print("Endgame_Var_Pos_Horace: " .. GetGlobal("Endgame_Var_Pos_Horace"))
  Print("Endgame_Var_Pos_Goofy: " .. GetGlobal("Endgame_Var_Pos_Goofy"))
  Print("Endgame_Var_Pos_Donald: " .. GetGlobal("Endgame_Var_Pos_Donald"))
  Print("Endgame_Var_Pos_Daisy: " .. GetGlobal("Endgame_Var_Pos_Daisy"))
  Print("Endgame_Var_Pos_Clocktower: " .. GetGlobal("Endgame_Var_Pos_Clocktower"))
  Print("Endgame_Var_Pos_Hook: " .. GetGlobal("Endgame_Var_Pos_Hook"))
  Print("Endgame_Var_Pos_SmallPete: " .. GetGlobal("Endgame_Var_Pos_SmallPete"))
  Print("Endgame_Var_Pos_Petetronic: " .. GetGlobal("Endgame_Var_Pos_Petetronic"))
end

function EnterCurrentMeanStreet()
  if GetGlobal("MS_MeanStreetProgress") == 1 then
    LoadLevel(GetPlayer(), "Levels/MeanStreet_V1.level")
  end
  if GetGlobal("MS_MeanStreetProgress") == 2 then
    LoadLevel(GetPlayer(), "Levels/MeanStreet_V2.level")
  end
  if GetGlobal("MS_MeanStreetProgress") == 3 then
    LoadLevel(GetPlayer(), "Levels/MeanStreet_V3.level")
  end
  if GetGlobal("MS_MeanStreetProgress") == 4 then
    LoadLevel(GetPlayer(), "Levels/MeanStreet_V4.level")
  end
  if GetGlobal("MS_MeanStreetProgress") == 5 then
    LoadLevel(GetPlayer(), "Levels/MeanStreet_V5.level")
  end
  if GetGlobal("MS_MeanStreetProgress") == 6 then
    LoadLevel(GetPlayer(), "Levels/MeanStreet_V6.level")
  end
end

function EnableGuardianHint(A0_74)
  ForEachEntityInGroup(EnableComponent, A0_74, "Guardian Hint Component")
end

function DisableGuardianHint(A0_75)
  ForEachEntityInGroup(DisableComponent, A0_75, "Guardian Hint Component")
end

function SetMickeyTickets()
  local L0_76
  L0_76 = GetPropertyFloat
  L0_76 = L0_76(GetPlayer(), "ETicket")
  SetGlobal("Mickey_Tickets", L0_76)
end

function HideGremlinWrench()
  local L0_77
  L0_77 = Hide
  L0_77(GetChildEntityByName(_self(), "GremlinWrench"))
end

function UnhideGremlinWrench()
  if not IsHidden(_self()) then
    Unhide(GetChildEntityByName(_self(), "GremlinWrench"))
  end
end

function ShakeCamera_Default(A0_78)
  local L1_79, L2_80, L3_81, L4_82, L5_83, L6_84
  L1_79 = 2
  L2_80 = 5
  L3_81 = 0.05
  L4_82 = 4
  L5_83 = 0.1
  L6_84 = 0.025
  ShakeCamera(L1_79, L2_80, L3_81, L4_82, L5_83, L6_84)
end

function KnockbackExplode_Default(A0_85)
  local L1_86, L2_87, L3_88, L4_89
  L1_86 = ST_KNOCKBACK
  L2_87 = 1
  L3_88 = GetPosition
  L4_89 = A0_85
  L3_88 = L3_88(L4_89)
  L4_89 = 6
  StimulusSphere(_self(), L1_86, L2_87, L3_88, L4_89)
end

function start_csg_ops(A0_90)
  local L1_91
  while true do
    L1_91 = GetPosition
    L1_91 = L1_91(A0_90)
    CSGOperation(L1_91, false, 1, 1, vector4(1, 0, 0, 0))
    wait(0.2)
  end
end

function onetime_csg_ops(A0_92)
  local L1_93
  L1_93 = GetPosition
  L1_93 = L1_93(A0_92)
  CSGOperation(L1_93, false, 1, 1, vector4(1, 0, 0, 0))
end

function start_csg_ops_paint(A0_94)
  local L1_95
  while true do
    L1_95 = GetPosition
    L1_95 = L1_95(A0_94)
    CSGOperation(L1_95, true, 1, 1, vector4(1, 0, 0, 0))
    wait(0.2)
  end
end

function lua_zoom_to(A0_96, A1_97)
  Print("ZoomTo called with:" .. A1_97)
  ZoomToLevel(A1_97)
end

function SetMickeyToMaxHealth()
  local L0_98, L1_99
  L0_98 = _player
  L0_98 = L0_98()
  L1_99 = 10
  SetPropertyInt(L0_98, "MaxHealth", L1_99, 0)
  SetPropertyInt(L0_98, "Health", L1_99, 0)
end

function SetPaintAmmoToMax()
  local L0_100, L1_101, L2_102
  L0_100 = 70
  L1_101 = 10
  L2_102 = 10
  L1_101 = L1_101 + 20
  SetPaintMax(GetPlayer(), L0_100, L2_102)
  SetPropertyFloat(GetPlayer(), "PaintRechargeMax", L1_101, 0)
  SetPropertyFloat(GetPlayer(), "Paint", L0_100, 0)
end

function SetThinnerAmmoToMax()
  local L0_103, L1_104, L2_105
  L0_103 = 70
  L1_104 = 10
  L2_105 = 10
  L1_104 = L1_104 + 20
  SetThinnerMax(GetPlayer(), L0_103, L2_105)
  SetPropertyFloat(GetPlayer(), "ThinnerRechargeMax", L1_104, 0)
  SetPropertyFloat(GetPlayer(), "Thinner", L0_103, 0)
end

function IncreaseMickeysMaxHealth(A0_106)
  local L1_107, L2_108
  L1_107 = _player
  L1_107 = L1_107()
  L2_108 = GetPropertyInt
  L2_108 = L2_108(L1_107, "MaxHealth", 0)
  L2_108 = L2_108 + 1
  SetPropertyInt(L1_107, "MaxHealth", L2_108, 0)
  SetPropertyInt(L1_107, "Health", L2_108, 0)
end

function IncreaseMaxPaintAmmo()
  local L0_109, L1_110, L2_111
  L0_109 = GetPropertyFloat
  L1_110 = _player
  L1_110 = L1_110()
  L2_111 = "PaintMax"
  L0_109 = L0_109(L1_110, L2_111, 0)
  L1_110 = GetPropertyFloat
  L2_111 = _player
  L2_111 = L2_111()
  L1_110 = L1_110(L2_111, "PaintRechargeMax", 0)
  L2_111 = 10
  L0_109 = L0_109 + L2_111
  L1_110 = L1_110 + L2_111 / 2
  SetPaintMax(GetPlayer(), L0_109, L2_111)
  SetPropertyFloat(GetPlayer(), "PaintRechargeMax", L1_110, 0)
  SetPropertyFloat(GetPlayer(), "Paint", L0_109, 0)
end

function IncreaseMaxThinnerAmmo()
  local L0_112, L1_113, L2_114
  L0_112 = GetPropertyFloat
  L1_113 = _player
  L1_113 = L1_113()
  L2_114 = "ThinnerMax"
  L0_112 = L0_112(L1_113, L2_114, 0)
  L1_113 = GetPropertyFloat
  L2_114 = _player
  L2_114 = L2_114()
  L1_113 = L1_113(L2_114, "ThinnerRechargeMax", 0)
  L2_114 = 10
  L0_112 = L0_112 + L2_114
  L1_113 = L1_113 + L2_114 / 2
  SetThinnerMax(GetPlayer(), L0_112, L2_114)
  SetPropertyFloat(GetPlayer(), "ThinnerRechargeMax", L1_113, 0)
  SetPropertyFloat(GetPlayer(), "Thinner", L0_112, 0)
end

function IncreaseMaxTVSketch()
  local L0_115
  L0_115 = GetPropertyFloat
  L0_115 = L0_115(_player(), "SketchMax", 0)
  L0_115 = L0_115 + 5
  SetPropertyFloat(_player(), "SketchMax", L0_115, 0)
  Print("****Setting max TV sketch to: " .. L0_115)
end

function IncreaseMaxWatchSketch()
  local L0_116
  L0_116 = GetPropertyFloat
  L0_116 = L0_116(_player(), "SketchMax", 1)
  L0_116 = L0_116 + 5
  SetPropertyFloat(_player(), "SketchMax", L0_116, 1)
  Print("****Setting max watch sketch to: " .. L0_116)
end

function IncreaseMaxAnvilSketch()
  local L0_117
  L0_117 = GetPropertyFloat
  L0_117 = L0_117(_player(), "SketchMax", 2)
  L0_117 = L0_117 + 5
  SetPropertyFloat(_player(), "SketchMax", L0_117, 2)
  Print("****Setting max anvil sketch to: " .. L0_117)
end

function MegaSketchUnlock()
  local L0_118, L1_119, L2_120
  L0_118 = GetPropertyFloat
  L1_119 = _player
  L1_119 = L1_119()
  L2_120 = "SketchMax"
  L0_118 = L0_118(L1_119, L2_120, 0)
  L1_119 = GetPropertyFloat
  L2_120 = _player
  L2_120 = L2_120()
  L1_119 = L1_119(L2_120, "SketchMax", 1)
  L2_120 = GetPropertyFloat
  L2_120 = L2_120(_player(), "SketchMax", 2)
  L0_118 = L0_118 + 50
  L1_119 = L1_119 + 50
  L2_120 = L2_120 + 50
  SetPropertyFloat(_player(), "SketchMax", L0_118, 0)
  SetPropertyFloat(_player(), "SketchMax", L1_119, 1)
  SetPropertyFloat(_player(), "SketchMax", L2_120, 2)
  Print("****Setting max TV sketch to: " .. L0_118)
  Print("****Setting max watch sketch to: " .. L1_119)
  Print("****Setting max anvil sketch to: " .. L2_120)
end

function IncreaseMaxTicket_L1()
  local L0_121
  L0_121 = 3000
  Print("*************INVENTORY: TICKET MAX =  " .. L0_121)
  SetPropertyFloat(_player(), "ETicketMax", L0_121, 0)
end

function IncreaseMaxTicket_L2()
  local L0_122
  L0_122 = 5000
  Print("*************INVENTORY: TICKET MAX =  " .. L0_122)
  SetPropertyFloat(_player(), "ETicketMax", L0_122, 0)
end

function IncreaseMaxTicket_L3()
  local L0_123
  L0_123 = 9999
  Print("*************INVENTORY: TICKET MAX =  " .. L0_123)
  SetPropertyFloat(_player(), "ETicketMax", L0_123, 0)
end

TotalTicketsInLevel = 0
function ResetTicketsCount(A0_124, A1_125)
  ResetTicketCount()
  TotalTicketsInLevel = A1_125
end

function DisplayMapStats(A0_126)
  local L1_127, L2_128
  L1_127 = math
  L1_127 = L1_127.floor
  L2_128 = GetTicketCount
  L2_128 = L2_128()
  L2_128 = L2_128 * 100
  L2_128 = L2_128 / TotalTicketsInLevel
  L1_127 = L1_127(L2_128)
  L2_128 = "You saved "
  L2_128 = L2_128 .. GremlinCount .. " / " .. TotalGremlins .. [[
 Gremlins!
You collected ]] .. L1_127 .. " % " .. "of the tickets!"
  Display(A0_126, L2_128, 8)
end

function PaintStim(A0_129)
  local L1_130, L2_131, L3_132
  L1_130 = ST_PAINT
  L2_131 = 1
  L3_132 = GetPosition
  L3_132 = L3_132(A0_129)
  StimulusEntity(self, L1_130, L2_131, L3_132, A0_129)
end

PickupLifetime = 15

function SetPickupLifetime(A0_133)
  SetPropertyFloat(A0_133, "Lifetime", ETicketLifetime, 0)
end

function ToggleFollow(A0_134, A1_135)
  QueueBrainEvent(A0_134, BRAIN_ToggleFollowEntity, vector4(0, 0, 0), A1_135)
end

function AI_StartFollowingSpline(A0_136, A1_137)
  DisableMotion(A0_136)
  SplineFollower_TeleportToKnot(A0_136, A1_137)
  SplineFollower_SetDisabled(A0_136, false)
end

function AI_StopFollowingSpline(A0_138)
  SplineFollower_SetDisabled(A0_138, true)
  EnableMotion(A0_138)
end

function GetNPCHitPoints(A0_139)
  return 0
end

function DemoLevelCheckVarSet()
  local L0_140, L1_141
  L0_140 = SetGlobal
  L1_141 = "DemoLevelCheck_Global"
  L0_140(L1_141, GetConfigVariableBool("DemoLevelCheck"))
end

function E3Demo_StreamScalpRock()
  if GetConfigVariableBool("DemoLevelCheck") == true then
    StreamZones(GetPlayer(), "E3_TransToScalpRock")
  end
end

function MovePickupToMickey(A0_142)
  local L1_143, L2_144
  L1_143 = MoveToEntity
  L2_144 = A0_142
  L1_143(L2_144, GetPlayer())
end

function SetVars_MJM_v1_Complete()
  IncrementGlobal("HUB_VisitNumber")
end

function SetVars_Pirates_v1_Complete()
  IncrementGlobal("HUB_VisitNumber")
end

function SetVars_TL_v1_Complete()
  IncrementGlobal("HUB_VisitNumber")
end

function SetVars_HM_v1_Complete()
  IncrementGlobal("HUB_VisitNumber")
end

function SetVars_MJM_v2_Complete()
  IncrementGlobal("HUB_VisitNumber")
end

function SetVars_Pirates_v2_Complete()
  IncrementGlobal("HUB_VisitNumber")
end

function SetVars_HM_v2_Complete()
  IncrementGlobal("HUB_VisitNumber")
end

function SetVars_GV_v2_Complete()
  IncrementGlobal("HUB_VisitNumber")
end

function GetPlayerSpeed()
  return GetVelocity(GetPlayer()):length2()
end

function PlayAndUnlockMovie(A0_145, A1_146)
  SetUnlockedExtra(A1_146, false)
  PlayMovie(GetPlayer(), A0_145)
end

function PlayMovie(A0_147, A1_148)
  PlayMovieInternal(A0_147, A1_148)
end

function AI_SetHomeToCurrent(A0_149, A1_150)
  Wait(5)
  AIBSetTetherLoc(A0_149, GetPosition(A1_150))
  Print("AI Home Reset")
end

function GroupSetAppCulled(A0_151, A1_152)
  ForEachEntityInGroup(SetAppCulled, A1_152)
end

function GroupClearAppCulled(A0_153, A1_154)
  ForEachEntityInGroup(ClearAppCulled, A1_154)
end

function Generic_DoorLocked_SFX()
  AudioPostEventOn(GetPlayer(), "Play_sfx_door_lock")
end

function Mickey_Damage_Audio(A0_155, A1_156)
  if DamageEvent_HasStimulusType(A1_156, ST_PHYSICAL) and DamageEvent_EffectiveAmount(A1_156, ST_PHYSICAL) > 0 then
    AudioPostEventOn(A0_155, "Play_sfx_Mickey_damage_NotThinner")
  elseif DamageEvent_HasStimulusType(A1_156, ST_THINNER) and 0 < DamageEvent_EffectiveAmount(A1_156, ST_THINNER) then
    AudioPostEventOn(A0_155, "Play_sfx_Mickey_damage")
  end
  AudioPostEventOn(A0_155, "Play_vocal_mickey_pipdeath")
end
