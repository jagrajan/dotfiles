local nvim_lsp = require('lspconfig')

local on_attach = require'completion'.on_attach
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- local servers = {'cssls', 'bashls', 'diagnosticls', 'dockerls', 'flow', 'ghcide', 'gopls', 'hie', 'html', 'intelephense', 'tsserver', 'jsonls', 'kotlin_language_server', 'pyls', 'rls', 'rust_analyzer', 'sourcekit', 'vimls', 'vuels'}
local servers = {'tsserver'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

nvim_lsp.efm.setup {
  filetypes = {"javascript", "typescript", "typescriptreact"},
  root_dir = function(fname)
    return nvim_lsp.util.root_pattern("tsconfig.json")(fname) or
    nvim_lsp.util.root_pattern(".eslintrc.js", ".git")(fname);
  end,
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = {"package.json", ".git/"},
    languages = {
      javascript = {eslint},
      typescript = {eslint},
      typescriptreact = {eslint}
    }
  }
}
