local L0_0, L1_1
function L0_0()
  Print("Destroy Phone Check")
  if GetGlobal("TT_PhoneDestroyed") == 1 then
    DestroyEntity("hub_toontown_mickeyhouse.TalkingPhone 01")
  end
end
DestroyMickeyPhone = L0_0
function L0_0()
  if GetGlobal("MS_MeanStreetProgress") == 2 then
  end
end
RemoveDetective = L0_0
function L0_0()
  Print("Louis check")
  if GetGlobal("NO_NewOrleansProgress") == 2 or GetGlobal("NO_gilbertgate_Played") == 1 or GetGlobal("NO_NewOrleansProgress") == 3 then
    DestroyEntity("hub_nosquare_hidden_dock.LouisInShack")
  end
end
RemoveLouis = L0_0
function L0_0()
  if GetGlobal("NO_storeopened") == 0 then
    Hide("hub_nosquare_metairie_store.Bertrand")
  else
    Unhide("hub_nosquare_metairie_store.Bertrand")
  end
end
RemoveBertrand = L0_0
function L0_0()
  SetGlobal("TT_PhoneGearGet", 1)
  FireSequence("hub_toontown_mickeyhouse.GusConvoTrigger", "TT_PickedUpPhoneGear")
end
PickupPhoneGear = L0_0
function L0_0()
  if GetGlobal("TT_PhoneGearGet") == 1 or GetGlobal("TT_PhoneDestroyed") == 0 then
    ForEachEntityInGroup(DestroyEntity, "TTPhoneGear")
  end
end
UnhidePhoneGear = L0_0
function L0_0()
  if GetGlobal("TT_FlowersforHenrietta_Played") == 0 then
    ForEachEntityInGroup(Hide, "ClaraPins")
  end
end
TT_CheckClarabelleCollectibles = L0_0
function L0_0()
  if GetGlobal("MSS_GiveGear_Played") == 1 then
    DestroyEntity("hub_meanstreet_museum.MuseumDisplaySpark")
    Unhide("hub_meanstreet_museum.MuseumDisplayCutlass")
  end
  if GetGlobal("MSS_TradePhoneGear_Played") == 1 then
    DestroyEntity("MuseumSpark2")
    Unhide("MuseumGear")
  end
  if GetGlobal("MS_MeanStreetProgress") == 1 then
    DestroyEntity("MuseumSpark2")
  end
end
SetMuseumDisplay = L0_0
function L0_0()
  if GetGlobal("MS_MeanStreetProgress") == 1 then
    DestroyEntity("hub_meanstreet_townhall.BlackPete")
  end
end
RemovePete = L0_0
function L0_0()
  Print("Complete Walts Quest")
  if GetGlobal("MSS_Gus_WaltsApartment_Played") == 0 then
    RestrictCutSceneInput()
    wait(0.8)
    FireSequence("GusConvoWalt", "MSS_Gus_WaltsApartment")
    UnrestrictCutSceneInput()
  end
end
CompleteWaltQuest = L0_0
function L0_0()
  Print("****************Attaching trigger to hydrant")
  SetPropertyString("HydrantTrigAttach", "Bone Attach Name", "msusa_2d_bonewellashape2", 0)
end
BoneAttachPlutopia = L0_0
function L0_0()
  if GetGlobal("MS_WaltTicket1") == 1 then
    DestroyEntity("WaltTicket1")
  end
  if GetGlobal("MS_WaltTicket2") == 1 then
    DestroyEntity("WaltTicket2")
  end
end
RemoveWaltTickets = L0_0
function L0_0()
  SetGlobal("MS_WaltTicket1", 1)
end
SetWaltTicket1 = L0_0
function L0_0()
  SetGlobal("MS_WaltTicket2", 1)
end
SetWaltTicket2 = L0_0
