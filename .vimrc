let $VIMHOME = $HOME."/.vim"

"-------------------------
" Базовые настройки
"-------------------------
" Перечитываем файл, если он изменился извне
set autoread

set title " Показ названия файла в заголовке окна

set linebreak " Перенос по словам

set ignorecase " Не учитывать регистр при поиске

set showmatch " Посвечивать соответствующие скобки

set matchpairs+=<:> " Подсвечивать < и > тоже

" Включаем антиалиасинг для шрифтов
set antialias

" Включаем несовместимость настроек с Vi (ибо Vi нам и не понадобится).
set nocompatible

" Показывать положение курсора всё время.
set ruler

" Показывать незавершённые команды в статусбаре
set showcmd

" Включаем нумерацию строк
set nu

" Фолдинг по отсупам
set foldmethod=indent

" Поиск по набору текста (очень полезная функция)
set incsearch

" Отключаем подстветку найденных вариантов, и так всё видно.
set nohlsearch

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в режиме редактирования
set scrolljump=7

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы опуститься в режиме редактирования
set scrolloff=7

" Выключаем надоедливый 'звонок'
set novisualbell
set t_vb=

" Кодировка текста по умолчанию
set termencoding=utf-8
set encoding=utf8

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden

" Скрыть панель в gui версии ибо она не нужна
set guioptions-=T

" Сделать строку команд высотой в одну строку
set ch=1

" Скрывать указатель мыши, когда печатаем
set mousehide

" Включить автоотступы
set autoindent

" Влючить подстветку синтаксиса
syntax on

" allow to use backspace instead of "x"
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Преобразование Таба в пробелы
set expandtab

" Размер табуляции по умолчанию
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab

