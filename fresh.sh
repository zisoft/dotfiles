#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Set default MySQL root password and auth type.
#mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/Documents/dotfiles/.zshrc $HOME/.zshrc

# Copy httpd.conf
mv /usr/local/etc/httpd/httpd.conf /usr/local/etc/httpd/httpd.conf.org
cp $HOME/Documents/dotfiles/httpd.conf /usr/local/etc/httpd


# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
