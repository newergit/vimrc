set ts=4
set number
set cindent
set shiftwidth=4
set cinoptions={0,1s,t0,n-2,p0,(03s,=.5s,>1s,=1s,:1s		
let g:clang_complete_copen=1
let g:clang_periodic_quickfix=0
let g:clang_snippets=1
let g:clang_close_preview=1
set completeopt=menu,longest
let g:clang_use_library=1
let g:clang_library_path="/usr/lib/llvm"


inoremap <C-_> /**/<Esc>hi
inoremap ( <c-r>=LeftPair('(',')')<CR>
inoremap ) <c-r>=RightPair('(',')')<CR>
inoremap [ <c-r>=LeftPair('[',']')<CR>
inoremap ] <c-r>=RightPair('[',']')<CR>
inoremap { <c-r>=LeftPair('{','}')<CR>
inoremap } <c-r>=RightPair('{','}')<CR>
inoremap " <c-r>=LeftPair('"','"')<CR>
inoremap ' <c-r>=LeftPair("'","'")<CR>
inoremap <CR> <c-r>=EnterInBracket()<CR>
inoremap <BS> <c-r>=BackSpaceinBracket()<CR>


function LeftPair(charL,charR)
 let line = getline('.')
 let col = col('.')
 if line[col - 1] == a:charL
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:charL.a:charR."\<Esc>i"
 endif
endf

function RightPair(charL,charR)
 let line = getline('.')
 let col = col('.')
 if line[col - 1] == a:charR
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:charR
 endif
endf

function EnterInBracket()
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "{"
  return "\<CR>\<Esc>ko"
 else
  return "\<CR>"
 endif
endf

function BackSpaceinBracket()
 let line = getline('.')
 let col = col('.')
 if (line[col-2]=="{" && line[col-1]=="}")||(line[col-2]=="(" && line[col-1]==")")||(line[col-2]=='"' && line[col-1]=='"')||(line[col-2]=="[" && line[col-1]=="]")||(line[col-2]=="'" && line[col-1]=="'")||(line[col-2]=="`" && line[col-1]=="`")
  return "\<BS>\<Del>"
else 
  return "\<BS>"
 endif
endf
