#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")";

rsync --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude ".idea/" \
	--exclude ".macos" \
	--exclude ".gitignore" \
	--exclude "bootstrap.sh" \
	--exclude "README.md" \
	--exclude "LICENSE-MIT.txt" \
	--exclude "iterm.json" \
	--exclude ".vscode/" \
	--exclude "gpg-agent.conf" \
	-avh --no-perms . ~;

# Add gpg-agent.conf to ~/.gnupg
cp -f gpg-agent.conf ~/.gnupg/;

source ~/.bash_profile;
