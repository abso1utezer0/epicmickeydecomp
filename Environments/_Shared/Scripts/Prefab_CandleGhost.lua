local L1_0
function L1_0(A0_1, A1_2)
  SetGlobal("NO_CandleGhostsFreed", GetGlobal("NO_CandleGhostsFreed") + 1)
  FireSequence("CandleGhost", "NO_CandleGhostFree")
  Print("Ghost enters cutscene 2")
  EnterCutscene(A0_1, 2)
  wait(4)
  ExitCutscene(A0_1)
  DestroyEntity(A0_1)
  DestroyEntity(A1_2)
  if GetGlobal("NO_CandleGhostsFreed") == 5 then
    FireSequence("hub_nosquare_v2_Gus", "NO_gusCandleGhostComplete")
  end
end
NO_RollUpCandleGhost = L1_0
