return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      fps = 75,
      stages = "fade_in_slide_out",
      icons = {
        ERROR   = "",
        WARN    = "",
        INFO    = "⚑",
        DEBUG   = "",
        TRACE   = "✎",
        SUCCESS = "»",
      },
    })
    vim.notify = require("notify")
  end


}
