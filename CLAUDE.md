# Neovim Configuration - Claude Code Instructions

## Error Troubleshooting

When troubleshooting Neovim errors or issues, check the error log at:

```
~/.local/state/nvim/nvim-errors.log
```

You can read this file to see recent warnings and errors. The log includes:
- Timestamps
- Severity level (WARN/ERROR)
- Error messages and notifications

**Important:** When the user confirms an issue has been addressed, delete that specific error/warning entry from the log file to keep it clean and relevant.

### Useful Commands

Within Neovim:
- `:NvimErrorLog` - Opens the error log file
- `:NvimErrorLogClear` - Clears the error log
- `:messages` - Shows recent Neovim messages
- `:checkhealth` - Runs health checks for plugins

### Project Structure

- `init.lua` - Main configuration entry point
- `lua/keymaps.lua` - Custom keybindings
- `lua/kickstart/plugins/` - Kickstart plugin configs
- `lua/custom/plugins/` - Custom plugin configs (auto-loaded)

### Key Plugins

- lazy.nvim - Plugin manager
- neo-tree - File explorer
- telescope - Fuzzy finder
- auto-session - Session management
- blink.cmp - Autocompletion
- LSP via mason + nvim-lspconfig
