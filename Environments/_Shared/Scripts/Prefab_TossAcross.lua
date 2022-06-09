-- Fully reworked

function TossAcross_Spin(param1, A1_2, A2_3)
  if A1_2 == "1" then
    Enable(param1)
    wait(param3)
    Disable(param1)
  elseif param2 == "2" then
    AnimGBReset(param1)
    AnimGBSetIdle(param1, "False")
    wait(param3)
    AnimGBSetIdle(param1, "True")
  end
end