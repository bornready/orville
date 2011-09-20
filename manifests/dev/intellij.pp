class intellij{
	
	$idea_version = "ideaIU-10.5.2"
	$idea_build_number = "idea-IU-107.587"
	$intellij_url = "http://download.jetbrains.com/idea/$idea_version.tar.gz"
	$intellij_install_file = "/usr/tmp/idea.tar.gz"

	fetch{"intellij_install":
		source => $intellij_url,
		destination => $intellij_install_file,
	}


	file{"/home/user/Applications":
		ensure => directory,
		owner => "user",
		group => "user"
	}

	exec {"unpack_intellij":
		require => Fetch["intellij_install"],		
		cwd =>"/home/user/Applications",	
		command=>"/bin/tar -xvf $intellij_install_file;ln -s $idea_build_number idea;chown -R user:user idea $idea_build_number",
		creates=>"/home/user/Applications/$idea_build_number/",
	}


	file {"/etc/profile.d/intellij.sh":
		ensure => present,
		owner => "user",
		group => "user",
		mode => 644,
		content => "PATH=\$PATH:~/Applications/idea/bin",
        }

	
	
}
