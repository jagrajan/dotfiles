call plug#begin('~/.local/share/nvim/plugged')
Plug 'joshdick/onedark.vim'
call plug#end()

"---[ Tabs/Spacing ]---"
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set sw=2

"---[ Copy/paste clipboard ]---"
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P⎈

"---[ Vim windows ]---"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow splitright

syntax on
colorscheme onedark
