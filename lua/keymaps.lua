-- Shorten function name
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true, noremap = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Esc Insert Mode
keymap('i', 'jk', '<Esc>', { noremap = true })

-- Splits
keymap('n', '|', ':split<cr>', opts)
keymap('n', '<C-\\>', ':vsplit<cr>', opts)
keymap('n', '<leader>sh', ':split<cr>', opts)
keymap('n', '<leader>sv', ':vsplit<cr>', opts)

-- Navigate splits
keymap('n', 'sh', '<C-w>W', opts) -- Previous split
keymap('n', 'sl', '<C-w>w', opts) -- Next split

-- Keep Cursor Centered When Navigating Between Instances of Search Term
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

-- Preserve Void Register on paste
keymap('x', '<leader>p', '"_dP', opts)
keymap('v', 'p', '"_dP', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<cr>', opts)
keymap('n', '<C-Down>', ':resize +2<cr>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<cr>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<cr>', opts)

-- Close buffers
keymap('n', '<leader>Q', ':wa<cr>:qa<cr>', opts)

-- Fast save
keymap('n', '<leader>w', ':w<cr>', opts)
keymap('n', '<leader>W', ':wa<cr>', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Replace
keymap('n', '<leader>S', ':%s/', opts)

-- Show LSP Line Diagnostics
keymap('n', '<leader>?', ':lua vim.diagnostic.open_float()<cr>', opts)

-- Tabs
keymap('n', '<leader>ta', ':$tabnew<CR>', { noremap = true })
keymap('n', '<leader>tc', ':tabclose<CR>', { noremap = true })
keymap('n', '<leader>to', ':tabonly<CR>', { noremap = true })
keymap('n', '<leader>tn', ':tabn<CR>', { noremap = true })
keymap('n', '<leader>tp', ':tabp<CR>', { noremap = true })
keymap('n', '<leader>tmp', ':-tabmove<CR>', { noremap = true })
keymap('n', '<leader>tmn', ':+tabmove<CR>', { noremap = true })

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files<cr>', opts)
keymap('n', '<leader>fs', ':Telescope live_grep<cr>', opts)
keymap('n', '<leader>fp', ':Telescope projects<cr>', opts)
keymap('n', '<leader>fb', ':Telescope buffers<cr>', opts)
keymap('n', '<leader>fn', ':Telescope notify<cr>', opts)
keymap('n', '<leader>fh', ':Telescope harpoon marks<cr>', opts)
keymap('n', '<leader>fr', ':Telescope resume<cr>', opts)
