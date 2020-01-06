# .bashrc

# Handy way to keep aliases in a separate file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# append to the history file, don't overwrite
shopt -s histappend

# setting history length
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and resize if neccessary
shopt -s checkwinsize

# Simple command prompt
if [ "$HOSTNAME" = dockerhost ]; then
    PS1='\[\e[0;32m\][\w]$ \[\e[m\]'
else
    PS1='\[\e[1;33m\][\w]$ \[\e[m\]'
fi

# Support more colors
export TERM='xterm-256color'

# Nvim appimage should be stored here
export PATH="~/Downloads/:$PATH"

# If tmux is manually built, add it to the path
export PATH="~/Downloads/tmux:$PATH"

