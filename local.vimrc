" vimrc configuration for Python{{{
let s:pythonrc = expand($HOME . '/.vim/python.vimrc')
if filereadable(s:pythonrc)
    exec ':so ' . s:pythonrc
endif
" }}}

let s:rubyrc = expand($HOME . '/.vim/ruby.vimrc')
if filereadable(s:rubyrc)
    exec ':so ' . s:rubyrc
endif
" }}}

" vimrc configuration for JavaScript{{{
let s:javascriptrc = expand($HOME . '/.vim/javascript.vimrc')
if filereadable(s:javascriptrc)
    exec ':so ' . s:javascriptrc
endif
" }}}

" vimrc i18n configuration {{{
let s:i18nrc = expand($HOME . '/.vim/i18n.vimrc')
if filereadable(s:i18nrc)
    exec ':so ' . s:i18nrc
endif
" }}}

" Automatically indent based on file type: 
filetype indent on

" Automaticaly enuble plugin by file type:
filetype plugin on

" Keep indentation level from previous line: 
set autoindent

" Disable read-only protection
set autoread

" Change cursor in Insert mode (for Konsole in KDE4)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"---------------------------------------------------------------------
" File formats support 
"---------------------------------------------------------------------

" .conf
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif 

" Json
au! BufRead,BufNewFile *.json setfiletype json 
" json formatting
command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool

"---------------------------------------------------------------------
" gVim - related staff
"---------------------------------------------------------------------
set guifont=Terminus\ 14

syntax enable
set t_Co=256
set background=dark
colorscheme jellybeans

"---------------------------------------------------------------------
" Common settings
"---------------------------------------------------------------------
set nocompatible 
set ruler

" Show full tags when doing search completion
set showfulltag

" Speed up macros
set lazyredraw

" Include $HOME in cdpath
let &cdpath=','.expand("$HOME")

" Enable backup files in temp folder
set noswapfile " disable swap - all buffers will be opened in memory
set backup
set backupdir=/tmp
set backupskip=/tmp/*
set writebackup

" Set mouse mod
set mouse=a
set mousemodel=popup

" Try to show at least three lines and two columns of context when
" scrolling
set scrolloff=3
set sidescrolloff=2

" Allow edit buffers to be hidden
set hidden
" 1 height windows
set winminheight=1

" Use the cool tab complete menu
set wildmenu
set wildignore=*.o,*~

" If possible, try to use a narrow number column.
setlocal numberwidth=4

set fillchars=fold:-

" Exit from insert mode
imap jj <Esc>

" Disable Ex mode hotkey
:nnoremap Q <Nop>

" Vim markdown folding
let g:vim_markdown_folding_disabled=1

"---------------------------------------------------------------------
" completion
"---------------------------------------------------------------------

"by tags
set dictionary=/usr/share/dict/words
let g:showfuncctagsbin = "/usr/bin/ctags"

"---------------------------------------------------------------------
" navigation
"---------------------------------------------------------------------

" --------- Split windows

" Easy split window navigation
" use ALT+navigation key to switch split windows
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" --------- Tab settings 

" Tab change by Alt-Left/Right
nmap <M-Right> gt
nmap <M-Left> gT
imap <M-Right> <C-O>gt
imap <M-Left> <C-O>gT

" Tabbar plugin settings (changa tab by Alt+tab number)
hi Tb_Changed ctermbg=black ctermfg=yellow " Colour of changed tab
hi Tb_VisibleChanged ctermbg=black ctermfg=magenta " Colour of current changed tab

" --------- Disk navigation
" nerdcommenter settings
let mapleader = ","

" nerdcommander, file explorer. Required NERDTree plugin
noremap <silent> <F10> :NERDTreeToggle<CR>
let NERDTreeWinSize = 25 
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.swp$', '\~$']

" --------- Projects
let g:proj_flags = "imstg"

"---------------------------------------------------------------------
" autocmds
"---------------------------------------------------------------------

setlocal foldcolumn=1

" show line numbers
set number

" Save currnet buffer
imap <F2> <Esc>:w<CR>a
nmap <F2> :w<CR>
 
" Save all buffers
imap <S-F2> <Esc>:wa<CR>a
nmap <S-F2> :wa<CR>

"---------------------------------------------------------------------
" Vim 7.3 configs
"---------------------------------------------------------------------

" Persistent undo
set undodir=/tmp/
set undofile
set colorcolumn=80

" Show line number relative to current position
"set relativenumber

" disable relativenumbers for NerdTree buffer
autocmd FileType nerdtree setlocal norelativenumber

" --------- Svndiff
"let g:svndiff_autoupdate = 1 
"let g:hide_not_managed_warning = 1

"hi DiffAdd      ctermfg=0 ctermbg=2 guibg='green'
"hi DiffDelete   ctermfg=0 ctermbg=1 guibg='red'
"hi DiffChange   ctermfg=0 ctermbg=3 guibg='yellow'

"au BufRead,BufNewFile *.* call Svndiff("next")

" --------- Ctags
nnoremap <silent> <F9> :TagbarToggle<CR>

" --------- Ctrlp

" Ignore ycs, temp files and VCS dictionaries
set wildignore+=*.pyc,*.orig
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

"---------------------------------------------------------------------
" Search and grep params
"---------------------------------------------------------------------

" The Silver Searcher
" silversearcher-ag package should be installed
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


