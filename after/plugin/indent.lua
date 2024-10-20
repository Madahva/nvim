require('mini.indentscope').setup({
  draw = {
    delay = 0,
    animation = require('mini.indentscope').gen_animation.none()
    --animation = require('mini.indentscope').gen_animation.quadratic({ time = 100 })
  },

  --symbol = '├',
  --symbol = '╠',
  --symbol = '¦',
  --symbol = '|',
  symbol = '│',

  options = {
    try_as_border = true,
    border_indent = 2,
  },

  mappings = {
    goto_top = '[[',
    goto_bottom = ']]',
  },

  events = { 'BufEnter', 'CursorMoved' },
  show_in_insert = false,
})
