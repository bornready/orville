class intellij{
	define wget($source,$destination) {
		package { "wget": ensure => latest }	
		exec {"wget-$name":
			command =>  "/usr/bin/wget --output-document=$destination $source",
			creates => "$destination",
		}
	}

	
	$intellij_url = "http://download.jetbrains.com/idea/ideaIU-10.5.2.tar.gz"
	$intellij_install_file = "/usr/tmp/idea.tar.gz"

	wget{"intellij-install":
		source => $intellij_url,
		destination => $intellij_install_file,
	}

	file{
	
	}

	exec {"unpack-intellij":
		cwd =>"/opt/sun",	
		command=>"/opt/sun/sun-jdk-6.bin",
		creates=>"/opt/sun/jdk1.6.0_27",
	}	
}

include intellij
