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

package {"subversion":
	ensure => installed,
	}

package {"git":
	ensure => installed,
	}

package {"maven":
	ensure => installed,
	}

package {"curl":
	ensure => installed,
	}


user { "user":
                    home    => "/home/user",
            }


import "rvm"

include rvm::system

rvm_system_ruby {
    'jruby':
      ensure => 'present',
      default_use => true;	
  }

rvm::system_user {user: 
	require => User["user"]
;}

rvm_gem {
    'jruby@global/bundler':
  }

augeas{"BUILD_NUMBER":
		changes=> [
		"set BUILD_NUMBER LOCAL"
		]
	}



