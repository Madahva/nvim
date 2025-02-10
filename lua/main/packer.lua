vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  --UI
  use('nvim-tree/nvim-tree.lua')
  use('nvim-tree/nvim-web-devicons')
  use('uga-rosa/ccc.nvim')
  use('rcarriga/nvim-notify')
  use('echasnovski/mini.indentscope')
  use('karb94/neoscroll.nvim')
  use('edluffy/specs.nvim')
  use('j-hui/fidget.nvim')

  -- File Navigation
  use {
    ('nvim-telescope/telescope.nvim'), tag = '0.1.8',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use('ThePrimeagen/harpoon')
  use('LukasPietzschmann/telescope-tabs')


  -- Git
  use('tpope/vim-fugitive')
  use('airblade/vim-gitgutter')
  use('mbbill/undotree')


  -- LSP & Autocompletion
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use({ 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' })
  use('neovim/nvim-lspconfig')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-cmdline')
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')
  use('rafamadriz/friendly-snippets')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  use {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    branch = 'v0.6',
    config = function()
      require('ultimate-autopair').setup()
    end,
  }


  -- Others
  use {
    ('m4xshen/hardtime.nvim'),
    requires = { {
      "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim"
    } }
  }
end)
