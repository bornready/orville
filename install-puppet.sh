#!/usr/bin/env bash

if [ "$(whoami)" != 'root' ]; then echo you need to run this script with sudo \(sudo $0\); else
	cp templates/etc/yum.repos.d/puppet.repo /etc/yum.repos.d/
	yum -y --enablerepo=puppetlabs install puppet
fi