" Формат строки состояния
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{&encoding}\ %=%-32{fugitive#head()}\ %=%-12(\ %l,%c-%v\ %)%P
set laststatus=2

" Включаем умные отступы ( например, автоотступ после {)
set smartindent

" Отключаем folding
set nofoldenable

" Показывать режим, в котором находимся
set showmode

" Не делать никаких бекапов
set nobackup
set nowritebackup
set noswapfile

"-------------------------
" Горячие клавиши
"-------------------------
" C-c and C-v - Copy/Paste в "глобальный клипборд"
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi
vmap <C-Insert> "+yi
imap <S-Insert> <esc>"+gPi

set nopaste

" Заставляем shift-insert работать как в Xterm
map <S-Insert> <MiddleMouse>

" Избавляем от хелпа по F1 и заменяем на Esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" F2 - Save
map <F2> :w<cr>
vmap <F2> <esc>:w<cr>
imap <F2> <esc>:w<cr>

" F3 - NERDTree
map <F3> :NERDTreeToggle<cr>
vmap <F3> <esc>:NERDTreeToggle<cr>
imap <F3> <esc>:NERDTreeToggle<cr>

" F4 - Tag List
map <F4> :TagbarToggle<cr>
vmap <F4> <esc>:TagbarToggle<cr>
imap <F4> <esc>:TagbarToggle<cr>

" F5 - просмотр списка буферов
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" F6 - предыдущий буфер
map <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" F7 - следующий буфер
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

" F8 - удалить буфер
map <F8> :call Cclose()<cr>
vmap <F8> <esc>:call Cclose()<cr>i
imap <F8> <esc>:call Cclose()<cr>i

" < & > - делаем отступы для блоков
vmap < <gv
vmap > >gv

" Выключаем ненавистный режим замены
imap >Ins> <Esc>i

" Меню выбора кодировки текста (koi8-r, cp1251, cp866, utf8)
set wildmenu
set wildmode=longest,list,full
set wildignore+=*.pyc

set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
map <leader>e :emenu Encoding.<TAB>

" Слова откуда будем завершать
set complete=""
" Из текущего буфера
set complete+=.
" Из словаря
set complete+=k
" Из других открытых буферов
set complete+=b
" из тегов
set complete+=t

set completeopt-=preview
set completeopt+=longest
set mps-=[:]

" Автозавершение слов по tab
"function InsertTabWrapper()
     "let col = col('.') - 1
     "if !col || getline('.')[col - 1] !~ '\k'
         "return "\<tab>"
     "else
         "return "\<c-p>"
     "endif
"endfunction
"imap <tab> <c-r>=InsertTabWrapper()<cr>

imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>
imap <Nul> <C-R>=RopeCodeAssistInsertMode()<CR>

" Настройка omnicomletion для Python (а так же для js, html и css)
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Включаем filetype плагин.
filetype plugin on

" Поддержка русского
set keymap=russian-jcukenwin
" по умолчанию - латинская раскладка
set iminsert=0
" по умолчанию - латинская раскладка при поиске
set imsearch=0
" Список кодировок файлов для автоопределения
set fileencodings=utf-8,cp1251,koi8-r,cp866
" (чтобы w, b, * понимали русские слова)
set iskeyword=@,48-57,_,192-255

"-----------------------------------
" Настройки размеров и внешнего вида
"-----------------------------------
" Highlight the trailing spaces
set listchars=tab:»·,trail:·
set list

set guifont=Droid\ Sans\ Mono\ 11
set t_Co=256 " 256 цветов в терминале
set t_md=
set background=dark
colorscheme xoria256
"colorscheme kolor

if has("gui_running")
    " GUI is running or is about to start.
    winpos 250 100
    " Maximize gvim window.
    set lines=40 columns=120
    " Не показывать скроллы в гуи режиме и показывать иконку
    set guioptions=i
    set guioptions+=m
endif

" Python
let python_highlight_all = 1

" BufExplorer
let g:bufExplorerReverseSort=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerShowUnlisted=0
let g:bufExplorerSortBy='mru'

" NERD tree
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeWinSize = 25

" Труъ путь вимера
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Перемещение по сплитам
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Подсветка курсора
set cursorline

" Функция для правильного закрытия буфера (чтобы не мучить nerdtree)
function! Cclose()
    let todelbufNr = bufnr("%")
    let newbufNr = bufnr("#")
    if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
        exe "b".newbufNr
    else
        bnext
    endif

    if (bufnr("%") == todelbufNr)
        new
    endif
    exe "bd!".todelbufNr
endfunction

set shiftround              " удалять лишние пробелы при отступе
set wrap                    " перенос строк
set clipboard^=unnamed      " включаем X clipboard
set virtualedit=all         " On virtualedit for all mode
set go+=a                   " выделение в виме копирует в буфер системы
set sidescroll=7
set sidescrolloff=10        " 10 символов минимум под курсором при скролле
"
" Ускоренное передвижение по тексту
nmap <S-h> 7h
nmap <S-j> 7j
nmap <S-k> 7k
nmap <S-l> 7l

" Abbrevs
iab pdb! import ipdb; ipdb.set_trace()
iab utf! # -*- coding: utf-8 -*-

au BufReadPost *.py set keywordprg=pydoc

" Запустить проверку PyFlakes, pep8
autocmd FileType python map <buffer> <F9> :call Flake8()<CR>

map <leader>q :wincmd q<cr>

let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_autofocus = 1
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_width = 25

let no_flake8_maps = 0

" Rope
let ropevim_vim_completion = 1
let ropevim_extended_complete = 1
let ropevim_guess_project = 0

map <leader>o :RopeOpenProject<cr>
map <leader>g :RopeGotoDefinition<cr>

" Pydoc
let g:pydoc_open_cmd = 'vsplit'

" Set 'en' layout on leave insert
function! SetUsLayout()
    if &iminsert != 0
        let &iminsert = 0
    endif
endfunction

autocmd InsertLeave * call SetUsLayout()

" Show/hide tab-eof-etc chars
function! ToggleListChars()
    if &list
        set nolist
    else
        set list
    endif
endfunction

map <leader>:c :call ToggleListChars()<cr>
map <leader>r :NERDTreeFind<cr>

" Не дает символу # уползать в начало строки
autocmd BufRead *.py inoremap # X<c-h>#

" Join lines
map <leader>j :join<cr>

map <leader>p :set invpaste paste?<cr>

