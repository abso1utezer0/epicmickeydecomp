local L0_0, L1_1
function L0_0(A0_2)
  local L1_3, L2_4
  L1_3 = GetPrefabData
  L2_4 = A0_2
  L1_3 = L1_3(L2_4)
  L2_4 = GetRelativePrefabEntity
  L2_4 = L2_4(A0_2, ".caged_gremlin")
  L1_3.CageDestroyed = "True"
  RestoreShadowScale(L2_4)
  SetNPCState(L2_4, 0)
  SetPropertyInt(L2_4, "Collision Layer", 4)
  EnableMotion(L2_4)
  AIBB_SetReevaluateRequired(L2_4, true)
  wait(0.1)
  AnimVarInt(L2_4, VAR_Mood_Type, MOOD_Positive)
  Print("*_*_*_*_*_*_*_*_*_*_*_*_*_*Previous Freed Gremlins Total " .. GetGlobal("DBC_ZoneS_TotalGremlinsFreed"))
  SetGlobal("DBC_ZoneS_TotalGremlinsFreed", GetGlobal("DBC_ZoneS_TotalGremlinsFreed") + 1)
  Print("*_*_*_*_*_*_*_*_*_*_*_*_*_*New Freed Gremlins Total " .. GetGlobal("DBC_ZoneS_TotalGremlinsFreed"))
  if GetGlobal(L1_3.GlobalToCheck) == 0 then
    ForceSequence(L2_4, L1_3.OnCageBrokenDialogue)
  end
  wait(0.5)
  SetPropertyFloat(L2_4, "UsableRadius", 2)
  SetVulnerability(L2_4, ST_PAINT, 1)
  SetVulnerability(L2_4, ST_THINNER, 1)
  SetVulnerability(L2_4, ST_SPIN, 1)
  SetVulnerability(L2_4, ST_KNOCKBACK, 1)
  SetPropertyBool(L2_4, "ForceInvulnerable", false)
  SetPropertyFloat(L2_4, "NegativeThreshold", 2.5)
  SetPropertyFloat(L2_4, "PositiveThreshold", 2.5)
end
Prefab_BreakCage = L0_0
function L0_0(A0_5)
  local L1_6, L2_7
  L1_6 = Print
  L2_7 = "*_*_*_*_*_*_*_*_*_*_*_*_*_*Current Freed Gremlins Total "
  L2_7 = L2_7 .. GetGlobal("DBC_ZoneS_TotalGremlinsFreed")
  L1_6(L2_7)
  L1_6 = GetPrefabData
  L2_7 = A0_5
  L1_6 = L1_6(L2_7)
  L2_7 = Print
  L2_7("****************************** Prefab_LoadCheckpoint_GremlinCage: data.GlobalToCheck = " .. L1_6.GlobalToCheck)
  L2_7 = GetRelativePrefabEntity
  L2_7 = L2_7(A0_5, ".caged_gremlin")
  if L1_6.GlobalToCheck == "None" then
    Print("********************** Prefab_LoadCheckpoint_GremlinCage: Global Data Not Set Up.")
  elseif GetGlobal(L1_6.GlobalToCheck) == 0 then
    Print("********************** Prefab_LoadCheckpoint_GremlinCage: GlobalToCheck == 0")
    SetShadowScale(L2_7, vector4(0, 0, 0))
    SetPropertyFloat(L2_7, "UsableRadius", 0)
    SetPropertyInt(L2_7, "Collision Layer", 7)
    SetPropertyFloat(L2_7, "NegativeThreshold", 4)
    SetPropertyFloat(L2_7, "PositiveThreshold", 4)
  elseif GetGlobal(L1_6.GlobalToCheck) == 1 then
    Print("********************** Prefab_LoadCheckpoint_GremlinCage: GlobalToCheck == 1")
    SetPropertyFloat(L2_7, "NegativeThreshold", 4)
    SetPropertyFloat(L2_7, "PositiveThreshold", 4)
    DestroyEntity(L2_7)
    DestroyEntity(A0_5)
  end
end
Prefab_LoadCheckpoint_GremlinCage = L0_0
function L0_0(A0_8)
  if GetPrefabData(A0_8).InCageDialogue == "None" then
  elseif GetPrefabData(A0_8).DialogueBusy == "False" then
    GetPrefabData(A0_8).DialogueBusy = "True"
    if GetPrefabData(A0_8).CageDestroyed == "True" then
      if GetPrefabData(A0_8).AllowFreedDialogue == "True" then
        ForceSequence(A0_8, GetPrefabData(A0_8).FreedDialogue)
      elseif GetPrefabData(A0_8).AllowFreedDialogue == "False" then
        ForceSequence(A0_8, GetPrefabData(A0_8).OnCageBrokenDialogue)
      end
    end
    wait(4)
    GetPrefabData(A0_8).DialogueBusy = "False"
  end
end
Prefab_GremlinDialogue = L0_0
function L0_0(A0_9)
  GetPrefabData(A0_9).AllowFreedDialogue = "True"
end
Prefab_Gremlin_AllowFreedDialogue = L0_0
