local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Colorscheme as Nord-Vim 
  'shaunsingh/nord.nvim',

  -- Icons
  'nvim-tree/nvim-web-devicons',

  -- Bufferline, for tabs
  'akinsho/bufferline.nvim',

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  'nvim-treesitter/playground',
  'mbbill/undotree',

  -- // Git Tools // --
  -- Gitignore generator
  "wintermute-cell/gitignore.nvim",

  -- lsp
  require("plugins.lsp"),

  -- pep8 indentation for python
  'Vimjas/vim-python-pep8-indent',

  -- commenting plugin
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  -- noice
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    opts = function()
      local enable_conceal = false          -- Hide command text if true
      return {
        -- Disable every other noice feature
        messages = { enabled = false },
        lsp = {
          hover = { enabled = false },
          signature = { enabled = false },
          progress = { enabled = false },
          message = { enabled = false },
          smart_move = { enabled = false },
        },
      }
    end
  },

  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  },

  -- aerial; code explorer
  'stevearc/aerial.nvim',

  -- Status bar enhancements
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },

  -- Rust plugins
  {
    'saecki/crates.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end
  },

  {
    'ggandor/leap.nvim',
    config = function()
      require("leap").add_default_mappings()
    end
  },

  -- Highlights TODO, FIXME and etc...
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- CSV Rainbow
  {
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon'
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
      'RainbowMultiDelim',
      'RainbowAlign',
    }
  },

  require("plugins.fterm"),

  -- scrollbar
  {
    'petertriho/nvim-scrollbar',
  },

  -- dashboard
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  require("plugins.sayonara"),

  require("plugins.lazygit"),

  "lukas-reineke/indent-blankline.nvim",
}

local opts = {}

require("lazy").setup({
  plugins,
  opts,
})
