#!/bin/zsh

# Apply dotfiles

echo "Applying dotfiles...\n\n"

git clone --bare git@github.com:patryk-mol/mac-dotfiles.git ./projects/mac-dotfiles
git --git-dir=$HOME/projects/mac-dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/projects/mac-dotfiles/ --work-tree=$HOME reset --hard

