-- Fully reworked

function NO_RollUpCandleGhost(param1, param2)
  SetGlobal("NO_CandleGhostsFreed", GetGlobal("NO_CandleGhostsFreed") + 1)
  FireSequence("CandleGhost", "NO_CandleGhostFree")
  Print("Ghost enters cutscene 2")
  EnterCutscene(param1, 2)
  wait(4)
  ExitCutscene(param1)
  DestroyEntity(param1)
  DestroyEntity(param2)
  if GetGlobal("NO_CandleGhostsFreed") == 5 then
    FireSequence("hub_nosquare_v2_Gus", "NO_gusCandleGhostComplete")
  end
end