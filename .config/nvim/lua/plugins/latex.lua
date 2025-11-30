---@type LazySpec
return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  init = function()
    -- vim.g.maplocalleader = ","
    vim.g.vimtex_view_method = "sioyek"
    -- ensure Okular is used with --unique so the same instance is reused
    -- vim.g.vimtex_view_general_viewer = "okular"
    -- vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
    -- vim.g.tex_flavor = "latex"
    -- vim.g.vimtex_compiler_progname = "nvr"
  end,
}
