# environment variables
export PATH="/opt/local/bin:$PATH"
export PATH="$HOME/node_modules/.bin:$HOME/Library/Python/3.7/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export EDITOR="vim"

export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=/usr/bin/python3

# start X upon login
if test (hostname) != "hackintosh"
  exit
end

if status --is-login && \
  systemctl -q is-active graphical.target && \
  test $DISPLAY -a $XDG_VTNR -ne 1
  exec startx
end
