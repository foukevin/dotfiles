set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "Papadox"

hi Normal guifg=Grey guibg=Black
hi Statement guifg=White guibg=NONE gui=NONE
hi Constant guifg=DarkGrey guibg=NONE gui=NONE
hi Special guifg=White guibg=NONE gui=NONE
hi Comment guifg=DarkGrey guibg=NONE gui=italic
hi Type guifg=White guibg=NONE gui=NONE
hi LineNr guifg=Grey20 guibg=Grey5 gui=NONE
hi PreProc guifg=White guibg=NONE gui=NONE
