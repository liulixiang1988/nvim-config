#!/bin/sh

if [ ! -d ~/.config/nvim ]; then
    echo "Cloning nvim config"
    git clone git@github.com:liulixiang1988/nvim-config.git ~/.config/nvim
fi

