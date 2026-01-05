-- Error logging for troubleshooting
-- Dumps Neovim errors and notifications to a consistent log file

local log_path = vim.fn.stdpath 'log' .. '/nvim-errors.log'

-- Ensure log directory exists
vim.fn.mkdir(vim.fn.stdpath 'log', 'p')

-- Store original notify
local original_notify = vim.notify

-- Override vim.notify to also log to file
vim.notify = function(msg, level, opts)
  -- Call original notify
  original_notify(msg, level, opts)

  -- Only log warnings and errors
  level = level or vim.log.levels.INFO
  if level >= vim.log.levels.WARN then
    local level_name = level == vim.log.levels.ERROR and 'ERROR'
      or level == vim.log.levels.WARN and 'WARN'
      or 'INFO'

    local timestamp = os.date '%Y-%m-%d %H:%M:%S'
    local log_entry = string.format('[%s] [%s] %s\n', timestamp, level_name, msg)

    local file = io.open(log_path, 'a')
    if file then
      file:write(log_entry)
      file:close()
    end
  end
end

-- Log unhandled Lua errors
vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    -- Capture any final messages
    local messages = vim.fn.execute 'messages'
    if messages and messages:match '[Ee]rror' then
      local file = io.open(log_path, 'a')
      if file then
        file:write(string.format('\n[%s] [SESSION MESSAGES]\n%s\n', os.date '%Y-%m-%d %H:%M:%S', messages))
        file:close()
      end
    end
  end,
})

-- Command to view log file
vim.api.nvim_create_user_command('NvimErrorLog', function()
  vim.cmd('edit ' .. log_path)
end, { desc = 'Open Neovim error log' })

-- Command to clear log file
vim.api.nvim_create_user_command('NvimErrorLogClear', function()
  local file = io.open(log_path, 'w')
  if file then
    file:write ''
    file:close()
    vim.notify('Error log cleared', vim.log.levels.INFO)
  end
end, { desc = 'Clear Neovim error log' })

return {}
