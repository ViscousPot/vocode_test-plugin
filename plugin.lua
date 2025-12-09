function add(settings, data)
  local api_token = settings["API Token"]
  local headers = {
      Authorization = "Bearer " .. api_token,
      ["Content-Type"] = "application/json"
  }
  local body = '{"content": "' .. data["text"] .. '", "labels": ["' .. data["timestamp"] .. '"]}'

  local response = http.post("https://api.todoist.com/api/v1/tasks", headers, body, {})
  return true
end

function remove(settings, data)
  local api_token = settings["API Token"]
  local headers = {
      Authorization = "Bearer " .. api_token,
      ["Content-Type"] = "application/json"
  }
  local url = 'https://api.todoist.com/api/v1/tasks/filter?query=@' .. data["timestamp"]
  local response = http.get(url, headers, "", {})
  local body = json.decode(response)

  if not body["results"][1]["id"] then
    return false
  end

  local deleteUrl = 'https://api.todoist.com/api/v1/tasks/' .. body["results"][1]["id"]
  http.delete(deleteUrl, headers, {})
  return true
end

function getInitialSettings()
  return {
    { name = "API Token", _description = "Your Todoist API Token, found at Settings > Integrations > Developer", type = "text", _hint = "0123456789abcdef0123456789abcdef01234567" },
  }
end