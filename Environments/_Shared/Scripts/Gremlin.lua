local L0_0, L1_1
function L0_0(A0_2, A1_3, ...)
  local L3_5, L4_6, L5_7, L6_8
  L3_5 = {
    [4] = ...
  }
  L6_8 = ...
  ;({
    [4] = ...
  })[1] = L4_6
  ;({
    [4] = ...
  })[2] = L5_7
  ;({
    [4] = ...
  })[3] = L6_8
  L4_6 = nil
  L5_7 = #L3_5
  if L5_7 > 0 then
    L4_6 = L3_5[1]
  else
    L4_6 = true
  end
  L5_7 = nil
  L6_8 = #L3_5
  if L6_8 > 1 then
    L5_7 = L3_5[2]
  else
    L5_7 = true
  end
  L6_8 = IsInCutscene
  L6_8 = L6_8(A0_2)
  TeleportGremlinOut(A0_2)
  TeleportGremlinIn(A0_2, A1_3, L6_8, L4_6, L5_7)
end
TeleportGremlinToEntity = L0_0
function L0_0(A0_9)
  local L1_10
  L1_10 = A0_9
  if L1_10 == nil then
    L1_10 = _self()
  end
  DisableComponent(L1_10, "Usable")
  EnterCutscene(L1_10, 6)
  wait(0.9)
  Hide(L1_10)
  SetPropertyInt(L1_10, "Collision Layer", 7)
end
TeleportGremlinOut = L0_0
function L0_0(A0_11, A1_12, A2_13, ...)
  local L4_15, L5_16
  L4_15 = {
    [2] = ...
  }
  L5_16 = ...
  ;({
    [2] = ...
  })[1] = L5_16
  L5_16 = nil
  if #L4_15 > 0 then
    L5_16 = L4_15[1]
  else
    L5_16 = true
  end
  if #L4_15 > 1 then
  else
  end
  TeleportToEntity(A0_11, A1_12, L5_16, false)
  StartGremlinTeleportInFX(A0_11)
  wait(0.66)
  SetPropertyInt(A0_11, "Collision Layer", 4)
  Unhide(A0_11)
  EnterCutscene(A0_11, 5)
  if true then
    wait(3.2)
  else
    wait(1.7)
  end
  EnableComponent(A0_11, "Usable")
  if not A2_13 then
    ExitCutscene(A0_11)
  end
end
TeleportGremlinIn = L0_0
function L0_0()
  local L0_17, L1_18
  L0_17 = _self
  L0_17 = L0_17()
  L1_18 = GetPropertyString
  L1_18 = L1_18(L0_17, "AIType")
  if L1_18 == "Gremlin:Gus" then
    StartEmitterByNameFireForget(L0_17, "GremlinGusTeleportOutFX")
  elseif L1_18 == "Gremlin:Variant1" then
    StartEmitterByNameFireForget(L0_17, "GremlinVariant1TeleportOutFX")
  elseif L1_18 == "Gremlin:Variant2" then
    StartEmitterByNameFireForget(L0_17, "GremlinVariant2TeleportOutFX")
  elseif L1_18 == "Gremlin:Variant3" then
    StartEmitterByNameFireForget(L0_17, "GremlinVariant3TeleportOutFX")
  elseif L1_18 == "Gremlin:Variant4" then
    StartEmitterByNameFireForget(L0_17, "GremlinVariant4TeleportOutFX")
  else
    Print("ERROR: Tried to start TeleportOutFX on unknown gremlin type: " .. L1_18)
  end
