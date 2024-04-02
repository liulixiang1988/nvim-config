#!/bin/sh

function install_nvim() {
    echo "Installing nvim"
    #set nvim tar file path
    file_path="nvim-linux64.tar.gz"
    rm -rf $file_path
    echo "Downloading nvim"
    curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -o $file_path
    echo "Extracting nvim"
    rm -rf ~/.local/opt/nvim-linux64
    tar -C ~/.local/opt -xzf $file_path
    rm -rf $file_path
    pathman add ~/.local/opt/nvim-linux64/bin
}

function install_lazygit() {
    echo "Installing lazygit"
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz -C ~/.lcoal/bin/
    rm -rf lazygit.tar.gz
}

function install_ripgrep() {
    echo "Installing ripgrep"
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
    sudo dpkg -i ripgrep_13.0.0_amd64.deb
    rm -rf ripgrep_13.0.0_amd64.deb
}