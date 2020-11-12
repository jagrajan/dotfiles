local api = vim.api

local search = {}

search.is_search_open = function ()
  return string.match(api.nvim_command('getcmdtype()'), '[/?]')
end

return search
