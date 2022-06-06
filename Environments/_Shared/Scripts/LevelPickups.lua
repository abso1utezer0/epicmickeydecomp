local L0_0, L1_1
function L0_0(A0_2)
  FireSequence(GetRelativePrefabEntity(A0_2, ".ColonelCartoons"), "GP_ColonelCartoons")
  DestroyEntity(A0_2)
end
ColonelCartoonsPickup = L0_0
function L0_0(A0_3)
  FireSequence(GetRelativePrefabEntity(A0_3, ".DogTags"), "GP_DogTag")
  DestroyEntity(A0_3)
end
DogTagsPickup = L0_0
function L0_0(A0_4)
  SetGlobal("NO_donaldpartsfound", GetGlobal("NO_donaldpartsfound") + 1)
  FireSequence(GetRelativePrefabEntity(A0_4, ".DonaldArmEnt"), "GP_DonaldArm")
  DestroyEntity(A0_4)
end
DonaldArmPickup = L0_0
function L0_0(A0_5)
  SetGlobal("NO_donaldpartsfound", GetGlobal("NO_donaldpartsfound") + 1)
  FireSequence(GetRelativePrefabEntity(A0_5, ".DonaldLegEnt"), "GP_DonaldLeg")
  DestroyEntity(A0_5)
end
DonaldLegPickup = L0_0
function L0_0(A0_6)
  SetGlobal("NO_donaldpartsfound", GetGlobal("NO_donaldpartsfound") + 1)
  FireSequence(GetRelativePrefabEntity(A0_6, ".DonaldWaist"), "GP_DonaldWaist")
  DestroyEntity(A0_6)
end
DonaldWaistPickup = L0_0
function L0_0(A0_7)
  SetGlobal("TT_goofypartsfound", GetGlobal("TT_goofypartsfound") + 1)
  FireSequence("sm_tl_zoneb_story.ConversationalTrigger 05", "GP_GoofyArm")
end
GoofyArmPickup = L0_0
function L0_0(A0_8)
  SetGlobal("TT_goofypartsfound", GetGlobal("TT_goofypartsfound") + 1)
  FireSequence("tl_minihub_zoneb.goofy_leg_pickup 01.GoofyLegMarker", "GP_GoofyLeg")
end
GoofyLegPickup = L0_0
function L0_0(A0_9)
  SetGlobal("TT_goofypartsfound", GetGlobal("TT_goofypartsfound") + 1)
  FireSequence(GetRelativePrefabEntity(A0_9, ".GoofyWaist"), "GP_GoofyWaist")
end
GoofyWaistPickup = L0_0
function L0_0(A0_10)
  SetGlobal("TT_goofypartsfound", GetGlobal("TT_goofypartsfound") + 1)
  FireSequence(GetRelativePrefabEntity(A0_10, ".GoofyWaist"), "GP_GoofyTorso")
end
GoofyTorsoPickup = L0_0
function L0_0(A0_11)
  FireSequence(GetRelativePrefabEntity(A0_11, ".JournalPage"), "GP_JournalPage")
end
JournalPagePickup = L0_0
function L0_0(A0_12)
  FireSequence(GetRelativePrefabEntity(A0_12, ".MurderWeapon"), "GP_MurderWeapon")
end
MurderWeaponPickup = L0_0
function L0_0(A0_13, A1_14)
  FireSequence(GetRelativePrefabEntity(A0_13, ".FlowersPickupMarker"), "GP_FlowersPickup")
end
FlowersPickup = L0_0
function L0_0(A0_15, A1_16)
  SetGlobal(A1_16, 1)
end
FlowersPickupPersist = L0_0
function L0_0(A0_17)
  FireSequence(GetRelativePrefabEntity(A0_17, ".PickaxeMarker"), "GP_Pickaxe")
end
PickaxePickup = L0_0
