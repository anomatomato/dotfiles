---@type LazySpec
return {
  "tridactyl/vim-tridactyl",
  ft = "tridactyl",
  init = function()
    vim.filetype.add({
      filename = {
        ["tridactylrc"] = "tridactyl",
        [".tridactylrc"] = "tridactyl",
      },
    })
  end,
}
