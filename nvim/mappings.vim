" Filetype specific mappings
for f in glob('~/.config/nvim/mappings/*.vim', 0 ,1)
    exe 'source' f
endfor
