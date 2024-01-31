require('viscousbiscuits.remap')

vim.cmd("set number")
vim.cmd("set relativenumber")

return require('packer').startup(function()
-- General
use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'
use 'wbthomason/packer.nvim'

-- Startup
 use {
   'nvimdev/dashboard-nvim',
   requires = {'nvim-tree/nvim-web-devicons'}
 }

-- Time Tracking
use 'wakatime/vim-wakatime'

-- Theme and UI/UX
use 'folke/tokyonight.nvim' 

use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
}

use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}
use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
} 
use 'jvgrootveld/telescope-zoxide'

use 'nvim-tree/nvim-web-devicons'
use 'L3MON4D3/LuaSnip'
use 'lewis6991/gitsigns.nvim'
use 'onsails/lspkind-nvim' 
use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }}

-- LSP
use 'neovim/nvim-lspconfig'
use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/cmp-nvim-lsp-signature-help';
use 'saadparwaiz1/cmp_luasnip'

-- DAP plugins
use 'theHamsta/nvim-dap-virtual-text'
use 'mfussenegger/nvim-dap'
use 'stevearc/aerial.nvim'
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }

-- Git Plugins
use 'sindrets/diffview.nvim' 

end)
