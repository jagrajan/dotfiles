syntax on

source $HOME/.config/nvim/plugins.vim

let g:dev = "postgresql://fhirbase@localhost:5433/fhirbase"

" Vim struggles with syntax highlighting with long files. This has been fixing
" the issue so far.
syntax sync fromstart

" Duplicate current buffer in new tab
nnoremap <c-w>d :tab split<cr>

nnoremap <c-w>m :Tabmerge

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ | "don't lint

nnoremap <leader>qd :DB g:dev<space>
xnoremap <leader>qd :DB g:dev<cr>

lua require 'jag/init'
:source $HOME/.config/nvim/mappings.vim

:source $HOME/.config/nvim/statusline.vim

for f in glob('~/.config/nvim/autocmd/*.vim', 0 ,1)
    exe 'source' f
endfor
