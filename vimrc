set nocompatible

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=/usr/share/go/misc/vim
filetype plugin indent on " Enable filetype plugins

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, allow switching between buffers without having to save them
set nobackup
set nowb
set noswapfile
set hidden

" Indentation
" set expandtab
set smartindent
set shiftwidth=8
set tabstop=8

" Enable syntax highlighting
syntax on
colorscheme github

" Set window size and font
if has("gui_running")
  set guioptions-=m "remove menu bar
  set guioptions-=T "remove toolbar
  set guioptions-=r "remove right-hand scroll bar
  set guioptions-=R "remove right-hand scroll bar
  set guioptions-=l "remove left-hand scroll bar
  set guioptions-=L "remove left-hand scroll bar
  if has("gui_gtk2")
    function! ToggleFullScreen()
      call system("wmctrl -i -r ".v:windowid." -b toggle,fullscreen")
      redraw
    endfunction
    set guifont=DejaVu\ Sans\ Mono\ 10
    nnoremap <M-f> :call ToggleFullScreen()<CR>
    inoremap <M-f> <C-\><C-O>:call ToggleFullScreen()<CR>
  elseif has("gui_win32")
    set guifont=DejaVu\ Sans\ Mono:h10
  endif
  set linespace=6
  highlight Comment gui=italic
endif

" Set line number and 80's color marker
set number
set numberwidth=8
set colorcolumn=80
set columns=88

" Set status
set statusline=%F%m%r%h%w\ [%{&ff},%Y]\ [line:%3l\|col:%2v\|%p%%\|len=%L]
set laststatus=2

" Key mapping
" Write and load sessions
map <F2> :mksession! ~/vim_session <cr>
map <F3> :source ~/vim_session <cr>

" Smart Home
noremap <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0' : '^')
noremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$' : 'g_')
vnoremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$h' : 'g_')
imap <Home> <C-o><Home>
imap <End> <C-o><End>

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
