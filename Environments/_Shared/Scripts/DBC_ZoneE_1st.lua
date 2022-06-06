local L0_0, L1_1
function L0_0(A0_2, A1_3)
  if GetGlobal(A1_3) == 0 then
    SetGlobal(A1_3, 1)
  elseif GetGlobal(A1_3) == 1 then
    SetGlobal(A1_3, 0)
  end
  DBC_ZoneE1_OpenDoor()
end
DBC_ZoneE1_StateChange = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneE1_DoorsOpen") == 0 and GetGlobal("DBC_ZoneE1_Door1") == 1 and GetGlobal("DBC_ZoneE1_Door2") == 1 then
    ForEachEntityInGroup(Reverse, "dbc_zonee_1st.halldoors")
    SetGlobal("DBC_ZoneE1_DoorsOpen", 1)
  end
end
DBC_ZoneE1_OpenDoor = L0_0
function L0_0()
  Bark(GetPlayer(), "This canister should make the Film Screen work", 4, "Gus", "Gus")
  SetGlobal("DBC_ZoneB1_Canister", 1)
  PauseMenuObjectives(GetPlayer(), [[
Objective: 
 Use the canister on the screen to leave the level.]])
end
DBC_ZoneB1_CanisterPickup = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneB1_InRoom") == 0 then
    Enable("dbc_zoneb_1st.Spawner 01")
    ForEachEntityInGroup(Reverse, "dbc_zonee_1st.halldoors")
    SetGlobal("DBC_ZoneB1_InRoom", 1)
    PauseMenuObjectives(GetPlayer(), [[
Objective: 
 Defeat the Spatters or 
 Platform to the canister.]])
  end
end
DBC_ZoneB1_SpawnSpatters = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneB1_Canister") == 0 then
    RestrictCutSceneInput()
    GrabCamera("dbc_zoneb_1st.CameraControlPoint 01", "", CAMERA_LERP_TRANSITION, 0.5)
    Bark(GetPlayer(), "Those chandeliers have stopped swinging, this should be easy now!", 3, "Gus", "Gus")
    wait(1)
    SetRotatorMaxSpeed("dbc_zoneb_1st.DBC_Chandelier1", 50)
    StartRotateToPosition("dbc_zoneb_1st.DBC_Chandelier1", 0)
    wait(0.4)
    SetRotatorMaxSpeed("dbc_zoneb_1st.DBC_Chandelier2", 50)
    StartRotateToPosition("dbc_zoneb_1st.DBC_Chandelier2", 0)
    wait(0.4)
    SetRotatorMaxSpeed("dbc_zoneb_1st.DBC_Chandelier3", 50)
    StartRotateToPosition("dbc_zoneb_1st.DBC_Chandelier3", 0)
    wait(0.4)
    SetRotatorMaxSpeed("dbc_zoneb_1st.DBC_Chandelier4", 50)
    StartRotateToPosition("dbc_zoneb_1st.DBC_Chandelier4", 0)
    ForEachEntityInGroup(ForcePainted, "dbc_zoneb_1st.DBC_Chandeliers")
    wait(1)
    ReleaseCamera(CAMERA_LERP_TRANSITION, 1.5)
    UnrestrictCutSceneInput()
  end
end
DBC_ZoneB1_SpawnCanister = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneB1_Canister") == 1 then
    DialogBoxAdvanced("Step into the screen?", "Yes", "No")
    wait(0.3)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "Well, when you get ready, come back here.", 3, "Gus", "Gus")
    elseif GetDialogResponse() == "Yes" then
      LoadLevel(GetPlayer(), "Levels/Demo_GV_Start.level")
    end
  else
    Bark(GetPlayer(), "We need something to make this work...", 3, "Gus", "Gus")
  end
end
DBC_ZoneB1_LeaveLevel = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneE1_Hint1") == 0 then
    Bark(GetPlayer(), "Use the B Button to Throw Paint. Use the Z Button to throw thinner.", 3, "Gus", "Gus")
    PauseMenuObjectives(GetPlayer(), [[
Objective: 
 Use paint and thinner to get through the hallway.]])
    SetGlobal("DBC_ZoneE1_Hint1", 1)
  end
end
DBC_ZoneE1_Hint1Function = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneE1_Hint2") == 0 then
    Bark(GetPlayer(), "Press A to Jump.", 3, "Gus", "Gus")
    PauseMenuObjectives(GetPlayer(), [[
Objective: 
 Use jump to get out of the lab]])
    SetGlobal("DBC_ZoneE1_Hint2", 1)
  end
end
DBC_ZoneE1_Hint2Function = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneE1_Hint3") == 0 then
    Bark(GetPlayer(), "Use the analog stick to move Mickey about", 3, "Gus", "Gus")
    PauseMenuObjectives(GetPlayer(), [[
Objective: 
 Move around with the analog stick]])
    SetGlobal("DBC_ZoneE1_Hint3", 1)
  end
end
DBC_ZoneE1_Hint3Function = L0_0
function L0_0()
  if GetGlobal("DBC_ZoneE1_Hint4") == 0 then
    Bark(GetPlayer(), "It looks like you don't weigh enough, we should come back later.", 3, "Gus", "Gus")
    SetGlobal("DBC_ZoneE1_Hint4", 1)
  end
end
DBC_ZoneE1_Hint4Function = L0_0
function L0_0()
  UnrestrictCutSceneInput()
  Wait(0)
  LoadLevel(GetPlayer(), "Levels/GV_ZoneA_Start.level")
end
LeaveSleepingBeauty = L0_0
