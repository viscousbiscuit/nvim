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

local copilot = require("../plugins/copilot")
local dashboard = require("../plugins/dashboard")
local neorg = require("../plugins/neorg")
local symbolUsage = require("../plugins/symbol-usage")
local treeSitter = require("../plugins/treesitter")
local theme = require("../plugins/theme")
local telescope = require("../plugins/telescope")
local lspconfig = require("../plugins/lspconfig")

local plugins = {
    copilot,
    dashboard,
    symbolUsage,
    treeSitter,
    { 'nvim-tree/nvim-web-devicons',      lazy = true },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'wakatime/vim-wakatime' },
    theme,
    { 'mbbill/undotree' },
    { 'nvim-lua/plenary.nvim' },
    telescope,
    { 'nvim-telescope/telescope-file-browser.nvim', lazy = true },
    { 'gbrlsnchs/telescope-lsp-handlers.nvim' },
    { 'nvim-tree/nvim-web-devicons',                lazy = true },
    { 'L3MON4D3/LuaSnip' },
    { 'lewis6991/gitsigns.nvim' },
    { 'onsails/lspkind-nvim' },
    { 'nvim-lualine/lualine.nvim' },
    lspconfig,
    { 'jose-elias-alvarez/null-ls.nvim' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'theHamsta/nvim-dap-virtual-text' },
    { 'leoluz/nvim-dap-go' },
    { 'mfussenegger/nvim-dap',              lazy = true },
    { 'stevearc/aerial.nvim' },
    { 'mfussenegger/nvim-dap' },
    { "rcarriga/nvim-dap-ui",               dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    { 'mxsdev/nvim-dap-vscode-js' },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    neorg,
}
require("lazy").setup(plugins, {})
require('viscousbiscuits.remap')

vim.cmd("set number")
vim.cmd("set relativenumber")
