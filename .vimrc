" a `GC` comment indicates that I have flagged some stuff for removal,
" pending a little bit of field testing to see if it has a negative effect.
" From time to time, search for `GC` and erase stuff marked with such comments.

"GC: pointless filetype detection.
"after/scripts.vim detects this

"TODO: consolidate different tab styles. e.g. 'algebraic', 'kernel', etc.

" Terminal settings --- {{{
" These settings make things kinda wonky (but still bearable) when not in
" tmux, but I shouldn't not be in tmux anyway.
set term=screen-256color
set t_Co=256
set termencoding=utf-8
" }}}

" General options --- {{{
let mapleader = "\\"
let maplocalleader = "-"
" Loading a syntax file slows down startup by about a tenth of a second.

" For some reason, having no syntax highlighting makes me read code better
" (my eyes seem to slow down and 'bounce around' less and instead actually
" 'read' it more carefully).
" turn it back on for a bit
syntax on
"syntax off
filetype plugin on
filetype indent on

set exrc
set secure

set hlsearch
set autochdir
set nonumber
set autoindent
set incsearch

" if you ever customize 'statusline' to make it really useful, then you
" will probably want to set this to 2.
set laststatus=1

" when have I ever wanted to only replace the first occurrence on a line?
set gdefault

" enable modeline recognition
set modeline

" change how multiple possibilities for an autocompletion are handled
set wildmenu
set wildmode=list:longest,full

" keep track of where we are better
set cursorline

" f prevents forking, must be set in .vimrc since fork may already have
" occurred by the time .gvimrc is read
set guioptions=agif

"sacrifice using the arrow keys in insert mode for instant ESC-O response
set noesckeys

"use gq to do the equivalent of :!fmt
set textwidth=75

" sane default: most code using tabs uses 8-space tabs
set tabstop=8

" make vsplit behavior like tmux's
set splitright

set virtualedit=block
" }}}

" Colorscheme stuff --- {{{

" zenburn: I like the underline for `public', `protected', and `private'
" inkpot: I like the lighter background for string literals and header includes

" stuff that solarized needs in order to look right
"let g:solarized_termcolors=256
"set background=dark

".gvimrc is run after .vimrc, so this sets just for terminal vim
"colorscheme 256-grayvim " good for C++
"colorscheme darkblue
"colorscheme default
"colorscheme delek
"colo soso " awesome neutral on light bg (good for C++) (pleases me)
"colorscheme inkpot
"colorscheme jellybeans " good for C++
"colorscheme lucius " good for C++
"colorscheme molokai
"colorscheme morning " !!!
"colorscheme solarized
"colorscheme wombat256
"colorscheme xoria256
"colorscheme zenburn
"colorscheme shine " very pleasing
"colorscheme silent
" }}}

" Miscellaneous keybindings {{{
" Stolen from shivaram's vimrc. for when angry and willing to take the
" hands off the home row.
nnoremap <up> gk
nnoremap <down> gj

"tab switching commands
noremap <C-l> gt
noremap <C-h> gT

" I don't use Tabularize too often, but when it's needed, it's needed.
nnoremap <leader>t :Tabularize<cr>
vnoremap <leader>t :Tabularize<cr>
nnoremap <leader>T :Tabularize /
vnoremap <leader>T :Tabularize /

" adjust tabbing easily
nnoremap <leader>i :set tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab<cr>
nnoremap <leader>d :set tabstop=8 shiftwidth=8 softtabstop=8 expandtab<cr>
nnoremap <leader>s :setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab<cr>
nnoremap <leader>S :setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab<cr>
" 'algebraic' style. Naming stems from the fact that I started using this
" heavily while working on ~/coding/cpp/algebraic/
nnoremap <leader>a :setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab<cr>

nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>rv :source $MYVIMRC<cr>
nnoremap <leader>eg :tabedit $MYGVIMRC<cr>

nnoremap <leader>w :set invwrap<cr>
" For some reason this stopped putting you at the same line you were
" already on.
"nnoremap <leader>v :tabe %<cr>
nnoremap <leader>v :execute ":tabe +" . line(".") . " %"<cr>
nnoremap <leader>V <c-w>T

