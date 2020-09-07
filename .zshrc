# If you come from bash you might have to change your $PATH.
export PATH="/opt/local/bin:$PATH" # add macports
export PATH="$HOME/node_modules/.bin:$HOME/Library/Python/3.7/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/f.wolff/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lambda"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=/usr/bin/python3
