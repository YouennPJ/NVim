vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'ThePrimeagen/vim-be-good'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end, }
    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use { 'neovim/nvim-lspconfig' }
    use('MunifTanjim/prettier.nvim')
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("nvim-tree/nvim-web-devicons")
    use("akinsho/toggleterm.nvim")
    use("stevearc/dressing.nvim")
    use('jose-elias-alvarez/null-ls.nvim')
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" },
            { "rafamadriz/friendly-snippets" },
            { "onsails/lspkind.nvim" },
        }
    }
    use 'mfussenegger/nvim-jdtls'
    use('javiorfo/nvim-soil')
    use('javiorfo/nvim-nyctophilia')
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = {
                "markdown" }
        end,
        ft = { "markdown" },
    })
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                require('telescope').load_extension('projects')
            }
        end
    }
    use { "Dhanus3133/LeetBuddy.nvim" }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use { "lewis6991/gitsigns.nvim" }
    use 'ggandor/lightspeed.nvim'
    use 'vimpostor/vim-tpipeline'
    use {
        'weirongxu/plantuml-previewer.vim',
        requires = {
            { "tyru/open-browser.vim" },
            { "aklt/plantuml-syntax" },
        }
    }
    use 'averms/black-nvim'
end)
