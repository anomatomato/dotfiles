require("lazy").setup({
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      incremental = true,
      -- jump labels
      labels = "asdfghjklqwertyuiopzxcvbnmöäü<.",
      jump = {
        -- automatically jump when there is only one match
        autojump = true,
        -- add pattern to search history
        history = true,
        -- add pattern to search register
        register = true,
      },
      modes = {
        -- enhanced f,F,t,T
        char = {
          enabled = false,
          jump_labels = false,
        },
        -- using / or ?
        search = {
          enabled = true,
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n",  "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<leader><leader>s", mode = { "n" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = ":TSUpdate",
  --   config = function()
  --     local configs = require("nvim-treesitter.configs")
  --
  --     configs.setup({
  --       ensure_installed = { "c", "lua", "vim", "query", "javascript", "typescript", "html", "css", "python", "tsx" },
  --       sync_install = false,
  --       highlight = { enable = true },
  --       indent = { enable = true },
  --     })
  --   end,
  -- },
  -- {
  --   "kylechui/nvim-surround",
  --   version = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   event = "VeryLazy",
  --   config = function()
  --     require("nvim-surround").setup({
  --       -- Configuration here, or leave empty to use defaults
  --     })
  --   end,
  -- },
  {
    "nvim-mini/mini.surround",
    opts = {
      -- see https://github.com/nvim-mini/mini.surround?tab=readme-ov-file#default-config

      -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
      highlight_duration = 1000,

      -- How to search for surrounding (first inside current line, then inside
      -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
      -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
      -- see `:h MiniSurround.config`.
      search_method = "cover_or_next",

      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },
})
