set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" File
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'

" Python
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'davidhalter/jedi-vim'
Plugin 'hdima/python-syntax'

" Html
Plugin 'mattn/emmet-vim'
Plugin 'gregsexton/MatchTag'
Plugin 'othree/html5.vim'

" Programming
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" Vcs
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Colors
Plugin 'vim-scripts/xoria256.vim'
Plugin 'vim-scripts/wombat256.vim'
Plugin 'NLKNguyen/papercolor-theme'

" Other
Plugin 'mileszs/ack.vim'
Plugin 'gcmt/taboo.vim'
Plugin 'jlanzarotta/bufexplorer'

call vundle#end()

" Default settings
syntax on
filetype plugin indent on
set hidden
set autoread
set nobackup
set noswapfile
set number
set nowrap
set wildmode=longest,list,full
set wildignore+=*.pyc
set wildmenu
set nocompatible
set backspace=2
set laststatus=2
set statusline=%<\ %f\ %m%r%y\ %{&ff}:%{&fenc}\ %{tagbar#currenttag('%s','')}%=%-0.(%4l\/%L:%3v\ %)
set ignorecase
set wildignorecase
set incsearch
set hlsearch
set autoindent
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
set list
set cursorline
set shiftround
set history=1000
set undolevels=1000
set visualbell t_vb=
set scrolloff=3
set guioptions-=e
set foldmethod=indent
set nofoldenable
set lazyredraw
set modelines=1
set clipboard=unnamed

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set mouse=a  " on OSX press ALT and click"

set shortmess+=I

" Look'n'feel
set t_Co=256
set background=light "dark
colorscheme PaperColor
set guifont=Input:h14

set ch=1

" Shortcuts
let mapleader = ","

nnoremap <leader>b oimport ipdb; ipdb.set_trace()<Esc>
nnoremap <leader>B Oimport ipdb; ipdb.set_trace()<Esc>
nnoremap Q <nop>

command! -nargs=+ -complete=file -bar AckSearch Ack! <args>

map <S-left> :bp<cr>
map <S-right> :bn<cr>

map <F1> :AckSearch<space>
vmap <F1> :AckSearch<space>
imap <F1> :AckSearch<space>

map <F2> :w<cr>
vmap <F2> <esc>:w<cr>
imap <F2> <esc>:w<cr>

map <F3> :NERDTreeToggle<cr>
vmap <F3> <esc>:NERDTreeToggle<cr>
imap <F3> <esc>:NERDTreeToggle<cr>

map <F4> :TagbarToggle<cr>
vmap <F4> <esc>:TagbarToggle<cr>
imap <F4> <esc>:TagbarToggle<cr>

" map <F5> :ls<cr>:b<space>
" vmap <F5> :ls<cr>:b<space>
" imap <F5> :ls<cr>:b<space>

map <F5> :ToggleBufExplorer<cr>
vmap <F5> :ToggleBufExplorer<cr>
imap <F5> :ToggleBufExplorer<cr>

set pastetoggle=<F6>

" Abbrevs
iab utf! # coding: utf-8

" Language settings
set termencoding=utf-8
set encoding=utf8
set keymap=russian-jcuken
set iminsert=0
set imsearch=0
set fileencodings=utf-8,cp1251,koi8-r,cp866
set iskeyword=@,48-57,_,192-255

" Autocmds
autocmd FileType python setlocal completeopt-=preview
autocmd FileType htmldjango setlocal commentstring={#%s#}

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py inoremap # X<c-h>#

" Remaps
inoremap ii <ESC>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" Plugins settings
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_autofocus = 1
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_width = 25

let python_highlight_all = 1

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25
let g:NERDTreeChDirMode = 2

let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_working_path_mode = 0
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_mruf_relative = 1

let g:ackprg = "ack -i"

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_exec='/usr/local/bin/flake8'
let g:syntastic_python_flake8_args='--max-line-length=120'

let g:python_highlight_all = 1
let g:python_version_2 = 1

" Syntax highlight settings
highlight link htmlLink text
highlight StatusLine gui=none
