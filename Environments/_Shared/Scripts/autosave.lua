local L0_0, L1_1
L0_0 = "StartSave"
LatestSave = L0_0
L0_0 = 5
RestartThinner = L0_0
L0_0 = 5
RestartPaint = L0_0
function L0_0(A0_2)
  LatestSave = A0_2
  Print("Checkpoint-SetAutoSave:", LatestSave)
end
SetAutoSave = L0_0
function L0_0(A0_3, A1_4)
  LatestSave = GetEntity(A1_4)
  Print("Checkpoint-SetAutoSaveAt:", LatestSave)
end
SetAutoSaveAt = L0_0
function L0_0(A0_5)
  local L1_6
  L1_6 = GetPropertyFloat(_player(), "Paint", 0)
  if L1_6 < RestartPaint then
    SetPropertyFloat(_player(), "Paint", RestartPaint, 0)
  end
  L1_6 = GetPropertyFloat(_player(), "Thinner", 0)
  if L1_6 < RestartThinner then
    SetPropertyFloat(_player(), "Thinner", RestartThinner, 0)
  end
  MoveToEntity(A0_5, LatestSave)
  ClearAllCameraAttributes()
  ZeroCharacterVelocity(_player())
end
RestartFromSave = L0_0
