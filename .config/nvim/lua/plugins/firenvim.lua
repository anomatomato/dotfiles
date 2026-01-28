---@type LazySpec
return {
  {
    "glacambre/firenvim",
    -- Might try: https://www.reddit.com/r/neovim/comments/1g5npef/how_do_i_make_lazyvim_and_firenvim_work_together/
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    module = false, -- will cause firenvim to throw an error when it is loaded in a require call by another plug-in or in your configuration code.
    build = function()
      vim.fn["firenvim#install"](0)
    end,
    { "noice.nvim", cond = not vim.g.started_by_firenvim },
    { "lualine.nvim", cond = not vim.g.started_by_firenvim }, -- not useful in the browser
    { "gitsigns.nvim", cond = not vim.g.started_by_firenvim }, -- not useful in the browser
    { "yazi.nvim", cond = not vim.g.started_by_firenvim }, -- not useful in the browser
    init = function()
      vim.g.firenvim_config = {
        globalSettings = {
          statusline = false, -- 👈 THIS removes the bar you see
          cmdline = false, -- optional: removes Firenvim cmdline overlay
        },
        localSettings = {
          [".*"] = {
            -- takeover = "never",
          },
        },
      }

      if not vim.g.started_by_firenvim then
        return
      end

      -- Firenvim-only settings
      vim.opt.shortmess:append("WFcAI")

      -- Silent save keymap (overrides LazyVim default)
      vim.keymap.set({ "n", "i", "v", "s" }, "<C-s>", "<Cmd>silent! write<CR><Esc>", { desc = "Save File (silent)" })
    end,
  },
}
