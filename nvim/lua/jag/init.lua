require 'jag/commands/git'
require 'jag/mappings/common'

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Editing neovim config
  -- Open vimrc in new tab
  vim.api.nvim_set_keymap('n', '<leader>ve', ':tabedit $MYVIMRC<cr>lcd %:p:h<cr>', { silent = true, noremap = true })
  -- Reload vimrc
  vim.api.nvim_set_keymap('n', '<leader>vr', ':so $MYVIMRC<cr>', { noremap = true })
  -- Install plugins
  vim.api.nvim_set_keymap('n', '<leader>vp', ':PlugInstall<cr>', { noremap = true })

-- Colorscheme
  vim.g.gruvbox_material_background = 'soft'
  vim.cmd('colorscheme gruvbox-material')

-- Global related config
  -- required for nvim-compe
  vim.bo.expandtab = true
  vim.bo.shiftwidth = 2
  vim.bo.softtabstop = 2
  vim.bo.swapfile = false
  vim.bo.tabstop = 2
  vim.o.completeopt = "menuone,noselect"
  vim.o.hidden = true
  vim.o.splitbelow = true
  vim.o.splitright = true
  vim.o.termguicolors = true
  vim.o.updatetime = 100
  vim.o.updatetime = 100
  vim.wo.foldmethod = "indent"

-- Global related keymaps
  vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
  vim.api.nvim_set_keymap('x', ';', ':', { noremap = true })
  vim.api.nvim_set_keymap('n', 'gq', ':q<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', 'gQ', ':qa<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', 'gw', ':w<cr>', { noremap = true })
  -- clear highlighting
  vim.api.nvim_set_keymap('n', 'gn', ':noh<cr>', { silent = true, noremap = true })
  -- Make Y behave similarly to C and D
  vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })
  -- Dont't replace the register when pasting in visual mode
  vim.api.nvim_set_keymap('x', 'p', 'pgvy', { noremap = true })
  -- Quickly change conceal level
  for i = 0,3 do
    vim.api.nvim_set_keymap('n', '<leader>l' .. i, ':setl conceallevel=' .. i .. '<cr>', { silent = true, noremap = true })
  end
  -- More natural j and k movements for wrapped lines
  for _, mode in ipairs({ 'n', 'v', 'x' }) do
    vim.api.nvim_set_keymap(mode, 'j', 'gj', { silent = true, noremap = true })
    vim.api.nvim_set_keymap(mode, 'k', 'gk', { silent = true, noremap = true })
  end
  -- Stay in visual mode when indenting/unindenting
  vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
  vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
  vim.api.nvim_set_keymap('i', '<c-a>', '<c-o>^', { noremap = true })
  vim.api.nvim_set_keymap('i', '<c-e>', '<c-o>$', { noremap = true })
  -- Open notes
  vim.api.nvim_set_keymap('n', '<leader>on', ':tabe<cr>:lcd ~/workspaces/notes<cr>:Files<cr>', { silent = false, noremap = false })
  -- Copy/paste system clipboard
  vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>Y', '"+yg_', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>P', '"+P', { noremap = true })
  vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true })
  vim.api.nvim_set_keymap('v', '<leader>P', '"+P', { noremap = true })

-- Text objects
  -- al = entire line
  -- il = entre line but trim the whitespace at the front
  vim.api.nvim_set_keymap('x', 'il', 'g_o^', { noremap = true })
  vim.api.nvim_set_keymap('x', 'al', '$o0', { noremap = true })
  vim.api.nvim_set_keymap('o', 'il', ':normal vil<cr>', { noremap = true })
  vim.api.nvim_set_keymap('o', 'al', ':normal val<cr>', { noremap = true })

