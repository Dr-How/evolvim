" Vim syntax file
" Language:	Surface evolver	
" Original author: muwn <muwn.gu@gmail.com>   
" Last Change:	2 Oct. 2007

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" if !exists('main_syntax')
"   let main_syntax = 'evolver'
" endif
"
runtime! syntax/c.vim
unlet b:current_syntax

syn case ignore

syn keyword     seModes         STRING SOAPFILM EUCLIDEAN TORUS TORUS_FILLED
syn keyword     seCurvature	SQUARE_CURVATURE MEAN_CURVATURE_INTEGRAL GAUSS_CURVATURE SQUARE_GAUSSIAN_CURVATURE

syn keyword	seTopOptions	EVOLVER_VERSION KEEP_ORIGINALS
syn keyword     seTopOptions    SYMMMETRIC_GROUP SYMMETRIC_CONTENT
syn keyword     seTopOptions    SURFACE_DIMENSION SPACE_DIMENSION
syn keyword     seTopOptions    VOLUME_METHOD_NAME AREA_METHOD_NAME LENGTH_METHOD_NAME
syn keyword     seTopOptions    LOAD_LIBRARY WULFF PHASEFILE
syn keyword     seTopOptions    PRESSURE GRAVITY_CONSTANT AREA GAP_CONSTANT
syn keyword     seTopOptions    INSULATING_KNOT_ENERGY CONDUCTING_KNOT_ENERGY
syn keyword     seTopOptions    GRADIENT_MODE AREA_NORMALIZATION APPROXIMATE_CURVATURE EFFECTIVE_AREA

syn keyword     seTopOptions    LINEAR QUADRATIC LAGRANGE SIMPLEX_REPRESENTATION
syn keyword	seTopDefs	PARAMETER OPTIMIZING_PARAMETER
syn keyword     seTopDefs       DEFINE CONSTRAINT QUANTITY
syn keyword     seTopDefs       VIEW_TRANSFORM_GENERATORS PERIODS
syn keyword     seTopDefs       HESSIAN_SPECIAL_NORMAL_VECTORS


syn keyword	seElements	VERTICES EDGES FACES FACETS BODIES READ
syn keyword	seAttributes	color fixed constraints volume density  pressure  no_refine local

syn keyword	seCommands	read

syn keyword 	seControl 	abort 
syn keyword	seConditional	then where
syn keyword	seRepeat	foreach do

syn match seLineContinuation	"\\$"

" If you do not want these operators lit, uncommment them and the "hi link" below
" syn match seArithmeticOperator	"[-+]"
" syn match seArithmeticOperator	"\.\=[*/\\^]"
" syn match seRelationalOperator	"[=~]="
" syn match seRelationalOperator	"[<>]=\="
" syn match seLogicalOperator		"[&|~]"


" If you don't like tabs
" syn match seTab			"\t"

" Standard numbers
" syn match seNumber		"\<\d\+[ij]\=\>"
" floating point number, with dot, optional exponent
" syn match seFloat		"\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=[ij]\=\>"
" floating point number, starting with a dot, optional exponent
" syn match seFloat		"\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"

" Transpose character and delimiters: Either use just [...] or (...) aswell
" syn match seDelimiter		"[][]"
"syn match seDelimiter		"[][()]"
" syn match seTransposeOperator	"[])a-zA-Z0-9.]'"lc=1

syn match seSemicolon		";"

" syn region secomment			start="/\*" end="\*/"	oneline

syn keyword seFucntion		abs acos atan asin cos cosh exp log prod sum
syn keyword seFunction		log10 max min sign sin sqrt tan reshape

" syn match seError	"-\=\<\d\+\.\d\+\.[^*/\\^]"
" syn match seError	"-\=\<\d\+\.\d\+[eEdD][-+]\=\d\+\.\([^*/\\^]\)"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_se_syntax_inits")
  if version < 508
    let did_se_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink seTopOptions		PreProc
  HiLink seTopDefs		Define
  HiLink seElements		Structure
  HiLink seAttributes		Identifier
  HiLink seLineContinuation	Special
  HiLink seConditional		Conditional
  HiLink seRepeat		Repeat
  HiLink seSemicolon		SpecialChar
  HiLink seFunction		Function

  " HiLink seTodo			Todo
  " HiLink seString		String
  " HiLink seDelimiter		Identifier
  " HiLink seTransposeOther	Identifier
  " HiLink seNumber			Number
  " HiLink seFloat			Float
  " HiLink seError			Error
  " HiLink seComment			Comment
  " HiLink secomment			Comment

  " HiLink seOperator		Operator
  " HiLink seArithmeticOperator	seOperator
  " HiLink seRelationalOperator	seOperator
  " HiLink seLogicalOperator	seOperator

"optional highlighting
  "HiLink seIdentifier		Identifier
  "HiLink seTab			Error

  delcommand HiLink
endif

let b:current_syntax = "evolver"

"EOF	vim: ts=8 noet tw=100 sw=8 sts=0
