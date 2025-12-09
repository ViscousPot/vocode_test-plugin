-- function applyTemplate(data, template)
--   print("/////applyTemplate")
--   local text = data["text"]
--   print(text)
--   local timestamp = data["timestamp"]
--   print(timestamp)
--   local timestampNum = toNumber(timestamp)
--   print(timestampNum)
--   local dateString = os.date("yyyy-MM-dd", timestampNum)
--   local timeString = os.date("HH:mm:ss", timestampNum)
--   print(string.interpolate(template, { text = text, date = dateString, time = timeString }))
--   return string.interpolate(template, { text = text, date = dateString, time = timeString })
-- end

-- function writeAtOffsetToFile(settings, data, editOffset)
--   for i = 1, math.abs(editOffset) do
--       if editOffset > 0 then
--           file.readForwardLine()
--       elseif editOffset < 0 then
--           file.readBackwardLine()
--       end
--   end

--   local adjustedPosition = file.getPosition()

--   local remainingBytes = file.read(file.getLength() - adjustedPosition)
--   file.setPosition(adjustedPosition)

--   print(editOffset)
--   if editOffset >= 0 then
--       file.writeString(applyTemplate(data, settings["Formatting"]) .. '\n')
--   else
--       file.writeString('\n' .. applyTemplate(data, settings["Formatting"]))
--   end
--   file.writeString(remainingBytes)
-- end

function add(settings, data)
  print("add test")
  local repsonse = http.get("https://api.sampleapis.com/coffee/hot", {}, {});

  print("response gotted")
  print(response)
  print("Response: " .. response)
  -- print(settings["Target File Path"])
  -- print(data["text"])
  -- local searchString = settings["Target String"]

  -- result = file.open("Target File Path", "applyTemplate", data)
  -- if not result then
  --   return false
  -- end
  
  -- local editOffset = toNumber(settings["Edit Offset"]) or 0

  -- local position = 0
  -- file.setPosition(0)

  -- if string.len(searchString) < 1 then
  --   if editOffset < 0 then
  --       file.setPosition(file.getLength())
  --   else
  --       file.setPosition(0)
  --   end

  --   writeAtOffsetToFile(settings, data, editOffset)
  --   file.close("applyTemplate", data)
  --   return true
  -- end

  -- while file.getPosition() < file.getLength() do
  --   position = file.getPosition()
  --   local line = file.readForwardLine()

  --   if (string.find(line, searchString)) then 

  --     if editOffset < 0 then
  --         file.setPosition(position)
  --     end

  --     writeAtOffsetToFile(settings, data, editOffset)
  --     file.close("applyTemplate", data)
  --     return true
  --   end
  -- end

  -- file.close("applyTemplate", data)
  return true
end

function remove(settings, data)
  -- result = file.open("Target File Path", "applyTemplate", data)
  -- if not result then
  --   return false
  -- end
  -- local position = 0
  -- file.setPosition(0)

  -- local originalText = applyTemplate(data, settings["Formatting"])

  -- print(originalText)

  -- while file.getPosition() < file.getLength() do
  --   position = file.getPosition()
  --   local line = file.readForwardLine()
  --   print(line)

  --   local firstLine = string.match(originalText, "([^\n]*)")
  --   local count = 0
  --   for _ in string.gmatch(originalText, "([^\n]+)") do
  --     count = count + 1
  --   end

  --   print(count)
  --   if (line == firstLine) then 
  --     if (count > 1) then
  --       for i = 1,count-1  do
  --         print(file.readForwardLine())
  --       end 
  --     end
  --     local endOfLinePosition = file.getPosition()

  --     local fileLength = file.getLength()

  --     local remainingBytes = file.read(fileLength - endOfLinePosition)

  --     print(remainingBytes)

  --     file.setPosition(position)

  --     file.writeString(remainingBytes)

  --     file.truncate(toInteger(math.max(fileLength - string.len(originalText .. '\n'), 0)))
              
  --     file.close("applyTemplate", data)
  --     return true
  --   end
  -- end

  -- file.close("applyTemplate", data)
  return true
end

function getInitialSettings()
  return {
      { name = "Edit Offset", _description = "An integer (+-) specifying the number of lines relative to the anchor string's location where the editing should occur.", type = "number", _default = -1, _hint = "-1" },
  }
end