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
                inlayHints = {
                  --- see https://docs.basedpyright.com/v1.21.0/configuration/language-server-settings/#based-settings
                  variableTypes = true, -- inlay hints on assignments to variables
                  callArgumentNames = true,
                  functionReturnTypes = true,
                  genericTypes = true, -- inlay hints on inferred generic types
                },
              },
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
