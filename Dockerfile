#Use Ubuntu as base, if you want to use Arch (FROM archlinux::latest)
FROM ubuntu:24.04

# Skip the question regarding timezone etc, during installation
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
        neovim \
        git \
        zsh \
        curl \
        gcc \
        g++ \
        make \
        unzip \
        ripgrep \
        fd-find \
        fzf \
        python3 \
        nodejs \
        npm \
        && rm -rf /var/lib/apt/lists/*

# Create User
RUN useradd -m -s /usr/bin/zsh shofahi
USER shofahi
WORKDIR /home/shofahi

#Create configuration folders for dotfiles
RUN mkdir -p .config

#Copy 
COPY --chown=shofahi:shofahi ./nvim/.config/nvim /home/shofahi/.config/nvim
# COPY --chown=shofahi:shofahi ./tmux /home/shofahi/.config/tmux
# COPY --chown=shofahi:shofahi ./wezterm /home/shofahi/.config/wezterm

#Start zsh
CMD ["zsh"]

