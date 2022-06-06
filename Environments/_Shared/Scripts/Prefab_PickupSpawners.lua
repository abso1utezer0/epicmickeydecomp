local L0_0, L1_1
L0_0 = ""
PickupSpawner = L0_0
function L0_0(A0_2)
  Print("******************************* Prefab_SetupItemSpawner")
  PickupSpawner = GetRelativePrefabEntity(A0_2, ".Spawner_Items")
end
Prefab_SetupItemSpawner = L0_0
function L0_0()
  local L0_3, L1_4
  L0_3 = PickupSpawner
  return L0_3
end
Prefab_GetItemSpawnerName = L0_0
function L0_0(A0_5)
  local L1_6
  L1_6 = GetRelativePrefabEntity
  L1_6 = L1_6(A0_5, ".Spawner_Ticket_Toon")
  if GetPropertyBool(L1_6, "Is Painted") then
    AnimGBReset(L1_6)
    AnimGBSequence(L1_6, "Touch")
    AudioPostEventOn(A0_5, "Play_sfx_Prefab_Spawner_Bush")
  end
end
Prefab_AnimateBush = L0_0
function L0_0(A0_7, A1_8, A2_9)
  Print("******************************* Prefab_SpawnItem_Check(target,itemtype) with item: " .. A2_9)
  if StimulusEvent_HasStimulusType(A1_8, ST_SPIN) and GetPropertyBool(A0_7, "Is Painted") then
    if GetPrefabData(A0_7).SpawnerFired == "False" then
      GetPrefabData(A0_7).SpawnerFired = "True"
      AnimGBReset(A0_7)
      AnimGBSequence(A0_7, GetPrefabData(A0_7).animationName)
      Prefab_SpawnItem_ItemCheck(A0_7, A2_9)
      AudioPostEventOn(A0_7, "Play_sfx_Spawner_Spawn")
    else
      wait(0.15)
      AudioPostEventOn(A0_7, "Play_sfx_Phys_Impact_Empty")
    end
  end
end
Prefab_SpawnItem_Check = L0_0
L0_0 = 0
HealthInWorld = L0_0
L0_0 = 0
ThinnerInWorld = L0_0
L0_0 = 0
PaintInWorld = L0_0
L0_0 = false
Prefab_SpawnItem_InUse = L0_0
function L0_0(A0_10, A1_11)
  Print("******************************* Prefab_SpawnItem_ItemPickedUp   " .. A1_11)
  if A1_11 == "Paint" or A1_11 == "Thinner" then
    _G[A1_11 .. "InWorld"] = _G[A1_11 .. "InWorld"] - 0.25
  elseif A1_11 == "PaintThinner" then
    PaintInWorld = PaintInWorld - 0.25
    ThinnerInWorld = ThinnerInWorld - 0.25
  elseif A1_11 == "Health" then
    HealthInWorld = HealthInWorld - 1
  elseif A1_11 == "HealthLarge" then
    HealthInWorld = HealthInWorld - 3
  end
