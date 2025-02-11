--vim.opt.conceallevel = 0
--vim.opt.formatoptions:remove("c")
vim.g.netrw_banner = 0
vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.clipboard = "unnamed"
vim.opt.cmdheight = 1
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25"
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.iskeyword:append("-")
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.shiftwidth = 2
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.synmaxcol = 240
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wildmenu = true
vim.opt.wrap = true
vim.opt.writebackup = false





-- DIAGNOSTIC CONFIGURATION

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
})

vim.cmd [[
  highlight DiagnosticUnderlineError guisp=#D966FF gui=underline
  highlight DiagnosticUnderlineWarning guisp=red gui=underline
  highlight DiagnosticUnderlineInformation guisp=#0000FF gui=underline
  highlight DiagnosticUnderlineHint guisp=#008000 gui=underline
]]

vim.fn.sign_define("DiagnosticSignError", { text = "✘", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "▲", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "»", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "⚑", texthl = "DiagnosticSignHint" })


--

vim.api.nvim_create_user_command('ToggleLineNrConf', function()
  local pink = '#E698FF'
  local blue = '#006B6B'
  local current_hl = vim.api.nvim_get_hl_by_name('LineNr', true)

  if current_hl.foreground == tonumber(pink:sub(2), 16) then
    vim.api.nvim_set_hl(0, 'LineNr', { fg = blue })
    vim.o.relativenumber = true
  else
    vim.api.nvim_set_hl(0, 'LineNr', { fg = pink })
    vim.o.relativenumber = false
  end
end
, {})


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

