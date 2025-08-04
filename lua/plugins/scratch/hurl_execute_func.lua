return function()
  local filepath = vim.fn.expand("%:p")
  local env_file = vim.fn.filereadable(".env") == 1 and "--variables-file .env" or ""
  vim.cmd("new")
  vim.cmd("read !hurl " .. env_file .. " " .. filepath)
  vim.bo.filetype = "json"
end
