"commons for vim und gvim
"

set background=dark
" Tab colors for terminal:
hi TabLineSel ctermfg=White ctermbg=Green
hi TabLine ctermfg=White ctermbg=Blue

" comments in terminal always italic; does work with Roxterm, does not work
" with xfce-terminal
hi Comment cterm=italic



filetype on
filetype plugin on
filetype plugin indent on
syntax enable

set nowrap 

" small but unvaluable!
set wildmenu

let mapleader = ","

" helpful for quicklist file open
" set switchbuf+=newtab

" formatoptions:
" c - autowrap COMMENTS using textwidth
" r - insert comment leader (?) on <enter>
" o - insert comment leader on 'o' or 'O'
" q - gq formats comments (?)
" n - recon numbered lists
" v - wrap on blanks
" t - autowrap TEXT using textwidth
set formatoptions+=tcrq

set textwidth=79
"set colorcolumn=80
"set cc=+1

set backspace=2
set showmode
set showcmd
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent
set smartindent
set syn=auto
set title
set titleold=""
set ruler
set hlsearch
set switchbuf=newtab
set nocp
set ofu=syntaxcomplete#Complete
"dateiname in tabs einfach, ohne pfad. Plus Tabnr.
set gtl=[%N]\ %t

"set statusline=%<%f\ %y\ %*\ %h%m%r%=%l,%c%V\ %P %{fugitive#statusline()}
set statusline=%<%f\ %y\ %*\ %h%m%r%=%l,%c%V\ %P
set statusline+=\ \ %{fugitive#statusline()}

"statusline immer an (mit hintergrund etc.)
set laststatus=2
set dir=~/.vimswap
set fileformats=unix,dos

" unnamed register to system clipboard
set clipboard+=unnamed



""" #### Netrw options ####
"hide menu
let g:netrw_menu=0
" open file in new tab
let g:netrw_browse_split=3
" do not show these filetypes
let g:netrw_list_hide='\.svn,\.pyc,\.hg*,\.git*'
let g:netrw_hide=1
"make browsing directory current dir
let g:netrw_keepdir=0
" show tree
let g:netrw_liststyle=3

" NERDTree
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror
"autocmd VimEnter * wincmd w
let g:NERDTreeCaseSensitiveSort=1
let g:NERDTreeHijackNetrw=1
let g:NERDTreeIgnore = ['\.pyc$', '\.git$', 'Paste*', '\.egg-info$' ]
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=31

let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_synchronize_view = 1
let g:nerdtree_tabs_open_on_new_tab = 1

" map <F9> :NERDTreeToggle<CR>
map <F9> <plug>NERDTreeTabsToggle<CR>


" ack.vim with ag
if executable('ag')
  let g:ackprg = 'ag -f --vimgrep'
endif

" don't jump to the first result
cnoreabbrev Ack Ack!

" ack shortcut
noremap <Leader>f :Ack!<space>



" folding 
function! HB_Folding()
    set foldnestmax=2
    set foldmethod=indent
    set foldcolumn=2
endfunction


""""" keybindings """"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"make that link jumping in vim help easier
nmap t <C-]>

map Q gq
" trying to imitate some oooold Pico / jpico settings
map <C-k> dd
map <C-u> p
map <C-j> gqap

"### function key maps ###
map <F12> :execute HB_Folding()<CR>
map <F11> :TagbarToggle <CR>
map <F10> :SyntasticToggleMode <CR>

map <F8> :BuffergatorToggle<cr>
let g:buffergator_viewport_split_policy="L"
let g:buffergator_sort_regime="mru"
let g:buffergator_mru_cycle_local_to_window=0


" flake8
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
let g:flake8_max_markers=500


" Wechseln zwischen Fenstern
map <C-Left> <C-W><Left>
map <C-Right> <C-W><Right>
map <C-Up> <C-W><Up>
map <C-Down> <C-W><Down>

"moving tabs; 
"see http://vim.wikia.com/wiki/Move_the_current_tabpage_forward_or_backward
" XXX does not work with Xmonad
noremap <silent> <M-Left> :exe "silent! tabmove " . (tabpagenr() - 2)<CR>
noremap <silent> <M-Right> :exe "silent! tabmove " . tabpagenr()<CR>




"""""  end keybindings """"""""""""""""""""""""""""""""""""""""""""""""""""""


"folding and xml-syntax for zope/plone templates
autocmd BufRead *.pt :set syntax=xml filetype=xml foldmethod=syntax 
autocmd BufRead *.zcml :set syntax=xml filetype=xml
autocmd BufRead *.css.dtml :set syntax=css
autocmd FileType python set number
autocmd BufRead,BufNewFile hg-editor-*.txt :set syntax=hgcommit
"autocmd BufRead *.py :set fo-=t
autocmd BufRead /tmp/mutt* :source ~/.vim/mail.rc
autocmd BufRead *.nix :set syntax=nix

"txt files are supposed to be in markdown. doesn't hurt otherwise
autocmd BufRead *.txt :set syntax=markdown

" ### Taglist options
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_Menu = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Use_Right_Window = 1


let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" airline themes:
" solarized
" molokai
" tomorrow
" hybrid
" zenburn
let g:airline_theme = 'tomorrow'


