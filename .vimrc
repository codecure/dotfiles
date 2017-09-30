set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Javascript
Plugin 'pangloss/vim-javascript'

" File
Plugin 'scrooloose/nerdtree'

" Programming
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-repeat'

" Vcs
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'rickhowe/diffchar.vim'

" Colors
Plugin 'vim-scripts/xoria256.vim'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'jacoborus/tender.vim'

" Other
Plugin 'mileszs/ack.vim'

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
set statusline=%<\ %f\ %m%r%y\ %{&ff}:%{&fenc}\ %{tagbar#currenttag('%s','')}%=%-0.(%{fugitive#statusline()}%4l\/%L:%3v\ %)
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
if (has("termguicolors"))
 set termguicolors
endif
if (has("macligatures"))
 set macligatures
endif

set t_Co=256
set t_md=
set background=dark
colorscheme onehalfdark
set guifont=Menlo:h14

set ch=1

" Shortcuts
let mapleader = ","

nnoremap Q <nop>

command! -nargs=+ -complete=file -bar AckSearch Ack! <args>
command! W w
command! Q q

map <S-left> :bp<cr>
map <S-right> :bn<cr>

map <F1> :AckSearch<space>
vmap <F1> :AckSearch<space>
imap <F1> :AckSearch<space>

map <F3> :NERDTreeToggle<cr>
vmap <F3> <esc>:NERDTreeToggle<cr>
imap <F3> <esc>:NERDTreeToggle<cr>

map <F4> :TagbarToggle<cr>
vmap <F4> <esc>:TagbarToggle<cr>
imap <F4> <esc>:TagbarToggle<cr>

map <F7> :SyntasticCheck<cr>
vmap <F7> <esc>:SyntasticCheck<cr>
imap <F7> <esc>:SyntasticCheck<cr>

nnoremap <leader>f :ls<cr>:b<space>

" Abbrevs
iab ipdb import ipdb; ipdb.set_trace()
iab pdb import pdb; pdb.set_trace()

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
autocmd FileType htmldjango setlocal ts=2 sw=2 sts=0 expandtab commentstring={#%s#}
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py inoremap # X<c-h>#

" Remaps
inoremap ii <C-]><Esc>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" Plugins settings
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_autofocus = 1
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_width = 25

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25
let g:NERDTreeChDirMode = 2

let g:ackprg = "ag --nogroup --nocolor --column"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["python", "javascript"]}
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_exec='/Users/code/.pyenv/versions/flake8/bin/flake8'
let g:syntastic_python_flake8_args='--max-line-length=120'

let g:python_highlight_all = 1
let g:python_version_3 = 1

" Syntax highlight settings
highlight link htmlLink text
highlight StatusLine gui=none
