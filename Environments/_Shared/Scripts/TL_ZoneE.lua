-- Fully reworked

function TL_Pump1_Hit()
  TimerReset("tl_minihub_zonee.LogicTimerMarker 06")
  if GetGlobal("TL_Pump1_Value") == 0 then
    SetGlobal("TL_Pump1_Value", 1)
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_PaintLevel_01 01")
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_Crusher_01 01")
    Bark(GetPlayer(), "Filling", 1)
  end
end

function TL_Pump1_Resume()
  if GetGlobal("TL_Pump1_Value") == 1 then
    SetGlobal("TL_Pump1_Value", 0)
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_PaintLevel_01 01")
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_Crusher_01 01")
    Bark(GetPlayer(), "Resuming", 1)
  end
end

function TL_Pump2_Hit()
  TimerReset("tl_minihub_zonee.LogicTimerMarker 07")
  if GetGlobal("TL_Pump2_Value") == 0 then
    SetGlobal("TL_Pump2_Value", 1)
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_PaintLevel_02 01")
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_Crusher_02 01")
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_Crusher_01 01")
    Bark(GetPlayer(), "Filling", 1)
  end
end

function TL_Pump2_Resume()
  if GetGlobal("TL_Pump2_Value") == 1 then
    SetGlobal("TL_Pump2_Value", 0)
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_PaintLevel_02 01")
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_Crusher_02 01")
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_Crusher_01 01")
    Bark(GetPlayer(), "Resuming", 1)
  end
end

function TL_Pump3_Hit()
  TimerReset("tl_minihub_zonee.LogicTimerMarker 08")
  if GetGlobal("TL_Pump3_Value") == 0 then
    SetGlobal("TL_Pump3_Value", 1)
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_PaintLevel_03 01")
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_Crusher_03 01")
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_Crusher_02 01")
    Bark(GetPlayer(), "Filling", 1)
  end
end

function TL_Pump3_Resume()
  if GetGlobal("TL_Pump3_Value") == 1 then
    SetGlobal("TL_Pump3_Value", 0)
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_PaintLevel_03 01")
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_Crusher_03 01")
    Reverse("tl_minihub_zonee.TL_Minihub_ZoneE_Crusher_02 01")
    Bark(GetPlayer(), "Resuming", 1)
  end
end

function TL_Pump_PaintIncrease()
  TimerReset("tl_minihub_zonee.LogicTimerMarker 06")
  Bark(GetPlayer(), "1 Adding", 1)
  SetGlobal("TL_Pump1_Value", GetGlobal("TL_Pump1_Value") + 0.05)
  TL_Pump1()
end

function TL_Pump_PaintDecrease()
  SetGlobal("TL_Pump1_Value", GetGlobal("TL_Pump1_Value") - 0.05)
  TL_Pump1()
end

function TL_Pump1()
  SplineFollower_StopAtPosition("TL_Meter1", "TL_TopKnot1", "TL_BottomKnot1", 1 - GetGlobal("TL_Pump1_Value"))
  SplineFollower_StopAtPosition("TL_Crusher1", "TL_WeightBottomKnot1", "TL_WeightTopKnot1", 1 - GetGlobal("TL_Pump1_Value"))
end

function TL_Pump2()
  Bark(DummyDisplay, "2 Working!")
  SplineFollower_StopAtPosition("TL_Meter2", "TL_TopKnot2", "TL_BottomKnot2", 1 - GetGlobal("TL_Pump2_Value"))
  SplineFollower_StopAtPosition("TL_Crusher2", "TL_WeightBottomKnot2", "TL_WeightTopKnot2", 1 - GetGlobal("TL_Pump2_Value"))
end

function TL_Pump3()
  Bark(DummyDisplay, "3 Working!")
  SplineFollower_StopAtPosition("TL_Meter3", "TL_TopKnot3", "TL_BottomKnot3", 1 - GetGlobal("TL_Pump3_Value"))
  SplineFollower_StopAtPosition("TL_Crusher3", "TL_WeightBottomKnot3", "TL_WeightTopKnot3", 1 - GetGlobal("TL_Pump3_Value"))
end

function Electric_HazardZap_ConstantZoneE1(param1)
  local var1
  for var1 = 1, 1 do
    Hide(param1)
    wait(0.5)
    Unhide(param1)
    wait(0.5)
  end
end

function Electric_HazardZap_ConstantZoneE2(param1)
  local var1
  for var1 = 1, 1 do
    Hide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_electricarc 05")
    Hide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_electricarc 06")
    Hide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_electricarc 07")
    wait(0.8)
    Unhide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_electricarc 05")
    Unhide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_electricarc 06")
    Unhide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_electricarc 07")
    wait(0.2)
  end
end

function Electric_HazardZap_ConstantZoneE3(param1)
  local var1
  for var1 = 1, 1 do
    Hide(param1)
    wait(0.8)
    Unhide(param1)
    wait(0.2)
  end
end

function Electric_HazardZap_ConstantZoneE4(param1)
  local var1
  for var1 = 1, 1 do
    Hide(param1)
    wait(0.5)
    Unhide(param1)
    wait(0.5)
  end
end

function TL_CartStop1TriggerOn()
  SetGlobal("TL_CartStop1Trigger", 1)
end

function TL_CartStop1ToonThinned()
  SetGlobal("TL_CartStop1Toon", 1)
