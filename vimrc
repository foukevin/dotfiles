" Enable filetype plugins
filetype plugin on
filetype indent on

" Enable syntax highlighting
syntax enable
highlight Comment cterm=italic
colorscheme darkblue

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
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Set window size and font
set lines=120 columns=140
if has("gui_running")
  " set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  " set guioptions-=r  "remove right-hand scroll bar
  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 8
  elseif has("gui_win32")
    set guifont=DejaVu\ Sans\ Mono:h11
  endif
endif

" Key mapping
" Write and load sessions
map <F2> :mksession! ~/vim_session <cr>
map <F3> :source ~/vim_session <cr>
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0) <cr>
