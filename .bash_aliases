# NeoVim, always
alias vi="nvim"
alias vim="nvim"

# Just so I sleep better...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Nice to have
alias grep='grep --color=auto'
alias ls='ls --color=auto -h'
alias ll='ls -la'
alias mkdir='mkdir -p'
alias cd..='cd ..'
alias ..='cd ..'

# Secret exports. Add everything that should not be uploaded to uploaded to github...
if [ -f ~/.bash_secret_exports ]; then
    . ~/.bash_secret_exports
fi
