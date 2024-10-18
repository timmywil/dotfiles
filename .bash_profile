# https://github.com/microsoft/vscode/issues/151105
export PROMPT_COMMAND="history -a"

# Add Gpg4win to the PATH
export PATH="/c/Program Files (x86)/GnuPG/bin:$PATH"

# Add OpenSSH installation to PATH
# https://github.com/PowerShell/Win32-OpenSSH/wiki/Install-Win32-OpenSSH-Using-MSI
export PATH="/c/Program Files/OpenSSH:$PATH"

# Add yarn bin to the `$PATH`
# export PATH="$HOME/AppData/Local/Yarn/bin:$PATH"

# Add OpenJDK Java to PATH
export PATH="$PATH:/c/Program Files/Eclipse Adoptium/jdk-20.0.2.9-hotspot/bin"

# Add Android SDK to PATH
export ANDROID_HOME="$HOME/AppData/Local/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"

# Add Flutter to PATH
export PATH="$PATH:$HOME/code/flutter/bin"

# Add Dart executables to PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Test Flutter in Brave
export CHROME_EXECUTABLE="/c/Program Files/BraveSoftware/Brave-Browser/Application/brave.exe"

# Add lcov tools in Windows
export PATH="$PATH:/c/ProgramData/chocolatey/lib/lcov/tools/bin"

# Add python to PATH
export PATH="$PATH:/c/Python27/"
export PYTHONPATH="/c/Python27/"
export PYTHON="/c/Python27/python.exe"

# Configure PKG_CONFIG_PATH
# See brew issue for cairo https://github.com/Homebrew/homebrew/issues/14123
# export PKG_CONFIG_PATH="/opt/X11/lib/pkgconfig"

# Set up environment for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

## Use Ruby from rbenv
# eval "$(rbenv init -)"

# Docker vars
#export DOCKER_HOST="tcp://192.168.99.100:2376"
#export DOCKER_CERT_PATH="$HOME/.docker/machine/machines/dinghy"
#export DOCKER_TLS_VERIFY=1
#export DOCKER_MACHINE_NAME=dinghy

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

# Enable tab completion for `g` by marking it as an alias for `git`
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# Run ssh-agent so we don't have to input
# passphrase for ssh every time
# env=~/.ssh/agent.env

# agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

# agent_start () {
#     (umask 077; ssh-agent >| "$env")
#     . "$env" >| /dev/null ; }

# agent_load_env

# # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
# agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

# if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
#     agent_start
#     ssh-add ~/.ssh/id_ed25519
# elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
#     ssh-add ~/.ssh/id_ed25519
# fi
