local prefix = "<leader>T"

---@type LazySpec
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    ---@type wk.Opts
    opts = {
      spec = {
        { prefix, group = "+toggleterm" }, -- register <leader>t as a group key
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm" },
    keys = {
      {
        prefix .. "K",
        function()
          for _, term in pairs(require("toggleterm.terminal").get_all()) do
            term:shutdown()
          end
        end,
        mode = { "n" },
        desc = "Kill all terminals",
      },
      {
        prefix .. "f",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 0, LazyVim.root.get(), "float")
        end,
        desc = "ToggleTerm (float root_dir)",
      },
      {
        prefix .. "h",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 15, LazyVim.root.get(), "horizontal")
        end,
        desc = "ToggleTerm (horizontal root_dir)",
      },
      {
        prefix .. "v",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, vim.o.columns * 0.4, LazyVim.root.get(), "vertical")
        end,
        desc = "ToggleTerm (vertical root_dir)",
      },
      {
        prefix .. "a",
        "<cmd>ToggleTermToggleAll<cr>",
        desc = "Toggle all terminals",
      },
      {
        prefix .. "r",
        "<cmd>ToggleTermSetName<cr>",
        desc = "Set term name",
      },
      {
        prefix .. "n",
        "<cmd>TermNew<cr>",
        desc = "Open new terminal",
      },
      {
        prefix .. "s",
        "<cmd>TermSelect<cr>",
        desc = "Select term",
      },
      {
        prefix .. "t",
        function()
          require("toggleterm").toggle(1, 50, LazyVim.root.get(), "tab")
        end,
        desc = "ToggleTerm (tab root_dir)",
      },
      {
        prefix .. "T",
        function()
          require("toggleterm").toggle(1, 100, vim.loop.cwd(), "tab")
        end,
        desc = "ToggleTerm (tab cwd_dir)",
      },
    },
    opts = {
      -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<a-t>]], -- use Alt/Meta + t instead of <C-\>
      on_open = function(term)
        local localOpts = { buffer = term.bufnr, noremap = true, silent = true }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], localOpts)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], localOpts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], localOpts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], localOpts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], localOpts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], localOpts)
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], localOpts)
      end,
      -- on_open = fun(t: Terminal), -- function to run when the terminal opens
      -- on_close = fun(t: Terminal), -- function to run when the terminal closes
      -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
      -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
      -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      -- shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      direction = "horizontal" or "vertical" or "window" or "float",
      -- direction = "vertical",
      close_on_exit = false, -- close the terminal window when the process exits
      -- shell = vim.o.shell, -- change the default shell
      -- This field is only relevant if direction is set to 'float'
      -- float_opts = {
      --   -- The border key is *almost* the same as 'nvim_open_win'
      --   -- see :h nvim_open_win for details on borders however
      --   -- the 'curved' border is a custom border type
      --   -- not natively supported but implemented in this plugin.
      --   border = 'single' or 'double' or 'shadow' or 'curved',
      --   width = <value>,
      --   height = <value>,
      --   winblend = 3,
      --   highlights = {
      --     border = "Normal",
      --     background = "Normal",
      --   }
      -- }
    },
  },
}
