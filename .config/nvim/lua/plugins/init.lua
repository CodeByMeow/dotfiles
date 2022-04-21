---@diagnostic disable: undefined-global
return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }
  -- GUI
  use { "ellisonleao/gruvbox.nvim", config = "require('plugins.config.theme')" }
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate", event = "BufWinEnter", config = "require('plugins.config.treesitter')" }
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', event = "BufWinEnter", config = "require('plugins.config.bufferline')" }
  use { 'p00f/nvim-ts-rainbow', after = "nvim-treesitter" }
  use { 'norcalli/nvim-colorizer.lua', config = "require('plugins.config.colorizer')", event = "BufRead" }
  use { 'glepnir/dashboard-nvim', config = "require('plugins.config.dashboard')" }
  use { "lukas-reineke/indent-blankline.nvim", config = "require('plugins.config.blankline')", event = "BufRead" }
  use { "folke/zen-mode.nvim", config = "require('plugins.config.zen-mode')" }
  use { 'folke/twilight.nvim', config = "require('plugins.config.twilight')" }
  use { 'glepnir/galaxyline.nvim', branch = 'main', config = "require('plugins.config.galaxyline')", requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'b3nj5m1n/kommentary' }
  use { 'rcarriga/nvim-notify', config = "require('plugins.config.nvim-notify')" }
  use { 'andymass/vim-matchup', require = 'nvim-treesitter/nvim-treesitter' }
  use { 'karb94/neoscroll.nvim' }
  use { 'folke/which-key.nvim', event = "BufWinEnter", config = "require('plugins.config.whichkey')" }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup { current_line_blame = true }
    end
  }
  use { "akinsho/toggleterm.nvim", config = "require('plugins.config.toggleterm')" }
  use { 'yamatsum/nvim-cursorline', config = "require('plugins.config.cursorline')" }

  -- File explore
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    },
    config = "require('plugins.config.neo-tree')"
  }
  use { "ggandor/lightspeed.nvim", keys = { "s", "S", "t", "T", "f", "F" } }
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  }

  -- Telescopes
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }, cmd = "Telescope", config = "require('plugins.config.telescope')" }
  use { 'nvim-telescope/telescope-media-files.nvim' }
  use { 'simrat39/symbols-outline.nvim', config = "require('plugins.config.symbols')" }


  -- Auto Complete
  use { 'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter" }
  use { 'windwp/nvim-autopairs', config = "require('plugins.config.autopairs')" }

  -- LSP
  use { 'neovim/nvim-lspconfig', event = 'BufRead' }
  use { 'williamboman/nvim-lsp-installer',
    after = 'nvim-lspconfig',
    config = "require('plugins.config.lspinstall')"
  }
  use { 'lukas-reineke/lsp-format.nvim', config = "require('plugins.config.lspformat')" }
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    requires = { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
  }
  use { 'onsails/lspkind-nvim' }
  use { 'tami5/lspsaga.nvim', config = "require('plugins.config.lspsaga')" }
  use { 'ray-x/lsp_signature.nvim', requires = { 'neovim/nvim-lspconfig' } }

  -- Other
  use { 'antoyo/vim-licenses' }
  use { 'AndrewRadev/tagalong.vim' }
  use { 'tpope/vim-surround',
    keys = { "c", "d", "y" },
    config = "require('plugins.config.surround')"
  }
  use { 'christoomey/vim-titlecase' }
  use {
    'nacro90/numb.nvim',
    config = function() require('numb').setup() end
  }
  use { 'max-0406/autoclose.nvim' }
  use { 'kyazdani42/nvim-web-devicons', config = "require('plugins.config.icon')" }
end)