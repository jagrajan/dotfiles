" Commonly used enough that they deserve a mapping
nnoremap gq :q<cr>
nnoremap gw :w<cr>
nnoremap gn :noh<cr>

" Navigating can be annoying with lines that wrap
nnoremap j gj
nnoremap k gk

" Snippets
nnoremap <Leader>ue :UltiSnipsEdit<cr>
nnoremap <Leader>ua :UltiSnipsEdit all<cr>

" Filetype specific mappings
for f in glob('~/.config/nvim/mappings/*.vim', 0 ,1)
    exe 'source' f
endfor

