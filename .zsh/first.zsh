randline () {

  # print a random line from each file given

  if (( $# == 0 ))
  then
    echo "usage: randline file [file...]"
    return 1
  fi

  for i in $argv
  do
    integer z=$(wc -l <$i)
    sed -n $[RANDOM % z + 1]p $i # $[...] evaluates an arithmetic expression
  done

}

namedir () {

  # make the current directory a named directory

  # When completing these TODOs, use techniques from zshexpn(1) to do it
  # programmatically and concisely
  #
  # also, don't fail to use the builtin `getopt' to parse the options!
  #
  # TODO: can add a -p option for making it permanent (i.e. appending it to
  # some designated .zsh/data/namedirs file)
  # TODO: -l option for listing all named dirs in .zsh/namedirs

  eval "$1=$PWD"
  : ~$1

}

# TODO
# could write some functions for managing `cdpath' easily
