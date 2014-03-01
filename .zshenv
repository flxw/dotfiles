fpath=($fpath $HOME/.zsh/func)
typeset -U fpath

# set PATH to include my own binaries
if ! echo "$PATH" | grep -q gem; then
    export PATH=$PATH:"$HOME"/.gem/ruby/2.0.0/bin
fi

if ! echo "$PATH" | grep -q "$HOME/bin"; then
    export PATH=$PATH:"$HOME/bin"
fi

# for less
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# for grep result coloration
export GREP_OPTIONS='--color=auto'
export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36'

# editor and pager variables
export EDITOR='vim'
export PAGER='less'

# set the LS_COLORS variable for color of the completion: {{{
eval `dircolors -b ~/.dircolors`
#}}}
