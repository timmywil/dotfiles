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
	-avh --no-perms . ~;

source ~/.bash_profile;
