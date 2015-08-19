" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *.js set tabstop=4

" Replace tabs with the equivalent number of spaces.
au BufRead,BufNewFile *.js set expandtab
