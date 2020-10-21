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

let g:dev = "postgresql://fhirbase@localhost:5433/fhirbase"

"---[ General config ]---"
map ; :
let mapleader=" "
let maplocalleader=","

" Vim struggles with syntax highlighting with long files. This has been fixing
" the issue so far.
syntax sync fromstart

" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

" Dont't replace the register when pasting in visual mode
xnoremap p pgvy

"---[ Copy/paste clipboard ]---"
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P⎈

"---[ Vim windows ]---"
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

set splitbelow splitright

" Move current window to new tab
nnoremap <c-w>t <C-W><S-t><cr>

" Duplicate current buffer in new window
nnoremap <c-w>d :tab split<cr>

nnoremap <c-w>m :Tabmerge

noremap <silent> <left> :vertical resize +3<cr>
noremap <silent> <right> :vertical resize -3<cr>
noremap <silent> <up> :resize +3<cr>
noremap <silent> <down> :resize -3<cr>

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

"---[ Vim config commands ]---"
nnoremap <leader>ve :tabedit $MYVIMRC<cr>:lcd %:p:h<cr>
nnoremap <leader>vo :tabedit $HOME/.config/nvim/init-old.vim<cr>
nnoremap <leader>vr :so $MYVIMRC<cr>
nnoremap <leader>vp :PlugInstall<cr>

nnoremap <leader>cw :set wrap!<cr>

nmap <leader>ga :Gblame<cr>
nmap <leader>go :Gbrowse<cr>
xmap <leader>go :Gbrowse<cr>
nnoremap <Leader>gg :Gstatus<cr> <C-W><S-T><cr>
nmap <leader>gj <Plug>(GitGutterNextHunk)
nmap <leader>gk <Plug>(GitGutterPrevHunk)

nmap <leader>qd :DB g:dev<space>
xmap <leader>qd :DB g:dev<cr>

"---[ Moving around/navigation ]---"
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fr :History<cr>
nnoremap <leader>fe :Rg<space>

let g:completion_enable_snippet = 'UltiSnips'
let g:completion_enable_fuzzy_match = 1
let g:diagnostic_enable_virtual_text = 1

" fix conflict between completion-nvim and autopairs
" let g:completion_confirm_key = ""
let g:completion_enable_auto_popup = 0
"map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)
inoremap <expr> <cr>    pumvisible() ? "\<Plug>(completion_confirm_completion)" : "\<cr>"

:source $HOME/.config/nvim/mappings.vim

for f in glob('~/.config/nvim/autocmd/*.vim', 0 ,1)
    exe 'source' f
endfor
