
" 00:58 THA 27/05/2018
" By BingLi224
"
" Perl/Python Execution Tool
"
" Combine perl.vim and python.vim
"
" Prerequisites:
" + "perl.exe" path
" + "python.exe" path
"

" Interpret current perl/python file
function! Interpret ( b_start )
	" save the current file
	:w

	if expand ( "%:e" ) == 'py'
		let t:cmd = 'python.exe'
	else
		let t:cmd = 'perl.exe'
	endif

	if a:b_start != '0'
		exec "!" . t:cmd . " \"" . expand ( "%:p" ) . '"'
	else
		exec "!start " . t:cmd . " \"" . expand ( "%:p" ) . '"'
	endif
endfunction

:nnoremap <C-p> :call Interpret ( 1 )<CR>
:nnoremap <C-P> :call Interpret ( 0 )<CR>
:nmap ;p :call Interpret ( 1 )<CR>
:nmap ;P :call Interpret ( 0 )<CR>

:menu Tools.Perl ;pl

:autocmd BufEnter *.pl :lcd %:p:h

:nmap ;p> :call PerlInterpret ( 1 )<CR>
