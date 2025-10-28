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
    },
  },

  {
    "saghen/blink.cmp",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        ["<Tab>"] = {
          "snippet_forward",
          function() -- sidekick next edit suggestion in insert mode
            return require("sidekick.nes").apply()
          end,
          function() -- if you are using Neovim's native inline completions
            return vim.lsp.inline_completion.get()
          end,
          "fallback",
        },
      },
    },
  },
}
