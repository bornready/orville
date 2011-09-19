package { "wget": ensure => latest }

define fetch($source,$destination) {
	exec { "wget-$name":
		command => "/usr/bin/wget --output-document=$destination $source",
		creates => "$destination",
		require => Package['wget']
	}
}
