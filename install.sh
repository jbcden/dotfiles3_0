#!/bin/sh

git submodule update --remote --recursive --init


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

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  exit 1
else
  if ! [ -e ~/.vim/pack/minpac/opt/minpac ]; then
    git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
  fi
fi

# Dependency for deoplete autocomplete plugin
if [ -x "$(command -v pip3)" ]; then
  pip3 install --user pynvim
else
  echo "pip is not installed, vim deoplete will not be usable until this is fixed"
fi

mkdir -p ~/.psql

vim -u ~/.vimrc +PackInitInstall
