local L0_0, L1_1
function L0_0(A0_2, A1_3)
  if A1_3 == "start" then
    SetGlobal("Ability_WatchEnabled", 1)
    ForEachEntityInGroup(FireUser1, "ItemsAffectedByWatch")
  else
    SetGlobal("Ability_WatchEnabled", 0)
    ForEachEntityInGroup(FireUser2, "ItemsAffectedByWatch")
  end
end
Player_SetWatchVar = L0_0
function L0_0(A0_4)
  Disable(A0_4)
  wait(0.1)
  AudioPostEventOn("potw_zoneb_dynamic.Sound_Marker 01", "Stop_Tortuga_Island_amb")
  AudioPostEventOn("potw_zoneb_dynamic.WaterWheel", "Stop_waterwheel_axle")
  SetPropertyFloat("potw_shared.SK_Cave_Door2Tortuga2", "BranchPathChance", 1)
  StreamZones(GetPlayer(), "stream_4")
end
PotW_TortugaCave_Streaming = L0_0
function L0_0(A0_5)
  local L1_6
  L1_6 = "potw_shared.Cave_Door2Jungle"
  Bark(GetPlayer(), "Hmm, these weights are heavier than I remember.", 4, " ", "Pirate:")
  wait(5.25)
  Bark(GetPlayer(), "There we go, sorry for the wait.", 3)
  WaitForLevelLoad()
  SetSplineFollowerInitialSpeed(L1_6, 1)
  SplineFollower_StopAtPosition(L1_6, "potw_shared.SK_Cave_Door2Jungle1", "potw_shared.SK_Cave_Door2Jungle2", 1)
end
PotW_TortugaCave_Streaming2 = L0_0
function L0_0()
  local L0_7, L1_8
  L0_7 = "potw_shared.Cave_Door2Jungle"
  L1_8 = "potw_shared.Cave_Door2Tortuga"
  if GetGlobal("potw_zoneb_BagContents") == 1 then
    if GetGlobal("PotW_PlayerHasKeyToVillage") == 0 then
      SetPropertyFloat("potw_shared.SK_Cave_Door2Tortuga2", "BranchPathChance", 0)
      Enable(L1_8)
      Reverse(L1_8)
      SetSpeed(L1_8, 10)
    else
      SetPropertyFloat("potw_shared.SK_Cave_Door2Tortuga2", "BranchPathChance", 1)
    end
  end
  SetSplineFollowerInitialSpeed(L0_7, 10)
  SplineFollower_StopAtPosition(L0_7, "potw_shared.SK_Cave_Door2Jungle1", "potw_shared.SK_Cave_Door2Jungle2", 0)
end
PotW_TortugaCaveDoor_Check = L0_0
function L0_0()
  SetGlobal("PotW_PetePanFilmReel", 1)
  Bark(GetPlayer(), "What a find! Another Film Canister.", 3, "Gus", "Gus:")
end
PotW_PickupCanister2 = L0_0
function L0_0()
  if GetConfigVariableBool("DemoLevelCheck") == true then
    StreamZones(GetPlayer(), "E3_SR")
  else
    WaitForLevelLoad()
    MoveToEntity(GetPlayer(), "potw_zoneL.From2DStart")
    ClearAllCameraAttributes()
    SetConfigVariableString(GetPlayer(), "FreeCamera_2DMode_Active", false)
    StreamZones(GetPlayer(), "stream_13")
  end
end
PotW_2DToSkullRock_Teleport = L0_0
function L0_0()
  local L0_9, L1_10, L2_11, L3_12
  L0_9 = GetGlobal
  L1_10 = "PotW_DaisyParts"
  L0_9 = L0_9(L1_10)
  if L0_9 < 4 then
    L0_9 = ""
    L1_10 = ""
    L2_11 = ""
    L3_12 = ""
    Bark(GetPlayer(), "You have " .. GetGlobal("PotW_DaisyParts") .. " parts of Daisy. Keep Searching!", 2)
    wait(3)
    for _FORV_7_ = 1, 4 do
      if _FORV_7_ == 1 then
        L2_11 = "PotW_DaisyRArm"
        L3_12 = "Daisy's Right Arm"
      elseif _FORV_7_ == 2 then
        L2_11 = "PotW_DaisyBody"
        L3_12 = "Daisy's Body"
      elseif _FORV_7_ == 3 then
        L2_11 = "PotW_DaisyLArm"
        L3_12 = "Daisy's Left Arm"
      elseif _FORV_7_ == 4 then
        L2_11 = "PotW_DaisyHead"
        L3_12 = "Daisy's Head"
      end
    end
    if GetGlobal(L2_11) == 0 then
      if L1_10 > 0 then
        L0_9 = L0_9 .. ", "
      end
      L1_10 = L1_10 + 1
      L0_9 = L0_9 .. L3_12
    end
    Bark(GetPlayer(), "You still need to get " .. DaisyPartsToGet, 3)
  else
    L0_9 = GetGlobal
    L1_10 = "PotW_DaisyParts"
    L0_9 = L0_9(L1_10)
    if L0_9 == 4 then
      L0_9 = Bark
      L1_10 = GetPlayer
      L1_10 = L1_10()
      L2_11 = "You have all of Daisy! Hurry to the docks beneath Tortuga so that you can get back to Mean Streets!"
      L3_12 = 4
      L0_9(L1_10, L2_11, L3_12)
      L0_9 = wait
      L1_10 = 5
      L0_9(L1_10)
      L0_9 = Bark
      L1_10 = GetPlayer
      L1_10 = L1_10()
      L2_11 = "The boat is waiting at the docks."
      L3_12 = 4
      L0_9(L1_10, L2_11, L3_12)
    end
  end
end
PotW_DaisyParts = L0_0
