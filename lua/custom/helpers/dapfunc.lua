local M = {}

local select_mode = function()
  local modes = { 'debug', 'profile', 'release' }

  return coroutine.create(vim.ui.select(modes, { prompt = 'Select mode: ' }, function(choice)
    local result = nil
    if choice ~= 'debug' then
      result = '--' .. choice
    end

    coroutine.resume(result)
  end))
end

local select_env = function()
  local envs = { 'PROD', 'DEV', 'None' }

  return coroutine.create(vim.ui.select(envs, { prompt = 'Select env: ' }, function(choice)
    local result = nil
    if choice ~= 'None' then
      result = '--dart-define=ENVIRONMENT=' .. choice
    end

    coroutine.resume(result)
  end))
end

local input_env = function()
  return coroutine.create(vim.ui.input('Extra envs', function(value)
    coroutine.resume(value)
  end))
end

M.set_env = function()
  return coroutine.create(function(dap_run_co)
    local args = ''

    local mode = select_mode()
    if mode ~= nil then
      args = '--' .. mode
    end

    local env = select_env()
    if env ~= nil then
      args = args .. ' ' .. '--dart-define=ENVIRONMENT=' .. choice
    end

    local extra_envs = ''
    while true do
      local current = input_env()

      if current == '' then
        break
      end

      extra_envs = extra_envs .. ' ' .. '--dart-define=' .. current
    end

    args = args .. '' .. extra_envs

    coroutine.resume(dap_run_co, { args })
  end)
end

M.input_cwd = function()
  return coroutine.create(function(dap_run_co)
    vim.ui.input('Path: ./', function(path)
      coroutine.resume(dap_run_co, '${workspaceFolder}/' .. path)
    end)
  end)
end

return M
