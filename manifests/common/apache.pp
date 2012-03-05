package{"httpd":
	ensure =>installed,
}
user{"apache":
	ensure=>present,
}
	


