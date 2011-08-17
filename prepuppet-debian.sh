#!/bin/bash
sudo apt-get install git -y
sudo apt-get install curl -y
bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile
source .bash_profile
rvm install 1.9.2
rvm use 1.9.2
rvm gem install puppet
