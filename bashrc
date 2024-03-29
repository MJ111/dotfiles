#!/usr/bin/env bash
# shellcheck disable=SC1090

export DOTFILES=$HOME/.dotfiles
export INCLUDES=$HOME/.local/share/dotfiles

source "$DOTFILES/env"
source "$DOTFILES/aliases"
[ -z "$ZSH_NAME" ] && [ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash
#source "$HOME/.z/z.sh"

# uncomment this when using nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# uncomment this when using pyenv/virtualenv
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
