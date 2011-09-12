#!/bin/bash

sudo apt-get install git -y
sudo apt-get install curl -y
bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile
source .bash_profile

# zlib required for puppet, amongst other gems
sudo apt-get install zlib1g-dev
rvm pkg install openssl
rvm install 1.9.2 -C --with-zlib-dir=$rvm_path/usr --with-openssl-dir=$rvm_path/usr
rvm use 1.9.2 --default
rvm gem install puppet
