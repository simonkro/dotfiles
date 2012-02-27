call pathogen#infect()

set encoding=utf-8
set laststatus=2

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

"set showcmd     "show incomplete cmds down the bottom
"set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set nowrap      "dont wrap lines
set linebreak   "wrap lines at convenient points

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"display tabs and trailing spaces
set list
set listchars=tab:\ \ ,extends:>,precedes:<

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

set t_Co=256
set term=xterm-256color
colorscheme railscasts
set guifont=Monaco\ 8

let mapleader = ","
nmap <leader>p :NERDTreeToggle<CR>

" shortcuts for saving with ctrl-s 
nmap <c-s> :w<cr> 
vmap <c-s> <esc><c-s> 
imap <c-s> <esc><c-s>

nmap <c-s-s> :wall<cr>
vmap <c-s-s> <esc><c-s-s>
imap <c-s-s> <esc><c-s-s>

" remove gui clutter
set go-=T
set go-=m

" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,],<,>

set autoread

set nobackup
set noswapfile

" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]
" allow <BkSpc> to delete line breaks, beyond the start of the current
" insertion, and over indentations:
set backspace=eol,start,indent

" make page up/down behave more sane
map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>
imap <PageUp> <C-O><C-U><C-O><C-U>
imap <PageDown> <C-O><C-D><C-O><C-D>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

"map to bufexplorer
nnoremap <C-B> :BufExplorer<cr>

"make Y consistent with C and D
nnoremap Y y$

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

let g:Powerline_symbols = 'fancy'

autocmd BufWritePost *
      \ if exists('b:git_dir') && executable(b:git_dir.'/hooks/ctags') |
      \   call system('"'.b:git_dir.'/hooks/ctags" &') |
      \ endif

let g:ruby_debugger_default_script = 'script/rails server'
