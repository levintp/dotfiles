-- +-------------------------------------+
-- |        Plugins configuration        |
-- +-------------------------------------+
-- |           Using Packer as           |
-- |           plugins manager           |
-- +-------------------------------------+
-- |             Using Mason             |
-- |         as packages manager         |
-- +-------------------------------------+



-- +-------------------------------------+
-- |                Setup                |
-- +-------------------------------------+

-- Only required packer is configured as `opt`
vim.cmd [[packadd packer.nvim]]

local packer = require('packer')
local packer_util = require('packer.util')

packer.init({
  package_root = packer_util.join_paths(vim.fn.stdpath('config'), 'packer', 'site', 'pack'),
})



-- +-------------------------------------+
-- |               Plugins               |
-- |                Start                |
-- +-------------------------------------+

return packer.startup(function(use)

  -- +---------+
  -- | General |
  -- +---------+

  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- Add mason for ease of installing new LSPs and linters
  use { 'williamboman/mason.nvim', config = [[require('mason').setup()]] }

  -- Enable config reloads
  use { 'famiu/nvim-reload' }

  -- Add utility for ascii art
  use { 'jbyuki/venn.nvim', config = [[require('config.venn')]] }



  -- +----------------+
  -- | Lua extensions |
  -- +----------------+

  use { 'nvim-lua/plenary.nvim' }



  -- +------------+
  -- | Appearance |
  -- +------------+

  -- Nord theme of course
  use { 'shaunsingh/nord.nvim' }

  -- Add web dev icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- Add a beautiful status line with Lualine
  use { 'nvim-lualine/lualine.nvim', config = [[require('config.lualine')]] }

  -- Add notifications support
  use { 'rcarriga/nvim-notify', config = [[require('config.notify')]] }

  -- Add indentation indicators
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- Add a greeter
  use { 'goolord/alpha-nvim', config = [[require('config.alpha')]] }



  -- +-----+
  -- | LSP |
  -- +-----+

  -- Add NeoVim LSP configuration support
  use { 'neovim/nvim-lspconfig', config = [[require('config.lsp')]] }


  
  -- +----------------------+
  -- | Automatic Completion |
  -- +----------------------+

  -- Add nvim-cmp as automatic completion engine
  use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }

  -- Add sources for nvim-cmp
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-calc' }
  use { 'f3fora/cmp-spell' }
  use { 'hrsh7th/cmp-nvim-lua' }

  -- Add nvim-cmp support for LSP
  use { 'hrsh7th/cmp-nvim-lsp' }

  -- Add commandline completion with Wilder menu
  use { 'gelguy/wilder.nvim', config = [[require('config.wilder')]] }



  -- +----------+
  -- | Snippets |
  -- +----------+

  -- Add snippets with ultisnips
  use { 'SirVer/ultisnips' }

  -- Add text highlighting and matching with hlslens
  use {'kevinhwang91/nvim-hlslens', config = [[require('config.hlslens')]]}



  -- +-----------------+
  -- | Version control |
  -- +-----------------+

  -- Add gitsigns side bar
  use { 'lewis6991/gitsigns.nvim', config = [[require('gitsigns').setup()]] }

  -- Add git control with fugitive
  use { 'tpope/vim-fugitive' }



  -- +----------+
  -- | Browsing |
  -- +----------+

  -- Add a file tree browser
  use { 'kyazdani42/nvim-tree.lua', config = [[require('nvim-tree').setup()]] }

  -- Add telescope browser
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-symbols.nvim' }

  -- Add fuzzy file searching mechanisms with LeaderF
  use { 'Yggdroot/LeaderF' }

  -- Add error/warning browser
  use { 'folke/trouble.nvim', config = [[require('trouble').setup()]] }

end)
