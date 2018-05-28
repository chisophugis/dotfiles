# temporary extensions to $PATH for convenience when I'm working on stuff.

# export PATH=~/pg/llvm/release+asserts/bin:$PATH

# for LLVM/clang phabricator
#export PATH="$PATH:/home/sean/pg/others/phab/arcanist/bin"

# for <http://www.bravegnu.org/gnu-eprog/index.html>
#export PATH="$PATH:/home/sean/pg/toolchains/arm-2012.09/bin"

export PATH="$PATH:./node_modules/.bin"

export GYP_GENERATORS='ninja'

export GOPATH=/home/sean/pg/go/
#export GOROOT=/opt/go
#export PATH="$PATH:$GOROOT/bin"

path+=(~/pg/others/arcanist/bin/)

# Note: enabling uniquing of $PATH and friends
# <http://zsh.sourceforge.net/Contrib/startup/users/debbiep/dot.zshenv>
#typeset -U path

# This needs to be at the front, since Ubuntu seems to have some qt stuff
# in /usr/bin/.
# BTW, this is how you "prepend" to zsh arrays.
# <http://www.zsh.org/mla/workers/2013/msg00044.html>
path[1,0]=(/opt/qt51/5.1.1/gcc_64/bin)

path[1,0]=(/opt/clang+llvm-5.0.1-x86_64-linux-gnu-ubuntu-16.04/bin)

alias tclman="man -e tcl"
alias tkman="man -e tk"

# For CS530
#alias vtkpython=~/pg/others/VTK-build/bin/vtkpython

# I don't know what this does without this option, because it doesn't seem
# to copy to the clipboard.
alias xclip="xclip -selection clipboard"

export NUPIC_CORE=/home/sean/pg/others/numenta/nupic.core

path+=(/opt/clion-2016.1.2/bin)
path+=(~/.cargo/bin)

#. /home/sean/pg/others/torch/install/bin/torch-activate


# Following:
# https://alliseesolutions.wordpress.com/2016/09/08/install-gpu-tensorflow-from-sources-w-ubuntu-16-04-and-cuda-8-0-rc/
# Also add the path to CUPTI.
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
export CUDA_HOME=/usr/local/cuda
export PATH="$CUDA_HOME/bin:$PATH"
