augroup terraform_mappings
    autocmd!
    autocmd BufNewFile,BufRead *.tf nnoremap <buffer> <localleader>f :!terraform fmt<cr>
augroup END
