---@type LazySpec
return {
  -- Customize LSP
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- disable lsp watcher. Too slow on linux
      local ok, wf = pcall(require, "vim.lsp._watchfiles")
      if ok then
        wf._watchfunc = function()
          return function() end
        end
      end
      --   --    --[[Modify LSP keymaps]]
      --   --local keys = require("lazyvim.plugins.lsp.keymaps").get()
      --   --keys[#keys + 1] = { "gD", false }
      --   --keys[#keys + 1] = { "<leader>cl", false }
      --   --keys[#keys + 1] = { "<leader>cli", "<cmd>LspInfo<cr>", desc = "LspInfo" }
      --   --keys[#keys + 1] =
      --   --  { "<leader>clr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", desc = "Remove workspace" }
      --   --keys[#keys + 1] = { "<leader>cla", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", desc = "Add workspace" }
      --   --keys[#keys + 1] = {
      --   --  "<leader>cll",
      --   --  "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
      --   --  desc = "List workspace",
      --   --}
    end,
    opts = {
      ---@type lazyvim.lsp.Config
      servers = {
        -- configuration for all lsp servers
        ["*"] = {
          keys = {},
        },
      },
    },
  },

  -- Import extra lsp languages configs
  { import = "plugins.extras.lang" },
}
