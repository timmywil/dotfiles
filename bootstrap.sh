#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")";

cp ./.aliases ~/
cp ./.bash_profile ~/
cp ./.bash_prompt ~/
cp ./.extra ~/
cp ./.gitconfig ~/
cp ./.gitignore-global ~/
cp ./.functions ~/
cp ./.exports ~/
#cp ./.gnupg/gpg-agent.conf ~/.gnupg/
cp ./.gnupg/gpg.conf ~/.gnupg/
#cp -r ~/.gnupg/* ~/AppData/Roaming/gnupg/

source ~/.bash_profile;
