---@type LazySpec
return {
  -- Table of contents inside markdown files
  {
    "hedyhli/markdown-toc.nvim",
    ft = "markdown", -- Lazy load on markdown filetype
    cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
    ---@type mtoc.UserConfig
    opts = {
      toc_list = {
        markers = "-", -- default="*"
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      heading = {
        -- enabled = true,
        -- Turn on / off sign column related rendering.
        -- sign = false,

        -- Replaces '#+' of 'atx_h._marker'.
        -- Output is evaluated depending on the type.
        -- | function | `value(context)`              |
        -- | string[] | `cycle(value, context.level)` |
        -- icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        -- Determines how icons fill the available space.
        -- | right   | '#'s are concealed and icon is appended to right side                      |
        -- | inline  | '#'s are concealed and icon is inlined on left side                        |
        -- | overlay | icon is left padded with spaces and inserted on left hiding additional '#' |
        -- position = "overlay",

        -- Width of the heading background.
        -- | block | width of the heading text |
        -- | full  | full width of the window  |
        -- Can also be a list of the above values evaluated by `clamp(value, context.level)`.
        -- width = "full",

        -- Determines if a border is added above and below headings.
        -- Can also be a list of booleans evaluated by `clamp(value, context.level)`.
        -- border = true,
        -- Always use virtual lines for heading borders instead of attempting to use empty lines.
        -- border_virtual = true,
      },
    },
  },
}
