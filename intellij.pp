class intellij{
	
	$idea_version = "ideaIU-10.5.2"
	$intellij_url = "http://download.jetbrains.com/idea/$idea_version.tar.gz"
	$intellij_install_file = "/usr/tmp/idea.tar.gz"

	wget::fetch{"intellij_install":
		source => $intellij_url,
		destination => $intellij_install_file,
	}


	file{"/home/user/Applications":
		ensure => directory,
		owner => "user",
		group => "user"
	}

	exec {"unpack_intellij":
		require => Wget::Fetch["intellij_install"],		
		cwd =>"/home/user/Applications",	
		command=>"/bin/tar -xvf $intellij_install_file;ln -s idea* idea;chown -R user:user idea*",
		creates=>"/home/user/Applications/$idea_version",
	}


	file {"/etc/profile.d/intellij.sh":
		ensure => present,
		owner => "user",
		group => "user",
		mode => 644,
		content => "PATH=\$PATH:~/Applications/idea/bin",
        }

	
	
}
