require('viscousbiscuits.remap')


require('lualine').setup {
	options = { 
		theme = 'tokyonight'
	}
}

vim.cmd("set number")
vim.cmd("set relativenumber")


return require('packer').startup(function()
use 'wbthomason/packer.nvim'
use 'folke/tokyonight.nvim' -- dark theme
use 'onsails/lspkind-nvim' -- vscode-like pictograms
use 'nvim-treesitter/nvim-treesitter' -- enhanced code highlighting
use 'nvim-tree/nvim-web-devicons'
use 'hrsh7th/nvim-cmp' -- Completion
use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
use "williamboman/mason.nvim"
use "williamboman/mason-lspconfig.nvim"
use "neovim/nvim-lspconfig"
use 'L3MON4D3/LuaSnip'
use "saadparwaiz1/cmp_luasnip"
use 'lewis6991/gitsigns.nvim'
use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
use "rafamadriz/friendly-snippets"
use "mfussenegger/nvim-dap"

use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }


use {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

end)
