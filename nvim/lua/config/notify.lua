-- +-------------------------------------+
-- |             Nvim Notify             |
-- |            Configuration            |
-- +-------------------------------------+



local notify = require('notify')




-- Hook on vim's notifications
vim.notify = notify

-- Hook on lsp's showMessage handler
vim.lsp.handlers['window/showMessage'] = function(_, result, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  local lvl = ({
    'ERROR',
    'WARN',
    'INFO',
    'DEBUG',
  })[result.type]
  notify({ result.message }, lvl, {
    title = 'LSP | ' .. client.name,
    timeout = 10000,
    keep = function()
      return lvl == 'ERROR' or lvl == 'WARN'
    end,
  })
end

-- When support for ui_attach is added, this will:
-- Hook on vim's messages
--vim.ui_attach({ext_message=true}, function (a, ...)
--  require'luadev'.print(a, vim.inspect{...})
--end)
