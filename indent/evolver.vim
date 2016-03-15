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
setlocal indentkeys={,},;

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

	" TODO: The user can not open or close two parentheses in one line?

	return l:ind
endfunction
