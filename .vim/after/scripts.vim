" Awesome!
" Source:
" http://www.openscenegraph.org/projects/osg/wiki/Support/FAQ#WhatcanIdotomakemyeditorrecognizeOSGheadersasCfiles
"
" This file *has* to be called scripts.vim, but it can be in any of the
" directories in the runtimepath (see `:set runtimepath?` to see the
" possible locations).
"
" See here for more info (the comment header, mostly).
" http://tuxproject.de/projects/vim/scripts.vim
"

" FIXME: Why is this not even being called?

" regex tweaked to support both OSG and LLVM style headers
if getline(1) =~ '-*- \?[cC]++ \?-*-'
  set filetype=cpp
endif

"TODO: find a way to make this work with .def files
