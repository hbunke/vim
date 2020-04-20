" vim config
" gvimrc overrrides this eventually
"

filetype on
filetype plugin on
filetype plugin indent on
syntax enable


map <C-j> gqap

" terminala
set background=dark
set t_Co=256
set mouse=a
"set termguicolors

"gruvbox
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_invert_signs=1
" let g:gruvbox_improved_strings=1

" colors for terminal only. gvimrc overwrites this
colorscheme gruvbox
"colorscheme solarized
" colorscheme two2tango
" colorscheme zenburn
" colorscheme rdark-terminal

" airline themes:
"solarized
" molokai
" tomorrow
" gruvbox
" hybrid
" zenburn
" powerlineish
let g:airline_theme = 'gruvbox'
'

"solarized
let g:solarized_contrast='high'
let g:solarized_visibility='high'

" comments always italic; does work in terminal with Roxterm, not 
" with xfce-terminal.
hi Comment cterm=italic gui=italic

set encoding=utf-8

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


set wildignore=*.pyc
" set hidden
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
set switchbuf=useopen,split
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
let g:netrw_list_hide='\.svn,\.pyc,\.hg*,\.git*,\.aux,\.bbl,\.bcf'
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
let g:NERDTreeIgnore = ['\.pyc$', '\.git$', 'Paste*', '\.egg-info$', '\.aux', '\.bbl', '\.bcf', '\.blg', '\.fdb_latexmk', '\.fls', '\.run.xml', '\.synctex.gz', '\.log' ]
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=31

let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_synchronize_view = 1
let g:nerdtree_tabs_open_on_new_tab = 1

" map <F9> :NERDTreeToggle<CR>
map <F9> <plug>NERDTreeTabsToggle<CR>


" Ack
" use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag -f -Q --vimgrep'
endif
" highlight search term
let g:ackhighlight = 1
" don't jump to the first result
cnoreabbrev Ack Ack!

" ack shortcut
noremap <Leader>f :Ack!<space>

" Airline
" let g:airline#extensions#tabline#enabled=1
" only filename in tabline
" let g:airline#extensions#tabline#fnamemod = ':t'


" folding 
function! HB_Folding()
    set foldnestmax=2
    set foldmethod=indent
    set foldcolumn=2
endfunction

" disable automatic markdown folding:
let g:vim_markdown_folding_disabled = 1


""""" keybindings """"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"make that link jumping in vim help easier
nmap t <C-]>

map Q gq
" trying to imitate some oooold Pico / jpico settings
map <C-k> dd
map <C-j> gqap
map <Leader>p "+gP

" <C-v> for blockwise visual mode does not work in terminal
map <Leader>v <C-V>


"### function key maps ###
" XXX need to put Tagbar on F12, since F11 does not work in terminal. Folding
" can be done without the shortcut function<
" map <F12> :execute HB_Folding()<CR>
map <F12> :TagbarToggle <CR>
map <F10> :SyntasticToggleMode <CR>


"map <F8> :BuffergatorToggle<cr>
"let g:buffergator_viewport_split_policy="L"
"let g:buffergator_sort_regime="mru"
"let g:buffergator_mru_cycle_local_to_window=0


" flake8
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
let g:flake8_max_markers=500


" Wechseln zwischen Fenstern
map <C-Left> <C-W><Left>
map <C-Right> <C-W><Right>
map <C-Up> <C-W><Up>
map <C-Down> <C-W><Down>

" with full screen make the left window resize accordingly (master window, like
" in xmonad
map <Leader>m :vertical resize 133<cr>


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
" nix mail
autocmd BufRead /run/user/*/mutt* :source ~/.vim/mail.rc
autocmd BufRead *.nix :set syntax=nix
"txt files are supposed to be in markdown. doesn't hurt otherwise
autocmd BufRead *.txt :set syntax=markdown

" xml is not handled automatically by vim-jinja
autocmd BufRead,BufNewFile ~/dev/edawax/*/*.xml :set syntax=htmljinja

" ### Taglist options
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_Menu = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Use_Right_Window = 1

" ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_match_window='bottom,order:ttb,results:20'
map <Leader>b :CtrlPBuffer<cr>
" just in case I fall back into old habits
map <F8> :CtrlPBuffer<cr>

" search over the cwd, not only the git repository
let g:ctrlp_working_path_mode = 'wa'
" follow symlinks
let g:ctrlp_follow_symlinks = 2
let g:ctrlp_max_files = 50000

"YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1

" haskell vim
let hs_hightlight_types = 1
let hs_highlight_more_types = 1
let hs_highlight_boolean = 1

