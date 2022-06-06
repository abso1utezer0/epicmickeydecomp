HUBpath = "Environments/MeanStreets/HUB_"
HUB1 = HUBpath .. "Adv_Potw.gsa"
HUB2 = HUBpath .. "Mean_Adv.gsa"
HUB3 = HUBpath .. "Mean_NOSquare.gsa"
HUB4 = HUBpath .. "Mean_Toon.gsa"
HUB5 = HUBpath .. "MeanStreet.gsa"
HUB6 = HUBpath .. "Mean_Tomorrow.gsa"
HUB7 = HUBpath .. "NOSquare_HM.gsa"
HUB8 = HUBpath .. "Toon_MJM.gsa"
HUB9 = HUBpath .. "Adventureland.gsa"
HUB10 = HUBpath .. "NOSquare.gsa"
HUB11 = HUBpath .. "ToonTown.gsa"
HUB_gv_streamGroups = {
  {HUB2, HUB5},
  {HUB3, HUB5},
  {HUB4, HUB5},
  {HUB6, HUB5},
  {HUB2, HUB9},
  {HUB1, HUB9},
  {HUB3, HUB10},
  {HUB7, HUB10},
  {HUB4, HUB11},
  {HUB8, HUB11}
}
function HUB_StreamZones(A0_0, A1_1)
  local L2_2
  L2_2 = "stream_"
  L2_2 = L2_2 .. A1_1
  StreamZones(A0_0, L2_2)
end
function HUB_StreaminArea(A0_3, A1_4, A2_5)
  local L3_6, L4_7, L5_8, L6_9
  L3_6 = "the portal"
  L4_7 = true
  if A1_4 == "hub_mean_adv.PortalMarker 01" then
    L5_8 = GetGlobal
    L6_9 = "Adventureland_FilmClip"
    L5_8 = L5_8(L6_9)
    if L5_8 == 0 then
      L4_7 = false
      L5_8 = Bark
      L6_9 = GetPlayer
      L6_9 = L6_9()
      L5_8(L6_9, "You don't have access to Adventureland yet.", 5, "Gus", "Gus")
    end
    L3_6 = "Adventureland"
  elseif A1_4 == "hub_mean_tomorrow.PortalMarker 01" then
    L5_8 = GetGlobal
    L6_9 = "Tomorrowland_FilmClip"
    L5_8 = L5_8(L6_9)
    if L5_8 == 0 then
      L4_7 = false
      L5_8 = Bark
      L6_9 = GetPlayer
      L6_9 = L6_9()
      L5_8(L6_9, "You don't have access to Tomorrowland yet.", 5, "Gus", "Gus")
    end
    L3_6 = "Tomorrowland"
  elseif A1_4 == "hub_mean_toon.PortalMarker 01" then
    L5_8 = GetGlobal
    L6_9 = "ToonTown_FilmClip"
    L5_8 = L5_8(L6_9)
    if L5_8 == 0 then
      L4_7 = false
      L5_8 = Bark
      L6_9 = GetPlayer
      L6_9 = L6_9()
      L5_8(L6_9, "You don't have access to Toon Town yet.", 5, "Gus", "Gus")
    end
    L3_6 = "Toon Town"
  elseif A1_4 == "hub_mean_nosquare.PortalMarker 01" then
    L5_8 = GetGlobal
    L6_9 = "NOSquare_FilmClip"
    L5_8 = L5_8(L6_9)
    if L5_8 == 0 then
      L4_7 = false
      L5_8 = Bark
      L6_9 = GetPlayer
      L6_9 = L6_9()
      L5_8(L6_9, "You don't have access to New Orleans Square yet.", 5, "Gus", "Gus")
    end
    L3_6 = "New Orleans Square"
  end
  if L4_7 == true then
    L5_8 = DialogBoxAdvanced
    L6_9 = "Enter "
    L6_9 = L6_9 .. L3_6 .. "?"
    L5_8(L6_9, "Yes", "No")
    L5_8 = wait
    L6_9 = 0.3
    L5_8(L6_9)
    L5_8 = GetDialogResponse
    L5_8 = L5_8()
    if L5_8 == "No" then
      L6_9 = Bark
      L6_9(GetPlayer(), "Cool, come back when you are ready!", 3, "Gus", "Gus")
    elseif L5_8 == "Yes" then
      L6_9 = StopCamControl
      L6_9("hub_meanstreet.Camera_RoundAbout")
      L6_9 = HUB_StreamZones
      L6_9(GetPlayer(), A2_5)
      L6_9 = WaitForLevelLoad
      L6_9()
      L6_9 = MoveToEntity
      L6_9(GetPlayer(), A1_4)
      L6_9 = "hub_meanstreet.PortalExitMarker 0"
      if A1_4 == L6_9 .. "1" or A1_4 == L6_9 .. "2" or A1_4 == L6_9 .. "3" or A1_4 == L6_9 .. "4" then
        StartCamControl("hub_meanstreet.Camera_RoundAbout")
      end
    end
  end
end
function HUB_LoadLevel(A0_10, A1_11)
  DialogBoxAdvanced("Enter the portal?", "Yes", "No")
  wait(0.3)
  if GetDialogResponse() == "No" then
    Bark(GetPlayer(), "Cool, come back when you are ready!", 3, "Gus", "Gus")
  elseif GetDialogResponse() == "Yes" then
    LoadLevel(GetPlayer(), A1_11)
  end
end
function HUB_StreaminAreaCheat(A0_12, A1_13, A2_14)
  local L3_15
  L3_15 = "the portal"
  if A1_13 == "hub_mean_adv.PortalMarker 01" then
    L3_15 = "Adventureland"
  elseif A1_13 == "hub_mean_tomorrow.PortalMarker 01" then
    L3_15 = "Tomorrowland"
  elseif A1_13 == "hub_mean_toon.PortalMarker 01" then
    L3_15 = "Toon Town"
  elseif A1_13 == "hub_mean_nosquare.PortalMarker 01" then
    L3_15 = "New Orleans Square"
  end
  if true == true then
    DialogBoxAdvanced("CHEAT: Enter " .. L3_15 .. "?", "Yes", "No")
    wait(0.3)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "Come back when you are ready, CHEATER!", 3, "Gus", "Gus")
    elseif GetDialogResponse() == "Yes" then
      StopCamControl("hub_meanstreet.Camera_RoundAbout")
      HUB_StreamZones(GetPlayer(), A2_14)
      wait(2)
      MoveToEntity(GetPlayer(), A1_13)
    end
  end
end
