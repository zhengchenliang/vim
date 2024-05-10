" Forked from David Chen

" === Auto load for first time uses -> I don't install plugins here
"  if empty(glob('~/.vim/autoload/plug.vim'))
"    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"  endif

" load /pack/*/opt packages at vim start
" see :help packages
"  packadd! onedark.vim " it may has other prerequisites like atom color interpreter so forget it
" nvim for full configuration, vim for only plain

" === System
set nocompatible " fuk vi
filetype on " vim recognize file type
filetype indent on " indent for file type on
set indentexpr= " no indent here -> use spaces
filetype plugin on " plugin for file type on
filetype plugin indent on " indent in plugin for file type on
set mouse=a " use mouse
set clipboard=unnamed " use system clipboard
set encoding=utf-8 " use fixed encoding
colorscheme habamax " use vim color scheme

" Prevent incorrect background rendering
let &t_ut=''

" === Main code display
set number
"  set relativenumber
set ruler
set cursorline
syntax enable
syntax on
"  colorscheme onedark " use onedark scheme

" === Editor behavior
" Better tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5

" Prevent auto line split
set wrap
set tw=0

" Better backspace
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" === Window behaviors
set splitright
set splitbelow

" === Status/command bar
set laststatus=2
set autochdir
set showcmd
set formatoptions-=tc

" Set tab autocomplete style
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
set wildmode=longest,list,full

" Searching options
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" === Restore Cursor Position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" === Basic Mappings
"  VITAL <LEADER> Leader key: Set <LEADER> as <SPACE>
let mapleader=" "

" Column (:) mods
map ; :
map q; q:
map <LEADER>/ :!
map <LEADER>r :r !
map <LEADER>sr :%s/

"  VITAL <CR> = Ctrl+M = <Return> = <Enter> Change line key
" Save & quit
map Q :q<CR>
map W :w<CR>

" Open the vimrc file anytime
"  map <LEADER>rc :e ~/.vim/vimrc<CR>

" Redo operations
noremap y <C-r>
" Undo in Insert mode
"  inoremap <C-l> <C-u>

" VITAL a = add; s = insert;
noremap s i
noremap S I
" VITAL press f to copy and press h to paste
noremap f y
noremap h p
" VITAL google for vim script func: copy and paste with the system clipboard
vnoremap <C-c> :w !xclip -i -sel clip<CR><CR>
noremap <C-v> :call PasteFromXclip()<CR>
func! PasteFromXclip()
  let lin = line(".")
  exec lin . "r !xclip -o -sel clip"
endfunc

" Search
map <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" === Cursor Movement
"     ^
"     i
" < j k l >
"     v
noremap i k
noremap j h
noremap k j
" I/K keys for multitimes i/k (faster navigation)
noremap I 5k
noremap J 5h
noremap K 5j
noremap L 5l
" D key: go to the start of the line
noremap D 0
" F key: go to the end of the line
noremap F $

" Faster in-line navigation by words
noremap p w
noremap o b
noremap P 5w
noremap O 5b

" Ctrl + i or k will move up/down the view port without moving the cursor
noremap <C-i> 5<C-y>
noremap <C-k> 5<C-e>
inoremap <C-i> <Esc>5<C-y>a
inoremap <C-k> <Esc>5<C-e>a

" === Window management
" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>n <C-w>w
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l
"map <LEADER>r <C-w>r

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map gi :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map gk :set splitbelow<CR>:split<CR>
map gj :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map gl :set splitright<CR>:vsplit<CR>

" Place the two screens up and down
noremap gu <C-w>t<C-w>K
" Place the two screens side by side
noremap gh <C-w>t<C-w>H

" Rotate screens
noremap gfu <C-w>b<C-w>K
noremap gfh <C-w>b<C-w>H

" Resize splits with arrow keys
"  map <up> :res +5<CR>
"  map <down> :res -5<CR>
"  map <left> :vertical resize-5<CR>
"  map <right> :vertical resize+5<CR>

" === Tabe management
" Create a new tabe
map tn :tabe<CR>
" Move around tabes with tj and tl
map tj :-tabnext<CR>
map tl :+tabnext<CR>
" Move the tabes with tk and ti
map tk :-tabmove<CR>
map ti :+tabmove<CR>

" === Other useful stuff
" Press space twice to jump to the next '<++>' and edit it
"  map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Press ` to change case (instead of ~)
map ` ~
" n key: go to the prev for /
noremap n N
" m key: go to the next for /
noremap m n

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
map tx :r !figlet 

" Compile function
map rn :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cc'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc

map bd :call CompileBuildrrr()<CR>
func! CompileBuildrrr()
  exec "w"
  if &filetype == 'vim'
    exec "source $MYVIMRC"
  elseif &filetype == 'markdown'
    exec "echo"
  endif
endfunc

" === Install Plugins with Vim-Plug -> I don't install plugin here

"  call plug#begin('~/.vim/plugged')

"  === This one has been switched to Vin 8 Pack installation
"  Plug 'joshdick/onedark.vim'

"  call plug#end()

nnoremap jf :bprev<CR>
nnoremap lf :bnext<CR>
nnoremap kf :bd<CR>
