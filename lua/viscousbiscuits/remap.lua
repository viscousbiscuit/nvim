vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Sex)
vim.keymap.set("n", "<leader>fj", ":set syntax=json <BAR> :%!jq .<CR>")
vim.keymap.set("n", "<leader>ss", ":split<Return><C-w>w")
vim.keymap.set("n", "<leader>sv", ":vnew<Return>")

vim.keymap.set("n", "<leader>tr", ":Telescope resume<Return>")

vim.keymap.set("n", "<Space>", "<C-w>w")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>b", ":b<space><tab>")
vim.keymap.set("n", "<leader>bn", ":enew<return> | :file ")

-- clipboard yank
vim.keymap.set("n", "Y", '"+y')
vim.keymap.set("n", "YY", '^"+y$')
vim.keymap.set("v", "Y", '"+y')

vim.keymap.set("n", "<leader>r", ":%s/")

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

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})

-- Telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", telescope.find_files, {})
vim.keymap.set("n", "<C-p", telescope.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	telescope.grep_string({ search = vim.fn.input("Grep > ") })
end)

local scratch = require("../plugins/scratch").scratch
local exec = require("../plugins/scratch").executeScript
local findFiles = require("../plugins/scratch").findFiles
vim.keymap.set("n", "<leader>sn", scratch)
vim.keymap.set("n", "<leader>se", exec)
vim.keymap.set("n", "<leader>sf", findFiles)

vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap(
	"n",
	"<space>fb",
	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{ noremap = true }
)

-- Formatter
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})

-- DAP
--vim.keymap.set({ "n", "<Leader>dro", ":lua require('dap').repl.open()<CR>" })
vim.keymap.set("n", "<Leader>dro", ":lua require('dap').repl.open({}, 'rightbelow split')<CR>")


vim.keymap.set("n", "<leader>he", function()
  local filepath = vim.fn.expand("%:p")
  local env_file = vim.fn.filereadable(".env") == 1 and "--variables-file .env" or ""
  vim.cmd("new")
  vim.cmd("read !hurl " .. env_file .. " " .. filepath)
  vim.bo.filetype = "json"
end, { desc = "Run hurl on current buffer file and show JSON output" })


vim.keymap.set("n", "<leader>ce", function()
  local lines = vim.fn.getline(1, "$") -- Get all lines from the current buffer
  if #lines > 0 and lines[1]:match("^curl%s") then
    lines[1] = lines[1]:gsub("^curl%s+", "") -- Strip 'curl' from the first line
  end

  local command_parts = {}
  for _, line in ipairs(lines) do
    local stripped_line = line:gsub("\\%s*$", "") -- Remove only trailing '\' and spaces
    table.insert(command_parts, stripped_line)
  end

  local curl_command = table.concat(command_parts, " ") -- Combine lines into a single command
  local output = vim.fn.system('curl ' .. curl_command) -- Execute the curl command
  vim.cmd("new") -- Open a new split
  local buf = vim.api.nvim_get_current_buf() -- Get the current buffer in the new split
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(output, "\n")) -- Set output in the new buffer


 -- local curl_command = table.concat(command_parts, " ") -- Combine lines into a single command
 -- vim.cmd("new") -- Open a new split
 -- vim.cmd("!curl " .. curl_command)
end, { desc = "Run curl command from current buffer and show output" })