end
Prefab_SpawnItem_ItemPickedUp = L0_0
function L0_0(A0_12, A1_13)
  local L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20, L9_21, L10_22, L11_23, L12_24, L13_25, L14_26, L15_27, L16_28, L17_29, L18_30, L19_31
  L2_14 = Print
  L3_15 = "******************************* Prefab_SpawnItem_ItemCheck(target,itemtype) with item: "
  L4_16 = A1_13
  L3_15 = L3_15 .. L4_16
  L2_14(L3_15)
  L2_14 = GetPlayer
  L2_14 = L2_14()
  L3_15 = GetPrefabData
  L4_16 = A0_12
  L3_15 = L3_15(L4_16)
  L4_16 = GetPropertyFloat
  L5_17 = L2_14
  L6_18 = "Paint"
  L7_19 = 0
  L4_16 = L4_16(L5_17, L6_18, L7_19)
  L5_17 = GetPropertyFloat
  L6_18 = L2_14
  L7_19 = "PaintMax"
  L8_20 = 0
  L5_17 = L5_17(L6_18, L7_19, L8_20)
  L6_18 = GetPropertyFloat
  L7_19 = L2_14
  L8_20 = "Thinner"
  L9_21 = 0
  L6_18 = L6_18(L7_19, L8_20, L9_21)
  L7_19 = GetPropertyFloat
  L8_20 = L2_14
  L9_21 = "ThinnerMax"
  L10_22 = 0
  L7_19 = L7_19(L8_20, L9_21, L10_22)
  L8_20 = L6_18 / L7_19
  L9_21 = L4_16 / L5_17
  L10_22 = GetPropertyInt
  L11_23 = L2_14
  L12_24 = "Health"
  L13_25 = 0
  L10_22 = L10_22(L11_23, L12_24, L13_25)
  L11_23 = GetPropertyInt
  L12_24 = L2_14
  L13_25 = "MaxHealth"
  L14_26 = 0
  L11_23 = L11_23(L12_24, L13_25, L14_26)
  L12_24 = L9_21
  L13_25 = "Paint"
  L14_26 = L8_20
  L15_27 = "Thinner"
  L16_28 = A1_13
  L17_29 = GetScrapperPercent
  L18_30 = L2_14
  L17_29 = L17_29(L18_30)
  if L17_29 > 0 then
    L12_24 = L8_20
    L13_25 = "Thinner"
    L14_26 = L9_21
    L15_27 = "Paint"
  end
  L17_29 = true
  L18_30 = GetGlobal
  L19_31 = "MS_MeanStreetProgress"
  L18_30 = L18_30(L19_31)
  if L18_30 == 6 then
    L17_29 = false
  end
  function L18_30()
    if _UPVALUE0_.ForceItemType == "False" then
      if _UPVALUE1_ == "PaintThinner" and (_UPVALUE2_ + PaintInWorld < 1 or 1 > _UPVALUE3_ + ThinnerInWorld) then
        PaintInWorld = PaintInWorld + 0.25
        ThinnerInWorld = ThinnerInWorld + 0.25
      elseif _UPVALUE1_ == "Paint" and _UPVALUE2_ + PaintInWorld < 1 then
        PaintInWorld = PaintInWorld + 0.25
      elseif _UPVALUE1_ == "Thinner" and 1 > _UPVALUE3_ + ThinnerInWorld then
        ThinnerInWorld = ThinnerInWorld + 0.25
      elseif _UPVALUE1_ == "Health" and _UPVALUE4_ + 1 < _UPVALUE5_ then
        HealthInWorld = HealthInWorld + 1
      elseif _UPVALUE1_ == "HealthLarge" and _UPVALUE4_ + 3 < _UPVALUE5_ then
        HealthInWorld = HealthInWorld + 3
      else
        if _UPVALUE1_ == "HealthLarge" then
          _UPVALUE1_ = "Health"
        elseif _UPVALUE1_ == "Health" then
          _UPVALUE1_ = "PaintThinner"
        elseif _UPVALUE1_ == "PaintThinner" then
          _UPVALUE1_ = _UPVALUE6_
        elseif _UPVALUE1_ == _UPVALUE6_ then
          _UPVALUE1_ = _UPVALUE7_
        elseif _UPVALUE1_ == _UPVALUE7_ then
          _UPVALUE1_ = "Tickets"
        end
        if _UPVALUE1_ == "Tickets" then
          if _UPVALUE8_ == false then
            _UPVALUE1_ = _UPVALUE6_
          end
        else
          _UPVALUE9_()
        end
      end
    end
  end
  function L19_31()
    local L0_32, L1_33, L2_34, L3_35, L4_36, L5_37, L6_38
    L0_32 = Prefab_SpawnItem_InUse
    if L0_32 == false then
      L0_32 = true
      Prefab_SpawnItem_InUse = L0_32
      L0_32 = MoveToEntity
      L1_33 = PickupSpawner
      L6_38 = L2_34(L3_35, L4_36)
      L0_32(L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L2_34(L3_35, L4_36))
      L0_32 = SetPropertyInt
      L1_33 = PickupSpawner
      L0_32(L1_33, L2_34, L3_35, L4_36)
      L0_32 = SetPropertyVector
      L1_33 = PickupSpawner
      L5_37 = 0
      L6_38 = 0
      L0_32(L1_33, L2_34, L3_35, L4_36)
      L0_32 = _UPVALUE1_
      L0_32()
      L0_32 = wait
      L1_33 = 0.2
      L0_32(L1_33)
      L0_32 = ForceSpawn
      L1_33 = PickupSpawner
      L0_32(L1_33, L2_34)
      L0_32 = wait
      L1_33 = 0.01
      L0_32(L1_33)
      L0_32 = SetPropertyInt
      L1_33 = PickupSpawner
      L0_32(L1_33, L2_34, L3_35, L4_36)
      L0_32 = ForceSpawn
      L1_33 = PickupSpawner
      L0_32(L1_33, L2_34)
      L0_32 = wait
      L1_33 = 0.01
      L0_32(L1_33)
      L0_32 = _UPVALUE2_
      if L0_32 == "Paint" then
        L0_32 = SetPropertyInt
        L1_33 = PickupSpawner
        L0_32(L1_33, L2_34, L3_35, L4_36)
      else
        L0_32 = _UPVALUE2_
        if L0_32 == "PaintThinner" then
          L0_32 = SetPropertyInt
          L1_33 = PickupSpawner
          L0_32(L1_33, L2_34, L3_35, L4_36)
        else
          L0_32 = _UPVALUE2_
          if L0_32 == "Thinner" then
            L0_32 = SetPropertyInt
            L1_33 = PickupSpawner
            L0_32(L1_33, L2_34, L3_35, L4_36)
          else
            L0_32 = _UPVALUE2_
            if L0_32 == "Tickets" then
              L0_32 = _UPVALUE3_
              L0_32 = L0_32.ForceItemType
              if L0_32 == "False" then
                L0_32 = SetGlobal
                L1_33 = "Prefab_TicketChance"
                L0_32(L1_33, L2_34)
                L0_32 = math
                L0_32 = L0_32.random
                L1_33 = 1
                L0_32 = L0_32(L1_33, L2_34)
                L1_33 = GetGlobal
                L1_33 = L1_33(L2_34)
                L1_33 = L1_33 / 12
                L0_32 = L1_33 * L2_34
                L1_33 = GetGlobal
                L1_33 = L1_33(L2_34)
                if L1_33 < 2 then
                  L1_33 = SetPropertyInt
                  L5_37 = 0
                  L1_33(L2_34, L3_35, L4_36, L5_37)
                  L1_33 = SetGlobal
                  L1_33(L2_34, L3_35)
                else
                  L1_33 = GetGlobal
                  L1_33 = L1_33(L2_34)
                  if L1_33 == 2 then
                    if L0_32 < 58 then
                      L1_33 = SetPropertyInt
                      L5_37 = 0
                      L1_33(L2_34, L3_35, L4_36, L5_37)
                    elseif L0_32 > 57 then
                      L1_33 = SetPropertyInt
                      L5_37 = 0
                      L1_33(L2_34, L3_35, L4_36, L5_37)
                      L1_33 = SetGlobal
                      L1_33(L2_34, L3_35)
                      L1_33 = GetGlobal
                      L1_33 = L1_33(L2_34)
                      if L1_33 < 0 then
                        L1_33 = SetGlobal
                        L1_33(L2_34, L3_35)
                      end
                    end
                  else
                    L1_33 = GetGlobal
                    L1_33 = L1_33(L2_34)
                    if L1_33 > 2 then
                      if L0_32 < 58 then
                        L1_33 = SetPropertyInt
                        L5_37 = 0
                        L1_33(L2_34, L3_35, L4_36, L5_37)
                      elseif L0_32 > 57 and L0_32 < 83 then
                        L1_33 = SetPropertyInt
                        L5_37 = 0
                        L1_33(L2_34, L3_35, L4_36, L5_37)
                      elseif L0_32 > 82 then
                        L1_33 = SetPropertyInt
                        L5_37 = 0
                        L1_33(L2_34, L3_35, L4_36, L5_37)
                        L1_33 = SetGlobal
                        L1_33(L2_34, L3_35)
                        L1_33 = GetGlobal
                        L1_33 = L1_33(L2_34)
                        if L1_33 < 0 then
                          L1_33 = SetGlobal
                          L1_33(L2_34, L3_35)
                        end
                      end
                    end
                  end
                end
              else
                L0_32 = _UPVALUE3_
                L0_32 = L0_32.ForceItemType
                if L0_32 == "True" then
                  L0_32 = _UPVALUE3_
                  L0_32 = L0_32.ForceTicketType
                  if L0_32 == 1 then
                    L0_32 = SetPropertyInt
                    L1_33 = PickupSpawner
                    L0_32(L1_33, L2_34, L3_35, L4_36)
                  else
                    L0_32 = _UPVALUE3_
                    L0_32 = L0_32.ForceTicketType
                    if L0_32 == 10 then
                      L0_32 = SetPropertyInt
                      L1_33 = PickupSpawner
                      L0_32(L1_33, L2_34, L3_35, L4_36)
                    else
                      L0_32 = _UPVALUE3_
                      L0_32 = L0_32.ForceTicketType
                      if L0_32 == 30 then
                        L0_32 = SetPropertyInt
                        L1_33 = PickupSpawner
                        L0_32(L1_33, L2_34, L3_35, L4_36)
                      end
                    end
                  end
                end
              end
            else
              L0_32 = _UPVALUE2_
              if L0_32 == "Health" then
                L0_32 = SetPropertyInt
                L1_33 = PickupSpawner
                L0_32(L1_33, L2_34, L3_35, L4_36)
                L0_32 = SetPropertyVector
                L1_33 = PickupSpawner
                L5_37 = 0.5
                L6_38 = 0
                L0_32(L1_33, L2_34, L3_35, L4_36)
              else
                L0_32 = _UPVALUE2_
                if L0_32 == "HealthLarge" then
                  L0_32 = SetPropertyInt
                  L1_33 = PickupSpawner
                  L0_32(L1_33, L2_34, L3_35, L4_36)
                else
                  L0_32 = _UPVALUE2_
                  if L0_32 == "TV" then
                    L0_32 = SetPropertyInt
                    L1_33 = PickupSpawner
                    L0_32(L1_33, L2_34, L3_35, L4_36)
                  else
                    L0_32 = _UPVALUE2_
                    if L0_32 == "Anvil" then
                      L0_32 = SetPropertyInt
                      L1_33 = PickupSpawner
                      L0_32(L1_33, L2_34, L3_35, L4_36)
                    else
                      L0_32 = _UPVALUE2_
                      if L0_32 == "Watch" then
                        L0_32 = SetPropertyInt
                        L1_33 = PickupSpawner
                        L0_32(L1_33, L2_34, L3_35, L4_36)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      L0_32 = ForceSpawn
      L1_33 = PickupSpawner
      L0_32 = L0_32(L1_33, L2_34)
      L1_33 = GetElementCount
      L1_33 = L1_33(L2_34, L3_35)
      for L5_37 = 0, L1_33 do
        L6_38 = GetChildEntityByIndex
        L6_38 = L6_38(L0_32[1], L5_37)
        PlayerPickup_SetPendingActivation(L6_38, 0.8)
      end
      Prefab_SpawnItem_InUse = L2_34
    else
      L0_32 = Prefab_SpawnItem_InUse
      if L0_32 == true then
        L0_32 = Print
        L1_33 = "******************************* Prefab_SpawnItem() - ItemToSpawn = "
        L1_33 = L1_33 .. L2_34 .. L3_35
        L0_32(L1_33)
        L0_32 = wait
        L1_33 = 0.15
        L0_32(L1_33)
        L0_32 = _UPVALUE4_
        L0_32()
      end
    end
  end
  if L3_15.ForceItemType == "False" then
    if L10_22 / L11_23 < 0.4 then
      L16_28 = "HealthLarge"
    elseif L10_22 / L11_23 < 0.8 then
      L16_28 = "Health"
    elseif A1_13 == "Health" then
      if L10_22 == L11_23 then
        if L12_24 < 0.8 then
          L16_28 = L13_25
        elseif L14_26 < 0.8 then
          L16_28 = L15_27
        else
          L16_28 = "Tickets"
        end
      end
    elseif A1_13 == "Paint" then
      if L9_21 > 0.75 then
        L16_28 = "Tickets"
      end
    elseif A1_13 == "Thinner" then
      if L8_20 > 0.75 then
        L16_28 = "Tickets"
      end
    elseif A1_13 == "PaintThinner" then
      if (L4_16 + L6_18) / (L5_17 + L7_19) > 0.75 then
        L16_28 = "Tickets"
      end
    elseif A1_13 == "Tickets" then
      if L9_21 < 0.5 then
        L16_28 = "Paint"
      elseif L8_20 < 0.5 then
        L16_28 = "Thinner"
      end
    end
  end
  L19_31()
