local L0_0, L1_1
function L0_0(A0_2, A1_3)
  QueueBrainEvent(A1_3, BRAIN_CustomBehaviorOne, vector4(0, 0, 0), A0_2)
end
StopTentacle = L0_0
function L0_0(A0_4, A1_5)
  QueueBrainEvent(A1_5, BRAIN_CustomBehaviorTwo, vector4(0, 0, 0), A0_4)
end
StartTentacle = L0_0
