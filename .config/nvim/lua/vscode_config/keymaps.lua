local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- yank to system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', opts)
keymap({ "n", "v" }, "<leader>Y", '"+Y', opts)

-- paste from system clipboard
keymap({ "n", "v" }, "<leader>p", '"+p', opts)
keymap({ "n", "v" }, "<leader>P", '"+P', opts)

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- J,K: move faster,
keymap({ "n", "v" }, "J", "5j", opts)
keymap({ "n", "v" }, "K", "5k", opts)
keymap("n", "<leader>j", "J", opts)
-- keymap("v", "J", ":m .+1<CR>==", opts)
-- keymap("v", "K", ":m .-2<CR>==", opts)
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- NVIM-Surround: use commands like `ysarB` for: [hello] -> {[hello]}
keymap({ "v", "o" }, "ir", "i[")
keymap({ "v", "o" }, "ar", "a[")
keymap({ "v", "o" }, "ia", "i<")
keymap({ "v", "o" }, "aa", "a<")

-- Switch , with :
keymap({ "n", "v" }, ":", ",", opts)
keymap({ "n", "v" }, ",", ":", opts)

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- Switch between windows
keymap("n", "<C-h>", "<cmd>lua require('vscode').action('workbench.action.navigateLeft')<CR>", opts)
keymap("n", "<C-j>", "<cmd>lua require('vscode').action('workbench.action.navigateDown')<CR>", opts)
keymap("n", "<C-k>", "<cmd>lua require('vscode').action('workbench.action.navigateUp')<CR>", opts)
keymap("n", "<C-l>", "<cmd>lua require('vscode').action('workbench.action.navigateRight')<CR>", opts)

-- Comment out
keymap({ "n", "v" }, "<leader>ö", "<cmd>lua require('vscode').action('editor.action.commentLine')<CR>")

-- call vscode commands from neovim
keymap({ "n", "v" }, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
keymap({ "n", "v" }, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({ "n", "v" }, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({ "n", "v" }, "<leader>a", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({ "n", "v" }, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({ "n", "v" }, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ "n", "v" }, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({ "n", "v" }, "<leader>cr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({ "n", "v" }, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
keymap({ "n", "v" }, "<leader>hp", "<cmd>lua require('vscode').action('workbench.action.togglePanel')<CR>")
keymap({ "n", "v" }, "<leader>hs", "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>")
keymap({ "n", "v" }, "<leader>z", "<cmd>lua require('vscode').action('workbench.action.toggleZenMode')<CR>")

-- project manager keymaps
keymap({ "n", "v" }, "<leader>ma", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
keymap({ "n", "v" }, "<leader>mo", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
keymap({ "n", "v" }, "<leader>me", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")

-- Tab navigation
keymap("n", "<Tab>", "<cmd>lua require('vscode').action('workbench.action.nextEditorInGroup')<CR>", opts)
keymap("n", "<S-Tab>", "<cmd>lua require('vscode').action('workbench.action.previousEditorInGroup')<CR>", opts)
