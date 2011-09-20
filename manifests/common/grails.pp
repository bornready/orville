import "wget"

package {"groovy":
	ensure => installed,
}

file {"/etc/profile.d/grails.sh":
	ensure => "present",
	owner => "root",
	group => "root",
	mode => 644,
	content => "export GRAILS_HOME=/usr/grails/default;PATH=\$PATH:\$GRAILS_HOME/bin",
}

$grails_install_path = "/usr/grails"
$grails_version = "grails-1.3.7"
$grails_download = "/tmp/$grails_version.zip"

file{"$grails_install_path":
	ensure => directory,
}	

fetch{"grails":		
	source => "http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/$grails_version.zip",
	destination => $grails_download,
}

exec {"unpack_grails":
	require => [Fetch["grails"],File["$grails_install_path"]],		
	cwd =>"$grails_install_path",	
	command=>"/usr/bin/unzip $grails_download; ln -s $grails_version default",
	creates=>"$grails_install_path/$grails_version/",
}

file {"/etc/profile.d/groovy.sh":
	ensure => "present",
	owner => "root",
	group => "root",
	mode => 644,
	content => "export GROOVY_HOME=$grails_install_path/default;PATH=\$PATH:\$GROOVY_HOME/bin",
}

fetch {"groovy":		
	source => "http://dist.groovy.codehaus.org/distributions/groovy-binary-1.8.2.zip",
	destination => "/tmp/groovy.zip",
}



