class test-nginx::install {

package { "nginx":
    ensure => installed
}

service { "nginx":
    require => Package["nginx"],
    ensure => running,
    enable => true
}

}
