-- Fully reworked & explained

-- set variables
local AnimationStep
AnimationStep = 0

-- test animation steps
function test_animation_advance(var1)
  local invar1
  invar1 = GetPropertyString(var1, "Sequence Names", AnimationStep)
  if invar1 == nil then
    AnimationStep = 0
    AnimGBReset(var1)
    AnimGBSequence(var1, 0)
    Bark(nil, "Restarting from Animation Index 0")
  else
    AnimGBReset(var1)
    AnimGBSequence(var1, invar1)
    Bark(nil, "Animation Index " .. AnimationStep .. invar1)
    AnimationStep = AnimationStep + 1
  end
end
