local L0_0
L0_0 = BuildConfig
L0_0 = L0_0()
if L0_0 ~= "FINAL" then
  L0_0 = Print
  L0_0(BuildConfig(), "Strict.lua will run.")
  L0_0 = getmetatable
  L0_0 = L0_0(_G)
  if L0_0 == nil then
    L0_0 = {}
    setmetatable(_G, L0_0)
  end
  L0_0.__declared = {}
  function L0_0.__newindex(A0_1, A1_2, A2_3)
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
