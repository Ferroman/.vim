"---------------------------------------------------------------------
" from Guido
" vimrc file for following the coding standards specified in PEP 8
"---------------------------------------------------------------------

" Number of spaces to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *py,*pyw set tabstop=4

" Replace tabs with the equivalent number of spaces.
" Also have an autocmd for Makefiles since they require hard tabs.
" Python: yes
" Makefile: no
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" Use the below highlight group when displaying bad whitespace is desired
" highlight BadWhitespace ctermbg=red guisp=red gui=undercurl guifg=NONE guibg=NONE

" Display tabs at the beginning of a line in Python mode as bad.
" au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
"au BufRead,BufNewFile *.py,*.pyw set textwidth=120

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
au BufNewFile *.py,*.pyw set fileformat=unix

" The following section contains suggested settings.  While in no way required
" to meet coding standards, they are helpful.

" Set the default file encoding to UTF-8: 
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all = 1
let python_highlight_indents = 0
let python_highlight_space_errors = 0
syntax on

" Wrap on these
au BufRead,BufNewFile *.py,*.pyw set whichwrap+=<,>,[,]

" highlight variable under cursor (not smart)
au BufRead,BufNewFile *.py,*.pyw  autocmd CursorMoved * silent! exe printf('match Visual /\<%s\>/', expand('<cword>'))
au BufRead,BufNewFile *.py,*.pyw  autocmd CursorMovedI * silent! exe printf('match Visual /\<%s\>/', expand('<cword>'))

"---------------------------------------------------------------------
" Plugins
"---------------------------------------------------------------------

" --------- Rope 

" Add rope complenition
let ropevim_vim_completion = 1
let ropevim_extended_complete = 1
let pymode_rope_autoimport_generate = 1

au BufRead,BufNewFile *.py,*pyw nnoremap <C-c>o :RopeOrganizeImports<CR>0<CR><CR>
au BufRead,BufNewFile *.py,*pyw nnoremap <C-c>i :RopeAutoImport<CR>
" --------- Pylint
"let g:PyLintCWindow = 1
"let g:PyLintSigns = 1
let g:PyLintOnWrite = 1
"let g:PyLintDissabledMessages = 'C0103,C0111,C0301,W0141,W0142,W0212,W0221,W0223,W0232,W0401,W0613,W0631,E1101,E1120,R0903,R0904,R0913'
