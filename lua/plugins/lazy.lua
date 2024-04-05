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
  		config = function()
    	require('dashboard').setup {
        -- config
            theme = 'hyper',
            config = {
                header = {
                        "▄▄▄▄▄▄    ▄▄▄▄▄▄▄▄  ▄▄▄   ▄▄  ▄▄    ▄▄   ▄▄▄▄▄▄   ▄▄▄  ▄▄▄",
                        "██▀▀▀▀██  ██▀▀▀▀▀▀  ███   ██  ▀██  ██▀   ▀▀██▀▀   ███  ███",
                        "██    ██  ██        ██▀█  ██   ██  ██      ██     ████████",
                        "███████   ███████   ██ ██ ██   ██  ██      ██     ██ ██ ██",
                        "██  ▀██▄  ██        ██  █▄██    ████       ██     ██ ▀▀ ██",
                        "██    ██  ██▄▄▄▄▄▄  ██   ███    ████     ▄▄██▄▄   ██    ██",
                        "▀▀    ▀▀▀ ▀▀▀▀▀▀▀▀  ▀▀   ▀▀▀    ▀▀▀▀     ▀▀▀▀▀▀   ▀▀    ▀▀",
                        "                                                          ",
                },
            },
    	}
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
        config = function()
            require("nvim-tree").setup {
                renderer = {
                    root_folder_label = false,
                    highlight_git = true,
                },
            }
        end,
    },
    
    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = "catppuccin",
                component_separators = "",
                section_separators = "",
            },
        },
    },

    -- BarBar
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            sidebar_filetypes = {
                NvimTree = true,
                undotree = {
                    text = 'undotree',
                    align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
                },
                ['neo-tree'] = {event = 'BufWipeout'},
                Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
            },
        },
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

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "c", "lua", "vim" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end,
    },
})

