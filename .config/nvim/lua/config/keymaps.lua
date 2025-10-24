-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- J,K: move faster,
keymap("n", "<leader>j", "J", { noremap = true, silent = true, desc = "Join lower line" })
keymap({ "n", "v" }, "J", "5j", opts)
keymap({ "n", "v" }, "K", "5k", opts)
-- keymap("v", "J", ":m .+1<CR>==", opts)
-- keymap("v", "K", ":m .-2<CR>==", opts)
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- NVIM-Surround: use commands like `ysarB` for: [hello] -> {[hello]}
keymap({ "v", "o" }, "ir", "i[")
keymap({ "v", "o" }, "ar", "a[")
keymap({ "v", "o" }, "ia", "i<")
keymap({ "v", "o" }, "aa", "a<")

-- Tabs
keymap("n", "<leader><tab>j", "<cmd>tabnext<cr>", { desc = "Next Tab" })
keymap("n", "<leader><tab>k", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
vim.keymap.del("n", "<leader><tab>[")
vim.keymap.del("n", "<leader><tab>]")

-- Escape terminal mode
keymap("t", "<S-esc>", "<C-\\><C-n>", opts)
