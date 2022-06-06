local L1_0
function L1_0(A0_1)
  if GetPrefabData(A0_1).TeleportPlayer == "True" then
    TeleportToEntity(GetPlayer(), GetRelativePrefabEntity(A0_1, ".ExitBuildingPosition"), true, true)
  else
  end
  wait(0.01)
  CameraReset()
  wait(0.01)
  Print("*******************Setting prefab exit building camera")
  SetCameraAttributes(GetRelativePrefabEntity(A0_1, ".ExitBuildingOverride"))
  Prefab_ProjectorMickeyMove()
end
Prefab_Exit_Building_Camera = L1_0
