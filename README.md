# ConfigFiles

This repository contains my development environment configuration files.

#TODO(atokodi):
* Create script to set symlinks automatocally

#NOTES(atokodi):
* On mac the default shell is `zsh` to change that run `chsh -s /bin/bash`.
* By default, Terminal starts the shell via /usr/bin/login, which makes the shell a login shell. Put `source ~/.bashrc` in your `.bash_profile`.


Set symlinks:
* ln -s /path/to/repo/.bashrc /path/to/home/.bashrc
* ln -s /path/to/repo/.bash_aliases /path/to/home/.bash_aliases
* ln -s /path/to/repo/.tmux.conf /path/to/home/.tmux.conf
* ln -s /path/to/repo/init.vim /path/to/home/.config/nvim/init.vim
