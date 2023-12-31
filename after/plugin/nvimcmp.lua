local status, cmp = pcall(require, "cmp")

if (not status) then return end
local lspkind = require('lspkind')
local luasnip = require('luasnip')

require("luasnip.loaders.from_vscode").load()

cmp.setup({
  snippet = {
    expand = function(args)
            luasnip.lsp_expand(args.body)
    end,
  },
   mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
         -- Use <Tab> as the automplete trigger
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,

    }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' }, 
    { name = 'luasnip'},
--    { name = 'luasnip.loaders.from_vscode'}
  }),
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
    })
  }
})
