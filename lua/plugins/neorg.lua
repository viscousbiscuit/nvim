return {
  "nvim-neorg/neorg",
  dependencies = { "nvim-lua/plenary.nvim", "luarocks.nvim" },
  version = "*",
  lazy = false, -- enable lazy load
  ft = "norg", -- lazy load on file type
  cmd = "Neorg", -- lazy load on command
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              work = "~/viscousbiscuits/notes/work",
              gist = "~/viscousbiscuits/notes/gist",
              personal = "~/viscousbiscuits/notes/personal",
              notes = "~/viscousbiscuits/notes",
            },
          },
        },
      },
    }
  end,
}
