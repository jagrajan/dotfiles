" function! GitStatus()
"   let [a,m,r] = GitGutterGetHunkSummary()
"   return printf('+%d ~%d -%d', a, m, r)
" endfunction
" set statusline=%m%t
" set statusline+=\ %y
" set statusline+=\ %{FugitiveStatusline()}
" set statusline+=%=
" set statusline+=%{GitStatus()}
" set statusline+=\ \ %l[%c]
