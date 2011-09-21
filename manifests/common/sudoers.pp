
file {"/etc/sudoers":
    owner => root,
    group => root,
    mode => 440,
    source => "puppet:///modules/orville/sudoers"
}