-- Window/tab management
  vim.api.nvim_set_keymap('n', '[t', ':tabprev<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', ']t', ':tabnext<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '[T', ':tabfirst<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', ']T', ':tablast<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<left>', ':vertical resize +3<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<right>', ':vertical resize -3<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<up>', ':resize +3<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<down>', ':resize -3<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<c-w>q', ':tabclose<cr>', { silent = true, noremap = true })
  -- Use c+vim keys to jump between windows
  for _, v in ipairs({'h', 'j', 'k', 'l'}) do
    vim.api.nvim_set_keymap('n', '<c-' .. v .. '>', '<c-w>' .. v, { noremap = true })
  end

-- Navigating files
-- Used for quickly jumping around in a file:
--    1: Use / for case-insensitive search or ? for case-sensitive search
--    2: Use <c-n> and <c-p> to jump to highlights.
--    3: Press <cr> to confirm and add to jumplist.
  vim.api.nvim_set_keymap('n', '/', '/\\c', { noremap = true })
  vim.api.nvim_set_keymap('x', '/', '/\\c', { noremap = true })
  vim.api.nvim_set_keymap('n', '?', '/', { noremap = true })
  vim.api.nvim_set_keymap('x', '?', '/', { noremap = true })
  vim.api.nvim_set_keymap('c', '<c-n>', [[getcmdtype() =~ '[\/?]' ? "<c-g>" : "<c-n>"]], { expr = true, noremap = true })
  vim.api.nvim_set_keymap('c', '<c-p>', [[getcmdtype() =~ '[\/?]' ? "<c-t>" : "<c-p>"]], { expr = true, noremap = true })
  vim.api.nvim_set_keymap('c', '<cr>', [[getcmdtype() =~ '[\/?]' ? "<cr><cmd>noh<cr>" : "<cr>"]], { expr = true, silent = true, noremap = true })

-- Scratch tabs
  local scratch_mappings = {
    j = 'json',
    s = 'sql'
  }

  for k, ft in pairs(scratch_mappings) do
    vim.api.nvim_set_keymap('n', '<leader>s' .. k, ':tabedit<cr>:set ft=' .. ft .. '<cr>', { noremap = true })
  end

-- FZF
  vim.api.nvim_set_keymap('n', '<leader>ff', ':Files<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fa', ':Commands<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fb', ':Buffers<cr>', { silent = true, noremap = true })

-- Fugitive/GV
  vim.api.nvim_set_keymap('n', '<leader>go', 'V:GBrowse!<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>gO', ':GBrowse!<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('x', '<leader>go', ':GBrowse!<cr>', { silent = true, noremap = true })
  -- open :Git in a new tab
  vim.api.nvim_set_keymap('n', '<leader>gg', ':Git<cr><c-w><s-t>', { silent = true, noremap = true })
  -- open :Git in a new tab, close all other tabs
  vim.api.nvim_set_keymap('n', '<leader>gg', ':Git<cr><c-w><s-t>:tabonly<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>ga', ':Git blame<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>gh', ':GV!<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>gv', ':Gvdiffspit<cr>', { silent = true, noremap = true })

-- GitGutter
  vim.api.nvim_set_keymap('n', '<leader>ht', ':GitGutterLineHighlightsToggle<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>hu', ':GitGutterUndoHunk<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '[c', ':GitGutterPrevHunk<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', ']c', ':GitGutterNextHunk<cr>', { silent = true, noremap = true })

-- Floaterm
  vim.g.floaterm_width = 0.8
  vim.g.floaterm_height = 0.8
  vim.g.floaterm_opener = 'vsplit'
  vim.g.floaterm_autoclose=1
  vim.g.floaterm_keymap_toggle = '<F1>'
  vim.g.floaterm_keymap_next = '<F2>'
  vim.g.floaterm_keymap_prev = '<F3>'
  vim.g.floaterm_keymap_new = '<F4>'
  vim.api.nvim_set_keymap('n', '<leader>ts', ':FloatermNew rg<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>tg', ':FloatermNew lazygit<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>tr', ':FloatermNew ranger<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>tb', ':FloatermNew broot<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>tt', ':FloatermNew<cr>', { silent = true, noremap = true })

-- UltiSnips
  vim.g.UltiSnipsExpandTrigger = '<tab>'
  vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
  vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
  vim.g.UltiSnipsEditSplit = 'vertical'
  vim.g.UltiSnipsSnippetDirectories = {'~/.config/nvim/UltiSnips'}
  vim.api.nvim_set_keymap('n', '<leader>ue', ':UltiSnipsEdit<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>ua', ':UltiSnipsEdit all<cr>', { silent = true, noremap = true })

-- postgresql.vim
  vim.g.sql_type_default = 'pgsql'

-- indentLine
  vim.g.indentLine_setConceal = 1
  vim.g.indentLine_color_term = 239

-- vim-slime
  vim.g.slime_target = 'neovim'

-- nvim-compe
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
      path = true;
      buffer = true;
      calc = true;
      nvim_lsp = true;
      nvim_lua = true;
      vsnip = true;
    };
  }
  -- needed to accept auto import
  vim.api.nvim_set_keymap('i', '<c-o>',  "compe#confirm('<c-o>')", { expr = true, noremap = true })

-- telescope.nvim
  local telescope = require('telescope')
  local telescope_actions = require('telescope.actions')
  local telescope_sorters = require('telescope.sorters')
  local telescope_previewers = require('telescope.previewers')

  telescope.setup {
    defaults = {
      file_sorter = telescope_sorters.get_fzy_sorter,
      prompt_prefix = '>',

      file_previewer = telescope_previewers.vim_buffer_cat.new,
      grep_previewer = telescope_previewers.vim_buffer_vimgrep.new,
      qflist_previewer = telescope_previewers.vim_buffer_qflist.new,

      mappings = {
        i = {
          ["<c-x>"] = false,
          ["<c-q>"] = telescope_actions.send_to_qflist
        },
      }
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
  }

  telescope.load_extension('fzy_native')
  telescope.load_extension('octo')

-- galaxyline
  local galaxyline = require('galaxyline')
  local galaxyline_colors = require('galaxyline.theme').default
  local galaxyline_condition = require('galaxyline.condition')
  local galaxyline_section = galaxyline.section
  galaxyline_section.left[1] = {
    ViMode = {
      provider = function()
        -- auto change color according the vim mode
        local mode_color = {
          n = galaxyline_colors.red,
          i = galaxyline_colors.green,
          v=galaxyline_colors.blue,
          [''] = galaxyline_colors.blue,
          V=galaxyline_colors.blue,
          c = galaxyline_colors.magenta,
          no = galaxyline_colors.red,
          s = galaxyline_colors.orange,
          S=galaxyline_colors.orange,
          [''] = galaxyline_colors.orange,
          ic = galaxyline_colors.yellow,
          R = galaxyline_colors.violet,
          Rv = galaxyline_colors.violet,
          cv = galaxyline_colors.red,
          ce=galaxyline_colors.red,
          r = galaxyline_colors.cyan,
          rm = galaxyline_colors.cyan,
          ['r?'] = galaxyline_colors.cyan,
          ['!']  = galaxyline_colors.red,
          t = galaxyline_colors.red}
        vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()] ..' guibg='..galaxyline_colors.bg)
        return ' '
      end,
    },
  }

  galaxyline_section.left[2] ={
    FileIcon = {
      provider = 'FileIcon',
      condition = galaxyline_condition.buffer_not_empty,
      highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, galaxyline_colors.bg },
    },
  }

  galaxyline_section.left[3] = {
    FileName = {
      provider = 'FileName',
      condition = galaxyline_condition.buffer_not_empty,
      highlight = { galaxyline_colors.fg, galaxyline_colors.bg, 'bold' }
    }
  }

  galaxyline_section.left[6] = {
    LineInfo = {
      provider = 'LineColumn',
      separator = ' ',
      separator_highlight = { 'NONE', galaxyline_colors.bg },
      highlight = { galaxyline_colors.fg, galaxyline_colors.bg },
    },
  }

  galaxyline_section.mid[1] = {
    ShowLspClient = {
      provider = 'GetLspClient',
      condition = function ()
        local tbl = {['dashboard'] = true,['']=true}
        if tbl[vim.bo.filetype] then
          return false
        end
        return true
      end,
      icon = '  LSP:',
      highlight = { galaxyline_colors.yellow, galaxyline_colors.bg, 'bold' }
    }
  }

  galaxyline_section.mid[2] = {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = '  ',
      separator = ' ',
      separator_highlight = { 'NONE', galaxyline_colors.bg },
      highlight = { galaxyline_colors.red, galaxyline_colors.bg }
    }
  }
  galaxyline_section.mid[3] = {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = '  ',
      highlight = { galaxyline_colors.yellow, galaxyline_colors.bg },
    }
  }

  galaxyline_section.mid[4] = {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      icon = '  ',
      highlight = { galaxyline_colors.cyan, galaxyline_colors.bg },
    }
  }

  galaxyline_section.mid[5] = {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      icon = '  ',
      highlight = { galaxyline_colors.blue, galaxyline_colors.bg },
    }
  }


  galaxyline_section.right[3] = {
    GitIcon = {
      provider = function() return '  ' end,
      condition = galaxyline_condition.check_git_workspace,
      separator = ' ',
      separator_highlight = {'NONE',galaxyline_colors.bg},
      highlight = { galaxyline_colors.violet, galaxyline_colors.bg, 'bold' },
    }
  }

  galaxyline_section.right[4] = {
    GitBranch = {
      provider = 'GitBranch',
      condition = galaxyline_condition.check_git_workspace,
      highlight = {galaxyline_colors.violet,galaxyline_colors.bg,'bold'},
    }
  }

  galaxyline_section.right[5] = {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = galaxyline_condition.hide_in_width,
      icon = '  ',
      separator = ' ',
      separator_highlight = {'NONE',galaxyline_colors.bg},
      highlight = { galaxyline_colors.green, galaxyline_colors.bg },
    }
  }

  galaxyline_section.right[6] = {
    DiffModified = {
      provider = 'DiffModified',
      condition = galaxyline_condition.hide_in_width,
      icon = ' 柳',
      highlight = { galaxyline_colors.orange, galaxyline_colors.bg },
    }
  }

  galaxyline_section.right[7] = {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = galaxyline_condition.hide_in_width,
      icon = '  ',
      highlight = { galaxyline_colors.red, galaxyline_colors.bg },
    }
  }

