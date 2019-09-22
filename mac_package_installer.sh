packages=("neovim" "android-sdk" "libsigsegv" "openssl" "vim" "autoconf" "cscope" "freetype" "libssh" "optipng" "rbenv" "automake" "ctags" "fswatch" "gnutls" "jpeg" "sqlite" "wget" "gcc" "jpegoptim" "libtiff" "parallel" "rbenv-gemset" "dlite" "libtool" "msgpack" "pcre" "readline" "the_silver_searcher" "xhyve" "haproxy" "libxml2" "perl" "reattach-to-user-namespace" "gettext" "libxslt" "redis" "tmux" "docker-compose" "libevent" "libyaml" "pidcat" "ghostscript" "libffi" "node" "ruby" "git" "hub" "libmpc" "noti" "pkg-config" "ruby-build" "glib" "imagemagick" "libpcl" "python" "ruby-install" "coreutils" "libpng" "lua" "openssh" "qt" "postgres" "kubectl")
casks=("chromedriver")

if hash brew 2>/dev/null; then
  echo "brew is already install"
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

for cask in ${casks[@]}; do
  brew cask install $cask
done

for package in ${packages[@]}; do
  brew install $package
done
