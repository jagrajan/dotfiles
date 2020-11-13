local b = require 'vimp'.bind

-- Very commonly used, deserve their own binding
b('n', 'gq', '<cmd>q<cr>')
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
--    1: Use f or F to being a search.
--    2: Use <c-n> and <c-p> to jump to highlights.
--    3: Press <c-j> to confirm and add to jumplist.
b('nx', 'f', '/')
b('nx', 'F', '?')

b('c', {'expr'}, '<c-n>', [[getcmdtype() =~ '[\/?]' ? "<c-g>" : "<c-n>"]])
b('c', {'expr'}, '<c-p>', [[getcmdtype() =~ '[\/?]' ? "<c-t>" : "<c-p>"]])
b('c', {'expr', 'silent'}, '<c-j>', [[getcmdtype() =~ '[\/?]' ? "<cr><cmd>noh<cr>" : "<cr>"]])

-- More natural j and k movements for wrapped lines
b('nvx', 'j', 'gj')
b('nvx', 'k', 'gk')

-- Use c+vim keys to jump between windows
for _, v in ipairs({'h', 'j', 'k', 'l'}) do
  b('n', '<c-' .. v .. '>', '<c-w>' .. v)
end

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
b('i', {'expr'}, '<c-p>', 'pumvisible() ? "<c-p>" : "<Plug>(completion_trigger)"')
b('i', {'expr'}, '<cr>',  'pumvisible() ? "<Plug>(completion_confirm_completion)" : "<cr>"')

leader_mappings = {
  ['n <c-w>q'] = 'tabclose',
  ['n ff'] = 'Files', -- find files
  ['n fa'] = 'Commands', -- find action
  ['n fr'] = 'History', -- find recent
  ['n fe'] = 'Rg', -- find everywhere
  ['n fb'] = 'Buffers', -- find buffers
  ['n gO'] = 'GBrowse!',
  ['x go'] = 'GBrowse!',
  ['n gg'] = 'Git<cr><c-w><s-t>',
  ['n gc'] = 'Git commit',
  ['n ga'] = 'Git blame',
  ['n gh'] = 'GV!',
  ['n gv'] = 'Gvdiffsplit',
  ['n hr'] = 'GitGutter',
  ['n hh'] = 'GitGutterLineHighlightsToggle',
  ['n hu'] = 'GitGutterUndoHunk',
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
b('n', {'silent'}, '[c', '<cmd>GitGutterPrevHunk<cr>')
b('n', {'silent'}, ']c', '<cmd>GitGutterNextHunk<cr>')
b('i', '<c-a>', '<esc>I')
b('i', '<c-e>', '<esc>A')
