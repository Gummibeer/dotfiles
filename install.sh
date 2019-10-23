#!/usr/bin/env bash

sudo -v

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

echo 'Install wget'
echo '------------'
brew install wget

echo 'Install ffmpeg'
echo '------------'
brew install ffmpeg

echo 'Install keepass'
echo '------------'
brew cask install keepassxc

echo 'Install yarn'
echo '------------'
brew install yarn


echo "Install php"
echo '----------------'
brew install php@7.1
brew install php@7.2
brew install php@7.3
brew link php@7.3
pecl install xdebug

echo 'Install composer'
echo '----------------'
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
composer self-update

echo "Install git"
echo '----------------'
ln -s $HOME/dotfiles/stubs/.global.gitignore $HOME/.global.gitignore
git config --global core.autocrlf true
git config --global core.excludesfile $HOME/.global.gitignore
git config --global commit.gpgsign true
git config --global user.name "Tom Witkowski"
git config --global user.email "dev.gummibeer@gmail.com"
if [[ "$OSTYPE" == "darwin"* ]]; then
    git config --global credential.helper osxkeychain
fi
echo "sign commits: https://help.github.com/en/github/authenticating-to-github/associating-an-email-with-your-gpg-key"

# add bash configuration
ln -s $HOME/dotfiles/stubs/.bash_profile $HOME/.bash_profile
ln -s $HOME/dotfiles/stubs/.bashrc $HOME/.bashrc
