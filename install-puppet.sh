#!/usr/bin/env bash

cp templates/etc/yum.repos.d/puppet.repo /etc/yum.repos.d/
yum -y --enablerepo=puppetlabs install puppet

