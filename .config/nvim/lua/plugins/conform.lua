---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@type conform.setupOpts
  opts = {
    -- log_level = vim.log.levels.DEBUG,
    formatters = {
      prettier = {
        append_args = {
          -- "--print-width",
          -- "120", -- max line length
        },
      },
    },
  },
}
