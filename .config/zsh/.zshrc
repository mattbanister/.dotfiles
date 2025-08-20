#!/bin/sh

DEBUG=false

if [ $DEBUG = true ]; then 
    zmodload zsh/zprof
fi

HISTFILE=~/.zsh_history
setopt appendhistory

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

# pyenv
pyenv() {
    case ":$PATH:" in
	*:$HOME/.pyenv/shims:*) echo "pyenv shims found on path.";;
	*) echo "pyenv shims not found on path.  Initializing pyenv and virtualenvwrapper...\n";;
    esac
    if which pyenv > /dev/null; then eval "$(command pyenv init -)"; fi
    pyenv virtualenvwrapper_lazy
    pyenv "$@"
}

#cargo
source $HOME/.cargo/env

if [ $DEBUG = true ]; then 
    zprof
fi
