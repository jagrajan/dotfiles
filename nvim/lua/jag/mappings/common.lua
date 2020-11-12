local b = require 'vimp'.bind

-- Very commonly used, deserve their own binding
b('n', 'gq', ':q<cr>')
b('n', 'gw', ':w<cr>')
b('n', {'silent'} , 'gn', ':noh<cr>')

-- Used for quickly jumping around in a file:
--    1: Use f or F to being a search.
--    2: Use <c-n> and <c-p> to jump to highlights.
--    3: Press <c-j> to confirm and add to jumplist.
b('n', 'f', '/')
b('n', 'F', '?')

b('c', {'expr'}, '<c-n>', [[getcmdtype() =~ '[\/?]' ? "<c-g>" : "<c-n>"]])
b('c', {'expr'}, '<c-p>', [[getcmdtype() =~ '[\/?]' ? "<c-t>" : "<c-n>"]])
b('c', {'expr', 'silent'}, '<c-j>', [[getcmdtype() =~ '[\/?]' ? "<cr>:noh<cr>" : "<cr>"]])

-- More natural j and k movements for wrapped lines
b('nvx', 'j', 'gj')
b('nvx', 'k', 'gk')

-- Use c+vim keys to jump between windows
b('n', '<c-h>', '<c-w>h')
b('n', '<c-j>', '<c-w>j')
b('n', '<c-k>', '<c-w>k')
b('n', '<c-l>', '<c-w>l')
