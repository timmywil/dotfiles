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

###-begin-pnpm-completion-###
if type complete &>/dev/null; then
  _pnpm_pkg_scripts () {
    local pkg="package.json"
    [ -f "$pkg" ] || return
    # Parse script names from package.json without external deps
    sed -n '/"scripts"/,/[}]/s/^ *"\([^"]*\)" *:.*/\1/p' "$pkg"
  }

  _pnpm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           SHELL=bash \
                           pnpm completion-server -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"

    if [ "$COMPREPLY" = "__tabtab_complete_files__" ]; then
      COMPREPLY=($(compgen -f -- "$cword"))
    fi

    # Add package.json scripts for `pnpm <script>` and `pnpm run <script>`
    if [ "$cword" -eq 1 ] || { [ "$cword" -eq 2 ] && [ "${words[1]}" = "run" ]; }; then
      local cur="${words[$cword]}"
      local scripts
      scripts=$(_pnpm_pkg_scripts)
      if [ -n "$scripts" ]; then
        COMPREPLY+=($(compgen -W "$scripts" -- "$cur"))
      fi
    fi

    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _pnpm_completion pnpm
fi
###-end-pnpm-completion-###

