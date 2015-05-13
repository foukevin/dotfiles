highlight clear
set background=dark
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Papadox"

if has("gui_running")
    let s:v=" gui"
    let s:bla="#000000"
    let s:whi="#d0d0d0"
    let s:gr1="#a0a0a0"
    let s:gr2="#303030"
    let s:red="#af5f5f"
    let s:gre="#878787"
    let s:bro="#af875f"
    let s:yel="#d7af5f"
    let s:pur="rosybrown3"
    let s:blu="#5f87af"
    let s:cya="#87afd7"
else
    set t_Co=256
    let s:v=" cterm"
    let s:bla="235"
    let s:whi="251"
    let s:gr1="242"
    let s:gr2="236"
    let s:red="131"
    let s:gre="108"
    let s:bro="137"
    let s:yel="179"
    let s:pur="132"
    let s:blu="67"
    let s:cya="110"
endif

exe "hi Normal"      .s:v.'fg='.s:gr1.s:v.'bg='.s:bla

exe "hi NonText"     .s:v.'fg='.s:gr2 .s:v.'=NONE'
exe "hi ErrorMsg"    .s:v.'fg='.s:red.s:v.'bg=bg'
exe "hi IncSearch"   .s:v.'fg=bg' .s:v.'bg=fg' .s:v.'=NONE'
exe "hi Search"      .s:v.'fg=bg' .s:v.'bg='.s:bro
exe "hi MoreMsg"     .s:v.'fg=fg' .s:v.'=NONE'
exe "hi LineNr"      .s:v.'fg='.s:bla.s:v.'bg='.s:gr2
exe "hi CursorLineNr".s:v.'fg=fg'    .s:v.'bg='.s:gr2
exe "hi Question"    .s:v.'fg=fg'                    .s:v.'=NONE'
exe "hi StatusLine"  .s:v.'fg=fg'    .s:v.'bg='.s:gr2.s:v.'=NONE'
exe "hi StatusLineNC".s:v.'fg='.s:gr1.s:v.'bg='.s:gr2.s:v.'=NONE'
exe "hi VertSplit"   .s:v.'fg='.s:gr2.s:v.'bg='.s:gr2.s:v.'=NONE'
exe "hi Title"       .s:v.'fg='.s:red                .s:v.'=NONE'
exe "hi Visual"      .s:v.'fg=bg'    .s:v.'bg=fg'
exe "hi WarningMsg"  .s:v.'fg=fg'                    .s:v.'=NONE'
exe "hi WildMenu"    .s:v.'fg=bg'    .s:v.'bg='.s:bro
exe "hi Folded"      .s:v.'fg='.s:gr1.s:v.'bg='.s:gr2
exe "hi FoldColumn"  .s:v.'fg='.s:gr1.s:v.'bg='.s:gr2
exe "hi DiffAdd"     .s:v.'fg=bg'    .s:v.'bg='.s:gre
exe "hi DiffChange"  .s:v.'fg=bg'    .s:v.'bg='.s:blu
exe "hi DiffDelete"  .s:v.'fg='.s:red.s:v.'bg='.s:red.s:v.'=NONE'
exe "hi DiffText"    .s:v.'fg=bg'    .s:v.'bg='.s:cya.s:v.'=NONE'
exe "hi SignColumn"  .s:v.'fg=fg'    .s:v.'bg=bg'
exe "hi Pmenu"       .s:v.'fg=bg'    .s:v.'bg='.s:gr1
exe "hi PmenuSel"    .s:v.'fg=fg'    .s:v.'bg='.s:gr1
exe "hi PmenuSbar"                   .s:v.'bg='.s:gr1
exe "hi PmenuThumb"  .s:v.'fg=fg'
exe "hi TabLine"     .s:v.'fg='.s:gr1.s:v.'bg='.s:gr2.s:v.'=NONE'
exe "hi TabLineSel"  .s:v.'fg=fg'    .s:v.'bg=bg'    .s:v.'=NONE'
exe "hi TabLineFill" .s:v.'fg=bg'    .s:v.'bg='.s:gr2.s:v.'=NONE'
exe "hi CursorLine"                  .s:v.'bg='.s:gr2.s:v.'=NONE'
exe "hi ColorColumn"                 .s:v.'bg='.s:gr2.s:v.'=NONE'

exe "hi MatchParen"  .s:v.'fg=bg' .s:v.'bg='.s:yel
exe "hi Comment"     .s:v.'fg='.s:gr2 .s:v.'=italic'
exe "hi Constant"    .s:v.'fg='.s:pur
exe "hi Error"       .s:v.'fg=fg'    .s:v.'bg='.s:red
exe "hi Identifier"  .s:v.'fg='.s:cya                .s:v.'=NONE'
exe "hi PreProc"     .s:v.'fg='.s:blu                .s:v.'=NONE'
exe "hi Special"     .s:v.'fg='.s:gr1
exe "hi SpecialKey"  .s:v.'fg='.s:gr1
exe "hi Statement"   .s:v.'fg='.s:whi                .s:v.'=NONE'
exe "hi Todo"        .s:v.'fg='.s:yel .s:v.'bg=bg'   .s:v.'=italic'
exe "hi Type"        .s:v.'fg='.s:whi                .s:v.'=NONE'


"hi Normal guifg=Grey70 guibg=Black gui=NONE
"hi Statement guifg=White guibg=NONE gui=NONE
"hi Constant guifg=Grey guibg=NONE gui=NONE
"hi Constant guifg=RosyBrown3 guibg=NONE gui=NONE
"hi String guifg=RosyBrown3 guibg=NONE gui=NONE
"hi Special guifg=RosyBrown1 guibg=NONE gui=NONE
"hi Special guifg=Grey guibg=NONE gui=NONE
"hi Special guifg=LightGrey guibg=NONE gui=NONE
"hi Comment guifg=Grey40 guibg=NONE gui=italic
"hi Todo guifg=Yellow guibg=NONE gui=italic
"hi Type guifg=White guibg=NONE gui=NONE
"hi PreProc guifg=White guibg=NONE gui=bold
"hi NonText guifg=Grey10 guibg=NONE gui=NONE
"hi Identifier guifg=SteelBlue3 guibg=NONE gui=NONE
"hi Identifier guifg=LightBlue3 guibg=NONE gui=NONE
"hi Function guifg=gold guibg=NONE gui=NONE
"hi Function guifg=White guibg=NONE gui=NONE
"hi MatchParen guifg=NONE guibg=Grey30 gui=NONE

"hi LineNr guifg=Grey15 guibg=Grey3 gui=NONE
"hi FoldColumn guifg=Grey15 guibg=Grey3 gui=NONE
"hi StatusLine guifg=Black guibg=Grey40 gui=NONE
"hi VertSplit guifg=NONE guibg=Grey40 gui=NONE

"hi TabLine guifg=Black guibg=Grey70 gui=NONE
"hi TabLineSel guifg=Grey40 guibg=Black gui=NONE
""hi TabLineFill guifg=Black guibg=Grey40 gui=NONE
"hi Title guifg=DarkRed guibg=NONE gui=NONE

"hi Visual guifg=Grey70 guibg=DeepPink4 gui=NONE
"hi PMenu guifg=NONE guibg=RoyalBlue4 gui=NONE
"hi PMenuSel guifg=NONE guibg=RoyalBlue3 gui=NONE
