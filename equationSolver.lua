function substitute(equation, variable, newValue)
  return equation:gsub(variable, newValue)
end

function addMultiplication(equation)
  return equation:gsub("%d+%a", function(String)
      local decimalFP, DecimalSP = String:find("%d+")
      local decimal = String:sub(decimalFP, DecimalSP)
      local variable = String:sub(DecimalSP + 1)
      return "("..decimal.."*"..variable..")"
  end)
end

function addBracketMultiplication(equation)
  return equation:gsub("%a[(]", function(String)
    return String:sub(String:find("%a")).."*("
  end):gsub("%a[(]", function(String)
  return String:sub(String:find("%d+")).."*("
  end)
end

print(addBracketMultiplication(addMultiplication("3x + 2 = 8x + 7x")))

function getNumber(Second)
  local Number = 0
  Second:gsub("%d+", function(Character)
    Number = Number + tonumber(Character)
  end)
  return Number
end

-- main function

function solve(equation, rangeA, rangeB)
  equation = addBracketMultiplication(addMultiplication(equation))
  -- defining the variable
  local varFind = equation:find("%a")
  local variable = equation:sub(varFind, varFind)
  -- defining two sides of equation
  local leftSide = equation:sub(1, equation:find("=") - 1)
  local rightSide = equation:sub(equation:find("=") + 1)
  -- defining ranges
  rangeA = rangeA or (not rightSide:find(variable) and loadstring("return "..rightSide)() or getNumber(rightSide))
  rangeB = rangeB or (rightSide:find("%-") and -rangeA or 0)
  print(rangeA) print(rangeB)
  -- result variable
  local result = ""
  -- loop
  for number = rangeA, rangeB, -1 do
    local isNumber = loadstring("return "..substitute(leftSide, variable, number).."=="..substitute(rightSide, variable, number))()
    if isNumber then
      result = variable.."="..number
      break
    end
  end
  --returning the result
  return (result ~= "" and result or "Error!")
end

print(solve("3x + 2 = 8x"))
