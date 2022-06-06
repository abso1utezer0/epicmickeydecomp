local L0_0, L1_1
function L0_0(A0_2)
  if HasCollectible(GetPrefabData(A0_2).PickupGlobalName) then
    DestroyEntity(A0_2)
  end
  if GetPrefabData(A0_2).PickupGlobalName == "FilmReelDefaultGlobal" then
    Print("You forgot to change your global name in the master prefab object")
  end
end
SetReel = L0_0
function L0_0(A0_3)
  if GetPrefabData(A0_3).CollectibleType == "Unlock" then
    Print("**************This is an unlock")
    Print("**************Hiding Grey Pin")
    Hide(GetRelativePrefabEntity(A0_3, ".Grey_Pin"))
    if PlayerHasUnlockedExtra(GetPrefabData(A0_3).CollectibleName) then
      Print("**************have unlock, removing from world")
      DestroyEntity(A0_3)
    end
  end
  if GetPrefabData(A0_3).CollectibleType == "Pin" then
    Print("**************This is an Pin")
    if GetPrefabData(A0_3).CollectibleType == "Pin" then
      if GetGlobal(GetPrefabData(A0_3).GlobalToSave) == 0 then
        Print("**************Hiding Grey Pin")
        Hide(GetRelativePrefabEntity(A0_3, ".Grey_Pin"))
      elseif GetGlobal(GetPrefabData(A0_3).GlobalToSave) == 1 then
        Print("**************Hiding Pin")
        Hide(GetRelativePrefabEntity(A0_3, ".Pin"))
      else
      end
    else
      Hide(GetRelativePrefabEntity(A0_3, ".Grey_Pin"))
    end
    if true == true then
      DestroyEntity(GetRelativePrefabEntity(A0_3, ".Pin"))
      DestroyEntity(GetRelativePrefabEntity(A0_3, ".Grey_Pin"))
    end
  end
  if GetPrefabData(A0_3).CollectibleType == "Quest" then
    Print("**************This is an quest pickup")
    Print("**************Hiding Grey Pin")
    Hide(GetRelativePrefabEntity(A0_3, ".Grey_Pin"))
    if HasCollectible(GetPrefabData(A0_3).CollectibleName) then
      DestroyEntity(A0_3)
    end
  end
end
SetCollectiblePickup = L0_0
function L0_0(A0_4)
  if HasCollectible(GetPrefabData(A0_4).PickupGlobalName) then
    return
  end
  SetGlobal(GetPrefabData(A0_4).PickupGlobalName, 1)
  SetGlobal("FR_TotalReels", GetGlobal("FR_TotalReels") + 1)
  GiveCollectible(GetPrefabData(A0_4).PickupGlobalName)
end
CollectReel = L0_0
function L0_0()
  GiveCollectible("FR_Steamboat01")
end
SteamboatFilm = L0_0
function L0_0(A0_5)
  if GetPrefabData(A0_5).CollectibleType == "Pin" then
    Print("***********************Giving a gold, silver ,or bronze pin")
    if GetPrefabData(A0_5).GlobalToSave == "none" then
    elseif GetGlobal(GetPrefabData(A0_5).GlobalToSave) == 0 then
      IncrementCollectibleCount(GetPrefabData(A0_5).CollectibleName)
      SetGlobal(GetPrefabData(A0_5).GlobalToSave, 2)
    else
      SetGlobal(GetPrefabData(A0_5).GlobalToSave, 2)
    end
    UpdatePins()
  elseif GetPrefabData(A0_5).CollectibleType == "Quest" then
    Print("**************giving a collectable")
    GiveCollectible(GetPrefabData(A0_5).CollectibleName)
  elseif GetPrefabData(A0_5).CollectibleType == "Unlock" then
    Print("**************giving a unlock")
    SetUnlockedExtra(GetPrefabData(A0_5).CollectibleName)
  end
  if GetPrefabData(A0_5).EndFunction == "none" then
  else
    Print("*********************** Mickey_Open_Chest(): data.EndFunction != none")
    FireThread(_G[GetPrefabData(A0_5).EndFunction])
  end
end
ObtainCollectible = L0_0
