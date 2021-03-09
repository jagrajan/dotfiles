let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua << EOF
  local nvim_lsp = require('nvim_lsp')

  local on_attach = require'completion'.on_attach
  -- local servers = {'cssls', 'bashls', 'diagnosticls', 'dockerls', 'flow', 'ghcide', 'gopls', 'hie', 'html', 'intelephense', 'tsserver', 'jsonls', 'kotlin_language_server', 'pyls', 'rls', 'rust_analyzer', 'sourcekit', 'vimls', 'vuels'}
  local servers = {'tsserver'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end
EOF

highlight LspDiagnosticsError ctermfg=Red
highlight LspDiagnosticsError	cterm=bold,underline ctermfg=160
highlight LspDiagnosticsHint cterm=bold,underline ctermfg=34
