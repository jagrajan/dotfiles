call plug#begin('~/.local/share/nvim/plugged')

Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'baskerville/vim-sxhkdrc'
Plug 'brennier/quicktex'
Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'digitaltoad/vim-pug'
Plug 'francoiscabrol/ranger.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'machakann/vim-highlightedyank'
Plug 'mattn/vim-lsp-settings'
Plug 'meain/vim-automkdir'
Plug 'mhinz/vim-janah'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'rbgrouleff/bclose.vim'
Plug 'ruanyl/vim-gh-line'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'wellle/targets.vim'
Plug 'yggdroot/indentline'

call plug#end()

set nocompatible
filetype plugin on
syntax on

let mapleader=","

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set sw=2

set number
set relativenumber

" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

map <Space> :

let g:indentLine_setConceal = 1
let g:indentLine_color_term = 239
" let g:indentLine_bgcolor_term = 202
set foldmethod=indent


"====[ Make the 81st column stand out ]====================
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"===[ FZF Settings ]===
nnoremap <Leader>, :Files<cr>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

"===[ Conceal level ]===
nnoremap <Leader>l0 :set conceallevel=0<cr>
nnoremap <Leader>l1 :set conceallevel=1<cr>
nnoremap <Leader>l2 :set conceallevel=2<cr>


"===[ UltiSnips config ]===
nnoremap <Leader>ue :UltiSnipsEdit<cr>
nnoremap <Leader>ua :UltiSnipsEdit all<cr>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=['~/snippets']

"===[ Config management ]===
nnoremap <Leader>vi :tabedit $MYVIMRC<cr>
nnoremap <Leader>ip :PlugInstall<cr>
nnoremap <Leader>rv :so $MYVIMRC<cr>
nnoremap <Leader>rc :tabedit ~/.zshrc<cr>

nnoremap <Leader>fw :FixWhitespace<cr>

"===[ Git related config ]===
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gw :Gwrite<cr>
nnoremap <Leader>gr :Gread<cr>
nnoremap <Leader>gp :Gpush<cr>
nnoremap <Leader>gl :Glog -- %<cr>
nnoremap <Leader>gg :Gstatus<cr> <C-W><S-T><cr>

"===[ Built in terminal helpers ]===
if has('nvim')
  nnoremap <Leader>tt :tabedit +terminal<cr>
  nnoremap <Leader>dt :r !date<cr>yypVr=
  tnoremap <C-q>t <C-\><C-n>:tabnew +terminal<CR>
  nnoremap <Leader>ts :new +terminal<cr>
  tnoremap <C-q>s <C-\><C-n>:new +terminal<CR>
  nnoremap <Leader>tv :vnew +terminal<cr>
  tnoremap <C-q>v <C-\><C-n>:vnew +terminal<cr>
  tnoremap <C-q><esc> <c-\><c-n>
endif

nnoremap <Leader><Space> :noh<cr>
nnoremap <Leader>n :cnext<cr>
nnoremap <Leader>p :cprev<cr>


cnoreabbrev Ack Ack!
nnoremap <Leader>A :Ack!<Space>
nnoremap <Leader>rg :Rg<Space>
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

"---[ Copy/paste clipboard ]---"
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P⎈

"---[ ALE/Linters ]---"
let g:lsp_highlight_references_enabled = 1
let g:lsp_diagnostics_enabled = 0
let g:ale_fixers = {
\   'python': [
\       'autopep8',
\   ],
\   'typescript': [
\       'prettier',
\       'tslint',
\       'xo',
\   ],
\}
nnoremap <Leader>af :ALEFix<cr>
nnoremap <Leader>an :ALENext<cr>
nnoremap <Leader>lr :ALEFindReferences<cr>
nnoremap <Leader>ldd :ALEGoToDefinition<cr>
nnoremap <Leader>ldv :ALEGoToDefinition -vsplit<cr>
nnoremap <Leader>ldt :ALEGoToDefinition -tab<cr>
nnoremap <Leader>lds :ALEGoToDefinition -split<cr>

let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
highlight link EchoDocFloat Pmenu

" autocmd FileType vimwiki nnoremap <buffer> <leader>tc :VimwikiTOC<cr>
autocmd FileType vimwiki nnoremap <buffer><silent><leader>tc :VimwikiTOC<CR>
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'php': 'php'}
let g:vimwiki_list = [wiki]

"---[ Live latex preview ]---"
" let g:livepreview_previewer = 'zathura'
" let g:livepreview_engine = 'pdflatex -shell-escape -interaction=nonstopmode'
" let g:vimtex_latexmk_options = '-pdf -shell-escape -verbose -file-line-error -synctex=1 -interaction=nonstopmode'
let g:vimtex_view_method = 'zathura'

"---[ Vim windows ]---"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow splitright

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Move current window to new tab
nnoremap <Leader>zz <C-W><S-t><cr>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

:so ~/dotfiles/nvim/latex.vim

let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ }

colorscheme janah
