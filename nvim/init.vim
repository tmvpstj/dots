call plug#begin('~/etc/nvim/plugged')
Plug 'dense-analysis/ale'
" Plug 'scrooloose/nerdtree'
" Plug 'fehawen/sl.vim'
Plug 'fehawen/cs.vim'
Plug 'co1ncidence/bliss'
Plug 'co1ncidence/itai.vim'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-commentary'
Plug 'NerdyPepper/vim-colors-plain'
Plug 'pbrisbin/vim-colors-off'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" set termguicolors
set background=dark
colorscheme plain

set nonumber
syntax on
filetype on
filetype plugin on
filetype indent on

set noshowmode
set autoread
set ruler
set autoindent
set path+=**
set mouse=a
set hidden
set noswapfile
set nobackup
set nowritebackup
scriptencoding utf-8
set fileencoding=utf-8

" ALE stuff
let g:ale_sign_column_always = 0
let g:ale_linters_explicit = 1
" Linters for ALE to run
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \}

" Statusline stuff
source $HOME/etc/nvim/statusline.vim
hi bl ctermfg=8
hi gr ctermfg=7
set laststatus=0
set rulerformat=%30(%=%#bl#%l,%c\ \%#bl#%p%%\ \ %#gr#%t%)

