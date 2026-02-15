-- Laravel support: Blade template syntax highlighting
return {
  'jwalton512/vim-blade',
  ft = 'blade',
  config = function()
    -- Recognize .blade.php files
    vim.filetype.add {
      pattern = {
        ['.*%.blade%.php'] = 'blade',
      },
    }
  end,
}
