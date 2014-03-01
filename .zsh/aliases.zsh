# alias file for my zsh configuration
# Last Edit: 11.12.2013
# git aliases
alias g='git'
alias gst='git status'
alias gl='git pull'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gd='git diff | mate'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias grst='git reset --hard HEAD'
alias gf="git fetch"
alias be="bundle exec"
alias bec="bundle exec cucumber"

# ls aliases
alias ls='/bin/ls -A --color=auto --sort=extension'
alias l='ls -lh'

# make program calls faster and more convenient
alias vim='~/bin/vim.sh'
alias du='du -h'
alias mpc='ncmpcpp'
alias vless='vim -u ~/.vim/less.vim'
alias slay='echo "Eat shit and die!"; kill -9'
alias rm_empties="rm -r **/*(/^F)"
#! power management
alias hib='echo "No swap - No hibernate!"'
alias susp='systemctl suspend'
alias poweroff='ncmpcpp stop; mpd --kill; systemctl poweroff'
alias reboot='systemctl reboot'
alias =clear
alias skype='xhost +local: && su skype -c skype'
alias ssqueak='cd ~h/thirsem/swa/squeak; ./squeak.sh; cd -1'
alias supervise='~/node_modules/supervisor/lib/cli-wrapper.js'
alias bower='~/node_modules/bower/bin/bower'

# cd aliases
alias cdc='cd ~/../code'
alias cdh='cd ~/..'
alias ..2="cd ../.."
alias ..3="cd ../../.."
# named directories
eval h="/home/$USER"

# mount aliases
alias mntusb='mount /media/usb1'
alias umntusb='umount /media/usb1'
alias mntusb2='mount /media/usb2'
alias umntusb2='umount /media/usb2'
alias mnthp='mnthp.sh'
alias umnthp='fusermount -u ~h/android'
