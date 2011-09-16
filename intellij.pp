
import 'augeas.pp'
class intellij{
	
include augeas

	$intellij_url = "http://download.jetbrains.com/idea/ideaIU-10.5.2.tar.gz"
	$intellij_install_file = "/usr/tmp/idea.tar.gz"

	wget::fetch{"intellij_install":
		source => $intellij_url,
		destination => $intellij_install_file,
	}


	exec {"unpack_intellij":
		require => Wget::Fetch["intellij_install"],		
		cwd =>"/opt",	
		command=>"/bin/tar -xvf $intellij_install_file;mv idea* idea",
		creates=>"/opt/idea/bin/",
	}


	file {"/etc/profile.d/intellij.sh":
		ensure => "present",
		owner => "root",
		group => "root",
		mode => 644,
		content => "IDEA_HOME=/opt/idea;IDEA_JDK=/usr/java/default;PATH=\$PATH:\$IDEA_HOME/bin",
        }

	
	
}
