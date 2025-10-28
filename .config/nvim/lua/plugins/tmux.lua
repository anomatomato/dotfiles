return {
  "christoomey/vim-tmux-navigator",
  -- lazy=false,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate to the left tmux pane" } },
    { "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate to the bottom tmux pane" } },
    { "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate to the top tmux pane" } },
    { "<c-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate to the right tmux pane" } },
    { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Navigate to the previous tmux pane" } },
  },
}
