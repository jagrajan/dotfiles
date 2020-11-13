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
b('n', 'f', '/')
b('n', 'F', '?')

b('c', {'expr'}, '<c-n>', [[getcmdtype() =~ '[\/?]' ? "<c-g>" : "<c-n>"]])
b('c', {'expr'}, '<c-p>', [[getcmdtype() =~ '[\/?]' ? "<c-t>" : "<c-n>"]])
b('c', {'expr', 'silent'}, '<c-j>', [[getcmdtype() =~ '[\/?]' ? "<cr><cmd>noh<cr>" : "<cr>"]])

-- More natural j and k movements for wrapped lines
b('nvx', 'j', 'gj')
b('nvx', 'k', 'gk')

-- Use c+vim keys to jump between windows
for _, v in ipairs({'h', 'j', 'k', 'l'}) do
  b('n', '<c-' .. v .. '>', '<c-w>' .. v)
end

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
