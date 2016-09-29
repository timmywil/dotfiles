#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")";

rsync --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude ".idea/" \
	--exclude ".osx" \
	--exclude ".gitignore" \
	--exclude "bootstrap.sh" \
	--exclude "README.md" \
	--exclude "LICENSE-MIT.txt" \
	-avh --no-perms . ~;
source ~/.bash_profile;
