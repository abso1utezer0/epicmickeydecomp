local L0_0, L1_1
L0_0 = ""
InkWellLevelName = L0_0
L0_0 = 0
InkWellPosition = L0_0
L0_0 = 0
InkWellFacing = L0_0
L0_0 = 0
CurrentETickets = L0_0
L0_0 = 0
CurrentHealth = L0_0
L0_0 = 0
CurrentLives = L0_0
L0_0 = 0
CurrentPaint = L0_0
L0_0 = 0
CurrentThinner = L0_0
function L0_0()
  local L0_2
  L0_2 = GetPlayer
  L0_2 = L0_2()
  CurrentPaint = GetPropertyFloat(L0_2, "Paint", 0)
  CurrentThinner = GetPropertyFloat(L0_2, "Thinner", 0)
  CurrentETickets = GetPropertyFloat(L0_2, "ETicket", 0)
  CurrentHealth = GetPropertyInt(L0_2, "Health", 0)
  CurrentLives = GetPropertyInt(L0_2, "Lives", 0)
end
SetCurrentInventory = L0_0
function L0_0(A0_3, A1_4)
  InkWellPosition = GetPosition(A0_3)
  InkWellFacing = GetFacing(A0_3)
  InkWellLevelName = A1_4
end
SetCurrentInkWell = L0_0
function L0_0(A0_5, A1_6)
  SetCurrentInventory()
  SetCurrentInkWell(A0_5, A1_6)
end
SaveInkWell = L0_0
function L0_0(A0_7)
  if InkWellLevelName == "" then
    Print("No InkWell saved")
  else
    SetHealth(A0_7, CurrentHealth)
    SetLives(A0_7, CurrentLives)
    SetItemCount(A0_7, "ETicket", CurrentETickets)
    SetItemCount(A0_7, "Thinner", CurrentThinner)
    SetItemCount(A0_7, "Paint", CurrentPaint)
    LoadLevel(A0_7, InkWellLevelName)
    SetTransformation(A0_7, InkWellPosition, InkWellFacing)
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
RestoreToLastInkWell = L0_0
