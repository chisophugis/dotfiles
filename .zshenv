# ======================
#  Environment Settings
# ======================

# I have some programs in here
if [[ ! $PATH =~ $(print ~/bin) ]]; then
  export PATH=~/bin:${PATH}
fi

# lightweight and doesn't clear the screen
export FCEDIT=ed

# use something vi-like
export {EDITOR,VISUAL}=vi

export CC=clang
export CXX=clang++
