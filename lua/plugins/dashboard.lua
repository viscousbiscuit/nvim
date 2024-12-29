return {
    "nvimdev/dashboard-nvim",
    lazy = false,
    opts = {
        theme = "hyper",
        config = {
            week_header = {
                enable = true,
            },
            shortcut = {
                { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
                {
                    icon = " ",
                    icon_hl = "@variable",
                    desc = "Files",
                    group = "Label",
                    action = "Telescope find_files",
                    key = "f",
                },
                {
                    desc = " Scratch",
                    group = "DiagnosticHint",
                    action = "<leader>sn",
                    key = "s",
                },
                {
                    desc = " Marks",
                    group = "Number",
                    action = "Telescope marks",
                    key = "m",
                },
            },
            footer = {},
        },
    },
}
