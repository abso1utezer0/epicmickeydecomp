local L0_0, L1_1
function L0_0(A0_2)
  local L1_3, L2_4
  L1_3 = GetPrefabData
  L2_4 = A0_2
  L1_3 = L1_3(L2_4)
  L2_4 = ""
  if L1_3.LookAt == "Marker" then
    L2_4 = GetRelativePrefabEntity(A0_2, ".CameraLookAtPoint")
  elseif L1_3.LookAt == "Player" then
    L2_4 = GetPlayer()
  elseif L1_3.LookAt == "None" then
    L2_4 = nil
  end
  GrabCamera(GetRelativePrefabEntity(A0_2, ".Camera"), L2_4, CAMERA_LERP_TRANSITION, L1_3.EaseInTime)
end
Prefab_GrabCamera = L0_0
function L0_0(A0_5)
  ReleaseCamera(CAMERA_LERP_TRANSITION, GetPrefabData(A0_5).EaseOutTime)
end
Prefab_ReleaseCamera = L0_0
