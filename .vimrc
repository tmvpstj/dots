call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'fehawen/cs.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-commentary'
Plug 'NerdyPepper/vim-colors-plain'
Plug 'axvr/photon.vim'
Plug 'scrooloose/nerdtree'
Plug 'fehawen/sc.vim'
" Plug 'sirver/ultisnips'
call plug#end()

" set termguicolors
set background=dark
colorscheme photon

set number relativenumber
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
set cursorline
set hidden
set noswapfile
set nobackup
set nowritebackup
scriptencoding utf-8
set fileencoding=utf-8
set splitbelow
set splitright

" autocmds 
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter	* if &nu && mode() != "i" | set rnu | endif
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave		* if &nu | set nornu | endif
augroup END

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Keybinds
noremap K	{
noremap J	}
noremap H	^
noremap L	$

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Tab>		>>
nnoremap <S-Tab>	<<
vnoremap <Tab>		>><Esc>gv
vnoremap <S-Tab>	<<<Esc>gv

nnoremap <C-b>	:Limelight!!<CR>
nnoremap <C-g>	:Goyo<CR>

map <C-n>	:NERDTreeToggle<CR>

" ALE stuff
let g:ale_sign_column_always = 0
let g:ale_linters_explicit = 1
" Linters for ALE to run

" Statusline stuff
source $HOME/.vim/statusline.vim
hi bl ctermfg=8
hi gr ctermfg=7
set laststatus=0
set rulerformat=%30(%=%#bl#%l,%c\ \%#bl#%p%%\ \ %#gr#%t%)

