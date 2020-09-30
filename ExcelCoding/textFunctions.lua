local function MID(text, start_char, num_chars)
  if type(text) == "string" and type(start_char) == "number" and type(num_chars) == "number" then
    local newText = text:sub(start_char + 1, start_char + num_chars)
    return newText
  end
end

local function LEFT(text, num_char)
  if type(text) == "string" and type(num_char) == "number" then
    local newText = text:sub(1, num_char)
    return newText
  end
end

local function RIGHT(text, num_char)
  if type(text) == "string" and type(num_char) == "number" then
    local newText = text:sub(#text - (num_char - 1), #text)
    return newText
  end
end

local function LEN(text)
  if type(text) == "string" then
    local newText = #text
    return newText
  end
end

local function FIND(text, pattern)
  if type(text) == "string" and type(text) == "string" then
    local startPos, endPos = text:find(pattern)
    return startPos
  end
end

local function PROPER(text)
  if type(text) == "string" then
  local newText = ""
  for i in text:gmatch("%S+") do
    local upperWord = i:sub(1,1):upper()..i:sub(2, #text)
    newText = newText..upperWord.." "
  end
  newText = newText:sub(1, #newText - 1)
  return newText
  end
end

local function REPT(text, number_times)
  if type(text) == "string" and type(number_times) == "number" then
    local newText = text
    for i = 1, (number_times - 1)  do
      newText = newText..text
    end
    return newText
  end
end

local function TRIM(text)
  if type(text) == "string" then
    local newText = (text:gsub("\32+", " "))
    return newText
  end
end

local function UPPER(text)
  if type(text) == "string" then
    local newText = text:upper()
    return newText
  end
end

local function SUBSTITUTE(text, old_text, new_text)
  if type(text) == "string" and type(old_text) == "string" and type(new_text) == "string" then
    print("aa")
    local newText = text:gsub(old_text, new_text)
    return newText
  end
end

local function CONCATENATE(text1, text2, ...)
  local items = {text1, text2, ...}
  for i = 1, #items do
    if type(items[i]) ~= "string" then
      return
    end
  end
  local newText = table.concat(items)
  return newText
end

