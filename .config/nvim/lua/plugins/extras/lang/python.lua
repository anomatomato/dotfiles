---@type LazySpec
return {
  {
    "stevearc/conform.nvim",
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        -- see https://github.com/LazyVim/LazyVim/discussions/5818
        python = { "ruff_fix", "ruff_organize_imports", lsp_format = "first" },
      },
    },
  },
  -- LSP configuration for Python
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ---@type lazyvim.lsp.Config
        basedpyright = {
          -- enabled = false,
          settings = {
            basedpyright = {
              analysis = {
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true, -- Determines whether pyright reads, parses and analyzes library code to extract type information in the absence of type stub files. Type information will typically be incomplete
                ignore = { "*" },
                disableOrganizeImports = true,
                inlayHints = {
                  --- see https://docs.basedpyright.com/v1.21.0/configuration/language-server-settings/#based-settings
                  variableTypes = true, -- inlay hints on assignments to variables
                  callArgumentNames = true,
                  functionReturnTypes = true,
                  genericTypes = false, -- inlay hints on inferred generic types
                },
                typeCheckingMode = "basic", --  ["off", "basic", "standard", "strict", "recommended", "all"]
              },
            },
          },
        },
        ---@type lazyvim.lsp.Config
        pyright = {
          -- enabled = true,
          settings = {
            pyright = {
              analysis = {
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true, -- Determines whether pyright reads, parses and analyzes library code to extract type information in the absence of type stub files. Type information will typically be incomplete
                typeCheckingMode = "standard", --  ["off", "basic", "standard", "strict"]
                -- ignore = { "*" },
                -- Using Ruff's import organizer
                disableOrganizeImports = true,
              },
            },
          },
        },
        ruff = {
          init_options = {
            settings = {
              -- lineLength = 120,
            },
          },
        },
        ---@type lazyvim.lsp.Config
        -- pylsp = {
        --   enabled = false,
        --   settings = {
        --     pylsp = {
        --       plugins = {
        --         -- Linting
        --         -- pylint = { enabled = false },
        --         -- pyflakes = { enabled = false },
        --         -- pycodestyle = { enabled = false },
        --         -- mccabe = { enabled = false },
        --         --
        --         -- -- Formatting (disable if using ruff/black externally)
        --         -- autopep8 = { enabled = false },
        --         -- yapf = { enabled = false },
        --
        --         -- Type checking
        --         pylsp_mypy = { enabled = true },
        --
        --         -- Rope for refactoring
        --         rope_autoimport = { enabled = true },
        --         rope_completion = { enabled = true },
        --       },
        --     },
        --   },
        -- },
      },
    },
  },
  -- For selecting virtual envs
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      options = {
        debug = true, -- enables you to run the VenvSelectLog command to view debug logs
      },
      -- own searches
      search = {
        my_miniconda_envs = {
          command = "fd /python$ ~/apps/miniconda3/envs/ --no-ignore-vcs --full-path --color never -E /proc", -- python$ means the path must end with the word python
          type = "anaconda",
        },
        my_miniconda_base = {
          command = "fd /python$ ~/apps/miniconda3/bin/ --no-ignore-vcs --full-path --color never -E /proc",
          type = "anaconda",
        },
      },
    },
  },
}
