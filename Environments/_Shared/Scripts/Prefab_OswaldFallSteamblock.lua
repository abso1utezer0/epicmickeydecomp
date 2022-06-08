-- Fully reworked

function OswaldEarsCheck(param1, param2, param3, param4, param5, param6)
  if GetPropertyBool(param2, "Is Painted") == false and GetPropertyBool(param3, "Is Painted") == false then
    DestroyEntity(param1)
    Reverse(param4)
    wait(0.5)
    DestroyEntity(param5)
    DestroyEntity(param6)
  end
end

function OswaldEarsSteamTime(param1, param2, param3, param4, param5)
  if GetPropertyBool(param4, "Is Painted") == true or GetPropertyBool(param5, "Is Painted") == true then
    Hide(param2)
    Disable(param3)
    wait(2)
    Unhide(param2)
    Enable(param3)
    FireUser2(param1)
  end
end