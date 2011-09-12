package{"tomcat":
	ensure =>installed,
}

service {"tomcat":
	ensure => running,
	require => Package["tomcat"],
}

package{"httpd":
	ensure =>installed,
}

service {"httpd":
	require => Package["httpd"],
	ensure => running,
}
