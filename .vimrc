" 1 - Basic vim set
set nocompatible
set number
set mouse=a
set t_Co=256

" 2 - Pathogen
call pathogen#infect()
call pathogen#helptags()

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on

" 3 - Nerdtree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0 

" 4 - Color (remove comment for choose color theme)
set background=dark
colorscheme jellybeans
" colorscheme distinguished 

" 5 -Auto header source: http://spareware.blogspot.fr/2011/04/script-header-vim.html
function s:filetype ()

	let s:file = expand("<afile>:t")
	if match (s:file, "\.sh$") != -1
		let s:first = "#" . "!" . system ("whereis -b bash | awk '{print $2}' | tr -d '\n'")
		let s:comment = "#"
		let s:end = "##################################"
		let s:type = "##################################"
	elseif match (s:file, "\.py$") != -1
		let s:first = "#" . "!" . system ("whereis -b python | awk '{print $2}' | tr -d '\n'")
		let s:comment = "#"
		let s:end = "##################################"
		let s:type = "##################################"
	elseif match (s:file, "\.pl$") != -1
		let s:first = "#" . "!" . system ("whereis -b perl | awk '{print $2}' | tr -d '\n'")
		let s:comment = "#"
		let s:end = "##################################"
		let s:type = "##################################"
	elseif match (s:file, "\.vim$") != -1
		let s:first = "\***********************************"
		let s:comment = "\""
		let s:end = "\***********************************"
		let s:type = s:comment . " Vim File"
	elseif match (s:file, "\.c$") != -1
		let s:first = "/*************************************\\""
		let s:comment = "*"
		let s:end = "\\*************************************/"
		let s:type = s:comment . " C File"
	elseif match (s:file, "\.h$") != -1
		let s:first = "/*************************************\\""
		let s:comment = "*"
		let s:end = "\\*************************************/"
		let s:type = s:comment . " H File"

	else
		let s:comment = "#"
		let s:type = s:comment . " Text File"
	endif
	unlet s:file

endfunction


" FUNCTION:
" Insert the header when we create a new file.
" VARIABLES:
" author = User who create the file.
" file = Path to the file.
" created = Date of the file creation.
" modified = Date of the last modification.

function s:insert ()

	call s:filetype ()

	let s:author = s:comment . " AUTHOR:   " . system ("id -un | tr -d '\n'")
	let s:file = s:comment . " FILE:     " . expand("<afile>")
	let s:created = s:comment . " CREATED:  " . strftime ("%H:%M:%S %d/%m/%Y")
	let s:modified = s:comment . " MODIFIED: " . strftime ("%H:%M:%S %d/%m/%Y")

	call append (0, s:first)
	call append (1, s:type)
	call append (2, s:author)
	call append (3, s:file)
	call append (4, s:created)
	call append (5, s:modified)
	call append (6, s:end)

	unlet s:comment
	unlet s:type
	unlet s:author
	unlet s:file
	unlet s:created
	unlet s:modified
	unlet s:first
	unlet s:end

endfunction


" FUNCTION:
" Update the date of last modification.
" Check the line number 5 looking for the pattern.

function s:update ()

	call s:filetype ()

	let s:pattern = s:comment . " MODIFIED: [0-9]"
	let s:line = getline (5)

	if match (s:line, s:pattern) != -1
		let s:modified = s:comment . " MODIFIED: " . strftime ("%H:%M:%S %d/%m/%Y")
		call setline (5, s:modified)
		unlet s:modified
	endif

	unlet s:comment
	unlet s:pattern
	unlet s:line

endfunction


autocmd BufNewFile * call s:insert ()
autocmd BufWritePre * call s:update ()

