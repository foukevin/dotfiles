"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Drop Vi compatibility
set nocompatible
" Clear filetype flags before changing runtimepath to force Vim to reload them
filetype off
"set runtimepath+=
" Re-enable filetype plugins
filetype plugin indent on
" Name of the shell to use for ! and :! commands
set shell=zsh
" Command-lines remembered in the history table
set history=400

function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets the character encoding used inside Vim
set encoding=utf8
" List of character encodings considered when starting to edit an existing file
set fileencodings=utf8,big5,iso-2022-jp,euc-jp,cp932,default,latin1
" Set the preferrred end-of-line (<EOL>) formats
set fileformats=unix,dos,mac
" Do not make a backup before overwriting a file
set nobackup
set nowritebackup
" Do not use a swapfile for the buffer
set noswapfile
" Allow switching between buffers without having to save them
set hidden
" Automatically read file that have been changed outside of Vim again
set autoread
" Remove trailing spaces on save
"autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
"autocmd BufEnter * :syntax sync fromstart
" Behavior when switching between buffers
set switchbuf=usetab
" Will change the current working directory whenever you open a file, switch
" buffers, delete a buffer or open/close a window
"if exists("+autochdir")
"  set autochdir
"else
"  autocmd BufEnter * lcd %:p:h
"endif
" Strings to use in 'list' mode
set listchars=tab:▸\ ,trail:~,eol:¬,extends:⇢,precedes:⇠

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sounds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable sounds
set noerrorbells novisualbell
autocmd VimEnter * set vb t_vb=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation and edit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy indent from current line when starting a new line
set autoindent
" Do smart autoindenting when starting a new line
set smartindent

" Number of spaces that a <Tab> in the file counts for
set tabstop=8
" Do not expand tabs to spaces
set noexpandtab
" Number of spaces to use for each step of (auto)indent.  Used for
" |'cindent'|, |>>|, |<<|, etc.
set shiftwidth=8
" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>
set softtabstop=0

" Working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode
set backspace=eol,start,indent
" Place case labels N characters from the indent of the switch()
" When in unclosed parentheses, indent N characters from the line with the
" unclosed parentheses
" Place C++ scope declarations N characters from the indent
set cinoptions=:0,(0,g0,t0,l1

" No delay when exiting edit mode
set ttimeoutlen=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search and matches
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase
set incsearch
" Highlight all matches of previous search pattern
set nohlsearch
" Briefly jump to the matching bracket when a new one is inserted
set showmatch
" Tenths of a second to show the matching paren
set matchtime=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
" GUI settings
if has("gui_running")
  set guioptions-=m " remove menu bar
  set guioptions-=T " remove toolbar
  set guioptions-=r " remove right-hand scroll bar
  set guioptions-=R " remove right-hand scroll bar
  set guioptions-=l " remove left-hand scroll bar
  set guioptions-=L " remove left-hand scroll bar
  set guioptions=aiA
  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 14
    set linespace=0
  elseif has("gui_win32")
    set guifont=DejaVu\ Sans\ Mono:h10
    map <F11> <ESC>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    set linespace=0
  elseif has("gui_macvim")
    set guifont=DejaVu\ Sans\ Mono:h18
    set linespace=0
  endif
  colorscheme papadox
endif

" Set line number and column 80 marker
" set number
" set numberwidth=8
autocmd FileType cs,python setlocal colorcolumn=100 tabstop=4 shiftwidth=4
autocmd FileType cxx,cpp,hpp setlocal colorcolumn=100
autocmd FileType c,h setlocal colorcolumn=80

" A column with the specified width is shown at the side of the window which
" indicates open and closed folds.
set foldcolumn=1
" Minimal number of screen lines to keep above and below the cursor
set scrolloff=4
" Determine contents of the status line
" set statusline=%F%m%r%h%w\ [%{&ff},%Y]\ [line:%3l\|col:%2v\|%p%%\|len=%L]
if has("statusline")
  "set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
  set statusline=%<%f\ %h%m%r%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}[%{&ff}]%k\ %-14.(%l,%c%V%)\ %P
  "set statusline=%t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
endif
" Last window status line option (0:never, 1:if two windows, 2:always)
set laststatus=2
" Show the line and column number of the cursor position
set ruler
" Do not redraw while executing macros
set lazyredraw
" Number of screen lines to use for the command-line
set cmdheight=2
" Specify when the line with tab page labels will be displayed
set showtabline=2
" String to put at the start of lines that have been wrapped
set showbreak=…

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Character to type to start wildcard expansion in the command-line,
" as specified with 'wildmode'
set wildchar=<Tab>
" Enhance command-line completion
set wildmenu
" Completion mode that is used for the character specified with	'wildchar'
set wildmode=full
" A file that matches with one of these patterns is ignored when expanding
" wildcards, completing file or directory names
set wildignore=*.swp,*.bak,*.pyc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sessions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Changes the effect of the :mksession command
set sessionoptions-=blank,curdir,options,folds
set sessionoptions=buffers,sesdir,winpos,resize,tabpages

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Write and load sessions
map <F2> :mksession! ~/vim_session <cr>
map <F3> :source ~/vim_session <cr>
" Grep word under cursor in current directory and subdirectories
map <F4> :execute "noautocmd vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
" Smart Home/End
noremap <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0' : '^')
noremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$' : 'g_')
vnoremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$h' : 'g_')
imap <Home> <C-o><Home>
imap <End> <C-o><End>
" Prevent entering Ex mode
nnoremap Q <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-h> <C-]>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linewrap edit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction
