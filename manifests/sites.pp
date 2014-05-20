class test-nginx::sites {

file { "/etc/nginx/sites-enabled/default":
    require => Package["nginx"],
    ensure  => absent,
    notify  => Service["nginx"]
}

file { "/etc/nginx/sites-available/test-nginx":
    source => "puppet:///modules/test-nginx/test-nginx-sites",
    require => File["/etc/nginx/sites-enabled/default"],
    ensure => "file",
    notify => Service["nginx"]
}
file { "/etc/nginx/sites-enabled/test-nginx":
    require => File["/etc/nginx/sites-available/test-nginx"],
    ensure => "link",
    target => "/etc/nginx/sites-available/test-nginx",
    notify => Service["nginx"]
}


}
