
# usage shortcuts
alias ls="/usr/bin/ls -A --sort=extension --color=auto"
alias l="ls -lh"
alias ..2="cd ../../"
alias ..3="cd ../../../"
alias h="cd ~/.."


# git related shortcuts
alias undopush="git push -f origin HEAD^:master"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gca="git commit -a -m"
alias gc="git commit --verbose"
alias gbd="git branch -D"
alias gst="git status -sb --ignore-submodules"
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias gp="git push"
alias grs="git reset --soft"
alias grh="git reset --hard"
alias gb="git branch"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gba="git branch -a"
alias gcp="git cherry-pick"
alias gl="git lg"
alias gpom="git pull origin master"

# mounting aliases
alias mnthp="~/bin/mnthp.sh"
alias umnthp="fusermount -u ~/../android"
alias mntusb="mount /media/usb1"
alias umntusb="umount /media/usb1"

# turn on coloring on grep
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
