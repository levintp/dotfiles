-- +-------------------------------------+
-- |               Lualine               |
-- |            Configuration            |
-- +-------------------------------------+



lualine = require('lualine')



-- +-------------------------------------+
-- |          Status line style          |
-- +-------------------------------------+
lualine.setup {
  options = {
    theme = 'nord',
    section_separators = {
      left = '',
      right = ''
    },
    component_separators = {
      right = '',
      left = ''
    }
  },
}
