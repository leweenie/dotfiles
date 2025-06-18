# ➜
# -------------------- INITIAL LOAD ---------------------

# fastfetch
# cat ~/.cache/wal/sequences
# clear

bindkey -s '^F' 'tmux_sessionizer\n'

# ------------------ PRE-CONFIGURATION ------------------ 

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh package manager installation
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"


# powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ----------------------- PLUGINS -----------------------

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit

# persistence
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

# ignore case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ----------------------- ALIASES -----------------------

# listing
alias l='eza -lh --icons=auto' # long list
alias ls='eza -1 --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

# important
alias token='cat $HOME/.token'
alias notes='cd ~/notes && nvim $(date +"notes-%Y-%m-%d-%s").md'

# scripts
alias ss="~/.bin/terminal-search.sh"
alias opr="~/.bin/open-curr-repo"
alias ws="~/.bin/wallpaper-switcher"

# maintenance
alias update="sudo pacman -Syu; yay -Syu"
alias cleanup="sudo pacman -Scc; yay -Scc"

# misc
alias f="fastfetch"
alias tt="ttyper"
alias y="yazi"
alias books="books; exit"
alias spt="spotify_player"
alias vim="nvim"
alias vi="nvim"
alias p="python"

cd() {
  case "$1" in
    .2) builtin cd ../.. ;;
    .3) builtin cd ../../.. ;;
    .4) builtin cd ../../../.. ;;
    .5) builtin cd ../../../../.. ;;
    *) builtin cd "$@" ;;
  esac
}
# ----------------------- ENV VARS ----------------------

export PATH="$HOME/.venv/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export CONFIG="$HOME/.config/alacritty/alacritty.toml"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
