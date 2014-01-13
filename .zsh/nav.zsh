# =========================================
#  Utilities for Navigating the Filesystem
# =========================================

up () {
  if [[ $# == 0 ]]; then
    cd ..
  else
    go_to=''
    for ((i = 0 ; i != $1 ; ++i)) do
      go_to+='../'
    done
    cd $go_to
  fi
}

noprefix () {
  print -l * | sed -e 's/^'$PWD:t'//'
}
