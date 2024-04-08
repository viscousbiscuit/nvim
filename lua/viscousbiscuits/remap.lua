vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Open file editor in detached mode
vim.keymap.set('n', '<leader>pv', vim.cmd.Sex)
-- Set document as json and format
vim.keymap.set('n', '<leader>fj', ':set syntax=json <BAR> :%!jq .<CR>');
-- Split Screen
vim.keymap.set('n', '<leader>ss', ':split<Return><C-w>w')
-- vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
vim.keymap.set('n', '<leader>sv', ':vnew<Return>');
-- Move wndow
vim.keymap.set('n', '<leader>tr', ':Telescope resume<Return>');

vim.keymap.set('n', '<Space>', '<C-w>w')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-l>', '<C-w>l')


vim.keymap.set('n', '<leader>b', ':b<space><tab>')
vim.keymap.set('n', '<leader>bn', ':enew<return> | :file ')

-- black hole delete and clipboard yank
vim.keymap.set('n', '<leader>d', '"_')
vim.keymap.set('v', '<leader>d', '"_')
vim.keymap.set('n', '<leader>y', '"*')
vim.keymap.set('v', '<leader>y', '"*')

-- replace
vim.keymap.set('n', '<leader>r', ':%s/');

-- For code outline
vim.keymap.set("n", "<leader>co", "<cmd>AerialToggle!<CR>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.cmdheight = 1
vim.opt.scrolloff = 15
vim.opt.breakindent = true
vim.opt.wrap = false
vim.opt.splitright = true
vim.opt.backupcopy = "yes"

-- Telescope
--
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', telescope.find_files, {})
vim.keymap.set('n', '<C-p', telescope.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    telescope.grep_string({ search = vim.fn.input("Grep > ") });
end)

 local scratch = require("../plugins/scratch").scratch
 local exec = require("../plugins/scratch").executeScript
 local findFiles = require("../plugins/scratch").findFiles
 vim.keymap.set('n', '<leader>sn', scratch)
 vim.keymap.set('n', '<leader>se', exec)
 vim.keymap.set('n', '<leader>sf', findFiles)


vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true


vim.api.nvim_set_keymap(
    "n",
    "<space>fb",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { noremap = true }
)
