## Prompt
# zgitinit and prompt_wunjo_setup must be somewhere in your $fpath, see README for more.


# Load the prompt theme system
autoload -U promptinit; promptinit
autoload -U zgitinit;   zgitinit
autoload -U colors;     colors
autoload -U zrecompile; zrecompile

function n0stradamus_scm_status() {
		zgit_isgit || return

		local -a MARK

        MARK="-"

		if ! zgit_isworktreeclean; then
				MARK+="d"
		fi
		
		if zgit_hasunmerged; then
				MARK+="m"
		fi

		if zgit_hasuntracked; then
				MARK+="u"
		fi

        if [ "$MARK" = "-" ]; then
            MARK=""
        fi

        echo "(($(zgit_head)$MARK))"
}

## ---------------------
## the hacker prompt
## ---------------------
# First Line
PROMPT="%{$fg[blue]%}[%*]%{$reset_color%} "
PROMPT+="%B<%b%{$fg[green]%}%n%{$fg[red]%}@%{$fg[yellow]%}%M%{$reset_color%}%B>%b "
PROMPT+="%B%{$fg[orange]%}%~%b"

# line break, begin of the second line
PROMPT+="
"
#PROMPT+="[%{$fg[green]%}%h%{$reset_color%}] "
PROMPT+="%# "

# The right-handside stuff
RPROMPT="%(?.%B\$(n0stradamus_scm_status)%b.%{$fg[red]%}%? life sux :'(%{$reset_color%})"

## ----------------------
## Options
## ----------------------
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first

setopt autocd
setopt promptsubst
setopt autopushd pushdminus pushdsilent pushdtohome
