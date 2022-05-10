if [[ $TERM = (*256color|*rxvt*) ]]; then
  orange="%{${(%):-"%F{166}"}%}"
else
  orange="%{${(%):-"%F{yellow}"}%}"
fi

PROMPT='${orange}λ${reset_color} %~/ $(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
