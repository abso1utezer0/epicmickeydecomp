-- Fully reworked

function StopTentacle(param1, param2)
  QueueBrainEvent(param2, BRAIN_CustomBehaviorOne, vector4(0, 0, 0), param1)
end

function StartTentacle(param1, param2)
  QueueBrainEvent(param2, BRAIN_CustomBehaviorTwo, vector4(0, 0, 0), param1)
end
