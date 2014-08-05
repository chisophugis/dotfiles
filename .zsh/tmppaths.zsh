# temporary extensions to $PATH for convenience when I'm working on stuff.

# export PATH=~/pg/llvm/release+asserts/bin:$PATH

# for LLVM/clang phabricator
#export PATH="$PATH:/home/sean/pg/others/phab/arcanist/bin"

# for <http://www.bravegnu.org/gnu-eprog/index.html>
#export PATH="$PATH:/home/sean/pg/toolchains/arm-2012.09/bin"

export PATH="$PATH:./node_modules/.bin"

export GYP_GENERATORS='ninja'

export GOPATH=/home/sean/pg/go/
export GOROOT=/opt/go
export PATH="$PATH:$GOROOT/bin"

# Note: enabling uniquing of $PATH and friends
# <http://zsh.sourceforge.net/Contrib/startup/users/debbiep/dot.zshenv>
#typeset -U path

# This needs to be at the front, since Ubuntu seems to have some qt stuff
# in /usr/bin/.
# BTW, this is how you "prepend" to zsh arrays.
# <http://www.zsh.org/mla/workers/2013/msg00044.html>
path[1,0]=(/opt/qt51/5.1.1/gcc_64/bin)

alias tclman="man -e tcl"
alias tkman="man -e tk"

# For CS530
#alias vtkpython=~/pg/others/VTK-build/bin/vtkpython

# I don't know what this does without this option, because it doesn't seem
# to copy to the clipboard.
alias xclip="xclip -selection clipboard"
