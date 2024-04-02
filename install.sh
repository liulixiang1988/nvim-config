#!/bin/bash

sudo apt update -qq -y
sudo apt upgrade -qq -y

# required
sudo apt install -y build-essential zlib1g-dev libssl-dev unzip

# recommended
sudo apt install -y libreadline-dev libsqlite3-dev \
                    libffi-dev libbz2-dev liblzma-dev

# tools
sudo apt install -y procps net-tools lsof sysstat


curl -sS https://webi.sh/pathman | sh
curl -sS https://webi.sh/aliasman | sh
curl -sS https://webi.sh/dotenv | sh
curl -sS https://webi.sh/watchexec | sh
curl -sS https://webi.sh/bat | sh
curl -sS https://webi.sh/curlie | sh

curl -sS https://webi.sh/fd | sh
curl -sS https://webi.sh/jq | sh
curl -sS https://webi.sh/yq | sh

curl -sS https://webi.sh/node | sh
curl -sS https://webi.sh/golang | sh
curl -sS https://webi.sh/goreleaser | sh
curl -sS https://webi.sh/rustlang | sh
curl -sS https://webi.sh/zig | sh
curl -sS https://webi.sh/pyenv | sh
curl -sS https://webi.sh/powershell | sh

curl -sS https://webi.sh/k9s | sh
curl -sS https://webi.sh/kind | sh
curl -sS https://webi.sh/kubectx | sh
curl -sS https://webi.sh/kubens | sh

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
sudo az aks install-cli

# dotnet
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh --version latest
rm -rf dotnet-install.sh
dotnet tool install -g dotnet-counters
dotnet tool install -g dotnet-dump
dotnet tool install -g dotnet-gcdump
dotnet tool install -g dotnet-sos
dotnet tool install -g dotnet-symbol
dotnet tool install -g dotnet-trace
dotnet tool install -g dotnet-stack

pathman add ~/.dotnet
pathman add ~/.dotnet/tools

# Check architecture and set it to a variable
ARCH=$(uname -m)

# Install nvim based on the architecture
if [ "$ARCH" = "x86_64" ]; then
    # Install nvim for x86_64 architecture
    source ./x64.sh
elif [ "$ARCH" = "aarch64" ]; then
    # Install nvim for ARM architecture
    # Add the appropriate installation command here
    echo "ARM architecture detected"
else
    echo "Unsupported architecture"
    exit 1
fi

install_nvim
install_lazygit
install_ripgrep

source ./scripts/install_common.sh
install_tmux
install_docker
install_anaconda

source ./common.sh

