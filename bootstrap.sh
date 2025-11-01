#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")";

cp ./.aliases ~/
cp ./.bash_profile ~/
cp ./.bashrc ~/.bashrc
cp ./.bash_prompt ~/
cp ./.extra ~/
cp ./.gitconfig ~/
cp ./.gitattributes ~/
cp ./.gitignore-global ~/
cp ./.functions ~/
cp ./.exports ~/
cp ./.yarnrc.yml ~/

source ./.bash_profile;
