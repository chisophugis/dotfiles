" Vim filetype plugin file.
" Language:	Lua 4.0+
" Maintainer:	Max Ischenko <mfi@ukr.net>
" Last Change:	2008 Mar 25

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" Set 'formatoptions' to break comment lines but not other lines, and insert
" the comment leader when hitting <CR> or using "o".
" MY MODIFICATION. allows long lines and (in particular long strings) to get
" wrapped. I can see how someone would get annoyed by this if they don't
" religiously keep their lines under 80 columns, but since I do (or at
" least welcome an annoying wrap to remind me that I'm getting too deep),
" it's not a problem.
"setlocal fo-=t fo+=croql
setlocal fo+=croql

setlocal com=:--
setlocal cms=--%s
setlocal suffixesadd=.lua


" The following lines enable the macros/matchit.vim plugin for
" extended matching with the % key.

set cpo-=C
if exists("loaded_matchit")

  let b:match_ignorecase = 0
  let b:match_words =
    \ '\<\%(do\|function\|if\)\>:' .
    \ '\<\%(return\|else\|elseif\)\>:' .
    \ '\<end\>,' .
    \ '\<repeat\>:\<until\>'

endif " exists("loaded_matchit")
