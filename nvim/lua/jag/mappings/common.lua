local b = require 'vimp'.bind
local br = require 'vimp'.rbind
local nvim_create_augroups = require 'jag/util/nvim_utils'.nvim_create_augroups

-- Very commonly used, deserve their own binding
b('n', 'gq', '<cmd>q<cr>')
b('n', 'gQ', '<cmd>qa<cr>')
b('n', 'gw', '<cmd>w<cr>')
b('n', {'silent'} , 'gn', '<cmd>noh<cr>')

-- Make Y behave similarly to C and D
b('n', 'Y', 'y$')

-- Dont't replace the register when pasting in visual mode
b('x', 'p', 'pgvy')

-- Mappings related to editing vim config
b('n', '<leader>ve', '<cmd>tabedit $MYVIMRC<cr>:lcd %:p:h<cr>')
b('n', '<leader>vr', '<cmd>so $MYVIMRC<cr>')
b('n', '<leader>vp', '<cmd>:PlugInstall<cr>')

-- Used for quickly jumping around in a file:
--    1: Use / for case-insensitive search or ? for case-sensitive search
--    2: Use <c-n> and <c-p> to jump to highlights.
--    3: Press <cr> to confirm and add to jumplist.
b('nx', '/', '/\\c')
b('nx', '?', '/')

b('c', {'expr'}, '<c-n>', [[getcmdtype() =~ '[\/?]' ? "<c-g>" : "<c-n>"]])
b('c', {'expr'}, '<c-p>', [[getcmdtype() =~ '[\/?]' ? "<c-t>" : "<c-p>"]])
b('c', {'expr', 'silent'}, '<cr>', [[getcmdtype() =~ '[\/?]' ? "<cr><cmd>noh<cr>" : "<cr>"]])

-- More natural j and k movements for wrapped lines
b('nvx', 'j', 'gj')
b('nvx', 'k', 'gk')

-- Use c+vim keys to jump between windows
for _, v in ipairs({'h', 'j', 'k', 'l'}) do
  b('n', '<c-' .. v .. '>', '<c-w>' .. v)
end

-- Quickly change tabs
b('n', {'silent'}, '[t', '<cmd>tabprev<cr>')
b('n', {'silent'}, ']t', '<cmd>tabnext<cr>')
b('n', {'silent'}, '[T', '<cmd>tabfirst<cr>')
b('n', {'silent'}, ']T', '<cmd>tablast<cr>')

b('n', {'silent'}, '<left>',  '<cmd>vertical resize +3<cr>')
b('n', {'silent'}, '<right>', '<cmd>vertical resize -3<cr>')
b('n', {'silent'}, '<up>',    '<cmd>resize +3<cr>')
b('n', {'silent'}, '<down>',  '<cmd>resize -3<cr>')

-- Quickly change conceal level
for i = 0,3 do
  b('n', {'silent'}, '<leader>l' .. i, ':setl conceallevel=' .. i .. '<cr>')
end

-- Stay in visual mode when indenting/unindenting
for _, v in ipairs({'<', '>'}) do
  b('v', v, v .. 'gv')
end

-- Line text objects
b('x', 'il', 'g_o^')
b('x', 'al', '$o0')
b('o', 'il', '<cmd>normal vil<cr>')
b('o', 'al', '<cmd>normal val<cr>')

-- completion.nvim
br('i', {'expr'}, '<c-p>', 'pumvisible() ? "<c-p>" : "<Plug>(completion_trigger)"')
b('i', {'expr'}, '<cr>',  'pumvisible() ? "<Plug>(completion_confirm_completion)" : "<cr>"')


