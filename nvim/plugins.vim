call plug#begin('~/.config/nvim/plugged')

" Plugins with no config
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dadbod'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jremmen/vim-ripgrep'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/Tabmerge'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'tpope/vim-commentary'
Plug 'joshdick/onedark.vim'

" Plugins with config
" for f in split(glob('~/.config/nvim/plugins.d/*.vim'), "\n")
for f in glob('~/.config/nvim/plugins.d/*.vim', 0 ,1)
    exe 'source' f
endfor

call plug#end()

" Evaluate post load plugin code (calling plugin functions etc)
for f in split(glob('~/.config/nvim/plugins.post.d/*.vim'), '\n')
    exe 'source' f
endfor