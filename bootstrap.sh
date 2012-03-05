#!/bin/bash

function disable_selinux_security(){
    sudo gedit /etc/selinux/config
}

function add_user_to_sudoers(){

}

function install_ruby_dependencies(){
    sudo yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel}
}

function install_rvm(){
  sudo yum install curl
  sudo yum install git
  bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
  source ~/.bash_profile
  install_ruby_dependencies
  source ~/.bash_profile
  rvm install 1.9.2
  rvm use 1.9.2
  rvm use 1.9.2 --default
  #may need to sort out .bashrc for rvm
}

function install_puppet(){
    sudo yum install augeas
    sudo yum install augeas-devel
    gem install ruby-augeas
    gem install puppet
}

function get_orville(){
    git clone http://github.com/bornready/orville
}

function run_orville(){   
    rvmsudo puppet apply ~/orvillecommon.pp --verbose
}

function get_eservice(){
    mkdir ~/dev
    cd dev
    svn co http://nmsvn:1080/repositories/sky-com/trunk/sstp/eservice --username doncieub
}



#disable_selinux_security
#install_ruby_dependencies
#install_rvm
#install_puppet
#get_orville
#run_orville
#get_eservice

