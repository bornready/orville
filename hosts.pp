augeas { "localhost":
	context => "/files/etc/hosts",
	changes => [
		"set *[ipaddr = '127.0.0.1']/canonical localhost",
		"set *[ipaddr = '127.0.0.1']/alias[1] sstp.localhost.bskyb.com",
		"set *[ipaddr = '127.0.0.1']/alias[2] sstp.localhost.sky.com",
	],
}
