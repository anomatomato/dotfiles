-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NVIM-Surround: use commands like `ysarB` for: [hello] -> {[hello]}
keymap({ "v", "o" }, "ir", "i[", { desc = "[] block" })
keymap({ "v", "o" }, "ar", "a[", { desc = "[] block" })
-- keymap({ "v", "o" }, "ia", "i<", { desc = "<> block" })
-- keymap({ "v", "o" }, "aa", "a<", { desc = "<> block" })

-- Tabs
keymap("n", "<leader><tab>j", "<cmd>tabnext<cr>", { desc = "Next Tab" })
keymap("n", "<leader><tab>k", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
vim.keymap.del("n", "<leader><tab>[")
vim.keymap.del("n", "<leader><tab>]")

-- Buffers
keymap("n", "<leader>bH", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer prev" })
keymap("n", "<leader>bL", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer next" })

-- Correcting spelling mistakes
keymap("i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<c-g>u", { desc = "Correct previous spelling mistake" })
-- Escape terminal mode
keymap("t", "<S-esc>", "<C-\\><C-n>", opts)

-- J,K: move faster,
-- keymap("n", "<leader>j", "J", { noremap = true, silent = true, desc = "Join lower line" })
-- keymap({ "n", "v" }, "J", "5j", opts)
-- keymap({ "n", "v" }, "K", "5k", opts)
-- keymap("v", "J", ":m .+1<CR>==", opts)
-- keymap("v", "K", ":m .-2<CR>==", opts)
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- keymap("x", "p", '"_dP', { desc = "Replace without yanking", noremap = true })
-- keymap("n", "d", '"_d', { desc = "Delete without yanking", noremap = true }) -- e.g <leader>dd deletes the current line without yanking it
-- keymap("n", "D", '"_D', { desc = "Delete until EOL without yanking", noremap = true })
-- keymap("n", "c", '"_c', { desc = "Change without yanking", noremap = true })
-- keymap("n", "C", '"_C', { desc = "Change until EOL without yanking", noremap = true })

if vim.g.started_by_firenvim then
  keymap({ "n", "x", "i", "s" }, "<C-s>", "<Cmd>silent write<CR>", { desc = "Save File (silent)" })
end
