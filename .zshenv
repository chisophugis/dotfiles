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

# Homebrew was complaining that /usr/loca/bin/ wasn't before /bin/, which
# isn't an order that makes sense (/usr/local/bin is more specific).
export PATH=/usr/local/bin:$PATH
