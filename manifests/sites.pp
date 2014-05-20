class test-nginx::sites {

file { "/etc/nginx/sites-enabled/default":
    require => Package["nginx"],
    ensure  => absent,
    notify  => Service["nginx"]
}

file { "/etc/nginx/sites-available/test-nginx":
    require => [ Package["nginx"], File["/var/www"]]
    ensure => "file",
    content =>
        "server {
            listen 80 default_server;
            server_name _;
            location / { root /var/www; }
        }",
    notify => Service["nginx"]
}
file { "/etc/nginx/sites-enabled/test-nginx":
    require => File["/etc/nginx/sites-available/test-nginx"],
    ensure => "link",
    target => "/etc/nginx/sites-available/test-nginx",
    notify => Service["nginx"]
}


}
