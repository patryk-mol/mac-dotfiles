#!/bin/zsh

# Apply dotfiles

echo "Applying dotfiles...\n\n"

git clone --bare git@github.com:patryk-mol/mac-dotfiles.git ./projects/mac-dotfiles
git --git-dir=$HOME/projects/mac-dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/projects/mac-dotfiles/ --work-tree=$HOME reset --hard

# Install plugins for Neovim

echo "\n\nInstalling Neovim plugins...\n\n"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "\n\nAfter starting Neovim exectue following commands:\n"
echo ": PlugInstall\n"
echo ": TSInstall bash c cpp css dockerfile gitignore json python swift yaml\n"
echo "\n"

