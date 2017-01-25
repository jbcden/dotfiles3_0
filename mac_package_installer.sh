brew_taps=("bsiegel/tap" "caskroom/cask" "codeclimate/formulae" "codekitchen/dinghy" "goles/battery" "homebrew/boneyard" "homebrew/core" "homebrew/dupes" "homebrew/science" "homebrew/services" "homebrew/versions" "joshuaclayton/formulae" "manastech/crystal" "railwaycat/emacsmacport" "simeji/jid")
packages=("android-sdk" "crystal-lang" "fontconfig" "jbig2dec" "libsigsegv" "macvim" "openssl" "r" "vim" "autoconf" "cscope" "freetype" "gnuplot" "jid" "libssh" "mongodb" "optipng" "rbenv" "spark" "watch" "automake" "ctags" "fswatch" "gnutls" "jpeg" "libtasn1" "monit" "p11-kit" "rbenv-gem-rehash" "sqlite" "wget" "awscli" "dinghy" "gcc" "go" "jpegoptim" "libtiff" "mpfr" "parallel" "rbenv-gemset" "terraform" "wxmac" "battery" "dlite" "gd" "graphviz" "jq" "libtool" "msgpack" "pcre" "readline" "the_silver_searcher" "xhyve" "bdw-gc" "dnsmasq" "gdbm" "haproxy" "kdiff3" "libxml2" "mysql56" "perl" "reattach-to-user-namespace" "tmate" "xz" "boot2docker" "docker" "gettext" "haskell-stack" "leiningen" "libxslt" "nettle" "phantomjs" "redis" "tmux" "cabal-install" "docker-compose" "ghc" "heroku" "libevent" "libyaml" "nmap" "pidcat" "ripgrep" "tree" "cairo" "docker-machine" "ghostscript" "heroku-toolbelt" "libffi" "little-cms2" "node" "pixman" "ruby" "unfs3" "chromedriver" "elixir" "git" "hub" "libmpc" "llvm" "noti" "pkg-config" "ruby-build" "unixodbc" "codeclimate" "emacs-mac" "glib" "imagemagick" "libpcl" "llvm35" "oniguruma" "python" "ruby-install" "unused" "coreutils" "erlang" "gmp" "isl" "libpng" "lua" "openssh" "qt" "sbt" "utf8proc")

for tap in ${brew_taps[@]}; do
  brew tap $tap
done

for package in ${packages[@]}; do
  brew install $package
done