end
Prefab_SpawnItem_ItemCheck = L0_0
L0_0 = ""
Animation_Entity = L0_0
L0_0 = false
Animation_Entity_Got = L0_0
function L0_0(A0_39)
  Print("************************************* - Pickup_Find_Animation_Entity Started")
  Animation_Entity = A0_39
  Animation_Entity_Got = true
  Print("************************************* - Pickup_Find_Animation_Entity Finished")
  wait(2)
  DestroyEntity(A0_39)
end
Pickup_Find_Animation_Entity = L0_0
function L0_0(A0_40)
  Print("************************************* - Pickup_Attach_Item_To_Animation Started")
  while Animation_Entity_Got == false do
    wait(0.001)
  end
  SetParentEntity(A0_40, Animation_Entity)
  SetPropertyString(A0_40, "Bone Attach Name", "VFX_01", 0)
  Animation_Entity_Got = false
  Print("************************************* - Pickup_Attach_Item_To_Animation Finished")
end
Pickup_Attach_Item_To_Animation = L0_0
function L0_0(A0_41)
  local L1_42, L2_43, L3_44, L4_45, L5_46, L6_47
  L1_42 = GetElementCount
  L1_42 = L1_42(L2_43, L3_44)
  for L5_46 = 0, L1_42 do
    L6_47 = GetChildEntityByIndex
    L6_47 = L6_47(A0_41, L5_46)
    ClearParent(L6_47)
  end
  L2_43(L3_44)
