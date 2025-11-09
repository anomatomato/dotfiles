---@type LazySpec
return {
  "nvim-mini/mini.surround",
  opts = {
    -- see https://github.com/nvim-mini/mini.surround?tab=readme-ov-file#default-config

    -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
    highlight_duration = 1000,

    -- How to search for surrounding (first inside current line, then inside
    -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
    -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
    -- see `:h MiniSurround.config`.
    search_method = "cover_or_next",
  },
}
