inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Close the current tab if its not the only tab
nnoremap <silent> <c-w>q :tabclose<cr>

" Snippets
nnoremap <Leader>ue :UltiSnipsEdit<cr>
nnoremap <Leader>ua :UltiSnipsEdit all<cr>


" Jumping between hunks

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
