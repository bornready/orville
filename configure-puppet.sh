#!/usr/bin/env bash

if [ "$(whoami)" != 'root' ]; then echo you need to run this script with sudo \(sudo $0\); else
	if [ ! -d /etc/puppet/modules/rvm ]
		then
			git clone git://github.com/blt04/puppet-rvm.git /etc/puppet/modules/rvm
	fi
	cp -v templates/etc/puppet/puppet.conf /etc/puppet/
	cp -vR modules/* /etc/puppet/modules
fi
