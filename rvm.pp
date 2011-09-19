package{["bash", "curl", "git", "libxslt", "gcc-c++", "patch", "readline", "readline-devel", "zlib", "zlib-devel", "libyaml-devel", "libffi-devel", "openssl-devel", "make", "bzip2", "iconv-devel"]:
	ensure =>installed,
}

# $rvm = "bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)"
$rvm = "/home/user/orville/rvm-installer"

exec { "rvm":
	path => "/usr/bin:/usr/sbin:/bin",
	command => "$rvm >/tmp/rvm.log 2>&1",
	creates => "/home/user/.rvm/bin/rvm",
	group => user,
	user => user,
}

