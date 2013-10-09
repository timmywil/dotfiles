#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
	--exclude ".idea/" --exclude ".gitignore" \
	--exclude "README.md" --exclude "LICENSE-MIT.txt" -av --no-perms . ~
source ~/.bash_profile
