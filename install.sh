#!/usr/bin/env bash

sudo -v

install_headline () {
	echo "$(tput setaf 7)$(tput setab 6)Install $1$(tput sgr 0)"
	echo "$(tput setaf 7)$(tput setab 6)------------$(tput sgr 0)"
}

brew_install () {
	install_headline "$1"
	(brew list "$1" &> /dev/null && echo "already installed") || brew install "$1"
}

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

brew_install "coreutils"
brew_install "wget"
brew_install "gnupg"
brew_install "gnupg2"
brew_install "ffmpeg"
brew_install "imagemagick"
brew_install "starship"
brew_install "yarn"

install_headline "keepass"
brew cask install keepassxc

install_headline "Fira Code"
[ ! -f ~/Library/Fonts/FiraCode-Bold.ttf ] && curl -o '~/Library/Fonts/FiraCode-Bold.ttf' 'https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Bold.ttf'
[ ! -f ~/Library/Fonts/FiraCode-Light.ttf ] && curl -o '~/Library/Fonts/FiraCode-Light.ttf' 'https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Light.ttf'
[ ! -f ~/Library/Fonts/FiraCode-Medium.ttf ] && curl -o '~/Library/Fonts/FiraCode-Medium.ttf' 'https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Medium.ttf'
[ ! -f ~/Library/Fonts/FiraCode-Regular.ttf ] && curl -o '~/Library/Fonts/FiraCode-Regular.ttf' 'https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Regular.ttf'
[ ! -f ~/Library/Fonts/FiraCode-Retina.ttf ] && curl -o '~/Library/Fonts/FiraCode-Retina.ttf' 'https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Retina.ttf'
# https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip

install_headline "php"
brew install php@7.4
brew link php@7.4
brew install pkg-config
pecl install xdebug
pecl install imagick

install_headline "composer"
if [ ! -f /usr/local/bin/composer ]; then
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php composer-setup.php
	php -r "unlink('composer-setup.php');"
	mv composer.phar /usr/local/bin/composer
fi
composer self-update
composer global require symfony/thanks
composer global require ergebnis/composer-normalize

install_headline "git"
[ ! -f ~/.global.gitignore ] && ln -s ~/.dotfiles/stubs/.global.gitignore ~/.global.gitignore
git config --global core.autocrlf input
git config --global core.excludesfile ~/.global.gitignore
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
