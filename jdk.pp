
import 'augeas.pp'
class jdk{

	include augeas

	$base_path="/usr/java"
	$jdk_path="$base_path/jdk1.6.0_27"
	$sun_jdk_bin="$base_path/sun-jdk-6.bin"

	file{"$base_path":
		ensure => directory,
	}	

	fetch{"sun-jdk-bin":
		require=>File["$base_path"],		
		source => "http://download.oracle.com/otn-pub/java/jdk/6u27-b07/jdk-6u27-linux-x64.bin",
		destination => $sun_jdk_bin,
	}

	file{"$sun_jdk_bin":
		require=>Fetch["sun-jdk-bin"],
		mode => 755,
	}

	exec {"sun-jdk-bin":
		require => File["$sun_jdk_bin"],
		cwd => "$base_path",	
		command => "$base_path/sun-jdk-6.bin",
		creates => "$jdk_path",
	}


	file {"/etc/profile.d/java.sh":
		ensure => "present",
		owner => "root",
		group => "root",
		mode => 644,
		content => "export JAVA_HOME=/usr/java/default;PATH=\$PATH:\$JAVA_HOME/bin",
        }

	file { "/usr/java/default":
		ensure => symlink,
		target => "$jdk_path"
	}

	file { "/usr/bin/java":
		ensure => symlink,
		target => "/usr/java/default/bin/java"
	}

}












