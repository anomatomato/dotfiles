---@type LazySpec
return {
  "folke/noice.nvim",
  ---@type NoiceConfig
  opts = {
    presets = {
      -- see https://github.com/LazyVim/LazyVim/issues/556#issuecomment-1867981476
      lsp_doc_border = true,
    },
  },
}
