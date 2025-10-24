local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- blinking cursor
vim.opt.guicursor = {
  "n-v-c:block", -- Normal, Visual, Command-line mode: block cursor
  "i-ci-ve:ver25", -- Insert and Replace modes: vertical cursor (25% of block)
  "r-cr:hor20", -- Replace mode: horizontal cursor (20% of block)
  "o:hor50", -- Operator-pending mode: horizontal cursor (50% of block)
  "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- All modes: Blinking behavior and hightlights
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch mode: Block cursor, faster blink
}
-- Disable cursor highlighting when Neovim is focused
vim.cmd("highlight Cursor guifg=NONE guibg=NONE gui=bold")
--
-- Load VSCode-specific keymaps
require("vscode_config.keymaps")
-- Load VSCode-specific plugins
require("vscode_config.plugins")
