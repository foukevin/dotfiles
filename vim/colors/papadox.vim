set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "Papadox"

hi Normal guifg=Grey70 guibg=Black gui=NONE
hi Statement guifg=White guibg=NONE gui=NONE
hi Constant guifg=Grey guibg=NONE gui=NONE
hi Constant guifg=RosyBrown3 guibg=NONE gui=NONE
hi String guifg=RosyBrown3 guibg=NONE gui=NONE
"hi Special guifg=RosyBrown1 guibg=NONE gui=NONE
"hi Special guifg=Grey guibg=NONE gui=NONE
hi Special guifg=LightGrey guibg=NONE gui=NONE
hi Comment guifg=Grey40 guibg=NONE gui=italic
hi Todo guifg=Yellow guibg=NONE gui=italic
hi Type guifg=White guibg=NONE gui=NONE
hi PreProc guifg=White guibg=NONE gui=bold
hi NonText guifg=Grey10 guibg=NONE gui=NONE
"hi Identifier guifg=SteelBlue3 guibg=NONE gui=NONE
hi Identifier guifg=LightBlue3 guibg=NONE gui=NONE
"hi Function guifg=gold guibg=NONE gui=NONE
hi Function guifg=White guibg=NONE gui=NONE
hi MatchParen guifg=NONE guibg=Grey30 gui=NONE

hi LineNr guifg=Grey15 guibg=Grey3 gui=NONE
hi FoldColumn guifg=Grey15 guibg=Grey3 gui=NONE
"hi StatusLine guifg=Black guibg=Grey40 gui=NONE
"hi VertSplit guifg=NONE guibg=Grey40 gui=NONE

hi TabLine guifg=Black guibg=Grey70 gui=NONE
hi TabLineSel guifg=Grey40 guibg=Black gui=NONE
"hi TabLineFill guifg=Black guibg=Grey40 gui=NONE
hi Title guifg=DarkRed guibg=NONE gui=NONE

hi Visual guifg=Grey70 guibg=DeepPink4 gui=NONE
hi PMenu guifg=NONE guibg=RoyalBlue4 gui=NONE
hi PMenuSel guifg=NONE guibg=RoyalBlue3 gui=NONE
