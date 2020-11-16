local mc = require 'vimp'.map_command
local api = vim.api

local function openFugitive()
	api.nvim_command('Git')
	api.nvim_command('wincmd T')
	api.nvim_command('tabonly')
end

mc('OnlyFugitive', openFugitive)
