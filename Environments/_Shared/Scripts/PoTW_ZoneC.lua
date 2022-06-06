local L0_0, L1_1
function L0_0()
  StartFadeOut(1)
  wait(1)
  TeleportToEntity(GetPlayer(), "PotW_ZoneB.ExitFromJail")
  Disable2DSetup()
  ClearAllCameraAttributes()
  CameraReset()
  AudioPostEventOn(GetPlayer(), "Set_State_PotW_Tortuga_Jail_Exit")
  wait(1)
  StartFadeIn(2)
end
PotW_Jail_MoveMickey = L0_0
function L0_0()
  if GetGlobal("PotW_PlayerHasKeyToVillage") == 1 then
    ForEachEntityInGroup(DestroyEntity, "Jail Triggers")
  end
end
potw_jail_visitcheck = L0_0
function L0_0()
  if GetGlobal("PotW_PlayerHasKeyToVillage") == 1 and GetGlobal("potw_Jungle_Cleared") == 0 then
    FireSequence("potw_zonec.ConversationalTrigger 01", "Tortuga_Taken")
  end
end
potw_jail_visitcheck_bark = L0_0
function L0_0()
  if GetGlobal("PotW_Jail_CellKeys") == 0 and GetGlobal("PotW_Jail_CagedPirate1Freed") == 0 then
    ForceSequence("potw_zonec.JailedPirate1", "Jailed_Pirate_Barks")
  elseif GetGlobal("PotW_Jail_CagedPirate1Freed") == 0 and GetGlobal("PotW_Jail_CellKeys") > 0 then
    ForceSequence("potw_zonec.JailedPirate1", "Jailed_Pirate_SetFree")
  else
    ForceSequence("potw_zonec.JailedPirate1", "Jailed_Pirate_Freed")
  end
end
PotW_Jail_CagedPirate1 = L0_0
function L0_0(A0_2)
  SetGlobal("PotW_Jail_CellKeys", GetGlobal("PotW_Jail_CellKeys") - 1)
  SetGlobal("PotW_Jail_CagedPirate1Freed", 1)
  AnimGBSequence("potw_zonec.JailCell1", "opening")
  Unhide("potw_zoneb_dynamic.Lantern01")
  Unhide("potw_zoneb_dynamic.Lantern02")
  Unhide("potw_zoneb_dynamic.Lantern03")
end
PotW_Jail_FreeCagedPirate1 = L0_0
function L0_0()
  if GetGlobal("PotW_Jail_CellKeys") == 0 and GetGlobal("PotW_Jail_CagedPirate2Freed") == 0 then
    ForceSequence("potw_zonec.JailedPirate2", "Jailed_Pirate2_Barks")
  elseif GetGlobal("PotW_Jail_CagedPirate2Freed") == 0 and GetGlobal("PotW_Jail_CellKeys") > 0 then
    ForceSequence("potw_zonec.JailedPirate2", "Jailed_Pirate2_SetFree")
    EnableGlint("potw_zoneb_dynamic.The Well")
  else
    ForceSequence("potw_zonec.JailedPirate2", "Jailed_Pirate2_Freed")
  end
end
PotW_Jail_CagedPirate2 = L0_0
function L0_0()
  SetGlobal("PotW_Jail_CellKeys", GetGlobal("PotW_Jail_CellKeys") - 1)
  SetGlobal("PotW_Jail_CagedPirate2Freed", 1)
  FireUser1("CameraWellDrop")
  wait(1.5)
  AnimGBReset("potw_zoneb_dynamic.The Well")
  AnimGBSequence("potw_zoneb_dynamic.The Well", "unlocked")
end
PotW_Jail_FreeCagedPirate2 = L0_0
function L0_0()
  if GetGlobal("PotW_Jail_CellKeys") == 0 and GetGlobal("PotW_Jail_CagedPirate3Freed") == 0 then
    ForceSequence("potw_zonec.JailedPirate3", "Jailed_Pirate3_Barks")
  elseif GetGlobal("PotW_Jail_CagedPirate3Freed") == 0 and GetGlobal("PotW_Jail_CellKeys") > 0 then
    ForceSequence("potw_zonec.JailedPirate3", "Jailed_Pirate3_SetFree")
  else
    ForceSequence("potw_zonec.JailedPirate3", "Jailed_Pirate3_Freed")
  end
end
PotW_Jail_OpenDaisyCell = L0_0
function L0_0()
  SetGlobal("PotW_Jail_CellKeys", GetGlobal("PotW_Jail_CellKeys") - 1)
  SetGlobal("PotW_Jail_CagedPirate3Freed", 1)
  wait(1.5)
  AnimGBReset("potw_zoneb_dynamic.MansionDoor")
  AnimGBSequence("potw_zoneb_dynamic.MansionDoor", "opening")
end
PotW_Jail_FreeCagedPirate3 = L0_0
