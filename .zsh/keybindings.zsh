# ==============
#  Key Bindings
# ==============

# vi keybindings
bindkey -v

# reverse i-search
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward

# make delete behave normally
bindkey -M viins '^?' backward-delete-char

# stash current line (so much faster than deleting and pasting)
bindkey -M viins '^k' push-line

# execute line but keep it in the buffer for modification
bindkey -M viins '^j' accept-and-hold

# rather useless in vi, but in the shell, this is handy
bindkey -M vicmd K run-help

# when you need to quote difficult things, this is a blessing
bindkey -M vicmd "'" quote-line

# experimental: use "jk" instead of esc
#bindkey -M viins 'jk' vi-cmd-mode # leave insert mode
#bindkey -M viins '^[' redisplay # make esc do "nothing"

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
