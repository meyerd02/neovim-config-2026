return {
  'rmagatti/auto-session',
  lazy = false,
  opts = {
    auto_restore = true,
    auto_save = true,
    auto_create = true,
    suppressed_dirs = { '~/', '~/Downloads', '~/Desktop', '/' },
    pre_save_cmds = { 'Neotree close' },
    post_restore_cmds = { 'Neotree close' },
    bypass_save_filetypes = { 'neo-tree', 'neo-tree-popup' },
  },
}
