#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# Start brew services
brew services start mysql

# Current php@7.4
brew unlink php@8.0 php@8.1
brew link --force --overwrite php@7.4

# Non brew dependencies
$DOTFILES/non-brew-install.sh

# Set default MySQL root password and auth type.
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
# printf "\n" accepts default for each prompt
# if installation fails on pcre2.h then use
# ln -s /opt/homebrew/Cellar/pcre2/10.39/include/pcre2.h /opt/homebrew/Cellar/php@7.4/7.4.26_1/include/php/ext/pcre/pcre2.h
printf "\n" | pecl install imagick redis

# Install global Composer packages
/opt/homebrew/bin/composer global require laravel/installer laravel/valet laravel/vapor-cli

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Symlink the global gitignore
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos

# Restore apps backed up with backup-apps.sh
$DOTFILES/restore-apps.sh
