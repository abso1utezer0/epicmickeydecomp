-- Fully reworked

function Prefab_checkpoint_func(param1)
  if GetPrefabData(param1).LoadFunc == "none" then
    SaveCheckpointSelf(param1, nil)
  else
    SaveCheckpointSelf(param1, GetPrefabData(param1).LoadFunc)
  end
end