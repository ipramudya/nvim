local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then return end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then return end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then return end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' }
    }),
    formatting = {
        format = lspkind.cmp_format({
            ellipsis_char = '...',
            mode = 'symbol_text',
            maxwidth = 50,
            menu = ({
                buffer = "[Buffer]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
            })
        })
    }
})

vim.cmd [[
  set completeopt=menu,menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