end
StartGremlinTeleportOutFX = L0_0
function L0_0(A0_19, A1_20)
  local L2_21, L3_22, L4_23, L5_24, L6_25
  L2_21 = "pSys_warp_faceShape"
  L3_22 = "pSys_warp_suitShape"
  L4_23 = "pSys_warp_hatShape"
  L5_24 = "pSys_warp_glovesShape"
  L6_25 = "pSys_warp_shoesShape"
  if A1_20 == "Gus" then
    SetR3MTConstRegOnSubGraph(A0_19, L2_21, 1, vector4(0.278, 0.294, 0.078, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L4_23, 1, vector4(0.639, 0.278, 0.192, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L3_22, 1, vector4(0.561, 0.208, 0.106, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L5_24, 1, vector4(0.627, 0.584, 0.494, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L6_25, 1, vector4(0.247, 0.184, 0.125, 0))
  elseif A1_20 == "Variant1" then
    SetR3MTConstRegOnSubGraph(A0_19, L2_21, 1, vector4(0.612, 0.353, 0.035, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L4_23, 1, vector4(0.27, 0.38, 0.502, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L3_22, 1, vector4(0.306, 0.424, 0.486, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L5_24, 1, vector4(0.627, 0.584, 0.494, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L6_25, 1, vector4(0.247, 0.184, 0.125, 0))
  elseif A1_20 == "Variant2" then
    SetR3MTConstRegOnSubGraph(A0_19, L2_21, 1, vector4(0.635, 0.376, 0.075, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L4_23, 1, vector4(0.294, 0.412, 0.29, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L3_22, 1, vector4(0.686, 0.561, 0.18, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L5_24, 1, vector4(0.627, 0.584, 0.494, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L6_25, 1, vector4(0.247, 0.184, 0.125, 0))
  elseif A1_20 == "Variant3" then
    SetR3MTConstRegOnSubGraph(A0_19, L2_21, 1, vector4(0.651, 0.522, 0.271, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L4_23, 1, vector4(0.282, 0.259, 0.376, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L3_22, 1, vector4(0.369, 0.263, 0.435, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L5_24, 1, vector4(0.196, 0.133, 0.078, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L6_25, 1, vector4(0.247, 0.184, 0.125, 0))
  elseif A1_20 == "Variant4" then
    SetR3MTConstRegOnSubGraph(A0_19, L2_21, 1, vector4(0.592, 0.353, 0.055, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L4_23, 1, vector4(0.247, 0.439, 0.271, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L3_22, 1, vector4(0.337, 0.467, 0.306, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L5_24, 1, vector4(0.627, 0.584, 0.494, 0))
    SetR3MTConstRegOnSubGraph(A0_19, L6_25, 1, vector4(0.247, 0.184, 0.125, 0))
  else
    Print("ERROR: Tried to setup TeleportOutFX colors for unknown gremlin type: " .. A1_20)
  end
end
SetupGremlinTeleportOutFXColors = L0_0
function L0_0(A0_26)
  local L1_27
  L1_27 = GetPropertyString
  L1_27 = L1_27(A0_26, "AIType")
  if L1_27 == "Gremlin:Gus" then
    StartEmitterByNameFireForget(A0_26, "GremlinGusTeleportInFX")
  elseif L1_27 == "Gremlin:Variant1" then
    StartEmitterByNameFireForget(A0_26, "GremlinVariant1TeleportInFX")
  elseif L1_27 == "Gremlin:Variant2" then
    StartEmitterByNameFireForget(A0_26, "GremlinVariant2TeleportInFX")
  elseif L1_27 == "Gremlin:Variant3" then
    StartEmitterByNameFireForget(A0_26, "GremlinVariant3TeleportInFX")
  elseif L1_27 == "Gremlin:Variant4" then
    StartEmitterByNameFireForget(A0_26, "GremlinVariant4TeleportInFX")
  else
    Print("ERROR: Tried to start TeleportInFX on unknown gremlin type: " .. L1_27)
  end
end
StartGremlinTeleportInFX = L0_0
function L0_0(A0_28, A1_29)
  local L2_30, L3_31, L4_32
  L2_30 = "pSys_warp_blueShape"
  L3_31 = "pSys_burstShape"
  L4_32 = vector4
  L4_32 = L4_32(0, 0, 0, 0)
  if A1_29 == "Gus" then
    L4_32 = vector4(0.561, 0.208, 0.106, 0)
  elseif A1_29 == "Variant1" then
    L4_32 = vector4(0.306, 0.424, 0.486, 0)
  elseif A1_29 == "Variant2" then
    L4_32 = vector4(0.686, 0.561, 0.18, 0)
  elseif A1_29 == "Variant3" then
    L4_32 = vector4(0.369, 0.263, 0.435, 0)
  elseif A1_29 == "Variant4" then
    L4_32 = vector4(0.337, 0.467, 0.306, 0)
  else
    Print("ERROR: Tried to setup TeleportInFX colors for unknown gremlin type: " .. A1_29)
  end
  SetR3MTConstRegOnSubGraph(A0_28, L2_30, 1, L4_32)
  SetR3MTConstRegOnSubGraph(A0_28, L3_31, 1, L4_32)
end
SetupGremlinTeleportInFXColors = L0_0
