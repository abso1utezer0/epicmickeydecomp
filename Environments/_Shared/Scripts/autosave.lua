-- Fully reworked

local startSaveVar = "StartSave"
LatestSave = 5
RestartThinner = 5
RestartPaint = 5

function SetAutoSave(autoSaveNumber)
  LatestSave = autoSaveNumber
  Print("Checkpoint-SetAutoSave:", LatestSave)
end

function SetAutoSaveAt(autoSaveAtNumber, entity)
  LatestSave = GetEntity(entity)
  Print("Checkpoint-SetAutoSaveAt:", LatestSave)
end

function RestartFromSave(entity)
  local paintLevel = GetPropertyFloat(_player(), "Paint", 0)
  if paintLevel < RestartPaint then
    SetPropertyFloat(_player(), "Paint", RestartPaint, 0)
  end
  thinnerLevel = GetPropertyFloat(_player(), "Thinner", 0)
  if thinnerLevel < RestartThinner then
    SetPropertyFloat(_player(), "Thinner", RestartThinner, 0)
  end
  MoveToEntity(entity, LatestSave)
  ClearAllCameraAttributes()
  ZeroCharacterVelocity(_player())
end