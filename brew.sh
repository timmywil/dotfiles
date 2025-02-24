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

# Install rbenv to manage Ruby versions
brew install rbenv

# Update existing gems
gem update --system
gem update
gem cleanup

# Install Java
brew install --cask temurin@20

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install python
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
brew install awscli
brew install lcov

# These casks update themselves
brew list --cask 1password &>/dev/null || brew install --cask 1password
brew list --cask android-studio &>/dev/null || brew install --cask android-studio
brew list --cask aws-vault &>/dev/null || brew install --cask aws-vault
brew list --cask brave-browser &>/dev/null || brew install --cask brave-browser
brew list --cask discord &>/dev/null || brew install --cask discord
brew list --cask docker &>/dev/null || brew install --cask docker
brew list --cask dropbox &>/dev/null || brew install --cask dropbox
brew list --cask firefox &>/dev/null || brew install --cask firefox
brew list --cask iterm2 &>/dev/null || brew install --cask iterm2
brew list --cask microsoft-teams &>/dev/null || brew install --cask microsoft-teams
brew list --cask obsidian &>/dev/null || brew install --cask obsidian
brew list --cask openoffice &>/dev/null || brew install --cask openoffice
brew list --cask session-manager-plugin &>/dev/null || brew install --cask session-manager-plugin
brew list --cask signal &>/dev/null || brew install --cask signal
brew list --cask sizeup &>/dev/null || brew install --cask sizeup
brew list --cask slack &>/dev/null || brew install --cask slack
brew list --cask spotify &>/dev/null || brew install --cask spotify
brew list --cask steam &>/dev/null || brew install --cask steam
brew list --cask tidal &>/dev/null || brew install --cask tidal
brew list --cask visual-studio-code &>/dev/null || brew install --cask visual-studio-code

# These casks can be updated via brew upgrade
brew install --cask browserstacklocal
brew install --cask pgadmin4

# Remove outdated versions from the cellar.
# This also cleans up casks
brew cleanup
