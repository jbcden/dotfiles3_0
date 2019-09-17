brew_taps=("bsiegel/tap" "caskroom/cask" "goles/battery" "homebrew/core" "homebrew/services" "joshuaclayton/formulae" "simeji/jid")
packages=("neovim" "android-sdk" "fontconfig" "jbig2dec" "libsigsegv" "openssl" "vim" "autoconf" "cscope" "freetype" "jid" "libssh" "optipng" "rbenv" "watch" "automake" "ctags" "fswatch" "gnutls" "jpeg" "libtasn1" "sqlite" "wget" "gcc" "jpegoptim" "libtiff" "parallel" "rbenv-gemset" "battery" "dlite" "gd" "jq" "libtool" "msgpack" "pcre" "readline" "the_silver_searcher" "xhyve" "haproxy" "libxml2" "perl" "reattach-to-user-namespace" "gettext" "haskell-stack" "libxslt" "redis" "tmux" "docker-compose" "ghc" "libevent" "libyaml" "nmap" "pidcat" "ripgrep" "tree" "ghostscript" "libffi" "node" "ruby" "elixir" "git" "hub" "libmpc" "llvm" "noti" "pkg-config" "ruby-build" "glib" "imagemagick" "libpcl" "python" "ruby-install" "unused" "coreutils" "libpng" "lua" "openssh" "qt" "bat" "postgres")
casks=("chromedriver")

if hash brew 2>/dev/null; then
  echo "brew is already install"
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

for tap in ${brew_taps[@]}; do
  brew tap $tap
done

for cask in ${casks[@]}; do
  brew cask install $cask
done

for package in ${packages[@]}; do
  brew install $package
done
