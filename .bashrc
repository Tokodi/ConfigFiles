############################################################
#                           General                        #
############################################################

# Support 256 colors if possible
export TERM='xterm-256color'

# Set promt color and format

# Handy way to keep aliases in a separate file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

############################################################
#                           History                        #
############################################################

# Append to history file, don't override it
shopt -s histappend

# Max number of lines to store in history (memory)
HISTSIZE=1000

# Max number of lines to store in history (file)
HISTFILESIZE=2000

############################################################
#                           Promt                          #
############################################################

PS1='\[\e[1;33m\][\w]$ \[\e[m\]' # Yellow

# TODO: Different color for different hosts
#PS1='\[\e[0;32m\][\w]$ \[\e[m\]' # Green
#PS1='\[\e[0;31m\][\w]$ \[\e[m\]' # Red

# NOTES
# https://www.howtogeek.com/307701/how-to-customize-and-colorize-your-bash-prompt/

############################################################
#                    Required packages                     #
############################################################

# TODO: Auto install based on host OS

# Midnight Commander
# https://midnight-commander.org
# apt install mc
# brew install mc

# TMUX
# https://github.com/tmux/tmux
# apt install tmux
# brew install tmux

# NeoVim
# https://neovim.io
# apt install neovim
# brew install neovim

# The Silver Searcher
# https://github.com/ggreer/the_silver_searcher
# apt install silversearcher-ag
# brew install ag

# CTags
# https://github.com/universal-ctags/ctags
# apt install ctags
# brew install ctags
