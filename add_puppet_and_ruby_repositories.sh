#!
cp -r yum.repos.d/ /etc/
yum --enablerepo="ruby" install ruby
yum --enablerepo="epel,epel-puppet" install puppet
