local L1_0
function L1_0(A0_1)
  if GetPrefabData(A0_1).LoadFunc == "none" then
    SaveCheckpointSelf(A0_1, nil)
  else
    SaveCheckpointSelf(A0_1, GetPrefabData(A0_1).LoadFunc)
  end
end
Prefab_checkpoint_func = L1_0
