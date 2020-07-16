#!/usr/bin/env bash

sudo -v

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

# Change default screenshot directory
mkdir -p $HOME/Pictures/Screenshot
defaults write com.apple.screencapture location $HOME/Pictures/Screenshot

# install brew apps
brew bundle

# install php extensions
pecl install xdebug
pecl install imagick
pecl install gnupg

# install default composer packages
composer self-update
composer global require symfony/thanks
composer global require ergebnis/composer-normalize
composer global require bamarni/composer-bin-plugin

# configure git
[ ! -f ~/.global.gitignore ] && ln -s ~/.dotfiles/stubs/.global.gitignore ~/.global.gitignore
git config --global core.autocrlf input
git config --global core.excludesfile ~/.global.gitignore
git config --global pull.rebase false
git config --global pull.ff only
git config --global push.default current
git config --global commit.gpgsign true
git config --global user.name "Tom Witkowski"
git config --global user.email "dev.gummibeer@gmail.com"
git config --global credential.helper osxkeychain
echo "sign commits: https://help.github.com/en/github/authenticating-to-github/associating-an-email-with-your-gpg-key"

# add bash configuration
[ ! -f ~/.bash_profile ] && ln -s ~/.dotfiles/stubs/.bash_profile ~/.bash_profile
source ~/.bash_profile
[ ! -f ~/.bashrc ] && ln -s ~/.dotfiles/stubs/.bashrc ~/.bashrc
source ~/.bashrc
