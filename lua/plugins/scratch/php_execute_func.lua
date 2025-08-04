return function()
	local buffer = vim.fn.getline(1, "$")
	local output = vim.fn.system({"php"}, vim.fn.join(buffer, "\n"))
	vim.cmd("new")
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(output, "\n"))
end
