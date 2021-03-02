local nvim = {}
local nc = vim.nvim_command

nvim.create_augroup = function(name, cmds)
  nc('augroup' .. name)
  nc('autocmd!')
  for _, cmds in ipairs(cmds) do
    nc('autocmd ' .. table.concat(cmd, ' '))
  end
  nc('augroup END')
end

return nvim;
