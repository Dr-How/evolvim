" Language: Surface evolver
" Maintainter: Hao Chen
" Last Change: 2016 Mar 13
"
" TODO:
" - Different indentation before and after read;

if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

" setlocal cindent cinoptions& cinoptions+=L0
setlocal nolisp nocindent
setlocal autoindent
setlocal indentexpr=GetEvolverIndent()

if exists ("*GetEvolverIndent")
	finish
endif

function! GetEvolverIndent()
	let l:prevlnum = prevnonblank(v:lnum-1)
	if l:prevlnum == 0 " beginning of file
		return 0
	endif

	let l:readlnum = search('^read$', "nw")
	if v:lnum <= l:readlnum " before read
		return 0
	endif

	let l:prevl = substitute(getline(l:prevlnum), '//.*$', '', '')
	let l:ind = indent(l:prevlnum)
	if l:prevl =~ '\\\s*$' " line continuation
		return l:ind + 2
	endif

	if l:prevl =~ '{[^}]*$' || l:prevl=~ '([^)]*$' " opening
		let l:ind += &sw
	endif

	let l:thisl = substitute(getline(v:lnum), '//.*$', '', '')
	if l:thisl =~ '^[^{]*}' || l:thisl =~ '^[^(]*)' "closing
		let l:ind -= &sw
	endif

	return l:ind

	" let lnum1 = SkipBlanksAndComments(v:lnum-1)
	" silent normal! 0[{
	" let lnum2 = line('.')
	" if getline(lnum1) =~ ':='
	" 	if lnum2==lnum1
	" 		return indent(lnum1)+&sw
	" 	else
	" 		return indent(lnum1)
	" 	endif
	" 	" silent normal! O;<Esc>
	" 	" silent normal! u
	" 	" return ind
	" endif
	"
	" return cindent(v:lnum)
endfunction
