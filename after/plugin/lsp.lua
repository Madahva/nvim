require("mason").setup()
require("mason-lspconfig").setup()

local lsp_attach = function(_client, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  vim.keymap.set('n', '<leader>er', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
end

local lsp_zero = require('lsp-zero')

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})





-- COMPLETION SETUP (CMP)

require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  window = {
    completion = {
      border = "rounded"
    }
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' })
  }),
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  }),
})





-- LSP SERVER CONFIGURATIONS

require 'lspconfig'.ts_ls.setup {}
require 'lspconfig'.eslint.setup {}


local lua_settings = {
  Lua = {
    runtime = {
      version = 'LuaJIT',
    },
    diagnostics = {
      globals = { 'vim' },
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file("", true),
    },
    telemetry = {
      enable = false,
    },
  },
}

require('lspconfig').lua_ls.setup {
  settings = lua_settings,
  on_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
require 'lspconfig'.emmet_language_server.setup {}
require 'lspconfig'.tailwindcss.setup {}





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




vim.api.nvim_create_user_command('ToggleEslint', function()
  local bufnr = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
  local eslint_client

  for _, client in ipairs(clients) do
    if client.name == "eslint" then
      eslint_client = client
      break
    end
  end

  if eslint_client then
    vim.lsp.stop_client(eslint_client.id)
    print("ESLint disabled for buffer " .. bufnr)
  else
    require('lspconfig').eslint.setup {}
    vim.lsp.start_client(vim.tbl_deep_extend("force", require('lspconfig').eslint.document_config, {
      root_dir = vim.loop.cwd(),
    }))
    print("ESLint enabled for buffer " .. bufnr)
  end
end, {})
