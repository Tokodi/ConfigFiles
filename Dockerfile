FROM alpine

ENV HOSTNAME dockerhost

# Install required packages
RUN apk --no-cache add \
        bash \
        neovim \
        make \
        sudo \
        gcc \
        g++ \
        git \
        cmake \
        curl \
        boost-dev \
        tmux \ 
        shadow \
        htop \
        openssl \
        openssl-dev \
        python2 \
        python2-dev \
        spdlog \
        spdlog-dev \
        python3 \
        python3-dev \
        py3-pip \
        clang  \
        musl-dev

# Create user
RUN useradd -ms /bin/bash tokodiandris

# Run everithing with user
USER tokodiandris

# Set home as working directory
WORKDIR /home/tokodiandris/repos

# Pull required repos
RUN git clone https://github.com/Tokodi/ConfigFiles.git
RUN git clone https://github.com/VundleVim/Vundle.vim.git /home/tokodiandris/.vim/bundle/Vundle.vim 

# Create nvim config directory
RUN mkdir -p /home/tokodiandris/.config/nvim

# Set simlinks
RUN ln -s /home/tokodiandris/repos/ConfigFiles/.bashrc /home/tokodiandris/.bashrc
RUN ln -s /home/tokodiandris/repos/ConfigFiles/.bash_aliases /home/tokodiandris/.bash_aliases
RUN ln -s /home/tokodiandris/repos/ConfigFiles/.tmux.conf /home/tokodiandris/.tmux.conf
RUN ln -s /home/tokodiandris/repos/ConfigFiles/init.vim /home/tokodiandris/.config/nvim/init.vim

# Install vim plugins
RUN nvim +PluginInstall +qall
