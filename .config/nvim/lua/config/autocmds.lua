-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

--[[ -------------
     AUTO COMMANDS
        ------------- ]]

-- Prefer creating groups and assigning autocmds to groups, because it makes it easier to clear them
-- --[[ Mygroup Group ]]
-- augroup("mygroup", { clear = true })
local flash_group = augroup("flash_group", { clear = true })

local function flash_hl()
  vim.api.nvim_set_hl(0, "FlashLabel", {
    fg = "#333333", -- Dark text
    bg = "#ff007c", -- Light red background
    bold = true,
  })
end

flash_hl()

autocmd("ColorScheme", {
  group = flash_group,
  callback = flash_hl,
  desc = "Override Flash label highlights",
})
