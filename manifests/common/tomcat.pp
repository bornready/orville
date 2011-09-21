user {"tomcat":
	ensure => present,
	home => "/home/tomcat",
	shell => '/bin/bash',
}

file {"/home/tomcat":
	ensure => directory,
	owner => tomcat,
	require => User['tomcat'],
}

fetch {"tomcat":
	source => "http://archive.apache.org/dist/tomcat/tomcat-6/v6.0.29/bin/apache-tomcat-6.0.29.tar.gz",
	destination => "/tmp/apache-tomcat-6.0.29.tar.gz",
	require => File["/apps"],
}

exec {"tomcat":
	path => "/usr/bin:/usr/sbin:/bin",
	cwd => '/apps',
	command => "tar xzf /tmp/apache-tomcat-6.0.29.tar.gz && chown tomcat:tomcat -R apache-tomcat-6.0.29",
	require => Fetch['tomcat'],
	creates => "/apps/apache-tomcat-6.0.29",
}
