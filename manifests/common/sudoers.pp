
file {"/etc/sudoers":
    owner => root,
    group => root,
    mode => 440,
    source => "puppet:///modules/eservice/sudoers"
}
