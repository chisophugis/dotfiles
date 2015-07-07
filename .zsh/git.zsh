# Convenience git aliases

# TODO: explain use cases for each one

# In conjunction with my script viq (i.e. vgg), this allows doing:
#     $ gg SomeSearch
#     $ v
# The latter command essentially runs `vgg SomeSearch`
# This is convenient for navigating source repositories. You first narrow
# down your gg search, then when it is pared down enough you just say `v`
# to open all the results in vim.
alias gg='git grep'
alias v='eval "v$(fc -l -n -1)"'


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
