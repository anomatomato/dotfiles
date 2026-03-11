---@type LazySpec
return {
  -- LSP configuration for toml
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ---@type lazyvim.lsp.Config
        taplo = {
          enabled = false,
        },
      },
    },
  },
}
