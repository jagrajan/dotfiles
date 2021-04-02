local g = vim.g

-- completion.nvim
  g.completion_enable_snippet = 'UltiSnips'
  g.completion_enable_fuzzy_match = true
  -- I like using the built in buffer completion
  g.completion_enable_auto_popup = false

-- postgresql.vim
  g.sql_type_default = 'pgsql'

-- UltiSnips
  g.UltiSnipsExpandTrigger = '<tab>'
  g.UltiSnipsJumpForwardTrigger = '<tab>'
  g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
  g.UltiSnipsEditSplit = 'vertical'
  g.UltiSnipsSnippetDirectories = {'~/.config/nvim/UltiSnips'}

-- indentLine
  g.indentLine_setConceal = 1
  g.indentLine_color_term = 239

-- floaterm
  g.floaterm_width = 0.8
  g.floaterm_height = 0.8
  g.floaterm_opener = 'vsplit'

-- vim-slime
  g.slime_target = 'neovim'
