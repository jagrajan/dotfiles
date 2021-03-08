local loop = vim.loop
local api = vim.api

local function convertFile()
  local shortname = vim.fn.expand('%:t:r')
  local fullname = api.nvim_buf_get_name(0)

  myHandler = loop.spawn('pandoc', {
      args = { fullname, '--to=html5', '-o', string.format('%s.html', shortname) }
  },
  function ()
    print('DOCUMENT CONVERSION COMPLETE')
    myHandler:close()
  end
  )
end

return {
  convertFile = convertFile
}
