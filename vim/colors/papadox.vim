set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "Papadox"

hi Normal guifg=Grey guibg=Black gui=NONE
hi Statement guifg=White guibg=NONE gui=NONE
hi Constant guifg=Grey guibg=NONE gui=NONE
"hi Constant guifg=RosyBrown3 guibg=NONE gui=NONE
"hi String guifg=RosyBrown3 guibg=NONE gui=NONE
"hi Special guifg=RosyBrown1 guibg=NONE gui=NONE
"hi Special guifg=Grey guibg=NONE gui=NONE
hi Special guifg=White guibg=NONE gui=NONE
hi Comment guifg=DarkGrey guibg=NONE gui=italic
hi Todo guifg=Yellow guibg=NONE gui=italic
hi Type guifg=White guibg=NONE gui=NONE
hi LineNr guifg=Grey30 guibg=Grey10 gui=NONE
hi PreProc guifg=White guibg=NONE gui=NONE
hi NonText guifg=Grey10 guibg=NONE gui=NONE
hi TabLineSel guifg=Grey guibg=NONE gui=NONE
hi TabLine guifg=Black guibg=Grey gui=NONE
hi Title guifg=DarkRed guibg=NONE gui=NONE
"hi VertSplit guifg=Grey30 guibg=Grey10 gui=NONE
