syntax region doctest_value start=+^\s\{2,4}+ end=+$+
"syntax region doctest_code start=+\s\+[>.]\{3}+ end=+$+ contains=pythonBuiltin,pythonStatement,pythonConditional,pythonRepeat,pythonOperator,pythonInclude
syntax region doctest_code start=+\s\+[>.]\{3}+ end=+$+
syntax region doctest_literal start=+`\++ end=+`\++

syntax region doctest_header start=+=\+\n\w\++ start=+\w.\+\n=\++ end=+=$+
syntax region doctest_header start=+-\+\n\w\++ start=+\w.\+\n-\++ end=+-$+
syntax region doctest_header start=+\*\+\n\w\++ start=+\w.\+\n\*\++ end=+\*$+

syntax region doctest_note start=+\.\{2} \[+ end=+(\n\n)\|\%$+
syntax keyword doctest_todo    FIXME TODO XXX NOTE NOTES
syntax match doctest_comment "#.*$" contains=doctest_todo



" taken from python vim
"   syn keyword pythonBuiltin	False True None
"   syn keyword pythonBuiltin	NotImplemented Ellipsis __debug__
"   " built-in functions
"   syn keyword pythonBuiltin	abs all any bin bool chr classmethod
"   syn keyword pythonBuiltin	compile complex delattr dict dir divmod
"   syn keyword pythonBuiltin	enumerate eval filter float format
"   syn keyword pythonBuiltin	frozenset getattr globals hasattr hash
"   syn keyword pythonBuiltin	help hex id input int isinstance
"   syn keyword pythonBuiltin	issubclass iter len list locals map max
"   syn keyword pythonBuiltin	min next object oct open ord pow print
"   syn keyword pythonBuiltin	property range repr reversed round set
"   syn keyword pythonBuiltin	setattr slice sorted staticmethod str
"   syn keyword pythonBuiltin	sum super tuple type vars zip __import__
"   " Python 2.6 only
"   syn keyword pythonBuiltin	basestring callable cmp execfile file
"   syn keyword pythonBuiltin	long raw_input reduce reload unichr
"   syn keyword pythonBuiltin	unicode xrange

"   syn keyword pythonStatement	False, None, True
"   syn keyword pythonStatement	as assert break continue del exec global
"   syn keyword pythonStatement	lambda nonlocal pass print return with yield
"   syn keyword pythonStatement	class def nextgroup=pythonFunction skipwhite
"   syn keyword pythonConditional	elif else if
"   syn keyword pythonRepeat	for while
"   syn keyword pythonOperator	and in is not or
"   syn keyword pythonException	except finally raise try
"   syn keyword pythonInclude	from import



""hi link doctest_header Statement
hi link doctest_code Special
hi link doctest_value Define
hi link doctest_literal Comment
hi link doctest_note Comment
hi link doctest_todo Todo
hi link doctest_comment Comment


"   hi link pythonBuiltin Function
"   hi link pythonStatement	Statement
"   hi link pythonConditional	Conditional
"   hi link pythonRepeat		Repeat
"   hi link pythonOperator		Operator
"   hi link pythonException	Exception
"   hi link pythonInclude		Include
"   hi link pythonDecorator	Define
"   hi link pythonFunction		Function
"   hi link pythonComment		Comment
"   hi link pythonTodo		Todo
"   hi link pythonString		String
"   hi link pythonRawString	String
"   hi link pythonEscape		Special


