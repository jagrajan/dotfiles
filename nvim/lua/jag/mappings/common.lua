local b = require 'vimp'.bind
local nvim_create_augroups = require 'jag/util/nvim_utils'.nvim_create_augroups

b('i', {'expr'}, '<c-o>',  "compe#confirm('<c-o>')")

local leader_mappings = {
  ['n <c-w>q'] = 'tabclose',
  ['n fr'] = 'lua require("telescope.builtin").oldfiles()', -- find recent
  ['n fh'] = 'lua require("telescope.builtin").builtin()', -- find "help"
  ['n gb'] = 'lua require("telescope.builtin").git_branches()',
  ['n hr'] = 'GitGutter',
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

b('n', '<leader>fe', ':Rg ')

b('n', ']d', ':Lspsaga diagnostic_jump_next<cr>')
b('n', '[d', ':Lspsaga diagnostic_jump_prev<cr>')

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
