return {
    'https://github.com/lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {
        debounce = 100,
        whitespace = { highlight = { "Whitespace", "NonText" } },
        scope = {
            enabled = false,
            show_start = true,
            show_end = false,
            injected_languages = false,
            highlight = { "Function", "Label" },
            priority = 500,
            exclude = { language = { "lua" } }
        },

    }
}
