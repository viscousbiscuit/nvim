require('viscousbiscuits.remap')

vim.cmd("set number")
vim.cmd("set relativenumber")


return require('packer').startup(function()

use 'wbthomason/packer.nvim'
use 'folke/tokyonight.nvim' -- dark theme
use 'onsails/lspkind-nvim' -- vscode-like pictograms
use 'nvim-treesitter/nvim-treesitter' -- enhanced code highlighting
use 'nvim-tree/nvim-web-devicons'

use 'neovim/nvim-lspconfig'

use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/cmp-nvim-lsp-signature-help';

use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'
use 'neovim/nvim-lspconfig'

use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'

use 'lewis6991/gitsigns.nvim'
use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
use 'rafamadriz/friendly-snippets'
use 'mfussenegger/nvim-dap'
use 'sindrets/diffview.nvim' 
use 'theHamsta/nvim-dap-virtual-text'
use 'simrat39/symbols-outline.nvim'

use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    }
}
    

use {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

-- I was unable to get the node dap working with mason so i'm using this.
-- use {
  -- "microsoft/vscode-js-debug",
  -- opt = true,
  -- run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
-- }

use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }

end)
