-- +-------------------------------------+
-- |              lspconfig              |
-- |            Configuration            |
-- +-------------------------------------+



lspconf = require('lspconfig')



-- +-------------------------------------+
-- |      Register Language Servers      |
-- +-------------------------------------+
lspconf.pyright.setup{}
lspconf.clangd.setup{}
lspconf.luau_lsp.setup{}
lspconf.rust_analyzer.setup{}



-- +-------------------------------------+
-- |            Message Style            |
-- +-------------------------------------+
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end
