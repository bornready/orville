import 'augeas.pp'
class intellij{
	
include augeas

define intellij_wget($source,$destination) {	
		exec {"wget-$name":
			command =>  "/usr/bin/wget --output-document=$destination $source",
			creates => "$destination",
		}
	}

	$intellij_url = "http://download.jetbrains.com/idea/ideaIU-10.5.2.tar.gz"
	$intellij_install_file = "/usr/tmp/idea.tar.gz"

	intellij_wget{"intellij_install":
		source => $intellij_url,
		destination => $intellij_install_file,
	}

	exec {"unpack_intellij":
		require => Intellij_Wget["intellij_install"],		
		cwd =>"/opt",	
		command=>"/bin/tar -xvf $intellij_install_file;mv idea* idea",
		creates=>"/opt/idea/bin/",
	}

	

	augeas{"idea_home":
		require => Package["augeas"],
		context => "/files/etc/environment/",
		changes => ["set IDEA_HOME /opt/idea", "set PATH[last()+1] \$PATH:\$IDEA_HOME/bin"],
	}	
}
