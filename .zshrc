# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/usr/local/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/usr/local/bin/brew shellenv)"
fi

# homebrew ruby
if [ -d "/usr/local/opt/ruby/bin" ]; then
  export PATH=/usr/local/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load completions
autoload -Uz compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
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

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Language settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Secret things
source $HOME/.secrets

# Aliases
alias ls='ls --color'
alias ll='ls -lh'
alias la='ls -alh'

alias ..='cd ..'

alias brewup='brew update; brew upgrade; brew upgrade --cask; brew cleanup; brew doctor'

alias sync_pics_zisoft='rsync -r -t -v --delete --delete-excluded --exclude-from='/Users/mario/.rsync_excludes' ~/workspace/october2/storage/app/media/ -e ssh zisoft.de:/www/htdocs/w0107c10/october2/storage/app/media/'

alias sync_pics='rsync -av --delete --delete-excluded --exclude-from='/Users/mario/.rsync_excludes' ~/Pictures/ /Volumes/Marios/Pictures'
alias sync_pics_synnas='rsync -av --delete --delete-excluded --exclude-from='/Users/mario/.rsync_excludes' ~/Pictures/ -e "ssh -p 222" mario@zisoft-synnas:~/Pictures'
alias sync_pics_synnas_philip='rsync -av --delete --delete-excluded --exclude-from='/Users/mario/.rsync_excludes' ~/Pictures/ -e "ssh -p 222" mario@philip.zisoft.de:~/Pictures'

# alias sync_music='rsync -av --delete --delete-excluded --exclude-from='/Users/mario/.rsync_excludes' ~/Music/ /Volumes/Marios/Music'
# alias sync_music_synnas='rsync -av --delete --delete-excluded --exclude-from='/Users/mario/.rsync_excludes' ~/Music/ -e "ssh -p 222" mario@zisoft-synnas:~//Music'
# alias sync_music_synnas_philip='rsync -av --delete --delete-excluded --exclude-from='/Users/mario/.rsync_excludes' ~/Music/ -e "ssh -p 222" mario@philip.zisoft.de:~/Music'

alias webstart='brew services start mysql && brew services start httpd'
alias webstop='brew services stop httpd; brew services stop mysql'
