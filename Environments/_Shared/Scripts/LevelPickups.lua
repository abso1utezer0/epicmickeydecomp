-- Fully reworked

function ColonelCartoonsPickup(param1)
  FireSequence(GetRelativePrefabEntity(param1, ".ColonelCartoons"), "GP_ColonelCartoons")
  DestroyEntity(param1)
end

function DogTagsPickup(param1)
  FireSequence(GetRelativePrefabEntity(param1, ".DogTags"), "GP_DogTag")
  DestroyEntity(param1)
end

function DonaldArmPickup(param1)
  SetGlobal("NO_donaldpartsfound", GetGlobal("NO_donaldpartsfound") + 1)
  FireSequence(GetRelativePrefabEntity(param1, ".DonaldArmEnt"), "GP_DonaldArm")
  DestroyEntity(param1)
end

function DonaldLegPickup(param1)
  SetGlobal("NO_donaldpartsfound", GetGlobal("NO_donaldpartsfound") + 1)
  FireSequence(GetRelativePrefabEntity(param1, ".DonaldLegEnt"), "GP_DonaldLeg")
  DestroyEntity(param1)
end

function DonaldWaistPickup(param1)
  SetGlobal("NO_donaldpartsfound", GetGlobal("NO_donaldpartsfound") + 1)
  FireSequence(GetRelativePrefabEntity(param1, ".DonaldWaist"), "GP_DonaldWaist")
  DestroyEntity(param1)
end

function GoofyArmPickup(param1)
  SetGlobal("TT_goofypartsfound", GetGlobal("TT_goofypartsfound") + 1)
  FireSequence("sm_tl_zoneb_story.ConversationalTrigger 05", "GP_GoofyArm")
end

function GoofyLegPickup(param1)
  SetGlobal("TT_goofypartsfound", GetGlobal("TT_goofypartsfound") + 1)
  FireSequence("tl_minihub_zoneb.goofy_leg_pickup 01.GoofyLegMarker", "GP_GoofyLeg")
end

function GoofyWaistPickup(param1)
  SetGlobal("TT_goofypartsfound", GetGlobal("TT_goofypartsfound") + 1)
  FireSequence(GetRelativePrefabEntity(param1, ".GoofyWaist"), "GP_GoofyWaist")
end

function GoofyTorsoPickup(param1)
  SetGlobal("TT_goofypartsfound", GetGlobal("TT_goofypartsfound") + 1)
  FireSequence(GetRelativePrefabEntity(param1, ".GoofyWaist"), "GP_GoofyTorso")
end

function JournalPagePickup(param1)
  FireSequence(GetRelativePrefabEntity(param1, ".JournalPage"), "GP_JournalPage")
end

function MurderWeaponPickup(param1)
  FireSequence(GetRelativePrefabEntity(param1, ".MurderWeapon"), "GP_MurderWeapon")
end

function FlowersPickup(param1, param2)
  FireSequence(GetRelativePrefabEntity(param1, ".FlowersPickupMarker"), "GP_FlowersPickup")
end

function FlowersPickupPersist(param1, param2)
  SetGlobal(param2, 1)
end

function PickaxePickup(param1)
  FireSequence(GetRelativePrefabEntity(param1, ".PickaxeMarker"), "GP_Pickaxe")
end