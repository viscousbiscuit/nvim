local dap = require'dap'

-- This dap was installed by mason
-- the path was set based on where mason installed the plugin
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" }
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
        log = true,
    port = 9003,
    pathMappings = {
      ["/var/www/html"] = "${workspaceFolder}/app"
    }
  }
}


require("dapui").setup()

vim.fn.sign_define('DapBreakpoint',{ text ='󱠇', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='', texthl ='', linehl ='', numhl =''})

vim.api.nvim_set_keymap('n', '<F8>', [[:lua require"dap".toggle_breakpoint()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<F10>', [[:lua require"dap".step_over()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<F12>', [[:lua require"dap.ui.widgets".hover()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<F11>', [[:lua require"dap".step_into()<CR>]], { noremap = true})
vim.api.nvim_set_keymap('n', '<S-F11>', [[:lua require"dap".step_out()<CR>]], { noremap = true})
vim.api.nvim_set_keymap('n', '<F6>', [[:DapTerminate<CR> :lua require('dapui').close()<CR>]], { noremap = true})
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)

vim.api.nvim_set_keymap('n', '<Leader>de', [[:lua require("dapui").eval()<CR>]], { noremap = true})


    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end)
    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end)
    vim.keymap.set('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', '<Leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end)






local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.event_terminated["dap"] = function()
    print('dap before.event_terminated')
  -- dapui.close()
end


dap.listeners.after.event_initialized['dap'] = function()
    print('dap after.event_initialized')
   dapui.open()
end

dap.listeners.before.event_exited["dap"] = function()
    print('dap before.event_exited')
  -- dapui.close()
end



