call plug#begin('~/.config/nvim/plugged')

" Plugins with no config
Plug 'lifepillar/pgsql.vim'
Plug 'SirVer/ultisnips'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'honza/vim-snippets'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'meain/vim-automkdir'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/Tabmerge'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'svermeulen/vimpeccable'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-dirvish'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-test/vim-test'
Plug 'benmills/vimux'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'romgrk/nvim-treesitter-context'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'pwntester/octo.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'jpalardy/vim-slime'
Plug 'tjdevries/cyclist.vim'
Plug 'windwp/nvim-ts-autotag'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons' " lua

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
