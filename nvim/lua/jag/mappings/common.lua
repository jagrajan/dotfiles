local b = require 'vimp'.bind
local nvim_create_augroups = require 'jag/util/nvim_utils'.nvim_create_augroups

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
