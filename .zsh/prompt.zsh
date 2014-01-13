# ========
#  Prompt
# ========

build_prompt () {

  # build the prompt from a more readable array of chunks

  # defines the `fg' array of colors
  autoload -U colors && colors

  PROMPT_CHUNKS=(

    # cyan username
    "%{$fg[cyan]%}"
    "%n"
    "%{$reset_color%}"

    # colon then directory
    ":%~ "

    # prompt char
    # blue if last cmd was successful, red otherwise
    "%{%(?.$fg[blue].$fg[red])%}"
    "%#" # `%' (or `#' if root)
    "%{$reset_color%}"

    " " # extra space of breathing room
  )

  # return ''.join(PROMPT_CHUNKS)
  echo -n ${(j::)PROMPT_CHUNKS}
}

unset PROMPT
export PROMPT="$(build_prompt)"
