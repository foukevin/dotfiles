set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "Papadox"

hi Normal guifg=LightGrey guibg=Black gui=NONE
hi Statement guifg=White guibg=NONE gui=NONE
hi Constant guifg=Grey guibg=NONE gui=NONE
"hi Constant guifg=RosyBrown3 guibg=NONE gui=NONE
"hi String guifg=RosyBrown3 guibg=NONE gui=NONE
"hi Special guifg=RosyBrown1 guibg=NONE gui=NONE
"hi Special guifg=Grey guibg=NONE gui=NONE
hi Special guifg=LightGrey guibg=NONE gui=NONE
hi Comment guifg=DarkGrey guibg=NONE gui=italic
hi Todo guifg=Yellow guibg=NONE gui=italic
hi Type guifg=White guibg=NONE gui=NONE
hi LineNr guifg=Grey30 guibg=Grey10 gui=NONE
hi PreProc guifg=White guibg=NONE gui=bold
hi NonText guifg=Grey10 guibg=NONE gui=NONE
hi TabLineSel guifg=Grey guibg=NONE gui=NONE
hi TabLine guifg=Black guibg=Grey gui=NONE
hi Title guifg=DarkRed guibg=NONE gui=NONE
"hi VertSplit guifg=Grey30 guibg=Grey10 gui=NONE
hi Visual guifg=NONE guibg=DeepPink4 gui=NONE
hi PMenu guifg=NONE guibg=RoyalBlue4 gui=NONE
hi PMenuSel guifg=NONE guibg=RoyalBlue3 gui=NONE
hi Identifier guifg=LightSkyBlue guibg=NONE gui=NONE
hi Function guifg=gold guibg=NONE gui=NONE
