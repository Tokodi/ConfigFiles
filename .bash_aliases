if [ -x "$(command -v nvim.appimage)" ]; then
    alias vim="nvim.appimage"
    alias vimdiff="vim -d -O"
fi

alias ls='ls --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'
alias oports='netstat -tulanp'
