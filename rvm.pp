package{["bash", "curl", "git", "libxslt", "gcc-c++", "patch", "readline", "readline-devel", "zlib", "zlib-devel", "libyaml-devel", "libffi-devel", "openssl-devel", "make", "bzip2", "iconv-devel"]:
	ensure =>installed,
}

exec { 'rvm':
	path => '/usr/bin:/usr/sbin:/bin',
	command => "bash -c '/usr/bin/curl -s https://rvm.beginrescueend.com/install/rvm -o rvm-installer ; chmod +x rvm-installer ; rvm_bin_path=/usr/local/rvm/bin rvm_man_path=/usr/local/rvm/man ./rvm-installer'",
	creates => '/usr/local/rvm/bin/rvm',
  }

