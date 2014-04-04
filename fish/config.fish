if status --is-login
    setenv PATH $PATH ~/.gem/ruby/2.0.0/bin ~/bin

    # -- fish options --
    setenv BROWSER chromium

    # for less colors
    #setenv LESS_TERMCAP_mb '\E[01;31m'       # begin blinking
    #setenv LESS_TERMCAP_md '\E[01;38;5;74m'  # begin bold
    #setenv LESS_TERMCAP_me '\E[0m'           # end mode
    #setenv LESS_TERMCAP_se '\E[0m'           # end standout-mode
    #setenv LESS_TERMCAP_so '\E[38;5;246m'    # begin standout-mode - info box
    #setenv LESS_TERMCAP_ue '\E[0m'           # end underline
    #setenv LESS_TERMCAP_us '\E[04;38;5;146m' # begin underline

    # for grep result coloration
    setenv GREP_OPTIONS '--color=auto'
    setenv GREP_COLORS 'ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36'

    # editor and pager variables
    setenv EDITOR 'vim'
    setenv PAGER 'less'

    eval (dircolors -c ~/.dircolors)
end

. "$HOME/.config/fish/functions/aliases.fish"
