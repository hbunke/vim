" Vim color file
" Maintainer: David Ne\v{c}as (Yeti) <yeti@physics.muni.cz>
" Last Change: 2003-04-23
" URL: http://trific.ath.cx/Ftp/vim/colors/peachpuff.vim

" This color scheme uses a peachpuff background (what you've expected when it's
" called peachpuff?).
"
" Note: Only GUI colors differ from default, on terminal it's just `light'.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is heavily modified by HB; used only for gvim, so no cterm and term
" 2009-10-08
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "hbpeachpuff"

hi Normal guibg=PeachPuff guifg=Black

hi SpecialKey guifg=Blue
hi NonText gui=bold guifg=Blue
hi Directory guifg=Blue
hi ErrorMsg gui=bold guifg=White guibg=Red
hi IncSearch gui=reverse
hi Search guibg=Gold2
hi MoreMsg gui=bold guifg=SeaGreen
hi ModeMsg gui=bold
hi LineNr guifg=Gray60
"hi LineNr guifg=Red3
hi Question gui=bold guifg=SeaGreen
hi StatusLine gui=bold guifg=White guibg=Black ctermfg=white ctermbg=black cterm=bold
hi StatusLineNC gui=bold guifg=PeachPuff guibg=Gray45
hi VertSplit gui=bold guifg=White guibg=Gray45
hi Title gui=bold guifg=DeepPink3
hi Visual gui=reverse guifg=Grey80 guibg=fg
hi VisualNOS gui=bold,underline
hi WarningMsg gui=bold guifg=Red
hi WildMenu guifg=Black guibg=Yellow
hi Folded guifg=Black guibg=#e3c1a5
hi FoldColumn guifg=darkred guibg=Gray80
hi DiffAdd guibg=White
hi DiffChange guibg=#edb5cd
hi DiffDelete gui=bold guifg=LightBlue guibg=#f6e8d0
hi DiffText gui=bold guibg=#ff8060
hi Cursor guifg=bg guibg=fg
hi lCursor guifg=bg guibg=fg

hi ColorColumn ctermbg=lightgrey guibg=Gray50

hi HGRev guifg=white gui=bold guibg=darkred ctermbg=darkred ctermfg=white cterm=bold

" Colors for syntax highlighting
" see http://www.vim.org/htmldoc/syntax.html#{group-name}
hi Comment guifg=#406090 gui=italic
hi Constant guifg=#c00058
hi Special guifg=SlateBlue
hi Identifier guifg=DarkCyan gui=bold
hi Statement gui=bold guifg=Brown
hi PreProc guifg=brown gui=bold
hi Type gui=bold guifg=SeaGreen
hi Ignore guifg=bg
hi Error gui=bold guifg=White guibg=Red
hi Todo guifg=Blue guibg=Yellow


