" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.
UseVimball
finish
plugin/hgrev.vim	[[[1
126
" vim: set noet nosta sw=4 ts=4 fdm=marker :
"
" HGRev
" Mahlon E. Smith <mahlon@martini.nu>
" $Id: hgrev.vim,v 285603587539 2010/07/07 23:47:28 mahlon $
"
" Simplistic file revision checker, meant for adding current revision
" information to the statusbar, a la:
"
" 	set statusline=[r%{HGRev()}]
"

if exists( 'hgrev_loaded' )
	finish
endif
let hgrev_loaded = '$Rev: 285603587539 $'

" }}}
" Defaults for misc settings {{{
"
if !exists( 'g:hgrevFlags' )
	let g:hgrevFlags = '-nbt'
endif

if !exists( 'g:hgrevAddStatus' )
	let g:hgrevAddStatus = 1
endif

if !exists( 'g:hgrevAutoUpdate' )
	let g:hgrevAutoUpdate = 0
endif

if !exists( 'g:hgrevNoRepoChar' )
	let g:hgrevNoRepoChar = '-'
endif



"}}}
" Commands {{{
"
command! RefreshMercurialRev :call <SID>RefreshMercurialRev()


" HGRev() {{{
" Return the current buffer rev id from the global dictionary.
"
function! HGRev()
	if exists( 'g:hg_revs' )
		let l:key = getcwd() . '/' . bufname('%')
		return has_key(g:hg_revs, l:key) ? g:hg_revs[l:key] : g:hgrevNoRepoChar
	else
		call <SID>RefreshMercurialRev()
		call HGRev()
	endif
endfunction


" }}}
" RefreshMercurialRev() {{{
"
" Locate the hgroot and fetch the current rev id, populating the global
" dictionary.
"
function! <SID>RefreshMercurialRev()
	if ! exists( 'g:hg_revs' )
		let g:hg_revs = {}
	endif

	" Find the closest HG root for the buffer. 'hg root' won't do it, since
	" it works off the cwd, and we need the nearest root from the filename.
	"
	let l:searchpaths = split( expand('%:p:h'), '/' )
	let l:dircount = len(l:searchpaths)
	let l:root = ''
	while l:dircount > 0
		let l:root = '/' . join( l:searchpaths[0 : l:dircount], '/' )
		if isdirectory( l:root . '/' . '.hg' )
			break
		endif
		let l:dircount = l:dircount - 1
	endwhile

	if l:dircount == -1
		return
	endif

	let l:key = getcwd() . '/' . bufname('%')

	" Find the rev for the repo containing the current file buffer.
	"
	let l:cmd     = 'hg id ' . g:hgrevFlags . ' ' . l:root
	let l:rev     = system( l:cmd )
	let l:hg_exit = v:shell_error

	if l:hg_exit == 0
		let l:rev = substitute( l:rev, '\n', '', 'g' )
		let g:hg_revs[ l:key ] = l:rev
	endif

	" Add file repo status.
	"
	if g:hgrevAddStatus == 1
		let l:cmd     = 'hg stat ' . bufname('%')
		let l:stat    = system( l:cmd )
		let l:hg_exit = v:shell_error

		if l:hg_exit == 0 && len(l:stat) > 0
			let l:stat = split( l:stat, '\s\+' )[0]
			let g:hg_revs[ l:key ] = g:hg_revs[ l:key ] . ' ' . l:stat
		endif
	endif

	return
endfunction
"}}}


" Refresh the rev for the current buffer on reads/writes.
"
if g:hgrevAutoUpdate == 1
	autocmd BufReadPost          * call <SID>RefreshMercurialRev()
	autocmd BufWritePost         * call <SID>RefreshMercurialRev()
	autocmd FileChangedShellPost * call <SID>RefreshMercurialRev()
endif

doc/hgrev.txt	[[[1
167
*hgrev.txt* Last change: $Id: hgrev.txt,v 88c3c5bc695a 2010/07/07 23:53:39 mahlon $

                VIM REFERENCE MANUAL    by Mahlon E. Smith


                                   HGRev

A simple plugin for showing the current buffer's HG revision           *HGRev*
==============================================================================
CONTENTS                                                       *HGRevContents*


    1) Intro........................................|HGRevIntro|
    2) Configuration................................|HGRevOptions|
        2.1) Altering revision info shown...........|g:hgrevFlags|
        2.2) Appending file status info.............|g:hgrevAddStatus|
        2.3) Automatically updating status..........|g:hgrevAutoUpdate|
        2.4) Changing non-repo buffer behavior......|g:hgrevNoRepoChar|
    3) Author.......................................|HGRevAuthor|
    4) License......................................|HGRevLicense|



