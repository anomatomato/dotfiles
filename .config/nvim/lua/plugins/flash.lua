---@type LazySpec
return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
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
  },
  ---@type LazySpec
  "folke/which-key.nvim",
  event = "VeryLazy",
  ---@type wk.Opts
  opts = {
    -- defaults = {
    --   { ["<localLeader>"] = { name = "+local leader" } },
    -- },
    specs = {
      { ["<localLeader>"] = { name = "+local leader" } },
      {
        "<localLeader>",
        group = "+local leader",
        desc = "Local leader",
        name = "+local leader",
      },
      {
        ",",
        group = "+local leader",
        desc = "Local leader",
        name = "+local leader",
      },
    },
  },
  ---@type wk.Config
  -- config = function()
  --   local wk = require("which-key")
  --   wk.add({
  --     { "<localLeader>", group = "+local leader" },
  --   })
  -- end,
}
