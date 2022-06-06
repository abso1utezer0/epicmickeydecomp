function EnterHutShop()
  StartFadeOut(0.5)
  MoveToEntity(GetPlayer(), "HutFrontDoorMarker")
  ToggleCameraOcclusion(GetPlayer(), false)
  SetCameraHintDist(GetPlayer(), 15)
  SetCameraHintYaw(GetPlayer(), 180)
  SetConfigVariableString(GetPlayer(), "FreeCamera_2DMode_Active", true)
  wait(0.5)
  StartFadeIn()
end
function HutShopExit()
  MoveToEntity(GetPlayer(), "HutDoorExitMarker")
end
function EnterFrontTikiShop()
  AudioPostEventOn("TikiHut_LPF", "Set_LPF_Adventureland_Ambient")
  HideTikiMasks()
  MoveToEntity(GetPlayer(), "TikiFrontDoorMarker")
  wait(0.2)
  ToggleCameraOcclusion(GetPlayer(), false)
  SetCameraHintDist(GetPlayer(), 15)
  SetCameraHintYaw(GetPlayer(), 180)
  SetConfigVariableString(GetPlayer(), "FreeCamera_2DMode_Active", true)
end
function EnterBackTikiShop()
  HideTikiMasks()
  StartFadeOut(0.5)
  AudioPostEventOn("TikiHut_LPF", "Set_LPF_Adventureland_Ambient")
  MoveToEntity(GetPlayer(), "TikiBackDoorMarker")
  wait(0.2)
  ToggleCameraOcclusion(GetPlayer(), false)
  SetCameraHintDist(GetPlayer(), 15)
  SetCameraHintYaw(GetPlayer(), 180)
  SetConfigVariableString(GetPlayer(), "FreeCamera_2DMode_Active", true)
  wait(0.5)
  StartFadeIn()
end
function HideTikiMasks()
  if GetGlobal("3 Tiki Masks Got_played") == true then
    Hide(GetEntity("CollectibleMask1"))
    Hide(GetEntity("CollectibleMask2"))
    Hide(GetEntity("CollectibleMask3"))
  end
end
function MyMoveToEntity(A0_0, A1_1, A2_2)
  MoveToEntity(A1_1, A2_2)
end
function ExitFrontTikiShop()
  AudioPostEventOn("TikiHut_LPF", "Reset_LPF_Adventureland_Ambient")
  MoveToEntity(GetPlayer(), "TikiFrontDoorExitMarker")
end
function ExitBackTikiShop()
  AudioPostEventOn("TikiHut_LPF", "Reset_LPF_Adventureland_Ambient")
  MoveToEntity(GetPlayer(), "TikiBackDoorExitMarker")
end
function SetUpMasks()
  if GetGlobal(GotTikiMask1) == 1 then
    Destroy(Mask1Proxy)
  end
  if GetGlobal(GotTikiMask2) == 1 then
    Destroy(Mask2Proxy)
  end
  if GetGlobal(GotTikiMask3) == 1 then
    Destroy(Mask3Proxy)
  end
end
function GetTikiMask(A0_3, A1_4)
  Bark(GetPlayer(), "Script Triggering", 5, "", "GOD")
  IncrementGlobal("HowManyMasksCollected")
  SetGlobal(A1_4, 1)
end
treasure = GetEntity("TreasureMarker")
TreasureFound = false
function CompassTreasureHunt()
  Bark(GetPlayer(), "Script starting", 2, "", "GOD")
  wait(2.5)
  Bark(GetPlayer(), "Entering Loop", 2, "", "GOD")
  wait(2)
  while TreasureFound == false do
    Bark(GetPlayer(), "Inside Loop", 2, "", "GOD")
    if GetDistanceBetweenEntities(GetPlayer(), treasure) == 0 then
      Bark(GetPlayer(), "Treasure Found", 2, "", "GOD")
      Treasurefound = true
    elseif GetDistanceBetweenEntities(GetPlayer(), treasure) > 0 then
      Bark(GetPlayer(), "Treasure is currently" .. GetDistanceBetweenEntities(GetPlayer(), treasure) .. "meters away", 2, "", "GOD")
    end
    wait(3)
  end
end
function RestoreDaisy()
  Bark(GetPlayer(), "Placeholder for Diasy restoration video.", 5, "", "GOD")
end
function DiasyEatsTV()
  local L0_5, L1_6
end
function SetupContraption()
  local L0_7, L1_8
end
function PiratesGateOpening()
  local L0_9, L1_10
end
function SmartStream(A0_11, A1_12)
end
