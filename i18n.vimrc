"---------------------------------------------------------------------
" Charsets  and locale
"---------------------------------------------------------------------

" Change charset by F8
set wildmenu
 set wcm=<Tab>
 menu Encoding.koi8-r   :e ++enc=koi8-r<CR>
 menu Encoding.windows-1251 :e ++enc=cp1251<CR>
 menu Encoding.ibm-866      :e ++enc=ibm866<CR>
 menu Encoding.utf-8        :e ++enc=utf-8 <CR>
 map <F8> :emenu Encoding.<TAB>

"---------------------------------------------------------------------
" Russian key maps
"---------------------------------------------------------------------
" Fix cyrillic
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
map , ?
