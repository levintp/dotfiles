" +----------------------------------------+
" |          NeoVim configuration          |
" +----------------------------------------+
" |              Author: Lior              |
" +----------------------------------------+



lua vim.g.loaded = 1
lua vim.g.loaded_netrwPlugin = 1


" +----------------------------------------+
" |          Plugin configuration          |
" +----------------------------------------+

set packpath=~/.config/nvim,~/.config/nvim/packer/site
lua require('plugins')



" +----------------------------------------+
" |          Editor configuration          |
" +----------------------------------------+

" Configure tabs
set tabstop=4
set shiftwidth=4
set expandtab



" +----------------------------------------+
" |        Appearance configuration        |
" +----------------------------------------+

" Set colorscheme
colorscheme nord

" Display number line
set number



" +----------------------------------------+
" |              Key bindings              |
" +----------------------------------------+

" Set Telescope specific key bindings
nnoremap <leader>ft <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Set NvimTree specific key bindings
nnoremap <leader>fb <cmd>NvimTreeFocus<cr>

" Set Trouble specific key bindings
nnoremap <leader>t <cmd>TroubleToggle<cr>
