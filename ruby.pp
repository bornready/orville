import "rvm"

include rvm::system

rvm::system_user {user: 
	require => User["user"];
}

if $rvm_installed == "true" {
	rvm_system_ruby {'jruby':
		ensure => present,
		default_use => true,
		require => Exec['sun-jdk-bin'];
	}

	rvm_system_ruby {'ruby-1.9.2-p390':
		ensure => present,
		default_use => false;
	}

	rvm_gem {'jruby@global/bundler':
		ensure => latest,
		require => Rvm_system_ruby['ruby-1.9.2-p390'];
	}

	rvm_gem {'ruby@global/bundler':
		ensure => latest,
		require => Rvm_system_ruby['jruby'];
	}
}

