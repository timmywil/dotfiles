#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")";

cp ./.aliases ~/
cp ./.bash_profile ~/
cp ./.bash_prompt ~/
cp ./.extra ~/
cp ./.gitconfig ~/
cp ./.gitattributes ~/
cp ./.gitignore-global ~/
cp ./.functions ~/
cp ./.exports ~/
cp ./.npmrc ~/

source ./.bash_profile;
