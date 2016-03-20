" Vim syntax file
" Language:	Surface evolver	
" Author: Hao Chen <hao.chen.math@gmail.com>, forked from the code of Muwn Gu (muwn.gu@gmail.com)
" Last Change:	20.03.2016

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
syn clear cUserLabel
syn clear cOctalZero
syn clear cCommentError cCommentStartError
let c_no_curly_error=1 " otherwise strange behavior
let c_no_bracket_error=1
let c_no_if0=1
" let c_comment_strings=1
" syn clear cCppInIf cCppOutIf cCppOutIf2 " otherwise strange behavior

syn keyword seOnOff		on off
syn match sePi			"\<pi\>"
syn match seLineContinuation	"\\\s*$"

syn region sePreamble		start="\%^" end="^\ze\s*vert" fold contains=ALLBUT,seVerticesList,seEdgesList,seFacesList,seBodiesList,seProgram
syn region seParameter		matchgroup=seDefParameter start="^\s*PARAMETER" end="$" contains=seOptParameter
syn keyword seOptParameter	contained ON_ASSIGN_CALL
syn region seConstraint		matchgroup=seDefConstraint start="^\s*CONSTRAINT" end="$" contains=seOptConstraint
syn keyword seOptConstraint	contained GLOBAL CONVEX NONNEGATIVE NONPOSITIVE NONWALL CONTENT_RANK
syn keyword seOption		ENERGY E1 E2 E3 CONTENT C1 C2 C3
syn region seBoundary		matchgroup=seDefBoundary start="^\s*BOUNDARY" end="$" contains=seOptBoundary
syn keyword seOptBoundary	contained PARAMETERS CONVEX
syn keyword seOption		X1 X2 X3 P1 P2 P3
syn region seQuantity		matchgroup=seDefQuantity start="^\s*QUANTITY" end="$" contains=seOptQuantity,seMethods
syn keyword seOptQuantity	contained ENERGY FIXED CONSERVED INFO_ONLY LAGRANGE_MULTIPLIER TOLERENCE MODULUS FUNCTION GLOBAL METHOD
syn region seMethod		matchgroup=seDefMethod start="^\s*METHOD_INSTANCE" end="$" contains=seOptMethod,seMethods
syn keyword seOptMethod		contained METHOD MODULUS ELEMENT_MODULUS GLOBAL
syn keyword seOption		Q1 Q2 Q3 PARAMETER_ K_FORM_ORDER
syn region seDefinition		matchgroup=seDefDefine start="^\s*DEFINE" end="$" contains=seOptDefine
syn keyword seOptDefine		contained ATTRIBUTE
syn region seOptimize		matchgroup=seDefOptimize start="^\s*OPTIMI\(Z\|S\)ING_PARAMETER" end="$" contains=seOptOptimize
syn keyword seOptOptimize	contained IDENTIFIER PDELTA PSCALE

syn match seDefine		"\%(EQUATION\|FUNCTION\|FORMULA\|SCALAR_INTEGRAND\|VECTOR_INTEGRAND\|FORM_INTEGRAND\)\s*:\="
syn keyword seDefine		contained SURFACE_DIMENSION SPACE_DIMENSION GRAVITY_CONSTANT PERIODS VIEW_MATRIX VIEW_TRANSFORMS VIEW_TRANSFORM_GENERATORS SCALE_LIMIT GAP_CONSTANT CONSTRAINT_TOLERANCE SYMMETRY_TROUP length_method_name area_method_name volume_method_name hessian_special_normal_vector DIFFUSION METRIC CONFORMAL_METRIC KLEIN_METRIC MOBILITY_TENSOR MOBILITY PRESSURE PHASEFILE WULFF LOAD_LIBRARY

