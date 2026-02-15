-- Colorscheme collection for quick switching via Telescope
-- Use <leader>fc to browse and preview themes
-- Theme choice is persisted across sessions

-- Persistence helpers
local theme_file = vim.fn.stdpath('data') .. '/colorscheme.txt'

local function save_colorscheme(name)
  local file = io.open(theme_file, 'w')
  if file then
    file:write(name)
    file:close()
  end
end

local function load_colorscheme()
  local file = io.open(theme_file, 'r')
  if file then
    local name = file:read('*l')
    file:close()
    return name
  end
  return nil
end

local function apply_saved_colorscheme()
  local saved = load_colorscheme()
  if saved and saved ~= '' then
    local ok = pcall(vim.cmd.colorscheme, saved)
    if ok then
      return true
    end
  end
  return false
end

-- Auto-save colorscheme when changed
vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('PersistColorscheme', { clear = true }),
  callback = function(args)
    save_colorscheme(args.match)
  end,
})

return {
  -- Kanagawa (default fallback)
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
      })
      -- Apply saved colorscheme, or default to kanagawa
      if not apply_saved_colorscheme() then
        vim.cmd.colorscheme('kanagawa')
      end
    end,
  },

  -- Catppuccin
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        mini = true,
        telescope = true,
      },
    },
  },

  -- Everforest
  {
    'sainnhe/everforest',
    priority = 1000,
    config = function()
      vim.g.everforest_background = 'medium' -- hard, medium, soft
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_better_performance = 1
    end,
  },

  -- Rose Pine
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    opts = {
      variant = 'auto', -- auto, main, moon, dawn
      dark_variant = 'main',
      dim_inactive_windows = false,
      extend_background_behind_borders = true,
    },
  },

  -- Nightfox (includes multiple variants)
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    opts = {
      options = {
        compile_path = vim.fn.stdpath('cache') .. '/nightfox',
        compile_file_suffix = '_compiled',
        transparent = false,
        terminal_colors = true,
        dim_inactive = false,
        module_default = true,
      },
    },
  },

  -- Jade
  {
    'clairox/nvim-jade',
    priority = 1000,
  },
}
