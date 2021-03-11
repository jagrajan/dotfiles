syntax on

source $HOME/.config/nvim/plugins.vim

"---[ Tabs/Spacing ]---"
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set sw=2
set updatetime=100
set foldmethod=indent
set noswapfile
set hidden

let g:dev = "postgresql://fhirbase@localhost:5433/fhirbase"

"---[ General config ]---"
nnoremap ; :
xnoremap ; :
let mapleader=" "
let maplocalleader=","

" Vim struggles with syntax highlighting with long files. This has been fixing
" the issue so far.
syntax sync fromstart

"---[ Copy/paste clipboard ]---"
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P⎈

"---[ Vim windows ]---"
set splitbelow splitright

" Duplicate current buffer in new tab
nnoremap <c-w>d :tab split<cr>

nnoremap <c-w>m :Tabmerge

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ | "don't lint

"---[ Vim config commands ]---"

nnoremap <leader>cw :set wrap!<cr>

nnoremap <leader>qd :DB g:dev<space>
xnoremap <leader>qd :DB g:dev<cr>

lua require 'jag/init'
:source $HOME/.config/nvim/mappings.vim

:source $HOME/.config/nvim/statusline.vim

for f in glob('~/.config/nvim/autocmd/*.vim', 0 ,1)
    exe 'source' f
endfor
