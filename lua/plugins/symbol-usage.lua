local SymbolKind = vim.lsp.protocol.SymbolKind

return {
    'Wansmer/symbol-usage.nvim',
    event = 'BufReadPre', -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function()
        require('symbol-usage').setup({
            vt_position = 'above',
            include_declaration = true,
            references = { enabled = true, include_declaration = true },
            kinds = {
                SymbolKind.Function,
                SymbolKind.Method,
                SymbolKind.Class,
            },
            disable = {
                cond = {
                    function()
                        -- disable for all files in node_modules
                        return vim.fn.expand("%:p"):find("/node_modules/")
                    end,
                },
            },
        })
    end
}
