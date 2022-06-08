-- Fully explained

function Prefab_FallingFloor(param1)
  wait(GetPrefabData(param1).time)
  Rumble(nil, 1)
  ShakeCamera(6, 10, 0, 20, 0.025, 0.025)
  AnimGBSequence(GetRelativePrefabEntity(param1, ".FloorPiece"), GetPrefabData(param1).animation)
  wait(GetPrefabData(param1).destroytime)
  if GetPrefabData(param1).destroyafterwait == "true" then
    DestroyEntity(GetRelativePrefabEntity(param1, ".FloorPiece"))
  end
end
