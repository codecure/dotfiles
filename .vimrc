set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'davidhalter/jedi-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/xoria256.vim'

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
set statusline=%<\ %f\ %m%r%y\ %{&ff}:%{&fenc}\ %{tagbar#currenttag('%s','')}%=%-0.(%4l\/%L:%3c\ %)
set ignorecase
set wildignorecase
set incsearch
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
set mouse=a

" Look'n'feel
set t_Co=256
set background=dark
colorscheme xoria256
set tabline=%!Tabline()

set ch=1

" Shortcuts
let mapleader = ","
set pastetoggle=<Leader>p
map <leader>q :wincmd q<cr>
map <leader>c :call ToggleListChars()<cr>
map <leader>l :set invnumber number?<cr>
nnoremap <leader>b oimport ipdb; ipdb.set_trace()<Esc>
nnoremap <leader>B Oimport ipdb; ipdb.set_trace()<Esc>

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

map <F1> :call VimGrep()<cr>
vmap <F1> <esc>:call VimGrep()<cr>
imap <F1> <esc>:call VimGrep()<cr>

map <F2> :w<cr>
vmap <F2> <esc>:w<cr>
imap <F2> <esc>:w<cr>

map <F3> :Texplore<cr>
vmap <F3> <esc>:Texplore<cr>
imap <F3> <esc>:Texplore<cr>

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

" Remaps
inoremap ii <ESC>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <leader>m :call ToggleMouse()<CR>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" Functions
function! ToggleListChars()
    if &list
        set nolist
    else
        set list
    endif
endfunction

function! Activate(venv_name)
    call PyPath()
    call VEnv(a:venv_name)
endfunction

function! VEnv(vname)
    try
        execute 'python activate_this = "' .$HOME. '/.virtualenvs/' .a:vname.  '/bin/activate_this.py"'
        execute 'python execfile(activate_this, dict(__file__=activate_this))'
    catch
        echo 'Cannot switch to virtualenv'
    endtry
endfunction

function! PyPath()
    let cwd = getcwd()
    if match($PYTHONPATH, cwd) < 0
        let $PYTHONPATH=cwd. ':' .$PYTHONPATH
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

function! VimGrep()
    let pattern = input('Search pattern: ')
    if pattern == ''
        return
    endif
    let file_mask = input('File mask: ', '*.*')
    execute 'vimgrep /' .pattern. '/gj **/' .file_mask. ' | :cw'
endfunction

function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
        echo "Mouse usage disabled"
    else
        set mouse=a
        echo "Mouse usage enabled"
    endif
endfunction

command! -nargs=1 Activate call Activate(<f-args>)
command! -nargs=1 VEnv call VEnv(<f-args>)
command! PyPath call PyPath()

" Plugins settings
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_autofocus = 1
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_width = 25

let python_highlight_all = 1

let g:netrw_list_hide= '.*\.pyc$'

let g:jedi#documentation_command = "<leader>k"
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-x><C-o>"
let g:jedi#auto_close_doc = 1

let g:flake8_cmd = "/usr/local/bin/flake8"

let g:ctrlp_extensions = ['buffertag', 'line']
let g:ctrlp_working_path_mode = 0

" Syntax highlight settings
highlight link htmlLink text
highlight StatusLine gui=none
