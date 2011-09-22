file { "/etc/profile.d/eservice.sh":
	ensure => present,
	owner => root,
	group => root,
	mode => 644,
	content => "export BUILD_NUMBER=LOCAL",
}

file { "/etc/httpd/conf.d/eservice.conf":
	ensure => symlink,
	owner => apache,
	target => "/apps/apache-conf.d/apache-eservice.conf",
	require => Package['httpd'],
}

augeas { "localhost":
	context => "/files/etc/hosts",
	changes => [
		"set *[ipaddr = '127.0.0.1']/canonical localhost",
		"set *[ipaddr = '127.0.0.1']/alias[1] sstp.localhost.bskyb.com",
		"set *[ipaddr = '127.0.0.1']/alias[2] sstp.localhost.sky.com",
	],
}

