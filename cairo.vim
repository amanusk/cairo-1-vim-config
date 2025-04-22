" Vim syntax file
"
" Language: CAIRO

if exists("b:current_syntax")
  finish
endif

syntax include @python syntax/python.vim

let b:current_syntax = "cairo"

hi def link statement Statement
hi def link register Identifier
hi def link comment Comment
hi def link funcDef Statement
hi def link funcName Function
hi def link num Constant
hi def link otherConsts Constant
hi def link specialIdentifier Special
hi def link otherSpecialId Special
hi def link type Type
hi def link declaration PreProc
hi def link useStatement Statement
hi def link useDec Identifier
hi def link funcCall FunctionCall
hi def link macroCall Special
hi def link typeDef Statement
hi def link typeDefName Type

syn keyword statement call jmp ret abs rel if const let from import static_assert
  \ local tempvar fn mod trait impl of match enum break continue loop felt
  \ return cast else alloc_locals as with with_attr nondet dw codeoffset
  \ new using and while
syn keyword register ap fp
syn keyword specialIdentifier SIZEOF_LOCALS SIZE mut ref self
syn keyword otherConsts true false
syn keyword test Counter
syn match otherSpecialId '[@*]'
syn match comment '//[^\n]*\n'
syn keyword funcDef fn namespace nextgroup=funcName skipwhite
syn match funcName '[a-zA-Z_][a-zA-Z0-9_]*' display contained
syn match funcCall '[a-zA-Z_][a-zA-Z0-9_]*('
syn match macroCall '[a-zA-Z_][a-zA-Z0-9_]*!'
syn keyword typeDef struct trait enum impl mod nextgroup=typeDefName skipwhite
syn match typeDefName '[a-zA-Z_][a-zA-Z0-9_]*' display contained
syn match num '\<\v(0x[0-9a-fA-F]+|0b[01]+|0o[0-7]+|[0-9]+)'
syntax region potionString start=/\v["]/ skip=/\v\\./ end=/\v["]/
highlight link potionString String
syntax region potionString2 start=/\v[']/ skip=/\v\\./ end=/\v[']/
highlight link potionString2 String
syn match declaration '#\[.*\]'
syn keyword useStatement use nextgroup=useDec skipwhite
syn match useDec '[^;]*' display contained
syn keyword type felt252 u8 u16 u32 u64 u128 u256 usize bool bytes31
syn region cairoHint matchgroup=SpecialComment start="%{" keepend end="%}" contains=@python
syn region pythonLiteral matchgroup=SpecialComment start="%\[" keepend end="%\]" contains=@python
