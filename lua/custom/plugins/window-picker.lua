return {
  's1n7ax/nvim-window-picker',
  version = '2.*',
  event = 'VeryLazy',
  config = function()
    local picker = require 'window-picker'
    picker.setup {
      hint = 'floating-big-letter',
      filter_rules = {
        bo = {
          filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
          buftype = { 'terminal', 'quickfix' },
        },
      },
    }

    vim.keymap.set('n', '<leader>j', function()
      local win = picker.pick_window()
      if win then
        vim.api.nvim_set_current_win(win)
      end
    end, { desc = 'Pick window' })

    vim.keymap.set('n', '<leader>k', function()
      local win = picker.pick_window()
      if win then
        local current_win = vim.api.nvim_get_current_win()
        local current_buf = vim.api.nvim_win_get_buf(current_win)
        local target_buf = vim.api.nvim_win_get_buf(win)
        vim.api.nvim_win_set_buf(current_win, target_buf)
        vim.api.nvim_win_set_buf(win, current_buf)
      end
    end, { desc = 'Swap window' })
  end,
}
