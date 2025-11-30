---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    -- Works as a function, because it seems to run AFTER LazyVim has merged all defaults/extras and lets you overwrite the final table.
    -- A table would just get deep-merged early. See https://www.lazyvim.org/configuration/plugins#%EF%B8%8F-customizing-plugin-specs
    ---@param _ LazyPlugin
    opts = function(_, opts)
      ---@type lazyvim.lsp.Config
      opts.servers.copilot = {
        -- Disable copilot lsp by default to save RAM, every nvim window consumes 300-800mb RAM with enabled
        enabled = false,
        settings = {
          telemetry = {
            -- doesn't work, seems to be a vscode setting
            telemetryLevel = "off",
          },
        },
      }
    end,
  },

  {
    "folke/sidekick.nvim",
    ---@type sidekick.Config
    opts = {
      nes = {
        -- enabled = false,
        trigger = {
          -- events that trigger sidekick next edit suggestions
          events = { "ModeChanged i:n", "TextChanged", "User SidekickNesDone", "TextChangedI" }, --"TextChangedI"
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
          if not (require("sidekick.nes").have() and require("sidekick.nes").apply()) then
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
            if require("sidekick.nes").have() then
              return require("sidekick.nes").apply()
            else
              return false
            end
          end,
          -- function() -- if you are using Neovim's native inline completions
          --   return vim.lsp.inline_completion.get()
          -- end  ,
          "fallback",
        },
      },
    },
  },
}
