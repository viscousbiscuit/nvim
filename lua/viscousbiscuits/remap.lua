
vim.g.mapleader = ' '
-- Open file editor in detached mode
vim.keymap.set('n', '<leader>pv', vim.cmd.Sex)
-- Set document as json and format
vim.keymap.set('n', '<leader>fj', ':set syntax=json <BAR> :%!jq .<CR>');
-- Split Screen
vim.keymap.set('n', '<leader>ss', ':split<Return><C-w>w')
-- vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
vim.keymap.set('n', '<leader>sv', ':vnew<Return>');
-- Move wndow
vim.keymap.set('n', '<Space>', '<C-w>w')
vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-l>', '<C-w>l')

-- replace
--
vim.keymap.set('n', '<leader>r', ':%s/');

-- For code outline
vim.keymap.set('n', '<leader>co', ':SymbolsOutline<Return>')

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

-- Telescope
--
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', telescope.find_files, {})
vim.keymap.set('n', '<C-p', telescope.git_files, {})
vim.keymap.set('n', '<leader>ps', function() 
	telescope.grep_string({search = vim.fn.input("Grep > ") });
end)

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

