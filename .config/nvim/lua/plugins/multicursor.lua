-- stylua: ignore
if true then return {} end

---@type LazySpec
return {
  "jake-stewart/multicursor.nvim",
  -- branch = "1.0",
  event = "VeryLazy",
  -- key bindings can be declared here so LazyVim
  -- will set them up automatically
  keys = {
    -- add/skip cursor above/below
    {
      "<Up>",
      function()
        require("multicursor-nvim").lineAddCursor(-1)
      end,
      mode = { "n", "x" },
      desc = "MC: add cursor above",
    },
    {
      "<Down>",
      function()
        require("multicursor-nvim").lineAddCursor(1)
      end,
      mode = { "n", "x" },
      desc = "MC: add cursor below",
    },
    {
      "<leader><Up>",
      function()
        require("multicursor-nvim").lineSkipCursor(-1)
      end,
      mode = { "n", "x" },
      desc = "MC: skip cursor above",
    },
    {
      "<leader><Down>",
      function()
        require("multicursor-nvim").lineSkipCursor(1)
      end,
      mode = { "n", "x" },
      desc = "MC: skip cursor below",
    },

    -- match‐based cursors
    {
      "<leader>n",
      function()
        require("multicursor-nvim").matchAddCursor(1)
      end,
      mode = { "n", "x" },
      desc = "MC: add cursor match (forward)",
    },
    {
      "<leader>N",
      function()
        require("multicursor-nvim").matchAddCursor(-1)
      end,
      mode = { "n", "x" },
      desc = "MC: add cursor match (backward)",
    },
    {
      "<leader>s",
      function()
        require("multicursor-nvim").matchSkipCursor(1)
      end,
      mode = { "n", "x" },
      desc = "MC: skip cursor match (forward)",
    },
    {
      "<leader>S",
      function()
        require("multicursor-nvim").matchSkipCursor(-1)
      end,
      mode = { "n", "x" },
      desc = "MC: skip cursor match (backward)",
    },

    -- ctrl+click adds/removes cursors
    {
      "<c-LeftMouse>",
      require("multicursor-nvim").handleMouse,
      mode = "n",
      desc = "MC: mouse add/remove cursor",
    },
    { "<c-LeftDrag>", require("multicursor-nvim").handleMouseDrag, mode = "n", desc = "MC: mouse drag cursor" },
    {
      "<c-LeftRelease>",
      require("multicursor-nvim").handleMouseRelease,
      mode = "n",
      desc = "MC: mouse release cursor",
    },

    -- toggle all cursors
    {
      "<c-q>",
      function()
        require("multicursor-nvim").toggleCursor()
      end,
      mode = { "n", "x" },
      desc = "MC: toggle cursors",
    },
  },

  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    -- you can also define the “layer” mappings here (active only
    -- when multicursors are on), using which-key if you like:
    local wk = require("which-key")
    mc.addKeymapLayer(function(layer)
      layer({ "n", "x" }, "<Left>", mc.prevCursor, "MC prev cursor")
      layer({ "n", "x" }, "<Right>", mc.nextCursor, "MC next cursor")
      layer({ "n", "x" }, "<leader>x", mc.deleteCursor, "MC delete cursor")

      -- Escape toggles/clears
      layer("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end, "MC exit/clear")
    end)

    -- customize highlights
    vim.api.nvim_set_hl(0, "MultiCursorCursor", { reverse = true })
    vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorSign", { link = "SignColumn" })
    vim.api.nvim_set_hl(0, "MultiCursorMatchPreview", { link = "Search" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { reverse = true })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
