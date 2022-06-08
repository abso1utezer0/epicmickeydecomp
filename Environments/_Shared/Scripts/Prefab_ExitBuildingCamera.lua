-- Fully reworked

function Prefab_Exit_Building_Camera(param1)
  if GetPrefabData(param1).TeleportPlayer == "True" then
    TeleportToEntity(GetPlayer(), GetRelativePrefabEntity(param1, ".ExitBuildingPosition"), true, true)
  else
  end
  wait(0.01)
  CameraReset()
  wait(0.01)
  Print("*******************Setting prefab exit building camera")
  SetCameraAttributes(GetRelativePrefabEntity(param1, ".ExitBuildingOverride"))
  Prefab_ProjectorMickeyMove()
end