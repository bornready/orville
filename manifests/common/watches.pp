import 'augeas.pp'
include augeas


  augeas{ "set max watches" : 
    context => "/files/etc/sysctl.conf",
    changes => [ 
	"set fs.inotify.max_user_watches 524288"
    ],
} 

