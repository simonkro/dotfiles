call pathogen#infect()

:set timeout timeoutlen=1000 ttimeoutlen=10

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
nmap <leader>r :!ruby %<CR>

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

" remove ugly vertical divider char
set fillchars=
hi VertSplit ctermfg=Black  ctermbg=0 cterm=NONE
hi StatusLineNC ctermfg=Black  ctermbg=0 cterm=NONE

" change color of NERDTree directories
hi Directory guifg=#FFFFFF ctermfg=white
hi NERDTreeDirSlash guifg=#FFFFFF ctermfg=white

" colors for line numbers and autocomplete
hi LineNr cterm=NONE ctermfg=DarkGray ctermbg=Black
hi Pmenu cterm=NONE ctermbg=238 ctermfg=DarkGray

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nmap g* :

" command-t settings
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowReverse=0
nnoremap <C-F> :CommandT<cr>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
" let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
" let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
" let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
" let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
" let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Limit number of matches
" let g:neocomplcache_max_list = 10

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" autocmd FileType ruby let g:rubycomplete_buffer_loading=1
" autocmd FileType ruby let g:rubycomplete_classes_in_global=1

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" map spacebar to clear search highlight
nnoremap <space> :noh<cr>

" buffer resizing mappings (shift + arrow key)
nnoremap <S-Up> <c-w>+
nnoremap <S-Down> <c-w>-
nnoremap <S-Left> <c-w><
nnoremap <S-Right> <c-w>>

" ack aka global search
nmap g/ :Ack!<space>
nmap g* :Ack! -w <C-R><C-W><CR>
nmap ga :AckAdd!<space>
nmap gn :cnext<CR>
nmap gp :cprev<CR>
nmap gq :ccl<CR>
nmap gl :cwindow<CR>

autocmd BufWritePre  *.{rb,rake,properties,conf,markdown}  call StripTrailingWhite()

function! StripTrailingWhite()
  let l:winview = winsaveview()
  silent! %s/\s\+$//
  call winrestview(l:winview)
endfunction
