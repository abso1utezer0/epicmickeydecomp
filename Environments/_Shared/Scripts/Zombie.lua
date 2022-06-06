-- Fully reworked & explained

local L1_1
-- disable zombie of choice
function DisableZombie(var1)
  local invar1
  invar1 = GetPropertyEntity(var1, "Parent Entity")
  wait(0.1)
  DisableComponent(var1, "Trigger Damage Component")
  DisableMotion(invar1)
  AnimVarFloat(invar1, VAR_Forward_Speed, 0)
  AnimVarFloat(invar1, VAR_Turn_Speed, 0)
  wait(2.5)
  EnableMotion(invar1)
  EnableComponent(var1, "Trigger Damage Component")
end

-- disable attachment zombie of choice
function DisableAttachmentsZombie(var1)
  SetPropertyFloat(var1, "StimulusPerSecondList", 0, 0)
  SetPropertyFloat(var1, "StimulusPerSecondList", 0, 1)
end