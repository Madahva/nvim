return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      vim.keymap.set('n', '<leader>m', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

      local function my_on_attach(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
        vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
        vim.keymap.set('n', 'x', api.node.open.horizontal, opts('Open: Horizontal Split'))
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
      end

      require("nvim-tree").setup({
        actions = {
          open_file = {
            quit_on_open = true,
            resize_window = true,
            window_picker = {
              enable = false,
            },
          },
        },
        view = {
          side = "left",
          width = 50,
        },
        system_open = {
          cmd = "kitty",
          args = { 'nvim' },
        },
        on_attach = my_on_attach,
      })
    end,
}
