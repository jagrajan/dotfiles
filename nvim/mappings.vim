" Commonly used enough that they deserve a mapping
nnoremap gq :q<cr>
nnoremap gw :w<cr>
nnoremap <silent> gn :noh<cr>

inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Close the current tab if its not the only tab
nnoremap <silent> <c-w>q :tabclose<cr>

" Navigating can be annoying with lines that wrap
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Snippets
nnoremap <Leader>ue :UltiSnipsEdit<cr>
nnoremap <Leader>ua :UltiSnipsEdit all<cr>

" Git
" Open file/lines on github
nnoremap <silent> <leader>go :Gbrowse!<cr>
xnoremap <silent> <leader>go :Gbrowse!<cr>

" Open git status in a new tab
nnoremap <silent> <Leader>gg :Git<cr><c-w><s-t><cr>

nnoremap <silent> <Leader>gc :Git commit<cr>

" Opens a column with latest commit for line
nnoremap <silent> <leader>ga :Gblame<cr>

" Show file history
nnoremap <silent> <leader>gh :GV!<cr>

" Open a diff vertical split, use do/dp to stage/unstage
nnoremap <silent> <leader>gv :Gvdiffsplit<cr>

" Refresh git gutter
nnoremap <silent> <leader>hr :GitGutter<cr>

" Toggle git gutter line highligts
" I don't always like seeing highlights, but it's useful sometimes
nnoremap <silent> <leader>hh :GitGutterLineHighlightsToggle<cr>

" Jumping between hunks
nnoremap <silent> [c :GitGutterPrevHunk<cr>
nnoremap <silent> ]c :GitGutterNextHunk<cr>

" Filetype specific mappings
for f in glob('~/.config/nvim/mappings/*.vim', 0 ,1)
    exe 'source' f
endfor

" Navigation
nnoremap <leader>ff :Files<cr>

" Find action
nnoremap <leader>fa :Commands<cr>

" Find recent
nnoremap <leader>fr :History<cr>

" Find everywhere
nnoremap <leader>fe :Rg<space>

" Find buffers
nnoremap <leader>fb :Buffers<cr>
