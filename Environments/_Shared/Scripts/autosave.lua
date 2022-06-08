-- Fully reworked

local startSaveVar = "StartSave"
LatestSave = 5
RestartThinner = 5
RestartPaint = 5

function SetAutoSave(param1)
  LatestSave = param1
  Print("Checkpoint-SetAutoSave:", LatestSave)
end

function SetAutoSaveAt(param1, param2)
  LatestSave = GetEntity(param2)
  Print("Checkpoint-SetAutoSaveAt:", LatestSave)
end

function RestartFromSave(param1)
  local paintLevel = GetPropertyFloat(_player(), "Paint", 0)
  if paintLevel < RestartPaint then
    SetPropertyFloat(_player(), "Paint", RestartPaint, 0)
  end
  thinnerLevel = GetPropertyFloat(_player(), "Thinner", 0)
  if thinnerLevel < RestartThinner then
    SetPropertyFloat(_player(), "Thinner", RestartThinner, 0)
  end
  MoveToEntity(param1, LatestSave)
  ClearAllCameraAttributes()
  ZeroCharacterVelocity(_player())
end