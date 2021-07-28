#!/usr/bin/env bash
# shellcheck disable=SC1090

export DOTFILES=$HOME/.dotfiles
export INCLUDES=$HOME/.local/share/dotfiles

source "$DOTFILES/env"
source "$DOTFILES/aliases"
source "$HOME/.fzf.bash"

source /usr/share/bash-completion/bash_completion

eval "$(dircolors "$DOTFILES/dircolors")"

RESET="$(tput sgr0)"

BLUE="$(tput setaf 4)"
GREEN="$(tput setaf 2)"
GREY="$(tput setaf 244)"
RED="$(tput setaf 1)"
YELLOW="$(tput setaf 3)"

git_prompt() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ -n "$BRANCH" ]; then
    echo -n "$YELLOW$BRANCH"

    STATUS=$(git status --short 2> /dev/null)

    if [ -n "$STATUS" ]; then
      echo " ${RED}✗"
    fi
  fi
}

vim_prompt() {
  if [ -n "$VIMRUNTIME" ]; then
    echo ":${GREEN}sh ";
  fi
}

PS1="
\[$(vim_prompt)$BLUE\w$(git_prompt)\]
\[$GREY\]$ \[$RESET\]"

# uncomment this when using nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# uncomment this when using pyenv/virtualenv
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
