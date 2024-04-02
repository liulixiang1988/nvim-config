#!/bin/sh

if [ ! -d ~/.config/nvim ]; then
    echo "Cloning nvim config"
    git clone git@github.com:liulixiang1988/nvim-config.git ~/.config/nvim
fi

aliasman k "kubectl"
aliasman kdp "kubectl describe po"
aliasman kdd "kubectl describe deployment"
aliasman kgd "kubectl get deployment"
aliasman kgp "kubectl get po"
aliasman kgs "kubectl get svc"
aliasman kl "kubectl logs"

# dotnet credential provider
wget -qO- https://aka.ms/install-artifacts-credprovider.sh | bash

# python key ring
pip install keyring artifacts-keyring

