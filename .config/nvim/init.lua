-- Check if Neovim is running inside VSCode
if vim.g.vscode then
  -- Load VSCode-specific keymaps
  require("vscode_config.lazy")
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
end
