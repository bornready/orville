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

file {"/apps/java":
	ensure => directory,
	require => File['/apps'],
}

file {"/apps/java/jdk-1.6":
	ensure => symlink,
	require => File['/apps/java'],
	target => "/usr/java/default",
}

file {"/apps/ocp-logs":
	ensure => directory,
	owner => apache,
	require => File['/apps'],
}

file {"/apps/ocp-logs/apache":
	ensure => directory,
	owner => apache,
	require => File['/apps/ocp-logs'],
}

