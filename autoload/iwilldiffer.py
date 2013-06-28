import vim
import re
import os.path
import subprocess

def has_diff():
	return vim.eval("g:iwilldiffer_has_diff") != 1

def has_hg():
	return vim.eval("g:iwilldiffer_has_hg") != 1

def has_git():
	return vim.eval("g:iwilldiffer_has_git") != 1

def has_bzr():
	return vim.eval("g:iwilldiffer_has_bzr") != 1

diff_match = re.compile(r'^(\d+)(?:,(\d+))?([acd])(\d+)(?:,(\d+))?$')
ctermbg_match = re.compile(r'ctermbg=(\w+)')
guibg_match = re.compile(r'guibg=(\w+)')

def we_are_in_hg(fn):
	dn = os.path.dirname(fn)
	if os.path.isdir(os.path.join(dn, ".hg")):
		return True
	cmd = "hg -q stat"
	output, code = run_command(cmd, dn)
	return code == 0

def we_are_in_git(fn):
	dn = os.path.dirname(fn)
	if os.path.isdir(os.path.join(dn, ".git")):
		return True
	cmd = "git rev-parse --is-inside-work-tree"
	output, code = run_command(cmd, dn)
	if len(output) and output[0].strip().upper() == "TRUE":
		return True
	return False

def we_are_in_bzr(fn):
	dn = os.path.dirname(fn)
	if os.path.isdir(os.path.join(dn, ".bzr")):
		return True
	cmd = "bzr status"
	output, code = run_command(cmd, dn)
	return code == 0

def parse_diff_output(output):
	ret = []
	for line in output:
		m = diff_match.match(line)
		if m:
			action = m.group(3)
			l_start = int(m.group(4))
			l_end = int(m.group(5) or l_start)
			for i in xrange(l_start, l_end+1):
				ret.append((action, i))
	vim.command("let b:iwilldiffer_dirty=0")
	return ret

def run_hg_diff(fn):
	dn = os.path.dirname(fn)
	cmd = "hg --config extensions.hgext.extdiff= extdiff -p diff {0}".format(fn)
	output, code = run_command(cmd, dn)
	return parse_diff_output(output)
	
def run_git_diff(fn):
	dn = os.path.dirname(fn)
	cmd = "git difftool --extcmd=diff -y {0}".format(fn)
	output, code = run_command(cmd, dn)
	return parse_diff_output(output)

def run_bzr_diff(fn):
	dn = os.path.dirname(fn)
	cmd = "bzr diff --diff-options --normal {0}".format(fn) # --diff-options
	output, code = run_command(cmd, dn)
	return parse_diff_output(output)

def run_command(cmd, cwd=None):
	proc = subprocess.Popen(cmd.split(), cwd=cwd, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
	code = proc.wait()
	return proc.stdout.readlines(), code

def run_vimcommand(cmd):
	"""Run a vimcommand and capture its output"""
	vim.command("redir => l:output")
	# TODO: this could probably use some sanitizing of cmd:
	vim.command("silent! exec '{0}'".format(cmd))
	vim.command("redir END")
	return vim.eval("l:output")

def extract_bgcolors(hl):
	"""Take output of 'highlight' and extract the bgcolors if any"""
	ret = {}
	m = ctermbg_match.search(hl)
	ret['ctermbg'] = m.group(1) if m else 'NONE'
	m = guibg_match.search(hl)
	ret['guibg'] = m.group(1) if m else 'NONE'
	return ret