==============================================================================
1. INTRO                                                          *HGRevIntro*

HGRev is a small plugin that can find the current buffer's revision ID from a
Mercurial repository.  For more information on Mercurial, see:

	http://mercurial.selenic.com/

It is intended for use in the |statusline|- here's an example to enable it:

	set statusline=[r%{HGRev()}] ~

HGRev exports the 'HGRev()' function (for use in the statusline), and a
command called
>
	:RefreshMercurialRev

Which you can use to manually update the revision information for the current
buffer.  If you've added HGRev() to your statusline, you'll see the file
revision, branch, tags, and file status reflected -- if you used the
statusline example above, you should see something like this:

	[r192+ default tip M] ~

The information displayed can be easily customized, and HGRev can also
automatically update the status line on file changes.  (This behavior is
disabled by default.)


==============================================================================
2. CONFIGURATION-OPTIONS                                        *HGRevOptions*

Here are the available configuration options and their defaults:
>
	let g:hgrevFlags = '-nbt'
	let g:hgrevAddStatus = 1
	let g:hgrevAutoUpdate = 0
	let g:hgrevNoRepoChar = '-'


------------------------------------------------------------------------------
2.1                                                             *g:hgrevFlags*

These are the flags passed directly to 'hg id'.  The flags "-nbt" are passed
by default, which show a local rev id, branch, and tags.

If you wanted to show the global rev hash (and nothing else) as an example,
you can set this to:
>
	let g:hgrevFlags = '-i'


------------------------------------------------------------------------------
2.2                                                         *g:hgrevAddStatus*

This settings will append the current file status to the output, by running
'hg stat'.  I find it useful, so it is enabled by default -- you can disable
it like so:
>
	let g:hgrevAddStatus = 0
>

------------------------------------------------------------------------------
2.3                                                        *g:hgrevAutoUpdate*
>
When this option is enabled, some |autocmd-events| are added that
automatically call :RefreshMercurialRev on file changes -- when a buffer is
read, written to, or modified outside of Vim.  This is disabled by default, as
the additional time needed (however small) to system() to hg for every
read/write outweighs running :RefreshMercurialRev manually for my tastes.
Yours tastes, of course, may vary, so you can enable it like so:
>
	let g:hgrevAutoUpdate = 1

Alternatively, you can leave it disabled, and add your own |autocmd| events
for :RefreshMercurialRev to what works best for you.


------------------------------------------------------------------------------
2.4                                                        *g:hgrevNoRepoChar*
>
If the current buffer doesn't seem to be a member of a Mercurial repository,
HGRev() returns this character instead of a revision ID.

Some examples:
>
	let g:hgrevNoRepoChar = '-'    (default)
	set statusline=[r%{HGRev()}]

This will output something like '[r12+ default tip M]' for repo files,
and '[r-]' for non-repo.
>
	let g:hgrevNoRepoChar = ''
	set statusline=%{HGRev()?'[r'.HGRev().']':''}

This will output something like '[r512 default tip]' for repo files, and
nothing at all for non-repo.


==============================================================================
3. AUTHOR                                                          *HGRAuthor*

HGRev was written by Mahlon E. Smith.

    mahlon@martini.nu ~
    http://www.martini.nu/ 



==============================================================================
4. LICENSE                                                      *HGRevLicense*

HGRev is distributed under the BSD license.
    http://www.opensource.org/licenses/bsd-license.php
>
    Copyright (c) 2010, Mahlon E. Smith <mahlon@martini.nu>
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are
    met:

        * Redistributions of source code must retain the above copyright
          notice, this list of conditions and the following disclaimer.

        * Redistributions in binary form must reproduce the above copyright
          notice, this list of conditions and the following disclaimer in the
          documentation and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
    A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
    OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
    TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
    LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
    NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.



vim: set noet nosta sw=4 ts=4 ft=help :
