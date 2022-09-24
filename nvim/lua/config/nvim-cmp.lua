-- +-------------------------------------+
-- |            Nvim Complete            |
-- |            Configuration            |
-- +-------------------------------------+



local cmp = require('cmp')



-- +-------------------------------------+
-- |        Auto Completion Setup        |
-- +-------------------------------------+

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  window = {},
  mapping = cmp.mapping.preset.insert {
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Esc>"] = cmp.mapping.close(),
    ["<C-Space"] = cmp.mapping.complete(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
  },
  completion = {
    keyword_length = 1,
    completeopt = "menu,noselect",
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
    { name = 'calc' },
    { name = 'spell' },
  })
})



-- +-------------------------------------+
-- |          Specific Filetype          |
-- |           Auto Completion           |
-- +-------------------------------------+

-- Setup auto completion for gitcommit filetypes
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' },
  })
})

-- Setup auto completion for lua filetypes
cmp.setup.filetype('lua', {
  sources = cmp.config.sources({
    { name = 'nvim_lua' }
  }, {
    { name = 'buffer' },
  })
})



-- +-------------------------------------+
-- |             Neovim Mode             |
-- |           Auto Completion           |
-- +-------------------------------------+

-- Setup auto completion for search within nvim
for _,v in pairs({ '/', '?' }) do
  cmp.setup.cmdline(v, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
end

-- Setup auto completion for the commandline
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
