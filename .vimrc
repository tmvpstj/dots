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
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'tpope/vim-surround'
Plug 'sirver/ultisnips'
Plug 'junegunn/vim-easy-align'
call plug#end()

set termguicolors
set background=light
colorscheme habiMath

set number relativenumber 
syntax on
filetype on
filetype plugin on
filetype indent on

set noshowmode
set autoread
set ruler
set autochdir

set autoindent
set smartindent
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
set foldmethod=indent
set nofoldenable
set timeoutlen=400
set tabstop=4
set shiftwidth=0
" set expandtab

" autocmds 
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter	* if &nu && mode() != "i" | set rnu | endif
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave		* if &nu | set nornu | endif
augroup END

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Functions
function! ScrollOffToggle()
    if(&scrolloff == 999)
    	set scrolloff=0
    else
	set scrolloff=999
    endif
endfunc

function! NumberToggle()
    if(&relativenumber == 1)
    	set rnu!
    else
	set rnu
    endif
endfunc

" Keybinds
nnoremap +s 	:call ScrollOffToggle()<cr>
nnoremap +n 	:call NumberToggle()<cr>

noremap K	{
noremap J	}
noremap H	^
noremap L	$

nnoremap sJ	J

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Tab>		>>
nnoremap <S-Tab>	<<
vnoremap <Tab>		>><Esc>gv
vnoremap <S-Tab>	<<<Esc>gv

nnoremap <space> za
nnoremap so o<Esc>
nnoremap sO O<Esc>j

nnoremap <C-s>	:Limelight!!<CR>
nnoremap <C-g>	:Goyo<CR>

map <C-n>	:NERDTreeToggle<CR>

" Goyo
let g:goyo_width = "80%"
let g:goyo_height = "90%"
let g:goyo_linenr = 1

" ALE stuff
let g:ale_sign_column_always = 0
let g:ale_linters_explicit = 1
" Linters for ALE to run

" Vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'sumatraPDF'
let g:vimtex_view_general_options = '-reuse-instance @pdf'
" let g:vimtex_view_compiler_latexmk

" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = ['/home/lain/.vim/mysnippets']

" Easy-Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Statusline stuff
source $HOME/.vim/statusline.vim
hi bl ctermfg=8
hi gr ctermfg=7
set laststatus=2
set rulerformat=%30(%=%#bl#%l,%c\ \%#bl#%p%%\ \ %#gr#%t%)
