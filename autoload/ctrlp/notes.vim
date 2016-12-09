" =============================================================================
" Description:   Extension for ctrlp.vim. Open note files using Note:
" =============================================================================

" To load this extension into ctrlp, add this to your vimrc:
"
"     let g:ctrlp_extensions = ['notes']
"
" Where 'notes' is the name of the file 'notes.vim'
"
" For multiple extensions:
"
"     let g:ctrlp_extensions = [
"         \ 'my_extension',
"         \ 'my_other_extension',
"         \ ]

" Load guard
if ( exists('g:loaded_ctrlp_notes') && g:loaded_ctrlp_notes)
	\ || v:version < 700 || &cp
	finish
endif
let g:loaded_ctrlp_notes = 1


" Add this extension's settings to g:ctrlp_ext_vars
"
" Required:
"
" + init: the name of the input function including the brackets and any
"         arguments
"
" + accept: the name of the action function (only the name)
"
" + lname & sname: the long and short names to use for the statusline
"
" + type: the matching type
"   - line : match full line
"   - path : match full line like a file or a directory path
"   - tabs : match until first tab character
"   - tabe : match until last tab character
"
" Optional:
"
" + enter: the name of the function to be called before starting ctrlp
"
" + exit: the name of the function to be called after closing ctrlp
"
" + opts: the name of the option handling function called when initialize
"
" + sort: disable sorting (enabled by default when omitted)
"
" + specinput: enable special inputs '..' and '@cd' (disabled by default)
"
call add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#notes#init()',
	\ 'accept': 'ctrlp#notes#accept',
	\ 'lname': 'long statusline name',
	\ 'sname': 'shortname',
	\ 'type': 'line',
	\ 'enter': 'ctrlp#notes#enter()',
	\ 'exit': 'ctrlp#notes#exit()',
	\ 'opts': 'ctrlp#notes#opts()',
	\ 'sort': 0,
	\ 'specinput': 0,
	\ })


" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#notes#init()
  let input = xolox#notes#get_titles(0)
	return input
endfunction


" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#notes#accept(mode, str)
	" For this example, just exit ctrlp and run help
	call ctrlp#exit()
  call xolox#notes#edit(v:cmdbang ? '!' : '', a:str)
endfunction


" (optional) Do something before enterting ctrlp
function! ctrlp#notes#enter()
endfunction


" (optional) Do something after exiting ctrlp
function! ctrlp#notes#exit()
endfunction


" (optional) Set or check for user options specific to this extension
function! ctrlp#notes#opts()
endfunction


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#notes#id()
	return s:id
endfunction


" Create a command to directly call the new search type
"
" Put this in vimrc or plugin/notes.vim
" command! CtrlPnotes call ctrlp#notes#init(ctrlp#id())


" vim:nofen:fdl=0:ts=2:sw=2:sts=2
