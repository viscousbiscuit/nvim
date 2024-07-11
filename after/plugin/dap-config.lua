local dap = require('dap')
require('mason').setup()

--require('dap-vscode-js').setup({
--  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
--})


require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    -- the path to the executable dlv which will be used for debugging.
    -- by default, this is the "dlv" executable on your PATH.
    path = "dlv",
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}",
    -- additional args to pass to dlv
    args = {},
    -- the build flags that are passed to delve.
    -- defaults to empty string, but can be used to provide flags
    -- such as "-tags=unit" to make sure the test suite is
    -- compiled during debugging, for example.
    -- passing build flags using args is ineffective, as those are
    -- ignored by delve in dap mode.
    build_flags = "",
  },
}


-- language config
for _, language in ipairs({ 'typescript', 'javascript' }) do
    dap.configurations[language] = {
        {
            name = 'Attach to port 9229',
            type = 'pwa-node',
            request = 'attach',
            port = 9229,
            restart = true,
            address = "localhost",
            trace = true,
            protocol = "inspector",
            skipFiles = { '<node_internals>/**' },
            program = "${workspaceFolder}/src/main.ts",
            envFile =  "${workspaceFolder}/.env",
            preLaunchTask = "tsc: build - tsconfig.json",
            resolveSourceMapLocations = {"${workspaceFolder}/build/src/**", "!**/node_modules/**"},
            remoteRoot = "/app",
            localRoot = "${workspaceFolder}",
            outFiles =  {"${workspaceFolder}/build/src/**/*.js", "${workspaceFolder}/build/src/**/*.json"},
            cwd = '${workspaceFolder}',
        },
        {
            name = 'Launch TS',
            type = 'pwa-node',
            request = 'launch',
            trace = true,
            skipFiles = { '<node_internals>/**' },
            program = "${workspaceFolder}/src/main.ts",
            envFile =  "${workspaceFolder}/.env",
            preLaunchTask = "tsc: build - tsconfig.json",
            resolveSourceMapLocations = {"${workspaceFolder}/build/src/**", "!**/node_modules/**"},
            outFiles =  {"${workspaceFolder}/build/src/**/*.js", "${workspaceFolder}/build/src/**/*.json"},
            cwd = '${workspaceFolder}',
        },
        {
            name = 'Launch',
            type = 'pwa-node',
            request = 'launch',
            program = '${file}',
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            skipFiles = { '<node_internals>/**' },
            protocol = 'inspector',
            console = 'integratedTerminal',
        },
        {
            name = 'Attach to node process',
            type = 'pwa-node',
            request = 'attach',
            rootPath = '${workspaceFolder}',
            processId = require('dap.utils').pick_process,
        },
        {
            name = 'Debug Main Process (Electron)',
            type = 'pwa-node',
            request = 'launch',
            program = '${workspaceFolder}/node_modules/.bin/electron',
            args = {
                '${workspaceFolder}/dist/index.js',
            },
            outFiles = {
                '${workspaceFolder}/dist/*.js',
            },
            resolveSourceMapLocations = {
                '${workspaceFolder}/dist/**/*.js',
                '${workspaceFolder}/dist/*.js',
            },
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            skipFiles = { '<node_internals>/**' },
            protocol = 'inspector',
            console = 'integratedTerminal',
        },
        {
            name = 'Compile & Debug Main Process (Electron)',
            type = custom_adapter,
            request = 'launch',
            preLaunchTask = 'npm run build-ts',
            program = '${workspaceFolder}/node_modules/.bin/electron',
            args = {
                '${workspaceFolder}/dist/index.js',
            },
            outFiles = {
                '${workspaceFolder}/dist/*.js',
            },
            resolveSourceMapLocations = {
                '${workspaceFolder}/dist/**/*.js',
                '${workspaceFolder}/dist/*.js',
            },
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            skipFiles = { '<node_internals>/**' },
            protocol = 'inspector',
            console = 'integratedTerminal',
        },
    }
end

-- This dap was installed by mason
-- the path was set based on where mason installed the plugin
dap.adapters.php = {
  type = "executable",
  command = "node",
    args = { vim.fn.stdpath('data') .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" }
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


--require("dapui").setup()

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


    

-- for inline debugging comments
require("nvim-dap-virtual-text").setup {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
    --- A callback that determines how a variable is displayed or whether it should be omitted
    --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
    --- @param buf number
    --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
    --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
    --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
    --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
    display_callback = function(variable, buf, stackframe, node, options)
      if options.virt_text_pos == 'inline' then
        return ' = ' .. variable.value
      else
        return variable.name .. ' = ' .. variable.value
      end
    end,
    -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
    virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

    -- experimental features:
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}