" experimental
nnoremap <leader>E :tabe<space>

nnoremap <leader>r :source %<cr>

nnoremap <leader>p :execute "rightbelow vsplit " . bufname("#")<cr>

set makeprg=ninja
nnoremap <f9> :make<cr>

" http://shallowsky.com/blog/linux/editors/vim-ctrl-space.html
imap <Nul> <Space>

" }}}

" Showing invisible characters {{{
set list
" Use Knuth-y underspace for trailing space
" I once had a problem with › where it would show up wrong. Use ` instead
" (I've actually come to prefer it, since it is smaller).
set listchars=tab:`\ ,trail:␣"⎕",eol:◺
" prefixing an option with `inv' INVerts it (aka toggles it on and off)
" (you can also suffix it with `!`)
nnoremap <leader>l :set invlist<cr>
" some intersting characters that I ultimately didn't use
"¬▸⏎⌄⌞⌝
" experimental. note that \%# is used to match the cursor position, so that
" we aren't marking red the area that we are just typing.
match Error /\s\+\%#\@!$/
" }}}

" Ignore .class files and other stuff {{{
set suffixes=.class,.aux,.log,.pdf,.dvi,.gz,.hi,.o,.bbl,.blg,.beam,.pyc,.bc
" same thing, but for tab completion when e.g. opening a file
" note that line continuation is done by a backslash at the beginning of
" the *next* line
set wildignore+=*.gz,*.hi,*.o,*.so
               \*.beam,*.pyc,*.class,
               \*.aux,*.log,*.pdf,*.dvi,*.bbl,*.blg,*.toc
               \*.bc
" }}}

" Filetype settings --- {{{
" these could go into .vim/ftdetect/
augroup filetype_settings
" see LVSTHW ch14 for the purpose of this incantation
autocmd!

" Stuff for golang
set runtimepath+=$GOROOT/misc/vim


" when I'm using txt and not rst, I want tabby
" NOT
"autocmd FileType text setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab
autocmd FileType text setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" kernel style
autocmd FileType c setlocal tabstop=8 shiftwidth=2 softtabstop=2 expandtab
"autocmd BufNewFile,BufRead *.c,*.cpp,*.cc setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab

" Clang-format works pretty well for GLSL too ;)
autocmd FileType c,cpp,glsl map <C-K> :pyf ~/.vim/clang-format.py<CR>
" Generally, there is a conflict between C and C++ header files, since in a
" lot of projects C++ headers are named with a .h extension.
autocmd BufNewFile,BufRead *.h setlocal ft=cpp

autocmd BufNewFile,BufRead *.md setlocal ft=
autocmd BufNewFile,BufRead README setlocal ft= tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" go back to 'algebraic' indenting style
" we might have a conflict with .h files with the kernel-style rule
autocmd BufNewFile,BufRead *.cpp,*.cc,*.hpp,*.hh setlocal ft=cpp
autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType cpp.doxygen setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab comments^=:///
autocmd BufNewFile,BufRead *.cuh setlocal ft=cuda

autocmd BufNewFile,BufRead *.gyp,*.gypi setlocal ft=python

" ^= is like +=, except it puts it at the front. In this case it is
" necessary to give `///` higher precedence.
"set comments^=:///

"autocmd FileType rst setlocal tabstop=3 shiftwidth=3 softtabstop=3 expandtab
autocmd FileType rst setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

autocmd BufNewFile,BufRead **/*ninja*/**/*.h setlocal ft=cpp
autocmd BufNewFile,BufRead **/*llvm*/**/*.h setlocal ft=cpp.doxygen
autocmd BufNewFile,BufRead **/*llvm*/**/*.cpp setlocal ft=cpp.doxygen
autocmd BufNewFile,BufRead **/ldscript/*.h setlocal ft=cpp.doxygen
autocmd BufNewFile,BufRead **/qt/**/*.h setlocal ft=cpp

" js looks better like this
autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
"try to go with the philosophy of javascript being a 'dynamic C'
autocmd FileType css setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

autocmd FileType tcl setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

autocmd BufNewFile,BufRead *.json setlocal ft=json

