# Add Android SDK tools to the `$PATH`
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Add Java to the `$PATH`
# export JAVA_HOME=$(/usr/libexec/java_home)
# export PATH=${PATH}:${JAVA_HOME}/bin

# Add Homebrew bin to `$PATH`
export PATH=/opt/homebrew/bin:$PATH

# Opt out of Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Add fastlane to the `$PATH`
# export PATH="$HOME/.fastlane/bin:$PATH"

# Configure PKG_CONFIG_PATH
# See brew issue for cairo https://github.com/Homebrew/homebrew/issues/14123
export PKG_CONFIG_PATH="/opt/X11/lib/pkgconfig"

# Set up environment for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

## Use Ruby from rbenv
eval "$(rbenv init -)"

# Docker vars
#export DOCKER_HOST="tcp://192.168.99.100:2376"
#export DOCKER_CERT_PATH="$HOME/.docker/machine/machines/dinghy"
#export DOCKER_TLS_VERIFY=1
#export DOCKER_MACHINE_NAME=dinghy

# pyenv
#export PYENV_ROOT=/usr/local/var/pyenv
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# macOS Sierra no longer saves SSH passphrases to the keychain
ssh-add -A &> /dev/null

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";

	if [ -r "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ]; then
		source "$(brew --prefix)/etc/bash_completion.d/git-completion.bash";
	fi;
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
