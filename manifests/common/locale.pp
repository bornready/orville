augeas { "locale":
	context => "/files/etc/sysconfig/i18n",
	changes => [
		"set LANG en_GB.UTF-8",
	],
}


