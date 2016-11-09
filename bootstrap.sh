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
	--exclude "emacs.d/" \
	-avh --no-perms . ~;

rsync --exclude ".git/" \
      --exclude ".gitignore" \
      -avh --no-perms emacs.d/ ~/.emacs.d/
source ~/.bash_profile;
