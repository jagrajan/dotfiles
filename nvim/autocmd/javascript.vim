augroup javascript_snippets
    autocmd!
    autocmd BufNewFile,BufRead *.test.ts,*.test.tsx :UltiSnipsAddFiletypes typescript.typescripttest
augroup END

function GetTestRootMonorepo()
    let l:file = getcwd() . '/' . findfile('package.json', expand('%:p:h') . ';')
    let l:project_root = '/' . join(split(l:file, '/')[0:-2], '/')
    return l:project_root
endfunction

augroup jest_working_directory
    autocmd BufNewFile,BufRead,VimEnter,WinEnter,BufWinEnter *.test.ts,*.test.tsx let test#project_root = GetTestRootMonorepo()
augroup END
