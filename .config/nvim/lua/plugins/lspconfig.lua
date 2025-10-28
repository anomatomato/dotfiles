return {
  "neovim/nvim-lspconfig",
  opts = {
    ---@type lazyvim.lsp.Config
    servers = {
      -- configuration for all lsp servers
      ["*"] = {
        keys = {
          {
            "K",
            function()
              return vim.lsp.buf.hover({ border = "rounded", max_height = 25, max_width = 120 })
            end,
            desc = "Hover Documentation",
          },
        },
      },
    },
  },
}
