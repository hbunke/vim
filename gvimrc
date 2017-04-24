"specific GUI config

set background=dark
set guifont=Liberation\ Mono\ 10
if hostname() == 'odo'
    set guifont=Liberation\ Mono\ 11
endif

"colorscheme two2tango
"colorscheme solarized
"colorscheme gruvbox
colorscheme materialbox

" airline themes:
" solarized
" molokai
" tomorrow
" gruvbox
" hybrid
" zenburn
let g:airline_theme = 'tomorrow'

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


