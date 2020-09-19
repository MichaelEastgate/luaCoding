function Substitute(Equation, Variable, NewValue)
 return Equation:gsub(Variable, NewValue)
end

function AddMultiplication(Equation)
 return Equation:gsub("%d+%a",function(String)
  local DecimalFP,DecimalSP = String:find("%d+")
  local Decimal = String:sub(DecimalFP, DecimalSP)
  local Variable = String:sub(DecimalSP + 1)
  return "("..Decimal.."*"..Variable..")"
 end)
end

function AddBracketMultiplication(Equation)
 return Equation:gsub("%a[(]",function(String)
  return String:sub(String:find("%a")).."*("
 end):gsub("%d+[(]",function(String)
  return String:sub(String:find("%d+")).."*("
 end)
end

function GetNumber(Second)
 local Number = 0
 Second:gsub("%d+",function(Character)
  Number = Number + tonumber(Character)
 end)
 return Number
end

function Solve(Equation, RangeA, RangeB)
 Equation = AddBracketMultiplication(AddMultiplication(Equation))
 local VarPlace = Equation:find("%a")
 local DefaultVar = Equation:sub(VarPlace, VarPlace)
 local SplitFirst = Equation:sub(1, Equation:find("=") - 1)
 local SplitSecond = Equation:sub(Equation:find("=") + 1)
 RangeA = RangeA or (not SplitSecond:find(DefaultVar) and loadstring("return "..SplitSecond)() or GetNumber(SplitSecond))
 RangeB = RangeB or (SplitSecond:find("%-") and -RangeA or 0)
 local Result = ""
 for Number = RangeA, RangeB, -1 do
  local IsNumber = loadstring("return "..Substitute(SplitFirst, DefaultVar, Number).."=="..Substitute(SplitSecond, DefaultVar, Number))()
  if IsNumber then
   Result = DefaultVar.."="..Number
   break
  end
 end
 return (Result ~= "" and Result or "Error!")
end
