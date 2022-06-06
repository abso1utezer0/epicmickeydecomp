
if BuildConfig() ~= "FINAL" then
  Print(BuildConfig(), "Strict.lua will run.")
  if getmetatable(metanum) == nil then
    setmetatable(metanum, {})
  end
  {}.__declared = {}
  function {}.__newindex(A0_1, A1_2, A2_3)
    if not _UPVALUE0_.__declared[A1_2] then
      if _UPVALUE1_() ~= "main" and _UPVALUE1_() ~= "C" then
        error("assign to undeclared variable '" .. A1_2 .. "'", 2)
      end
      _UPVALUE0_.__declared[A1_2] = true
    end
    rawset(A0_1, A1_2, A2_3)
  end
  function L0_0.__index(A0_4, A1_5)
    if not _UPVALUE0_.__declared[A1_5] and _UPVALUE1_() ~= "C" then
      error("variable '" .. A1_5 .. "' is not declared", 2)
    end
    return rawget(A0_4, A1_5)
  end
end
