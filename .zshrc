# ➜
# -------------------- INITIAL LOAD ---------------------

# fastfetch
# cat ~/.cache/wal/sequences
# clear

bindkey -s '^F' 'tmux-sessionizer\n'

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

# token
alias token='cat $HOME/.token'

# browse web
# alias ss='function _search() { nohup firefox --new-window "https://www.google.com/search?q=$*"; rm -rf nohup.out;}; _search'
alias ss='function _search() { nohup floorp --new-window "https://www.google.com/search?q=$*"; rm -rf nohup.out;}; _search'
alias f="fastfetch"
alias tt="ttyper"
alias opr="open-curr-repo"
alias tree="cbonsai -il -M 10 -L 55 -c o -t .04"
alias y="yazi"
alias ws="wallpaper-switcher"
alias notes='cd ~/notes && nvim $(date +"notes-%Y-%m-%d-%s").md'
alias update="sudo pacman -Syu; yay -Syu"
alias cleanup="sudo pacman -Scc; yay -Scc"
alias books="books; exit"

# ----------------------- ENV VARS ----------------------

export PATH="$HOME/.venv/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# pnpm
export PNPM_HOME="/home/apollo/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH=$PATH:/home/apollo/.spicetify