" Mathematica, not matlab.
autocmd BufNewFile,BufRead *.m setlocal ft=mma
autocmd BufNewFile,BufRead *.mma setlocal ft=mma
autocmd BufNewFile,BufRead *.wl setlocal ft=mma
autocmd FileType mma setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab comments=sr:(*,mb:*,ex:*)

autocmd BufNewFile,BufRead *.qml setlocal ft=qml
autocmd FileType qml setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

"make omnicomplete perform better in CWEB
autocmd FileType cweb setlocal iskeyword+=_

"python indentation is better with 4 spaces
"so is java's
autocmd FileType python,java setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
"autocmd BufNewFile,BufRead *.sml setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" this is actually copypasta from python and java
"autocmd BufNewFile,BufRead *.d setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
"dtrace's D scripts, not Digital Mars.
"autocmd BufNewFile,BufRead *.d setlocal ft=dtrace
autocmd FileType dtrace setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab

autocmd BufNewFile,BufRead .clang-format setlocal ft=yaml

autocmd BufNewFile,BufRead *.fun,*.sig setlocal ft=sml

autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal textwidth=72

" Forth, not Fortran (also, wtf does the forth ft do anyway?? there's
" nothing to do for forth)
autocmd BufNewFile,BufRead *.f,*.fth setlocal ft=

" R, not REXX
autocmd BufNewFile,BufRead *.R setlocal ft=r

" LLVM, not lifelines
autocmd BufNewFile,BufRead *.ll setlocal ft=llvm
autocmd FileType llvm setlocal iskeyword+=. nowrap tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd BufNewFile,BufRead *.td setlocal ft=tablegen
autocmd FileType tablegen setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

autocmd FileType noweb setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType cmake setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType sql setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" gas, unfortunately
autocmd BufNewFile,BufRead *.s,*.S setlocal ft=asm
autocmd FileType asm setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

" I think I'll be using NASM/YASM for now
" I might use gas later
autocmd BufNewFile,BufRead *.asm setlocal ft=asm
autocmd FileType nasm setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab

"for now, I'll be using .inc files as include files for yasm
"autocmd BufNewFile,BufRead *.inc setlocal ft=nasm tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab
" clang uses these for defining node types, so it will be cpp for now
" (along with .def)
autocmd BufNewFile,BufRead *.inc,*.def setlocal ft=cpp

autocmd BufNewFile,BufRead *.ninja setlocal ft=ninja
autocmd Filetype ninja setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

autocmd BufNewFile,BufRead *.modulemap setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

"autocmd BufNewFile,BufRead *.tex setlocal ft=context
autocmd Filetype context setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype tex setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" systemd files use the .desktop format
autocmd BufNewFile,BufRead *.service,*.socket,*.device,*.mount,*.automount,
    \*.swap,*.target,*.path,*.timer,*.snapshot setlocal ft=desktop

" don't give nasty red highlight for curly braces nested inside
" parentheses. although this happens rarely, there are legitimate places
" for it, and it is annoying to see them highlighted as though they were an
" error.
let c_no_curly_error = 1
"let c_no_bracket_error = 1 " might be needed someday

" ccan uses _info files to describe modules
autocmd BufNewFile,BufRead _info setlocal ft=c

"help expand help cmdline-special
autocmd BufWritePost *.gpi silent! !gnuplot %:p

" see LVSTHW ch18. makes triple { and } indicate folds
autocmd FileType vim setlocal foldmethod=marker

autocmd FileType markdown set ft=
autocmd FileType javascript noremap <buffer> -b :call JsBeautify()<cr>

augroup END
" }}}



" stuff for vim-latex --- {{{
augroup vim_latex
autocmd!
" Automatically run latex on every save
autocmd BufWritePost *.tex silent! call Tex_RunLaTeX()
"autocmd BufWritePost *.tex silent :! bibtex %<
augroup END

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
"set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
" turn off annoying placeholders, hopefully
let g:Imap_UsePlaceHolders = 0
" }}}

" Stuff for LLVM development. Hardcode this until I can come up with a
" better way.
set path+=~/pg/llvm/include/

" Does this work?
set path+=..
set path+=../..
set path+=../../..

" This has adverse performance impact on startup time
call pathogen#infect()
