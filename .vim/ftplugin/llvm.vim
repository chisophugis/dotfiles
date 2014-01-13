"Boilerplate
" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
" Don't load another plugin for this buffer
let b:did_ftplugin = 1





"Note to me: this makes vim automatically add the leading `;` when it wraps
"lines.
setlocal formatoptions+=croql
setlocal comments=:;

" This make it so that various values with sigils and other 'not regular
" identifier characters' can easily be followed with the `*` and `#` keys
" without spuriously running into similarly-named constants.
setlocal iskeyword+=!,#,.,%,@
