require("lualine").setup({
    sections = {
        lualine_a = { "branch" },
        lualine_b = { { "filename", path = 1 } },
        lualine_c = { "aerial" },
    },
    inactive_sections = {
        lualine_a = { { "filename", path = 1 } },
    },
    options = {
        theme = "tokyonight",
    },
})
