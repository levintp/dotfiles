-- +-------------------------------------+
-- |             Nvim Screen             |
-- |            Configuration            |
-- +-------------------------------------+



local alpha = require('alpha')
local theme = require('alpha.themes.dashboard')



-- +-------------------------------------+
-- |               Headers               |
-- |               Section               |
-- +-------------------------------------+

theme.section.header.val = {
  [[                                                                     ]],
  [[       ███████████           █████      ██                     ]],
  [[      ███████████             █████                             ]],
  [[      ████████████████ ███████████ ███   ███████     ]],
  [[     ████████████████ ████████████ █████ ██████████████   ]],
  [[    █████████████████████████████ █████ █████ ████ █████   ]],
  [[  ██████████████████████████████████ █████ █████ ████ █████  ]],
  [[ ██████  ███ █████████████████ ████ █████ █████ ████ ██████ ]],
  [[ ██████   ██  ███████████████   ██ █████████████████ ]],
  [[ ██████   ██  ███████████████   ██ █████████████████ ]],
}



-- +-------------------------------------+
-- |               Buttons               |
-- |               Section               |
-- +-------------------------------------+

theme.section.buttons.val = {
  theme.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
  theme.button( "SPC f t", "  Open Telescope"),
  theme.button( "SPC f b", "ﱮ  Open current directory"),
  theme.button( "p", "  Start painting", ":ene <BAR> startinsert <CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><CR><ESC>:lua Toggle_venn()<CR>"),
  theme.button( "q", "  Quit NeoVim" , ":qa<CR>"),
}



-- +-------------------------------------+
-- |               Footers               |
-- |               Section               |
-- +-------------------------------------+

theme.section.footer.val = "Cyber"



-- +-------------------------------------+
-- |            Configuration            |
-- +-------------------------------------+

-- Set noautocmd to true
theme.config.opts.noautocmd = true

-- Set autocmd (if noautocmd was false) to notify when Alpha is ready
vim.cmd[[autocmd User AlphaReady lua vim.notify('NeoVim is ready')]]

-- Apply the configuration and setup alpha
alpha.setup(theme.config)
