set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'nvie/vim-flake8'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/xoria256.vim'
Plugin 'tejr/sahara'
Plugin 'Raimondi/delimitMate'
Plugin 'ervandew/supertab'
Plugin 'rking/ag.vim'

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

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set switchbuf+=usetab,newtab
set mouse=

set shortmess+=I

set tags=./tags,.git/tags,$VIRTUAL_ENV/tags

" Look'n'feel
set t_Co=256
set background=dark "ligth
colorscheme solarized "sahara  "xoria256
set tabline=%!Tabline()

set ch=1

" Shortcuts
let mapleader = ","
map <leader>q :wincmd q<cr>
map <leader>ch :set list!<cr>
map <leader>f :cw<cr>
map <leader>fc :cclose<cr>
nnoremap <leader>t :call Tags()<cr>
nnoremap <leader>b oimport ipdb; ipdb.set_trace()<Esc>
nnoremap <leader>B Oimport ipdb; ipdb.set_trace()<Esc>

nmap <silent> <c-k> :wincmd k<cr>
nmap <silent> <c-j> :wincmd j<cr>
nmap <silent> <c-h> :wincmd h<cr>
nmap <silent> <c-l> :wincmd l<cr>

map <S-left> gT
map <S-right> gt

map <F1> <esc>
vmap <F1> <esc>
imap <F1> <esc>

map <F2> :w<cr>
vmap <F2> <esc>:w<cr>
imap <F2> <esc>:w<cr>

map <F3> :NERDTreeToggle<cr>
vmap <F3> <esc>:NERDTreeToggle<cr>
imap <F3> <esc>:NERDTreeToggle<cr>

map <F4> :TagbarToggle<cr>
vmap <F4> <esc>:TagbarToggle<cr>
imap <F4> <esc>:TagbarToggle<cr>

map <F5> :set nu!<cr>
vmap <F5> <esc>:set nu!<cr>
imap <F5> <esc>:set nu!<cr>

set pastetoggle=<F6>

" Abbrevs
iab ipdb! import ipdb; ipdb.set_trace()
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
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jinja setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType less setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 completeopt-=preview

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py inoremap # X<c-h>#

" Remaps
inoremap ii <ESC>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

function! Tags()
    let venv = $VIRTUAL_ENV
    let git_dir = '.git'

    if len(venv)
        let ctags_cmd = '!ctags -R -f ' .venv. '/tags --python-kinds=-i --tag-relative=yes --exclude=.git . ' .venv. '/lib/python2.7/site-packages'
        if isdirectory(venv.'/src/')
            execute ctags_cmd. ' ' .venv. '/src'
        else
            execute ctags_cmd
        endif
    elseif isdirectory(git_dir)
        execute '!ctags -R -f ' .git_dir. '/tags --python-kinds=-i --tag-relative=yes --exclude=.git .'
    else
        execute '!ctags -R --tag-relative=yes --exclude=.git .'
    endif
endfunction

function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  return s
endfunction

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

let g:flake8_cmd = "/usr/local/bin/flake8"

let g:ctrlp_extensions = ['buffertag', 'line']
let g:ctrlp_working_path_mode = 0
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_mruf_relative = 1

let g:nerdtree_tabs_open_on_gui_startup = 0

" Syntax highlight settings
highlight link htmlLink text
highlight StatusLine gui=none