end

function TL_CartStop1TriggerOff()
  SetGlobal("TL_CartStop1Trigger", 0)
end

function TL_CartStop1ToonPainted()
  SetGlobal("TL_CartStop1Toon", 0)
end

function TL_CartStop1()
  if GetGlobal("TL_CartStop1Trigger") == 1 and GetGlobal("TL_CartStop1Toon") == 1 then
    Disable("tl_minihub_zonee.TL_Minihub_People_Mover_01 01")
  elseif GetGlobal("TL_CartStop1Trigger") == 1 and GetGlobal("TL_CartStop1Toon") == 0 then
    Enable("tl_minihub_zonee.TL_Minihub_People_Mover_01 01")
  end
end

function TL_CartStop2TriggerOn()
  SetGlobal("TL_CartStop2Trigger", 1)
end

function TL_CartStop2ToonThinned()
  SetGlobal("TL_CartStop2Toon", 1)
end

function TL_CartStop2TriggerOff()
  SetGlobal("TL_CartStop2Trigger", 0)
end

function TL_CartStop2ToonPainted()
  SetGlobal("TL_CartStop2Toon", 0)
end

function TL_CartStop2()
  if GetGlobal("TL_CartStop2Trigger") == 1 and GetGlobal("TL_CartStop2Toon") == 1 then
    Disable("tl_minihub_zonee.TL_Minihub_People_Mover_01 01")
  elseif GetGlobal("TL_CartStop2Trigger") == 1 and GetGlobal("TL_CartStop2Toon") == 0 then
    Enable("tl_minihub_zonee.TL_Minihub_People_Mover_01 01")
  end
end

function TL_CartStop3TriggerOn()
  SetGlobal("TL_CartStop3Trigger", 1)
end

function TL_CartStop3ToonThinned()
  SetGlobal("TL_CartStop3Toon", 1)
end

function TL_CartStop3TriggerOff()
  SetGlobal("TL_CartStop3Trigger", 0)
end

function TL_CartStop3ToonPainted()
  SetGlobal("TL_CartStop3Toon", 0)
end

function TL_CartStop3()
  if GetGlobal("TL_CartStop3Trigger") == 1 and GetGlobal("TL_CartStop3Toon") == 1 then
    Disable("tl_minihub_zonee.TL_Minihub_People_Mover_01 01")
  elseif GetGlobal("TL_CartStop3Trigger") == 1 and GetGlobal("TL_CartStop3Toon") == 0 then
    Enable("tl_minihub_zonee.TL_Minihub_People_Mover_01 01")
  end
end

function TL_CartStop4TriggerOn()
  SetGlobal("TL_CartStop4Trigger", 1)
end

function TL_CartStop4ToonThinned()
  SetGlobal("TL_CartStop4Toon", 1)
end

function TL_CartStop4TriggerOff()
  SetGlobal("TL_CartStop4Trigger", 0)
end

function TL_CartStop4ToonPainted()
  SetGlobal("TL_CartStop4Toon", 0)
end

function TL_CartStop4()
  if GetGlobal("TL_CartStop4Trigger") == 1 and GetGlobal("TL_CartStop4Toon") == 1 then
    Disable("tl_minihub_zonee.TL_Minihub_People_Mover_01 01")
  elseif GetGlobal("TL_CartStop4Trigger") == 1 and GetGlobal("TL_CartStop4Toon") == 0 then
    Enable("tl_minihub_zonee.TL_Minihub_People_Mover_01 01")
  end
end

function TL_GremlinSave()
  Bark(GetPlayer(), "Oh hi! I kinda gave up getting out of here after that thing pinned me in here.", 5)
  wait(5)
  Bark(GetPlayer(), "Lemme just hit this valve before I head out. You better hurry!", 5)
  wait(5)
  Disable("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 01")
  Disable("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 02")
  Disable("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 03")
  Disable("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 04")
  Disable("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 05")
  Disable("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 05")
  Disable("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 07")
  Disable("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 06")
  Disable("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 14")
  Disable("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 13")
  TeleportToEntity("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 01", "tl_minihub_zonee.SplineKnot 15")
  TeleportToEntity("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 02", "tl_minihub_zonee.SplineKnot 13")
  TeleportToEntity("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 03", "tl_minihub_zonee.SplineKnot 11")
  TeleportToEntity("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 04", "tl_minihub_zonee.SplineKnot 18")
  TeleportToEntity("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 05", "tl_minihub_zoned1.SplineKnot 19")
  Hide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 05")
  Hide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 07")
  Hide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 06")
  Hide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 14")
  Hide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 13")
  wait(20)
  Bark(GetPlayer(), "I'm losing control of the steam!", 5)
  wait(5)
  Enable("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 01")
  Enable("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 02")
  Enable("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 03")
  Enable("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 04")
  Enable("tl_minihub_zonee.TL_Minihub_ZoneE_Steam_Plate_01 05")
  Unhide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 05")
  Unhide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 07")
  Unhide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 06")
  Unhide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 14")
  Unhide("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 13")
  Enable("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 05")
  Enable("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 07")
  Enable("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 06")
  Enable("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 14")
  Enable("tl_minihub_zonee.TL_Minihub_ZoneE_TEMP_steamjet 13")
  DestroyEntity("tl_minihub_zonee.Gremlin_Static 01")
end