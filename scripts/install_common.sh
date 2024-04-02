#!/bin/sh
# install zsh
function install_zsh() {
    sudo apt install zsh -y
    chsh -s $(which zsh)
    
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

function install_tmux() {
    echo "installing tmux"
    sudo apt install tmux -y
    if [ ! -d ~/.tmux/plugins/tpm ]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
    
    cp .tmux.conf ~/
}

function install_docker() {
    echo "installing docker"
    # Add Docker's official GPG key:
    sudo apt-get install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}

function install_anaconda() {
    echo "installing Anaconda"
    wget -P /tmp https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh
    bash /tmp/Anaconda3-2024.02-1-Linux-x86_64.sh -b -p $HOME/anaconda3
    pathman add $HOME/anaconda3/bin
}