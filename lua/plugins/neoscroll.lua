return {
  "karb94/neoscroll.nvim",
  config = function()
    require('neoscroll').setup({
      mappings = {
        '<C-u>', '<C-d>',
        '<C-b>', '<C-f>',
        '<C-y>', '<C-e>',
        'zt', 'zz', 'zb',
      },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      easing = 'linear',
      pre_hook = nil,
      post_hook = nil,
      performance_mode = true,
      ignored_events = {
        'WinScrolled', 'CursorMoved'
      },
    })
  end
}
