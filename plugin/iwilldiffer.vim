" vim plugin: iwilldiffer
"
" Enables live view of git add/delete/mod status
"
" Copyright (C) 2011 by Shu Zong Chen <shu.chen@freelancedreams.com>
" 
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
" 
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

if exists("s:iwilldiffer_plugin_loaded")
    finish
endif
let s:iwilldiffer_plugin_loaded=1

if !exists("g:iwilldiffer_check_on_open")
		let g:iwilldiffer_check_on_open=0
endif

if !exists("g:iwilldiffer_check_on_save")
		let g:iwilldiffer_check_on_save=0
endif

if !exists("g:iwilldiffer_debug_log")
		let g:iwilldiffer_debug_log=""
endif

let s:running_windows = has("win16") || has("win32") || has("win64")

if s:running_windows
		finish " screw you windows
endif

let s:uname = system('uname')

let g:iwilldiffer_has_git = executable('git')
let g:iwilldiffer_has_hg = executable('hg')
let g:iwilldiffer_has_bzr = executable('bzr')
let g:iwilldiffer_has_diff = executable('diff')

command! DifferRun call iwilldiffer#DifferRun()
autocmd BufReadPost * if g:iwilldiffer_check_on_open | call iwilldiffer#DifferRun() | endif
autocmd BufWritePost * if g:iwilldiffer_check_on_save | call iwilldiffer#DifferRun() | endif
"autocmd BufLeave * call DifferRefresh()
"autocmd BufEnter * call DifferRefresh()
"autocmd TabLeave * call DifferRefresh()
"autocmd TabEnter * call DifferRefresh()
