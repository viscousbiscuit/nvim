local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

local plugins = {
    { 'nvimdev/dashboard-nvim', lazy = false },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'wakatime/vim-wakatime' },
    { 'folke/tokyonight.nvim' },
    { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
    { 'mbbill/undotree', lazy = true },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim', lazy = true },
    { 'gbrlsnchs/telescope-lsp-handlers.nvim' },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    { 'L3MON4D3/LuaSnip' },
    { 'lewis6991/gitsigns.nvim' },
    { 'onsails/lspkind-nvim' },
    { 'nvim-lualine/lualine.nvim'},
    { 'neovim/nvim-lspconfig'},
    { 'jose-elias-alvarez/null-ls.nvim' },       
    { 'hrsh7th/nvim-cmp'},                       
    { 'hrsh7th/cmp-nvim-lsp'},               
    { 'hrsh7th/cmp-buffer'},
    { 'hrsh7th/cmp-path'},
    { 'hrsh7th/cmp-cmdline'},                
    { 'hrsh7th/cmp-nvim-lsp-signature-help'},
    { 'saadparwaiz1/cmp_luasnip'},
    { 'theHamsta/nvim-dap-virtual-text' },
    { 'mfussenegger/nvim-dap', lazy = true },
    { 'stevearc/aerial.nvim' },
    { 'mfussenegger/nvim-dap' },
    { 'rcarriga/nvim-dap-ui' },
    { 'mxsdev/nvim-dap-vscode-js' }
}

require("lazy").setup(plugins, opts)
require('viscousbiscuits.remap')

vim.cmd("set number")
vim.cmd("set relativenumber")
