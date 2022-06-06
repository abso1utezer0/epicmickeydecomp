local L0_0, L1_1
function L0_0(A0_2)
  local L1_3, L2_4
  L1_3 = GetPrefabData
  L2_4 = A0_2
  L1_3 = L1_3(L2_4)
  L2_4 = GetRelativePrefabEntity
  L2_4 = L2_4(A0_2, ".Chest")
  Print("*************** Mickey_Open_Chest_SetUp: " .. L1_3.Collectible)
  if L1_3.Collectible == "Gold_Pin" or L1_3.Collectible == "Silver_Pin" or L1_3.Collectible == "Bronze_Pin" then
    Print("****************************** Mickey_Open_Chest_SetUp: data.GlobalToCheck (Pin)= " .. L1_3.GlobalToCheck)
    if GetGlobal(L1_3.GlobalToCheck) == 2 then
      Print("********************** Mickey_Open_Chest_SetUp: GlobalToCheck == 2 (Already recieved this pin)")
      L1_3.ChestOpened = "True"
    elseif GetGlobal(L1_3.GlobalToCheck) == "None" then
      Print("********************** Mickey_Open_Chest_SetUp: Global Data Not Set Up.")
    end
  elseif L1_3.Collectible == "NoCollectible" then
    Print("****************************** Mickey_Open_Chest_SetUp: data.GlobalToCheck (NoCollectible)= " .. L1_3.GlobalToCheck)
    if GetGlobal(L1_3.GlobalToCheck) == 1 then
      Print("********************** Mickey_Open_Chest_SetUp: GlobalToCheck == 1")
      L1_3.ChestOpened = "True"
    elseif GetGlobal(L1_3.GlobalToCheck) == "None" then
      Print("********************** Mickey_Open_Chest_SetUp: Global Data Not Set Up.")
    end
  elseif HasCollectible(L1_3.Collectible) then
    L1_3.ChestOpened = "True"
  end
  if L1_3.ChestOpened == "True" then
    Print("********************** Mickey_Open_Chest_SetUp: ChestOpened == true")
    AnimGBSequence(L2_4, "Idle_Open")
    SetPropertyFloat(L2_4, "UsableRadius", 0)
  end
end
Mickey_Open_Chest_SetUp = L0_0
function L0_0(A0_5)
  if GetPrefabData(A0_5).ChestOpened == "False" then
    SetPropertyFloat(GetRelativePrefabEntity(A0_5, ".Chest"), "UsableRadius", 2)
  end
