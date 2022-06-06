local L0_0, L1_1
L0_0 = "Up"
PPElevatorDir = L0_0
function L0_0(A0_2, A1_3)
  if A1_3 == "Stopped" then
    PPElevatorDir = "Stopped"
    SetSplineFollowerInitialSpeed(A0_2, 0)
  elseif PPElevatorDir == A1_3 then
  else
    PPElevatorDir = A1_3
    Reverse(A0_2)
    SetSplineFollowerInitialSpeed(A0_2, GetPrefabData(A0_2).speed)
  end
end
PP_ElevatorCheck = L0_0
