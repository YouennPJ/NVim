--This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ThePrimeagen/vim-be-good'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,}
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  -- {'williamboman/mason.nvim'},
		  -- {'williamboman/mason-lspconfig.nvim'},
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("nvim-tree/nvim-web-devicons")
  use("akinsho/toggleterm.nvim")
  use("stevearc/dressing.nvim")
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  use{
      'hrsh7th/nvim-cmp',
      requires = {
          {"hrsh7th/cmp-buffer"},   
          {"hrsh7th/cmp-path"},  
          {"L3MON4D3/LuaSnip"},   
          {"saadparwaiz1/cmp_luasnip"},  
          {"rafamadriz/friendly-snippets"},  
          {"onsails/lspkind.nvim"},
      }
  }
  use('javiorfo/nvim-soil')
  use('javiorfo/nvim-nyctophilia')
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
        require('telescope').load_extension('projects')
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
end)
