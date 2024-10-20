#!/usr/bin/bash

# This overwrites the current dotfiles with the ones from
# this repo

set -e

cp .bashrc ../.bashrc
cp .bash_aliases ../.bash_aliases
mkdir -p ../.emacs.d
cp .emacs.d/init.el ../.emacs.d/init.el
