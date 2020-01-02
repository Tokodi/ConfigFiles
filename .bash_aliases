if [ -x "$(command -v nvim.appimage)" ]; then
    alias vim="nvim.appimage"
    alias vimdiff="vim -d -O"
fi

alias ll="ls -la"
