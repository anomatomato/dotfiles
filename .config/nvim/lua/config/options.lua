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

-- LSP Server to use for python
vim.g.lazyvim_python_lsp = "basedpyright"

vim.g.vimtex_view_method = "sioyek"
-- ensure Okular is used with --unique so the same instance is reused
-- vim.g.vimtex_view_general_viewer = "okular"
-- vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
-- vim.g.tex_flavor = "latex"
-- vim.g.vimtex_compiler_progname = "nvr"

-- vim.opt.winbar = "%=%m %f"-- %= separation for right alignment, %m modifier flag for buffer, %m path to the buffer
