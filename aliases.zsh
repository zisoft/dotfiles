# Aliases
alias la='ls -alh'

alias web='cd ~/Sites/october/themes/zisoft'
alias ios='cd ~/Software/iOS'

alias web_start='brew services run httpd && brew services run mysql'
alias web_stop='brew services stop httpd && brew services stop mysql'

alias mysql_start='brew services run mysql'
alias mysql_stop='brew services stop mysql'

alias brewup='brew update; brew upgrade; brew upgrade --cask; brew cleanup; brew doctor'

alias sync_pics='rsync -av --delete ~/Pictures/ /Volumes/Marios/Pictures'
alias sync_pics_synnas='rsync -av --delete --delete-excluded --exclude-from ~/.oh-my-zsh/custom/rsync_excludes ~/Pictures/ -e ssh mario@synnas:/volume1/Mario/Pictures'
alias sync_pics_zisoft='rsync -r -t -v --delete --delete-excluded --exclude-from ~/.oh-my-zsh/custom/rsync_excludes ~/Sites/october/storage/app/media/ -e ssh zisoft.de:/www/htdocs/w0107c10/october/storage/app/media/'

alias sync_music='rsync -av --delete --delete-excluded --exclude-from ~/.oh-my-zsh/custom/rsync_excludes ~/Music/ /Volumes/Marios/Music'
alias sync_music_synnas='rsync -av --delete --delete-excluded --exclude-from ~/.oh-my-zsh/custom/rsync_excludes ~/Music/ -e ssh mario@synnas:/volume1/Mario/Music'
