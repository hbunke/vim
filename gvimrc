"specific GUI config

set guifont=Liberation\ Mono\ 10
if hostname() == 'odo'
    set guifont=Liberation\ Mono\ 11

"colorscheme hbpeachpuff
"colorscheme hb_two2tango
"colorscheme solarized
"colorscheme gruvbox
colorscheme materialbox

"solarized
let g:solarized_contrast='high'
let g:solarized_visibility='high'

"gruvbox
let g:gruvbox_contrast_dark='hard'

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

set linespace=4


