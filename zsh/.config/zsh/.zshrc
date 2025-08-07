# zmodload zsh/zprof

DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache/$HOST

# cache completions aggressively
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

autoload -Uz add-zsh-hook
add-zsh-hook precmd _lazy_compinit
_lazy_compinit() {
  if [[ -z $_lazy_compinit_done ]]; then
    compinit -Ci -d $ZCOMP
    _lazy_compinit_done=1
  fi
}

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"

#plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fast-syntax-highlighting
    zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR="nvim"
export MOZ_ENABLE_WAYLAND=1
export PATH=$PATH:/home/plainslife/.local/bin

alias ls="exa"
alias la="exa -la --icons"
alias ff="fastfetch"

# load nvm at startup
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

# lazy lode nvm instead of through oh-my-zsh to reduce load by 50%
lazy-nvm()
{
  unset -f nvm node npm npx
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

nvm()
{
  lazy-nvm
  nvm $@
}

node()
{
  lazy-nvm
  node $@
}

npm()
{
  lazy-nvm
  npm $@
}

npx()
{
  lazy-nvm
  npx $@
}

# laravel 
export PATH="/home/plainslife/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/plainslife/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# ohmyposh prompt
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/custom.toml)"

# zprof

