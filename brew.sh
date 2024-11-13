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
# Install a modern version of Bash.
brew install bash
brew install bash-completion@2

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
# brew install php
# brew install gmp

# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# brew install ack
# brew install exiv2
# brew install git-lfs
# brew install gs
# brew install imagemagick
# brew install lua
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rlwrap
# brew install ssh-copy-id
# brew install tree
# brew install vbindiff
# brew install zopfli

# Install other useful binaries.
brew install nvm
brew install git
brew install pinentry-mac
brew install adr-tools

brew install --cask 1password
brew install --cask aws-vault
brew install --cask brave-browser
brew install --cask browserstacklocal
brew install --cask discord
brew install --cask docker
brew install --cask dropbox
brew install --cask firefox
brew install --cask iterm2
brew install --cask microsoft-teams
brew install --cask nordvpn
brew install --cask obsidian
brew install --cask openoffice
brew install --cask pgadmin4
brew install --cask signal
brew install --cask sizeup
brew install --cask slack
brew install --cask spotify
brew install --cask steam
brew install --cask tidal
brew install --cask visual-studio-code

# Install latest ruby and common gems
brew install ruby
gem update --system
gem update

# Install iOS/Android development tools
brew install --cask android-studio
brew install fastlane
brew install --cask temurin@20

# Install cocoapods and xcodeproj
gem install cocoapods
gem install xcodeproj

# Install latest python
brew install python

# Remove outdated versions from the cellar.
# This also cleans up casks
brew cleanup
