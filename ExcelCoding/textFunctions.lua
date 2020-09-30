local function MID(text, start_char, num_chars)
  if type(text) == "string" and type(start_char) == "number" and type(num_chars) == "number" then
    local newText = text:sub(start_char, start_char + num_chars)
    return newText
  end
end
--> MID("Hello Mr Sir", 7, 2)
---> Returns: Mr

local function LEFT(text, num_char)
  if type(text) == "string" and type(num_char) == "number" then
    local newText = text:sub(1, num_char)
    return newText
  end
end
--> LEFT("Hello Mr Sir", 5)
---> Returns: Hello

local function RIGHT(text, num_char)
  if type(text) == "string" and type(num_char) == "number" then
    local newText = text:sub(#text - (num_char - 1), #text)
    return newText
  end
end
--> RIGHT("Hello Mr Sir", 3)
---> Returns: Sir

local function LEN(text)
  if type(text) == "string" then
    local newText = #text
    return newText
  end
end
--> LEN("Hello Mr Sir")
---> Returns: 12

local function FIND(text, pattern)
  if type(text) == "string" and type(text) == "string" then
    local startPos, endPos = text:find(pattern)
    return startPos
  end
end
--> FIND("Hello Mr Sir", "Sir")
---> Returns: 10

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
--> PROPER("hello mr sir")
---> Returns: Hello Mr Sir

local function REPT(text, number_times)
  if type(text) == "string" and type(number_times) == "number" then
    local newText = text
    for i = 1, (number_times - 1)  do
      newText = newText..text
    end
    return newText
  end
end
--> REPT("Repeat Me", 2)
---> Repeat MeRepeat Me

local function TRIM(text)
  if type(text) == "string" then
    local newText = (text:gsub("\32+", " "))
    return newText
  end
end
--> TRIM("Hello   Mr   Sir")
---> Retuns: Hello Mr Sir

local function UPPER(text)
  if type(text) == "string" then
    local newText = text:upper()
    return newText
  end
end
--> UPPER("hello mr sir")
---> Returns: HELLO MR SIR

local function SUBSTITUTE(text, old_text, new_text)
  if type(text) == "string" and type(old_text) == "string" and type(new_text) == "string" then
    print("aa")
    local newText = text:gsub(old_text, new_text)
    return newText
  end
end
--> SUBSTITUTE("Hello Mr Sir", "Hello", "Goodbye")
---> Returns: Goodbye Mr Sir

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
--> CONCATENATE("Hello", "Mr", "Sir")
---> Returns: HelloMrSir
