local L1_0
function L1_0(A0_1)
  wait(GetPrefabData(A0_1).time)
  Rumble(nil, 1)
  ShakeCamera(6, 10, 0, 20, 0.025, 0.025)
  AnimGBSequence(GetRelativePrefabEntity(A0_1, ".FloorPiece"), GetPrefabData(A0_1).animation)
  wait(GetPrefabData(A0_1).destroytime)
  if GetPrefabData(A0_1).destroyafterwait == "true" then
    DestroyEntity(GetRelativePrefabEntity(A0_1, ".FloorPiece"))
  end
end
Prefab_FallingFloor = L1_0
