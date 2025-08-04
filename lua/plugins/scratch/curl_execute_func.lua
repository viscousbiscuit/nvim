return function()
	local lines = vim.fn.getline(1, "$")
	if #lines > 0 and lines[1]:match("^curl%s") then
		lines[1] = lines[1]:gsub("^curl%s+", "")
	end

	local command_parts = {}
	for _, line in ipairs(lines) do
		local stripped_line = line:gsub("\\%s*$", "")
		table.insert(command_parts, stripped_line)
	end

	local curl_command = table.concat(command_parts, " ")
	local output = vim.fn.system("curl " .. curl_command)
	vim.cmd("new")
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(output, "\n"))
end
