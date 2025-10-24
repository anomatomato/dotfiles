return {
  {
    "folke/sidekick.nvim",
    ---@type sidekick.Config
    opts = {
      nes = {
        trigger = {
          -- events that trigger sidekick next edit suggestions
          events = { "ModeChanged i:n", "TextChanged", "User SidekickNesDone", "TextChangedI" },
        },
        clear = {
          events = {}, -- remove the default [ "TextChangedI", "InsertEnter" ] for clearing events
        },
      },
    },
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick.nes").apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<leader>aT",
        -- Toggle AI next edit suggestions
        function()
          require("sidekick.nes").toggle()
        end,
        desc = "Sidekick Toggle Suggestions",
      },
      {
        "<leader>ae",
        -- Enable AI next edit suggestions
        function()
          require("sidekick.nes").enable()
        end,
        desc = "Sidekick Enable Suggestions",
      },
    },
  },
}
