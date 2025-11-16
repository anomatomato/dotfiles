---@type LazySpec
return {
  -- LSP configuration for Python
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                useLibraryCodeForTypes = false, -- Determines whether pyright reads, parses and analyzes library code to extract type information in the absence of type stub files. Type information will typically be incomplete. We recommend using type stubs where possible. The default value for this option is true.
                inlayHints = {
                  --- see https://docs.basedpyright.com/v1.21.0/configuration/language-server-settings/#based-settings
                  variableTypes = true, -- inlay hints on assignments to variables
                  callArgumentNames = true,
                  functionReturnTypes = true,
                  genericTypes = true, -- inlay hints on inferred generic types
                },
                typeCheckingMode = "standard", --  ["off", "basic", "standard", "strict", "recommended", "all"]
              },
            },
          },
        },
        ruff = {
          init_options = {
            settings = {
              lineLength = 120,
            },
          },
        },
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
