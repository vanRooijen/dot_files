-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  
  -- Package Manager 
  -- Can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy Finder
  -- telescope.lua is the config
  -- runs with <leader>pv and others
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Colorscheme
  -- colorscheme.lua is the config
  -- it runs automatically
  use { "ellisonleao/gruvbox.nvim" }

  -- Parsing Library
  -- treesitter.lua is config 
  -- ir runs automatically 
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- Undo History (Tree)
  -- runs with <leader>pu
  use ('mbbill/undotree')

  -- Tabs and some icons used by other things as well
  use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
--  use 'romgrk/barbar.nvim'

  -- Comparison View
  use "sindrets/diffview.nvim" 

  -- Hop
  use {
	  'phaazon/hop.nvim',
	  branch = 'v2', -- optional but strongly recommended
	  config = function()
		  -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup {
        multi_windows = true, -- optional my own addition (raymond)
        keys = 'etovxqpdygfblzhckisuran' 
      }


	  end
  }


  --Lua Line
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }



  --Markdown wiki system tools 
  --Installs luarocks as well
 use({'jakewvincent/mkdnflow.nvim',
    rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
 --   config = function()
 --       require('mkdnflow').setup()
 --   end
}) 


--Github Co-pilot 
--use { "zbirenbaum/copilot.lua" }
use { "github/copilot.vim" }

-- Zen mode feature
use {
  "folke/zen-mode.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}

-- Cleaner Ex look 
use ('nvim-tree/nvim-tree.lua')

-- bufferline 
use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

-- Here is my latex plugin
use 'lervag/vimtex'

-- Here are my markdown syntax and pandoc plugins
use 'vim-pandoc/vim-pandoc'

use 'vim-pandoc/vim-pandoc-syntax'

-- More markdown stuff
use {
  'jghauser/follow-md-links.nvim'
}

-- install without yarn or npm
--use({
--    "iamcco/markdown-preview.nvim",
--    run = function() vim.fn["mkdp#util#install"]() end,
--})
--
--use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

--Simple games to use to learn vim bindings etc.
use ('ThePrimeagen/vim-be-good')


end) 
