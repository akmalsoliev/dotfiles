-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colorscheme as Nord-Vim 
  use 'shaunsingh/nord.nvim'

  -- Bufferline, for tabs
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('mbbill/undotree')

  -- // Git Tools // --
  -- Gitignore generator
  use({
    "wintermute-cell/gitignore.nvim",
    requires = {
      "nvim-telescope/telescope.nvim"
    }
  })
  -- Git diff tool
  use("sindrets/diffview.nvim")

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- pep8 indentation for python
  use('Vimjas/vim-python-pep8-indent')
  -- bracket close
  use 'm4xshen/autoclose.nvim'
  -- indent backline
  use "lukas-reineke/indent-blankline.nvim"
  -- commenting plugin
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Noice
  use({
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
    }
  })

  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- aerial; code explorer
  use ('stevearc/aerial.nvim')

  -- Status bar enhancements
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Rust plugins
  use {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  }
 
  use {
    'rust-lang/rust.vim',
    ft = "rust",
    config = function()
        vim.g.rustfmt_autosave = 1
    end,
  }

  use ({
    'ggandor/leap.nvim',
    config = function()
      require("leap").add_default_mappings()
    end
  })

end)
