local luasnip = require('luasnip')

require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/snippets/'})

luasnip.config.set_config({
    history = true,
    updateevents = 'TextChanged,TextChangedI', -- update as you type
    enable_autosnippets = true,
    })

