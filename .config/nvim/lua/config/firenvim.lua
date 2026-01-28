vim.g.firenvim_config = {
  globalSettings = {
    statusline = false, -- 👈 THIS removes the bar you see
    cmdline = "neovim", -- optional: removes Firenvim cmdline overlay
    ["<C-w>"] = "noop",
  },
  localSettings = {
    [".*"] = {
      takeover = "once",
      selector = 'textarea:not([readonly], [aria-readonly]), div[role="textbox"]',
    },
    [".*chatgpt.com.*"] = {
      selector = 'div[id="prompt-textarea"]',
    },
  },
}

if not vim.g.started_by_firenvim then
  return
end
-- Following code only read by firenvim in Browser

-- UI tweaks
vim.o.laststatus = 0
vim.o.showtabline = 0
vim.o.cmdheight = 0
vim.o.number = true
vim.o.relativenumber = true
vim.opt.shortmess:append("WcFAI") -- 👈 suppresses "written" message
vim.o.lazyredraw = true

-- Performance
vim.o.updatetime = 4000
vim.o.timeoutlen = 300

-- Automatically sync changes to the page (https://github.com/glacambre/firenvim?tab=readme-ov-file#automatically-syncing-changes-to-the-page)
local uv = vim.uv or vim.loop

local autosave_timer = uv.new_timer()
local last_edit = 0
local DEBOUNCE_MS = 1500
local TICK_MS = 500

local function should_save(bufnr)
  bufnr = bufnr or 0
  if vim.bo[bufnr].buftype ~= "" then
    return false
  end -- nofile/help/terminal/prompt, etc.
  if not vim.bo[bufnr].modifiable then
    return false
  end
  if vim.bo[bufnr].readonly then
    return false
  end
  if not vim.bo[bufnr].modified then
    return false
  end
  if vim.api.nvim_buf_get_name(bufnr) == "" then
    return false
  end
  return true
end

autosave_timer:start(
  0,
  TICK_MS,
  vim.schedule_wrap(function()
    if last_edit == 0 then
      return
    end
    local now = uv.now()
    if now - last_edit < DEBOUNCE_MS then
      return
    end

    last_edit = 0
    if should_save(0) then
      -- update is like :write but only if modified; we already check modified, but it's a safe default
      vim.cmd("silent! update")
    end
  end)
)

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  callback = function()
    last_edit = uv.now()
  end,
})

-- Shortcuts
vim.keymap.set("n", "<Esc><Esc>", "<Cmd>call firenvim#focus_input()<CR>", { silent = true })
vim.keymap.set("n", "<S-Esc>", "<Cmd>call firenvim#focus_page()<CR>", { silent = true })
-- Silent save keymap (overrides LazyVim default)
-- vim.keymap.del({ "n", "x", "i", "s" }, "<C-s>")
-- vim.keymap.set({ "n", "x", "i", "s" }, "<C-s>", "<Cmd>silent write<CR>", { desc = "Save File (silent)" })
