"commons für vim und gvim
"

execute pathogen#infect()
Helptags



filetype on
filetype plugin on
filetype plugin indent on
syntax enable

set nowrap 

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
"endlich!
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
set statusline=%<%f\ %y\ %*\ %h%m%r%=%l,%c%V\ %P
"statusline immer an (mit hintergrund etc.)
set laststatus=2
set dir=~/.vimswap
set fileformats=unix,dos




"pydiction
"let g:pydiction_location='~/.vim/pydiction/complete-dict'


""" #### Netrw options ####
"hide menu
let g:netrw_menu=0
" open file in new tab
let g:netrw_browse_split=3
" do not show these filetypes
let g:netrw_list_hide='\.svn,\.pyc,\.hg*'
let g:netrw_hide=1
"make browsing directory current dir
let g:netrw_keepdir=0
" show tree
let g:netrw_liststyle=3
" ### ende netrw options ###

" NERDTree
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror
"autocmd VimEnter * wincmd w
let g:NERDTreeCaseSensitiveSort=1
let g:NERDTreeHijackNetrw=0
let g:NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeShowHidden=1

let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_synchronize_view = 1
let g:nerdtree_tabs_open_on_new_tab = 1


" folding leicht gemacht
function! HB_Folding()
    set foldnestmax=2
    set foldmethod=indent
    set foldcolumn=2
endfunction


""""" keybindings """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map Q gq
" trying to imitate some Pico / jpico settings
map <C-k> dd
map <C-u> p
map <C-j> gqap

"### function key maps ###
map <F12> :execute HB_Folding()<CR>

" toggle tag-list
"map <F11> :TlistToggle <CR>
map <F11> :TagbarToggle <CR>
map <F10> :SyntasticToggleMode <CR>

" toggle filetree
"map <F9> <plug>NERDTreeTabsToggle<CR>
map <F9> <plug>NERDTreeMirrorToggle<CR>

" Wechseln zwischen Fenstern
map <C-Left> <C-W><Left>
map <C-Right> <C-W><Right>
map <C-Up> <C-W><Up>
map <C-Down> <C-W><Down>


"moving tabs; 
"see http://vim.wikia.com/wiki/Move_the_current_tabpage_forward_or_backward
noremap <silent> <M-Left> :exe "silent! tabmove " . (tabpagenr() - 2)<CR>
noremap <silent> <M-Right> :exe "silent! tabmove " . tabpagenr()<CR>

"""""  end keybindings """"""""""""""""""""""""""""""""""""""""""""""""""""""


"automatisches folding und xml-syntax für zope/plone templates
autocmd BufRead *.pt :set syntax=xml filetype=xml foldmethod=syntax 
autocmd BufRead *.zcml :set syntax=xml filetype=xml
autocmd BufRead *.css.dtml :set syntax=css
"autocmd FileType python compiler pylint
autocmd FileType python set number
autocmd BufRead,BufNewFile hg-editor-*.txt :set syntax=hgcommit
"autocmd BufRead *.py :set fo-=t
"autocmd BufNewFile *.py :read ~/.vim/templates/python.py
autocmd BufRead /tmp/mutt* :source ~/.vim/mail.rc

"txt files are supposed to be in markdown. doesn't hurt otherwise
autocmd BufRead *.txt :set syntax=markdown

"Evervim
let g:evervim_devtoken='S=s79:U=813871:E=14ad35941f1:C=1437ba815f9:P=1cd:A=en-devtoken:V=2:H=b2a14a55c6391117b43a725e1fbff2c8'




" ### Taglist options
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_Menu = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Use_Right_Window = 1

"loadview

