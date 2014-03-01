#-------------------------#
#      FUNCTIONS          #
#-------------------------#
# function directory
fpath=($fpath $HOME/.zsh/func)
typeset -U fpath

function chpwd() {
  case "$TERM" in
    screen|screen.rxvt)
      print -Pn "\ek%-3~ $a\e\\" # set screen title
      print -Pn "\e]2;%-3~ $a\a" # set xterm title
      ;;
    rxvt|rxvt-unicode|rxvt-unicode-256color|xterm|xterm-color)
      print -Pn "\e]0;urxvt: %~\a"
      ;;
  esac
}
