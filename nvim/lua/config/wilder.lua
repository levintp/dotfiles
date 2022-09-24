-- +-------------------------------------+
-- |                Wilder               |
-- |            Configuration            |
-- +-------------------------------------+



wilder = require('wilder')



wilder.setup({
  modes = {':', '/', '?'},
  next_key = '<Tab>',
  previous_key = '<S-Tab>',
  accept_key = '<Down>',
  reject_key = '<Up>',
})
