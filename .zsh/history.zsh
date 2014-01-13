# =========
#  History
# =========

setopt APPEND_HISTORY HIST_FCNTL_LOCK
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS

# for sharing between different shells I have open
alias readhist='fc -RI'
alias writehist='fc -WI'

export HISTSIZE=200 # size of the internal history
export SAVEHIST=$(($HISTSIZE / 2)) # how big to let `HISTFILE' get
export HISTFILE=~/.zsh_history

# ====================
#  Directory stacking
# ====================

alias dh=dirhist dirhist='dirs -v'
export DIRSTACKSIZE=5
setopt AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_MINUS

