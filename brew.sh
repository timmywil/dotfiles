#!/usr/bin/env bash

xcode-select --install
# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
#brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install haproxy
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# For Clojure/Emacs
brew install leiningen
brew install the_silver_searcher
brew install boot-clj

# Pylon stuff
brew install pyenv
brew install redis
brew install postgresql
brew install pyenv-virtualenv
brew install graphviz

# Cook companion deployment
brew install amazon-ecr-credential-helper

# Install git-flow
brew install git-flow-avh

# Install latest ruby and common gems
brew install rbenv
gem update --system
gem update

# Install nvm for managing node versions
brew install nvm

# Install native apps
#brew untap caskroom/versions
#brew tap caskroom/versions

brew cask install docker 2> /dev/null
brew cask install dropbox 2> /dev/null
brew cask install firefox 2> /dev/null
brew cask install firefoxdeveloperedition 2> /dev/null
brew cask install imagealpha 2> /dev/null
brew cask install imageoptim 2> /dev/null
brew cask install iterm2 2> /dev/null
brew cask install java 2> /dev/null
brew cask install macvim 2> /dev/null
brew cask install opera 2> /dev/null
brew cask install opera-developer 2> /dev/null
brew cask install the-unarchiver 2> /dev/null
brew cask install torbrowser 2> /dev/null
brew cask install transmission 2> /dev/null
brew cask install ukelele 2> /dev/null
brew cask install vagrant 2> /dev/null
brew cask install virtualbox 2> /dev/null
brew cask install vlc 2> /dev/null

# Cook companion deployment
brew cask install aws-vault

# Remove outdated versions from the cellar.
# This also cleans up casks
brew cleanup
