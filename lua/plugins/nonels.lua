local sql_formatter_config_file = os.getenv("HOME") .. "/.config/nvim/formatters/sql_formatter/sql.json"

return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- lua
                null_ls.builtins.formatting.stylua,
                --null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.formatting.prettier,
                -- sql
                null_ls.builtins.formatting.sql_formatter.with({
                    filetypes = { "sql", "mysql" },
                    tabWidth = 40,
                    args = { "--config", sql_formatter_config_file },
                }),
            },
            on_attach = on_attach,
        })
    end,
}
