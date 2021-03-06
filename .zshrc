# =====================
#  Convenience Aliases
# =====================

# I have some stuff in here.
export PATH=~/bin:$PATH

# much more convenient dirs listing
alias dv='dirs -v'

# I've realized that this is one of the most common commands that I run
alias pl='print -l'

# make some common utilities a little bit nicer
alias grep='grep --directories=skip --color'
case "$(uname)" in

  Darwin)
    alias ls='ls -G -F' # no Mac equivalent of --group-directories-first

    ;;

  Linux)
    alias ls='ls --color --classify --group-directories-first'

    # Easier to type. There is a /bin/open symlinked to openvt(1), but I've
    # never used that program.
    # On mac it is already just `open`.
    alias open=xdg-open

    ;;

  *)
    ;;
esac

# shorter alias for this commonly used command
alias ll='ls -l'
alias lal='ls -al'

# in case it isn't symlinked in the filesystem
alias vi=vim

# ================================
#  Load other configuration files
# ================================

export MY_ZSH_DIR=~/.zsh/

function {
  for file in $MY_ZSH_DIR/*(.)
  do
    source $file
  done
}

# handle this one individually so that I can keep the z git repo checked
# out there, making it easier to update and such.
source $MY_ZSH_DIR/z/z.sh
# instead of running this precmd, I'm going to run it on chpwd (see below)

fpath=(~/.zsh/completion $fpath)

# Suggested by Bazel autocompletion script.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
#autoload -Uz compinit
#compinit

#autoload -z edit-command-line
#zle -N edit-command-line
#bindkey -M vicmd v edit-command-line

# Allow core dumping
ulimit -c unlimited

# =========
#  Options
# =========

# allow expansions to be done on the prompt.
# currently not used, but if I ever want to customize the prompt further,
# then it will be useful to have this.
setopt PROMPT_SUBST

# no need to remember another set of precedences for arithmetic operations
setopt C_PRECEDENCES

# enable a ton of indispensable globbing capabilities
setopt EXTENDED_GLOB

# prevent EXTENDED_GLOB from getting in the way
# e.g. of `git diff HEAD^..HEAD'
setopt NO_NOMATCH

# use pattern matching instead of string matching in `:s' and `:&' modifiers
setopt HIST_SUBST_PATTERN

# Print the exit value if failure.
setopt PRINT_EXIT_VALUE

chpwd () {
  (_z --add "$(pwd -P)") >/dev/null
  # I usually want to see what files are in a directory when I change to it
  ls
}

# add memory usage statistics
export TIMEFMT="%MK max mem %E real %U user %S system %J"


# ===============
#  Miscellaneous
# ===============

# Useful for mass moves and renames.
# Manpage is at zshcontrib(1).
# Note also that rename(1) can be used for this too.
autoload zmv

# XXX
# This seems to fix a problem where less(1) can't properly display
# reverse-video. It's really sketchy though. The idea behind it is that
# once we're inside tmux(1), we can set TERM to xterm-256color, but
# outside, tmux has to see TERM=screen-256color in order to work right.
if [[ -z $TMUX ]]; then
  export TERM=xterm-256color
else
  export TERM=screen-256color
fi

# nicer ninja status info
export NINJA_STATUS="%e - [%u/%r/%f] "
# Don't know why python stopped checking .pythonrc by default, but I need
# this for it to work.
export PYTHONSTARTUP=~/.pythonrc

# make pbcopy and pbpaste work under tmux
# http://superuser.com/a/413233/45827
alias pbcopy='reattach-to-user-namespace pbcopy'
alias pbpaste='reattach-to-user-namespace pbpaste'

# Raise this a bit.
ulimit -n 1024
