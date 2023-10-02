local luasnip = require('luasnip')
local snippets, autosnippets = {}, {}



local mySnippet = luasnip.s('mySnippet', { luasnip.t('hi') })

local mySnippet2 = luasnip.s('mySecondSnippet', { luasnip.t('blahhhhhhh') })
local mysnippet3 = luasnip.s('myThirdSnippet', { luasnip.t('boom')})

table.insert(snippets, mySnippet)
table.insert(snippets, mySnippet2)
table.insert(snippets, llEndpointTemplate)

return snippets, autosnippets
