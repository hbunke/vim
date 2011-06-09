"commons für vim und gvim

set nowrap 
set formatoptions+=t
set textwidth=79
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

"xml-plugin
let xml_no_auto_nesting = 1
"let xml_tag_completion_map = "/"

"statusline immer an (mit hintergrund etc.)
"set laststatus=2

"dateiname in tabs einfach, ohne pfad. Plus Tabnr.
set gtl=[%N]\ %t

set nocp
filetype on
filetype plugin on
filetype plugin indent on
set ofu=syntaxcomplete#Complete


" #### Netrw options ####

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


" projekte haben sonst immer die swap-file mit drin; nervt bei rsync und
" svn
set dir=~/.vimswap

syntax enable

set fileformats=unix,dos

map Q gq


" trying to imitate some Pico / jpico settings
map <C-k> dd
map <C-u> p
map <C-j> gqap

" delete the current word in insert mode
imap <C-BS> <C-w>


"autocmd!
"automatisches folding und xml-syntax für zope/plone templates
autocmd BufRead *.pt :set syntax=xml filetype=xml foldnestmax=5 foldmethod=syntax fo-=t
autocmd BufRead *.zcml :set syntax=xml filetype=xml
autocmd BufRead *.css.dtml :set syntax=css

autocmd FileType python compiler pylint
autocmd FileType python set number
let g:pylint_onwrite = 0
autocmd BufRead,BufNewFile hg-editor-*.txt :set syntax=hgcommit



"autocmd BufRead *.py :set fo-=t
"autocmd BufNewFile *.py :read ~/.vim/templates/python.py

" #### Python.vim syntax options ####
let python_highlight_builtins = 1
let python_highlight_exceptions = 1
let python_highlight_string_formatting = 1
let python_highlight_string_format = 1
let python_highlight_string_templates = 1
let python_highlight_indent_errors = 0
let python_highlight_space_errors = 0
let python_highlight_doctests = 1
"
"does not override any of the above!
" let python_highlight_all = 1

" ### Taglist options
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_Menu = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Enable_Fold_Column = 0


" Wechseln zwischen Fenstern
map <C-Left> <C-W><Left>
map <C-Right> <C-W><Right>
map <C-Up> <C-W><Up>
map <C-Down> <C-W><Down>


"moving tabs; 
"see http://vim.wikia.com/wiki/Move_the_current_tabpage_forward_or_backward
noremap <silent> <M-Left> :exe "silent! tabmove " . (tabpagenr() - 2)<CR>
noremap <silent> <M-Right> :exe "silent! tabmove " . tabpagenr()<CR>


" folding leicht gemacht
function! HB:Folding()
    set foldnestmax=2
    set foldmethod=indent
    set foldcolumn=2
endfunction

"### function key maps ###
map <F12> :execute HB:Folding()<CR>

" toggle tag-list
map <F11> :TlistToggle <CR>

" open current directory in vertical split window
map <F10> :vs . <CR>

"go to first tabpage, useful if tab 1 has the filebrowsing window
map <F9> :tabfirst <CR>


" testing toggle filebrowser toggle
" funktioniert alles noch nicht 100%ig
"function! HB:ToggleFilebrowser()
"   let tabpagenr = tabpagenr()
"   let buffers_in_tab = tabpagebuflist()
"   let key = 'netrw_magickeep'
"        
"   if len(buffers_in_tab) > 1
"       for bnu in buffers_in_tab
"           "let b:bufwinnr = bufwinnr(bnu)
"           exe bufwinnr(bnu) . "wincmd w"
"           let b:bufwinnr = bufwinnr(bnu)
"           let b:winvars = gettabwinvar(tabpagenr, b:bufwinnr, '')
"           if has_key(b:winvars, key)
"               echo "Buffer number" bnu "has key; closing"
"               close
"           endif
"       endfor
"   else
"       execute ":vs ."
"   endif
"endfunction
"map <F8> :execute HB:ToggleFilebrowser()<CR>

autocmd BufRead /tmp/mutt* :source ~/.vim/mail.rc

loadview

