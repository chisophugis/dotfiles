# ============================================
#  Utilities for navigating code repositories
# ============================================

vim-grep vgrep () {

  # open vim with matching files

  pattern=$1
  shift

  # check for suffixes
  if [[ ${1[1,1]} == '(' && ${1[-1,-1]} == ')' ]]; then
    suffixes=".$1"
    shift
  fi

  if [[ ${#argv} != 0 ]]; then
    DIRECTORIES="(${(j:|:)argv})/"
  fi

  glob="$DIRECTORIES**/*$suffixes"
  files=( $(grep -l $pattern ${~glob} ) )

  if [[ ${#files} == 0 ]]; then
    echo "Nothing found"
  else
    vim -p +/$pattern $files
  fi
}