syn keyword seOption		contained QUADRATIC COLOR SWAP_COLORS SYMMETRIC_CONTENT KEEP_ORIGINALS SUPPRESS_WARNING UNSUPPRESS_WARNING ZOOM_RADIUS ZOOM_VERTEX SQUARED_GAUSSIAN_CURVATURE SQUARED_CURVATURE MERIT_FACTOR CONVERT_TO_QUANTITIES INTERP_BDRY_PARAM STRING SOAPFILM EUCLIDEAN TORUS TORUS_FILLED SIMPLEX_REPRESENTATION

syn keyword seMethods		vertex_scalar_integral circular_arc_length circular_arc_area density_edge_length dihedral_hooke edge_area edge_general_integral edge_length edge_tension edge_scalar_integral edge_torus_area edge_vector_integral hooke_energy hooke2_energy hooke3_energy klein_length laplacian_mean_curvature local_hooke_energy metric_edge_length neo_hookean null_length spherical_arc_length spherical_arc_area_n spherical_arc_area_s sqcurve_string sqcurve2_string sqcurve3_string sqcurve_string_marked sq_gaussian_curv_cyl sq_mean_curv_cyl sq_torsion string_gravity circle_willmore dirichlet_area density_facet_area density_facet_area_u facet_2form_integral facet_2form_sq_integral facet_area facet_tension facet_area_u facet_general_integral facet_general_hi_d_integral facet_scalar_integral facet_torus_volume facet_vector_integral facet_volume full_gravity_method gap_energy gravity_method klein_area laplacian_mean_curvature metric_facet_area null_area pos_area_hess sobolev_area spherical_area stokes2d stokes2d_laplacian mean_curvature_integral mean_curvature_integral_a sq_mean_curvature eff_area_sq_mean_curvature normal_sq_mean_curvature mix_sq_mean_curvature star_sq_mean_curvature star_eff_area_sq_mean_curvature star_normal_sq_mean_curvature star_perp_sq_mean_curvature gauss_curvature_integral star_gauss_curvature sq_gauss_curvature simplex_vector_integral simplex_k_vector_integral edge_k_vector_integral knot_energy uniform_knot_energy uniform_knot_energy_normalizer uniform_knot_normalizer1 uniform_knot_normalizer2 edge_edge_knot_energy edge_knot_energy edge_knot_energy_normalizer simon_knot_energy_normalizer facet_knot_energy facet_knot_energy_fix bi_surface buck_knot_energy proj_knot_energy circle_knot_energy sphere_knot_energy sin_knot_energy curvature_binormal ddd_gamma_sq edge_min_knot_energy true_average_crossings true_writhe twist writhe curvature_function knot_thickness knot_thickness_0 knot_thickness_p knot_thickness_p2 knot_thickness2 knot_local_thickness dirichlet_elastic linear_elastic general_linear_elastic linear_elastic_B relaxed_elastic_A relaxed_elastic1_A relaxed_elastic2_A relaxed_elastic relaxed_elastic1 relaxed_elastic2 SVK_elastic wulff_energy area_square stress_integral carter_energy charge_gradient johndust ackerman

syn region seVerticesList	end="^\ze\s*\a" matchgroup=seElementsBegin start="^\s*vertices\s*$" fold contains=TOP
syn region seEdgesList		end="^\ze\s*\a" matchgroup=seElementsBegin start="^\s*edges\s*$" fold contains=TOP
syn region seFacesList		end="^\ze\s*\a" matchgroup=seElementsBegin start="^\s*faces\s*$" fold contains=TOP
syn region seFacesList		end="^\ze\s*\a" matchgroup=seElementsBegin start="^\s*facets\s*$" fold contains=TOP
syn region seBodiesList		end="^\ze\s*\a" matchgroup=seElementsBegin start="^\s*bodies\s*$" fold contains=TOP
syn cluster seElementsList	contains=seVerticesList,seEdgesList,seFacesList,seBodiesList
syn keyword seVertexAttr	contained containedin=seVerticesList,seProgram id original valence bare fixed constraints on_constraint hit_constraint value_of_constraint v_constraint_list boundary on_boundary v_boundary on_quantity on_method_instance v_method_list vertex_normal vertexnormal dihedral mean_curvature sqcurv mid_edge mid_facet axial_point triple_point tetra_point v_force v_velocity raw_velocity v_oldx

