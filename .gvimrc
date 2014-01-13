"gvim color settings
"colorscheme dawn
"colorscheme biogoo
"colorscheme winter
colorscheme proton " best for TeX/LaTeX
"colorscheme soso
"colorscheme wombat256
"wombat
"jellybeans is good too
"molokai
"native
"twilight

"set guifont=Deja\ Vu\ Sans\ Mono\ 8
set guifont=Deja\ Vu\ Sans\ Mono\ 9
"set guifont=Monaco\ 9
"set guifont=Consolas\ 10

"autocmd BufEnter *.py colo proton
autocmd BufEnter *.py colo biogoo
autocmd BufEnter *.sml,*.fun,*.sig colo blackboard
"autocmd BufEnter *.sml colo wombat
autocmd BufEnter *.h,*.cc,*.cpp colo darkspectrum
autocmd BufEnter *.tex colo proton

" http://stackoverflow.com/a/13525574/394436
" I think that excessive menubar usage of vim-latex was causing unity to
" have high CPU usage.
set guioptions-=m
set guioptions-=T

"autocmd BufEnter *.hs colorscheme molokai
"autocmd BufLeave *.hs colorscheme wombat256

