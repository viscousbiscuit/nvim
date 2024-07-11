return {
    'neovim/nvim-lspconfig',
    config = function()
        require('mason').setup()
        require("mason-lspconfig").setup {
            ensure_installed = { "lua_ls", "tsserver", "intelephense", "gopls", "sqlls" },
            automatic_installation = true,
        }
        require("lspconfig").intelephense.setup {}
        require("lspconfig").tsserver.setup {
            --    eslint = {
            --        settings = {
            --            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            --            workingDirectories = { mode = 'auto' },
            --        },
            --        on_attach = function(client, bufnr)
            --            vim.api.nvim_create_autocmd('BufWritePre', {
            --                buffer = bufnr,
            --                command = 'EslintFixAll',
            --            })
            --            -- Set a buffer variable to indicate that the autocmd is set
            --            vim.api.nvim_buf_set_var(bufnr, 'eslint_fix_all_set', true)
            --        end,
            --    },
            --    tsserver = {
            --        on_attach = function(client, bufnr)
            --            client.resolved_capabilities.document_formatting = false
            --            client.resolved_capabilities.document_range_formatting = false

            --            -- Setup typescript-tools within tsserver on_attach
            --            local ts_utils = require 'typescript-tools.utils'
            --            ts_utils.setup_client(client)
            --        end,
            --    },
        }
        require("lspconfig").gopls.setup {}
        require("lspconfig").graphql.setup {}
        require("lspconfig").yamlls.setup {}
        require("lspconfig").sqlls.setup {}
        require("lspconfig").lua_ls.setup {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {
                            'vim',
                            'require'
                        },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }


        -- Setup language servers.
        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<space><tab>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)

                -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                local telescope = require('telescope.builtin')
                vim.keymap.set('n', 'gr',
                    function()
                        telescope.lsp_references()
                    end)


                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })
    end
}
