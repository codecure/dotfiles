filetype plugin off
execute pathogen#infect()

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
set statusline=%<\ %f\ %m%r%y\ %{&ff}:%{&fenc}%=%-0.(%4l\/%L:%3c\%)\ [%3p%%]
set ignorecase
set wildignorecase
set incsearch
set autoindent
set listchars=tab:»·,trail:·
set list
set nocursorline
set shiftround
set history=1000
set undolevels=1000
set novisualbell

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set switchbuf+=usetab,newtab
set mouse=a

" Look'n'feel
set t_Co=256
set background=dark
colorscheme desert

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set guioptions-=T
set guioptions-=m
set guioptions-=h

set mousehide
set ch=1

set lines=40
set columns=120

if has('gui_running')
  set guifont=Droid\ Sans\ Mono\ 10
endif

set guiheadroom=0

" Shortcuts
map <leader>q :wincmd q<cr>
map <leader>j :join<cr>
map <leader>c :call ToggleListChars()<cr>
map <leader>p :set invpaste paste?<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <S-h> 7h
nmap <S-j> 7j
nmap <S-k> 7k
nmap <S-l> 7l

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

map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
map <A-6> 6gt
map <A-7> 7gt
map <A-8> 8gt
map <A-9> 9gt

map <C-Right> <ESC>:tabnext<CR>
map <C-Left> <ESC>:tabprev<CR>
map <C-t> <ESC>:tabnew<CR>

" Abbrevs
iab ipdb! import ipdb; ipdb.set_trace()
iab utf! # -*- coding: utf-8 -*-

" Language settings
set termencoding=utf-8
set encoding=utf8
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set fileencodings=utf-8,cp1251,koi8-r,cp866
set iskeyword=@,48-57,_,192-255

" Autocmds
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jinja setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType less setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python set completeopt-=preview

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py inoremap # X<c-h>#

autocmd InsertLeave * call SetUsLayout()

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Remaps
map <C-V> "+gP
map <S-Insert> "+gP

vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

noremap <C-Z> u
inoremap <C-Z> <C-O>u

noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

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
let g:NERDTreeChDirMode=2

let g:jedi#pydoc = ""

let Grep_Skip_Dirs = '.git .hg .idea .vagrant .webassets-cache'
let Grep_Skip_Files = '*.bak *~ *.pyc'

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

let g:surround_49 = "{{ \r }}"
let g:surround_50 = "{% \r %}"
let g:surround_51 = "{% block  \r %}{% endblock %}"

" Syntax highlight settings
highlight link htmlLink text
