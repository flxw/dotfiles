# environment variables
export PATH="/opt/local/bin:$PATH"
export PATH="$HOME/node_modules/.bin:$HOME/Library/Python/3.7/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"

status --is-interactive; and source (jenv init -|psub)

export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=/usr/bin/python3
