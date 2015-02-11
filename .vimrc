set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'davidhalter/jedi-vim'
Plugin 'yegappan/grep'
Plugin 'kien/ctrlp.vim'
Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'tpope/vim-commentary'
Plugin 'jonathanfilip/vim-lucius'

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
set laststatus=2
set statusline=%<\ %f\ %m%r%y\ %{&ff}:%{&fenc}\ %{tagbar#currenttag('%s','')}%=%-0.(%4l\/%L:%3c\ %)
set ignorecase
set wildignorecase
set incsearch
set autoindent
set listchars=tab:»·,trail:·
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
set mouse=a

" Look'n'feel
set t_Co=256
set background=dark
colorscheme lucius " desert

set ch=1

set lines=40
set columns=120

" Shortcuts
map <leader>q :wincmd q<cr>
map <leader>j :join<cr>
map <leader>c :call ToggleListChars()<cr>
map <leader>p :set invpaste paste?<cr>

nmap <S-h> 7h
nmap <S-j> 7j
nmap <S-k> 7k
nmap <S-l> 7l

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

map <F1> :Rgrep -i<cr>
vmap <F1> <esc>:Rgrep -i<cr>
imap <F1> <esc>:Rgrep -i<cr>

map <F2> :w<cr>
vmap <F2> <esc>:w<cr>
imap <F2> <esc>:w<cr>

map <F3> :NERDTreeToggle<cr>
vmap <F3> <esc>:NERDTreeToggle<cr>
imap <F3> <esc>:NERDTreeToggle<cr>

map <F4> :TagbarToggle<cr>
vmap <F4> <esc>:TagbarToggle<cr>
imap <F4> <esc>:TagbarToggle<cr>

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

autocmd InsertLeave * call SetUsLayout()

" Remaps
nnoremap <leader>b oimport ipdb; ipdb.set_trace()<Esc>
inoremap ii <ESC>

" Functions
function! ToggleListChars()
    if &list
        set nolist
    else
        set list
    endif
endfunction

function! SetUsLayout()
    if &iminsert != 0
        let &iminsert = 0
    endif
endfunction

function! VEnv(vname)
    try
        execute 'python activate_this = "' .$HOME. '/.virtualenvs/' .a:vname.  '/bin/activate_this.py"'
        execute 'python execfile(activate_this, dict(__file__=activate_this))'
    catch
        echo 'Cannot switch to virtualenv'
    endtry
endfunction

command! -nargs=* VEnv call VEnv(<f-args>)

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

let g:jedi#documentation_command = "<leader>k"
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "0"

let Grep_Skip_Dirs = '.git .hg .idea .vagrant .webassets-cache'
let Grep_Skip_Files = '*.bak *~ *.pyc'

let g:flake8_cmd="/usr/local/bin/flake8"

" Syntax highlight settings
highlight link htmlLink text
highlight StatusLine gui=none