syn keyword seEdgeAttr		contained containedin=seEdgesList,seProgram id oid original length density tension fixed midv valence bare constraints on_constraint e_constraint_list boundary on_boundary e_boundary color edge_vector, x,y,z no_refine no_transform wrap wrap_list show orientation frontbody backbody dihedral noncontent on_quantity on_method_instance e_method_list 

syn keyword seFaceAttr		contained containedin=seFacesList,sePragram id oid original density tension area fixed frontbody backbody f_body_list valence constraints on_constraint f_constraint_list boundary on_boundary f_boundary color frontcolor backcolor opacity no_display no_refine no_transform orientation noncontent phase on_quantity on_method_instance f_method_list f_next_vfacet f_next_bfacet

syn keyword seBodyAttr		contained containedin=seBodiesList,seProgram id original density volume target volfixed volconst actual_volume pressure phase centerofmass


syn region seProgram		end="\%$" matchgroup=seRead start="^\s*read\s*$" fold contains=ALLBUT,@seElementsList
syn match	seElements	"^\@!\s*\zs\%(vertices\|vertex\|edges\|edge\|faces\|face\|facets\facet\|bodies\|body\)\ze"
syn match seRelatedElements	contained containedin=seProgram "\.\%(vertices\|vertex\|edges\|edge\|faces\|face\|facets\facet\|bodies\|body\)"hs=s+1
syn match seCoordinates		contained containedin=seProgram "\.\(x\|y\|z\|w\|p\)"hs=s+1
syn keyword 	seControl 	abort 
syn keyword	seConditional	then where
syn keyword	seRepeat	foreach do
syn keyword seFucntion		abs sqr sqrt sin cos tan acos asin atan atan2 log exp sinh cosh tanh asinh acosh atanh pow ceil floor minimum maximum ellipticE ellipticK incompleteEllipticE incompleteEllipticF matrix_multiply matrix_inverse matrix_determinant wrap_inverse wrap_compose is_defined sizeof valid_boundary valid_constraint valid_element

syn keyword seToggleCmd		ambient_pressure approximate_curvature area_normalization assume_oriented augmented_hessian autochop autodisplay autopop autopop_quartic autorecalc backcull bezier_basis big_endian blas_flag boundary_curvature break_after_warning break_on_warning bunch-kauffman calculate_in_3d-kauffman check_increase circular_arc_draw clip_view clipped colormap conf_edge conj_grad connected debug detorus_sticky deturck diffusion dirichlet_mode effective_area estimate facet_colors force_deletion force_edgeswap full_bounding_box nction_quantity_sparse gravity gv_binary hessian_diff hessian_normal hessian_normal_one hessian_normal_perp hessian_quiet hessian_special_normal homothety immediate_autopop interp_normals interp_bdry_param itdebug jiggle k_altitude_mode kusner linear_metric little_endian memdebug metis_factor metric_convert no_dump normal_motion old_area quantities_only quiet quietgo quietload pinning pop_disjoin pop_enjoin post_project ps_cmykflag ps_colorflag ps_crossingflag ps_gridflag ps_labelflag raw_cells rgb_colors ribiere rotate_lights runge_kutta self_similar shading show_all_edges show_all_quantities show_inner show_outer slice_view smooth_graph sobolev_mode sparse_constraints squared_gradient star_finagling thicken torus_filled transforms view_4D view_transforms_use_unique_point verbose visibility_test volgrads_every ysmp

