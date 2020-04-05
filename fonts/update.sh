#!/usr/bin/env bash

echo "tap 'homebrew/cask-fonts'" > Brewfile 
brew search --casks "font-" | grep font- | while read line; do echo "cask '$line'" >> Brewfile; done
brew bundle
