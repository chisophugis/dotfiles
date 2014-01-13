" Filenames should be in the format `foo.<markup-ft>.<code-ft>.nw`
" So, for example, foo.tex.cpp.nw gives
"    noweb_language = 'cpp'
"    noweb_backend = 'tex'
let noweb_language = fnamemodify(@%, ":e:e:r")
let noweb_backend = fnamemodify(@%, ":e:e:e:r:r")

execute "runtime! syntax/" . noweb_backend . ".vim"
if exists("b:current_syntax")
	unlet b:current_syntax
endif

syntax match codeChunkStart "^<<.*>>=$" display
syntax match codeChunkEnd "^@$" display
highlight link codeChunkStart Type
highlight link codeChunkEnd Type


execute "syntax include @Code syntax/" . noweb_language . ".vim"
syntax region codeChunk matchgroup=codeChunkDelim start="^<<.*>>=$" end="^@$" contains=@Code containedin=ALL keepend
" Urg.. not unlet'ing b:current_syntax made ninja.vim basically a noop.
unlet b:current_syntax
syntax include @Ninjacode syntax/ninja.vim
syntax region codeChunkNinja matchgroup=codeChunkDelim start="^<<build\.ninja>>=$" end="^@$" contains=@Ninjacode containedin=ALL keepend
highlight link codeChunkDelim Folded

syntax match codeChunkReference "^\s*<<.\{-}>>$" containedin=ALL contained
highlight link codeChunkReference Underlined
