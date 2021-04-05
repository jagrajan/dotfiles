require 'jag/config/lsp'
require 'jag/config/nvim-compe'
require 'jag/config/plugins'
require 'jag/config/telescope'
require 'jag/config/treesitter'
require 'jag/commands/git'
require 'jag/mappings/common'

-- Editing neovim config
  -- Open vimrc in new tab
  vim.api.nvim_set_keymap('n', '<leader>ve', ':tabedit $MYVIMRC<cr>lcd %:p:h<cr>', { silent = true, noremap = true })
  -- Reload vimrc
  vim.api.nvim_set_keymap('n', '<leader>vr', ':so $MYVIMRC<cr>', { noremap = true })
  -- Install plugins
  vim.api.nvim_set_keymap('n', '<leader>vp', ':PlugInstall<cr>', { noremap = true })

-- Global related config

-- Global related keymaps
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

-- Text objects
  -- al = entire line
  -- il = entre line but trim the whitespace at the front
  vim.api.nvim_set_keymap('x', 'il', 'g_o^', { noremap = true })
  vim.api.nvim_set_keymap('x', 'al', '$o0', { noremap = true })
  vim.api.nvim_set_keymap('o', 'il', ':normal vil<cr>', { noremap = true })
  vim.api.nvim_set_keymap('o', 'al', ':normal val<cr>', { noremap = true })

-- Window/tab management
  vim.api.nvim_set_keymap('n', '[t', ':tabprev<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', 't]', ':tabnext<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '[T', ':tabfirst<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', 'T]', ':tablast<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<left>', '<cmd>vertical resize +3<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<right>', '<cmd>vertical resize -3<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<up>', '<cmd>resize +3<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<down>', '<cmd>resize -3<cr>', { silent = true, noremap = true })
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
  vim.api.nvim_set_keymap('n', '<leader>ts', ':FloatermNew --width=0.8 --height=0.8 rg<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>tg', ':FloatermNew --width=0.8 --height=0.8 lazygit<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>tr', ':FloatermNew --width=0.8 --height=0.8 ranger<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>tb', ':FloatermNew --width=0.8 --height=0.8 broot<cr>', { silent = true, noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>tt', ':FloatermNew<cr>', { silent = true, noremap = true })
