import "rvm"

include rvm::system

rvm::system_user {user: 
	require => User["user"];
}

$ruby_dependencies = ["zlib1g-dev", "libssl-dev", "libreadline5-dev", "libxml2-dev", "libsqlite3-dev"]

package { $ruby_dependencies: 
	ensure => installed
}

if $rvm_installed == "true" {
	rvm_system_ruby {'jruby':
		ensure => present,
		default_use => true,
		require => Exec['sun-jdk-bin'];
	}

	rvm_system_ruby {'ruby-1.9.2-p290':
		ensure => present,
		default_use => false,
		require => Package[$ruby_dependencies];
	}

	rvm_gem {'ruby-1.9.2-p290/bundler':
		ensure => latest,
		require => Rvm_system_ruby['ruby-1.9.2-p290'];
	}

	rvm_gem {'jruby/bundler':
		ensure => latest,
		require => Rvm_system_ruby['jruby'];
	}
}

