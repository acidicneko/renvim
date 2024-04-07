local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
    -- Dashboard
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        opts = function()
            return require("plugins.dashboard")
        end,
        config = function(_,opts)
            require('dashboard').setup(opts)
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },

    -- NeoVim Tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = function()
            return require("plugins.nvim-tree")
        end,
        config = function(_,opts)
            require("nvim-tree").setup(opts) 
        end,
    },
    
    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 
            'nvim-tree/nvim-web-devicons',
        },
        opts = function()
            return require("plugins.lualine")
        end,
    },

    -- BarBar
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = function()
            return require("plugins.barbar")
        end,
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },

    -- Colorscheme
    { 
        "catppuccin/nvim",
        name = "catppuccin", 
        priority = 1000, 
    },

    -- Indent Blankline
    { 
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl", 
    },
    
    -- AutoPair for brackets
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = function()
            return require("plugins.treesitter")
        end,
        config = function (opts) 
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
})

