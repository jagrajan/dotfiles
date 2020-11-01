call plug#begin('~/.config/nvim/plugged')

" Plugins with no config
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
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
Plug 'justinmk/vim-dirvish'
Plug 'glepnir/zephyr-nvim'
Plug 'vim-test/vim-test'
Plug 'benmills/vimux'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'n0v1c3/vira', { 'do': './install.sh' }


if exists($GH_USER)
    Plug 'AGhost-7/critiq.vim'
endif
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
