-- Plugins --
-- require "plugins.COQ"
require "plugins.nvim-cmp"
require "plugins.LSP"
require "plugins.telescope"
require "plugins.expressline"
require "plugins.CHADtree"
require "plugins.treesitter"
require "plugins.nvim-dap"
require "plugins.vimtex"

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

local use = require('packer').use
return require('packer').startup(function()

    -- Packer
    use 'wbthomason/packer.nvim'

    -- Plenary
    use 'nvim-lua/plenary.nvim'

    -- Popup

    use 'nvim-lua/popup.nvim'

    -- COQ
    -- use {'ms-jpq/coq_nvim', branch= 'coq'}
    --
    -- use {'ms-jpq/coq.artifacts', branch= 'artifacts'}
    --
    -- use {'ms-jpq/coq.thirdparty', branch= '3p'}

    -- LuaSnip
    use 'L3MON4D3/LuaSnip'

    -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-omni'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- lspkind
    use 'onsails/lspkind.nvim'

    -- CHADtree
    use {'ms-jpq/chadtree', branch= 'chad', run= 'python3 -m chadtree deps'}

    -- express_line
    use 'tjdevries/express_line.nvim'

    -- LSP tools
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")

            saga.init_lsp_saga({

            })
        end,
    })

    -- Dev-icons
    use 'kyazdani42/nvim-web-devicons'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Alpha Greetet
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'plugins.dashboard'.config)
        end
    }

    -- SQLite.lua
    use "kkharji/sqlite.lua"

    -- Telescope Frecency
    use {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require"telescope".load_extension("frecency")
        end,
        requires = {"tami5/sqlite.lua"}
    }

    -- Telescope Bookmarks
    use {
        'dhruvmanila/telescope-bookmarks.nvim',
        config = function()
            require('telescope').load_extension('bookmarks')
        end,
        requires = {
            'tami5/sqlite.lua',
        }
    }


    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'p00f/nvim-ts-rainbow'
    }

    -- Autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Tabby
    -- use {
    --     "nanozuki/tabby.nvim",
    --     config = function() require("tabby").setup({
    --         tabline = require("plugins.tabby").active_tab_with_wins,
    --     }) end,
    -- }

    -- cokeline
    -- use {
    --     'noib3/nvim-cokeline',
    --     requires = 'kyazdani42/nvim-web-devicons',
    --     config = function() require('cokeline').setup(require('plugins.cokeline').getConfig()) end
    -- }

    -- Tabline
    -- use {
    --   'kdheepak/tabline.nvim',
    --   config = function()
    --     require'tabline'.setup(require('plugins.tabline').config)
    --     vim.cmd[[
    --       set sessionoptions+=tabpages,globals " store tabpages and globals in session
    --     ]]
    --   end,
    --   requires = { {'kyazdani42/nvim-web-devicons', opt = true} }
    -- }

    -- Surround
    use {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end
    }

    -- ToggleTerm

    use {"akinsho/toggleterm.nvim", tag = 'v2.*',
        config = function()
            require("toggleterm").setup(require("plugins.toggleterm").config)
        end
    }

    -- Colorbuddy
     use 'tjdevries/colorbuddy.nvim'

    -- Indent-blankline
    -- use {"lukas-reineke/indent-blankline.nvim",
    --     config = function()
    --         require("indent_blankline").setup(require("plugins.indent_blankline").config)
    --     end
    -- }

    -- VimTex
    use 'lervag/vimtex'

    -- DAP
    use 'mfussenegger/nvim-dap'

    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"},
        config = function()
            require("dapui").setup()
        end
    }

    -- CSS color codes
    use {"norcalli/nvim-colorizer.lua",
        config = function()
            require('colorizer').setup()
        end
    }

    -- Which-key
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    }


    -- Colorsvhemes
    use 'rktjmp/lush.nvim'                          -- Lush
    use 'dylanaraps/wal.vim'                        -- Pywal colors
    use 'bluz71/vim-moonfly-colors'                 -- Moonfly
    use 'levuaska/levuaska.nvim'                    -- Levuaska
    use 'metalelf0/jellybeans-nvim'                 -- Jellybeans
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        tag = 'v1.*',
    })
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'mnacamura/nvim-srcerite'
 	use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }
    use {"adisen99/codeschool.nvim", requires = {"rktjmp/lush.nvim"}}

    if PACKER_BOOTSTRAP then
    		require("packer").sync()
    end
end)
