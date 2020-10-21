augroup javascript_mappings
    autocmd!
    autocmd BufNewFile,BufRead *.js,*.ts,*.tsx nnoremap <buffer> <localleader>; mqA;<esc>`q
    autocmd BufNewFile,BufRead *.test.ts,*.test.tsx nnoremap <buffer> <localleader>ue :UltiSnipsEdit typescripttest<cr>
augroup END
