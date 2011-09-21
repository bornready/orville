file {"/etc/profile.d/eservice.sh":
	ensure => "present",
	owner => "root",
	group => "root",
	mode => 644,
	content => "export BUILD_NUMBER=LOCAL",
}

