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
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
})
