highlight clear
set background=dark
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Papadox"

if has("gui_running")
    let s:v=" gui"
    let s:bl1="#000000"
    let s:bla="#0f0f0f"
    let s:whi="#ffffff"
    let s:gr1="#b8b8b8"
    let s:gr2="#383838"
    let s:red="#ff8faf"
    let s:gre="#87ff87"
    let s:bro="#cfa75f"
    let s:yel="#d7af5f"
    let s:pur="#875f87"
    let s:blu="#af8fff"
    let s:cya="#87afd7"
else
    set t_Co=256
    let s:v=" cterm"
    let s:bl1="232"
    let s:bla="233"
    let s:whi="251"
    let s:gr1="245"
    let s:gr2="236"
    let s:red="131"
    let s:gre="108"
    let s:bro="137"
    let s:yel="179"
    let s:pur="96"
    let s:blu="67"
    let s:cya="110"
endif

" Set the cursor for the terminal
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;LightGreen\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;LightGreen\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[5 q"
  " solid block
  let &t_EI .= "\<Esc>[1 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

exe "hi Normal"      .s:v.'fg='.s:gr1.s:v.'bg='.s:bl1

exe "hi NonText"     .s:v.'fg='.s:gr2 .s:v.'=NONE'
exe "hi ErrorMsg"    .s:v.'fg='.s:red.s:v.'bg=bg'
exe "hi IncSearch"   .s:v.'fg=bg' .s:v.'bg=fg' .s:v.'=NONE'
exe "hi Search"      .s:v.'fg=bg' .s:v.'bg='.s:bro
exe "hi MoreMsg"     .s:v.'fg=fg' .s:v.'=NONE'
exe "hi LineNr"      .s:v.'fg='.s:bro.s:v.'bg='.s:gr2
exe "hi CursorLineNr".s:v.'fg=fg'    .s:v.'bg='.s:gr2
exe "hi Question"    .s:v.'fg=fg'                    .s:v.'=NONE'
exe "hi StatusLine"  .s:v.'fg=fg'    .s:v.'bg='.s:gr2.s:v.'=NONE'
exe "hi StatusLineNC".s:v.'fg='.s:bla.s:v.'bg='.s:gr2.s:v.'=NONE'
exe "hi VertSplit"   .s:v.'fg='.s:gr2.s:v.'bg='.s:bla.s:v.'=NONE'
exe "hi Title"       .s:v.'fg='.s:red                .s:v.'=NONE'
exe "hi Visual"      .s:v.'fg=bg'    .s:v.'bg=fg'
exe "hi WarningMsg"  .s:v.'fg=fg'                    .s:v.'=NONE'
exe "hi WildMenu"    .s:v.'fg=bg'    .s:v.'bg='.s:bro
exe "hi Folded"      .s:v.'fg='.s:gr1.s:v.'bg='.s:gr2
exe "hi FoldColumn"  .s:v.'fg='.s:gr1.s:v.'bg='.s:bla
exe "hi DiffAdd"     .s:v.'fg=bg'    .s:v.'bg='.s:gre
exe "hi DiffChange"  .s:v.'fg=bg'    .s:v.'bg='.s:blu
exe "hi DiffDelete"  .s:v.'fg='.s:red.s:v.'bg='.s:red.s:v.'=NONE'
exe "hi DiffText"    .s:v.'fg=bg'    .s:v.'bg='.s:cya.s:v.'=NONE'
exe "hi SignColumn"  .s:v.'fg=fg'    .s:v.'bg=bg'
exe "hi Pmenu"       .s:v.'fg=bg'    .s:v.'bg='.s:gr2
exe "hi PmenuSel"    .s:v.'fg='.s:whi.s:v.'bg='.s:gr1
exe "hi PmenuSbar"                   .s:v.'bg='.s:gr1
exe "hi PmenuThumb"  .s:v.'fg=fg'
exe "hi TabLine"     .s:v.'fg='.s:gr1.s:v.'bg='.s:gr2.s:v.'=NONE'
exe "hi TabLineSel"  .s:v.'fg='.s:whi.s:v.'bg=bg'    .s:v.'=NONE'
exe "hi TabLineFill" .s:v.'fg=bg'    .s:v.'bg='.s:gr2.s:v.'=NONE'
exe "hi CursorLine"                  .s:v.'bg='.s:gr2.s:v.'=NONE'
exe "hi ColorColumn"                 .s:v.'bg='.s:bla.s:v.'=NONE'

exe "hi Cursor"      .s:v.'fg=bg' .s:v.'bg='.s:whi

exe "hi MatchParen"  .s:v.'fg=bg' .s:v.'bg='.s:yel
exe "hi Comment"     .s:v.'fg='.s:bro .s:v.'=NONE'
exe "hi Constant"    .s:v.'fg='.s:red
exe "hi Error"       .s:v.'fg=fg'    .s:v.'bg='.s:red
exe "hi Identifier"  .s:v.'fg='.s:cya                .s:v.'=NONE'
exe "hi PreProc"     .s:v.'fg='.s:blu                .s:v.'=NONE'
exe "hi Special"     .s:v.'fg='.s:blu
exe "hi SpecialKey"  .s:v.'fg='.s:gr1
exe "hi Statement"   .s:v.'fg='.s:whi                .s:v.'=bold'
exe "hi Todo"        .s:v.'fg=bg' .s:v.'bg='.s:yel.s:v.'=bold'
exe "hi Type"        .s:v.'fg='.s:whi                .s:v.'=bold'
