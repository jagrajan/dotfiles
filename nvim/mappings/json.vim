augroup json_mappings
    autocmd!
    autocmd BufNewFile,BufRead *.json nnoremap <buffer> <localleader>f :%!jq .<cr>
augroup END
