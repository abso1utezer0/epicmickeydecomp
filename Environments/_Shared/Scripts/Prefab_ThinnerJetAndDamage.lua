local L0_0, L1_1
function L0_0(A0_2)
  Print("******************************** THINNERSTREAMSTART!!!!!!")
  if GetPrefabData(A0_2).StartEnabled == true then
    FireUser1(A0_2)
  end
end
SteamJetPlusDamageSetup = L0_0
function L0_0(A0_3)
  local L1_4
  L1_4 = Print
  L1_4("******************************** THINNERSTREAMACTIVATE!!!!!!")
  L1_4 = GetRelativePrefabEntity
  L1_4 = L1_4(A0_3, ".DamVolume")
  StartEmitters(A0_3)
  Unhide(L1_4)
  AudioPostEventOn(A0_3, "Play_sfx_PreFab_thinnerjet_jetLP")
  if GetPrefabData(A0_3).Cycletime > 0 then
    wait(GetPrefabData(A0_3).Cycletime)
    StopEmitters(A0_3)
    Wait(0.5)
    Hide(L1_4)
    AudioPostEventOn(A0_3, "Stop_sfx_PreFab_thinnerjet_jetLP")
    wait(GetPrefabData(A0_3).Cycletime)
    FireUser1(A0_3)
  end
end
SteamJetPlusDamage = L0_0
