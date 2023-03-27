local status, packer = pcall(require, 'packer')

if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Colorschemes
    use 'marko-cerovac/material.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Status Line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- LSP Stuffs
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use('jose-elias-alvarez/typescript.nvim')
    use({ "glepnir/lspsaga.nvim", branch = "main" })

    -- vs-code like icons for autocompletion
    use("onsails/lspkind.nvim")

    -- CMP
    use 'hrsh7th/cmp-buffer'   -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp'     -- Completion
    use 'hrsh7th/cmp-path'     -- Path Completion

    -- Formatter and Linters
    use "jose-elias-alvarez/null-ls.nvim"

    -- Snippets
    use("L3MON4D3/LuaSnip")

    -- Trisitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- AutoClosing
    use('windwp/nvim-autopairs')
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

    -- Commenting
    use('tpope/vim-surround')
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Telescope
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use("nvim-telescope/telescope-file-browser.nvim")

    -- Web Devicons
    use 'nvim-tree/nvim-web-devicons'

    -- Barbarbar
    use 'romgrk/barbar.nvim'
end)