end
Prefab_DetachChildrenAndRemove = L0_0
function L0_0(A0_48, A1_49)
  local L2_50, L3_51, L4_52, L5_53, L6_54, L7_55
  L2_50 = GetPosition
  L3_51 = A0_48
  L2_50 = L2_50(L3_51)
  L3_51 = tonumber
  L4_52 = A1_49
  L3_51 = L3_51(L4_52)
  L4_52 = AdjustJigsawAmmoSpawnPosition
  L5_53 = L2_50
  L6_54 = 0.25
  L5_53 = L4_52(L5_53, L6_54)
  Jigsaw_SpawnDirection = L5_53
  L2_50 = L4_52
  L4_52 = Jigsaw_SpawnDirection
  L4_52.y = 2
  L4_52 = IsValidHandle
  L5_53 = PickupSpawner
  L4_52 = L4_52(L5_53)
  if L4_52 then
    L4_52 = SetTransformation
    L5_53 = PickupSpawner
    L6_54 = L2_50
    L7_55 = vector4
    L7_55 = L7_55(0, 0, 0)
    L4_52(L5_53, L6_54, L7_55, L7_55(0, 0, 0))
    if L3_51 == 0 then
      L4_52 = SetPropertyInt
      L5_53 = PickupSpawner
      L6_54 = "Index To Spawn"
      L7_55 = 15
      L4_52(L5_53, L6_54, L7_55, 0)
    elseif L3_51 == 1 then
      L4_52 = SetPropertyInt
      L5_53 = PickupSpawner
      L6_54 = "Index To Spawn"
      L7_55 = 14
      L4_52(L5_53, L6_54, L7_55, 0)
    end
    L4_52 = ForceSpawn
    L5_53 = PickupSpawner
    L6_54 = 1
    L4_52 = L4_52(L5_53, L6_54)
    L5_53 = Jigsaw_SpawnDirection
    L5_53 = L5_53 * 3.2
    L6_54 = ApplyImpulse
    L7_55 = L4_52[1]
    L6_54(L7_55, L5_53.x, L5_53.y, L5_53.z)
    L6_54 = GetChildEntityByName
    L7_55 = L4_52[1]
    L6_54 = L6_54(L7_55, "Ammo_Paint")
    L7_55 = IsValidHandle
    L7_55 = L7_55(L6_54)
    if L7_55 == false then
      L7_55 = GetChildEntityByName
      L7_55 = L7_55(L4_52[1], "Ammo_Thinner")
      L6_54 = L7_55
    end
    L7_55 = GetChildEntityByName
    L7_55 = L7_55(L6_54, "Ammo_Paint_Nif")
    if IsValidHandle(L7_55) == false then
      L7_55 = GetChildEntityByName(L6_54, "Ammo_Thinner_Parentable")
    end
    if IsValidHandle(L7_55) then
      SetPropertFloat(L7_55, "Bone Scale Multiplier", 0, 0)
      SetPropertyFloat(L7_55, "Lifetime", 30, 0)
      SetPropertyBool(L7_55, "Shrink Over Lifetime", true, 0)
      PlayerPickup_SetPendingActivation(L7_55, 2)
    end
  end