-- neovim lsp
  local nvim_lsp = require('lspconfig')

  local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { silent = true, noremap = true }
    buf_set_keymap('n', '<leader>ld', ':lua vim.lsp.buf.definition()<cr>', opts)
    buf_set_keymap('n', '<leader>lpd', ':Lspsaga preview_definition<cr>', opts)
    buf_set_keymap('n', '<leader>lf', ':lua vim.lsp.buf.formatting()<cr>', opts)
    buf_set_keymap('n', '<leader>li', ':lua vim.lsp.buf.implementation()<cr>', opts)
    buf_set_keymap('n', '<leader>lsh', ':Lspsaga signature_help<cr>', opts)
    buf_set_keymap('n', '<leader>lrn', ':Lspsaga rename<cr>', opts)
    buf_set_keymap('n', '<leader>lh', ':Lspsaga hover_doc<cr>', opts)
    buf_set_keymap('n', '<leader>lca', ':Lspsaga code_action<cr>', opts)
    buf_set_keymap('n', '<leader>lsd', ':Lspsaga show_line_diagnostics<cr>', opts)
    buf_set_keymap('n', '<leader>lrr', ':lua vim.lsp.buf.references()<cr>', opts)
    buf_set_keymap('n', ']d', ':Lspsaga diagnostic_jump_next<cr>', opts)
    buf_set_keymap('n', '[d', ':Lspsaga diagnostic_jump_prev<cr>', opts)
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local servers = {'tsserver'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

  -- lua-language-server setup
  -- copied from: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sumneko_lua
  local system_name
  if vim.fn.has("mac") == 1 then
    system_name = "macOS"
  elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
  elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
  else
    print("Unsupported system for sumneko")
  end

  -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
  local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
  local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

  require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = vim.split(package.path, ';'),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }

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
    on_attach = on_attach,
    settings = {
      rootMarkers = {"package.json", ".git/"},
      languages = {
        javascript = {eslint},
        typescript = {eslint},
        typescriptreact = {eslint}
      }
    }
  }

-- neovim treesitter
  require'nvim-treesitter.configs'.setup {
    autotag = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
  }
