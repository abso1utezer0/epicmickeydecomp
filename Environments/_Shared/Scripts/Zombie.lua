local L0_0, L1_1
function L0_0(A0_2)
  local L1_3
  L1_3 = GetPropertyEntity
  L1_3 = L1_3(A0_2, "Parent Entity")
  wait(0.1)
  DisableComponent(A0_2, "Trigger Damage Component")
  DisableMotion(L1_3)
  AnimVarFloat(L1_3, VAR_Forward_Speed, 0)
  AnimVarFloat(L1_3, VAR_Turn_Speed, 0)
  wait(2.5)
  EnableMotion(L1_3)
  EnableComponent(A0_2, "Trigger Damage Component")
end
DisableZombie = L0_0
function L0_0(A0_4)
  SetPropertyFloat(A0_4, "StimulusPerSecondList", 0, 0)
  SetPropertyFloat(A0_4, "StimulusPerSecondList", 0, 1)
end
DisableAttachmentsZombie = L0_0
