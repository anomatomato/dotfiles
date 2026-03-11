return {
  {
    "lowitea/aw-watcher.nvim",
    opts = { -- required, but can be empty table: {}
      bucket = {
        -- hostname = nil, -- by default hostname of computer
        -- name = "aw-watcher-neovim_" .. bucket.hostname, -- by default "aw-watcher-neovim_" .. bucket.hostname
      },
      aw_server = {
        host = "127.0.0.1",
        port = 5600,
      },
    },
  },
}
