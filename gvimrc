"specific GUI config


" #### colorschemes ####

set background=dark
"colorscheme hbpeachpuff
"colorscheme hb_two2tango
"colorscheme solarized
"colorscheme obsidian2
"colorscheme gruvbox
colorscheme materialbox

"solarized
let g:solarized_contrast='high'
let g:solarized_visibility='high'

"gruvbox
let g:gruvbox_contrast_dark='hard'


" ##### fonts! #############
"set guifont=Courier\ 10\ Pitch\ 11
set guifont=Liberation\ Mono\ 10
"set guifont=Droid\ Sans\ Mono\ 10
"set guifont=Inconsolata\ 10
"set guifont=Source\ Code\ Pro\ 10
"set guifont=Anonymous\ Pro\ 11

" airline themes:
" solarized
" molokai
" tomorrow
" hybrid
" zenburn
let g:airline_theme = 'tomorrow'


" eigentlich ein hack. Warum übernimmt gvim nicht die
" Terminaleinstellung?
set encoding=utf-8

"gui without toolbar
set guioptions-=T

"gui without menu:
"set guioptions-=m

" no left scrollbar
set guioptions-=L

" show tabline always. Avoids that ugly empty (Xmonad) or overlapping (i3)
" space at the bottom of gvim windows
set showtabline=2


source ~/.vim/vimrc