end
Prefab_Spawn_Ammo_Bouncy = L0_0
L0_0 = ""
Jigsaw_SpawnDirection = L0_0
function L0_0(A0_56, A1_57)
  local L2_58, L3_59, L4_60
  L2_58 = JigsawStateChangedEvent_Position
  L3_59 = A1_57
  L2_58 = L2_58(L3_59)
  L3_59 = JigsawStateChangedEvent_AmmoType
  L4_60 = A1_57
  L3_59 = L3_59(L4_60)
  L4_60 = AdjustJigsawAmmoSpawnPosition
  Jigsaw_SpawnDirection, L4_60 = L2_58, L4_60(L2_58, 0.25)
  L2_58 = L4_60
  L4_60 = Jigsaw_SpawnDirection
  L4_60.y = 2
  function L4_60()
    local L0_61, L1_62, L2_63, L3_64
    L0_61 = IsValidHandle
    L1_62 = PickupSpawner
    L0_61 = L0_61(L1_62)
    if L0_61 then
      L0_61 = SetTransformation
      L1_62 = PickupSpawner
      L2_63 = _UPVALUE0_
      L3_64 = vector4
      L3_64 = L3_64(0, 0, 0)
      L0_61(L1_62, L2_63, L3_64, L3_64(0, 0, 0))
      L0_61 = _UPVALUE1_
      if L0_61 == 0 then
        L0_61 = SetPropertyInt
        L1_62 = PickupSpawner
        L2_63 = "Index To Spawn"
        L3_64 = 15
        L0_61(L1_62, L2_63, L3_64, 0)
      else
        L0_61 = _UPVALUE1_
        if L0_61 == 1 then
          L0_61 = SetPropertyInt
          L1_62 = PickupSpawner
          L2_63 = "Index To Spawn"
          L3_64 = 14
          L0_61(L1_62, L2_63, L3_64, 0)
        end
      end
      L0_61 = ForceSpawn
      L1_62 = PickupSpawner
      L2_63 = 1
      L0_61 = L0_61(L1_62, L2_63)
      L1_62 = Jigsaw_SpawnDirection
      L1_62 = L1_62 * 3.2
      L2_63 = ApplyImpulse
      L3_64 = L0_61[1]
      L2_63(L3_64, L1_62.x, L1_62.y, L1_62.z)
      L2_63 = GetChildEntityByName
      L3_64 = L0_61[1]
      L2_63 = L2_63(L3_64, "Ammo_Paint")
      L3_64 = IsValidHandle
      L3_64 = L3_64(L2_63)
      if L3_64 == false then
        L3_64 = GetChildEntityByName
        L3_64 = L3_64(L0_61[1], "Ammo_Thinner")
        L2_63 = L3_64
      end
      L3_64 = GetChildEntityByName
      L3_64 = L3_64(L2_63, "Ammo_Paint_Nif")
      if IsValidHandle(L3_64) == false then
        L3_64 = GetChildEntityByName(L2_63, "Ammo_Thinner_Parentable")
      end
      if IsValidHandle(L3_64) then
        SetPropertyFloat(L3_64, "Bone Scale Multiplier", 0, 0)
        SetPropertyFloat(L3_64, "Lifetime", 30, 0)
        SetPropertyBool(L3_64, "Shrink Over Lifetime", true, 0)
        PlayerPickup_SetPendingActivation(L3_64, 2)
      end
    end
  end
  SetGlobal("Prefab_JigsawRewardChance", GetGlobal("Prefab_JigsawRewardChance") + 1)
  if GetGlobal("Prefab_JigsawRewardChance") / 4 * math.random(1, 100) > 75 then
    SetGlobal("Prefab_JigsawRewardChance", 0)
    L4_60()
  end
end
Prefab_SpawnItem_Jigsaw = L0_0
