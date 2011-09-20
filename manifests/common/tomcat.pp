package{"tomcat":
	ensure =>installed,
}

service {"tomcat":
	ensure => running,
	require => Package["tomcat"],
}

