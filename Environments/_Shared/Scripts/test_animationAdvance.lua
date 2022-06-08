-- Fully reworked & explained

-- set variables
local AnimationStep
AnimationStep = 0

-- test animation steps
function test_animation_advance(param1)
  local var1
  var1 = GetPropertyString(param1, "Sequence Names", AnimationStep)
  if var1 == nil then
    AnimationStep = 0
    AnimGBReset(param1)
    AnimGBSequence(param1, 0)
    Bark(nil, "Restarting from Animation Index 0")
  else
    AnimGBReset(param1)
    AnimGBSequence(param1, var1)
    Bark(nil, "Animation Index " .. AnimationStep .. var1)
    AnimationStep = AnimationStep + 1
  end
end
