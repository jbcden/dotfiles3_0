pacman -Syu

# https://wiki.archlinux.org/index.php/PostgreSQL
package=("community/tmux" "community/neovim" "postgresql" "ripgrep" "jq" "tree" "redis" "xclip" "hub" "bat")

# install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
cd -
# TODO fix this
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# Upgrade ruby build
cd "$(rbenv root)"/plugins/ruby-build && git pull
