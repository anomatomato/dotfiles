return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    -- jump labels
    labels = "asdfghjklqwertyuiopzxcvbnmöäü<.",
    jump = {
      -- automatically jump when there is only one match
      autojump = true,
      -- add pattern to search history
      history = true,
      -- add pattern to search register
      register = true,
    },
  },
}
