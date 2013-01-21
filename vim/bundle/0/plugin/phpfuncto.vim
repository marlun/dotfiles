onoremap <silent>af :<C-U>call <SID>FunctionTextObject(0)<CR>
onoremap <silent>if :<C-U>call <SID>FunctionTextObject(1)<CR>
vnoremap <silent>af :<C-U>call <SID>FunctionTextObject(0)<CR><ESC>gv
vnoremap <silent>if :<C-U>call <SID>FunctionTextObject(1)<CR><ESC>gv

function! s:FunctionTextObject(inner)
	if line('.') != '}'
		normal ]M
	endif
	if a:inner == 1
		-
	endif
	normal! V[m
	if a:inner == 1
		+
	endif
endfunction
