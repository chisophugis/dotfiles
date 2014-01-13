# Convenience git aliases

# TODO: explain use cases for each one

alias gg='git grep'
alias gcb='git checkout --track -b'
alias gs='git status'
alias gap='git add -p'
alias gcv='git commit -v'
alias gco='git checkout'
alias grabpatch='git format-patch --stdout master | xclip -i'

# Need to use these more.
alias gsb='git show-branch'
alias gbvv='git branch -vv'

# Don't seem to use these very much.
alias gd='git diff'
alias gcm='git commit -m'
alias gb='git branch'
alias gri='git rebase --interactive'
alias gai='git add -i'
