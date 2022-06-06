local L0_0, L1_1
function L0_0(A0_2)
  GetPrefabData(A0_2).EnemiesDefeated = GetPrefabData(A0_2).EnemiesDefeated + 1
  Print("******************* Wave_AdvancedNum: EnemiesDefeated = " .. GetPrefabData(A0_2).EnemiesDefeated)
  Print("******************* EnemiesFriended = " .. GetPrefabData(A0_2).EnemiesFriended)
  Wave_Check(A0_2)
end
Wave_AdvancedNum = L0_0
function L0_0(A0_3, A1_4)
  if GetCurrentTeam(A0_3) == 3 then
    Print("********************************* TEAM 3 - Player's Team")
    GetPrefabData(A1_4).EnemiesFriended = GetPrefabData(A1_4).EnemiesFriended + 1
  elseif GetCurrentTeam(A0_3) == 2 then
    Print("********************************* TEAM 2 - Enemy")
    GetPrefabData(A1_4).EnemiesFriended = GetPrefabData(A1_4).EnemiesFriended - 1
  end
  Print("******************* ChangedTeams: EnemiesFriended = " .. GetPrefabData(A1_4).EnemiesFriended)
  Print("******************* EnemiesDefeated = " .. GetPrefabData(A1_4).EnemiesDefeated)
  Wave_Check(A1_4)
end
ChangedTeams = L0_0
function L0_0(A0_5)
  Print("******************* Wave_Check: Total_Enemies_InWave = " .. GetPrefabData(A0_5).Total_Enemies_InWave)
  if GetPrefabData(A0_5).EnemiesDefeated + GetPrefabData(A0_5).EnemiesFriended == GetPrefabData(A0_5).Total_Enemies_InWave then
    Print("******************* Wave_Check: EnemiesDefeated + EnemiesFriended == Total_Enemies_InWave")
    wait(0.5)
    if GetPrefabData(A0_5).WaveCompleteFunction == "None" then
      Print("******************* Wave_Check: No WaveCompleteFunction Setup. UNABLE TO CONTINUE WAVE")
    else
      GetPrefabData(A0_5).EnemiesDefeated = 0
      if GetPrefabData(A0_5).KeepFriended == "False" then
        ForEachEntityInGroup(DestroyEntity, GetPrefabData(A0_5).EnemyEntityGroup)
        GetPrefabData(A0_5).EnemiesFriended = 0
      end
      FireThread(_G[GetPrefabData(A0_5).WaveCompleteFunction])
    end
  end
end
Wave_Check = L0_0
