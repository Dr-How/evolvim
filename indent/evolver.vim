if exists("b:did_indent")
	finish
endif

let b:did_indent = 1

setlocal cindent cinoptions& cinoptions+=L0

setlocal indentexpr=GetEvolverIndent()

if exists ("*GetEvolverIndent")
	finish
endif

function! SkipBlanksAndComments(startline) " copied from java.vim
  let lnum = a:startline
  while lnum > 1
    let lnum = prevnonblank(lnum)
    if getline(lnum) =~ '\*/\s*$'
      while getline(lnum) !~ '/\*' && lnum > 1
        let lnum = lnum - 1
      endwhile
      if getline(lnum) =~ '^\s*/\*'
        let lnum = lnum - 1
      else
        break
      endif
    elseif getline(lnum) =~ '^\s*//'
      let lnum = lnum - 1
    else
      break
    endif
  endwhile
  return lnum
endfunction

function GetEvolverIndent()
	let lnum1 = SkipBlanksAndComments(v:lnum-1)
	silent normal! 0[{
	let lnum2 = line('.')
	if getline(lnum1) =~ ':='
		if lnum2==lnum1
			return indent(lnum1)+&sw
		else
			return indent(lnum1)
		endif
		" silent normal! O;<Esc>
		" silent normal! u
		" return ind
	endif

	return cindent(v:lnum)
endfunction
