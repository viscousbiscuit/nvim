return
{
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
        local dap, dapui = require("dap"), require("dapui")

        dapui.setup()

        vim.g.mapleader = ' '
        vim.g.maplocalleader = ' '
        vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
            require('dap.ui.widgets').hover()
        end)
        vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
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
    end
}
