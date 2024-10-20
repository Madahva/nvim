vim.notify = require("notify")

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

vim.api.nvim_create_user_command('ShowDiagnosticsNotify', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local diagnostics = vim.diagnostic.get(bufnr)

  local file = vim.fn.expand('%:t')

  if #diagnostics == 0 then
    vim.notify(file, "success", { title = "Saved" })
    return
  end

  for _, diagnostic in ipairs(diagnostics) do
    local severity = diagnostic.severity
    local severity_name = vim.diagnostic.severity[severity]
    local msg = string.format("[%s] %s", severity_name, diagnostic.message)

    vim.notify(msg, severity == 1 and "error" or severity == 2 and "warn" or "info", {
      title = "Diagnostics",
    })
  end
end, {})

vim.api.nvim_create_user_command('Write', function()
  vim.cmd('silent! write')
  vim.cmd('ShowDiagnosticsNotify')
end, {})

vim.api.nvim_create_autocmd('BufWriteCmd', {
  pattern = '*',
  callback = function()
    vim.cmd('Write')
  end
})



vim.api.nvim_create_user_command('ClearNotifications', function()
  require("notify").dismiss({ silent = true, pending = true })
end, {})




local lsp_start = function()
  vim.notify("LSP started!", "info", { title = "LSP Status" })
end

local lsp_stop = function()
  vim.notify("LSP stopped!", "warn", { title = "LSP Status" })
end

vim.lsp.start = lsp_start
vim.lsp.stop = lsp_stop