local leader_mappings = {
  ['n <c-w>q'] = 'tabclose',
  ['n ff'] = 'Files', -- find files
  ['n fa'] = 'Commands', -- find action
  ['n fr'] = 'lua require("telescope.builtin").oldfiles()', -- find recent
  ['n fb'] = 'Buffers', -- find buffers
  ['n fh'] = 'lua require("telescope.builtin").builtin()', -- find "help"
  ['n gO'] = 'GBrowse!',
  ['x go'] = 'GBrowse!',
  ['n gg'] = 'Git<cr><c-w><s-t>',
  ['n GG'] = 'Git<cr><c-w><s-t>:tabonly<cr>',
  ['n gc'] = 'Git commit',
  ['n ga'] = 'Git blame',
  ['n gb'] = 'lua require("telescope.builtin").git_branches()',
  ['n gh'] = 'GV!',
  ['n gv'] = 'Gvdiffsplit',
  ['n hr'] = 'GitGutter',
  ['n hh'] = 'GitGutterLineHighlightsToggle',
  ['n hu'] = 'GitGutterUndoHunk',
  ['n ld'] = 'lua vim.lsp.buf.definition()',
  ['n lpd'] = 'Lspsaga preview_definition',
  ['n lf'] = 'lua vim.lsp.buf.formatting()',
  ['n li'] = 'lua vim.lsp.buf.implementation()',
  ['n lsh'] = 'Lspsaga signature_help',
  ['n lrn'] = 'Lspsaga rename',
  ['n lh'] = 'Lspsaga hover_doc',
  ['n lca'] = 'Lspsaga code_action',
  ['n lsd'] = 'Lspsaga show_line_diagnostics',
  ['n lrr'] = 'lua vim.lsp.buf.references()',
  ['n ue'] = 'UltiSnipsEdit',
  ['n ua'] = 'UltiSnipsEdit all'
}

for key, cmd in pairs(leader_mappings) do
  local fields = vim.split(key, ' ')
  local mode = fields[1]
  local keys = fields[2]
  b(mode, {'silent'}, '<leader>' .. keys, ':' .. cmd .. '<cr>')
end

b('n', {'silent'}, '<leader>go', 'V:GBrowse!<cr><esc>')
b('n', '<leader>fe', ':Rg ')
b('n', {'silent'}, '[c', '<cmd>GitGutterPrevHunk<cr>')
b('n', {'silent'}, ']c', '<cmd>GitGutterNextHunk<cr>')
b('i', '<c-a>', '<c-o>^')
b('i', '<c-e>', '<c-o>$')

b('n', ']d', ':Lspsaga diagnostic_jump_next<cr>')
b('n', '[d', ':Lspsaga diagnostic_jump_prev<cr>')
b('n', {'silent'} ,'<m-c-S>', ':FloatermNew --width=0.8 --height=0.8 rg<cr>')
b('n', {'silent'} ,'<m-c-G>', ':FloatermNew --width=0.8 --height=0.8 lazygit<cr>')
b('n', {'silent'} ,'<m-c-F>', ':FloatermNew --width=0.8 --height=0.8 fzf<cr>')
b('n', {'silent'} ,'<m-c-R>', ':FloatermNew --width=0.8 --height=0.8 ranger<cr>')
b('n', {'silent'} ,'<m-c-T>', ':FloatermNew<cr>')

FILETYPE_HOOKS = {
  dirvish = function ()
    -- Create a new file
    b('n', {'buffer', 'override'}, 'e', ':edit %')
    -- Create a new folder
    b('n', {'buffer', 'override'}, 'm', ':!mkdir %')
  end;
  json = function ()
    -- Format file with jq
    b('n', {'buffer'}, '<localleader>f', '<cmd>%!jq .<cr>')
  end;
  terraform = function ()
    b('n', {'buffer', 'override'}, '<localleader>f', '<cmd>!terraform fmt<cr>')
  end;
}

-- From norcalli/nvim_utils
local function escape_keymap(key)
	-- Prepend with a letter so it can be used as a dictionary key
	return 'k'..key:gsub('.', string.byte)
end

local autocmds = {}

for filetype, _ in pairs(FILETYPE_HOOKS) do
  autocmds['LuaFileTypeHook_' .. escape_keymap(filetype)] = {
		{'FileType', filetype, ('lua FILETYPE_HOOKS[%q]()'):format(filetype)}
	}
end

nvim_create_augroups(autocmds)

local scratch_mappings = {
  j = 'json',
  s = 'sql'
}

for k, ft in pairs(scratch_mappings) do
  b('n', '<leader>s' .. k, ':tabedit<cr>:set ft=' .. ft .. '<cr>')
end
