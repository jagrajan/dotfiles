local buf, win, start_win
local api = vim.api

local function open()
  local path = api.nvim_get_current_line()

  if api.nvim_win_is_valid(start_win) then
    api.nvim_set_current_win(start_win)
    api.nvim_command('edit ' .. path)
  else
    api.nvim_command('leftabove vsplit ' .. path)
    start_win = api.nvim_get_current_win()
  end
end

local function close()
  if win and api.nvim_win_is_valid(win) then
    api.nvim_win_close(win, true)
  end
end

local function redraw()
  api.nvim_buf_set_option(buf, 'modifiable', true)

  local items_count = api.nvim_win_get_height(win) - 1
  local list = {}

  local oldfiles = vim.v.oldfiles

  for i = #oldfiles, #oldfiles - items_count, -1 do
    local path = vim.fn.fnamemodify(oldfiles[i], ':.')
    table.insert(list, #list + 1, path)
  end

  api.nvim_buf_set_lines(buf, 0, -1, false, list)
  api.nvim_buf_set_option(buf, 'modifiable', false)
end

local function open_and_close()
  open()
  close()
end

local function preview()
  open()
  api.nvim_set_current_win(win)
end

local function split(axis)
  local path = api.nvim_get_current_line()

  if api.nvim_win_is_valid(start_win) then
    api.nvim_set_current_win(start_win)
    api.nvim_command(axis .. 'split' .. path)
  else
    api.nvim_command('leftabove ' .. axis .. 'split' .. path)
  end
end

local function open_in_tab()
  local path = api.nvim_get_current_line()
  api.nvim_command('tabnew ' .. path)
  close()
end

local function set_mappings()
  local mappings = {
    q= 'close()',
    ['<cr>']= 'open_and_close()',
    v= 'split("v")',
    s= 'split("")',
    p= 'preview()',
    t= 'open_in_tab()',
  }

  for k,v in pairs(mappings) do
    api.nvim_buf_set_keymap(buf, 'n', k, ':lua require"nvim-oldfile".' .. v .. '<cr>', {
        nowait = true, noremap = true, silent = true
      })
  end
end

local function create_win()
  start_win = api.nvim_get_current_win()

  api.nvim_command('botright vnew')
  win = api.nvim_get_current_win()
  buf = api.nvim_get_current_buf()

  api.nvim_buf_set_name(buf, 'Oldfiles #' .. buf)

  api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  api.nvim_buf_set_option(buf, 'swapfile', false)
  api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  api.nvim_buf_set_option(buf, 'filetype', 'nvim-oldfile')
  api.nvim_win_set_option(win, 'wrap', false)
  api.nvim_win_set_option(win, 'cursorline', false)

  set_mappings()
end

local function oldfiles()
  if win and api.nvim_win_is_valid(win) then
    vim.api.nvim_set_current_win(win)
  else
    create_win()
  end
  redraw()
end

return {
  oldfiles = oldfiles,
  close = close,
  open_and_close = open_and_close,
  preview = preview,
  open_in_tab = open_in_tab,
  split = split
}
