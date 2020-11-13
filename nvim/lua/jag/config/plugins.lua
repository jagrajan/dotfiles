local g = vim.g

-- completion.nvim
  g.completion_enable_snippet = 'UltiSnips'
  g.completion_enable_fuzzy_match = true
  -- I like using the built in buffer completion
  g.completion_enable_auto_popup = false

-- diagnostic.nvim
  g.diagnostic_enable_virtual_text = true

-- postgresql.vim
  g.sql_type_default = 'pgsql'

-- UltiSnips
  g.UltiSnipsExpandTrigger = '<c-j>'
  g.UltiSnipsJumpForwardTrigger = '<c-j>'
  g.UltiSnipsJumpBackwardTrigger = '<c-k>'
  g.UltiSnipsEditSplit = 'vertical'
  g.UltiSnipsSnippetDirectories = {'~/.config/nvim/UltiSnips'}

-- indentLine
  g.indentLine_setConceal = 1
  g.indentLine_color_term = 239
