-- Fully reworked & explained

-- disable zombie of choice
function DisableZombie(param1)
  local var1 = GetPropertyEntity(param1, "Parent Entity")
  wait(0.1)
  DisableComponent(param1, "Trigger Damage Component")
  DisableMotion(var1)
  AnimVarFloat(var1, VAR_Forward_Speed, 0)
  AnimVarFloat(var1, VAR_Turn_Speed, 0)
  wait(2.5)
  EnableMotion(var1)
  EnableComponent(param1, "Trigger Damage Component")
end

-- disable attachment zombie of choice
function DisableAttachmentsZombie(param1)
  SetPropertyFloat(param1, "StimulusPerSecondList", 0, 0)
  SetPropertyFloat(param1, "StimulusPerSecondList", 0, 1)
end