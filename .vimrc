set shell=/bin/bash
set nocompatible
filetype off  " required!

" PACKAGE LIST {{{
" Use this variable inside your local configuration to declare
" which package you would like to include
if ! exists('g:vimified_packages')
    let g:vimified_packages = ['general', 'os', 'coding', 'python', 'lua', 'javascript', 'color']
endif
" }}}

" VUNDLE {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" }}}

" _. General {{{
if count(g:vimified_packages, 'general')
    " Project and file navigation
    Plugin 'scrooloose/nerdtree'

    "Fuzzy file, buffer, mru and tag finder.
    Plugin 'kien/ctrlp.vim'

    " The plugin provides mappings to easily delete, change and add suc:h surroundings in pairs.
    Plugin 'tpope/vim-surround'

    " Fancy status/tabline
    Plugin 'bling/vim-airline'

    " console in buffers
    Plugin 'rosenfeld/conque-term'
endif
" }}}

" _. Coding {{{
if count(g:vimified_packages, 'coding')

   " Plugin for Git
   Plugin 'Xuyuanp/nerdtree-git-plugin'
   Plugin 'tpope/vim-fugitive'
   Plugin 'airblade/vim-gitgutter'

   " Plugin for mercurial
   " Plugin 'Lawrencium'
   " gitv is a 'gitk clone' plugin for the text editor Vim
   Plugin 'gregsexton/gitv'
   " A Vim plugin for managing three-way merges.
   Plugin 'sjl/splice.vim'
   " Shows colored signs in buffer indicating diff with original svn/git file,
   " Plugin 'svndiff'

   " Commenter
   Plugin 'scrooloose/nerdcommenter' 

   " Syntastic is a syntax checking plugin that runs files through external syntax checkers and displays any resulting errors to the user.
   Plugin 'scrooloose/syntastic'
   let g:syntastic_enable_signs=1
   let g:syntastic_auto_loc_list=1

   " ColorV is a vim plugin tries to make colors handling easier.
   Plugin 'Rykka/colorv.vim'

   " A Vim plugin for visually displaying indent levels in code
   Plugin 'nathanaelkane/vim-indent-guides'
   
   " Syntax highlighting for JSON
   Plugin 'leshill/vim-json'

   " Tagbar displays the tags of the current file in a sidebar.
   Plugin 'majutsushi/tagbar'

   " Add smart aligment with space to line up test
   Plugin 'godlygeek/tabular'

   " Add markdown support 
   Plugin 'plasticboy/vim-markdown'

   " Add Dockerfile support
   Plugin 'docker/docker', {'rtp': '/contrib/syntax/vim'}

   " Add nginx.conf syntax support
   Plugin 'vim-scripts/nginx.vim'

   " auto-close quote/brracket etc.
   Plugin 'Raimondi/delimitMate'

   " save session
   Plugin 'tpope/vim-obsession'
   Plugin 'dhruvasagar/vim-prosession'
endif
" }}}

" _. Python {{{
if count(g:vimified_packages, 'python')
   " refactoring library for python
   Plugin 'klen/python-mode'
   
   " Jedi-vim autocomplete plugin
   "Plugin 'davidhalter/jedi-vim' 		
   
   " Combined Python 2/3 for Vim
   Plugin 'mitsuhiko/vim-python-combined'  
endif
" }}}

" _. Ruby {{{
if count(g:vimified_packages, 'ruby')
   Plugin 'vim-ruby/vim-ruby'
   Plugin 'tpope/vim-haml'
   Plugin 'tpope/vim-cucumber'
   Plugin 'tpope/vim-endwise'
   Plugin 'tpope/vim-rails'
endif
" }}}

" _. Lua {{{
if count(g:vimified_packages, 'lua')
   Plugin 'vim-misc'
   "Plugin 'xolox/vim-lua-inspect'
endif
" }}}
"
" _. CSS {{{
if count(g:vimified_packages, 'css')
   Plugin 'cakebaker/scss-syntax.vim'
endif
" }}}

" _. JavaScript {{{
if count(g:vimified_packages, 'javascript')
   Plugin 'jelera/vim-javascript-syntax'
   " Fork of bronson's vim-jquery which is now gone
   Plugin 'itspriddle/vim-jquery'
   Plugin 'pangloss/vim-javascript'
   Plugin 'vim-coffee-script'
endif
" }}}

" _. Haskell {{{
if count(g:vimified_packages, 'haskell')
    Plugin 'Twinside/vim-syntax-haskell-cabal'
    Plugin 'lukerandall/haskellmode-vim'

    au BufEnter *.hs compiler ghc

    let g:ghc = "/usr/local/bin/ghc"
    let g:haddock_browser = "open"
endif
" }}}

" _. OS {{{
if count(g:vimified_packages, 'os')
    " Add the syntax highlight for tmux config files
    Plugin 'zaiste/tmux.vim'
endif
" }}}

" _. Color {{{
if count(g:vimified_packages, 'color')
    Plugin 'nanotech/jellybeans.vim'
    Plugin 'desert256.vim'
endif
" }}}

filetype plugin indent on " Automatically detect file types. (must turn on after Vundle)

" Local vimrc configuration {{{
let s:localrc = expand($HOME . '/.vim/local.vimrc')
if filereadable(s:localrc)
    exec ':so ' . s:localrc
endif
" }}}

call vundle#end()
filetype plugin indent on
