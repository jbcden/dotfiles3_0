#!/bin/sh

for name in $(ls configs/); do
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      echo "WARNING: $target exists but is not a symlink."
    fi
  else
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ]; then
      echo "Creating $target"
      ln -s "$PWD/configs/$name" "$target"
    fi
  fi
done

mkdir -p ~/.config/nvim
ln -s $PWD/init.vim ~/.config/nvim/init.vim

# if [ ! -e "$target" ]; then
#   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# fi
# vim -u ~/.vimrc +BundleInstall +qa