end
Mickey_Chest_PaintedIn = L0_0
function L0_0(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L9_15, L10_16, L11_17
  L1_7 = GetPrefabData
  L2_8 = A0_6
  L1_7 = L1_7(L2_8)
  L2_8 = Print
  L3_9 = "*********************** Mickey_Open_Chest()"
  L2_8(L3_9)
  L2_8 = GetRelativePrefabEntity
  L3_9 = A0_6
  L4_10 = ".Camera"
  L2_8 = L2_8(L3_9, L4_10)
  L3_9 = GetRelativePrefabEntity
  L4_10 = A0_6
  L5_11 = ".Spawner_ItemGround"
  L3_9 = L3_9(L4_10, L5_11)
  L4_10 = GetRelativePrefabEntity
  L5_11 = A0_6
  L6_12 = ".Player_Marker"
  L4_10 = L4_10(L5_11, L6_12)
  L5_11 = GetRelativePrefabEntity
  L6_12 = A0_6
  L7_13 = ".Item_Get"
  L5_11 = L5_11(L6_12, L7_13)
  L6_12 = GetRelativePrefabEntity
  L7_13 = A0_6
  L8_14 = ".Item_Animation"
  L6_12 = L6_12(L7_13, L8_14)
  L7_13 = ""
  L8_14 = GetRelativePrefabEntity
  L9_15 = A0_6
  L10_16 = ".Grey_Pin_Spawner"
  L8_14 = L8_14(L9_15, L10_16)
  L9_15 = PauseAllAI
  L9_15()
  L9_15 = RestrictCutSceneInput
  L9_15()
  L9_15 = GetFacing
  L10_16 = L3_9
  L9_15 = L9_15(L10_16)
  L10_16 = GetPosition
  L11_17 = L3_9
  L10_16 = L10_16(L11_17)
  L11_17 = SetTransformation
  L11_17(L8_14, L10_16, L9_15)
  L11_17 = L1_7.SequenceType
  if L11_17 == "Chest" then
    L11_17 = Print
    L11_17("*********************** Mickey_Open_Chest() -- Firing Chest Sequence")
    L11_17 = GetRelativePrefabEntity
    L11_17 = L11_17(A0_6, ".Chest")
    L7_13 = L11_17
  end
  L11_17 = SetPropertyBool
  L11_17(L7_13, "InvulnerableToPaintThinner", true)
  L11_17 = ForEachEntityInGroup
  L11_17(DestroyEntity, "Spawned_Item_Get")
  L11_17 = L1_7.SequenceType
  if L11_17 == "Chest" then
    L11_17 = SetPropertyFloat
    L11_17(L7_13, "UsableRadius", 0)
    L11_17 = AnimGBSetIdle
    L11_17(L7_13, false)
    L11_17 = DoStinger
    L11_17("TreasureChest", 10)
  end
  L11_17 = AnimGBSetIdle
  L11_17(L2_8, false)
  L11_17 = GetPosition
  L11_17 = L11_17(L3_9)
  StartFadeOut(0.25)
  wait(0.5)
  if L1_7.SaveCam == "true" then
    SaveCurrentCameraOverride()
  end
  if L1_7.DisableCamera == "false" or L1_7.DisableCamera == "noexit" then
    GrabCameraNif(L2_8, nil, 0, 0)
  end
  if L1_7.SequenceType == "Chest" then
    AnimGBReset(L2_8)
    AnimGBSequence(L2_8, "mickey_idle_paint_acquireItem_chest_cam")
  end
  TeleportToEntity(GetPlayer(), L4_10)
  wait(0.1)
  StartFadeInNoHUD()
  if L1_7.SequenceType == "WorldItem" then
    AnimEvent(GetPlayer(), EVENT_Special_8)
  elseif L1_7.SequenceType == "Chest" then
    AnimEvent(GetPlayer(), EVENT_Special_9)
    AnimGBReset(L7_13)
    AnimGBSequence(L7_13, "Chest_Open")
    Print("*********************** Mickey_Open_Chest() -- Enable Spawner")
    if GetGlobal(L1_7.GlobalToCheck) == 1 then
      Enable(L8_14)
    else
      Enable(L3_9)
    end
    wait(1)
  end
  wait(3.5)
  wait(0.767)
  ForEachEntityInGroup(DestroyEntity, "Spawned_Item_Get")
  if L1_7.Collectible == "Gold_Pin" or L1_7.Collectible == "Silver_Pin" or L1_7.Collectible == "Bronze_Pin" then
    if GetGlobal(L1_7.GlobalToCheck) == 0 then
      Print("---------------------incrementing pins")
      IncrementCollectibleCount(L1_7.Collectible)
    end
    SetGlobal(L1_7.GlobalToCheck, 2)
    UpdatePins()
  elseif L1_7.Collectible == "NoCollectible" then
    SetGlobal(L1_7.GlobalToCheck, 1)
  else
    GiveCollectible(L1_7.Collectible)
    if L1_7.GlobalToCheck == "None" then
    else
      SetGlobal(L1_7.GlobalToCheck, 1)
    end
  end
  L1_7.ChestOpened = "True"
  wait(1.9)
  if L1_7.DisableCamera == "false" then
    ReleaseCamera(CAMERA_SAMEPLACE_TRANSITION, 1)
  end
  if L1_7.SaveCam == "true" then
    LoadSavedCameraOverride()
  end
  Print("*********************** Mickey_Open_Chest(): data.EndFunction = " .. L1_7.EndFunction)
  if L1_7.EndFunction == "none" then
  else
    Print("*********************** Mickey_Open_Chest(): data.EndFunction != none")
    FireThread(_G[L1_7.EndFunction])
  end
  if L1_7.DisableCamera == "noexit" then
  else
    ShowHud()
  end
  UnrestrictCutSceneInput()
  SetPropertyBool(L7_13, "InvulnerableToPaintThinner", false)
  AnimGBSetIdle(L2_8, true)
  UnpauseAllAI()
  SetTransformation(L3_9, L11_17, vector4(0, 0, 0))
  if L1_7.SequenceType == "Chest" then
    wait(5)
    AnimGBSetIdle(L7_13, true)
  end
end
Mickey_Open_Chest = L0_0
L0_0 = ""
ItemAnimationEntity = L0_0
L0_0 = false
ItemAnimationEntity_Got = L0_0
function L0_0(A0_18)
  Print("************************************* - Mickey_Find_ItemAnimationEntity Started")
  ItemAnimationEntity = A0_18
  ItemAnimationEntity_Got = true
  Print("************************************* - Mickey_Find_ItemAnimationEntity Finished")
end
Mickey_Find_ItemAnimationEntity = L0_0
function L0_0(A0_19)
  Print("************************************* - Mickey_Attach_Item_To_Animation Started")
  while ItemAnimationEntity_Got == false do
    wait(0.001)
  end
  SetParentEntity(A0_19, ItemAnimationEntity)
  SetPropertyString(A0_19, "Bone Attach Name", "VFX_01", 0)
  ItemAnimationEntity_Got = false
  Print("************************************* - Mickey_Attach_Item_To_Animation Finished")
end
Mickey_Attach_Item_To_Animation = L0_0
function L0_0(A0_20, A1_21, A2_22)
  local L3_23, L4_24, L5_25, L6_26, L7_27
  L3_23 = GetPrefabData
  L4_24 = A0_20
  L3_23 = L3_23(L4_24)
  L4_24 = GetRelativePrefabEntity
  L5_25 = A0_20
  L6_26 = ".Camera"
  L4_24 = L4_24(L5_25, L6_26)
  L5_25 = GetRelativePrefabEntity
  L6_26 = A0_20
  L7_27 = ".Spawner_ItemGround"
  L5_25 = L5_25(L6_26, L7_27)
  L6_26 = Print
  L7_27 = "*********************** Mickey_Receive_Item_NPC() - Firing Store Sequence"
  L6_26(L7_27)
  L6_26 = AnimGBSetIdle
  L7_27 = L4_24
  L6_26(L7_27, false)
  L6_26 = GetPosition
  L7_27 = L5_25
  L6_26 = L6_26(L7_27)
  L7_27 = L3_23.Position2D
  if L7_27 == "Left" then
    L7_27 = AnimGBSequence
    L7_27(L4_24, "mickey_idle_paint_acquireItem_chest_cam")
  else
    L7_27 = L3_23.Position2D
    if L7_27 == "Right" then
      L7_27 = AnimGBSequence
      L7_27(L4_24, "mickey_idle_paint_acquireItem_chest_cam")
    end
  end
  L7_27 = Mickey_PickItemToSpawn
  L7_27 = L7_27(A0_20, A1_21)
  if A2_22 == nil then
    Mickey_Spawn_ItemTransferFX(A0_20)
    AudioPostEventOn(GetPlayer(), "Play_sfx_UI_NPC_GiveItem")
  else
    Mickey_GetItem_ClearItem(A0_20, A2_22)
  end
  wait(0.3)
  SetPropertyInt(L5_25, "Index To Spawn", L7_27, 0)
  SetPropertyVector(L5_25, "Spawn Offset", vector4(0, L3_23.Item_Hoffset, 0), 0)
  Enable(L5_25)
end
Mickey_Receive_Item_NPC = L0_0
function L0_0(A0_28, A1_29)
  Print("*********************** Mickey_PickItemToSpawn() - Start")
  if A1_29 == GetPrefabData(A0_28).Item1 then
    Print("*********************** Mickey_PickItemToSpawn() - item == data.item1  RETURNING 1")
    return 1
  elseif A1_29 == GetPrefabData(A0_28).Item2 then
    Print("*********************** Mickey_PickItemToSpawn() - item == data.item2  RETURNING 2")
    return 2
  elseif A1_29 == GetPrefabData(A0_28).Item3 then
    Print("*********************** Mickey_PickItemToSpawn() - item == data.item3  RETURNING 3")
    return 3
  elseif A1_29 == GetPrefabData(A0_28).Item4 then
    Print("*********************** Mickey_PickItemToSpawn() - item == data.item4  RETURNING 4")
    return 4
  elseif A1_29 == GetPrefabData(A0_28).Item5 then
    Print("*********************** Mickey_PickItemToSpawn() - item == data.item5  RETURNING 5")
    return 5
  elseif A1_29 == GetPrefabData(A0_28).Item6 then
    Print("*********************** Mickey_PickItemToSpawn() - item == data.item6  RETURNING 6")
    return 6
  elseif A1_29 == GetPrefabData(A0_28).Item7 then
    Print("*********************** Mickey_PickItemToSpawn() - item == data.item7  RETURNING 7")
    return 7
  elseif A1_29 == GetPrefabData(A0_28).Item8 then
    Print("*********************** Mickey_PickItemToSpawn() - item == data.item8  RETURNING 8")
    return 8
  elseif A1_29 == GetPrefabData(A0_28).Item9 then
    Print("*********************** Mickey_PickItemToSpawn() - item == data.item9  RETURNING 9")
    return 9
  elseif A1_29 == GetPrefabData(A0_28).Item10 then
    Print("*********************** Mickey_PickItemToSpawn() - item == data.item10  RETURNING 10")
    return 10
  end
end
Mickey_PickItemToSpawn = L0_0
function L0_0(A0_30)
  local L1_31
  L1_31 = Print
  L1_31("*********************** Mickey_Spawn_ItemTransferFX() - SPAWN ITEM TRANSFER FX")
  L1_31 = GetRelativePrefabEntity
  L1_31 = L1_31(A0_30, ".Spawner_ItemGround")
  SetPropertyVector(L1_31, "Spawn Offset", vector4(0, 0, 0), 0)
  SetPropertyInt(L1_31, "Index To Spawn", 0, 0)
  Enable(L1_31)
  wait(0.5)
end
Mickey_Spawn_ItemTransferFX = L0_0
function L0_0(A0_32, A1_33)
  local L2_34
  L2_34 = Print
  L2_34("*********************** Mickey_GetItem_ClearItem() - Clearing Extra Items")
  L2_34 = Mickey_PickItemToSpawn
  L2_34 = L2_34(A0_32, A1_33)
  Mickey_Spawn_ItemTransferFX(A0_32)
  AudioPostEventOn(GetPlayer(), "Play_sfx_UI_NPC_GiveItem")
  DestroyEntity(".Item" .. L2_34)
end
Mickey_GetItem_ClearItem = L0_0
function L0_0(A0_35)
  local L1_36, L2_37
  L1_36 = Print
  L2_37 = "*********************** Mickey_ReceieveItem_Quick() - Clearing Extra Items"
  L1_36(L2_37)
  L1_36 = GetRelativePrefabEntity
  L2_37 = A0_35
  L1_36 = L1_36(L2_37, ".Camera")
  L2_37 = GetRelativePrefabEntity
  L2_37 = L2_37(A0_35, ".Spawner_ItemGround")
  RestrictCutSceneInput()
  SetTransformation(L1_36, GetPosition(GetPlayer()), vector4(0, 0, 0))
  AnimGBReset(L1_36)
  AnimGBSequence(L1_36, "mickey_idle_paint_acquireItem_chest_cam")
  wait(0.2)
  StartFadeInNoHUD(0.5)
  GrabCameraNif(L1_36, nil, 0, 0)
  AnimEvent(GetPlayer(), EVENT_Special_8)
  SetPropertyVector(L2_37, "Spawn Offset", vector4(0, 0, 0), 0)
  SetTransformation(L2_37, GetPosition(GetPlayer()) + vector4(0, 1.25, 0), vector4(0, 0, 0))
  wait(0.75)
  SetPropertyInt(L2_37, "Index To Spawn", 1, 0)
  Enable(L2_37)
  wait(1)
  if data.Collectible == "Gold_Pin" or data.Collectible == "Silver_Pin" or data.Collectible == "Bronze_Pin" then
    if GetGlobal(data.GlobalToCheck) == 0 then
      IncrementCollectibleCount(data.Collectible)
    end
    SetGlobal(data.GlobalToCheck, 2)
    UpdatePins()
  elseif data.Collectible == "NoCollectible" then
    SetGlobal(data.GlobalToCheck, 1)
  else
    GiveCollectible(data.Collectible)
    if data.GlobalToCheck == "None" then
    else
      SetGlobal(data.GlobalToCheck, 1)
    end
  end
  wait(1)
  StartFadeOut(1)
  wait(1)
  ReleaseCamera(CAMERA_SAMEPLACE_TRANSITION, 1)
  ForEachEntityInGroup(DestroyEntity, "Spawned_Item_Get")
  StartFadeIn(1)
  UnrestrictCutSceneInput()
  AnimGBSetIdle(L1_36, true)
  if data.EndFunction == "none" then
  else
    FireThread(_G[data.EndFunction])
  end
end
Mickey_ReceieveItem_Quick = L0_0
function L0_0(A0_38, A1_39)
  local L2_40, L3_41, L4_42, L5_43
  L2_40 = Print
  L3_41 = "*********************** Mickey_GiveItemToCharacter() - Start"
  L2_40(L3_41)
  L2_40 = GetPrefabData
  L3_41 = A0_38
  L2_40 = L2_40(L3_41)
  L3_41 = GetRelativePrefabEntity
  L4_42 = A0_38
  L5_43 = ".Camera"
  L3_41 = L3_41(L4_42, L5_43)
  L4_42 = GetRelativePrefabEntity
  L5_43 = A0_38
  L4_42 = L4_42(L5_43, ".Spawner_ItemGround")
  L5_43 = AnimGBSetIdle
  L5_43(L3_41, false)
  L5_43 = L2_40.SequenceType
  if L5_43 == "Store" then
    L5_43 = Print
    L5_43("*********************** Mickey_GiveItemToCharacter() - Store")
    L5_43 = L2_40.Position2D
    if L5_43 == "Left" then
      L5_43 = AnimGBSequence
      L5_43(L3_41, "mickey_idle_paint_acquireItem_chest_cam")
    else
      L5_43 = L2_40.Position2D
      if L5_43 == "Right" then
        L5_43 = AnimGBSequence
        L5_43(L3_41, "mickey_idle_paint_acquireItem_chest_cam")
      end
    end
  end
  L5_43 = Mickey_PickItemToSpawn
  L5_43 = L5_43(A0_38, A1_39)
  wait(0.3)
  Mickey_Spawn_ItemTransferFX(A0_38)
  AudioPostEventOn(GetPlayer(), "Play_sfx_UI_NPC_GiveItem")
  SetPropertyInt(L4_42, "Index To Spawn", L5_43, 0)
  SetPropertyVector(L4_42, "Spawn Offset", vector4(0.1, L2_40.Item_Hoffset, 0.1), 0)
  Enable(L4_42)
  L2_40.MickeyRewarded = "Yes"
  if L2_40.MickeyRewarded == "Yes" then
  elseif L2_40.MickeyRewarded == "No" then
    UnrestrictCutSceneInput()
    AnimGBSetIdle(L3_41, true)
  end
end
Mickey_GiveItemToCharacter = L0_0
