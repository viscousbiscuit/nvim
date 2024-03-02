            local configs = require("nvim-treesitter.configs")
            configs.setup({
                sync_install = false,
                highlight = { enable = true },
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
                  "graphql"
                }
            })






--  local status, ts = pcall(require, "nvim-treesitter.configs")
--  
--  if (not status) then return end
--  
--  ts.setup {
--    auto_install = true,
--    highlight = {
--      enable = true,
--      disable = { },
--    },
--    indent = {
--      enable = true,
--      disable = {},
--    },
--      keymaps = {
--          -- You can use the capture groups defined in textobjects.scm
--           ["af"] = "@function.outer",
--           ["if"] = "@function.inner",
--           ["ac"] = "@class.outer",
--          -- You can optionally set descriptions to the mappings (used in the desc parameter of
--          -- nvim_buf_set_keymap) which plugins like which-key display
--           ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
--          -- You can also use captures from other query groups like `locals.scm`
--           ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
--        },
--    ensure_installed = {
--      "tsx",
--      "toml",
--      "php",
--      "json",
--      "yaml",
--      "css",
--      "html"
--    },
--    autotag = {
--      enable = false,
--    },
--  }
--  
--   local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--   parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

