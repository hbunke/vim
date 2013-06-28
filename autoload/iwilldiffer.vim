set cpo&vim

let s:iwilldiffer_path = expand('<sfile>:h')

function! SetupDiffer()
python << EOF
import vim
import logging
logname = vim.eval("g:iwilldiffer_debug_log")
if logname is not "":
	console = logging.getLogger("iwilldiffer")
	console.setLevel(logging.INFO)
	handler = logging.FileHandler(filename=logname)
	console.addHandler(handler)
EOF
endfunction

function! DifferRefresh()

if !exists("b:iwilldiffer_cache")
	let b:iwilldiffer_cache=0
endif
if !exists("b:iwilldiffer_dirty")
	let b:iwilldiffer_dirty=1
endif
if !exists("b:iwilldiffer_numsigns")
	let b:iwilldiffer_numsigns=0
endif

python << EOF
import vim

import logging

import os
import sys
import re

iwilldiffer_path = os.path.abspath(os.path.join(vim.eval("s:iwilldiffer_path")))
if iwilldiffer_path not in sys.path:
	sys.path.append(iwilldiffer_path)
del iwilldiffer_path 
from iwilldiffer import *

class NoopLogger(object):
	def log(self, *args, **kwargs):
		pass

class Logger(object):
	def log(self, *args):
		console = logging.getLogger("iwilldiffer")
		console.info(" ".join(map(str, args)))

def get_debugger():
	logname = vim.eval("g:iwilldiffer_debug_log")
	if logname == "":
		return NoopLogger()
	else:
		return Logger()

logger = get_debugger()
cb = vim.current.buffer

def setup_signs():
	signColumn = run_vimcommand("highlight SignColumn")
	bgcolors = extract_bgcolors(signColumn)

	vim.command("highlight lineAdded    guifg=#009900 guibg={guibg} ctermfg=2 ctermbg={ctermbg}".format(**bgcolors))
	vim.command("highlight lineModified guifg=#bbbb00 guibg={guibg} ctermfg=3 ctermbg={ctermbg}".format(**bgcolors))
	vim.command("highlight lineRemoved  guifg=#ff2222 guibg={guibg} ctermfg=1 ctermbg={ctermbg}".format(**bgcolors))

	vim.command("sign define IWillDifferAdd text=+ texthl=lineAdded")
	vim.command("sign define IWillDifferMod text=* texthl=lineModified")
	vim.command("sign define IWillDifferDel text=__ texthl=lineRemoved")

def mark_lines(lines):
	logger.log("Marking lines now")
	old_lines = int(vim.eval("b:iwilldiffer_numsigns"))

	for i, line in enumerate(lines):
		# unplace in two places, see note below
		if i < old_lines:
			vim.command("sign unplace {id} file={fn}".format(
				id = i + 1,
				fn = cb.name,
			))
		name = {
			'a': "IWillDifferAdd",
			'd': "IWillDifferDel",
			'c': "IWillDifferMod",
		}.get(line[0])
		if name is not None:
			vim.command("sign place {id} line={ln} name={name} file={fn}".format(
				id = i + 1,
				ln = line[1],
				name = name,
				fn = cb.name,
			))

	# unplace excess signs
	# have to do this in two places so there's no flash-of-hidden-gutter
	if len(lines) < old_lines:
		for i in xrange(len(lines), old_lines+1):
			vim.command("sign unplace {id} file={fn}".format(
				id = i + 1,
				fn = cb.name,
			))

	vim.command("let b:iwilldiffer_numsigns={lines}".format(lines=len(lines)))

def run():
	if vim.eval("b:iwilldiffer_dirty") == "0":
		logger.log("not dirty, so skipping")
		return

	if not has_diff():
		logger.log("diff not found, not proceding")
		return

	logger.log("Starting up")
	logger.log(" ")
	logger.log(" ")

	if has_hg() and we_are_in_hg(cb.name):
		setup_signs()
		lines = run_hg_diff(cb.name)
		mark_lines(lines)
	elif has_git() and we_are_in_git(cb.name):
		setup_signs()
		lines = run_git_diff(cb.name)
		mark_lines(lines)
	elif has_bzr() and we_are_in_bzr(cb.name):
		setup_signs()
		lines = run_bzr_diff(cb.name)
		logger.log(lines)
		mark_lines(lines)

run()

EOF
endfunction

function! iwilldiffer#DifferRun()
	let b:iwilldiffer_dirty=1
	call DifferRefresh()
endfunction

if !exists("s:iwilldiffer_setup")
	call SetupDiffer()
	let s:iwilldiffer_setup=1
endif

