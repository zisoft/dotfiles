# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

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
setopt rmstarsilent

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:cd:*' fzf-preview 'ls --color $realpath'

# shell integrations
eval "$(/usr/local/bin/brew shellenv)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# oh-my-posh prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/mario.toml)"

# FZF
export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
--color=selected-bg:#51576d \
--color=border:#414559,label:#c6d0f5"

# homebrew ruby
if [ -d "/usr/local/opt/ruby/bin" ]; then
  export PATH=/usr/local/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# tmuxifier
export PATH=$PATH/:$HOME/.tmux/plugins/tmuxifier/bin
eval "$(tmuxifier init -)"

# pipx installations
export PATH=$PATH:$HOME/.local/bin

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Language settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Secret things
source $HOME/.secrets

export EDITOR=nvim

# Aliases
alias ls='ls --color'
alias ll='ls -lh'
alias la='ls -alh'

alias ..='cd ..'

alias vi='nvim'

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
