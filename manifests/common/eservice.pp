file {"/etc/profile.d/eservice.sh":
	ensure => present,
	owner => root,
	group => root,
	mode => 644,
	content => "export BUILD_NUMBER=LOCAL",
}

file {"/apps":
	ensure => directory,
}

file {"/apps/apache-conf.d":
	ensure => directory,
	owner => apache,
	group => apache,
	require => File['/apps'],
}

file {"/apps/apache-content":
	ensure => directory,
	owner => apache,
	group => apache,
	require => File['/apps'],
}

file {"/apps/apache-content/default":
	ensure => directory,
	owner => apache,
	group => apache,
	require => File['/apps/apache-content'],
}

file {"/apps/sstp":
	ensure => directory,
	owner => tomcat,
	group => tomcat,
	mode => 777,
	require => File['/apps'],
}

exec {"change tomcat shell to bash":
	path => "/usr/bin:/usr/sbin:/bin",
	command => "/usr/bin/chsh -s /bin/bash tomcat",
	unless => 'cat /etc/passwd | grep tomcat | grep bash',
}	

exec {"update apache conf to include /apps/apache-conf.d/*.conf":
	path => "/usr/bin:/usr/sbin:/bin",
	command => 'printf "\nInclude /apps/apache-conf.d/*.conf" >> /etc/httpd/conf/httpd.conf',
	unless => 'grep "/apps" /etc/httpd/conf/httpd.conf',
}
