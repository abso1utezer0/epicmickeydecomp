local L0_0, L1_1
L0_0 = 0
AnimationStep = L0_0
function L0_0(A0_2)
  local L1_3
  L1_3 = GetPropertyString
  L1_3 = L1_3(A0_2, "Sequence Names", AnimationStep)
  if L1_3 == nil then
    AnimationStep = 0
    AnimGBReset(A0_2)
    AnimGBSequence(A0_2, 0)
    Bark(nil, "Restarting from Animation Index 0")
  else
    AnimGBReset(A0_2)
    AnimGBSequence(A0_2, L1_3)
    Bark(nil, "Animation Index " .. AnimationStep .. L1_3)
    AnimationStep = AnimationStep + 1
  end
end
test_animation_advance = L0_0
