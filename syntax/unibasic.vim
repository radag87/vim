" Vim syntax file
" Language:	Universe Basic (Used also in DataStage)
" Maintainer:	L. Husar <lh3@atlas.cz>
" Last Change:	2006-03-23 10:49


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" note that adding the period (.) to iskeyword
" tells vim that a . is not a word separator
if version >= 600
  setlocal iskeyword+=.
else
  set iskeyword+=.
endif

syn case ignore

" A bunch of useful BASIC keywords
syn keyword basicStatement	abort
syn keyword basicStatement	begin
syn keyword basicStatement	call calling capturing case chain clearselect clearprompts common continue create crt closeseq close
syn keyword basicStatement	deffun
syn keyword basicStatement	else end enter equ equate error execute exit
syn keyword basicStatement	for from function
syn keyword basicStatement	gosub goto
syn keyword basicStatement	if
syn keyword basicStatement	lit loop
syn keyword basicStatement	next
syn keyword basicStatement	on open opendev openpath openseq 
syn keyword basicStatement	perform program
syn keyword basicStatement	read readblk readl readlist readnext readseq readt readu readv readvl readvu repeat return
syn keyword basicStatement	select setting stop subr subroutine
syn keyword basicStatement	then to
syn keyword basicStatement	until
syn keyword basicStatement	while weofseq write writeblk writelist writeseq writeseqf writet writeu writev writevu

syn keyword basicFunction	abs abss acos adds alpha ands ascii asin atan authorization auxmap
syn keyword basicFunction	bitand bitnot bitor bitreset bitset bittest bitxor break bscan byte bytelen  bytetype byteval
syn keyword basicFunction	cats change char chars checksum cleardata clearfile commit 
syn keyword basicFunction	compare convert cos cosh count counts
syn keyword basicFunction	data date dcount debug del delete deletelist deleteu display div divs downcase dquote dtx
syn keyword basicFunction	ebcdic echo eof eqs ereplace errmsg exchange exp extract
syn keyword basicFunction	fadd fdiv ffix fflt field fields fieldstore fileinfo filelock fileunlock find findstr fix flush fmt fmtdp fmts 
syn keyword basicFunction	fmtsdp fmul fold folddp footing fsub
syn keyword basicFunction	ges get getlist getlocale getrem getx group groupstore gts
syn keyword basicFunction	heading hush
syn keyword basicFunction	iconv iconvs ifs ilprompt index indexs indices inmat input inputclear inputdisp inputdp inputerr inputnull 
syn keyword basicFunction	inputtrap ins insert int isnull isnulls isolation itype
syn keyword basicFunction	keyedit keyexit keyin keytrap
syn keyword basicFunction	left len lendp lens lensdp les level ln localeinfo locate lock lower lts
syn keyword basicFunction	matbuild matchfield matparse matread matreadl matreadu matwrite matwriteu maximum minimum mod mods muls
syn keyword basicFunction	nap neg negs nes nobuf not nots num nums
syn keyword basicFunction	oconv oconvs ors
syn keyword basicFunction	page precision print printer printerr procread procwrite prompt pwr
syn keyword basicFunction	quote
syn keyword basicFunction	raise randomize real recordlocked recordlockl recordlocku release remove replace reset reuse 
syn keyword basicFunction	revremove rewind right rnd rollback rpc.call rpc.connect rpc.disconnect
syn keyword basicFunction	sadd scmp sdiv seek selecte selectindex selectinfo send sentence seq seqs set setlocale setrem sin sinh 
syn keyword basicFunction	sleep smul soundex space spaces splice sqrt squote sselect 
syn keyword basicFunction	ssub start status str strs subs substrings sum summation system 
syn keyword basicFunction	tabstop tan tanh terminfo time timedate timeout tparm tprint trans transaction trim trimb trimbs trimf trimfs 
syn keyword basicFunction	trims ttyctl ttyget ttyset
syn keyword basicFunction	unichar unichars uniseq uniseqs unlock upcase uprint
syn keyword basicFunction	weof 
syn keyword basicFunction	xlate xtd

syn match basicConditional      "="
syn match basicConditional      ":"
syn match basicConditional      "<>"
syn match basicConditional      "<"
syn match basicConditional      ">"
syn match basicConditional      ">="
syn match basicConditional      "<="
syn match basicConditional      ":="
syn match basicConditional      "+="
syn keyword basicConditional      eq
syn keyword basicConditional      ne
syn keyword basicConditional      lt
syn keyword basicConditional      gt
syn keyword basicConditional      ge
syn keyword basicConditional      le
syn keyword basicConditional      and
syn keyword basicConditional      or

"integer number, or floating point number without a dot.
syn match  basicNumber		"\<\d\+\>"
"floating point number, with dot
syn match  basicNumber		"\<\d\+\.\d*\>"
"floating point number, starting with a dot
syn match  basicNumber		"\.\d\+\>"

syn match  basicSpecial         "dsj\.me"
syn match  basicSpecial         "dsj\.paramvalue"
syn match  basicSpecial         "dsu\."
"syn match  basicSpecial         "dsx\."
syn match  basicSpecial         "^\w\:"

syn keyword basicSpecial	DSLogInfo DSLogFatal DSLogWarn DSExecute 
syn match basicSpecial		"@system.return.code"
syn match basicSpecial		"@user.return.code"
syn match basicSpecial		"@account"
syn match basicSpecial		"@logname"
syn match basicSpecial		"@who"
syn match basicSpecial		"@date"
syn match basicSpecial		"@am"
syn match basicSpecial		"@fm"
syn match basicSpecial		"@vm"
syn match basicSpecial		"@svm"
syn match basicSpecial		"@null"
syn match basicSpecial		"@true"
syn match basicSpecial		"@false"
syn match basicSpecial		"$include "
syn match basicSpecial		"$insert "
syn match basicSpecial		"$options "
syn match basicSpecial		"$define "

"syn region  basicString		start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=basicSpecial
"syn region  basicString		start=+'+  end=+'+  contains=basicSpecial
"syn region  basicString		start=+"+  skip=+\\\\\|\\"+  end=+"+  
syn region  basicString		start=+"+   end=+"+  
syn region  basicString		start=+'+   end=+'+  
syn region  basicString		start=+\\+  end=+\\+  

syn region  basicComment start="\%(^\|;\zs\)\s*REM\s" end="$" contains=basicTodo
syn region  basicComment start="\%(^\|;\zs\)\s*\*"    end="$" contains=basicTodo
syn region  basicComment start="\%(^\|;\zs\)\s*!"     end="$" contains=basicTodo
syn region  basicComment start="\%(^\|;\zs\)\s*\$\*"  end="$" contains=basicTodo

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_basic_syntax_inits")
  if version < 508
    let did_basic_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink basicLabel		Label
  HiLink basicConditional	Conditional
  HiLink basicRepeat		Repeat
  HiLink basicLineNumber	Comment
  HiLink basicNumber		Number
  HiLink basicError		Error
  HiLink basicStatement		Statement
  HiLink basicString		String
  HiLink basicSpecial		Special
  HiLink basicTodo		Todo
  HiLink basicFunction		Identifier
  HiLink basicTypeSpecifier	Type
  HiLink basicFilenumber	basicTypeSpecifier
  HiLink basicComment		Comment
  "hi basicMathsOperator term=bold cterm=bold gui=bold

  delcommand HiLink
endif

let b:current_syntax = "unibasic"

" vim: ts=3
