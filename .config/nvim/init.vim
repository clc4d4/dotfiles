call plug#begin('~/.local/share/nvim/plugged')

Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}



call plug#end()


let g:vimwiki_list = [{'path': '~/Sync/mywiki/',
                      \ 'path_html': '~/Sync/mywiki_html'}]

let g:vimwiki_list = [{'path': '~/Sync/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" line number
set number
set relativenumber
set tabstop=4           "tab length
set shiftwidth=4        "autoindent
