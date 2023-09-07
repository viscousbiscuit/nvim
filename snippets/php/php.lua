local luasnip = require('luasnip')
local snippets, autosnippets = {}, {}
local fmt = require('luasnip.extras.fmt')
local rep = require('luasnip.extras').rep


local group = vim.api.nvim_create_augroup('Lua Snippets', { clear = true })
local file_pattern = '*.lua'


local mySnippet = luasnip.s('mySnippet', { luasnip.t('hi') })

local mySnippet2 = luasnip.s('mySecondSnippet', { luasnip.t('blahhhhhhh') })

table.insert(snippets, mySnippet)

table.insert(snippets, mySnippet2)

table.insert(snippets, llEndpointTemplate)

return snippets, autosnippets
