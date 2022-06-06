-- Fully reworked

function BP_OrientBall(var1)
  wait(0.05)
  SetFacing(var1, vector4(0, 0, 1))
  if IsValidHandle(var1) then
    if IsValidHandle(GetChildEntityByIndex(var1, 0)) then
      SetPropertyString(GetChildEntityByIndex(var1, 0), "Bone Attach Name", "Eticket_attach", 0)
    end
  end
end

function BP_SpawnPickup(var1)
  if IsValidHandle(var1) then
    ForceSpawn(var1, 1)
  end
end

function BP_UnparentAndKillBall(var1)
  if IsValidHandle(var1) then
    if IsValidHandle(GetPropertyEntity(var1, "Parent Entity", 0)) then
      if IsValidHandle(GetPropertyEntity(var1, "Parent Entity", 0)) then
        ClearParent(var1)
        Kill(GetPropertyEntity(var1, "Parent Entity", 0))
        Kill(GetPropertyEntity(var1, "Parent Entity", 0))
        return
      end
    end
  end
end