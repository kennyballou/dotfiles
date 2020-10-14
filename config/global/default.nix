{ pkgs, config, ... }:
{
  home.file.".globalrc".text = ''
default:\
	:tc=native:tc=exuberant-ctags:tc=htags:
native:\
	:tc=gtags:

common:\
	:skip=HTML/,\
	HTML.pub/,\
	tags,\
	TAGS,\
	ID,\
	y.tab.c,\
	y.tab.h,\
	gtags.files,\
	cscope.files,\
	cscope.out,\
	cscope.po.out,\
	cscope.in.out,\
	SCCS/,\
	RCS/,\
	CVS/,\
	CVSROOT/,\
	{arch}/,\
	autom4te.cache/,\
	*.orig,\
	*.rej,\
	*.bak,\
	*~,\
	#*#,\
	*.swp,\
	*.tmp,\
	*_flymake.*,\
	*_flymake,\
	.git/,\
	target/:

gtags:\
	:tc=common:\
	:tc=builtin-parser:

builtin-parser:
	:langmap=c\:.c.h,\
	yacc\:.y,\
	asm\:.s.S,\
	java\:.java,\
	cpp\:.c++.cc.hh.cpp.cxx.hxx.hpp.C.H,\
	php\:.php.php3.phtml:

#
# Plug-in parser to use Exuberant Ctags.
#
exuberant-ctags|plugin-example|setting to use Exuberant Ctags plug-in parser:\
	:tc=common:\
	:langmap=Asm\:.asm.ASM.s.S:\
	:langmap=Asp\:.asp.asa:\
	:langmap=Awk\:.awk.gawk.mawk:\
	:langmap=Basic\:.bas.bi.bb.pb:\
	:langmap=BETA\:.bet:\
	:langmap=C\:.c:\
	:langmap=C++\:.c++.cc.cp.cpp.cxx.h.h++.hh.hp.hpp.hxx.C.H:\
	:langmap=C#\:.cs:\
	:langmap=Cobol\:.cbl.cob.CBL.COB:\
	:langmap=DosBatch\:.bat.cmd:\
	:langmap=Eiffel\:.e:\
	:langmap=Erlang\:.erl.ERL.hrl.HRL:\
	:langmap=Flex\:.as.mxml:\
	:langmap=Fortran\:.f.for.ftn.f77.f90.f95.F.FOR.FTN.F77.F90.F95:\
	:langmap=HTML\:.htm.html:\
	:langmap=Java\:.java:\
	:langmap=JavaScript\:.js:\
	:langmap=Lisp\:.cl.clisp.el.l.lisp.lsp:\
	:langmap=Lua\:.lua:\
	:langmap=MatLab\:.m:\
	:langmap=OCaml\:.ml.mli:\
	:langmap=Pascal\:.p.pas:\
	:langmap=Perl\:.pl.pm.plx.perl:\
	:langmap=PHP\:.php.php3.phtml.data.prg.i:\
	:langmap=Python\:.py.pyx.pxd.pxi.scons:\
	:langmap=REXX\:.cmd.rexx.rx:\
	:langmap=Ruby\:.rb.ruby:\
	:langmap=Scheme\:.SCM.SM.sch.scheme.scm.sm:\
	:langmap=Sh\:.sh.SH.bsh.bash.ksh.zsh:\
	:langmap=SLang\:.sl:\
	:langmap=SML\:.sml.sig:\
	:langmap=SQL\:.sql:\
	:langmap=Tcl\:.tcl.tk.wish.itcl:\
	:langmap=Tex\:.tex:\
	:langmap=Vera\:.vr.vri.vrh:\
	:langmap=Verilog\:.v:\
	:langmap=VHDL\:.vhdl.vhd:\
	:langmap=Vim\:.vim:\
	:langmap=YACC\:.y:\
	:gtags_parser=Asm\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Asp\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Awk\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Basic\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=BETA\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=C\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=C++\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=C#\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Cobol\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=DosBatch\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Eiffel\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Erlang\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Flex\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Fortran\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=HTML\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Java\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=JavaScript\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Lisp\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Lua\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=MatLab\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=OCaml\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Pascal\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Perl\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=PHP\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Python\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=REXX\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Ruby\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Scheme\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Sh\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=SLang\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=SML\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=SQL\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Tcl\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Tex\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Vera\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Verilog\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=VHDL\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=Vim\:${pkgs.global}/lib/gtags/exuberant-ctags.la:\
	:gtags_parser=YACC\:${pkgs.global}/lib/gtags/exuberant-ctags.la:


pygments-parser|Pygments plug-in parser:\
	:tc=common:\
	:langmap=ABAP\:.abap:\
	:langmap=ANTLR\:.G.g:\
	:langmap=ActionScript3\:.as:\
	:langmap=Ada\:.adb.ads.ada:\
	:langmap=AppleScript\:.applescript:\
	:langmap=AspectJ\:.aj:\
	:langmap=Aspx-cs\:.aspx.asax.ascx.ashx.asmx.axd:\
	:langmap=Asymptote\:.asy:\
	:langmap=AutoIt\:.au3:\
	:langmap=Awk\:.awk.gawk.mawk:\
	:langmap=BUGS\:.bug:\
	:langmap=Bash\:.sh.ksh.bash.ebuild.eclass:\
	:langmap=Bat\:.bat.cmd:\
	:langmap=BlitzMax\:.bmx:\
	:langmap=Boo\:.boo:\
	:langmap=Bro\:.bro:\
	:langmap=C#\:.cs:\
	:langmap=C++\:.c++.cc.cp.cpp.cxx.h.h++.hh.hp.hpp.hxx.C.H:\
	:langmap=COBOLFree\:.cbl.CBL:\
	:langmap=COBOL\:.cob.COB.cpy.CPY:\
	:langmap=CUDA\:.cu.cuh:\
	:langmap=C\:.c.h:\
	:langmap=Ceylon\:.ceylon:\
	:langmap=Cfm\:.cfm.cfml.cfc:\
	:langmap=Clojure\:.clj:\
	:langmap=CoffeeScript\:.coffee:\
	:langmap=Common-Lisp\:.cl.lisp.el:\
	:langmap=Coq\:.v:\
	:langmap=Croc\:.croc:\
	:langmap=Csh\:.tcsh.csh:\
	:langmap=Cython\:.pyx.pxd.pxi:\
	:langmap=Dart\:.dart:\
	:langmap=Dg\:.dg:\
	:langmap=Duel\:.duel.jbst:\
	:langmap=Dylan\:.dylan.dyl.intr:\
	:langmap=ECL\:.ecl:\
	:langmap=EC\:.ec.eh:\
	:langmap=ERB\:.erb:\
	:langmap=Elixir\:.ex.exs:\
	:langmap=Erlang\:.erl.hrl.es.escript:\
	:langmap=Evoque\:.evoque:\
	:langmap=FSharp\:.fs.fsi:\
	:langmap=Factor\:.factor:\
	:langmap=Fancy\:.fy.fancypack:\
	:langmap=Fantom\:.fan:\
	:langmap=Felix\:.flx.flxh:\
	:langmap=Fortran\:.f.f90.F.F90:\
	:langmap=GAS\:.s.S:\
	:langmap=GLSL\:.vert.frag.geo:\
	:langmap=Genshi\:.kid:\
	:langmap=Gherkin\:.feature:\
	:langmap=Gnuplot\:.plot.plt:\
	:langmap=Go\:.go:\
	:langmap=GoodData-CL\:.gdc:\
	:langmap=Gosu\:.gs.gsx.gsp.vark:\
	:langmap=Groovy\:.groovy:\
	:langmap=Gst\:.gst:\
	:langmap=HaXe\:.hx:\
	:langmap=Haml\:.haml:\
	:langmap=Haskell\:.hs:\
	:langmap=Hxml\:.hxml:\
	:langmap=Hybris\:.hy.hyb:\
	:langmap=IDL\:.pro:\
	:langmap=Io\:.io:\
	:langmap=Ioke\:.ik:\
	:langmap=JAGS\:.jag.bug:\
	:langmap=Jade\:.jade:\
	:langmap=JavaScript\:.js:\
	:langmap=Java\:.java:\
	:langmap=Jsp\:.jsp:\
	:langmap=Julia\:.jl:\
	:langmap=Koka\:.kk.kki:\
	:langmap=Kotlin\:.kt:\
	:langmap=LLVM\:.ll:\
	:langmap=Lasso\:.lasso:\
	:langmap=Literate-Haskell\:.lhs:\
	:langmap=LiveScript\:.ls:\
	:langmap=Logos\:.x.xi.xm.xmi:\
	:langmap=Logtalk\:.lgt:\
	:langmap=Lua\:.lua.wlua:\
	:langmap=MOOCode\:.moo:\
	:langmap=MXML\:.mxml:\
	:langmap=Mako\:.mao:\
	:langmap=Mason\:.m.mhtml.mc.mi:\
	:langmap=Matlab\:.m:\
	:langmap=Modelica\:.mo:\
	:langmap=Modula2\:.mod:\
	:langmap=Monkey\:.monkey:\
	:langmap=MoonScript\:.moon:\
	:langmap=MuPAD\:.mu:\
	:langmap=Myghty\:.myt:\
	:langmap=NASM\:.asm.ASM:\
	:langmap=NSIS\:.nsi.nsh:\
	:langmap=Nemerle\:.n:\
	:langmap=NewLisp\:.lsp.nl:\
	:langmap=Newspeak\:.ns2:\
	:langmap=Nimrod\:.nim.nimrod:\
	:langmap=OCaml\:.ml.mli.mll.mly:\
	:langmap=Objective-C++\:.mm.hh:\
	:langmap=Objective-C\:.m.h:\
	:langmap=Objective-J\:.j:\
	:langmap=Octave\:.m:\
	:langmap=Ooc\:.ooc:\
	:langmap=Opa\:.opa:\
	:langmap=OpenEdge\:.p.cls:\
	:langmap=PHP\:.php.php3.phtml:\
	:langmap=Pascal\:.pas:\
	:langmap=Perl\:.pl.pm:\
	:langmap=PostScript\:.ps.eps:\
	:langmap=PowerShell\:.ps1:\
	:langmap=Prolog\:.prolog.pro.pl:\
	:langmap=Python\:.py.pyw.sc.tac.sage:\
	:langmap=QML\:.qml:\
	:langmap=REBOL\:.r.r3:\
	:langmap=RHTML\:.rhtml:\
	:langmap=Racket\:.rkt.rktl:\
	:langmap=Ragel\:.rl:\
	:langmap=Redcode\:.cw:\
	:langmap=RobotFramework\:.robot:\
	:langmap=Ruby\:.rb.rbw.rake.gemspec.rbx.duby:\
	:langmap=Rust\:.rs.rc:\
	:langmap=S\:.S.R:\
	:langmap=Scala\:.scala:\
	:langmap=Scaml\:.scaml:\
	:langmap=Scheme\:.scm.ss:\
	:langmap=Scilab\:.sci.sce.tst:\
	:langmap=Smalltalk\:.st:\
	:langmap=Smarty\:.tpl:\
	:langmap=Sml\:.sml.sig.fun:\
	:langmap=Snobol\:.snobol:\
	:langmap=SourcePawn\:.sp:\
	:langmap=Spitfire\:.spt:\
	:langmap=Ssp\:.ssp:\
	:langmap=Stan\:.stan:\
	:langmap=SystemVerilog\:.sv.svh:\
	:langmap=Tcl\:.tcl:\
	:langmap=TeX\:.tex.aux.toc:\
	:langmap=Tea\:.tea:\
	:langmap=Treetop\:.treetop.tt:\
	:langmap=TypeScript\:.ts:\
	:langmap=UrbiScript\:.u:\
	:langmap=VB.net\:.vb.bas:\
	:langmap=VGL\:.rpf:\
	:langmap=Vala\:.vala.vapi:\
	:langmap=Velocity\:.vm.fhtml:\
	:langmap=Verilog\:.v:\
	:langmap=Vhdl\:.vhdl.vhd:\
	:langmap=Vim\:.vim:\
	:langmap=XBase\:.PRG.prg:\
	:langmap=XQuery\:.xqy.xquery.xq.xql.xqm:\
	:langmap=XSLT\:.xsl.xslt.xpl:\
	:langmap=Xtend\:.xtend:\
	:gtags_parser=ABAP\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=ANTLR\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=ActionScript3\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Ada\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=AppleScript\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=AspectJ\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Aspx-cs\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Asymptote\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=AutoIt\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Awk\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=BUGS\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Bash\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Bat\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=BlitzMax\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Boo\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Bro\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=C#\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=C++\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=COBOLFree\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=COBOL\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=CUDA\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=C\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Ceylon\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Cfm\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Clojure\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=CoffeeScript\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Common-Lisp\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Coq\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Croc\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Csh\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Cython\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Dart\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Dg\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Duel\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Dylan\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=ECL\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=EC\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=ERB\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Elixir\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Erlang\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Evoque\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=FSharp\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Factor\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Fancy\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Fantom\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Felix\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Fortran\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=GAS\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=GLSL\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Genshi\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Gherkin\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Gnuplot\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Go\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=GoodData-CL\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Gosu\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Groovy\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Gst\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=HaXe\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Haml\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Haskell\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Hxml\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Hybris\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=IDL\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Io\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Ioke\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=JAGS\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Jade\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=JavaScript\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Java\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Jsp\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Julia\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Koka\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Kotlin\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=LLVM\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Lasso\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Literate-Haskell\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=LiveScript\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Logos\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Logtalk\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Lua\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=MAQL\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=MOOCode\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=MXML\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Mako\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Mason\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Matlab\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=MiniD\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Modelica\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Modula2\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Monkey\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=MoonScript\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=MuPAD\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Myghty\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=NASM\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=NSIS\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Nemerle\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=NewLisp\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Newspeak\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Nimrod\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=OCaml\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Objective-C++\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Objective-C\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Objective-J\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Octave\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Ooc\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Opa\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=OpenEdge\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=PHP\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Pascal\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Perl\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=PostScript\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=PowerShell\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Prolog\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Python\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=QML\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=REBOL\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=RHTML\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Racket\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Ragel\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Redcode\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=RobotFramework\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Ruby\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Rust\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=S\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Scala\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Scaml\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Scheme\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Scilab\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Smalltalk\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Smarty\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Sml\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Snobol\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=SourcePawn\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Spitfire\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Ssp\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Stan\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=SystemVerilog\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Tcl\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=TeX\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Tea\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Treetop\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=TypeScript\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=UrbiScript\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=VB.net\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=VGL\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Vala\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Velocity\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Verilog\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Vhdl\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Vim\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=XBase\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=XQuery\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=XSLT\:${pkgs.global}/lib/gtags/pygments-parser.la:\
	:gtags_parser=Xtend\:${pkgs.global}/lib/gtags/pygments-parser.la:

htags:\
	:script_alias=/cgi-bin/:ncol#4:tabs#8:normal_suffix=html:gzipped_suffix=ghtml:


# Local Variables:
# mode: conf
# indent-tabs-mode: t
# End:

'';
}
