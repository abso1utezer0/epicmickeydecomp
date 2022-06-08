-- Fully reworked

function BP_OrientBall(param1)
  wait(0.05)
  SetFacing(param1, vector4(0, 0, 1))
  if IsValidHandle(param1) then
    if IsValidHandle(GetChildEntityByIndex(param1, 0)) then
      SetPropertyString(GetChildEntityByIndex(param1, 0), "Bone Attach Name", "Eticket_attach", 0)
    end
  end
end

function BP_SpawnPickup(param1)
  if IsValidHandle(param1) then
    ForceSpawn(param1, 1)
  end
end

function BP_UnparentAndKillBall(param1)
  if IsValidHandle(param1) then
    if IsValidHandle(GetPropertyEntity(param1, "Parent Entity", 0)) then
      if IsValidHandle(GetPropertyEntity(param1, "Parent Entity", 0)) then
        ClearParent(param1)
        Kill(GetPropertyEntity(param1, "Parent Entity", 0))
        Kill(GetPropertyEntity(param1, "Parent Entity", 0))
        return
      end
    end
  end
end