syn keyword seGeneralCmd	ABORT ADDLOAD AREAWEED BINARY_PRINTF BODY_METIS BREAKPOINT CHDIR CLOSE_SHOW DEFINE DELETE DELETE_TEXT DETORUS DIRICHLET DIRICHLET_SEEK DISPLAY_TEXT DISSOLVE DUMP DUMP_MEMLIST EDGE_MERGE EDGESWAP EDGEWEED EIGENPROBE EQUIANGULATE ERRPRINTF EXEC EXPRINT FACET_CROSSCUT FACET_MERGE FIX FLUSH_COUNTS FREE_DISCARDS GEOMPIPE GEOMVIEW HELP HESSIAN HESSIAN_MENU HESSIAN_SEEK HISTOGRAM HISTORY KMETIS LAGRANGE LANCZOS LINEAR LIST ATTRIBUTES BOTTOMINFO PROCEDURES TOPINFO LOAD LONGJ MATRIX_INVERSE MATRIX_MULTIPLY METIS MOVE NEW_VERTEX NEW_EDGE NEW_FACET NEW_BODY NOTCH OMETIS OOGLFILE OPTIMIZE PAUSE PERMLOAD POP POP_EDGE_TO_TRI POP_QUAD_TO_QUAD POP_TRI_TO_EDGE POSTSCRIPT PRINT PRINTF QUADRATIC QUIT RAWESTV RAWEST_VERTEX_AVERAGE RAWV RAW_VERTEX_AVERAGE REBODY RECALC REFINE REPLACE_LOAD RESET_COUNTS REVERSE_ORIENTATION RITZ RENUMBER_ALL REORDER_STORAGE SADDLE SET SHELL SHOW SHOW_EXPR SHOWQ SIMPLEX_TO_FE SOBOLEV SPRINTF SUBCOMMAND SYSTEM T1_EDGESWAP UNFIX UNSET VERTEX_AVERAGE VERTEX_MERGE WHEREAMI WRAP_VERTEX ZOOM

syn match seReadCmd		/read\ze\s*"/
" syn clear cBlock
" syn region seBlock		keepend extend matchgroup=seBraces start="{" end="}" contains=ALLBUT,seVerticesList,seEdgesList,seFacesList,seBodiesList fold
" syn clear seBraces
" * Needs keepend and extend, why? opposite to the manual!
" * single commands after { is always not recognized, why?
" * comment out these 3 lines cause the same effect
syn match seSingleCmd		"\(^\|;\|{\)\s*\zs\a\ze\s*\(;\|\d\|}\)" containedin=ALLBUT,cComment
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

  " HiLink seTopOptions		PreProc
  " HiLink seTopDefs		Define
  HiLink seOptParameter		seOption
  HiLink seOptConstraint	seOption
  HiLink seOptFormula		seOption
  HiLink seOptBoundary		seOption
  HiLink seOptQuantity		seOption
  HiLink seOptMethod		seOption
  HiLink seOptDefine		seOption
  HiLink seOptOptimize		seOption
  HiLink seOption		PreProc

  HiLink seDefParameter		seDefine
  HiLink seDefConstraint	seDefine
  HiLink seDefFormula		seDefine
  HiLink seDefBoundary		seDefine
  HiLink seDefQuantity		seDefine
  HiLink seDefMethod		seDefine
  HiLink seDefDefine		seDefine
  HiLink seDefOptimize		seDefine
  HiLink seDefine		Define

  HiLink seMethods		Special

  HiLink seReadCmd		seCommands
  HiLink seToggleCmd		seCommands
  HiLink seGeneralCmd		seCommands
  HiLink seCommands		Todo
  HiLink seSingleCmd		Todo " commands are verbs, after all
  HiLink seOnOff		Constant
  HiLink sePi			Number

  HiLink seConditional		Conditional
  HiLink seRepeat		Repeat
  HiLink seFunction		Function
  HiLink seLineContinuation	Special

  HiLink seElements		Type

  HiLink seElementsBegin	Structure
  HiLink seRead			Structure
  HiLink seVertexAttr		seAttributes
  HiLink seEdgeAttr		seAttributes
  HiLink seFaceAttr		seAttributes
  HiLink seBodyAttr		seAttributes
  HiLink seRelatedElements	seAttributes
  HiLink seCoordinates		seAttributes
  HiLink seAttributes		Identifier

  delcommand HiLink
endif

let b:current_syntax = "evolver"
