-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.exrc = true -- Enable project lua configs

-- Indent
opt.autoindent = true -- Copy indent from current line when starting a new line (When <CR> or 'o' or 'O')
opt.smarttab = true -- When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'

-- Line wrapping
opt.wrap = true -- turn on line wrapping
opt.linebreak = true -- wrap only at word boundaries
opt.showbreak = "→ " -- show an arrow at wrapped lines

-- Spell checker
-- opt.spell = true -- Enable spellchecking
opt.spelllang = { "en", "de" } -- Set languages

-- Map local leader, e.g. for vimtex
vim.g.maplocalleader = ","

-- LSP Server to use for python
vim.g.lazyvim_python_lsp = "ty"

vim.filetype.add({
  pattern = {
    ["%.gitlab%-ci.*%.ya?ml"] = "yaml.gitlab",
  },
})
-- vim.opt.winbar = "%=%m %f"-- %= separation for right alignment, %m modifier flag for buffer, %m path to the buffer
