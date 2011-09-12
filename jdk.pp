class jdk{
	define wget($source,$destination) {
		package { "wget": ensure => latest }	
		exec {"wget-$name":
			command =>  "/usr/bin/wget --output-document=$destination $source",
			creates => "$destination",
		}
	}

	$sun_jdk_bin="/opt/sun/sun-jdk-6.bin"

	wget{"sun-jdk-bin":
		source => "http://download.oracle.com/otn-pub/java/jdk/6u27-b07/jdk-6u27-linux-x64.bin",
		destination => $sun_jdk_bin,
	}

	file{"$sun_jdk_bin":
		mode => 755,

	}

	exec {"sun-jdk-bin":
		require=>File["$sun_jdk_bin"],
		cwd =>"/opt/sun",	
		command=>"/opt/sun/sun-jdk-6.bin",
		creates=>"/opt/sun/jdk1.6.0_27",
	}

	package {'augeas':
		ensure => installed,
	}

	augeas{"java_home":
		changes=> [
		"set JAVA_HOME /opt/sun/jdk1.6.0_27"
		]
	} 
}

include jdk










