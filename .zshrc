#### PRELOAD #### 

fastfetch


#### PLUGINS #### 

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


#### ALIASES #### 

alias vi='nvim'
alias f='fastfetch';
alias so='source ~/.zshrc'
alias ls='ls --color=auto --format=single-column'

alias update='sudo pacman -Syu; yay -Syu'
alias cleanup='sudo pacman -Scc; yay -Scc'

alias sf=$HOME/.scripts/search.sh
alias opr=$HOME/.scripts/github.sh
alias notes='mkdir -p $HOME/notes && nvim $HOME/notes/$(date +"note-%h-%d-%Y-%s").typ'

cd() {
  case "$1" in
    .2) builtin cd ../.. ;;
    .3) builtin cd ../../.. ;;
    .4) builtin cd ../../../.. ;;
    .5) builtin cd ../../../../.. ;;
    *)  builtin cd "$@" ;;
  esac
}


#### ENV ####

export PS1='%n@%m:%~ %# '
export MANPAGER='nvim +Man!'
export PATH="$HOME/.scripts:$PATH"
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
