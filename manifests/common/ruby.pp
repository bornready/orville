import 'rvm'

include rvm::system

$rvm_dependencies = ["bash", "curl", "libxslt"]
$ruby_dependencies = ["gcc-c++", "patch", "readline", "readline-devel", "zlib", "zlib-devel", "libyaml-devel", "libffi-devel", "openssl-devel", "make", "bzip2", "iconv-devel"]

rvm::system_user {user: 
	require => [User["user"],Package["$rvm_dependencies"]];
}

package { $rvm_dependencies: 
	ensure => installed
}

package { $ruby_dependencies: 
	ensure => installed
}

if $rvm_installed == "true" {
	rvm_system_ruby {'jruby':
		ensure => present,
		default_use => true,
		require => Exec['sun-jdk-bin'],
	}

	rvm_system_ruby {'ruby-1.9.2-p290':
		ensure => present,
		default_use => false,
		require => Package["$ruby_dependencies"]
	}

	rvm_gem {'ruby-1.9.2-p290/bundler':
		ensure => latest,
		require => Rvm_system_ruby['ruby-1.9.2-p290'],
	}

	rvm_gem {'jruby/bundler':
		ensure => latest,
		require => Rvm_system_ruby['jruby'],
	}
}

