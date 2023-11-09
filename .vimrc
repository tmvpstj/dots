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
Plug 'lervag/vimtex'
Plug 'tpope/vim-surround'
Plug 'sirver/ultisnips'
Plug 'junegunn/vim-easy-align'
Plug 'sonph/onehalf', {'rtp': 'vim'}
call plug#end()

set termguicolors
set background=light
colorscheme onehalflight

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
set foldmethod=expr
set nofoldenable
set timeoutlen=700
set tabstop=2
set shiftwidth=0
set conceallevel=2
set expandtab

" autocmds 
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter	* if &nu && mode() != "i" | set rnu | endif
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave		* if &nu | set nornu | endif
augroup END

augroup MyColors
	autocmd!
	autocmd ColorScheme * highlight clear Conceal
augroup END

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

if empty(v:servername) && exists('*remote_startserver')
	  call remote_startserver('VIM')
endif

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
let maplocalleader = ","
let mapleader = "\<space>"

nnoremap <leader>s 	:call ScrollOffToggle()<cr>
nnoremap <leader>n 	:call NumberToggle()<cr>

noremap K	{
noremap J	}
noremap H	^
noremap L	$

nnoremap sJ	J

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <lt> <C-W><lt>
nnoremap > <C-W>>
nnoremap - <C-W>-
nnoremap + <C-W>+

nnoremap <Tab>		>>
nnoremap <S-Tab>	<<
vnoremap <Tab>		>><Esc>gv
vnoremap <S-Tab>	<<<Esc>gv

" nnoremap <space> za
nnoremap so o<Esc>
nnoremap sO O<Esc>j

imap "<tab> ""<Left>
imap '<tab> ''<Left>
imap (<tab> ()<Left>
imap [<tab> []<Left>
imap {<tab> {}<Left>
imap {<CR> {<CR>}<ESC>O
imap {;<CR> {<CR>};<ESC>O


nnoremap <C-s>	:Limelight!!<CR>
nnoremap <C-g>	:Goyo<CR>

map <C-n>	:NERDTreeToggle<CR>

noremap <localleader>w :w<CR>
nmap <localleader>v <plug>(vimtex-view)

" Goyo
let g:goyo_width = "90%"
let g:goyo_height = "90%"
let g:goyo_linenr = 1

" Limelight
let g:limelight_conceal_ctermfg = 7

" ALE stuff
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
" Linters for ALE to run

" Vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_options = '-reuse-instance @pdf'
let g:vimtex_fold_enabled = 1
set foldexpr=vimtex#fold#level(v:lnum)
set foldtext=vimtex#fold#text()
set indentexpr=VimtexIndent()

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
hi gr ctermfg=8
set laststatus=2
set rulerformat=%30(%=%#bl#%l,%c\ \%#bl#%p%%\ \ %#gr#%t%)
