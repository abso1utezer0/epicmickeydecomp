-- Fully reworked

InkWellLevelName = ""
InkWellPosition = 0
InkWellFacing = 0
CurrentETickets = 0
CurrentHealth = 0
CurrentLives = 0
CurrentPaint = 0
CurrentThinner = 0

function SetCurrentInventory()
  CurrentPaint = GetPropertyFloat(GetPlayer(), "Paint", 0)
  CurrentThinner = GetPropertyFloat(GetPlayer(), "Thinner", 0)
  CurrentETickets = GetPropertyFloat(GetPlayer(), "ETicket", 0)
  CurrentHealth = GetPropertyInt(GetPlayer(), "Health", 0)
  CurrentLives = GetPropertyInt(GetPlayer(), "Lives", 0)
end

function SetCurrentInkWell(param1, param2)
  InkWellPosition = GetPosition(param1)
  InkWellFacing = GetFacing(param1)
  InkWellLevelName = param2
end

function SaveInkWell(param1, param2)
  SetCurrentInventory()
  SetCurrentInkWell(param1, param2)
end

function RestoreToLastInkWell(param1)
  if InkWellLevelName == "" then
    Print("No InkWell saved")
  else
    SetHealth(param1, CurrentHealth)
    SetLives(param1, CurrentLives)
    SetItemCount(param1, "ETicket", CurrentETickets)
    SetItemCount(param1, "Thinner", CurrentThinner)
    SetItemCount(param1, "Paint", CurrentPaint)
    LoadLevel(param1, InkWellLevelName)
    SetTransformation(param1, InkWellPosition, InkWellFacing)
  end
  if GusThinnerRising == true then
    Reverse("S3_sw_ZoneZ_static_Scenario6_Thinner 01")
    SetSplineFollowerInitialSpeed("S3_sw_ZoneZ_static_Scenario6_Thinner 01", 100)
    wait(1)
    Display("S3_sw_ZoneZ_static_Scenario6_Thinner 01", "The thinner is rising! Get out of here!", 3)
    wait(2)
    SetSplineFollowerInitialSpeed("S3_sw_ZoneZ_static_Scenario6_Thinner 01", 0.35)
    wait(0.1)
    Reverse("S3_sw_ZoneZ_static_Scenario6_Thinner 01")
  end
end