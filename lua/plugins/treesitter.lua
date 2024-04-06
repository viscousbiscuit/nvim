return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            sync_install = false,
            highlight = { enable = true },
            ignore_install = {},
            modules = {},
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm"
                }
            },
            auto_install = true,
            indent = { enable = true },
            ensure_installed = {
                "tsx",
                "toml",
                "php",
                "json",
                "yaml",
                "css",
                "html",
                "go",
                "yaml",
                "graphql",
                "sql",
            }
        })
    end

}
