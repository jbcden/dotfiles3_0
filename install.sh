#!/bin/sh

git submodule update --remote

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

# Dependency for deoplete autocomplete plugin
if [ -x "$(command -v pip3)" ]; then
  pip3 install --user pynvim
else
  echo "pip is not installed, vim deoplete will not be usable until this is fixed"
fi

mkdir -p ~/.psql

vim -u ~/.vimrc +PackInitInstall
