" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file

" term grundsaetzlich raus; HB

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "hb"

" Definitionen
hi Comment ctermfg=lightblue guifg=#404040 gui=italic

"hi Normal ctermfg=black ctermbg=white guibg=PeachPuff guifg=black
hi Normal ctermfg=black  ctermbg=white guibg=#ededed guifg=black
"hi Normal ctermfg=black ctermbg=white guibg=#f4f4f4 guifg=black

hi Constant ctermfg=darkred
hi Special ctermfg=lightblue cterm=bold
hi Delimiter ctermfg=Black cterm=bold guifg=black gui=bold
hi Identifier ctermfg=darkcyan cterm=bold guifg=#4b4b4b gui=bold
"hi Identifier ctermfg=darkblue cterm=bold guifg=#4c679e gui=bold
hi Statement  ctermfg=darkred cterm=bold guifg=darkgreen gui=bold
hi String ctermfg=darkred cterm=none guifg=#671313
hi PreProc ctermfg=lightblue cterm=bold guifg=brown gui=bold
hi Type ctermfg=darkgreen cterm=bold gui=bold guifg=darkred
hi Visual ctermfg=black ctermbg=white gui=NONE guifg=Black guibg=Yellow
hi Search ctermfg=Black ctermbg=Cyan gui=NONE guifg=Black guibg=Cyan
hi Tag ctermfg=DarkGreen cterm=bold guifg=DarkGreen gui=bold
hi Error ctermfg=darkgrey guibg=Red guifg=White
hi Todo ctermbg=Yellow ctermfg=Black guifg=white gui=bold guibg=orange
hi StatusLine ctermfg=yellow ctermbg=black gui=bold guifg=white guibg=#494d59
"hi StatusLine ctermfg=yellow ctermbg=black gui=NONE guifg=#fad184 guibg=#494d59
hi Title ctermfg=black cterm=bold guifg=black gui=bold
hi Visual guibg=grey
hi TabLineFill ctermbg=DarkGrey guifg=grey gui=italic
hi TabLineSel ctermbg=yellow ctermfg=black cterm=bold,underline gui=underline
hi TabLine ctermfg=white cterm=underline,bold ctermbg=black
hi LineNr ctermfg=darkred cterm=none guifg=darkgrey
hi Foldcolumn guibg=#d3d3d3 guifg=brown
hi Folded guifg=darkred gui=italic
hi VertSplit gui=italic guifg=black guibg=#DCD5D0



" Verknüpfungen
hi! link MoreMsg Comment
hi! link ErrorMsg Visual
hi! link WarningMsg ErrorMsg
hi! link Question Comment
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Constant
hi link Float		Number
hi link Function	Identifier
hi link Conditional	Identifier
hi link Repeat	Identifier
hi link Label		Identifier
hi link Operator	Identifier
hi link Keyword	    Identifier
hi link Exception	Identifier
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link SpecialChar	Special
hi link SpecialComment Special
hi link Debug		Special
