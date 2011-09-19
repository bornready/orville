package{["bash", "curl", "git", "libxslt", "gcc-c++", "patch", "readline", "readline-devel", "zlib", "zlib-devel", "libyaml-devel", "libffi-devel", "openssl-devel", "make", "bzip2", "iconv-devel"]:
	ensure =>installed,
}

exec { "rvm":
    command => "/usr/bin/sudo -u user /bin/bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)",
    creates => "/home/user/.rvm/bin/rvm"
}

