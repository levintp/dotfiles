-- +-------------------------------------+
-- |              lspconfig              |
-- |            Configuration            |
-- +-------------------------------------+



lspconf = require('lspconfig')



-- +-------------------------------------+
-- |      Register Language Servers      |
-- +-------------------------------------+
local nvim_cmp_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
lspconf.pyright.setup { capabilities = nvim_cmp_capabilities }
lspconf.clangd.setup { capabilities = nvim_cmp_capabilities }
lspconf.luau_lsp.setup { capabilities = nvim_cmp_capabilities }
lspconf.rust_analyzer.setup { capabilities = nvim_cmp_capabilities }
lspconf.taplo.setup { capabilities = nvim_cmp_capabilities }



-- +-------------------------------------+
-- |            Message Style            |
-- +-------------------------------------+
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end
