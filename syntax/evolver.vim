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
syn clear cUserCont " so that := are not confused with C-labels

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

syn keyword	seAttributes	color fixed constraints volume density  pressure  no_refine local bare

syn keyword	seCommands	read

syn keyword 	seControl 	abort 
syn keyword	seConditional	then where
syn keyword	seRepeat	foreach do

syn match seLineContinuation	"\\$"

" syn match seSemicolon		";"

syn keyword seFucntion		abs acos atan asin cos cosh exp log prod sum
syn keyword seFunction		log10 max min sign sin sqrt tan reshape

syn keyword seOnOff		on off

syn region seVerticesList	matchgroup=seElements start="^\s*vertices\s*$" end="^\ze\s*\(vertices\|edges\|faces\|facets\|bodies\|read\)\s*$" fold contains=TOP
syn region seEdgesList		matchgroup=seElements start="^\s*edges\s*$" end="^\ze\s*\(vertices\|edges\|faces\|facets\|bodies\|read\)\s*$" fold contains=TOP
syn region seFacesList		matchgroup=seElements start="^\s*faces\s*$" end="^\ze\s*\(vertices\|edges\|faces\|facets\|bodies\|read\)\s*$" fold contains=TOP
syn region seFacesList		matchgroup=seElements start="^\s*facets\s*$" end="^\ze\s*\(vertices\|edges\|faces\|facets\|bodies\|read\)\s*$" fold contains=TOP
syn region seBodiesList		matchgroup=seElements start="^\s*bodies\s*$" end="^\ze\s*\(vertices\|edges\|faces\|facets\|bodies\|read\)\s*$" fold contains=TOP

syn keyword seToggleCmd		ambient_pressure approximate_curvature area_normalization assume_oriented augmented_hessian autochop autodisplay autopop autopop_quartic autorecalc backcull bezier_basis big_endian blas_flag boundary_curvature break_after_warning break_on_warning bunch-kauffman calculate_in_3d-kauffman check_increase circular_arc_draw clip_view clipped colormap conf_edge conj_grad connected debug detorus_sticky deturck diffusion dirichlet_mode effective_area estimate facet_colors force_deletion force_edgeswap full_bounding_box nction_quantity_sparse gravity gv_binary hessian_diff hessian_normal hessian_normal_one hessian_normal_perp hessian_quiet hessian_special_normal homothety immediate_autopop interp_normals interp_bdry_param itdebug jiggle k_altitude_mode kusner linear_metric little_endian memdebug metis_factor metric_convert no_dump normal_motion old_area quantities_only quiet quietgo quietload pinning pop_disjoin pop_enjoin post_project ps_cmykflag ps_colorflag ps_crossingflag ps_gridflag ps_labelflag raw_cells rgb_colors ribiere rotate_lights runge_kutta self_similar shading show_all_edges show_all_quantities show_inner show_outer slice_view smooth_graph sobolev_mode sparse_constraints squared_gradient star_finagling thicken torus_filled transforms view_4D view_transforms_use_unique_point verbose visibility_test volgrads_every ysmp

syn keyword seGeneralCmd	ABORT ADDLOAD AREAWEED BINARY_PRINTF BODY_METIS BREAKPOINT CHDIR CLOSE_SHOW DEFINE DELETE DELETE_TEXT DETORUS DIRICHLET DIRICHLET_SEEK DISPLAY_TEXT DISSOLVE DUMP DUMP_MEMLIST EDGE_MERGE EDGESWAP EDGEWEED EIGENPROBE EQUIANGULATE ERRPRINTF EXEC EXPRINT FACET_CROSSCUT FACET_MERGE FIX FLUSH_COUNTS FREE_DISCARDS GEOMPIPE GEOMVIEW HELP HESSIAN HESSIAN_MENU HESSIAN_SEEK HISTOGRAM HISTORY KMETIS LAGRANGE LANCZOS LINEAR LIST ATTRIBUTES BOTTOMINFO PROCEDURES TOPINFO LOAD LONGJ MATRIX_INVERSE MATRIX_MULTIPLY METIS MOVE NEW_VERTEX NEW_EDGE NEW_FACET NEW_BODY NOTCH OMETIS OOGLFILE OPTIMIZE PAUSE PERMLOAD POP POP_EDGE_TO_TRI POP_QUAD_TO_QUAD POP_TRI_TO_EDGE POSTSCRIPT PRINT PRINTF QUADRATIC QUIT RAWESTV RAWEST_VERTEX_AVERAGE RAWV RAW_VERTEX_AVERAGE READ REBODY RECALC REFINE REPLACE_LOAD RESET_COUNTS REVERSE_ORIENTATION RITZ RENUMBER_ALL REORDER_STORAGE SADDLE SET SHELL SHOW SHOW_EXPR SHOWQ SIMPLEX_TO_FE SOBOLEV SPRINTF SUBCOMMAND SYSTEM T1_EDGESWAP UNFIX UNSET VERTEX_AVERAGE VERTEX_MERGE WHEREAMI WRAP_VERTEX ZOOM

" syn clear cBlock
" syn region seBlock		keepend extend matchgroup=seBraces start="{" end="}" contains=ALLBUT,seVerticesList,seEdgesList,seFacesList,seBodiesList fold
" syn clear seBraces
" * Needs keepend and extend, why? opposite to the manual!
" * single commands after { is always not recognized, why?
" * comment out these 3 lines cause the same effect
syn match seSingleCmd		"\(^\|;\|{\)\s*\zs\a\ze\s*\(;\|\d\|}\)" containedin=ALL "contains=seBraces
" TODO : single command immediately after { won't be recognized.

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
  HiLink seToggleCmd		seCommands
  HiLink seGeneralCmd		seCommands
  HiLink seCommands		Statement
  HiLink seSingleCmd		Exception
  HiLink seElements		Structure
  HiLink seAttributes		Identifier
  HiLink seLineContinuation	Special
  HiLink seConditional		Conditional
  HiLink seRepeat		Repeat
  HiLink seFunction		Function
  HiLink seOnOff		Constant
  " HiLink seBraces		SpecialChar

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

" If you do not want these operators lit, uncommment them and the "hi link" below
" syn match seArithmeticOperator	"[-+]"
" syn match seArithmeticOperator	"\.\=[*/\\^]"
" syn match seRelationalOperator	"[=~]="
" syn match seRelationalOperator	"[<>]=\="
" syn match seLogicalOperator		"[&|~]"
" If you don't like tabs
" syn match seTab			"\t"

let b:current_syntax = "evolver"

"EOF	vim: ts=8 noet tw=100 sw=8 sts=0
