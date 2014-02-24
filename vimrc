set nocompatible

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=/usr/share/go/misc/vim
filetype plugin indent on " Enable filetype plugins
syntax on

" Enable syntax highlighting
colorscheme github
highlight Comment cterm=italic

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

" Smart Home
noremap <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0' : '^')
noremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$' : 'g_')
vnoremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$h' : 'g_')
imap <Home> <C-o><Home>
imap <End> <C-o><End>

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Set window size and font
if has("gui_running")
  set guioptions-=m "remove menu bar
  set guioptions-=T "remove toolbar
  set guioptions-=r "remove right-hand scroll bar
  set guioptions-=R "remove right-hand scroll bar
  set guioptions-=l "remove left-hand scroll bar
  set guioptions-=L "remove left-hand scroll bar
  set linespace=3
  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 10
  elseif has("gui_win32")
    set guifont=DejaVu\ Sans\ Mono:h10
  endif
endif

set lines=999 columns=9999
set colorcolumn=80
set statusline=%F%m%r%h%w\ [%{&ff},%Y]\ [line:%3l\|col:%2v\|%p%%\|len=%L]

" Key mapping
" Write and load sessions
map <F2> :mksession! ~/vim_session <cr>
map <F3> :source ~/vim_session <cr>
